#!/bin/sh
compare_benches () {
  if [ "$#" -lt 2 ]; then
    printf "Usage:\n  compare_benches oldCommit newCommit ...\nwhere ... is passed to benchmarks directly.\n"
    return 0
  fi

  OLD="$1"
  shift
  NEW="$1"
  shift

  OLDREF=$(git rev-parse --verify "$OLD")
  NEWREF=$(git rev-parse --verify "$NEW")

  OLDCSV=$(echo "$OLD".csv | sed -e s#/##g)
  NEWCSV=$(echo "$NEW".csv | sed -e s#/##g)
  OLDVSNEWCSV=$(echo "$OLD"-vs-"$NEW".csv | sed -e s#/##g)

  git checkout -q "$OLDREF" && \
  cabal run -v0 benchmarks -- --csv "$OLDCSV" "$@" && \
  git checkout -q "$NEWREF" && \
  cabal run -v0 benchmarks -- --baseline "$OLDCSV" --csv "$NEWCSV" "$@" && \
  git checkout -q "@{-2}" && \

  awk 'BEGIN{FS=",";OFS=",";print "Name,'"$OLD"','"$NEW"',Ratio"}FNR==1{trueNF=NF;next}NF<trueNF{print "Benchmark names should not contain newlines";exit 1}FNR==NR{oldTime=$(NF-trueNF+2);NF-=trueNF-1;a[$0]=oldTime;next}{newTime=$(NF-trueNF+2);NF-=trueNF-1;print $0,a[$0],newTime,newTime/a[$0];gs+=log(newTime/a[$0]);gc++}END{if(gc>0)print "Geometric mean,,",exp(gs/gc)}' "$OLDCSV" "$NEWCSV" > "$OLDVSNEWCSV"
}
