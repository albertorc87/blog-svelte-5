<script lang="ts">
	import { page } from '$app/stores';
	import { Header } from '$components';
	import type { Snippet } from 'svelte';
	import '../app.css';

	let { children }: { children: Snippet } = $props();

	const username = $page.data.layoutData.username;
</script>

<Header {username} />

<main class="main-container">
	{@render children()}
</main>
