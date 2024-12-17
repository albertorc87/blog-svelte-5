import { error } from '@sveltejs/kit';
import type { PageServerLoad } from './$types';
import db from '$lib/server/db/index';
import { postsTable } from '$lib/server/db/schema';
import { desc, eq } from 'drizzle-orm';

export const load: PageServerLoad = async ({ params }) => {

    const post = await db.select().from(postsTable)
            .where(eq(postsTable.slugUrl, params.slug)) || [];

	if (post.length > 0) {
		return {post: post[0]};
	}

	error(404, 'Not found');
};