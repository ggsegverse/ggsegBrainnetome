# Create Brainnetome Atlas
#
# Recreates the brainnetome cortical atlas from the BN_Atlas
# annotation on fsaverage5 using ggsegExtra.
#
# Requirements:
#   - ggsegExtra package
#   - ggseg.formats package
#
# Run with: Rscript data-raw/make_atlas.R

Sys.setenv(RGL_USE_NULL = TRUE)

library(dplyr)
library(ggsegExtra)
library(ggseg.formats)

options(freesurfer.verbose = FALSE)
future::plan(future::multisession(workers = 4))
progressr::handlers("cli")
progressr::handlers(global = TRUE)

annot_files <- file.path(
  here::here("data-raw", "fsaverage5"),
  c("lh.BN_Atlas.annot", "rh.BN_Atlas.annot")
)

for (f in annot_files) {
  if (!file.exists(f)) {
    cli::cli_abort("Annotation not found: {.path {f}}")
  }
}

cli::cli_h1("Creating brainnetome cortical atlas")

atlas_raw <- create_cortical_atlas(
  input_annot = annot_files,
  atlas_name = "brainnetome",
  output_dir = "data-raw",
  tolerance = 1,
  smoothness = 2,
  skip_existing = FALSE,
  cleanup = FALSE
)

atlas_raw <- atlas_raw |>
  atlas_region_contextual("Unknown", "label")

atlas_raw <- atlas_raw |>
  atlas_view_gather()

brainnetome <- atlas_raw

cli::cli_alert_success("Atlas created with {nrow(brainnetome$core)} regions")
print(brainnetome)

brain_pals <- stats::setNames(
  list(brainnetome$palette),
  brainnetome$atlas
)
save(brain_pals, file = here::here("R/sysdata.rda"), compress = "xz")

usethis::use_data(brainnetome, overwrite = TRUE, compress = "xz")
cli::cli_alert_success("Saved to data/brainnetome.rda")
