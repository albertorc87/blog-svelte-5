<script lang="ts">
	import Menu from '$assets/menu.png';
	import Logo from '$assets/logo.png';
	import HeaderImg from '$assets/header.png';
	import { page } from '$app/stores';

	interface HeaderProps {
		username?: string;
	}

	let { username }: HeaderProps = $props();
</script>

<header>
	<div class="content-nav">
		<div class="menu container">
			<a href="/" class="logo">
				<img src={Logo} alt="Logo" />
			</a> <input type="checkbox" id="menu" />
			<label for="menu">
				<img src={Menu} class="menu-icon" alt="Menu responsive" />
			</label>
			<nav class="navbar">
				<ul>
					<li class:border-navbar={$page.url.pathname === '/'}><a href="/">Inicio</a></li>
					<li class:border-navbar={$page.url.pathname === '/contacto'}>
						<a href="/contacto">Contacto</a>
					</li>

					{#if username}
						<li class:border-navbar={$page.url.pathname === '/mi-cuenta'}>
							<a href="/">Hola, {username}</a>
						</li>
						<li class:border-navbar={$page.url.pathname === '/logout'}>
							<form action="/logout" method="post">
								<button>Logout</button>
							</form>
						</li>
					{:else}
						<li class:border-navbar={$page.url.pathname === '/login'}>
							<a href="/login">Login</a>
						</li>
						<li class:border-navbar={$page.url.pathname === '/registro'}>
							<a href="/registro">Registro</a>
						</li>
					{/if}
				</ul>
			</nav>
		</div>
	</div>
	<div class="content-second-header">
		<a href="/">
			<img id="image-header" src={HeaderImg} alt="Cabecera cosasdedevs" />
		</a>
		{#if $page.url.pathname === '/'}
			<h1>Artítulos y tutoriales del mundo tech</h1>
		{/if}
	</div>
</header>

<style>
	.container {
		max-width: 1000px;
		margin: 0 auto;
	}

	.content-second-header {
		display: flex;
		flex-direction: column;
		align-items: center;
		margin: 3rem 0;
		padding: 0 10px;
	}

	.content-second-header img {
		max-width: 100%;
	}

	.content-second-header h1 {
		margin-top: 1rem;
		text-align: center;
	}

	.content-nav {
		background-color: black;
		min-height: 61px;
	}

	.menu {
		position: absolute;
		left: 0;
		right: 0;
		display: flex;
		align-items: center;
		justify-content: space-between;
	}

	.logo {
		font-size: 25px;
		color: #f7a800;
		text-transform: uppercase;
		font-weight: bold;
	}

	.logo img {
		width: 40px;
	}

	.menu .navbar ul li {
		position: relative;
		float: left;
		transition: 0.3s;
	}

	.border-navbar {
		box-shadow: inset 0px -10px 0px 0px #ffffff; /* Sombra dentro del elemento */
	}

	.menu .navbar ul li:hover {
		background-color: white;
	}

	.menu .navbar ul li a {
		font-size: 18px;
		padding: 20px;
		color: white;
		display: block;
		font-weight: bold;
		transition: 0.3s;
	}

	.menu .navbar ul li a:hover {
		color: #0f0f0f;
	}

	.menu .navbar ul li form button {
		font-size: 18px;
		padding: 20px;
		color: white;
		border: none;
		background: none;
		display: block;
		font-weight: bold;
		transition: 0.3s;
		cursor: pointer;
		font-family: 'Open Sans', sans-serif;
	}

	.menu .navbar ul li form button:hover {
		color: #0f0f0f;
	}

	#menu {
		display: none;
	}

	.menu-icon {
		width: 25px;
	}

	.menu label {
		cursor: pointer;
		display: none;
	}

	@media (max-width: 800px) {
		.content-second-header h1 {
			font-size: 1.2rem;
		}
		.content-nav {
			min-height: 70px;
		}

		.menu {
			top: 0;
			padding: 20px;
		}

		.menu label {
			display: initial;
		}

		.menu .navbar {
			position: absolute;
			top: 100%;
			left: 0;
			right: 0;
			background-color: black;
			display: none;
		}

		.menu .navbar ul li {
			width: 100%;
		}

		#menu:checked ~ .navbar {
			display: initial;
		}
	}
</style>
