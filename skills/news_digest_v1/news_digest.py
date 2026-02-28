#!/usr/bin/env python3
"""
Daily News Digest - Python version with email delivery via ProtonMail
"""

import yaml
import json
import feedparser
import smtplib
import requests
import os
from datetime import datetime
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from pathlib import Path
import sys

# Config paths
SCRIPT_DIR = Path(__file__).parent
CONFIG_FILE = SCRIPT_DIR / "config" / "news_digest.yaml"
LOG_DIR = Path.home() / ".openclaw" / "workspace" / "logs"
LOG_DIR.mkdir(exist_ok=True)

# ProtonMail credentials (from environment or config)
EMAIL_USER = "max-news-claw@proton.me"
EMAIL_PASSWORD = os.environ.get('PROTONMAIL_PASSWORD', 'NewsBot2026!Secure')

# Load config
def load_config():
    with open(CONFIG_FILE) as f:
        return yaml.safe_load(f)

# Fetch RSS feed
def fetch_rss(url, name, max_items=5):
    """Fetch and parse RSS feed"""
    try:
        headers = {
            'User-Agent': 'Mozilla/5.0 (compatible; NewsBot/1.0)'
        }
        response = requests.get(url, headers=headers, timeout=30)
        response.raise_for_status()
        
        feed = feedparser.parse(response.content)
        
        articles = []
        for entry in feed.entries[:max_items]:
            article = {
                'title': entry.get('title', 'No title'),
                'link': entry.get('link', ''),
                'summary': entry.get('summary', entry.get('description', ''))[:300],
                'published': entry.get('published', ''),
            }
            articles.append(article)
        
        return {'name': name, 'articles': articles, 'status': 'success'}
    except Exception as e:
        return {'name': name, 'articles': [], 'status': 'error', 'error': str(e)}

# Generate markdown report
def generate_report(results, date_str):
    """Generate formatted report"""
    report = f"""📰 Daily News Digest - {date_str}
Generated: {datetime.now().strftime('%H:%M %Z')}

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

"""
    
    for result in results:
        emoji = result.get('emoji', '📄')
        report += f"""━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
{emoji} {result['name'].upper()}
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

"""
        
        if result['status'] == 'error':
            report += f"⚠️ Unable to fetch feed: {result.get('error', 'Unknown error')}\n\n"
            continue
            
        if not result['articles']:
            report += "⚠️ No articles found\n\n"
            continue
        
        for article in result['articles']:
            report += f"• {article['title']}\n"
            if article['summary']:
                # Clean HTML tags if present
                summary = article['summary'].replace('<p>', '').replace('</p>', ' ')
                summary = summary.replace('<br>', ' ').replace('<br/>', ' ')
                summary = ' '.join(summary.split())[:250]  # Limit length
                if summary:
                    report += f"  {summary}\n"
            if article['link']:
                report += f"  🔗 {article['link']}\n"
            report += "\n"
    
    report += """━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📊 SUMMARY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Sources checked: {total}
Successful: {successful}
Failed: {failed}

Reply with feedback or source requests.
""".format(
        total=len(results),
        successful=sum(1 for r in results if r['status'] == 'success'),
        failed=sum(1 for r in results if r['status'] == 'error')
    )
    
    return report

# Send email via ProtonMail
def send_email(report, config, date_str):
    """Send email with report via ProtonMail"""
    email_config = config.get('delivery', {}).get('email', {})
    
    to_email = email_config.get('to', EMAIL_USER)
    from_email = email_config.get('from', EMAIL_USER)
    subject = email_config.get('subject_template', '📰 Daily News Digest - {date}').format(date=date_str)
    
    # Use ProtonMail Bridge if running locally, otherwise use config
    smtp_server = email_config.get('smtp_server', '127.0.0.1')
    smtp_port = email_config.get('smtp_port', 1025)
    
    try:
        # Create message
        msg = MIMEMultipart('alternative')
        msg['Subject'] = subject
        msg['From'] = from_email
        msg['To'] = to_email
        
        # Attach plain text
        msg.attach(MIMEText(report, 'plain'))
        
        # Connect to SMTP (ProtonMail Bridge on localhost:1025)
        print(f"Connecting to {smtp_server}:{smtp_port}...")
        server = smtplib.SMTP(smtp_server, smtp_port)
        # No TLS for localhost Bridge connection
        if smtp_server != '127.0.0.1':
            server.starttls()
        server.login(EMAIL_USER, EMAIL_PASSWORD)
        
        # Send email
        server.sendmail(from_email, to_email, msg.as_string())
        server.quit()
        
        print(f"✅ Email sent successfully to {to_email}")
        return True
        
    except Exception as e:
        print(f"⚠️ Email sending failed: {e}")
        return False

# Send Discord message
def send_discord(report, config):
    """Send to Discord as fallback"""
    import subprocess
    
    channel = config.get('delivery', {}).get('fallback', {}).get('channel', 'product-hunt')
    
    # Truncate for Discord (2000 char limit)
    discord_report = report[:1900] + "\n\n[Report truncated...]" if len(report) > 1900 else report
    
    try:
        result = subprocess.run([
            '/home/freskhy/.npm-global/bin/openclaw', 'message', 'send',
            '--channel', 'discord',
            '--target', channel,
            '--message', discord_report
        ], capture_output=True, text=True)
        
        if result.returncode == 0:
            print(f"✅ Discord message sent to #{channel}")
            return True
        else:
            print(f"⚠️ Discord failed: {result.stderr}")
            return False
    except Exception as e:
        print(f"⚠️ Discord error: {e}")
        return False

# Main function
def main():
    config = load_config()
    date_str = datetime.now().strftime('%Y-%m-%d')
    date_short = datetime.now().strftime('%Y%m%d')
    
    # Log start
    log_file = LOG_DIR / f"news_digest_{date_short}.jsonl"
    with open(log_file, 'a') as f:
        f.write(json.dumps({
            'timestamp': datetime.now().isoformat(),
            'event': 'digest_start',
            'date': date_str
        }) + '\n')
    
    print(f"📰 Generating news digest for {date_str}...")
    
    # Fetch from sources
    sources = config.get('sources', {})
    results = []
    
    source_configs = [
        ('economist', 'https://www.economist.com/latest/rss.xml'),
        ('financial_times', 'https://www.ft.com/world?format=rss'),
        ('jornal_economico', 'https://jornaleconomico.sapo.pt/feed/'),
        ('mit_sloan', 'https://sloanreview.mit.edu/feed/'),
    ]
    
    for key, url in source_configs:
        if key in sources:
            source = sources[key]
            print(f"Fetching {source['name']}...")
            result = fetch_rss(url, source['name'], source.get('max_articles', 5))
            result['emoji'] = source.get('emoji', '📄')
            results.append(result)
    
    # Generate report
    report = generate_report(results, date_str)
    
    # Save report
    report_file = LOG_DIR / f"news_digest_report_{date_short}.md"
    with open(report_file, 'w') as f:
        f.write(report)
    
    print(f"\n✅ Report saved: {report_file}")
    
    # Try email delivery
    email_sent = send_email(report, config, date_str)
    
    # Discord fallback
    if not email_sent:
        print("Attempting Discord fallback...")
        send_discord(report, config)
    
    # Log completion
    with open(log_file, 'a') as f:
        f.write(json.dumps({
            'timestamp': datetime.now().isoformat(),
            'event': 'digest_complete',
            'report_file': str(report_file),
            'email_sent': email_sent,
            'sources': {r['name']: r['status'] for r in results}
        }) + '\n')

if __name__ == '__main__':
    main()
