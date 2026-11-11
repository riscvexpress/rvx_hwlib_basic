# rocket_opt (RVC_ROCKET_OPT)

A small, area-reduced Rocket core for RVX, generated from chipsalliance
rocket-chip with the RVX configuration `RvcRocketOpt32Config`.

* Library name: `rvc_rocket_opt` (`synthesizer/general_ip/rvc_rocket_opt.xml`)
* Top module: `RVC_ROCKET_OPT` (`src/rvc_rocket_opt.v`)
* Software side: `rvx_ssw/core/rocket_opt`
* Test platform: `platform_test/test_rocket_opt`
* Sibling: `../rocket_big` (`RvcRocketBig32Config`, same rocket-chip version)

## Source

| Item | Value |
| --- | --- |
| Upstream | https://github.com/chipsalliance/rocket-chip.git |
| Version | tag `v1.6`, commit `44b0b82` (2022-09-15) — see `git_info.txt` |
| Build | sbt, Chisel 3 + Scala FIRRTL compiler, `vsim` flow |
| Config | `freechips.rocketchip.rvx.RvcRocketOpt32Config` |

The rocket-chip checkout used for generation carries RVX changes on top of
`v1.6`. They are not upstream; the copies under `scala/` are the reference:

* `scala/system/Rvx.scala` (new file): `WithRvxMemPort`, `WithRvxMMIOPort`,
  `RvcRocketBig32Config`, `RvcRocketJtag32Config`, `RvcRocketOpt32Config`.
* `scala/subsystem/Configs.scala`: adds `WithNOptCores`.

## Configuration

`RvcRocketOpt32Config` = `WithRV32` + `WithNOptCores(1)` + incoherent tiles and
bus topology + RVX memory/MMIO ports + default slave port + 1 MHz timebase +
2 external interrupts + `BaseSubsystemConfig`.

`WithNOptCores` reduces the big core:

| Parameter | Value |
| --- | --- |
| ISA | `rv32imfc` (no A, no D) |
| VM / PMP / breakpoints / debug | off / 0 / 0 / off |
| PTE cache entries | 0 |
| MulDiv | `mulUnroll = 8`, early-out on mul and div |
| D-cache | 16 KiB, 64 sets, 4 ways, 64 B lines, `nMSHRs = 0` (blocking), 1x4 TLB |
| I-cache | 16 KiB, 64 sets, 4 ways, 64 B lines, 1x4 TLB |
| Basic counters | kept (`haveBasicCounters = false` is commented out) |

Address map seen by the core:

| Port | Base | Size |
| --- | --- | --- |
| Memory (`WithRvxMemPort`) | `0x1000_0000` | `0xB000_0000` |
| MMIO (`WithRvxMMIOPort`) | `0xC000_0000` | `0x4000_0000` |

## Directory layout

| Path | Contents |
| --- | --- |
| `imported/` | Raw generator output: `<config>.v`, `.behav_srams.v`, `.dts`, `plusarg_reader.v` |
| `scala/` | Snapshot of the generator's `src/main/scala`, including the RVX changes |
| `src/` | Ported RTL used by RVX (one module per file) |
| `manual/` | Hand-maintained files copied over `src/` at the end of porting |
| `env/` | `hdl_info.txt`, `set_sim_env.mh`, `add_syn_source.tcl` |
| `git_info.txt` | Upstream URL and commit of the generator |

Hand-maintained files in `manual/`:

* `rvc_rocket_opt.v` — RVX wrapper (AXI/TileLink ports, interrupt mapping).
* `RocketTile.v` — `frontend_io_cpu_flush_icache` tied to 0.
* `FPU.v` — modified FPU.

## Regeneration flow

1. In the rocket-chip checkout: `./run_opt`
   (`cd vsim && make verilog CONFIG=freechips.rocketchip.rvx.RvcRocketOpt32Config`).
   Output lands in `vsim/generated-src`.
2. Here: `make update2` = `import` + `porting2` + `split`.
   * `import` copies the generator output into `imported/`, copies
     `src/main/scala` into `scala/`, and rewrites `git_info.txt`.
   * `porting2` runs `module_spliter.py` and `modify_rocket-v1.6.py`
     (`split tidy monitor unused bugfix reset_port split_register header`) and
     finally `overwrite_manual`.

`GENERATED_SRC_DIR` in the `Makefile` points to the generator checkout. The
comment at the bottom of the `Makefile` mentions `./run_big` and
`./run_medium`; the script for this core is `./run_opt`.

Before regenerating, make sure every edit made directly in `src/` is also in
`manual/`, because `overwrite_manual` restores `manual/` over the ported files.

## Status (checked 2026-11-07)

* `imported/`, `scala/`, `git_info.txt`: last updated 2026-02-13 (`75a98304`).
  The `.behav_srams.v`, `.dts`, `plusarg_reader.v` and `scala/` match the
  current generator checkout. The generator's `.v` was regenerated later
  (2026-05-13) and differs only inside `TLMonitor_31`, which porting removes,
  so `src/` would not change.
* Later commits touched only `src/rvc_rocket_opt.v`, `src/RocketTile.v`,
  `manual/RocketTile.v` and `env/`.
* `src/rvc_rocket_opt.v` connects the software interrupt
  (`auto_int_local_in_1_0 = interrupts_extended[RISCV_INTERRUPT_INDEX_SOFTWARE]`,
  2026-10-06); `manual/rvc_rocket_opt.v` has been synced to match, so the
  porting flow keeps it.
* Upstream has no release after `v1.6`. `master` (2026-09) is 821 commits
  ahead and has moved to Chisel 6 + firtool (CIRCT), mill only (no sbt, no
  `vsim`), and the `org.chipsalliance.cde` config package. Using it would need
  `Rvx.scala`, `WithNOptCores`, the generator script and the RVX porting
  scripts (written for Scala-FIRRTL output) to be redone. Rocket core fixes
  since `v1.6` reviewed for this config (RV32IMFC, no VM, no RoCC, no vector)
  are either outside the enabled features, warning/API cleanups, or the
  reserved encoding check for `c.addi4spn` with `imm = 0` (illegal-instruction
  detection only).
