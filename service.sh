#!/system/bin/sh

MODDIR=${0%/*}

TARGET="com.fakegps.app"
KEYWORD="FAKEGPS_OFF"

LOG="/data/adb/event_forcestop.log"

log() {
  echo "$(date '+%F %T') $1" >> $LOG
}

log "Service started"

while true; do

  # listen event file trigger
  if [ -f /data/local/tmp/efs_trigger ]; then

    EVENT=$(cat /data/local/tmp/efs_trigger)

    if echo "$EVENT" | grep -q "$KEYWORD"; then
      log "EVENT MATCH: force-stop target"

      /system/bin/am force-stop $TARGET

      log "force-stop executed"
    fi

    rm -f /data/local/tmp/efs_trigger
  fi

  sleep 2
done
