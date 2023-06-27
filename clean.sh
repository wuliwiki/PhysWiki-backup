# auto clean redundent tex files
git add .
cd .git
sudo chwuli.sh
cd ../
printf 'id=./.git/\ndn\nad=./' | rm_repeat .
rm -rf rm_repeat_recycle
