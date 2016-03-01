required_status='completed'
loop=true
snapid=`./snap_create.sh $1 sng|sed -n -e 's/.*<snapshotId>\(.*\)<\/snapshotId>.*/\1/p'`
echo $snapid
while $loop; do
status=`./snap_describe.sh $snapid|sed -n -e 's/.*<status>\(.*\)<\/status>.*/\1/p'`
echo $status
if [ "$status" = "$required_status" ];
then
	loop=false
fi
done
