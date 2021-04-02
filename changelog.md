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
