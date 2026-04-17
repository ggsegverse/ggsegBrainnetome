# Brainnetome Subcortical Atlas

Brain atlas for the Brainnetome subcortical parcellation with 36
subregions covering amygdala, hippocampus, thalamus, caudate, putamen,
pallidum, and nucleus accumbens.

## Usage

``` r
brainnetome_sub()
```

## Value

A
[ggseg.formats::ggseg_atlas](https://ggsegverse.github.io/ggseg.formats/reference/ggseg_atlas.html)
object (subcortical).

## References

Fan L, Li H, Zhuo J, Zhang Y, Wang J, Chen L, Yang Z, Chu C, Xie S,
Laird AR, Fox PT, Eickhoff SB, Yu C, Jiang T (2016). The Human
Brainnetome Atlas: A New Brain Atlas Based on Connectional Architecture.
*Cerebral Cortex*, 26(8):3508-3526.
[doi:10.1093/cercor/bhw157](https://doi.org/10.1093/cercor/bhw157)

## See also

Other ggseg_atlases:
[`brainnetome()`](https://ggsegverse.github.io/ggsegBrainnetome/reference/brainnetome.md)

## Examples

``` r
brainnetome_sub()
#> 
#> ── brainnetome_sub ggseg atlas ─────────────────────────────────────────────────
#> Type: subcortical
#> Regions: 36
#> Hemispheres: NA
#> Views: axial_1, axial_2, axial_3, axial_4, axial_5, coronal_1, coronal_2,
#> coronal_3, coronal_4, sagittal
#> Palette: ✔
#> Rendering: ✔ ggseg
#> ✔ ggseg3d (meshes)
#> ────────────────────────────────────────────────────────────────────────────────
#> # A tibble: 36 × 3
#>    hemi  region      label      
#>    <chr> <chr>       <chr>      
#>  1 NA    region 0211 region_0211
#>  2 NA    region 0212 region_0212
#>  3 NA    region 0213 region_0213
#>  4 NA    region 0214 region_0214
#>  5 NA    region 0215 region_0215
#>  6 NA    region 0216 region_0216
#>  7 NA    region 0217 region_0217
#>  8 NA    region 0218 region_0218
#>  9 NA    region 0219 region_0219
#> 10 NA    region 0220 region_0220
#> 11 NA    region 0221 region_0221
#> 12 NA    region 0222 region_0222
#> 13 NA    region 0223 region_0223
#> 14 NA    region 0224 region_0224
#> 15 NA    region 0225 region_0225
#> 16 NA    region 0226 region_0226
#> 17 NA    region 0227 region_0227
#> 18 NA    region 0228 region_0228
#> 19 NA    region 0229 region_0229
#> 20 NA    region 0230 region_0230
#> 21 NA    region 0231 region_0231
#> 22 NA    region 0232 region_0232
#> 23 NA    region 0233 region_0233
#> 24 NA    region 0234 region_0234
#> 25 NA    region 0235 region_0235
#> 26 NA    region 0236 region_0236
#> 27 NA    region 0237 region_0237
#> 28 NA    region 0238 region_0238
#> 29 NA    region 0239 region_0239
#> 30 NA    region 0240 region_0240
#> 31 NA    region 0241 region_0241
#> 32 NA    region 0242 region_0242
#> 33 NA    region 0243 region_0243
#> 34 NA    region 0244 region_0244
#> 35 NA    region 0245 region_0245
#> 36 NA    region 0246 region_0246
plot(brainnetome_sub())
#> Warning: No shared levels found between `names(values)` of the manual scale and the
#> data's fill values.
#> Warning: No shared levels found between `names(values)` of the manual scale and the
#> data's fill values.
```
