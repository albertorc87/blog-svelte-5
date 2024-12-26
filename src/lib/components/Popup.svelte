<script lang="ts">
	import type { Snippet } from 'svelte';

	export type TypePopup = 'success' | 'error';

	interface PopupProps {
		children: Snippet;
		type: TypePopup;
		visible: boolean;
	}

	let { children, type, visible }: PopupProps = $props();

	const closePopup = () => {
		visible = false;
	};
</script>

<div class="popup {type}" class:show={visible}>
	{@render children()}
	<button class="close-btn" onclick={closePopup}>&times;</button>
</div>

<style>
	.popup {
		position: fixed;
		top: 20px;
		left: 50%;
		transform: translateX(-50%);
		padding: 1rem 2rem;
		border-radius: 8px;
		color: #fff;
		font-size: 1rem;
		box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
		opacity: 0;
		visibility: hidden;
		transition:
			opacity 0.3s,
			visibility 0.3s;
		z-index: 1000;
	}

	.popup.success {
		color: #155724;
		background-color: #d4edda;
		border-color: #c3e6cb;
	}

	.popup.error {
		border: 1px solid #f5c2c7;
		background-color: #f8d7da;
		color: #842029;
	}

	.popup.show {
		opacity: 1;
		visibility: visible;
	}

	.close-btn {
		position: absolute;
		top: 10px;
		right: 10px;
		background: transparent;
		border: none;
		color: #fff;
		font-size: 1.2rem;
		cursor: pointer;
	}

	.close-btn:hover {
		color: #ddd;
	}
</style>
