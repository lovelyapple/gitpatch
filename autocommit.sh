IFS_BACKUP=$IFS
IFS=$'\n'
declare -a files=(`git status -s -u | grep -v 'autocommit.sh'| awk '{printf "\"%s %s\"\n", $2,$3}' | sed "s/ \"$/\"/"`)
echo $files>>file.txt
for i in ${files[@]}
do
    echo $i
    git add $i
done
IFS=$IFS_BACKUP

# files=`git status -s -u | grep -v 'autocommit.sh'| cut -d' ' -f2-`` 

# echo ${files}

# for i in ${files[@]}
# do
# 	echo $i
# done