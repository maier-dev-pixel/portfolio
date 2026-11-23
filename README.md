# Maier — Portfolio

An elegant, responsive single-page portfolio for a computer science student.
Built with plain HTML, CSS, and JavaScript — no build step required.

Published at: **https://maier-dev-pixel.github.io/**

## Customize it

Search the files for `EDIT` to find everything you should personalize:

- `index.html`
  - Hero introduction sentence
  - About bio and "Currently" list
  - Experience timeline entries (currently sample content)
  - Email address (`hello@example.com`) and LinkedIn URL
- `script.js`
  - `CONTACT_EMAIL` — must match the email in `index.html`
- Colors, fonts, and spacing live in the `:root` variables at the top of `styles.css`

## Contact form

The form uses `mailto:` so it works on GitHub Pages without a backend. Replace
`hello@example.com` with your real email, or swap it for a service like
Formspree / Netlify Forms if you want an in-page submission.

## Local preview

Just open `index.html` in a browser, or serve the folder:

```bash
python -m http.server 8000
```

Then visit http://localhost:8000.
