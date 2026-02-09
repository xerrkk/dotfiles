export PS1-"$ "
cat /etc/motd
if [ -x /usr/bin/fortune ] ; then /usr/bin/fortune freebsd-tips ; fi
