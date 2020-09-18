CURRENT=$(date +"%Y")
OFFSET=4
Y=$(($CURRENT - $OFFSET))
END_Y=$(($CURRENT + $OFFSET))

mkdir commits
cd commits

while ((Y<=END_Y))
do
  mkdir $Y
  cd $Y
  for M in {01..12}
  do
    mkdir $M
    cd $M
    for D in {01..31}
    do  
      mkdir $D
      cd $D
      for HOUR in {09..17}
      do
        echo "$i on $M/$D/$Y" > commit.md
        MINUTE=$(jot -r 1 10 50)
        SECOND=$(jot -r 1 10 50)
        export GIT_COMMITTER_DATE="$Y-$M-$D $HOUR:$MINUTE:$SECOND"
        export GIT_AUTHOR_DATE="$Y-$M-$D $HOUR:$MINUTE:$SECOND"
        git add commit.md -f
        git commit --date="$Y-$M-$D $HOUR:$MINUTE:$SECOND" -m "$HOUR on $M $D $Y"
      done
      D
      cd ../
    done
    cd ../
  done
  cd ../
  ((Y++))
done

