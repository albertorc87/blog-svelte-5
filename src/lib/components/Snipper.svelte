<div class="loading">
	<div class="spinner"></div>
</div>

<style>
	.loading {
		text-align: center;
		padding: 1rem;
	}

	.spinner {
		width: 30px;
		height: 30px;
		border: 4px solid #ccc;
		border-top-color: #3498db;
		border-radius: 50%;
		animation: spin 1s linear infinite;
		margin: 0 auto;
	}

	@keyframes spin {
		to {
			transform: rotate(360deg);
		}
	}
</style>
