import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import { getPostBySlugUrl } from '$lib/server/db/posts';

export const load: PageServerLoad = async ({ params }) => {

    const post = await getPostBySlugUrl(params.slug)

	if (post) {
		return {post};
	}

	error(404, 'Not found');
};