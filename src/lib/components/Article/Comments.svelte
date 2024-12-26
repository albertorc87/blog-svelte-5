<script lang="ts">
	import { page } from '$app/stores';
	import { Button, Snipper } from '$components';
	import Popup, { type TypePopup } from '$components/Popup.svelte';
	import type { CommentWithUser } from '$lib/server/db/db-comments';
	import { onMount } from 'svelte';
	import Comment from './Comment.svelte';
	import { loadPaginateData } from '$lib/utils/fecth-api-data';

	interface CommentsProps {
		postId: number;
		username?: string;
	}

	let { postId, username }: CommentsProps = $props();
	let comments: CommentWithUser[] = $state([]);
	let offset: number = $state(0);
	let hasComments: boolean = $state(true);
	let isLoading: boolean = $state(false);
	let commentText: string = $state('');
	let messagePopup: string = $state('');
	let messageTypePopup: TypePopup = $state('success');
	let isPopupVisible: boolean = $state(false);
	let buttonText: string = $state('Enviar');

	async function saveComment(event: MouseEvent) {
		event.preventDefault();

		if (!commentText) {
			return;
		}

		buttonText = 'Guardando...';
		const response = await fetch(`${$page.url.origin}/api/posts/${postId}/comments`, {
			method: 'POST',
			headers: {
				Accept: 'application/json',
				'Content-Type': 'application/json'
			},
			body: JSON.stringify({ content: commentText })
		});
		buttonText = 'Enviar';

		if (response.ok) {
			commentText = '';
			const commentResponse: CommentWithUser = await response.json();

			commentResponse.createdAt = new Date(commentResponse.createdAt);
			comments = [commentResponse, ...comments];
			isPopupVisible = true;
			messageTypePopup = 'success';
			messagePopup = 'El comentario se ha creado exitosamente';
			setTimeout(() => {
				isPopupVisible = false;
			}, 3000);
		} else {
			isPopupVisible = true;
			messageTypePopup = 'error';
			const commentResponse = await response.json();
			messagePopup = commentResponse.error;
			setTimeout(() => {
				isPopupVisible = false;
			}, 3000);
		}
	}

	async function loadComments() {
		if (!hasComments || isLoading) {
			return;
		}

		isLoading = true;
		try {
			const response = await loadPaginateData(offset, `${$page.url.origin}/api/posts/${postId}/comments`);
			offset += 5;
			if (response.status === 200) {
				const responseComment = await response.json();

				let newComments: CommentWithUser[] = responseComment.comments;
				newComments = newComments.map((comment) => {
					comment.createdAt = new Date(comment.createdAt);
					return comment;
				});

				if (newComments.length === 0) {
					hasComments = false;
				} else {
					comments = [...comments, ...newComments];
					if (newComments.length < 10) {
						hasComments = false;
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
					loadComments();
				}
			},
			{ threshold: 1.0 }
		);

		const target = document.querySelector('#load-more');
		if (target) observer.observe(target);

		return () => observer.disconnect();
	});
</script>

{#if username}
	<div class="form-comments">
		<div>
			<label for="comment">Escribe un comentario:</label>
			<textarea name="comment" id="comment" bind:value={commentText}></textarea>
		</div>
		<Button onclick={saveComment} isDisabled={commentText.trim().length === 0}>{buttonText}</Button>
	</div>
{:else}
	<div class="message-comments">Debes estar autenticado para poder escribir comentarios</div>
{/if}

<h2 class="comment-title">Comentarios</h2>
{#each comments as comment}
	<Comment {comment} />
{/each}

{#if isLoading}
	<Snipper />
{/if}
<div id="load-more" class="load-more"></div>
<Popup type={messageTypePopup} visible={isPopupVisible}>{messagePopup}</Popup>

{#if !hasComments}
	{#if comments.length > 0}
		<div class="message-no-data">No hay más comentarios</div>
	{:else}
		<div class="message-no-data">No hay comentarios</div>
	{/if}
{/if}

<style>

	.comment-title {
		margin-top: 1rem;
		color: #fe5c71;
	}
	
	textarea {
		font-size: 1.2rem;
		width: 100%;
		padding: 1rem;
		border-radius: 0.7rem;
		border: 1px solid #999999;
		background-color: #f0f0f0;
		margin-bottom: 1rem;
		resize: none;
		transition: 0.3s;
	}

	.form-comments {
		max-width: 600px;
		margin: 0 auto;
	}

	.form-comments label {
		display: block;
		width: 100%;
		text-align: left;
		color: #fe5c71;
	}
	.message-comments {
		color: #fe5c71;
		max-width: 100%;
		font-size: 1.1rem;
	}

	.load-more {
		height: 1px;
		margin-bottom: 1rem;
	}

	.message-no-data {
		width: 100%;
		text-align: center;
		font-size: 1.2rem;
		color: #6c6c6c;
		margin-bottom: 1rem;
	}
</style>
