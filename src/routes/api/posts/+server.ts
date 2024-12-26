import { json, type RequestHandler } from '@sveltejs/kit';
import { getPosts } from '$lib/server/db/db-posts';
import { getFirstParagraph } from '$lib/utils/html';

export const GET: RequestHandler = async ({ url }) => {
	
    const offset: number = Number(url.searchParams.get('offset') || 0);

	if (typeof offset !== 'number' || offset < 0) {
		return json(
			{ error: 'Offset must be a number and greater than or equal to 0' },
			{ status: 400 }
		);
	}

	const posts = await getPosts(5, offset);

	return json({
		posts: posts.map((post) => {
			post.content = getFirstParagraph(post.content);
			return post;
		})
	});
};
