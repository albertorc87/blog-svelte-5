import { json } from '@sveltejs/kit';
import type { RequestHandler } from './$types';
import { getPosts } from '$lib/server/db/db-posts';
import { getFirstParagraph } from '$lib/utils/html';

export const POST: RequestHandler = async ({ request }) => {
	const { offset } = await request.json();

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
