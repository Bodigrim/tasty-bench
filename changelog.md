# 0.4

* Switch `nf`, `nfIO` and `nfAppIO` to evaluate outputs to a normal form
  with `rnf` instead of `force`. It means that parts of the output, which have
  already been forced, can be garbage collected early, without waiting for
  the entire output to be allocated at the same time. This decreases
  benchmarking overhead in many scenarios and brings the behaviour in line
  with `criterion`. See [#39](https://github.com/Bodigrim/tasty-bench/issues/39)
  for discussion.
* Drop support of `tasty < 1.4`.
* Make `IO` benchmarks immune to `-fspec-constr-count` limit.
* Decomission `debug` build flag.
* Decomission warning when `--timeout` is absent.
* Add `instance {Eq,Ord,Num,Fractional} {RelStDev,FailIfSlower,FailIfFaster}`.
* Add `instance {Eq,Ord} {CsvPath,SvgPath,BaselinePath}`.

# 0.3.5

* Support `tasty-1.5`.
* Report benchmarking progress.

# 0.3.4

* Force single-threaded execution in `defaultMain`.
* Expose `measureCpuTimeAndStDev` helper to analyse benchmarks manually.

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
