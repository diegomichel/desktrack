sleep 5 # Wait for X to start
if ps aux|grep "ruby loop.rb"|egrep -v "grep" > /dev/null
then
  echo "Running"
else
  ruby loop.rb >> /tmp/desktrack.errors
fi
