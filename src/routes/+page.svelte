<script lang="ts">
	import { page } from '$app/stores';
	import { ArticleMain, Snipper } from '$components';
	import type { PostWithUser } from '$lib/server/db/db-posts';
	import { onMount } from 'svelte';
	import type { PageData } from './$types';
	import { loadPaginateData } from '$lib/utils/fecth-api-data';

	let { data }: { data: PageData } = $props();

	let posts: PostWithUser[] = $state(data.posts);
	let offset: number = $state(0);
	let isLoading: boolean = $state(false);
	let hasMorePosts: boolean = $state(true);

	async function loadMorePosts() {
		if (!hasMorePosts || isLoading) {
			return;
		}

		isLoading = true;
		offset += 5;
		try {
			const response = await loadPaginateData(offset, `${$page.url.origin}/api/posts`);

			if (response.status === 200) {
				const responsePost = await response.json();

				let newPosts: PostWithUser[] = responsePost.posts;
				newPosts = newPosts.map((post) => {
					post.createdAt = new Date(post.createdAt);
					return post;
				});

				if (newPosts.length === 0) {
					hasMorePosts = false;
				} else {
					posts = [...posts, ...newPosts];
					if (newPosts.length < 5) {
						hasMorePosts = false;
					}
				}
			} else {
				const error = await response.json();
				console.error('Error:', error.error || 'Unexpected error');
			}
		} catch (err) {
			console.error('Network or server error:', err);
		}

		isLoading = false;
	}

	onMount(() => {
		const observer = new IntersectionObserver(
			(entries) => {
				if (entries[0].isIntersecting && !isLoading) {
					loadMorePosts();
				}
			},
			{ threshold: 1.0 }
		);

		const target = document.querySelector('#load-more');
		if (target) observer.observe(target);

		return () => observer.disconnect();
	});
</script>

{#each posts as post}
	<ArticleMain {post} />
{/each}

{#if isLoading}
	<Snipper />
{/if}

<div id="load-more" class="load-more-posts"></div>

{#if !hasMorePosts}
	<div class="message-no-posts">No hay más artículos</div>
{/if}

<style>
	.load-more-posts {
		height: 1px;
		margin-bottom: 1rem;
	}

	.message-no-posts {
		width: 100%;
		text-align: center;
		font-size: 1.2rem;
		color: #6c6c6c;
		margin-bottom: 1rem;
	}
</style>
