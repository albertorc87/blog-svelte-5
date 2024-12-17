<script lang="ts">
	import type { PostEntity } from "$lib/server/db/schema";


	let { post }: { post: PostEntity } = $props();
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
		<div class="footer-post"></div>
	</article>
<style>
	.post {
		padding: 0 1rem;
	}

	.title-post h2 {
		margin-top: 1rem;
		font-size: 2.5rem;
	}

	.content-post {
		margin: 1rem 0;
		max-width: 750px;
	}

	.footer-post {
		border-top: 1px solid #c0c0c0;
		margin: 1rem 0;
	}
</style>
