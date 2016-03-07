required_status='completed'
loop=true
echo "creating snap for $1"
snapid=`./create_snapshot $1|sed -n -e 's/.*<snapshotId>\(.*\)<\/snapshotId>.*/\1/p'`
echo $snapid
while $loop; do
status=`./describe_snapshot_1 $snapid|sed -n -e 's/.*<status>\(.*\)<\/status>.*/\1/p'`
echo $status
if [ "$status" = "$required_status" ];
then
	loop=false
fi
done
