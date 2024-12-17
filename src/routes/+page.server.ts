import type { PageServerLoad } from './$types';
import db from '$lib/server/db/index';
import { postsTable } from '$lib/server/db/schema';
import { desc, eq } from 'drizzle-orm';

export const load: PageServerLoad = async () => {

    const posts = await db.select().from(postsTable)
        .where(eq(postsTable.isDraft, false)).orderBy(desc(postsTable.createdAt)).limit(5).offset(0);

    return {
        posts: posts.map((post) => {
            post.content = getFirstParagraph(post.content);
            return post;
        })
    }

};

function getFirstParagraph(htmlContent: string) {
    const match = htmlContent.match(/<p>.*?<\/p>/s);
    return match ? match[0] : '';
}