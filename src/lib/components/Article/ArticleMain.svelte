<script lang="ts">
	import { ArticleFooter } from '$components';
import type { PostWithUser } from '$lib/server/db/posts';

	let { post }: { post: PostWithUser } = $props();
</script>

<article class="post">
	<div class="image-post">
		<a href={`/blog/${post.slugUrl}`}>
			<img src={post.imageHeader} alt="" />
		</a>
	</div>
	<div class="title-post">
		<a href={`/blog/${post.slugUrl}`}>
			<h2>{post.title}</h2>
		</a>
	</div>
	<div class="content-post">
		{@html post.content}
	</div>
	<ArticleFooter slug={post.slugUrl} username={post.username} createdAt={post.createdAt} avatar={post.avatar} />
</article>

<style>
	.title-post h2 {
		margin-top: 1rem;
		font-size: 2.5rem;
	}
</style>
