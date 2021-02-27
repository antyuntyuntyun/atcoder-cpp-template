# !/bin/sh

src=$1
contest_id=$2 # urlの/atcorder/contest/xxxxxx/tasks/... のxxxxxの部分
problem_id=$3 # urlの末尾。基本a,b,c,d

if [ -z "$src" -o -z "$contest_id" -o -z "$problem_id" ]; then
    echo '\e[35mcommand Error \e[m'
    echo 'src(.cpp)) and contest id and problem id must be specified.\n\n'
    echo 'Usage: tools/atcoder-test.sh [<src> <contest_id> <problem_id>]'
    echo 'url consists of /atcorder/contest/[$contest_id]/tasks/[$contest_id]_[$problem_id]'
    return
fi

# ソースのある場所へ移動
cd $1

# dl test case
echo '\n\e[35m----------------- downlad test input ----------------- \e[m\n' 
oj d "https://atcoder.jp/contests/${contest_id}/tasks/${contest_id}_${problem_id}"

# build
g++ -Wall -Wextra -std=gnu++17 $(basename $src)

# test
echo '\n\e[35m------------ test src:' $src 'contest id:' $contest_id 'problem_id:' $problem_id '------------ \e[m\n' 
oj test

# rm test file
echo '\n\e[35mrm test file ...\e[m\n'
rm -f a.out
rm -rf test	