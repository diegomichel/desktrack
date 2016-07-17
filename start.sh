sleep 5 # Wait for X to start
if ps aux|grep "ruby loop.rb"|egrep -v "grep" > /dev/null
then
  echo "Running LOLOL"
else
  ruby loop.rb
fi
