import { getUserByEmailAndPassword } from '$lib/server/db/db-users';
import { fail, redirect } from '@sveltejs/kit';
import type { PageServerLoad, Actions } from './$types';
import {
	createSession,
	generateSessionToken,
	sessionCookieName,
	setSessionTokenCookie,
	validateSessionToken
} from '$lib/server/db/auth';

export const load: PageServerLoad = async ({ cookies }) => {
	const infoSession = await validateSessionToken(cookies.get(sessionCookieName));

	if (infoSession.session !== null) {
		redirect(302, '/');
	}
};

export const actions = {
	default: async (event) => {
		const data = await event.request.formData();

		if (!data.get('email') || !data.get('password')) {
			return fail(400, { error: 'Debes enviar el email y la contraseña' });
		}

		const email = convertToString(data.get('email'));
		const password = convertToString(data.get('password'));

		try {
			const user = await getUserByEmailAndPassword(email, password);

			const token = await generateSessionToken();
			const dataSession = await createSession(token, user.id);

			setSessionTokenCookie(event, token, dataSession.expiresAt);
			return { success: true };
		} catch (err) {
			return fail(400, { error: 'Email o contraseña incorrectos' });
		}
	}
} satisfies Actions;

function convertToString(value: FormDataEntryValue | null): string {
	return value ? value.toString() : '';
}
