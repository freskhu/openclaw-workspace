# Daily Command

## Run LinkedIn Engagement Routine

```bash
# As M01_SOCIAL agent:
openclaw agent run M01_SOCIAL --task="Execute LinkedIn engagement daily routine" --config=config/linkedin_engagement.yaml
```

Or manually:

```bash
# 1. Ensure browser is running
openclaw browser start --profile=openclaw --target=host

# 2. Run engagement routine
cd ~/projects/openclaw-workspace
# Read skills/linkedin_engagement_v1/PROMPT.md and follow steps
```

## Manual Steps (if automation fails)

1. **Session Check**
   ```
   openclaw browser open https://www.linkedin.com/feed
   # Verify feed loads
   ```

2. **Build Queue**
   - Scan feed for 5 relevant posts
   - Or ask Simão: "Please paste 5-10 LinkedIn URLs to review"

3. **Draft Comments**
   - For each post: decide Like vs Comment
   - Write 2-4 line comment draft
   - Record reason

4. **Post to Discord #product-hunt**
   - Use SAMPLE_QUEUE.md format
   - Include all 5 items

5. **Wait for Approval**
   - Parse Simão's reply
   - Execute only approved items

6. **Execute via Browser**
   - Open each approved URL
   - Like: click Like
   - Comment: paste draft, ask for manual Post click

7. **Log Results**
   - Append to logs/linkedin_engagement_YYYYMMDD.jsonl

---

## Automation (Systemd Timer)

The routine runs automatically daily at 9:00 AM Europe/Lisbon time via systemd.

### Install/Enable

```bash
sudo cp ~/projects/openclaw-workspace/skills/linkedin_engagement_v1/systemd/linkedin-daily-engagement.* /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now linkedin-daily-engagement.timer
```

### Check Status

```bash
systemctl status linkedin-daily-engagement.timer
systemctl list-timers --all | grep linkedin
```

### View Logs

```bash
journalctl -u linkedin-daily-engagement.service -f
```

### Manual Trigger

```bash
sudo systemctl start linkedin-daily-engagement.service
```

### Disable

```bash
sudo systemctl disable --now linkedin-daily-engagement.timer
```

---

## Prerequisites for Automation

Before enabling the timer, ensure:

1. **LinkedIn session is active**
   ```bash
   openclaw browser start --profile=openclaw --target=host
   # Login to LinkedIn manually (one-time)
   ```

2. **Discord bot can post to #product-hunt**
   - Verify channel access
   - Test notification

3. **Approval workflow understood**
   - You'll receive Discord notification daily
   - Reply with approvals within reasonable time
   - Comments wait for your manual "Post" click

---

## Fallback (If Automation Fails)

If the systemd timer fails or Discord is unavailable:

```bash
# Run manually
cd ~/projects/openclaw-workspace
openclaw agent run M01_SOCIAL --task="Execute LinkedIn engagement daily routine"
```
