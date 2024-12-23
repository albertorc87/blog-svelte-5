<script lang="ts">
	import { Button } from '$components';
	import MessageError from '$components/MessageError.svelte';

	import type { PageData, ActionData } from './$types';

	let { form }: { data: PageData; form: ActionData } = $props();

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
<form method="POST">
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

<style>
	form {
		max-width: 400px;
		margin: 0 auto;
	}
	form div {
		display: flex;
		flex-direction: column;
	}
	label {
		text-align: left;
		width: 100%;
		margin-bottom: 0.5rem;
	}
	input {
		font-size: 1.2rem;
		width: 100%;
		padding: 0.5rem;
		border-radius: 5px;
		border: 1px solid #999999;
		background-color: #f0f0f0;
		margin-bottom: 1rem;
	}
</style>
