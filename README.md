# usepathfinder.eu

Source for [usepathfinder.eu](https://usepathfinder.eu) — the site of
[Pathfinder](https://github.com/resolveworks/pathfinder), a native Android
research agent.

Fully static: one prerendered page, no analytics. Built with
[SvelteKit](https://svelte.dev/docs/kit) and
[`@sveltejs/adapter-static`](https://github.com/sveltejs/kit/tree/main/packages/adapter-static),
plain CSS, system fonts. Site-level config (name, url, description, links)
lives in `src/lib/data/site.json`.

## Development

```bash
pnpm install
pnpm dev          # dev server
pnpm build        # prerender the static site into build/
pnpm check        # svelte-check
pnpm preview      # serve the built site locally
```

Screenshots in `static/screenshots/` are emulator captures of the app.
