sleep 5 # Wait for X to start
if ps aux|grep "ruby $HOME/projects/deskspy/loop.rb"|egrep -v "grep" > /dev/null
then
  echo "Running"
else
  ruby $HOME/projects/deskspy/loop.rb &
fi
