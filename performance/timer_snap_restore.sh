required_status='available'
loop=true
echo $1
volid=`./snap_restore.sh $1 restore|sed -n -e 's/.*<volumeId>\(.*\)<\/volumeId>.*/\1/p'`
echo $volid
while $loop; do
status=`./vol_describe.sh $volid|sed -n -e 's/.*<status>\(.*\)<\/status>.*/\1/p'`
echo $status
if [ "$status" = "$required_status" ];
then
	loop=false
fi
done
