# shuffle and split corpusfiles

IN_CORPUS=$1



echo 'SHUFFLING...'
# is gshuf missing on osx instal coreutils with brew : brew install coreutils
cat $IN_CORPUS | gshuf > $IN_CORPUS.shuf

echo 'SPLITTING...'
tail -n +1700 $IN_CORPUS.shuf > $IN_CORPUS.train
head -n 700 $IN_CORPUS.shuf > $IN_CORPUS.dev
head -n 1700 $IN_CORPUS.shuf | tail -n +700 > $IN_CORPUS.test
