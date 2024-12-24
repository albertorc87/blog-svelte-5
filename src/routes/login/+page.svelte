<script lang="ts">
	import { Button } from '$components';
	import MessageError from '$components/MessageError.svelte';

	import type { ActionData } from './$types';

	let { form }: { form: ActionData } = $props();

	let email: string = $state('');
	let password: string = $state('');
	let messageError: string | undefined = $state(form?.error);

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

<h1>Login</h1>
<form method="POST" class="form-auth">
	<div>
		<label for="email">Email</label>
		<input name="email" type="email" bind:value={email} onfocus={clearError} />
	</div>
	<div>
		<label for="password">Contraseña</label>
		<input name="password" type="password" bind:value={password} onfocus={clearError} />
	</div>
	<Button onclick={send} isDisabled={email.trim().length === 0 || password.trim().length === 0}
		>Login</Button
	>
	{#if messageError}
		<MessageError message={messageError} />
	{/if}
</form>
