<script lang="ts">
	import { ArticleDetail } from '$components';
	import type { PageData } from './$types';

	let { data }: { data: PageData } = $props();
</script>

<ArticleDetail post={data.post} />
