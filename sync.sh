while :
do
sleep 60;
find . -type f -mmin -2 -exec cp {} /mnt/oss/PhysWiki-backup/ \;
done
