<script lang="ts">
	import { Article } from '$components';
import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<Article post={data.post} />