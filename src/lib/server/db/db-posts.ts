import { eq, and, type InferSelectModel, desc } from 'drizzle-orm';
import { postsTable, usersTable } from './schema';
import { db } from './db';

export type PostWithUser = Pick<
	InferSelectModel<typeof postsTable>,
	'id' | 'title' | 'content' | 'createdAt' | 'imageHeader' | 'slugUrl'
> & {
	username: string;
	avatar: string | null;
};

export async function getPostBySlugUrl(slugUrl: string): Promise<PostWithUser | undefined> {
	const result = await db
		.select({
			id: postsTable.id,
			title: postsTable.title,
			content: postsTable.content,
			createdAt: postsTable.createdAt,
			imageHeader: postsTable.imageHeader,
			slugUrl: postsTable.slugUrl,
			username: usersTable.username,
			avatar: usersTable.avatar
		})
		.from(postsTable)
		.innerJoin(usersTable, eq(postsTable.userId, usersTable.id))
		.where(and(eq(postsTable.isDraft, false), eq(postsTable.slugUrl, slugUrl)));

	return result[0];
}

export async function getPosts(limit: number = 5, offset: number = 0): Promise<PostWithUser[]> {
	return await db
		.select({
			id: postsTable.id,
			title: postsTable.title,
			content: postsTable.content,
			createdAt: postsTable.createdAt,
			imageHeader: postsTable.imageHeader,
			slugUrl: postsTable.slugUrl,
			username: usersTable.username,
			avatar: usersTable.avatar
		})
		.from(postsTable)
		.innerJoin(usersTable, eq(postsTable.userId, usersTable.id))
		.where(eq(postsTable.isDraft, false))
		.orderBy(desc(postsTable.createdAt))
		.limit(limit)
		.offset(offset);
}
