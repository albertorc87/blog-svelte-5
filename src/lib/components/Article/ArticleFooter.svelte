<script lang="ts">
	import { page } from "$app/stores";
	import Icon from "@iconify/svelte";
	import defaultAvatar from '$assets/default-avatar.jpg';

	interface ArticleFooterProps {
        slug: string;
        username: string;
        createdAt: Date;
        avatar: string | null;
    }
	let { slug, username, createdAt, avatar }: ArticleFooterProps = $props();

    const postUrl = encodeURIComponent(`${$page.url.origin}/blog/${slug}`)

    const urlFacebook = `https://www.facebook.com/sharer/sharer.php?u=${postUrl}`;
    const urlTwitter = `https://twitter.com/intent/tweet?text=${postUrl}`;
</script>

<div class="separator"></div>
<div class="footer-post">
    <div class="footer-post-content-user">
        <div><img src={avatar || defaultAvatar} alt="Avatar" /></div>
        <div class="footer-post-content-user-info">
            <div><strong>{username}</strong></div>
            <div>
                {createdAt.toLocaleDateString('en-US', {
                    day: '2-digit',
                    month: 'short',
                    year: 'numeric'
                })}
            </div>
        </div>
    </div>
    <div class="footer-post-content-social">
        <a href={urlTwitter} target="_blank" rel="noopener noreferrer">
            <Icon icon="entypo-social:twitter-with-circle" width={'35'} />
        </a>
        <a href={urlFacebook} target="_blank" rel="noopener noreferrer">
            <Icon icon="entypo-social:facebook-with-circle" width={'35'} />
        </a>
    </div>
</div>

<style>
    
	.footer-post {
		width: 100%;
		display: flex;
		justify-content: space-between;
		align-items: center;
        margin-bottom: 2.5rem;
	}

	.footer-post img {
		width: 35px;
		height: 35px;
		cursor: pointer;
		border-radius: 50%;
		object-fit: cover;
	}

	.footer-post-content-user {
		display: flex;
		gap: 0.7rem;
		align-items: center;
	}

	.footer-post-content-user-info {
		display: flex;
		text-align: left;
		flex-direction: column;
		font-size: 0.7rem;
	}
</style>