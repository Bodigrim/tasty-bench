# 0.3.3

* Drop support of `tasty < 1.2.3`.
* Make benchmarks immune to `-fspec-constr-count` limit.

# 0.3.2

* Add `locateBenchmark` and `mapLeafBenchmarks`.
* Support measuring of wall-clock time.
* Make messages for baseline comparison less ambiguous.
* Graceful degradation on non-Unicode terminals.

# 0.3.1

* Add `bcompareWithin` for portable performance tests.
* Add `tasty` and `debug` build flags.

# 0.3

* Report mean time with 3 significant digits.
* Report peak memory usage, when run with `+RTS -T`.
* Run benchmarks only once, if `RelStDev` is infinite.
* Make `Benchmarkable` constructor public.
* Expose `measureCpuTime` helper to run benchmarks manually.
* Expose `CsvPath`, `BaselinePath`, `SvgPath`.

# 0.2.5

* Fix comparison against baseline.

# 0.2.4

* Add a simplistic SVG reporter.
* Add `bcompare` to compare between benchmarks.
* Throw a warning, if benchmarks take too long.

# 0.2.3

* Prohibit duplicated benchmark names in CSV reports.

# 0.2.2

* Remove `NFData` constraint from `whnfIO`.

# 0.2.1

* Fix integer overflow in stdev computations.

# 0.2

* Add `env` and `envWithCleanup`.
* Run console and CSV reporters in parallel.
* Extend console reporter and export it as `consoleBenchReporter`.
* Add comparison against baseline and relevant options.
* Export `RelStDev` option.
* Export `benchIngredients`.

# 0.1

* Initial release.
