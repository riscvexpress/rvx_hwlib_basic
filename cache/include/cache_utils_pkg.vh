//------------------------------------------------------------------------------
// utils_pkg.vh
// Converted 1:1 from utils_pkg.vhd (package utils_pkg).
//
// VHDL package functions are converted to Verilog-2001 text macros so that
// they can be used in port-range/parameter expressions (Verilog-2001 does not
// allow package functions; constant functions cannot be shared in headers
// used inside ANSI port lists).
//
// Function mapping:
//   imax(M,N)        -> `imax(M,N)
//   imin(M,N)        -> `imin(M,N)
//   log2(N)          -> `log2(N)        (ceiling log2: smallest i with 2**i >= N)
//   log2_min1(N)     -> `log2_min1(N)   (imax(log2(N),1))
//   log2_f(N)        -> `log2_f(N)      (floor log2: largest i with 2**i <= N)
//   conditional(a,t,f)-> (a) ? (t) : (f)   (used inline at call sites)
//   bool_to_int(a)   -> (a) ? 1 : 0        (used inline at call sites)
//   bool_to_sl(a)    -> (a) ? 1'b1 : 1'b0  (used inline at call sites)
//   or_slv(v)        -> |v                 (reduction OR, used inline)
//   and_slv(v)       -> &v                 (reduction AND, used inline)
//   replicate_slv(v,C)-> {C{v}}            (replication, used inline)
//------------------------------------------------------------------------------
`ifndef CACHE_UTILS_PKG_VH
`define CACHE_UTILS_PKG_VH

`define imax(M,N) (((M) > (N)) ? (M) : (N))

`define imin(M,N) (((M) < (N)) ? (M) : (N))

// Ceiling log2 (identical to VHDL utils_pkg.log2): log2(1)=0, log2(2)=1,
// log2(3)=2, log2(4)=2, ...
`define log2(N) ( \
    (N) <= 1          ? 0  : \
    (N) <= 2          ? 1  : \
    (N) <= 4          ? 2  : \
    (N) <= 8          ? 3  : \
    (N) <= 16         ? 4  : \
    (N) <= 32         ? 5  : \
    (N) <= 64         ? 6  : \
    (N) <= 128        ? 7  : \
    (N) <= 256        ? 8  : \
    (N) <= 512        ? 9  : \
    (N) <= 1024       ? 10 : \
    (N) <= 2048       ? 11 : \
    (N) <= 4096       ? 12 : \
    (N) <= 8192       ? 13 : \
    (N) <= 16384      ? 14 : \
    (N) <= 32768      ? 15 : \
    (N) <= 65536      ? 16 : \
    (N) <= 131072     ? 17 : \
    (N) <= 262144     ? 18 : \
    (N) <= 524288     ? 19 : \
    (N) <= 1048576    ? 20 : \
    (N) <= 2097152    ? 21 : \
    (N) <= 4194304    ? 22 : \
    (N) <= 8388608    ? 23 : \
    (N) <= 16777216   ? 24 : \
    (N) <= 33554432   ? 25 : \
    (N) <= 67108864   ? 26 : \
    (N) <= 134217728  ? 27 : \
    (N) <= 268435456  ? 28 : \
    (N) <= 536870912  ? 29 : \
    (N) <= 1073741824 ? 30 : 31)

// imax(log2(N),1)
`define log2_min1(N) ((`log2(N) > 1) ? `log2(N) : 1)

// Floor log2 (identical to VHDL utils_pkg.log2_f): log2_f(1)=0, log2_f(2)=1,
// log2_f(3)=1, log2_f(4)=2, ...
`define log2_f(N) ( \
    (N) < 2          ? 0  : \
    (N) < 4          ? 1  : \
    (N) < 8          ? 2  : \
    (N) < 16         ? 3  : \
    (N) < 32         ? 4  : \
    (N) < 64         ? 5  : \
    (N) < 128        ? 6  : \
    (N) < 256        ? 7  : \
    (N) < 512        ? 8  : \
    (N) < 1024       ? 9  : \
    (N) < 2048       ? 10 : \
    (N) < 4096       ? 11 : \
    (N) < 8192       ? 12 : \
    (N) < 16384      ? 13 : \
    (N) < 32768      ? 14 : \
    (N) < 65536      ? 15 : \
    (N) < 131072     ? 16 : \
    (N) < 262144     ? 17 : \
    (N) < 524288     ? 18 : \
    (N) < 1048576    ? 19 : \
    (N) < 2097152    ? 20 : \
    (N) < 4194304    ? 21 : \
    (N) < 8388608    ? 22 : \
    (N) < 16777216   ? 23 : \
    (N) < 33554432   ? 24 : \
    (N) < 67108864   ? 25 : \
    (N) < 134217728  ? 26 : \
    (N) < 268435456  ? 27 : \
    (N) < 536870912  ? 28 : \
    (N) < 1073741824 ? 29 : 30)

`endif // CACHE_UTILS_PKG_VH
