# auto clean redundent tex files
add .
cd .git
sudo chwuli.sh
cd ../
printf 'id=./.git/\ndn\nad=./' | rm_repeat .
rm -rf rm_repeat_recycle
