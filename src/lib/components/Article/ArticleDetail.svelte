<script lang="ts">
	import { ArticleFooter } from '$components';
	import type { PostWithUser } from '$lib/server/db/db-posts';
	let { post }: { post: PostWithUser } = $props();
</script>

<article class="post">
	<div class="image-post">
		<img src={`../${post.imageHeader}`} alt="" />
	</div>
	<div class="title-post">
		<h1>{post.title}</h1>
	</div>
	<div class="separator"></div>
	<div class="content-post">
		{@html post.content}
	</div>
	<ArticleFooter
		slug={post.slugUrl}
		username={post.username}
		createdAt={post.createdAt}
		avatar={post.avatar}
	/>
</article>

<style>
	.title-post h1 {
		margin-top: 1rem;
		font-size: 2.7rem;
		color: #fe5c71;
	}
</style>
