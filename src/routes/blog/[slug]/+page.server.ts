import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { getPostBySlugUrl } from '$lib/server/db/db-posts';

export const load: PageServerLoad = async ({ params, locals }) => {
	const post = await getPostBySlugUrl(params.slug);

	if (post) {
		return { post, username: locals.user?.username };
	}

	error(404, 'Not found');
};
