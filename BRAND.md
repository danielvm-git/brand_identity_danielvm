# Daniel Builds — brand notes

**Domain:** [danielvm.net](https://danielvm.net)  
**Tokens:** `brand/tokens.css`  
**Preview:** open `index.html` in a browser, or from this folder run `python3 -m http.server 8080` and visit <http://localhost:8080>

## Typography

| Role | Family | Rationale |
|------|--------|-----------|
| **Display (logo, h1–h2)** | [Bricolage Grotesque](https://fonts.google.com/specimen/Bricolage+Grotesque) | Open source (OFL), variable, strong personality without “template” vibes. |
| **Body (paragraphs, UI)** | [Source Serif 4](https://fonts.google.com/specimen/Source+Serif+4) | OFL, excellent reading on long text, well-hinted, broad browser support. |

**Loading:** use Google Fonts’ combined `link` in `tokens.css` header, `font-display: swap`, and fallbacks: `ui-sans-serif` / `Georgia` in CSS.

**Avoid for this brand:** defaulting to Inter, Roboto, or Arial as the *main* look — the pair above is the identity.

## Color

- **Background / paper:** warm off-white `#f4f0e8` so the site feels like a studio desk, not a cold SaaS.
- **Ink:** near-black slate `#1a1d21` for text (strong contrast on off-white, WCAG-friendly for body size).
- **Accent:** deep teal `#0d6b6b` for links, focus, and primary actions — distinctive, not the usual blue or purple-gradient cliché; pairs well with warm paper.
- **Dark mode:** optional; flip in `data-theme="dark"` in tokens.

## Non-negotiables (agents)

- Use CSS variables from `brand/tokens.css` — do not introduce a second primary accent in UI without updating tokens.
- Keep “Daniel Builds” and danielvm.net naming consistent in visible copy and meta.
