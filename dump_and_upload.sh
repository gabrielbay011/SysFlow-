#!/bin/bash
set -e

DATE=$(date +%Y-%m-%d_%H-%M)
FILENAME="pg_backup_$DATE.sql.gz"

PGPASSWORD="$PG_PASSWORD" pg_dump -h "$PG_HOST" -p "$PG_PORT" -U "$PG_USER" -d "$PG_DB" | gzip > "$FILENAME"

mkdir -p ~/.config/rclone
echo "$RCLONE_CONF" > ~/.config/rclone/rclone.conf

rclone copy "$FILENAME" gdrive:/backups/

rm "$FILENAME"
