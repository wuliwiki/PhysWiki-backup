# to run in background, use `nohup ./sync.sh > /dev/null &`
# to find the process, use `ps aux | grep sync.sh`
while :
do
sleep 60;
find . -type f -name '*.tex' -mmin -2 -exec cp {} /mnt/oss/PhysWiki-backup/ \;
done
