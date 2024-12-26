import { desc, eq, type InferSelectModel } from "drizzle-orm";
import { db } from "./db";
import { commentsTable, usersTable } from "./schema";

export type CommentWithUser = Pick<
    InferSelectModel<typeof commentsTable>,
    'content' | 'createdAt'
> & {
    username: string;
    avatar: string | null;
};

export async function getCommentsByPostId(idPost: number, limit: number = 5, offset: number = 0): Promise<CommentWithUser[]> {
    return await db
        .select({
            content: commentsTable.content,
            createdAt: commentsTable.createdAt,
            username: usersTable.username,
            avatar: usersTable.avatar
        })
        .from(commentsTable)
        .innerJoin(usersTable, eq(commentsTable.userId, usersTable.id))
        .where(eq(commentsTable.postId, idPost))
        .orderBy(desc(commentsTable.createdAt))
        .limit(limit)
        .offset(offset);
}

export async function createComment(content: string, postId: number, userId: number): Promise<CommentWithUser | null> {
    const comment: typeof commentsTable.$inferInsert = {
        content,
        postId,
        userId,
    };

    const commentId = await db.insert(commentsTable).values(comment).returning({ insertedId: commentsTable.id });
    return await getCommentById(commentId[0].insertedId);

}

export async function getCommentById(commentId: number): Promise<CommentWithUser | null> {
    const result = await db
        .select({
            content: commentsTable.content,
            createdAt: commentsTable.createdAt,
            username: usersTable.username,
            avatar: usersTable.avatar
        })
        .from(commentsTable)
        .innerJoin(usersTable, eq(commentsTable.userId, usersTable.id))
        .where(eq(commentsTable.id, commentId));

    return result[0] || null;
}