import type { PageServerLoad } from './$types';
import { getPosts } from '$lib/server/db/posts';
import { getFirstParagraph } from '$lib/utils/html';

export const load: PageServerLoad = async () => {

    const posts = await getPosts();

    return {
        posts: posts.map((post) => {
            post.content = getFirstParagraph(post.content);
            return post;
        })
    }

};