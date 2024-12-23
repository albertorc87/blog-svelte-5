import 'dotenv/config';
import { usersTable } from '$lib/server/db/schema';
import { eq } from 'drizzle-orm';
import { drizzle } from 'drizzle-orm/node-postgres';
import { hashPassword, verifyPasswordHash } from '$lib/utils/password-utils';

const db = drizzle(process.env.DATABASE_URL || '');

async function main() {
	const passwordRaw = 'admin123';

	const user: typeof usersTable.$inferInsert = {
		username: 'Alberto',
		password: await hashPassword(passwordRaw),
		email: 'alberto@cosasdedevs.com',
		isAdmin: true
	};

	await db.insert(usersTable).values(user);
	console.log('New user created!');

	const getUsers = await db.select().from(usersTable).where(eq(usersTable.email, user.email));

	if (!getUsers[0]) {
		throw new Error('User not exists');
	}

	const isValidPassword = await verifyPasswordHash(getUsers[0].password, passwordRaw);

	if (!isValidPassword) {
		throw new Error('Invalid password');
	}

	console.log('User has been created successfully');
}
main();
