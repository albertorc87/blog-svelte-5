import { deleteSessionTokenCookie } from '$lib/server/db/auth';
import { setSessionTokenCookie } from '$lib/server/db/auth';
import { sessionCookieName, validateSessionToken } from '$lib/server/db/auth';
import { redirect, type Handle } from '@sveltejs/kit';

const handleAuth: Handle = async ({ event, resolve }) => {
	const sessionToken = event.cookies.get(sessionCookieName);
	if (!sessionToken) {
		event.locals.user = null;
		event.locals.session = null;
		return resolve(event);
	}

	const { session, user } = await validateSessionToken(sessionToken);

	if (session) {
		setSessionTokenCookie(event, sessionToken, session.expiresAt);
		const restrictedRoutes = ['/login', '/registro'];

		if (session && restrictedRoutes.includes(event.url.pathname)) {
			throw redirect(303, '/');
		}
	} else {
		deleteSessionTokenCookie(event);
	}

	event.locals.user = user;
	event.locals.session = session;

	return resolve(event);
};

export const handle: Handle = handleAuth;
