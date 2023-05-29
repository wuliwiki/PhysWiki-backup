# auto clean redundent tex files
add .
printf 'id=./.git/\ndn\nad=./' | rm_repeat .
rm -r rm_repeat_recycle
