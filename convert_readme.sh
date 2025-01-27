#!/bin/sh
sed 's/e\. g\./e.g./g' README.md | pandoc -f markdown -t haddock -o README.haddock

ex README.haddock <<eof
1 insert
{- |
Module:      Test.Tasty.Bench
Copyright:   (c) 2021 Andrew Lelechenko
License:     MIT
.
xit
eof

echo "\n-}\n" >> README.haddock

sed -i '' '/^= /d' README.haddock
sed -i '' '/^#/d' README.haddock
sed -i '' '/^-   <#/d' README.haddock

sed -i '' 's/^== /=== /g' README.haddock
sed -i '' -E 's/<(.*) (criterion|gauge|tasty|tasty-rerun|-fproc-alignment)>/[@\2@](\1)/g' README.haddock
sed -i '' -E 's/<(.*) tasty documentation>/[@tasty@ documentation](\1)/g' README.haddock
sed -i '' -E 's/vs\../vs. /g' README.haddock
sed -i '' -E 's/e\.g\./e. g./g' README.haddock

sed -i '' 's/@localOption (NumThreads 1)@/@localOption@ (@NumThreads@ 1)/g' README.haddock
sed -i '' 's/@localOption (FailIfSlower 0.10)@/@localOption@ (@FailIfSlower@ 0.10)/g' README.haddock
sed -i '' 's/@localOption (RelStDev 0.02)@/@localOption@ (@RelStDev@ 0.02)/g' README.haddock
sed -i '' 's/@localOption (mkTimeout 100000000)@/@localOption@ (@mkTimeout@ 100000000)/g' README.haddock
sed -i '' "s/@Test.Tasty.Bench.defaultMain@/@Test.Tasty.Bench.@'Test.Tasty.Bench.defaultMain'/g" README.haddock
sed -i '' "s/@Test.Tasty.defaultMain@/@Test.Tasty.@'Test.Tasty.defaultMain'/g" README.haddock
sed -i '' "s/@ghc-options:@\[@-fproc-alignment@\]/@ghc-options:@ [@-fproc-alignment@]/g" README.haddock

sed -i '' 's/@Test.Tasty.Bench@/"Test.Tasty.Bench"/g' README.haddock

for word in getCPUTime TimeMode RTSStats allocated_bytes copied_bytes max_mem_in_use_bytes consoleBenchReporter consoleTestReporter env envWithCleanup IO bcompare bcompareWithin locateBenchmark localOption NumThreads Benchmarkable measureCpuTime mkTimeout RelStDev FailIfSlower; do
  sed -i '' "s/@$word@/'$word'/g" README.haddock
done

sed -i '' "s;<<https://hackage.haskell.org/package/tasty-bench/src/example.svg Plotting>>;![Plotting](example.svg);g" README.haddock
sed -i '' "s/^Plotting$//g" README.haddock

sed -i '' 's/^-   @\(.*\)@/[@\1@]:/g' README.haddock

sed -n '/^{-#/,$p' src/Test/Tasty/Bench.hs > src/Test/Tasty/Bench.temp
cat README.haddock src/Test/Tasty/Bench.temp > src/Test/Tasty/Bench.hs
rm README.haddock src/Test/Tasty/Bench.temp
