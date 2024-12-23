import { hash, verify } from '@node-rs/argon2';

export async function hashPassword(password: string): Promise<string> {
	return await hash(password);
}

export async function verifyPasswordHash(hash: string, password: string): Promise<boolean> {
	return await verify(hash, password);
}
