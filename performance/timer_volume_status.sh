required_status='available'
loop=true
volid=$1
while $loop; do
status=`./vol_describe.sh $volid|sed -n -e 's/.*<status>\(.*\)<\/status>.*/\1/p'`
#echo $status
if [ "$status" = "$required_status" ];
then
	loop=false
fi
done
