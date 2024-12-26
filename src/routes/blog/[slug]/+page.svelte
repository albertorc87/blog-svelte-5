<script lang="ts">
	import { ArticleDetail } from '$components';
	import type { PageData } from './$types';

	interface BlogDetailProps {
		data: PageData;
	}

	let { data }: BlogDetailProps = $props();
</script>

<ArticleDetail post={data.post} username={data.username}/>
