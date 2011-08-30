# Awful deployment script. blam.
ssh 417east.com -p 9877 'cd cmustudents.org && git reset --hard && git clean && bundle && stasis'