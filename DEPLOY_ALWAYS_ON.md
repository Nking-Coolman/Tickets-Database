Always-On Ticket Portal Deployment
Generated: 2026-03-05

Included files:
- index.html
- review_pages/*.png (291 files)

Fastest always-on option (no API): Netlify Drop
1. Open https://app.netlify.com/drop
2. Drag this whole folder onto the page
3. Netlify gives you a live URL immediately

Alternative: Cloudflare Pages
1. Create a Pages project from uploaded static files
2. Upload this folder as the site content

After you get the final public URL:
Run this command to set URL + regenerate QR:
  .venv\Scripts\python.exe DataAnalysisExpert\build_always_on_site_bundle.py --public-url "<YOUR_PUBLIC_URL>" --skip-bundle

Current portal_public_url in settings:
(not set)