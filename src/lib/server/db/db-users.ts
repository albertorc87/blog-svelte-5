import { eq } from 'drizzle-orm';
import { db } from './db';
import { usersTable, type UserEntity } from './schema';
import { hashPassword, verifyPasswordHash } from '$lib/utils/password-utils';

export async function getUserByEmailAndPassword(
	email: string,
	rawPassword: string
): Promise<UserEntity> {
	const getUsers = await db.select().from(usersTable).where(eq(usersTable.email, email));

	if (!getUsers[0]) {
		throw new Error('User not exists');
	}

	if (!verifyPasswordHash(getUsers[0].password, rawPassword)) {
		throw new Error('Invalid password');
	}

	return getUsers[0];
}

export async function createUser(
	username: string,
	passwordRaw: string,
	email: string
): Promise<UserEntity> {
	const user: typeof usersTable.$inferInsert = {
		username,
		password: await hashPassword(passwordRaw),
		email: email
	};

	await db.insert(usersTable).values(user);

	const getUsers = await db.select().from(usersTable).where(eq(usersTable.email, user.email));
	return getUsers[0];
}

export async function existsEmailUser(email: string): Promise<boolean> {
	const getUsers = await db.select().from(usersTable).where(eq(usersTable.email, email));

	if (!getUsers[0]) {
		return false;
	}

	return true;
}