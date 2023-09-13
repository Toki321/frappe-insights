#!bin/bash

if [ -d "/home/frappe/frappe-bench/apps/frappe" ]; then
    echo "Bench already exists, skipping init"
    cd frappe-bench
    bench start
else
    echo "Creating new bench..."
fi

bench init --skip-redis-config-generation frappe-bench

cd frappe-bench

# Use containers instead of localhost
bench set-mariadb-host mariadb
bench set-redis-cache-host redis:6379
bench set-redis-queue-host redis:6379
bench set-redis-socketio-host redis:6379

# Remove redis, watch from Procfile
sed -i '/redis/d' ./Procfile
sed -i '/watch/d' ./Procfile

bench get-app insights

bench new-site 13.51.56.246 \
--force \
--mariadb-root-password 123 \
--admin-password admin \
--no-mariadb-socket

bench --site 13.51.56.246 install-app insights
bench --site 13.51.56.246 set-config developer_mode 1
bench --site 13.51.56.246 clear-cache
bench --site 13.51.56.246 set-config mute_emails 1
bench use 13.51.56.246

bench start