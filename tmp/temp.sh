cd /tmp
ls -l
touch /tmp/$(date +%Y%m%d%M%H%S).tmp || exit 1
