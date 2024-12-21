import type { InferSelectModel } from "drizzle-orm";
import { boolean, integer, pgTable, text, timestamp, varchar } from "drizzle-orm/pg-core";

export const usersTable = pgTable("users", {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    username: varchar({ length: 255 }).notNull(),
    password: varchar({ length: 255 }).notNull(),
    email: varchar({ length: 255 }).notNull().unique(),
    createdAt: timestamp("created_at", {
        withTimezone: true,
        mode: "date"
    }).defaultNow().notNull(),
    isActive: boolean("is_active").default(true).notNull(),
    isAdmin: boolean("is_admin").default(false).notNull(),
    avatar: varchar('avatar', { length: 255 }),
});

export const sessionsTable = pgTable("sessions", {
    id: text("id").primaryKey(),
    userId: integer("user_id")
        .notNull()
        .references(() => usersTable.id),
    expiresAt: timestamp("expires_at", {
        withTimezone: true,
        mode: "date"
    }).notNull()
});

export const postsTable = pgTable("posts", {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
        .notNull()
        .references(() => usersTable.id),
    title: varchar({ length: 255 }).notNull().unique(),
    slugUrl: varchar('slug_url', { length: 255 }).notNull().unique(),
    imageHeader: varchar('image_header', { length: 255 }).notNull(),
    content: text().notNull(),
    createdAt: timestamp("created_at", {
        withTimezone: true,
        mode: "date"
    }).defaultNow().notNull(),
    isDraft: boolean("is_draft").default(true).notNull(),
});

export const commentsTable = pgTable("comments", {
    id: integer().primaryKey().generatedAlwaysAsIdentity(),
    userId: integer("user_id")
        .notNull()
        .references(() => usersTable.id),
    postId: integer("post_id")
        .notNull()
        .references(() => postsTable.id),
    content: text().notNull(),
    createdAt: timestamp("created_at", {
        withTimezone: true,
        mode: "date"
    }).defaultNow().notNull(),
});

export type UserEntity = InferSelectModel<typeof usersTable>;
export type SessionEntity = InferSelectModel<typeof sessionsTable>;
export type PostEntity = InferSelectModel<typeof postsTable>;
export type CommentEntity = InferSelectModel<typeof commentsTable>;