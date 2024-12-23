<script lang="ts">
	interface MessageErrorProps {
		message: string;
	}

	let { message }: MessageErrorProps = $props();
</script>

<div class="error-message">{message}</div>

<style>
	.error-message {
		background-color: #f8d7da;
		color: #842029;
		padding: 15px;
		border: 1px solid #f5c2c7;
		border-radius: 5px;
		font-size: 14px;
		margin: 10px 0;
	}
</style>
