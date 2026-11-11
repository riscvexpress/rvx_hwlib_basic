# orca_vicuna

ORCA with the Vicuna 1.0 vector unit (Zve32x) attached through CV-X-IF.
Vicuna shares ORCA's D$. Upstream sources are listed in `vicuna/git_info.txt`.

Verified on `platform_test/test_rvv` with `verify_zve32x` and `verify_rvv`.
Meets 100 MHz timing on genesys2-eb.

## Vicuna 2.0 (dropped)

Vicuna 2.0 was also tried, attached to ORCA the same way, as `orca_vicuna2`.
It was dropped because its verification results were poor. All of its files
were deleted:

- `hwlib_basic/core/orca_vicuna2/`
- `rvx_ssw/core/orca_vicuna2/`
- `synthesizer/general_ip/rvc_orca_vicuna2.xml` and its rvx-private copy
- `platform_test/test_rvv2/`

Upstream sources it used:

- vicuna2_core: https://github.com/vproc/vicuna2_core.git (e69ed5c)
- cvfpu: 2c79477
- pulp common_cells: 9ca8a76
- cv32e40x: https://github.com/openhwgroup/cv32e40x.git (d952cd6)

The divider (`vproc_div*.sv`, `cv32e40x_div.sv`) in `vicuna/` was taken from
vicuna2_core.
