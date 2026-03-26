# Create Brainnetome Cortical Atlas
#
# Recreates the brainnetome cortical atlas from the BN_Atlas
# annotation on fsaverage5 using ggseg.extra vertex projection pipeline.
#
# Requirements:
#   - FreeSurfer installed with fsaverage5 subject
#   - ggseg.extra (>= 2.0.0.9000)
#   - ggseg.formats
#
# Run with: Rscript data-raw/make_atlas.R

library(ggseg.extra)
library(ggseg.formats)

Sys.setenv(FREESURFER_HOME = "/Applications/freesurfer/7.4.1")

annot_files <- file.path(
  here::here("data-raw", "fsaverage5"),
  c("lh.BN_Atlas.annot", "rh.BN_Atlas.annot")
)

brainnetome <- create_cortical_from_annotation(
  input_annot = annot_files,
  atlas_name = "brainnetome",
  output_dir = "data-raw",
  tolerance = 0,
  skip_existing = TRUE,
  cleanup = FALSE
) |>
  atlas_region_contextual("Unknown", "label")

print(brainnetome)
plot(brainnetome)

.brainnetome <- brainnetome

sysdata_env <- new.env(parent = emptyenv())
sysdata_path <- here::here("R", "sysdata.rda")
if (file.exists(sysdata_path)) load(sysdata_path, envir = sysdata_env)
sysdata_env$.brainnetome <- .brainnetome
save(
  list = ls(sysdata_env, all.names = TRUE),
  envir = sysdata_env,
  file = sysdata_path,
  compress = "xz"
)
