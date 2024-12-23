<script lang="ts">
	import type { Snippet } from 'svelte';

	interface ButtonProps {
		children: Snippet;
		onclick: ((e: MouseEvent) => void) | (() => void);
		isDisabled: boolean;
		className?: string;
	}
	let { children, className, isDisabled, ...props }: ButtonProps = $props();
</script>

<button class={`btn ${className}`} class:btn-disabled={isDisabled} {...props}>
	{@render children()}
</button>

<style>
	.btn {
		font-size: 1.2rem;
		padding: 0.6rem;
		width: 100%;
		font-weight: 700;
		background-color: #347cbb;
		color: #fff;
		border: none;
		border-radius: 5px;
		cursor: pointer;
		transition: 0.3s;
	}

	.btn:hover {
		background-color: #ffaa00;
	}

	.btn-disabled {
		background-color: #757575;
		border-color: #8b8b8b;
		cursor: not-allowed;
	}

	.btn-disabled:hover {
		background-color: #757575;
		border-color: #8b8b8b;
		cursor: not-allowed;
	}
</style>
