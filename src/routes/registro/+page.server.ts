import { createUser, existsEmailUser, getUserByEmailAndPassword } from '$lib/server/db/db-users';
import { fail, redirect } from '@sveltejs/kit';
import type { PageServerLoad, Actions } from './$types';
import {
    createSession,
    generateSessionToken,
    sessionCookieName,
    setSessionTokenCookie,
    validateSessionToken
} from '$lib/server/db/auth';
import { convertToString } from '$lib/utils/form-utils';
import { isValidEmail } from '$lib/utils/validations';

export const load: PageServerLoad = async ({ cookies }) => {
    const infoSession = await validateSessionToken(cookies.get(sessionCookieName));

    if (infoSession.session !== null) {
        redirect(302, '/');
    }
};

export const actions = {
    default: async (event) => {
        const data = await event.request.formData();

        const values = {
            email: convertToString(data.get('email')),
            username: convertToString(data.get('username')),
            password: convertToString(data.get('password'))
        };

        if (
            !data.get('email') ||
            !data.get('username') ||
            !data.get('password') ||
            !data.get('repeatPassword')
        ) {
            return fail(400, {
                error: 'Debes enviar el nombre de usuario, email y la contraseña',
                values
            });
        }

        if (data.get('password') !== data.get('repeatPassword')) {
            return fail(400, { error: 'Las contraseñas no coinciden', values });
        }

        if (!isValidEmail(convertToString(data.get('email')))) {
            return fail(400, { error: 'El email enviado no es válido', values });
        }

        const username = convertToString(data.get('username')).trim();
        const email = convertToString(data.get('email')).trim();
        const password = convertToString(data.get('password')).trim();

        if (username.length < 3 || username.length > 50) {
            return fail(400, {
                error: 'El nombre de usuario debe tener entre 3 y 50 caracteres',
                values
            });
        }

        if (password.length < 3 || password.length > 20) {
            return fail(400, {
                error: 'El nombre de usuario debe tener entre 3 y 20 caracteres',
                values
            });
        }

        try {

            const existsEmail = await existsEmailUser(email);

            if (existsEmail) {
                return fail(400, {
                    error: 'El email enviado ya está en uso',
                    values
                });
            }

            const user = await createUser(username, password, email);

            const token = await generateSessionToken();
            const dataSession = await createSession(token, user.id);

            setSessionTokenCookie(event, token, dataSession.expiresAt);
            return { success: true };
        } catch (err) {
            return fail(400, {
                error: 'Ha ocurrido un error en la creación del usuario, por favor intentalo más tarde',
                values
            });
        }
    }
} satisfies Actions;
