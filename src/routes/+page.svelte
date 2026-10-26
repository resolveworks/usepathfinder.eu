<script>
	import site from '#lib/data/site.json';

	const title = `${site.name} — native Android research agent`;

	const jsonLd = {
		'@context': 'https://schema.org',
		'@type': 'SoftwareApplication',
		name: site.name,
		applicationCategory: 'MobileApplication',
		operatingSystem: 'Android 14+',
		url: `${site.url}/`,
		downloadUrl: `${site.releases}/latest`,
		license: 'https://www.gnu.org/licenses/gpl-3.0.html',
		offers: { '@type': 'Offer', price: '0', priceCurrency: 'USD' }
	};

	const jsonLdTag = `<script type="application/ld+json">${JSON.stringify(jsonLd)}<\/script>`;
</script>

<svelte:head>
	<title>{title}</title>
	<meta name="description" content={site.description} />
	<meta name="theme-color" content="#fafafa" media="(prefers-color-scheme: light)" />
	<meta name="theme-color" content="#101014" media="(prefers-color-scheme: dark)" />
	<link rel="canonical" href={`${site.url}/`} />
	<meta property="og:type" content="website" />
	<meta property="og:url" content={`${site.url}/`} />
	<meta property="og:site_name" content={site.name} />
	<meta property="og:title" content={title} />
	<meta property="og:description" content={site.description} />
	<meta name="twitter:card" content="summary" />
	<meta name="twitter:title" content={title} />
	<meta name="twitter:description" content={site.description} />
	{@html jsonLdTag}
</svelte:head>

<div class="page">
	<header>
		<a class="wordmark" href="/">{site.name}</a>
		<nav>
			<a href="#install">Install</a>
			<a href={site.github}>GitHub</a>
		</nav>
	</header>

	<main>
		<section class="hero">
			<h1>{site.name}</h1>
			<p class="tagline">
				A native Android research agent. A chat app that lets a language model search the web
				and read pages to answer — talking directly to the model providers you configure.
				There is no Pathfinder server in between.
			</p>
			<p class="actions">
				<a class="button" href={`${site.releases}/latest`}>Download APK</a>
				<a class="button secondary" href={site.github}>Source</a>
			</p>
			<p class="note">Android 14 or newer. Signed APKs from GitHub Releases.</p>
		</section>

		<section class="screenshots" aria-label="Screenshots">
			<figure>
				<img
					src="/screenshots/01.png"
					alt="The settings screen: default model and thinking level, providers, web search keys, reasoning display, and system prompt."
					width="1080"
					height="2424"
				/>
			</figure>
			<figure>
				<img
					src="/screenshots/02.png"
					alt="The providers screen: an alphabetical list of providers from Ant Ling to GitHub Copilot, DeepSeek marked configured."
					width="1080"
					height="2424"
				/>
			</figure>
			<figure>
				<img
					src="/screenshots/03.png"
					alt="The completed answer: what Pathfinder is, its key features, privacy and license."
					width="1080"
					height="2424"
				/>
			</figure>
		</section>
		<p class="caption">
			Right: asked “What’s this: github.com/resolveworks/pathfinder”. It fetches the page, notices it is
			running inside the very harness it is describing, and answers concisely.
		</p>

		<section id="features">
			<h2>Features</h2>
			<h3>Providers</h3>
			<p>
				Sign in with API keys or existing subscriptions — Anthropic (Claude Pro/Max), OpenAI
				(ChatGPT Plus/Pro), GitHub Copilot, Kimi, xAI (Grok/X Premium), OpenRouter — or point it
				at most major providers and aggregators. Switch models mid-conversation.
			</p>
			<h3>Tools</h3>
			<p>
				<code>web_search</code> (Brave Search API — bring your own key) and
				<code>web_fetch</code> (renders the page, returns its readable content as markdown).
			</p>
			<h3>Sessions</h3>
			<p>
				Stored on device as plain JSONL. Branch any turn into a new line of conversation, search
				across sessions, export or share them.
			</p>
			<h3>Runtime</h3>
			<p>
				Automatic retries, automatic compaction when a conversation outgrows the model’s context
				window, reasoning display with per-model thinking-level control, and a custom system
				prompt (persona).
			</p>
		</section>

		<section id="privacy">
			<h2>Privacy</h2>
			<p>
				No analytics, crash reporting, or telemetry. Traffic goes only to the providers you
				configure, to Brave when search is set up, and to pages the agent fetches. Credentials
				are stored encrypted behind the Android Keystore and never leave the device except to
				authenticate with their provider.
			</p>
		</section>

		<section id="install">
			<h2>Install</h2>
			<p>
				Requires Android 14 or newer. Download the signed APK from the latest
				<a href={site.releases}>release</a>, or track releases with
				<a href="https://github.com/ImranR98/Obtainium">Obtainium</a>:
			</p>
			<pre><code>{site.github}</code></pre>
		</section>

		<section id="built">
			<h2>How it’s built</h2>
			<p>
				The chat runtime is a selective Kotlin port of
				<a href="https://pi.dev">pi</a>’s agent runtime — messages, streaming, tool calls,
				reasoning, usage, auth and OAuth, retry, compaction, and session persistence and
				recovery — mirroring pi’s package layout. The Android layer (Jetpack Compose, Material
				3) and the web tools are Pathfinder’s own. GPL-3.0.
			</p>
		</section>
	</main>

	<footer>
		<p>
			<a href={site.github}>Source</a> · GPL-3.0 · Runtime ported from
			<a href="https://pi.dev">pi</a> (MIT)
		</p>
	</footer>
</div>
