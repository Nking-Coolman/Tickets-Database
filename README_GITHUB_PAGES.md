# GitHub Pages Staging Folder

This folder is a Pages-ready copy of the validated ticket bundle.

What is already here:

- `index.html`
- `tickets-data.json`
- `ticket-preview-*.png`
- `.nojekyll`

What is intentionally not published here:

- `_deploy/` helper files from the original bundle

How to publish this folder to GitHub Pages:

1. Create a new public GitHub repository.
2. Push the contents of this folder to that repository's `main` branch.
3. In GitHub, open `Settings -> Pages`.
4. Set `Build and deployment` to `Deploy from a branch`.
5. Choose branch `main` and folder `/ (root)`.
6. Wait for GitHub Pages to publish.

Your final Pages URL will usually be one of these:

- `https://<github-username>.github.io/<repo-name>/`
- `https://<github-username>.github.io/` if the repo name is exactly `<github-username>.github.io`

After the final URL is live, update the QR target with:

```powershell
& ".venv/Scripts/python.exe" "DataAnalysisExpert/build_always_on_site_bundle.py" --public-url "<YOUR_GITHUB_PAGES_URL>" --skip-build --skip-bundle
```

If you want a helper to initialize and push this folder, use `publish_to_github_pages.ps1` in the same folder.
