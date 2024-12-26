import { json, type RequestHandler } from '@sveltejs/kit';
import { createComment, getCommentsByPostId } from '$lib/server/db/db-comments';

export const POST: RequestHandler = async ({ request, locals, params }) => {

    if (!locals.user?.id) {
        return json(
			{ error: 'Debes estar autenticado para poder escribir un comentario' },
			{ status: 401 }
		);
    }

    const data = await request.json();

    if (!data?.content) {
        return json(
			{ error: 'Debes estar autenticado para poder escribir un comentario' },
			{ status: 400 }
		);
    }

    if (typeof data.content !== 'string') {
        return json(
			{ error: 'Valor inválido para un comentario' },
			{ status: 400 }
		);
    }

    if (data.content.length < 1 || data.content.length > 1000) {
        return json(
			{ error: 'Un comentario debe tener entre 1 y 1000 caracteres' },
			{ status: 400 }
		);
    }

    const comment = await createComment(data.content, Number(params.id), locals.user.id);

    return json({...comment});
};


export const GET: RequestHandler = async ({ url, params }) => {

    const offset: number = Number(url.searchParams.get('offset') || 0);
    const idPost: number = Number(params.id);

    if (typeof offset !== 'number' || offset < 0) {
        return json(
            { error: 'Offset must be a number and greater than or equal to 0' },
            { status: 400 }
        );
    }

    const comments = await getCommentsByPostId(idPost, 10, offset);

    return json({comments});
};