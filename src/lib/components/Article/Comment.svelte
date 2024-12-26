<script lang="ts">
	import defaultAvatar from '$assets/default-avatar.jpg';
	import type { CommentWithUser } from '$lib/server/db/db-comments';

	interface CommentProps {
		comment: CommentWithUser;
	}

	let { comment }: CommentProps = $props();
</script>

<div class="comments">
	<div class="comment">
		<div><img class="avatar" src={comment.avatar || defaultAvatar} alt="Avatar" /></div>
		<div class="comment-user-info">
			<div><strong>{comment.username}</strong></div>
			<div class="comment-date">
				{comment.createdAt.toLocaleDateString('en-US', {
					day: '2-digit',
					month: 'short',
					year: 'numeric'
				})}
			</div>
		</div>
	</div>
	<div class="comment-content">
		{comment.content}
	</div>
</div>

<style>
	.comments {
		display: flex;
		gap: 1rem;
		max-width: 700px;
		margin: 0 auto;
		margin-top: 1rem;
		border: 1px solid #ccc;
		border-radius: 0.625em;
		padding: 1rem;
	}
	.comment {
		display: flex;
		text-align: center;
		align-items: center;
		padding: 5px;
		gap: 0.7rem;
	}

	.comment .avatar {
		width: 35px;
		height: 35px;
		cursor: pointer;
		border-radius: 50%;
		object-fit: cover;
	}

	.comment .comment-user-info {
		text-align: left;
		display: flex;
		flex-direction: column;
		font-size: 0.8rem;
		width: auto;
		white-space: nowrap;
	}

	.comment-date {
		width: 100%;
		display: block;
		font-size: 0.6rem;
	}

	.comment-content {
		text-align: justify;
		gap: 0.5rem;
		color: #5a5a5a;
	}
</style>
