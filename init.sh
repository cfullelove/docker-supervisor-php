#!/bin/bash

echo $@
cat >/etc/supervisor/conf.d/app.conf << EOF
[program:app]
command=${@}
directory=/app
autostart=true
autorestart=true
redirect_stderr=true
stdout_logfile=/dev/stdout
stdout_logfile_maxbytes=0
EOF

exec /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
