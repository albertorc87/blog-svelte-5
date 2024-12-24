<script lang="ts">
	import { Button } from '$components';
	import MessageError from '$components/MessageError.svelte';

	import type { ActionData } from './$types';

	let { form }: { form: ActionData } = $props();

	let username: string = $state(form?.values?.username || '');
	let email: string = $state(form?.values?.email || '');
	let password: string = $state(form?.values?.password || '');
	let repeatPassword: string = $state('');
	let messageError: string | undefined = $state(form?.error);

	let isButtonDisabled: boolean = $derived(
		email.trim().length === 0 ||
			password.trim().length === 0 ||
			username.trim().length === 0 ||
			repeatPassword.trim().length === 0
	);

	function send(event: MouseEvent) {
		if (email.trim().length === 0 || password.trim().length === 0) {
			event.preventDefault();
			return;
		}
	}

	function clearError() {
		messageError = undefined;
	}
</script>

<h1>Registro</h1>
<form method="POST" class="form-auth">
	<div>
		<label for="email">Nombre de usuario</label>
		<input name="username" type="text" bind:value={username} onfocus={clearError} />
	</div>
	<div>
		<label for="email">Email</label>
		<input name="email" type="email" bind:value={email} onfocus={clearError} />
	</div>
	<div>
		<label for="password">Contraseña</label>
		<input name="password" type="password" bind:value={password} onfocus={clearError} />
	</div>
	<div>
		<label for="repeatPassword">Repetir contraseña</label>
		<input name="repeatPassword" type="password" bind:value={repeatPassword} onfocus={clearError} />
	</div>
	<Button onclick={send} isDisabled={isButtonDisabled}>Login</Button>
	{#if messageError}
		<MessageError message={messageError} />
	{/if}
</form>
