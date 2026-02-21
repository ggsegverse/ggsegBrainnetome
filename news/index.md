# Changelog

## ggsegBrainnetome 2.0.0

### Breaking changes

- `brainnetome` is now a `ggseg_atlas` object (from ggseg.formats)
  containing 2D polygon geometry.

- Atlas recreated from scratch using
  `ggsegExtra::create_cortical_atlas()` from the BN_Atlas annotation on
  fsaverage5.

- Use `ggplot() + ggseg::geom_brain(atlas = brainnetome)` for 2D plots.

- `ggseg.formats` is now a hard dependency (in Depends).

- Package URLs updated from `LCBC-UiO` to `ggseg` GitHub organisation.
