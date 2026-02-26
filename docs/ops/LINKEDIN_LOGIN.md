# LinkedIn Login Instructions

## Browser Setup (One-Time)

### Step 1: Start Browser
```bash
openclaw browser start --profile=openclaw --target=host
```

### Step 2: Navigate to LinkedIn
```
https://www.linkedin.com
```

### Step 3: Manual Login
- Enter your LinkedIn credentials
- Complete any 2FA if enabled
- Verify you can see your feed

### Step 4: Verify Session
- Check that feed loads with posts
- Confirm you can see "Like" and "Comment" buttons
- Leave browser open (session persists)

### Step 5: Confirm Readiness
Message in Discord or current channel:
> "LinkedIn session active. Feed is reachable. Ready for engagement routine."

---

## Session Persistence

The browser profile (`openclaw`) maintains cookies and session state.

**You only need to re-login when:**
- LinkedIn expires the session (rare)
- You manually log out
- Browser profile is reset

**To check if session is still valid:**
1. Open browser with profile
2. Navigate to linkedin.com/feed
3. If feed loads without login prompt → session valid

---

## Troubleshooting

**Problem:** Feed doesn't load / asks for login
**Solution:** Re-run login steps above

**Problem:** Browser won't start
**Solution:** Check OpenClaw browser status: `openclaw browser status`

**Problem:** Session keeps expiring
**Solution:** LinkedIn may have detected automation. Reduce daily activity or add delays between actions.

---

## Security Notes

- ❌ Never share LinkedIn credentials in any chat
- ❌ Never store password in config files
- ✅ Manual login only
- ✅ Session persists in local browser profile only
