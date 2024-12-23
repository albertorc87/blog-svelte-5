import { redirect } from '@sveltejs/kit';
import { deleteSessionTokenCookie } from '$lib/server/db/auth';
import { invalidateSession } from '$lib/server/db/auth';
import type { Actions } from './$types';

export const actions = {
	default: async (event) => {
		const sessionId = event.locals.session?.id;

		if (!sessionId) {
			redirect(302, '/');
		}

		invalidateSession(sessionId);
		deleteSessionTokenCookie(event);

		event.locals.session = null;
		event.locals.user = null;

		redirect(302, '/');
	}
} satisfies Actions;
