- **2026-02-27**: Fixed LinkedIn engagement automation
  - Corrected systemd service path (was /usr/bin/openclaw, now uses full path)
  - Fixed agent name (was M01_SOCIAL, now 'social')
  - Created run_engagement.sh wrapper script
  - Added crontab backup (runs at 9:00 AM and 9:00 PM daily)
  - Posted morning queue to Discord #product-hunt
  - Manual run completed successfully

