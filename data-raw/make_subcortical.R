# Create Brainnetome Subcortical Atlas
#
# Adds the subcortical portion of the Brainnetome atlas to ggsegBrainnetome.
# This complements the existing cortical parcellation with subcortical
# structures from the volumetric Brainnetome atlas.
#
# The Brainnetome atlas includes 36 subcortical subregions covering:
# amygdala, hippocampus, thalamus, caudate, putamen, pallidum, and
# nucleus accumbens.
#
# Source: http://atlas.brainnetome.org/download.html
# Download the volumetric atlas: BN_Atlas_246_1mm.nii.gz
#
# Reference: Fan L, et al. (2016). "The Human Brainnetome Atlas: A New
#   Brain Atlas Based on Connectional Architecture." Cerebral Cortex,
#   26(8):3508-3526. DOI: 10.1093/cercor/bhw157
#
# Requirements:
#   - ggseg.extra package
#   - ggseg.formats package
#
# Run with: Rscript data-raw/make_subcortical.R

library(dplyr)
library(ggseg.extra)
library(ggseg.formats)

options(chromote.timeout = 120)
future::plan(future::sequential)
progressr::handlers("cli")
progressr::handlers(global = TRUE)

# ── Obtain volumetric atlas ──────────────────────────────────────
# Download the Brainnetome volumetric atlas from:
# http://atlas.brainnetome.org/download.html
# File: BN_Atlas_246_1mm.nii.gz (contains both cortical + subcortical)
#
# The subcortical regions are labels 211-246 in the volume.

vol_file <- here::here("data-raw", "BN_Atlas_246_1mm.nii.gz")

if (!file.exists(vol_file)) {
  cli::cli_abort(c(
    "Brainnetome volume not found: {.path {vol_file}}",
    "i" = "Download from: {.url http://atlas.brainnetome.org/download.html}",
    "i" = "Place as: {.path {vol_file}}"
  ))
}

# ── Extract subcortical labels only ──────────────────────────────
# Labels 211-246 are subcortical in the Brainnetome atlas
# We need to zero out cortical labels (1-210) first

cli::cli_h1("Extracting subcortical regions from Brainnetome volume")

sub_vol_file <- here::here("data-raw", "BN_Atlas_subcortical_1mm.nii.gz")

if (!file.exists(sub_vol_file)) {
  vol <- RNifti::readNifti(vol_file)
  vol[vol <= 210] <- 0L
  RNifti::writeNifti(vol, sub_vol_file)
  cli::cli_alert_success(
    "Extracted subcortical labels to {.path {sub_vol_file}}"
  )
}

# ── Create subcortical atlas ─────────────────────────────────────
cli::cli_h1("Creating brainnetome subcortical atlas")

brainnetome_sub <- create_subcortical_from_volume(
  input_volume = sub_vol_file,
  atlas_name = "brainnetome_sub",
  output_dir = here::here("data-raw"),
  skip_existing = TRUE,
  cleanup = FALSE
)

brainnetome_sub <- brainnetome_sub |>
  atlas_region_contextual("unknown|Background", "label")

cli::cli_alert_success("brainnetome_sub: {nrow(brainnetome_sub$core)} regions")
print(brainnetome_sub)

# ── Update palettes (merge with existing cortical palette) ────────
sysdata_path <- here::here("R/sysdata.rda")
if (file.exists(sysdata_path)) {
  dt <- load(sysdata_path)
}

.brainnetome_sub <- brainnetome_sub


usethis::use_data(
  .brainnetome,
  .brainnetome_sub,
  overwrite = TRUE,
  compress = "xz",
  internal = TRUE
)
