#!/system/bin/sh

EVENT=$1

if [ -z "$EVENT" ]; then
  EVENT="FAKEGPS_OFF"
fi

echo "$EVENT" > /data/local/tmp/efs_trigger
