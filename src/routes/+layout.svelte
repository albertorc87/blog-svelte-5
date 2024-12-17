<script lang="ts">
	import { Header } from '$components';
	import '../app.css';
	let { children } = $props();
</script>

<Header />

<main class="main-container">
{@render children()}
</main>