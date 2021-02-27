# !/bin/sh

src=$1
contest_id=$2 # urlの/atcorder/contest/xxxxxx/tasks/... のxxxxxの部分
problem_id=$3 # urlの末尾。おそらく基本a,b,c,d
browser=$4 # urlの末尾。おそらく基本a,b,c,d

if [ -z "$src" -o -z "$contest_id" -o -z "$problem_id" ]; then
    echo '\e[35mcommand Error \e[m'
    echo 'src(.cpp)) and contest id and problem id must be specified.\n\n'
    echo 'Usage: atcorder-submit [<src> <contest_id> <problem_id>]'
    echo 'url consists of /atcorder/contest/[$contest_id]/tasks/[$contest_id]_[$problem_id]'
    return
fi

# ソースのある場所へ移動
cd $1

# submit code
echo '\n\e[35m----------------- submit code ----------------- \e[m' 
echo '\e[35m------------ src:' $src 'contest id:' $contest_id 'problem_id:' $problem_id '------------ \e[m\n' 
oj s "https://atcoder.jp/contests/${contest_id}/tasks/${contest_id}_${problem_id}" $(basename $src)

# open browser force
if [ "$browser" = "win" ]; then
    cmd.exe /C start "https://atcoder.jp/contests/${contest_id}/submissions/me"
elif [ "$browser" = "mac" ]; then
    open "https://atcorder.jp/contests/[$contest_id]/submissions/me"
fi