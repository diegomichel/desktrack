A little system to track windows open and the windows focused at the current time.

It generates a file on ~/data/desktrack.csv with columns

Date|Time|CurrentWindow|...other...windows...


Can be used for data analysis of how you spend your time.


# Setup
Clone the project i.e. in ~/projects/desktrack/

and then in your .xinitrc add this lines

`cd ~/projects/desktrack/`

`bash start.sh &`

Next time you restart your X server it will start tracking data.
