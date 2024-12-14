
INSERT INTO posts ("title", "image_header", "content", "user_id", "created_at", "slug_url", "is_draft") VALUES
('Crea una Web Fullstack con Svelte 5 y SvelteKit', 'posts/web-fullstack-svelte-5-sveltekit.png', '<p>En este tutorial con <strong>Svelte 5</strong> y <strong>SvelteKit</strong> aprenderás a desarrollar un blog fullstack donde los usuarios podrán registrarse, iniciar sesión, escribir comentarios y los administradores podrán redactar posts.</p><h2>Diferencias entre Svelte 5 y SvelteKit</h2><p><code>Svelte 5</code> y SvelteKit son herramientas relacionadas, pero tienen propósitos distintos y se complementan para el desarrollo de aplicaciones web. Aquí está la diferencia y cómo funcionan juntos:</p><h3><strong>Svelte 5</strong></h3><p>Es un framework de front-end centrado en la creación de interfaces de usuario altamente reactivas.&nbsp;</p><p>A diferencia de otros frameworks, <code><strong>Svelte</strong></code> realiza el trabajo pesado durante la etapa de compilación, transformando tu código en JavaScript puro optimizado.&nbsp;</p><p>Esto significa que no hay una gran librería ejecutándose en el navegador, por lo que el rendimiento es superior.</p><ul><li><strong>Usos principales:</strong> Crear componentes, manejar la lógica de la interfaz de usuario y gestionar estados reactivos.</li><li><strong>Fortalezas:</strong> Simplicidad, velocidad y enfoque en una experiencia de desarrollo sin sobrecarga.</li></ul><h3><strong>SvelteKit</strong></h3><p>Es un framework basado en <code><strong>Svelte</strong></code> que proporciona herramientas adicionales para construir aplicaciones web completas, tanto en front-end como back-end.&nbsp;</p><p>Ofrece un sistema de enrutamiento basado en archivos, renderizado en el lado del servidor (SSR), generación de sitios estáticos (SSG), y manejo de datos en endpoints.</p><ul><li><strong>Usos principales:</strong> Crear aplicaciones web con rutas dinámicas, integrar datos desde una API o base de datos, manejar autenticación, y optimizar el SEO con SSR.</li><li><strong>Fortalezas:</strong> Convierte<code> <strong>Svelte</strong></code> en un entorno fullstack con todas las funcionalidades necesarias para el desarrollo web moderno.</li></ul><h3><strong>Cómo funcionan juntos</strong></h3><p><code>Svelte</code> es el núcleo donde defines la lógica de tus componentes y su diseño, mientras que SvelteKit expande estas capacidades para gestionar rutas, llamadas a la API, y la arquitectura general de tu aplicación. En esencia:</p><ol><li><strong>Svelte</strong>: Se utiliza para diseñar y programar los componentes individuales de la UI, como formularios, botones y vistas.</li><li><strong>SvelteKit</strong>: Proporciona la infraestructura para unir estos componentes en una aplicación completa, ofreciendo manejo de rutas, datos dinámicos y renderizado eficiente.</li></ol><p>Por ejemplo, en una aplicación como un blog:</p><ul><li>Con <strong>Svelte</strong> creas componentes como el formulario de login, la lista de posts, o el editor de comentarios.</li><li>Con <strong>SvelteKit</strong> configuras rutas como <code>/login</code>, <code>/posts</code>, o <code>/api/comments</code>, integras bases de datos o autenticación, y decides si los datos deben cargarse en el cliente o renderizarse en el servidor.</li></ul><p>Ambas herramientas juntas te permiten crear aplicaciones web completas con un enfoque modular, eficiente y fácil de escalar.</p><h2>Qué necesito saber para seguir este tutorial</h2><p>Es imprescindible que conozcas <strong>CSS, HTML y JavaScript</strong>. Aunque en este tutorial trabajaremos con TypeScript, si conoces JavaScript será fácil el salto. Si quieres saber más de TypeScript, te dejo estos dos tutoriales donde explico las bases de este lenguaje.</p><p><a target="_blank" rel="noopener noreferrer" href="https://cosasdedevs.com/posts/aprende-typescript-desde-cero-que-es-instalacion-y-tipado/">Aprende TypeScript Desde Cero: Qué es, instalación y tipado</a></p><p><a target="_blank" rel="noopener noreferrer" href="https://cosasdedevs.com/posts/programacion-orientada-objetos-typescript/">Programación Orientada a Objetos en TypeScript: Guía Completa</a></p><p>También necesitarás tener instalado <strong>Node.js</strong> en tu ordenador. Aunque no es 100% necesario, sería importante que tuvieras unas nociones antes de empezar con este tutorial. Puedes descargar Node.js desde el siguiente enlace:</p><p><a target="_blank" rel="noopener noreferrer" href="https://nodejs.org/en/download/package-manager">https://nodejs.org/en/download/package-manager</a>.</p><h2>Creación de nuestro proyecto</h2><p>El proyecto que vamos a construir va a ser un <strong>blog</strong> basado en mi web cosasdedevs.com en el que podremos registrarnos, conectarnos a una base de datos, escribir comentarios y si somos administradores podremos publicar posts.</p><p>Para crear nuestro proyecto, primero vamos a lanzar el siguiente comando en nuestra terminal:</p><pre><code class="language-plaintext">npx&nbsp;sv&nbsp;create&nbsp;blog-svelte</code></pre><p><span style="background-color:#fdfdfd;color:#000000;">Aparecerá un asistente para la configuración del proyecto. Yo he seleccionado los siguientes puntos.</span></p><ul><li><span style="background-color:#fdfdfd;color:#000000;">Como plantilla <code>SvelteKit minimal</code>.</span></li><li><span style="background-color:#fdfdfd;color:#000000;">Elegimos que sí usaremos TypeScript.</span></li><li><span style="background-color:#fdfdfd;color:#000000;">Como extras he añadido <code>prettier</code> y <code>eslint</code>.</span></li><li><span style="background-color:#fdfdfd;color:#000000;">El sistema para instalar las dependencias en mi caso será <code>npm</code>.</span></li></ul><p><span style="background-color:#fdfdfd;color:#000000;"><img src="https://lh7-rt.googleusercontent.com/docsz/AD_4nXffZC7_yg3EUwf5jUp_vGiEk6mzUp2nDwHCK2LMRK3S2HbpdK0Rh_40HuZhK-ByNc9xTgoDb0ozq2eTXHrf1x52Ys7Cgaw0FM8S2H9NonLnovqc0cXnEKVT9P7JEb46M5_iku0R?key=FfifRnr9axc95lQX3ldmNuMW" width="602" height="375"></span></p><p>Una vez termina de instalar las dependencias, podemos seguir los pasos que nos indica el asistente para ejecutar el proyecto y ver la página base de <code>Svelte</code>.</p><pre><code class="language-plaintext">cd blog-svelte &amp;&amp; npm run dev -- --open</code></pre><p>Si abrimos el proyecto con un editor de código, deberíamos ver una estructura como esta:</p><pre><code class="language-plaintext">blog-svelte/
├ src/
│ ├ lib/
│ │ ├ server/
│ │ │ └ [your server-only lib files]
│ │ └ [your lib files]
│ ├ params/
│ │ └ [your param matchers]
│ ├ routes/
│ │ └ [your routes]
│ ├ app.html
│ ├ error.html
│ ├ hooks.client.js
│ ├ hooks.server.js
│ └ service-worker.js
├ static/
│ └ [your static assets]
├ tests/
│ └ [your tests]
├ package.json
├ svelte.config.js
├ tsconfig.json
└ vite.config.js</code></pre><p>Directorio &nbsp;<code>src</code>: contiene el núcleo del proyecto. Todo su contenido es opcional excepto la carpeta <code>routes</code> y el archivo <code>app.html</code>.</p><ul><li>Directorio &nbsp;<code>lib</code>: guardaremos código reutilizable como utilidades o componentes. Además, gracias a <code>Svelte</code> tenemos un atajo para acceder a los archivos de este directorio escribiendo <code>$lib</code>. Más adelante veremos como funciona.</li><li>Directorio &nbsp;<code>server</code>: contendrá código que solo queramos que se ejecute desde el lado del servidor. <code>Svelte</code> prevendrá que intentes importar estos archivos del lado del cliente.</li><li>Directorio &nbsp;<code>routes</code>: definirá las rutas de la aplicación y será donde construyamos nuestras páginas.</li><li>Archivo <code>app.html</code>: es la plantilla base con marcadores para insertar el contenido dinámico de SvelteKit.</li><li>Archivo <code>error.html</code>: será la página que mostraremos cuando todo falle.</li><li><code>Hooks</code> (<code>hooks.client.js</code>, <code>hooks.server.js</code>): La versión <code>client</code> se ejecutará solo en el cliente durante la navegación entre rutas y la versión <code>server</code> se ejecutará cada vez que recibamos una petición al servidor.</li><li>Directorio <code>static</code>: almacenará archivos estáticos como <code>robots.txt</code> o <code>favicon.png</code> que se sirven sin procesar.</li><li>Directorio <code>tests</code><strong>:</strong> Si se incluye <a target="_blank" rel="noopener noreferrer" href="https://playwright.dev/">Playwright</a>, las pruebas de navegador se alojan aquí.</li></ul><p>Aparte de estas carpetas y archivos, en el directorio principal tenemos los siguientes archivos:</p><ul><li><code><strong>svelte.config.js</strong></code><strong>:</strong> Configuración de <code>Svelte</code> y SvelteKit.</li><li><code><strong>tsconfig.json</strong></code><strong>/</strong><code><strong>jsconfig.json</strong></code><strong>:</strong> Configuración de TypeScript o comprobación de tipos en JavaScript.</li><li><code><strong>vite.config.js</strong></code><strong>:</strong> Configuración de <code>Vite</code> con el <code>plugin</code> <code>@sveltejs/kit/vite</code>.</li></ul><p>Con esto podremos dar por cerrado este tutorial, en el siguiente veremos como crear la cabecera de nuestro blog y como funciona el sistema de enrutamiento.</p>', 1, '2024-12-12 10:24:05.007285+00', 'web-fullstack-svelte-5-sveltekit', 'f');
INSERT INTO posts ("title", "image_header", "content", "user_id", "created_at", "slug_url", "is_draft") VALUES
('Guía completa de los principios SOLID', 'posts/guia-completa-principios-solid.png', '<p>Los<strong> principios SOLID</strong> son un conjunto de 5 principios que nos pueden ayudar a crear software más estructurado, mantenible y flexible.&nbsp;</p><p>Cada uno de estos principios aborda <strong>desafíos comunes</strong> en el diseño de software, ofreciendo soluciones claras para evitar código frágil y difícil de escalar.</p><p>Recuerda que <strong>son principios y no reglas</strong>, por lo que debemos tener cierto margen de flexibilidad a la hora de aplicarlos siempre adaptándonos a nuestras necesidades.</p><p>En este tutorial, exploraremos cada principio con ejemplos prácticos y vamos a ver cómo aplicarlos para mejorar la calidad de tu código.</p><h2>Los 5 principios SOLID</h2><p>Estos principios se dividen en 5, uno por cada letra y son los siguientes:</p><ul><li>Single Responsibility Principle (Principio de responsabilidad única)</li><li>Open/Closed Principle (Principio de abierto y cerrado)</li><li>Liskov Substitution Principle (Sustitución de Liskov)</li><li>Interface Segregation Principle (Segregación de interfaz)</li><li>Dependency Inversión Principle (Inversión de dependencias)</li></ul><h3>Principio de Responsabilidad Única (Single Responsibility Principle - SRP)</h3><p><strong>El Principio de Responsabilidad Única</strong> establece que una clase, módulo o función debe centrarse exclusivamente en una responsabilidad. Esto no significa que una clase solo pueda realizar una tarea específica, sino que todas sus funcionalidades deben estar relacionadas con un mismo propósito o concepto.</p><p>Identificar violaciones al SRP puede ser más sencillo si te planteas las siguientes preguntas o señales de alerta:</p><ul><li><strong>¿El nombre de la clase o módulo es demasiado genérico?</strong> Esto puede indicar que está abarcando múltiples responsabilidades.</li><li><strong>¿Cambios en el código afectan esta clase con frecuencia?</strong> Las modificaciones constantes pueden ser señal de que está haciendo demasiado.</li><li><strong>¿La clase está involucrada en varias capas de la aplicación?</strong> Si una misma clase gestiona lógica de negocio, acceso a datos y presentación, es probable que viole el SRP.</li><li><strong>¿Tiene demasiadas importaciones?</strong> Un alto número de dependencias puede sugerir que la clase está asumiendo más roles de los necesarios.</li><li><strong>¿Cuenta con muchos métodos públicos?</strong> Esto puede indicar que la clase está sirviendo a múltiples propósitos.</li><li><strong>¿Es excesivamente larga?</strong> Un número elevado de líneas de código suele ser un síntoma de que la clase maneja más responsabilidades de las que debería.</li></ul><p>A continuación te dejo un ejemplo en el que se viola este principio para que lo puedas ver más claro:</p><pre><code class="language-typescript">class User {
 constructor(public id: number, public name: string, public email: string) {}
 getDisplayName(): string {
   return `${this.name} (${this.email})`;
 }
 sendWelcomeEmail(): void {
   console.log(`Enviando correo a ${this.email}: Bienvenido\nHola ${this.name}, bienvenido a nuestra plataforma.`);
 }
}

const user = new User(1, ''Alber'', ''alber@example.com'');
user.sendWelcomeEmail();</code></pre><p>En este ejemplo no estamos cumpliendo con el principio de responsabilidad única, ya que la clase user <strong>no debe encargarse de enviar el email de bienvenida</strong>. De esto deberíamos encargarnos con una clase en concreto para enviar emails:</p><pre><code class="language-typescript">class User {
 constructor(public id: number, public name: string, public email: string) {}
 getDisplayName(): string {
   return `${this.name} (${this.email})`;
 }
}
// Clase responsable únicamente de enviar correos electrónicos
class EmailService {
 sendEmail(to: string, subject: string, body: string): void {
   console.log(`Enviando correo a ${to}: ${subject}\n${body}`);
 }
}
const user = new User(1, ''Alber'', ''alber@example.com'');
const emailService = new EmailService();
emailService.sendEmail(user.email, ''Bienvenido'', `Hola ${user.name}, bienvenido a nuestra plataforma.`);</code></pre><h3>Principio de Abierto/Cerrado (Open/Closed Principle - OCP)</h3><p><strong>El Principio de Abierto/Cerrado</strong> establece que las entidades de software (clases, módulos, funciones, etc.) deben estar <strong>abiertas para la extensión</strong>, permitiendo añadir nuevas funcionalidades sin alterar su estructura interna, pero <strong>cerradas para la modificación</strong>, evitando cambiar el código existente para no introducir errores en las partes que ya funcionan correctamente.</p><p>Un ejemplo común es <strong>abstraer el uso de dependencias externas</strong>. Si estás utilizando una librería de terceros, encapsularla en una clase propia te permitirá cambiarla o actualizarla sin afectar el resto de tu código. De esta forma, el impacto del cambio estará limitado a esa única clase.</p><p>Indicadores de violaciones del OCP:</p><ul><li>Los cambios en los requisitos o funcionalidades requieren modificar una clase o módulo existente.</li><li>Una clase o módulo mezcla responsabilidades, afectando múltiples capas (presentación, lógica de negocio, almacenamiento, etc.).</li></ul><p>Ejemplo de una clase que viola este principio:</p><pre><code class="language-typescript">class Order {
 checkout(amount: number, paymentMethod: string): void {
   if (paymentMethod === ''PayPal'') {
     console.log(`Procesando pago de $${amount} con PayPal.`);
   } else if (paymentMethod === ''Stripe'') {
     console.log(`Procesando pago de $${amount} con Stripe.`);
   } else {
     console.log(''Método de pago no soportado.'');
   }
 }
}
const order = new Order();
order.checkout(100, ''PayPal'');
order.checkout(200, ''Stripe'');</code></pre><p>Aquí, la clase <code>Order</code> <strong>viola el OCP</strong> porque para añadir un nuevo método de pago, como "Apple Pay", tendrías que modificar su implementación, lo que podría introducir errores y afectar la lógica existente.</p><p>Esto podríamos resolverlo de la siguiente forma:</p><pre><code class="language-typescript">interface PaymentProcessor {
 processPayment(amount: number): void;
}
// Implementación para PayPal
class PayPalPaymentProcessor implements PaymentProcessor {
 processPayment(amount: number): void {
   console.log(`Procesando pago de $${amount} con PayPal.`);
 }
}
// Implementación para Stripe
class StripePaymentProcessor implements PaymentProcessor {
 processPayment(amount: number): void {
   console.log(`Procesando pago de $${amount} con Stripe.`);
 }
}
// Clase de orden que es abierta para extenderse a nuevos procesadores, pero cerrada para modificaciones
class Order {
 constructor(private paymentProcessor: PaymentProcessor) {}
 checkout(amount: number): void {
   this.paymentProcessor.processPayment(amount);
 }
}
// Uso de la clase
const orderWithPayPal = new Order(new PayPalPaymentProcessor());
orderWithPayPal.checkout(100);
const orderWithStripe = new Order(new StripePaymentProcessor());
orderWithStripe.checkout(200);</code></pre><p>En este caso, <code>Order</code> es <strong>cerrada para modificaciones</strong> porque no necesitas cambiar su implementación si añades un nuevo método de pago. Solo necesitas extender creando una nueva clase que implemente <code>PaymentProcessor</code>.</p><h3>Principio de Sustitución de Liskov (Liskov Substitution Principle - LSP)</h3><p>El Principio de Sustitución de Liskov establece que si una clase hija (A) extiende una clase padre (B), <strong>debe poder ser utilizada en lugar de la clase padre</strong> sin que esto afecte el comportamiento esperado del programa. En otras palabras, las clases derivadas deben ser completamente intercambiables con sus clases base sin causar errores o resultados inesperados.</p><p>Esto implica que una clase hija no debe:</p><ul><li>Alterar el contrato definido por la clase base.</li><li>Introducir restricciones adicionales que no están presentes en la clase base.</li><li>Cambiar significativamente el comportamiento esperado de los métodos heredados.</li></ul><p>Cumplir con este principio es esencial para <strong>garantizar</strong> que un sistema sea flexible y extensible, especialmente cuando se utilizan polimorfismo y herencia.</p><p>Para detectar posibles violaciones, considera lo siguiente:</p><ul><li><strong>Excepciones inesperadas</strong>: ¿La clase hija lanza excepciones en escenarios donde la clase base no lo haría?</li><li><strong>Restricciones adicionales</strong>: ¿La clase hija introduce reglas que no están definidas en la clase base?</li><li><strong>Resultados inconsistentes</strong>: ¿El comportamiento esperado de un método cambia al sustituir la clase base por la hija?</li><li><strong>Dependencia de tipos específicos</strong>: ¿El código depende explícitamente de la clase hija en lugar de la base?</li><li><strong>Sobrecarga no coherente</strong>: ¿Los métodos sobrescritos no mantienen las mismas precondiciones y postcondiciones que la clase base?</li></ul><p>Ejemplo que viola este principio:</p><pre><code class="language-typescript">class Bird {
 fly(): void {
   console.log(''Volando...'');
 }
}
// Clase hija que viola LSP porque no puede volar
class Penguin extends Bird {
 fly(): void {
   throw new Error(''Los pingüinos no pueden volar.'');
 }
}
// Código que utiliza la clase base
function makeBirdFly(bird: Bird): void {
 bird.fly();
}
const sparrow = new Bird();
makeBirdFly(sparrow); // "Volando..."
const penguin = new Penguin();
makeBirdFly(penguin); // Error: Los pingüinos no pueden volar.</code></pre><p>En este caso, <code>Penguin</code> no cumple con el contrato de la clase base <code>Bird</code>, ya que redefine el método <code>fly</code> con una funcionalidad que rompe la expectativa del código. Esto viola el LSP porque <code>Penguin</code> no puede sustituir a <code>Bird</code> sin causar errores.</p><p>Lo podemos solucionar así:</p><pre><code class="language-typescript">interface Bird {
 move(): void;
}
// Clase hija para aves que vuelan
class FlyingBird implements Bird {
 move(): void {
   console.log(''Volando...'');
 }
}
// Clase hija para aves que no vuelan
class NonFlyingBird implements Bird {
 move(): void {
   console.log(''Caminando...'');
 }
}
// Código que utiliza la interfaz base
function makeBirdMove(bird: Bird): void {
 bird.move();
}
// Uso
const sparrow = new FlyingBird();
makeBirdMove(sparrow); // "Volando..."
const penguin = new NonFlyingBird();
makeBirdMove(penguin); // "Caminando..."</code></pre><p>En este ejemplo, el uso de una interfaz permite modelar diferentes comportamientos sin forzar un contrato que algunas clases no puedan cumplir. Tanto <code>FlyingBird</code> como <code>NonFlyingBird</code> implementan la interfaz <code>Bird</code> de manera coherente, permitiendo sustituir una clase por otra sin problemas.</p><h3>Principio de Segregación de Interfaces (Interface Segregation Principle - ISP)</h3><p>El Principio de Segregación de Interfaces establece que las clases que implementan interfaces <strong>no deberían estar obligadas a depender de métodos que no utilizan</strong>.&nbsp;</p><p>En términos simples, las interfaces deben ser <strong>específicas</strong> y contener únicamente <strong>los métodos necesarios para las clases que las implementan</strong>.</p><p>Esto significa que es preferible diseñar <strong>múltiples interfaces pequeñas y específicas</strong> en lugar de una interfaz general y extensa que todas las clases deben implementar, incluso si algunas de esas clases no necesitan todos los métodos definidos en ella.</p><p>Cumplir este principio <strong>mejora la flexibilidad del diseño y facilita la reutilización y el mantenimiento del código</strong>, ya que las clases no se ven sobrecargadas con métodos irrelevantes.</p><p>Para identificar posibles problemas, considera lo siguiente:</p><ul><li><strong>Interfaces infladas</strong>: ¿La interfaz contiene demasiados métodos que no son usados por todas las clases?</li><li><strong>Implementaciones vacías o irrelevantes</strong>: ¿Alguna clase tiene métodos implementados sin funcionalidad porque no los necesita?</li><li><strong>Falta de coherencia</strong>: ¿La interfaz incluye métodos que no están relacionados directamente entre sí?</li><li><strong>Problemas al extender</strong>: ¿Al añadir un nuevo método a la interfaz se obliga a modificar todas las clases que la implementan, incluso aquellas que no lo necesitan?</li></ul><p>Ejemplo que viola el principio:</p><pre><code class="language-typescript">interface Animal {
&nbsp; &nbsp; eat(): void;
&nbsp; &nbsp; sleep(): void;
&nbsp; &nbsp; fly(): void;
&nbsp; &nbsp; swim(): void;
}

// Clase que implementa métodos irrelevantes
class Dog implements Animal {
&nbsp; &nbsp; eat(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El perro está comiendo.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; sleep(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El perro está durmiendo.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; fly(): void {
&nbsp; &nbsp; &nbsp; &nbsp; throw new Error(''Los perros no pueden volar.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; swim(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El perro está nadando.'');
&nbsp; &nbsp; }
}

class Bird implements Animal {
&nbsp; &nbsp; eat(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El ave está comiendo.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; sleep(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El ave está durmiendo.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; fly(): void {
&nbsp; &nbsp; &nbsp; &nbsp; console.log(''El ave está volando.'');
&nbsp; &nbsp; }
&nbsp; &nbsp; swim(): void {
&nbsp; &nbsp; &nbsp; &nbsp; throw new Error(''Las aves no nadan.'');
&nbsp; &nbsp; }</code></pre><p>Podemos solucionarlo de la siguiente manera:</p><pre><code class="language-typescript">// Interfaces específicas para diferentes comportamientos
interface Eater {
 eat(): void;
}
interface Sleeper {
 sleep(): void;
}
interface Flyer {
 fly(): void;
}
interface Swimmer {
 swim(): void;
}
// Clases que implementan solo las interfaces que necesitan
class Dog implements Eater, Sleeper, Swimmer {
 eat(): void {
   console.log(''El perro está comiendo.'');
 }
 sleep(): void {
   console.log(''El perro está durmiendo.'');
 }
 swim(): void {
   console.log(''El perro está nadando.'');
 }
}
class Bird implements Eater, Sleeper, Flyer {
 eat(): void {
   console.log(''El ave está comiendo.'');
 }
 sleep(): void {
   console.log(''El ave está durmiendo.'');
 }
 fly(): void {
   console.log(''El ave está volando.'');
 }
}</code></pre><p>Aquí, cada clase implementa únicamente las interfaces que <strong>son relevantes para su comportamiento</strong>. Esto asegura que no se incluyan métodos innecesarios, lo que hace que el diseño sea más limpio, flexible y fácil de mantener.</p><h3>Principio de Inversión de Dependencias (Dependency Inversion Principle - DIP)</h3><p>El Principio de Inversión de Dependencias establece que:</p><ul><li>Los módulos de alto nivel no deben depender de módulos de bajo nivel. Ambos deben depender de abstracciones (interfaces o clases abstractas).</li><li>Las abstracciones no deben depender de implementaciones concretas.</li><li>Los detalles (implementaciones concretas) deben depender de abstracciones.</li></ul><p>Este principio <strong>fomenta la creación de sistemas desacoplados y flexibles</strong>, donde los módulos de alto nivel (que contienen la lógica central de la aplicación) no se ven afectados por cambios en los módulos de bajo nivel (implementaciones específicas).&nbsp;</p><p>Esto se logra definiendo interfaces o clases abstractas para comunicar los módulos, dejando que las implementaciones concretas dependan de estas abstracciones.</p><p>Para identificar posibles problemas, analiza si:</p><ul><li><strong>Dependencias rígidas</strong>: ¿El código de alto nivel depende directamente de implementaciones concretas?</li><li><strong>Acoplamiento fuerte</strong>: ¿Un cambio en una clase concreta rompe o requiere modificaciones en el código de alto nivel?</li><li><strong>Reutilización limitada</strong>: ¿Es difícil reutilizar el módulo de alto nivel porque está atado a detalles específicos?</li><li><strong>Falta de inyección de dependencias</strong>: ¿El código crea instancias de clases concretas directamente en lugar de recibirlas como dependencias?</li></ul><p>Ahora vamos a ver un ejemplo que viola este principio:</p><pre><code class="language-typescript">// Módulo de bajo nivel
class MySQLDatabase {
 connect(): void {
   console.log(''Conectando a MySQL...'');
 }
}
// Módulo de alto nivel que depende directamente del módulo de bajo nivel
class UserService {
 private database: MySQLDatabase;
 constructor() {
   this.database = new MySQLDatabase(); // Dependencia directa
 }
 getUser(id: string): void {
   this.database.connect();
   console.log(`Obteniendo usuario con ID ${id}`);
 }
}
// Uso
const userService = new UserService();
userService.getUser(''123'');</code></pre><p>En este ejemplo, <code>UserService</code> depende directamente de la clase concreta <code>MySQLDatabase</code>. Si el algún momento decidimos cambiar a otra base de datos (por ejemplo, PostgreSQL), sería necesario modificar <code>UserService</code>, lo que rompe el principio de inversión de dependencias.</p><p>Para solucionarlo podemos hacer lo siguiente:</p><pre><code class="language-typescript">// Abstracción (interfaz) para bases de datos
interface Database {
 connect(): void;
}
// Implementación concreta para MySQL
class MySQLDatabase implements Database {
 connect(): void {
   console.log(''Conectando a MySQL...'');
 }
}
// Implementación concreta para PostgreSQL
class PostgreSQLDatabase implements Database {
 connect(): void {
   console.log(''Conectando a PostgreSQL...'');
 }
}
// Módulo de alto nivel que depende de la abstracción
class UserService {
 private database: Database;
 constructor(database: Database) {
   this.database = database; // Dependencia inyectada
 }
 getUser(id: string): void {
   this.database.connect();
   console.log(`Obteniendo usuario con ID ${id}`);
 }
}
// Uso
const mysqlDatabase = new MySQLDatabase();
const userServiceWithMySQL = new UserService(mysqlDatabase);
userServiceWithMySQL.getUser(''123'');
const postgresDatabase = new PostgreSQLDatabase();
const userServiceWithPostgres = new UserService(postgresDatabase);
userServiceWithPostgres.getUser(''456'');</code></pre><p>En este caso, <code>UserService</code> depende de la interfaz <code>Database</code> y no de implementaciones concretas. Esto permite cambiar la base de datos sin necesidad de modificar <code>UserService</code>, haciendo el código más flexible y fácil de mantener.</p>', 1, '2024-11-25 11:47:14.634217+00', 'guia-completa-principios-solid', 'f');
INSERT INTO posts ("title", "image_header", "content", "user_id", "created_at", "slug_url", "is_draft") VALUES
('Clean Code: Buenas Prácticas para Escribir Código Limpio y Eficiente', 'posts/clean-code-buenas-practicas-escribir-codigo-limpio-eficiente.png', '<p>Escribir un código limpio además de una habilidad que todos debemos tener, es una <strong>práctica esencial para cualquier desarrollador</strong> que busque crear aplicaciones escalables, fáciles de mantener y legibles por otros.</p><p>Y no solo eso, sino que también te abrirá puertas, ya que si en tus proyectos públicos tu código es limpio y utilizas buenas prácticas, es un muy buen punto para tu próxima aventura laboral.</p><p>Este tutorial te guiará a través de los principios fundamentales de <i>Clean Code</i>, detallando buenas prácticas que transformarán la calidad de tu código. Aprenderás a organizar mejor tus proyectos, a estructurar tus funciones y variables de manera intuitiva, y a evitar errores comunes que afectan la claridad y eficiencia del software.</p><h2>Deuda técnica</h2><p>Probablemente, ya hayas oído hablar sobre la importancia de la calidad del código, y no es para menos: cuando no cuidamos detalles como refactorizar o añadir comentarios claros, siempre se paga un precio.&nbsp;</p><p>Las excusas más comunes suelen ser la falta de tiempo para el mantenimiento, la dificultad de entender un código complejo (porque si, incluso con mucha experiencia, un código denso puede ser un desafío), o la falta de disponibilidad de un compañero para transferir el conocimiento necesario.&nbsp;</p><p>Adoptar prácticas de Clean Code ayuda a evitar estos problemas y a construir una base de código más robusta y comprensible para todos.</p><p>Hay cuatro tipos de deuda técnica:</p><ul><li><strong>Imprudente</strong>: Por ejemplo, copiar un código que te has encontrado por internet para salir del paso sin ni siquiera entenderlo.</li><li><strong>Imprudente e inadvertida</strong>: Cuando no tienes conocimientos sobre buenas prácticas o patrones de diseño.</li><li><strong>Prudente</strong>: Y digo prudente entre comillas porque en este caso sabemos que lo estamos haciendo mal, pero dejamos para más adelante una refactorización, separar en clases, etc.</li><li><strong>Prudente e inadvertida</strong>: Cuando después de terminar una tarea nos damos cuenta de como podríamos haberlo hecho mejor.</li></ul><h2>Cómo mejorar nuestro código</h2><p>A continuación vamos a ver algunos consejos para mejorar nuestro código 🙌.</p><h3>Refactorización</h3><p>Refactorizar un código es el proceso por el cual el objetivo es mejorar un código existente para que sea más entendible y tolerante a cambios. Un ejemplo puede ser una clase inmensa que realiza varias acciones distintas, la típica clase <code>Utils</code>, que puede tener por ejemplo un método para generar un <code>UUID</code>, otro método que realiza peticiones <code>CURL</code>, etc.</p><p>La idea sería separarla en distintas clases en las que cada una cumpla sus cometidos.</p><p>En este caso es importante contar con pruebas automáticas para que cuando realicemos la refactorización, nuestro proyecto siga manteniendo el comportamiento esperado.</p><h3>Nombres pronunciables y expresivos a la hora de declarar variables, constantes y métodos</h3><p>Es fundamental asignar nombres claros y comprensibles a variables, constantes y métodos. Aunque a veces puede ser tentador ahorrar caracteres, hacerlo suele perjudicar la legibilidad y dificulta el entendimiento de otros desarrolladores.&nbsp;</p><p>Lo que para ti puede ser obvio al abreviar, para un compañero podría ser confuso y propenso a malinterpretaciones.</p><p>Opta siempre por nombres que comuniquen la intención de forma directa. Si encuentras que necesitas añadir comentarios para aclarar el propósito de un nombre, es probable que el nombre no sea lo suficientemente explícito.</p><p><strong>Evita redundancias</strong>: Ser expresivo no implica añadir palabras innecesarias. Por ejemplo, al nombrar una función, evita prefijos como <code>fn</code> o <code>function</code>. Estos elementos no aportan claridad y solo agregan ruido visual.</p><h3>Nombrar las variables según el tipo de dato</h3><p>Si es <code>booleano</code>, podemos usar prefijos como <code>is</code>, <code>can</code>, <code>has</code> y siempre positivos.</p><pre><code class="language-typescript">let isUserActive: boolean = true; // indica si el usuario está activo.
let isProcessComplete: boolean = false; // indica si el proceso está completado.
let canUserEdit: boolean = true; // indica si el usuario tiene permiso para editar.
let canSendNotification: boolean = false; // indica si se pueden enviar notificaciones.
let hasAccess: boolean = true; // indica si se tiene acceso.
let hasCompletedTask: boolean = false; // Correcto: indica si se ha completado la tarea.</code></pre><p>En el caso de <code>arrays</code>, tiene sentido que los nombres sean en plural, ya que pueden contener varios datos.</p><pre><code class="language-typescript">// Mal nombre, está en singular y no da mucha información
const country: string[] = [''Spain'', ''Portugal'', ''Italy'']
// Un poco mejor pero cometemos el error de indicar el tipo de dato en el nombre de la variable
const countryArray: string[] = [''Spain'', ''Portugal'', ''Italy'']
// Este caso ya es bueno, añadimos el nombre en plural, sin embargo, solo con countries, 
// a simple vista no sabemos si es una lista de objetos, nombres, identificadores.
const countries: string[] = [''Spain'', ''Portugal'', ''Italy'']
// El mejor nombre, muy explicito pero sin sobrepasarnos, indicamos que es un listado de nombres de paises
const countryNames: string[] = [''Spain'', ''Portugal'', ''Italy'']</code></pre><p>Si es un número, podemos usar prefijos como <code>min</code>, <code>max</code> y <code>total</code>.</p><pre><code class="language-typescript">const minFlightsPerDay = 5
const maxFlightsPerDay = 10
let totalFlightsToday = 7</code></pre><p>Al nombrar funciones, utiliza un verbo seguido de un sustantivo que describa lo que realiza la función. Sé específico, pero comedido, evitando detalles innecesarios en el nombre. El objetivo es que el nombre exprese claramente la acción que realiza la función sin introducir condiciones que pueden manejarse dentro del código.</p><pre><code class="language-typescript">// Malos nombres
function validateFormIfNotEmpty() { /* ... */ }
function checkPermissionIfUserLoggedIn() { /* ... */ }


// Buenos nombres
function validateForm() { /* ... */ }
function checkPermission() { /* ... */ }


// Malos nombres
function getUserDataIfAuthorized() { /* ... */ }
function fetchOrderIfExists() { /* ... */ }


// Buenos nombres
function getUserData() { /* ... */ }
function fetchOrder() { /* ... */ }</code></pre><h3>Nombres de clases</h3><p>El nombre de una clase debe ser claro y específico, capturando su propósito sin ser genérico ni demasiado extenso. Dado que el nombre de la clase es lo primero que comunica su función, asegúrate de que describa con precisión lo que hace y su rol dentro del sistema.</p><p>Para encontrar el mejor nombre, considera estas preguntas:</p><ul><li><strong>¿Qué hace exactamente esta clase?</strong> Define el propósito principal de la clase y asegúrate de que el nombre lo refleje.</li><li><strong>¿Cómo realiza esta clase su tarea?</strong> Si su funcionamiento o contexto es único, incluye detalles que lo hagan evidente.</li><li><strong>¿Hay algo específico sobre su ubicación o contexto de uso?</strong> Si la clase pertenece a un módulo o área específica del sistema, eso puede ser útil para la claridad del nombre.</li></ul><h3>Orden y estructura recomendada para una clase</h3><ul><li><strong>Propiedades estáticas:</strong> Declara las propiedades de clase que no dependen de instancias.</li><li><strong>Propiedades de instancia:</strong> En el siguiente orden, declara primero las propiedades privadas, luego las protegidas y finalmente las públicas.</li><li><strong>Constructores estáticos:</strong> Define constructores estáticos, si son necesarios, para inicializar la clase sin instancias.</li><li><strong>Constructor de instancia:</strong> Incluye el constructor estándar que inicializa las instancias de la clase.</li><li><strong>Constructores privados:</strong> Añade cualquier constructor privado requerido para la creación controlada de instancias.</li><li><strong>Métodos estáticos:</strong> Declara los métodos que no dependen de instancias y que son de utilidad para la clase en general.</li><li><strong>Métodos privados:</strong> Coloca aquí los métodos internos que no deben ser accesibles desde fuera de la clase.</li><li><strong>Métodos de instancia:</strong> Organiza el resto de métodos de instancia en orden de importancia o frecuencia de uso, de mayor a menor.</li><li><strong>Getters y setters:</strong> Ubícalos al final, para gestionar el acceso y modificación de las propiedades privadas o protegidas.</li></ul><p>Esta estructura ayuda a mantener el código limpio, organizado y facilita su comprensión.</p><h3><strong>Clean Code en funciones: argumentos y parámetros</strong></h3><p>Para escribir funciones claras y manejables, es recomendable limitar el número de parámetros a un máximo de tres. Si necesitas más, considera usar un objeto o, en algunos casos, un <code>array</code>. También es útil ordenar los parámetros alfabéticamente para mejorar la claridad.</p><p>A continuación, te dejo unas buenas prácticas en el diseño de funciones:</p><ul><li><strong>Mantén una sola responsabilidad:</strong> Cada función debe realizar solo una tarea específica. Si realiza varias tareas, divídela en funciones más pequeñas.</li><li><strong>Simplicidad ante todo:</strong> La función debe ser fácil de entender y libre de lógica innecesaria.</li><li><strong>Tamaño reducido:</strong> Es ideal que las funciones sean concisas; funciones de una sola línea están bien siempre que no aumenten la complejidad.</li><li><strong>Líneas limitadas:</strong> Para facilitar la lectura y mantenimiento, procura que una función tenga menos de 20 líneas, aunque esto no siempre va a ser posible.</li><li><strong>Evita el uso de </strong><code><strong>else</strong></code><strong>:</strong> Estructuras <code>if</code> claras sin <code>else</code> suelen ser más legibles. En lugar de <code>else</code>, organiza el flujo de la función para que sea directo.</li><li><strong>Usa el operador ternario para condiciones simples:</strong> El operador ternario (<code>condición ? valorSiVerdadero : valorSiFalso</code>) es una opción compacta y clara para condiciones que no requieren estructuras complejas.</li></ul><h3>Cómo usar comentarios</h3><p>Evita usar comentarios en los casos en los que el código se ve claro y explícito. Si hay un código mal escrito, no añadas un comentario, reescríbelo para mejorarlo.</p><h3>Uniformidad en el proyecto</h3><p>Es importante mantener un estilo uniforme al nombrar métodos en nuestras clases para garantizar claridad y coherencia en el código. Consideremos este ejemplo:</p><pre><code class="language-javascript">// Clase 1
const createOrder = () =&gt; {};
const updateOrder = () =&gt; {};
const deleteOrder = () =&gt; {};
// Clase 2
const createNewUser = () =&gt; {};
const modifyUser = () =&gt; {};
const removeUser = () =&gt; {};</code></pre><p>En la primera clase, los métodos utilizan los prefijos <code>create</code>, <code>update</code> y <code>delete</code>, lo que establece un patrón claro y consistente. Sin embargo, en la segunda clase, aunque las funciones realizan tareas similares, se utilizan prefijos diferentes como <code>createNew</code>, <code>modify</code> y <code>remove</code>. Este cambio rompe la uniformidad y dificulta la lectura y comprensión del código.</p><p><strong>Recomendación:</strong> Usa los mismos prefijos y convenciones para tareas similares, independientemente de la clase o entidad. Por ejemplo, en lugar de <code>modifyUser</code> y <code>removeUser</code>, utiliza <code>updateUser</code> y <code>deleteUser</code>. Esto no solo mejora la consistencia del código, sino que también facilita la colaboración y el mantenimiento del proyecto.</p><p>También puedes definir esta información en el archivo <code>README</code> de tu proyecto para tenerla siempre disponible y compartirla con los demás integrantes.</p><h3>Code smells</h3><p>Los <strong>code smells</strong> (o "malos olores de código") son indicadores de que el código puede tener problemas de diseño, estructura o mantenibilidad que podrían causar errores o hacer que el sistema sea difícil de entender y extender.&nbsp;</p><p>Aunque no son errores que impidan que el programa funcione, los code smells pueden llevar a problemas más graves a medida que el proyecto crece.</p><p>Te dejo algunos ejemplos comunes de code smells:</p><ul><li><strong>Código duplicado</strong>: Fragmentos idénticos o muy similares en diferentes partes del código. Esto aumenta el riesgo de inconsistencias y hace el código más difícil de mantener.</li><li><strong>Métodos o clases demasiado largos</strong>: Funciones o clases que realizan múltiples tareas y tienen muchas líneas de código. Esto hace que el código sea complejo y difícil de entender.</li><li><strong>Código muerto</strong>: Variables, funciones o bloques de código que nunca se usan. Esto causa confusión y aumenta el tamaño del código innecesariamente.</li><li><strong>Excesiva complejidad</strong>: Código que utiliza estructuras o lógica innecesariamente complejas, cuando una solución más simple sería suficiente.</li><li><strong>Nombres ambiguos</strong>: Variables, funciones o clases con nombres poco claros o imprecisos que dificultan la comprensión de su propósito.</li><li><strong>Clases con demasiadas responsabilidades (God Class)</strong>: Clases que tienen demasiadas responsabilidades y hacen demasiadas cosas. Esto viola el principio de <strong>responsabilidad única</strong> y hace que el código sea difícil de mantener y probar.</li><li><strong>Funciones con demasiados parámetros</strong>: Funciones o métodos con muchos parámetros, lo que hace que el código sea difícil de leer y propenso a errores.</li><li><strong>Condicionales excesivos</strong>: Uso excesivo de estructuras condicionales complejas (<code>if-else</code> o <code>switch</code>) que pueden reemplazarse con polimorfismo, patrones de diseño o estructuras más limpias.</li></ul>', 1, '2024-11-13 14:27:55.882264+00', 'clean-code-buenas-practicas-escribir-codigo-limpio-eficiente', 'f');
INSERT INTO posts ("title", "image_header", "content", "user_id", "created_at", "slug_url", "is_draft") VALUES
('Programación Orientada a Objetos en TypeScript: Guía Completa', 'posts/programacion-orientada-a-objetos-con-typescript.png', '<p>La <strong>Programación Orientada a Objetos (POO)</strong> es un paradigma fundamental en el desarrollo de software, que organiza el código en torno a objetos y relaciones entre ellos. Gracias a <strong>POO</strong>, es posible construir aplicaciones más escalables, mantenibles y fáciles de entender.&nbsp;</p><p>En este tutorial, exploraremos cómo aplicar <strong>POO</strong> en <strong>TypeScript</strong>, un lenguaje de tipado fuerte que facilita la implementación de conceptos como <strong>encapsulamiento</strong>, <strong>herencia</strong> y <strong>abstracción</strong>.&nbsp;</p><p>Con estas bases, podrás escribir código más estructurado y mejorar la reutilización en tus proyectos TypeScript, optimizando tu trabajo en aplicaciones de cualquier escala.</p><h2>¿Qué necesito saber para poder seguir este tutorial?</h2><p style="margin-left:0px;">Para seguir este tutorial, es importante que tengas<strong> conocimientos previos de Programación Orientada a Objetos </strong>y que tengas claros conceptos como <strong>encapsulamiento</strong>, <strong>herencia</strong> y <strong>abstracción</strong>. Si aún no los tienes, te sugiero adquirir primero esos conocimientos y luego regresar para continuar.</p><p style="margin-left:0px;">Si es tu primera vez con TypeScript, te recomiendo que antes te pases por este tutorial. <a target="_blank" rel="noopener noreferrer" href="https://cosasdedevs.com/posts/aprende-typescript-desde-cero-que-es-instalacion-y-tipado/">Aprende TypeScript Desde Cero: Qué es, instalación y tipado</a>.</p><h2 style="margin-left:0px;">Encapsulamiento con TypeScript</h2><p style="margin-left:0px;">Al igual que en otros lenguajes de programación, en TypeScript disponemos de los siguientes controles de acceso a atributos y métodos:</p><ul><li><code><strong>public</strong></code>: Permite el acceso desde cualquier parte del programa. Los miembros <code>public</code> pueden ser accedidos desde cualquier clase o módulo que importe esta clase.</li><li><code><strong>protected</strong></code>: Permite el acceso solo desde la propia clase y sus subclases. Los miembros <code>protected</code> no son accesibles desde fuera de la clase.</li><li><code><strong>private</strong></code>: Limita el acceso exclusivamente a la clase donde se define. Los miembros <code>private</code> no pueden ser accedidos desde clases externas ni desde subclases; solo pueden ser usados dentro de la clase donde se declararon.</li><li><code><strong>static</strong></code>: El modificador <code>static</code> no es un nivel de acceso en sí, sino una indicación de que el miembro pertenece a la clase en lugar de a las instancias individuales.</li></ul><h2>Constructor y atributos en TypeScript</h2><p>Para declarar una clase en TypeScript, solo necesitas utilizar la palabra reservada <code>class</code> y el nombre de la clase seguida de las llaves <code>{}</code>. Ejemplo:</p><pre><code class="language-typescript">export class Developer {
&nbsp; &nbsp; private name: string = '''';


&nbsp; &nbsp; constructor() {}
}</code></pre><p style="margin-left:0;">En este ejemplo he declarado un atributo llamado <code>name</code> que será privado. TypeScript nos obliga a darle un valor por defecto, por lo que lo he inicializado a un <code>string</code> vacío. Si queremos evitar esto, tenemos dos opciones. La primera es declararlo como opcional como ya vimos en el tutorial anterior utilizando el operador <code>?</code>.</p><pre><code class="language-typescript">export class Developer {
&nbsp; &nbsp; private name?: string;


&nbsp; &nbsp; constructor() {}
}</code></pre><p style="margin-left:0;">Otra opción es declarar el atributo dentro del constructor, de esta forma, al crear una instancia de la clase, deberemos enviar el parámetro:</p><pre><code class="language-typescript">export class Developer {
&nbsp; &nbsp; constructor(private name: string) {}
}</code></pre><h2 style="margin-left:0;">Interfaces en TypeScript</h2><p style="margin-left:0;">También es posible definir interfaces para implementarlas posteriormente en nuestras clases. Por convención, el nombre de una interfaz suele comenzar con una ''I'' mayúscula.</p><pre><code class="language-typescript">export interface IEmployee {
&nbsp; &nbsp; name: string;
}</code></pre><p style="margin-left:0;">Para implementar nuestra interfaz en una clase, utilizamos la palabra reservada <code>implements</code>:</p><pre><code class="language-typescript">import { IEmployee } from "./IEmployee";


export class Developer implements IEmployee {
&nbsp; &nbsp; name: string = '''';
&nbsp; &nbsp; constructor(name: string) {}
}</code></pre><h2 style="margin-left:0;">Herencia en TypeScript</h2><p>La herencia es muy similar a otros lenguajes de programación. Primero declaramos la clase padre:</p><pre><code class="language-typescript">export class Employee {
&nbsp; &nbsp; constructor(protected name: string, protected salary: number) {}
}</code></pre><p style="margin-left:0;">Después, solo necesitamos exportarla a la clase hija y extender de ella utilizando la palabra reservada <code>extends</code>.</p><pre><code class="language-typescript">import { Employee } from "./Employee";


export class Developer extends Employee {
&nbsp; &nbsp; constructor(protected name: string, protected salary: number, private knownProgrammingLanguaes: string[]) {
&nbsp; &nbsp; &nbsp; &nbsp; super(name, salary)
&nbsp; &nbsp; }
}
</code></pre><p style="margin-left:0;">Como puedes observar, en este ejemplo he modificado el constructor añadiendo un nuevo parámetro y luego utilizo <code>super()</code>. <code>super()</code> es una llamada que se usa dentro del constructor de una clase que extiende de otra clase. Esta llamada se utiliza para invocar el constructor de la clase <strong>padre</strong> y asegurar que la <strong>clase hija</strong> tenga acceso a las propiedades y métodos heredados correctamente.</p><p>Cuando una subclase hereda de otra clase y tiene su propio constructor, es obligatorio llamar a <code>super()</code> antes de usar <code>this</code>. Esto permite que el constructor de la clase padre inicialice sus propias propiedades y ejecute cualquier lógica que se haya definido para esa clase antes de que la subclase defina la suya.</p><h2 style="margin-left:0;">Clases genéricas</h2><p style="margin-left:0;">Las clases genéricas son clases que permiten definir tipos de datos de forma flexible y reutilizable sin especificar el tipo exacto de antemano.&nbsp;</p><p style="margin-left:0;">Esto se logra mediante <strong>parámetros de tipo</strong>, que se representan con letras entre corchetes angulares (<code>&lt;T&gt;</code>, <code>&lt;U&gt;</code>, etc.).&nbsp;</p><p style="margin-left:0;">Las clases genéricas permiten que el tipo de datos se determine en el momento en que se instancian, por lo que en ese momento es cuando determinamos que tipo de dato va a utilizar.</p><p style="margin-left:0;">Mejorando el ejemplo anterior, podemos añadir en la clase <code>Developer</code> el tipo de dato y enviarlo como se explicó anteriormente para después utilizarlo:</p><pre><code class="language-typescript">import { Employee } from "./Employee";


export class Developer&lt;T&gt; extends Employee {
&nbsp; &nbsp; &nbsp;
&nbsp; &nbsp; constructor(
&nbsp; &nbsp; &nbsp; &nbsp; protected name: string,
&nbsp; &nbsp; &nbsp; &nbsp; protected salary: number,
&nbsp; &nbsp; &nbsp; &nbsp; private knownProgrammingLanguaes: string[],
&nbsp; &nbsp; &nbsp; &nbsp; private typeDev: T
&nbsp; &nbsp; ) {
&nbsp; &nbsp; &nbsp; &nbsp; super(name, salary)
&nbsp; &nbsp; }
}


type typeDevs = ''team lead'' | ''senior'' | ''junior''
const dev = new Developer&lt;typeDevs&gt;(''Alber'', 1000, [''php'', ''node.js'', ''python''], ''senior'')</code></pre><p style="margin-left:0px;"><span style="background-color:rgb(255,255,255);color:rgb(51,48,48);">Con esto cerramos este tutorial. Te dejo el </span><a target="_blank" rel="noopener noreferrer" href="https://github.com/albertorc87/typescript-desde-0"><strong>enlace al repositorio</strong></a><span style="background-color:rgb(255,255,255);color:rgb(51,48,48);"> y espero verte de nuevo pronto por aquí porque seguiré añadiendo tutoriales de esta temática 💪.</span></p>', 1, '2024-11-06 16:23:36.701375+00', 'programacion-orientada-objetos-typescript', 'f'),
('Aprende TypeScript Desde Cero: Qué es, instalación y tipado', 'posts/aprende-typescript-desde-cero-que-es-instalacion-y-tipado.png', '<p>TypeScript se ha convertido en una herramienta esencial para desarrolladores que buscan un código JavaScript más estructurado y fácil de mantener. En este tutorial, aprenderás qué es TypeScript, cómo instalarlo y cómo el tipado estático puede ayudarte a escribir código más robusto y seguro, créeme, te dará mucha paz a la larga 🙏.&nbsp;</p><p><strong>Si estás empezando con TypeScript o quieres aprender desde 0</strong>, este artículo te guiará paso a paso, desde la instalación hasta los conceptos básicos del tipado.</p><h2>¿Qué es TypeScript?</h2><p><a target="_blank" rel="noopener noreferrer" href="https://www.typescriptlang.org/">TypeScript</a> es un superconjunto de JavaScript desarrollado por Microsoft que añade una capa adicional de tipado estático. Este lenguaje se compila a JavaScript, permitiendo detectar errores de tipado en tu editor de código y así mejorar la robustez del código.</p><p>A diferencia de JavaScript, que tiene un tipado débil y dinámico, TypeScript permite definir <strong>tipos explícitos</strong>, haciendo el código más seguro y predecible. En cuanto lo pruebes, te aseguro que no querrás volver atrás.</p><h2>¿Qué es el tipado?</h2><p>El tipado permite definir el tipo de valor que una variable o constante puede contener, ya sea un número, una cadena de texto, un objeto, una instancia de clase, un booleano, entre otros. <strong>Esto ayuda a prevenir la reasignación de un valor de tipo distinto</strong> y proporciona información sobre los datos en tiempo de desarrollo, lo cual resulta especialmente útil al trabajar con instancias de clases y estructuras complejas.</p><h2>¿Qué necesito saber para poder seguir este tutorial?</h2><p>Para seguir este tutorial, es importante que tengas<strong> conocimientos previos de JavaScript y Node.js</strong>. Si aún no los tienes, te sugiero adquirir primero esos conocimientos y luego regresar para continuar.</p><h2>Instalación de TypeScript</h2><p>En este tutorial vamos a ver como podemos usarlo tanto desde una web como en la terminal y los ejemplos se podrán ejecutar en cualquiera de los dos casos, aunque yo lo haré desde la terminal.</p><p>Para instalar TypeScript, primero necesitaremos tener instalado <a target="_blank" rel="noopener noreferrer" href="https://nodejs.org/en">Node.js</a> y npm que es el instalador de paquetes de Node.js. Para instalarlo, puedes seguir el siguiente enlace: <a target="_blank" rel="noopener noreferrer" href="https://nodejs.org/en/download/package-manager">https://nodejs.org/en/download/package-manager</a>.</p><p>Una vez instalado Node.js o si ya lo teníais, vamos a crearnos un proyecto en el que trabajar con TypeScript y testar los distintos ejemplos que vamos a ver. Para ello, yo me he creado una carpeta llamada <code>primeros-pasos-ts</code>. Accedemos a ella desde la terminal y lanzamos el siguiente comando para inicializar el proyecto:</p><pre><code class="language-plaintext">npm init -y</code></pre><p>Una vez inicializado el proyecto, lanzamos el siguiente comando para instalar TypeScript y poder utilizarlo en nuestros scripts que funcionarán por la terminal:</p><pre><code class="language-plaintext">npm install --save-dev ts-node</code></pre><p>También vamos a instalar TypeScript de forma global. Esto nos ayudará más adelante para convertir archivos de TypeScript a JavaScript y para generar el archivo de configuración de TypeScript:</p><pre><code class="language-plaintext">npm install -g typescript</code></pre><p>El siguiente paso es generar <strong>el archivo de configuración de TypeScript</strong>, para ello lanzamos el siguiente comando:</p><pre><code class="language-plaintext">tsc --init</code></pre><p>Este archivo establece configuraciones básicas de compilación, interoperabilidad de módulos, verificación estricta y velocidad de compilación. Además, incluye comentarios sobre otras opciones disponibles que se podrían habilitar para personalizar aún más el proyecto según las necesidades específicas.</p><p>Las más destacables son:</p><p>target: "es2016": Especifica que el código TypeScript se compilará a JavaScript compatible con ES2016.</p><p>module: "commonjs": Define que el código de módulos se generará en formato <strong>CommonJS</strong>, comúnmente utilizado en entornos Node.js.</p><p>Ahora, dentro de nuestro proyecto, vamos a crear una carpeta llamada src y dentro de ella un archivo con el nombre de <code>tutorial.ts</code>. Dentro de este archivo añadimos la siguiente línea para confirmar que todo funciona correctamente:</p><pre><code class="language-typescript">console.log(`Hello world`)</code></pre><p>Como ves, es código JavaScript que vamos a usar para confirmar que funciona todo, más adelante vamos a ver código TypeScript.</p><p>Por último, abrimos el archivo <code>package.json</code> y añadimos la siguiente línea dentro de <code>scripts</code>:</p><pre><code class="language-javascript">"run:tutorial": "ts-node src/tutorial.ts",</code></pre><p>De esta forma añadimos el comando para poder ejecutar nuestro script, de tal forma que tu archivo debe lucir así:</p><pre><code class="language-javascript">{
&nbsp; "name": "primeros-pasos-ts",
&nbsp; "version": "1.0.0",
&nbsp; "description": "",
&nbsp; "main": "index.js",
&nbsp; "scripts": {
&nbsp; &nbsp; "run:tutorial": "ts-node src/tutorial.ts",
&nbsp; &nbsp; "test": "echo \"Error: no test specified\" &amp;&amp; exit 1"
&nbsp; },
&nbsp; "keywords": [],
&nbsp; "author": "",
&nbsp; "license": "ISC",
&nbsp; "devDependencies": {
&nbsp; &nbsp; "ts-node": "^10.9.2"
&nbsp; }
}</code></pre><p>Una vez hecho esto, ya podemos ejecutar nuestro script. Para ello, lanzaremos el siguiente comando:</p><pre><code class="language-plaintext">npm run run:tutorial</code></pre><p>Si todo ha ido bien, deberías recibir en tu terminal una respuesta como esta:</p><pre><code class="language-plaintext">&gt; primeros-pasos-ts@1.0.0 run:tutorial
&gt; ts-node src/tutorial.ts
Hello world</code></pre><h2>Compilar de TypeScript a JavaScript</h2><p>Ahora vamos a ver como compilar este archivo TypeScript a JavaScript para poder utilizarlo en una página web. Para ello, vamos a lanzar el siguiente comando:</p><pre><code class="language-plaintext">tsc src/tutorial.ts</code></pre><p>Si ahora vas a tu proyecto, dentro de la carpeta src, además de <code>tutorial.ts</code>, tienes un archivo llamado <code>tutorial.js</code>. Ahora solo necesitas añadirlo a un archivo HTML y si abres este archivo en tu navegador y consultas su consola, podrás ver el mensaje de Hello World.</p><pre><code class="language-html">&lt;!DOCTYPE html&gt;
&lt;html lang="en"&gt;
&lt;head&gt;
&nbsp; &nbsp; &lt;meta charset="UTF-8"&gt;
&nbsp; &nbsp; &lt;meta name="viewport" content="width=device-width, initial-scale=1.0"&gt;
&nbsp; &nbsp; &lt;title&gt;Document&lt;/title&gt;
&lt;/head&gt;
&lt;body&gt;
&nbsp; &nbsp; &lt;script src="src/tutorial.js"&gt;&lt;/script&gt;
&lt;/body&gt;
&lt;/html&gt;</code></pre><p>Si cada vez que realices un cambio en tu archivo de TypeScript quieres que se compile al archivo JavaScript, puedes utilizar el modo observador de TypeScript lanzando el siguiente comando:</p><pre><code class="language-plaintext">tsc --watch src/tutorial.ts</code></pre><p>De esta forma, cada vez que realices un cambio y guardes el archivo, tu archivo JS se actualizará.</p><h2>Tipado en TypeScript</h2><p>Para definir el tipo de una variable en TypeScript, simplemente declárala, seguido de dos puntos (<code>:</code>) y especifica el tipo deseado. Los tipos más comunes incluyen:</p><p><code>string</code>: Para cadenas de texto. Ejemplo: "Hello", ''world''.</p><p><code>number</code>: Para números, incluyendo enteros y decimales. Ejemplo: 42, 3.14.</p><p><code>boolean</code>: Para valores lógicos, true o false.</p><p><code>null</code>: Representa la ausencia de valor. Aunque no es común usar null directamente como tipo, es útil para especificar que algo puede ser null. Más adelante veremos ejemplos de uso.</p><p><code>undefined</code>: Para valores que aún no se han definido. Similar a null, pero indica específicamente que la variable no tiene asignado ningún valor.</p><p><code>any</code>: Aunque no es un tipo "primitivo" en el sentido estricto, any permite que una variable acepte cualquier tipo de valor. Es útil cuando el tipo de la variable no se puede determinar o es flexible, pero reduce la seguridad de tipos. Yo solo lo recomendaría en casos muy puntuales.</p><p>Aquí van algunos ejemplos:</p><pre><code class="language-typescript">const variableNumero: number = 123
const variableTexto: string = ''hola mundo''
const variableBooleano: boolean = true
let variableUndefined: undefined
let variableNull: null
const variableAny: any = ''hola''</code></pre><p>Ahora, si intentas setear un string en una variable de tipo number, recibiremos un aviso por parte de nuestro editor en tiempo de desarrollo.</p><figure class="image image-style-align-center"><img style="aspect-ratio:782/52;" src="/media/image.png" width="782" height="52"></figure><p>También podemos aplicarlo a arreglos, añadiendo corchetes <code>[]</code> después del tipo para indicar que se trata de un array:</p><pre><code class="language-typescript">const mi_array_numero: number[] = [1, 2, 5]
const mi_array_texto: string[] = [''a'', ''b'', ''c'']
const mi_array_valores: any[] = [1, ''dato'', 5]</code></pre><p>En TypeScript, se puede crear una variable que acepte múltiples tipos usando <strong>tipos de unión</strong>. Esto permite definir una variable que pueda tener diferentes tipos de valores posibles, separados por el operador <code>|</code>. Ejemplo:</p><pre><code class="language-typescript">let id: number | null | undefined;</code></pre><p>Esto te puede venir bien en casos donde al principio de tu script no tienes el valor y lo recibes a lo largo de la ejecución.</p><h3>Tipos personalizados</h3><p>En TypeScript, <code>type</code> es una <strong>palabra clave</strong> utilizada para definir un <strong>alias de tipo</strong> o un <strong>tipo personalizado</strong>. Es decir, permite crear un nombre para representar una combinación de tipos, estructuras de datos, o para simplificar tipos complejos y reutilizarlos en el código.</p><p>Por ejemplo:</p><pre><code class="language-typescript">type ID = number | string;
let userId: ID = 123;
userId = "c79c56f3-f252-46d2-9182-719588fdd530"; // Válido, porque puede ser `number` o `string`</code></pre><p>También podemos usarlo en objetos:</p><pre><code class="language-typescript">type Car = {
&nbsp; &nbsp; id: number;
&nbsp; &nbsp; name: string;
&nbsp; &nbsp; model: string;
&nbsp; &nbsp; year?: number;
}


const coche: Car = {
&nbsp; &nbsp; id: 1,
&nbsp; &nbsp; name: ''Fiat'',
&nbsp; &nbsp; model: ''Bravo'',
&nbsp; &nbsp; year: 2011
}</code></pre><p>Si te fijas, en año he añadido el operador <code>?</code>, &nbsp;esto significa que el campo es opcional y si no se añade e intentas acceder a él, el valor será <code>Undefined</code>.</p><h3>Tipos literales</h3><p>Existe un tipo de asignación que se llama <strong>tipo literal</strong> en TypeScript. Los <strong>tipos literales</strong> permiten restringir el valor de una variable a un conjunto específico de valores, en lugar de permitir cualquier valor de un tipo general como <code>string</code> o <code>number</code>. Sería similar al tipo <code>enum</code>.</p><pre><code class="language-typescript">type UserRole = ''admin'' | ''user'' | ''guest''; 
const currentUserRole: UserRole = ''user''; // Solo puede ser ''admin'', ''user'' o ''guest''</code></pre><h3>Enum</h3><p>Además de los tipos literales, contamos con los <code>enums</code>. A diferencia de los tipos literales, en los <code>enums</code> podemos asignarles cualquier valor que deseemos. Si no se les asigna un valor específico, el <code>enum</code> comenzará con un valor numérico por defecto de <code>0</code>, incrementándose en uno para cada campo adicional.</p><pre><code class="language-typescript">enum UserRole {
   Admin,    // 0
   User,     // 1
   Guest     // 2
}
const currentUserRole: UserRole = UserRole.Admin;
console.log(currentUserRole); // Salida: 0

enum ContactType {
    Personal = ''personal'',
    Work = ''work'',
}

const type_contact: ContactType = ContactType.Personal;
console.log(type_contact); // Salida: ''personal''
</code></pre><h3>Interfaces</h3><p>En vez de tipos personalizados, también podemos crear <code>infertaces</code> para nuestros objetos:</p><pre><code class="language-typescript">interface Motorcycle {
&nbsp; &nbsp; id: number;
&nbsp; &nbsp; name: string;
&nbsp; &nbsp; model: string;
&nbsp; &nbsp; year?: number;
}


const moto: Motorcycle = {
&nbsp; &nbsp; id: 1,
&nbsp; &nbsp; name: ''Yamaha'',
&nbsp; &nbsp; model: ''TRACER 7'',
&nbsp; &nbsp; year: 2023
}</code></pre><h3>Tipado en funciones</h3><p>Al igual que en otros lenguajes de programación, en TypeScript podemos aplicar el tipado tanto a los parámetros que pasamos a una función o método como al tipo de resultado que este devuelve:</p><pre><code class="language-typescript">function sumNumbers(num1: number, num2: number): number {
&nbsp; &nbsp; return num1 + num2
}


console.log(sumNumbers(5, 7));


function printMessage(message: string): void {
&nbsp; &nbsp; console.log(message);
}


printMessage(''Mensaje desde mi función'')</code></pre><p>Y con esto cerramos este tutorial. Te dejo el <a target="_blank" rel="noopener noreferrer" href="https://github.com/albertorc87/typescript-desde-0">enlace al repositorio</a> y te recomiendo que compiles el archivo a Javascript si no lo has hecho para que puedas ver el resultado. Para el próximo vamos a seguir con TypeScript y esta vez vamos a ver en profundidad como funcionan las clases.</p>', 1, '2024-11-03 12:18:25.372788+00', 'aprende-typescript-desde-cero-que-es-instalacion-y-tipado', 'f'),
('Parte 8: Cómo crear un panel de administración con Symfony 6', 'posts/crear-panel-administracion-symfony-6.png', '<p>En este tutorial vamos a ver c&oacute;mo crear f&aacute;cilmente un potente panel de administraci&oacute;n con <strong>Symfony 6</strong> de forma sencilla paso a paso.</p>

<p>Hola 👋, despu&eacute;s de un tiempo vuelvo a retomar el blog 😅. Hace unos meses muri&oacute; mi port&aacute;til, as&iacute; que vi que ser&iacute;a buena opci&oacute;n tomarme las cosas con m&aacute;s calma y desconectar un poco del mundillo de la programaci&oacute;n fuera del horario laboral. Despu&eacute;s de este tiempo me veo con m&aacute;s ganas de retomar el <strong>blog</strong> y ahora que tengo un nuevo PC espero que los tutoriales salgan como churros (o al menos escribir art&iacute;culos con m&aacute;s asiduidad 😅).</p>

<p>Antes de empezar&nbsp;🛑 y como siempre, si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/formularios-symfony-6/" target="_blank">Parte 7:&nbsp;C&oacute;mo crear formularios con Symfony 6</a></li>
	<li>Parte 8: C&oacute;mo crear un panel de administraci&oacute;n con Symfony 6 👷📍</li>
</ul>

<h2>Instalar EasyAdmin Bundle 👷</h2>

<p>Como primer paso en este tutorial, vamos a instalar el <strong>bundle de easyadmin</strong>, este nos permitir&aacute; crear un panel de administraci&oacute;n f&aacute;cilmente sin apenas tener que escribir unas cuantas l&iacute;neas de c&oacute;digo.</p>

<p>Para instalarlo debemos lanzar el siguiente comando en la ra&iacute;z del proyecto:</p>

<pre>
<code class="language-bash">symfony composer req "admin:^4"</code></pre>

<p>&nbsp;Una vez instalado, ya podremos empezar a <strong>configurar el panel de administraci&oacute;n</strong> y para ello el siguiente paso ser&aacute; crear el controlador del panel de administraci&oacute;n.</p>

<p>Esto lo podemos hacer de manera sencilla con el siguiente comando:</p>

<pre>
<code class="language-bash">symfony console make:admin:dashboard</code></pre>

<p>&nbsp;Como en otras ocasiones, <strong>aparecer&aacute;&nbsp;el asistente y seleccionaremos los valores por defecto</strong>.</p>

<pre>
<code class="language-bash"> Which class name do you prefer for your Dashboard controller? [DashboardController]:
 &gt;
 In which directory of your project do you want to generate "DashboardController"? [src/Controller/Admin/]:
 &gt;</code></pre>

<p>Lo que hace, b&aacute;sicamente,&nbsp;es crear el controlador y lo guarda dentro de la carpeta <strong>Admin</strong>.</p>

<p>Ahora nos dirigimos al archivo <strong>src\Controller\Admin\DashboardController.ph</strong>p y te comento las partes m&aacute;s importantes.</p>

<p>Como puedes ver, tenemos un <strong>m&eacute;todo index</strong> con la ruta a nuestro panel que por defecto ser&aacute; admin. Para probar en el entorno de local est&aacute; muy bien, pero te recomiendo que si vas a subir un proyecto a producci&oacute;n modifiques la ruta para que sea dif&iacute;cil de localizar por posibles atacantes.</p>

<p>Tambi&eacute;n tenemos un par de m&eacute;todos para a&ntilde;adir configuraciones en nuestro panel que ahora os explicar&eacute; como editarlos para modificar la apariencia de nuestro panel.</p>

<p>Si&nbsp;accedemos a la ruta /admin, podr&aacute;s ver una p&aacute;gina de bienvenida de&nbsp;<strong>EasyAdmin</strong>. M&aacute;s adelante veremos como cambiar eso y mostrar las distintas secciones de nuestro panel de administraci&oacute;n.</p>

<h3>Limitar el acceso al panel de Admin ⛔</h3>

<p>Antes de continuar con la construcci&oacute;n del panel de administraci&oacute;n debemos controlar que <strong>solo puedan acceder los usuarios con el rol de admin</strong> (ROLE_ADMIN). Para ello vamos al archivo&nbsp;<strong>config\packages\security.yaml</strong>&nbsp;y en la secci&oacute;n de access_control, debemos descomentar la l&iacute;nea &quot;- { path: ^/admin, roles: ROLE_ADMIN }&quot;.</p>

<pre>
<code class="language-bash">    access_control:
        - { path: ^/admin, roles: ROLE_ADMIN }</code></pre>

<p>Esto le indicar&aacute; a <strong>Symfony </strong>que solo los usuarios con el rol de admin pueden acceder a la ruta /admin y a las secciones que contenga.</p>

<h3>Crear las distintas secciones de nuestro panel de administraci&oacute;n 🏗️</h3>

<p>El siguiente paso es crear las secciones para administrar las distintas <strong>entidades de nuestro blog</strong>, que son los posts, usuarios, comentarios y tags. Esto nos permitir&aacute; a&ntilde;adir nueva informaci&oacute;n, editarla, leerla y borrarla, vamos lo que com&uacute;nmente se conoce como CRUD.</p>

<p>Para ello lanzaremos el siguiente comando:</p>

<pre>
<code class="language-bash">symfony console make:admin:crud</code></pre>

<p>Aparecer&aacute; el asistente y nos preguntar&aacute; <strong>sobre qu&eacute; entidad queremos crear el CRUD</strong>. Como queremos crearla para las cuatro debemos ir seleccion&aacute;ndolas una a una y elegiremos los valores por defecto. El resultado ser&aacute; que crear&aacute; los controladores para cada entidad.</p>

<h3>Configurar el panel de administraci&oacute;n ⚙️</h3>

<p>Una vez hecho esto, vamos a configurar nuestro panel de administraci&oacute;n. Para ello, quiero que vuelvas al archivo&nbsp;<strong>src\Controller\Admin\DashboardController.php</strong> y reemplaces el c&oacute;digo existente por el siguiente:</p>

<pre>
<code class="language-php">&lt;?php

namespace App\Controller\Admin;

use App\Entity\Comment;
use App\Entity\Post;
use App\Entity\Tag;
use App\Entity\User;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DashboardController extends AbstractDashboardController
{
    #[Route(''/admin'', name: ''admin'')]
    public function index(): Response
    {
        $adminUrlGenerator = $this-&gt;container-&gt;get(AdminUrlGenerator::class);
        return $this-&gt;redirect($adminUrlGenerator-&gt;setController(PostCrudController::class)-&gt;generateUrl());
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            -&gt;setTitle(''Blog Symfony'');
    }

    public function configureMenuItems(): iterable
    {
        yield MenuItem::linkToDashboard(''Dashboard'', ''fa fa-tachometer-alt'');
        yield MenuItem::linktoRoute(''Back to the website'', ''fas fa-home'', ''get_posts'');
        yield MenuItem::linkToCrud(''Posts'', ''fas fa-file-text'', Post::class);
        yield MenuItem::linkToCrud(''Comments'', ''fas fa-comments'', Comment::class);
        yield MenuItem::linkToCrud(''Tags'', ''fas fa-tags'', Tag::class);
        yield MenuItem::linkToCrud(''Users'', ''fas fa-user'', User::class);
    }
}
</code></pre>

<p>Como puedes ver, lo primero que he hecho es importar las entidades de nuestro proyecto. Estas son utilizadas en el m&eacute;todo <strong>configureMenuItems()</strong> que muestra la barra de navegaci&oacute;n del dashboard.</p>

<p>Si te fijas en este m&eacute;todo, lo que hacemos es crear un link para la p&aacute;gina principal del dashboard, otro para la p&aacute;gina principal de nuestra web y los &uacute;ltimos cuatro redirigen a nuestras distintas entidades.</p>

<p>Los distintos par&aacute;metros que reciben cada <strong>MenuItem::linkTo...</strong> es primero un t&iacute;tulo que es el que veremos como nombre de secci&oacute;n. El siguiente es una clase de css. En este caso son iconos de font-awesome que ya utilizamos anteriormente en este tutorial y en el caso de <strong>linkToCrud </strong>las rutas hacia nuestras entidades.</p>

<p>Tambi&eacute;n he modificado el m&eacute;todo index para que ya <strong>no nos dirija a la p&aacute;gina de bienvenida de EasyAdmin</strong>. En el propio m&eacute;todo, antes de reemplazar el contenido nos explica las distintas posibilidades que tenemos. Yo he configurado que cuando acceda al index, nos muestre la p&aacute;gina de posts.</p>

<p>Si accedes al panel de administraci&oacute;n ya podr&aacute;s ver que ahora aparece el listado de post y a la izquierda est&aacute;n las distintas secciones que habilitamos (una para cada entidad).</p>

<h3>Customizar la secci&oacute;n de comentarios 💬</h3>

<p>Ahora que ya tenemos configurado nuestro panel, es hora de <strong>customizarlo </strong>seg&uacute;n nuestras necesidades. Actualmente, ya podr&iacute;amos trabajar con &eacute;l, pero faltan unas cuantas cosas interesantes que seguro te ayudar&aacute;n.</p>

<p>Como ejemplo, vamos a ver los cambios que yo implementar&iacute;a en la secci&oacute;n de comentarios. Estos son:</p>

<ol>
	<li><strong>Eliminar el bot&oacute;n de a&ntilde;adir un nuevo comentario y poder editarlos</strong>. Los comentarios los crear&aacute;n los usuarios desde un post en concreto, as&iacute; que aqu&iacute; no tiene sentido. Tampoco tiene sentido editar los comentarios, si un usuario incumple nuestras normas. Simplemente lo borraremos.</li>
	<li><strong>A&ntilde;adir en el listado el usuario y el t&iacute;tulo del post</strong>. Esto nos vendr&aacute; bien para localizar f&aacute;cilmente qui&eacute;n ha escrito cada comentario y en que post lo ha a&ntilde;adido.</li>
	<li><strong>Buscador</strong>. De esta manera podremos buscar por usuario y por palabras dentro del contenido de los comentarios que nos ser&aacute; &uacute;til para ver si un usuario est&aacute; incumpliendo nuestras normas.</li>
</ol>

<p>Para realizar estos cambios debemos abrir el archivo&nbsp;<strong>src\Controller\Admin\CommentCrudController.php</strong> y en &eacute;l realizaremos los siguientes cambios:</p>

<p>Para eliminar el bot&oacute;n de a&ntilde;adir y editar, a&ntilde;adiremos los siguientes cambios:</p>

<pre>
<code class="language-php">...
use EasyCorp\Bundle\EasyAdminBundle\Config\Crud;
use EasyCorp\Bundle\EasyAdminBundle\Config\Action;
use EasyCorp\Bundle\EasyAdminBundle\Config\Actions;

...
public function configureActions(Actions $actions): Actions
{
    return $actions
        -&gt;disable(Crud::PAGE_DETAIL, Action::NEW)
        -&gt;disable(Crud::PAGE_DETAIL, Action::EDIT)
    ;
}
...</code></pre>

<p>En &eacute;l importamos las librer&iacute;as que necesitamos y crearemos el m&eacute;todo <strong>configureActions </strong>en el cual deshabilitaremos la acci&oacute;n de NEW y EDIT.</p>

<p>Para configurar la informaci&oacute;n que queremos buscar y adem&aacute;s a&ntilde;adir el orden en el que se mostrar&aacute;n los comentarios y como nombrar las etiquetas de nuestra entidad en singular y plural, a&ntilde;adiremos el siguiente m&eacute;todo:</p>

<pre>
<code class="language-php">public function configureCrud(Crud $crud): Crud
{
    return $crud
        -&gt;setEntityLabelInSingular(''Comment'')
        -&gt;setEntityLabelInPlural(''Comments'')
        -&gt;setSearchFields([''user.username'', ''user.email'', ''content''])
        -&gt;setDefaultSort([''created_at'' =&gt; ''DESC''])
    ;
}</code></pre>

<p>Como puedes observar, en la l&iacute;nea &quot;<strong>-&gt;setSearchFields([&#39;user.username&#39;, &#39;user.email&#39;, &#39;content&#39;])</strong>&quot; indicamos porque campos queremos poder buscar. Como el nombre y email del usuario son de otra entidad, debemos acceder a &eacute;l desde user y el nombre del campo. Tambi&eacute;n es necesario que exista la relaci&oacute;n entre tablas, si no, no funcionar&aacute; (nosotros ya lo hicimos cuando creamos las entidades, as&iacute; que no te preocupes).</p>

<p>Por &uacute;ltimo, modificaremos que vamos a mostrar en el listado de comentarios. Para ello modificamos el m&eacute;todo&nbsp;<strong>configureFields</strong>:</p>

<pre>
<code class="language-php">public function configureFields(string $pageName): iterable
{
    return [
        IdField::new(''id''),
        TextField::new(''user.username'', ''User''),
        TextField::new(''post.title'', ''Post''),
        DateTimeField::new(''created_at'', ''Created At''),
        TextEditorField::new(''content''),
    ];
}</code></pre>

<p>En &eacute;l, he a&ntilde;adido que aparezca el ID del comentario, el nombre de usuario, el t&iacute;tulo del post, fecha de creaci&oacute;n y el contenido. Al igual que en la parte de la b&uacute;squeda, username y title al ser campos que no pertenecen a la entidad de comentarios, pero si est&aacute;n relacionados, tendremos que acceder a ellos desde user y post.</p>

<p>Como segundo par&aacute;metro, podemos <strong>renombrar el nombre de la cabecera del listado</strong>.</p>

<p>Seg&uacute;n el tipo de campo deber&aacute;s seleccionar la clase a usar, aunque es bastante intuitivo. Por ejemplo, para created_at que es un campo de fecha, us&eacute; <strong>DateTimeField</strong>.</p>

<p>Con esto ya tienes informaci&oacute;n para poder seguir por tu cuenta, as&iacute; que te propongo como tarea que a&ntilde;adas las siguientes mejoras en el panel de administraci&oacute;n:</p>

<ol>
	<li>En el listado de posts aparezca el nombre del usuario que lo crea.</li>
	<li>Al crear un nuevo post que el usuario sea el creador del post y esto no se pueda editar</li>
	<li>Al editar el usuario no aparezca el campo de password.</li>
</ol>

<p>Tambi&eacute;n te dejo los links a la <strong>documentaci&oacute;n</strong> por si tienes alguna duda:</p>

<p><a href="https://symfony.com/doc/6.2/the-fast-track/en/9-backend.html" target="_blank">https://symfony.com/doc/6.2/the-fast-track/en/9-backend.html</a></p>

<p><a href="https://symfony.com/bundles/EasyAdminBundle/4.x/dashboards.html" target="_blank">https://symfony.com/bundles/EasyAdminBundle/4.x/dashboards.html</a></p>

<p>Como siempre te dejo en el enlace al repo&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-panel-administracion-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-panel-administracion-symfony-6</a></p>

<p>Y con esto cerramos este tutorial. Para el pr&oacute;ximo veremos como crear tests en nuestro proyecto&nbsp;y as&iacute; tener una aplicaci&oacute;n m&aacute;s robusta y menos propensa a fallos cada vez que subamos cambios.</p>', 1, '2023-03-19 13:35:45.002351+00', 'crear-panel-administracion-symfony-6', 'f'),
('Parte 7: Cómo crear formularios con Symfony 6', 'posts/formularios-symfony-6.png', '<p>En el tutorial de esta semana vamos a ver <strong>como crear formularios con Symfony 6</strong>, guardar informaci&oacute;n, validar datos y restringir para que solo lo puedan utilizar usuarios autenticados.</p>

<p>👋&iexcl;Hola! Ya estamos en la s&eacute;ptima parte de esta serie de tutoriales, la web ya va tomando forma y cada vez queda menos para dar por finalizada esta primera parte. Tengo m&aacute;s ideas pensadas para trabajar con este framework. <strong>Una serie para crear una API y otra para crear una web aplicando DDD, <a href="https://cosasdedevs.com/posts/introduccion-arquitectura-hexagonal/" target="_blank">arquitectura hexagonal</a> y <a href="https://cosasdedevs.com/posts/que-es-cqrs/" target="_blank">CQRS</a></strong> as&iacute; que estate atento para no perderte nada.</p>

<p>Antes de empezar&nbsp;🛑 y como siempre, si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
	<li>Parte 7:&nbsp;C&oacute;mo crear formularios con Symfony 6 📍</li>
	<li>Parte 8: En progreso 👷</li>
</ul>

<h2>Crear un formulario para guardar comentarios</h2>

<p><strong>Symfony </strong>tiene un sistema para facilitarnos trabajar con formularios. Desde una clase PHP podemos configurar la entidad con la que trabaja, validaci&oacute;n de datos y configuraci&oacute;n para despu&eacute;s renderizarla en una plantilla. <strong>Esto nos ahorrar&aacute; el trabajo repetitivo que tendr&iacute;amos que hacer si utilizamos formularios normales</strong>.</p>

<p>Una vez tengamos la clase, podemos enviarla por par&aacute;metro desde el controlador a la plantilla y se renderizar&aacute; autom&aacute;ticamente.</p>

<p>En nuestro caso vamos a crear un formulario para que <strong>un usuario autenticado pueda crear comentarios en un post</strong> de tal forma que ese comentario quede relacionado tanto con el post como con el usuario.</p>

<p>Para ello, el primer paso es crear la clase para el formulario y esto lo haremos desde la terminal con el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:form</code></pre>

<p>Se nos abrir&aacute; el asistente y nos preguntar&aacute; que nombre queremos darle al formulario. Lo llamaremos&nbsp;<strong>CommentType</strong>. Despu&eacute;s nos preguntar&aacute; con qu&eacute; entidad estar&aacute; relacionado, en este caso, con la entidad <strong>Comment</strong>.</p>

<pre>
<code class="language-bash">The name of the form class (e.g. DeliciousGnomeType):
&gt; CommentType

The name of Entity or fully qualified model class name that the new form will be bound to (empty for none):
&gt; Comment

created: src/Form/CommentType.php</code></pre>

<p>Al finalizar nos crear&aacute; un archivo llamado&nbsp;<strong>src/Form/CommentType.php</strong>. Este archivo contendr&aacute; un m&eacute;todo llamado <strong>buildForm</strong> el cual contiene una variable <strong>$builder</strong> con los campos de nuestra tabla <strong>Comment</strong>.</p>

<p>En esta variable es donde podremos configurar nuestro formulario para que por ejemplo un campo tenga atributos adicionales, modificar o eliminar la etiqueta por defecto, tambi&eacute;n validaciones y muchas m&aacute;s cosas que pod&eacute;is ver en la documentaci&oacute;n que os dejo aqu&iacute; 👇</p>

<p><a href="https://symfony.com/doc/current/forms.html" target="_blank">https://symfony.com/doc/current/forms.html</a></p>

<p>Abrimos el archivo <strong>CommentType</strong> y vamos a a&ntilde;adir las siguientes modificaciones:</p>

<pre>
<code class="language-php">...
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
...

public function buildForm(FormBuilderInterface $builder, array $options): void
{
    $builder
        -&gt;add(''content'', null, [''label'' =&gt; false])
        -&gt;add(''Enviar'', SubmitType::class, [
            ''attr'' =&gt; [''class'' =&gt; ''button'']
        ])
    ;
}</code></pre>

<p>Lo primero que he hecho es importar la clase <strong>SubmitType</strong>. Utilizaremos esta clase para poder crear un bot&oacute;n de enviar en el formulario.</p>

<p>Despu&eacute;s, ya en el <strong>$builder</strong> he eliminado todos los campos que no necesitamos, ya que se asignar&aacute;n autom&aacute;ticamente al crear el comentario.</p>

<p>En <strong>add(&#39;content&#39;)</strong> he a&ntilde;adido unas peque&ntilde;as modificaciones. Como segundo par&aacute;metro dentro del add env&iacute;o <strong>null</strong>. Esto significa que al convertirlo en formulario de HTML asignar&aacute; el tipo de input por defecto a un campo de este tipo en la base de datos. Por ejemplo, para el content como en la base de datos es un <strong>longtext</strong>, <strong>Symony lo renderizar&aacute; como un textarea aunque nosotros podr&iacute;amos indicar otro tipo cambiando el null por el tipo que queramos</strong>.</p>

<p>Te dejo un enlace a los distintos tipos 👇</p>

<p><a href="https://symfony.com/doc/current/reference/forms/types.html" target="_blank">https://symfony.com/doc/current/reference/forms/types.html</a></p>

<p>El &uacute;ltimo par&aacute;metro recibe un array de configuraci&oacute;n y en &eacute;l, indico que la label ser&aacute; igual a false. <strong>De esta manera evitaremos que renderice una label junto al textarea</strong>.</p>

<p>Por &uacute;ltimo, a&ntilde;ado el bot&oacute;n de enviar. Como primer par&aacute;metro indico el texto que quiero que aparezca en el bot&oacute;n. Despu&eacute;s y ya que este campo (como es obvio) no existe en la base de datos, le tengo que indicar obligatoriamente qu&eacute; tipo de campo quiero que sea, en este caso <strong>SubmitType</strong>. Para finalizar, en los par&aacute;metros de configuraci&oacute;n he a&ntilde;adido la clase CSS que quiero que utilice este bot&oacute;n para que se vea bonito.</p>

<h3>Enviar el formulario desde el controlador</h3>

<p>Ahora que tenemos configurado nuestro formulario, es hora de enviarlo a nuestra plantilla. Tambi&eacute;n necesitaremos crear un nuevo m&eacute;todo para guardar los comentarios, as&iacute; que abrimos el archivo&nbsp;<strong>src\Controller\BlogController.php</strong> y a&ntilde;adimos los siguientes cambios:</p>

<pre>
<code class="language-php">...
use App\Form\CommentType;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Comment;
...

#[Route(''/posts/{slug}'', name: ''get_post'', methods: [''GET''])]
public function getPost(Post $post): Response
{
    $form = $this-&gt;createForm(CommentType::class);
    return $this-&gt;render(''blog/post.html.twig'', [
        ''post'' =&gt; $post,
        ''form'' =&gt; $form-&gt;createView(),
    ]);
}

#[Route(''/posts/{slug}'', name: ''save_comment'', methods: [''POST''])]
public function saveComment(Request $request, Post $post, EntityManagerInterface $entityManager): Response
{
    $comment = new Comment();
    $comment-&gt;setUser($this-&gt;getUser());
    $comment-&gt;setPost($post);
    $comment-&gt;setCreatedAt(new DateTimeImmutable());

    $form = $this-&gt;createForm(CommentType::class, $comment);
    $form-&gt;handleRequest(($request));

    if ($form-&gt;isSubmitted() &amp;&amp; $form-&gt;isValid()) {
        $entityManager-&gt;persist($comment);
        $entityManager-&gt;flush();

        return $this-&gt;redirectToRoute(''get_post'', [''slug'' =&gt; $post-&gt;getSlug()]);
    }
    return $this-&gt;render(''blog/post.html.twig'', [
        ''post'' =&gt; $post,
        ''form'' =&gt; $form-&gt;createView(),
    ]);
}</code></pre>

<p>Como ves, primero he a&ntilde;adido unos cuantos <strong>uses </strong>como la clase de nuestro <strong>formulario</strong>, la clase <strong>Request</strong> de <strong>Symfony</strong>, el <strong>EntityManagerInterface </strong>que utilizaremos para persistir nuestros datos y la entidad <strong>Comment</strong>.</p>

<p>En el m&eacute;todo <strong>getPost </strong>el cual ya exist&iacute;a anteriormente, he a&ntilde;adido en el enrutamiento que solo permita el m&eacute;todo <strong>GET </strong>y despu&eacute;s&nbsp;creamos una instancia de la clase del formulario y lo enviamos&nbsp;por par&aacute;metro a la plantilla.</p>

<p>Por &uacute;ltimo, tenemos el m&eacute;todo <strong>saveComment </strong>el cual se encargar&aacute; de guardar los comentarios cuando un usuario pulse en enviar y tiene la misma ruta que el m&eacute;todo anterior, pero en este caso el m&eacute;todo ser&aacute; de tipo <strong>POST</strong>.</p>

<p>En este m&eacute;todo creamos una instancia de la entidad <strong>Comment </strong>y a&ntilde;adimos los par&aacute;metros que no vamos a recibir del formulario como son <strong>el usuario, el post y la fecha de creaci&oacute;n</strong>.&nbsp;</p>

<p>Con la l&iacute;nea&nbsp;<strong>$form = $this-&gt;createForm(CommentType::class, $comment);</strong> creamos una instancia de nuestra clase de formulario ya con la informaci&oacute;n que hemos asignado a la entidad en el paso anterior y con la l&iacute;nea&nbsp;<strong>$form-&gt;handleRequest(($request));</strong> verificamos si ha sido enviado el formulario o no,&nbsp;adem&aacute;s asigna al objeto <strong>$comment</strong> el campo <strong>content</strong> enviado por el formulario.</p>

<p>Despu&eacute;s realizamos la doble validaci&oacute;n de que el formulario <strong>ha sido enviado</strong> y <strong>es v&aacute;lido</strong>&nbsp;(if ($form-&gt;isSubmitted() &amp;&amp; $form-&gt;isValid())) y si es as&iacute;, persistimos los datos y redirigimos al post.</p>

<p>Si hay alg&uacute;n error, volvemos a la p&aacute;gina del post y mostrar&aacute; el error al validar el formulario.</p>

<h3>Validaci&oacute;n de formularios</h3>

<p>Actualmente, en nuestro formulario no tenemos ninguna validaci&oacute;n aparte de que no nos env&iacute;e un comentario vac&iacute;o. Para resolver eso, podemos usar <strong>el sistema de validaci&oacute;n de Symfony</strong>. Este nos permitir&aacute; desde la entidad a&ntilde;adir validaciones y restricciones.</p>

<p>En nuestro caso <strong>quiero limitar con un n&uacute;mero m&iacute;nimo y m&aacute;ximo el tama&ntilde;o de un comentario</strong>, por ejemplo un m&iacute;nimo de 5 caracteres y un m&aacute;ximo de 500. Para implementar este control, vamos al archivo&nbsp;<strong>src\Entity\Comment.php</strong> y a&ntilde;adimos los siguientes cambios:</p>

<pre>
<code class="language-php">...
use Symfony\Component\Validator\Constraints as Assert;
...

#[ORM\Column(type: Types::TEXT)]
#[Assert\Length(min: 5, max: 500)]
private ?string $content = null;</code></pre>

<p>Al a&ntilde;adir la l&iacute;nea&nbsp;<strong>#[Assert\Length(min: 5, max: 500)]</strong>, para el campo <strong>content </strong>validar&aacute; que el tama&ntilde;o est&eacute; en ese l&iacute;mite de caracteres y si no, enviar&aacute; un mensaje de error.</p>

<p>Si quer&eacute;is aprender m&aacute;s acerca de las validaciones os dejo en enlace a la documentaci&oacute;n 👇</p>

<p><a href="https://symfony.com/doc/current/validation.html" target="_blank">https://symfony.com/doc/current/validation.html</a></p>

<p>Tambi&eacute;n pod&eacute;is a&ntilde;adir validaciones adicionales desde el <strong>$builder</strong> en la clase del formulario, os dejo la info 👇</p>

<p><a href="https://symfony.com/doc/current/forms.html#form-type-options" target="_blank">https://symfony.com/doc/current/forms.html#form-type-options</a></p>

<h3>Renderizado del formulario</h3>

<p>Ya lo tenemos todo casi listo, as&iacute; que es hora de renderizar nuestro formulario en la plantilla y as&iacute; poder probar que todo funciona correctamente, pero antes vamos a a&ntilde;adir unos nuevos estilos para que todo se vea mejor. Para ello vamos al archivo&nbsp;<strong>assets\styles\app.css</strong> y a&ntilde;adimos lo siguiente:</p>

<pre>
<code class="language-css">.form-blog div textarea {
    @apply py-1 px-2 border-slate-300 border rounded w-full h-28;
}

.form-blog a {
    @apply text-blue-400 underline;
}

.form-blog a:hover {
    @apply text-blue-500;
}

.form-blog div ul li {
    @apply text-red-500 font-semibold;
}</code></pre>

<p>Una vez hecho esto, vamos a la template para pintar nuestro formulario. Para ello abrimos el archivo&nbsp;<strong>templates\blog\post.html.twig</strong> y a&ntilde;adimos los siguientes cambios:</p>

<pre>
<code class="language-html">&lt;div class="m-1 text-left"&gt;
  &lt;hr&gt;
  &lt;div class="form-blog"&gt;
      {% if app.user %}
          &lt;p class="text-left"&gt;
              Escribe un comentario &lt;strong&gt;{{ app.user.username }}:&lt;/strong&gt;
          &lt;/p&gt;
          {{ form(form, { ''action'': path(''save_comment'', { slug: post.slug }) }) }}
      {% else %}
          &lt;p class="text-left py-2"&gt;
          Debes estar autenticado para escribir un comentario &lt;a href="{{ path(''app_login'') }}"&gt;Login&lt;/a&gt;
          &lt;/p&gt;
      {% endif %}
  &lt;/div&gt;
  &lt;hr&gt;
  &lt;h3 class="text-lg font-semibold py-2"&gt;Comentarios&lt;/h3&gt;
  &lt;hr&gt;
  &lt;div class="my-3 text-left"&gt;
      {% for comment in post.comments %}
          &lt;div class="p-3"&gt;
              &lt;div&gt;Escrito por: &lt;strong&gt;{{comment.user.username}}&lt;/strong&gt;&lt;/div&gt;
              &lt;div class="text-sm text-stone-500"&gt;{{comment.content}}&lt;/div&gt;
          &lt;/div&gt;
          &lt;hr&gt;
      {% endfor %}
  &lt;/div&gt;
&lt;/div&gt;</code></pre>

<p>Por si no identificas muy bien la parte sustituida, lo que he hecho es a&ntilde;adir, justo antes de los comentarios, un nuevo div con un bloque if. En&nbsp;<strong>{% if app.user %}</strong> comprueba si hay un usuario autenticado. Si es as&iacute;, pintamos el formulario con esta l&iacute;nea&nbsp;<strong>{{ form(form, { &#39;action&#39;: path(&#39;save_comment&#39;, { slug: post.slug }) }) }}</strong> en la cual indicamos la ruta donde debe enviar la informaci&oacute;n. Ya por defecto a&ntilde;ade que lo env&iacute;e por m&eacute;todo post as&iacute; que no tenemos que a&ntilde;adirlo.</p>

<p>Si el usuario no est&aacute; autenticado, entra en el bloque else y&nbsp;muestra el aviso de que para comentar hay que acceder con su usuario.</p>

<p>Por lo dem&aacute;s, <strong>solo he a&ntilde;adido unos cuantos cambios de dise&ntilde;o para que se vea mejor</strong>.</p>

<p>Si ahora accedes a un post, podr&aacute;s ver una opci&oacute;n u otra dependiendo de si est&aacute;s autenticado o no. Puedes probar a escribir unos cuantos comentarios y tambi&eacute;n la validaci&oacute;n de tama&ntilde;o m&iacute;nimo y m&aacute;ximo para verificar que todo est&aacute; 👍. Tambi&eacute;n te invito a que le des una vuelta al tema de validaciones y si quieres <strong>puedes a&ntilde;adirle las que creas convenientes</strong> 😉.</p>

<p>Y con esto cerramos este tutorial. Para el pr&oacute;ximo vamos a crear un panel de administraci&oacute;n que gracias a las herramientas de <strong>Symfony 6</strong> nos lo pondr&aacute; muy f&aacute;cil 💪.</p>

<p>Como siempre, os dejo el enlace al repo&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/formularios-symfony-6">https://github.com/albertorc87/blog-symfony-tutorial/tree/formularios-symfony-6</a></p>', 1, '2023-03-04 14:04:27.095759+00', 'formularios-symfony-6', 'f'),
('Parte 6: Autenticación y registro con Symfony 6', 'posts/autenticacion-registro-symfony-6.png', '<p>En el tutorial de esta semana vamos a aprender&nbsp;<strong>como generar autom&aacute;ticamente el sistema de registro y autenticaci&oacute;n con Symfony 6</strong>. Gracias a las herramientas que incluye <strong>Symfony 6</strong>, este realizar&aacute; la mayor parte del trabajo y nosotros solo tendremos que realizar unos peque&ntilde;os ajustes para ponerlo a punto 💪.</p>

<p>👋 &iexcl;Hola! Cuando empec&eacute; con esta serie de tutoriales sobre <strong>Symfony 6</strong> no esperaba que se alargase m&aacute;s de 6 tutoriales, pero aqu&iacute; estamos, justo en el sexto y creo que tengo para otros dos o tres m&aacute;s, bienvenidos, sean 🤣.</p>

<p>Esto significa que estamos profundizando bastante en el framework y esto me sirve para aprender m&aacute;s sobre &eacute;l y ya de paso tu tambi&eacute;n 💪.</p>

<p>Antes de empezar&nbsp;🛑 y como siempre, si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li>Parte 6: Autenticaci&oacute;n y registro con Symfony 6 📍</li>
	<li>Parte 7: En progreso 👷</li>
</ul>

<h2>Generar sistema de autenticaci&oacute;n con Symfony 6</h2>

<p>Para empezar a trabajar con el sistema de login lo primero que debemos hacer es crear la entidad de usuarios con el comando <strong>php bin/console make:user</strong>, pero&nbsp;esto ya lo hicimos en <a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/#entidad-usuarios" target="_blank">la segunda parte de esta serie de tutoriales,</a>&nbsp;as&iacute; que primer paso hecho ✅.</p>

<p>Este paso&nbsp;solo te har&iacute;a falta si no est&aacute;s siguiendo la serie completa. Puedes ir a ese tutorial para entender mejor el funcionamiento de la entidad <strong>User</strong>.</p>

<p>Ahora vamos a utilizar un comando&nbsp;de <strong>Symfony </strong>que no hab&iacute;amos visto hasta ahora,&nbsp;el cual nos <strong>generar&aacute; la plantilla de login, actualizar&aacute; la configuraci&oacute;n de seguridad, crear&aacute; la clase de autenticaci&oacute;n y el controlador para realizar el login/logout</strong>. Vamos a la terminal y lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:auth</code></pre>

<p>Como siempre, aparecer&aacute; el asistente, el cual nos har&aacute; tres preguntas en las que yo respond&iacute; lo siguiente:</p>

<ul>
	<li>En la primera pregunta &quot;<strong>What style of authentication do you want?</strong>&quot;, seleccionamos [1] Login form authenticator.</li>
	<li>En la siguiente pregunta &quot;<strong>The class name of the authenticator to create (e.g. AppCustomAuthenticator)</strong>&quot;,&nbsp;yo lo voy a llamar <strong>BlogAuthenticator</strong>.</li>
	<li>Despu&eacute;s me pide que elija un nombre para El SecurityController, yo dejo el que viene por defecto.</li>
	<li>En la siguiente pregunta &quot;<strong>Do you want to generate a &#39;/logout&#39; URL?</strong>&quot;, seleccionamos <strong>yes</strong>.</li>
	<li>Luego nos pregunta si queremos soporte para el remember me, seleccionamos yes.</li>
	<li>Por &uacute;ltimo nos pregunta como deber&iacute;a funcionar el remember me y seleccionamos la primera opci&oacute;n.</li>
</ul>

<pre>
<code class="language-bash"> What style of authentication do you want? [Empty authenticator]:
  [0] Empty authenticator
  [1] Login form authenticator
 &gt; 1
 The class name of the authenticator to create (e.g. AppCustomAuthenticator):
 &gt; BlogAuthenticator
 Choose a name for the controller class (e.g. SecurityController) [SecurityController]:
 &gt;
 Do you want to generate a ''/logout'' URL? (yes/no) [yes]:
 &gt;
 Do you want to support remember me? (yes/no) [yes]:
 &gt;
 How should remember me be activated? [Activate when the user checks a box]:
  [0] Activate when the user checks a box
  [1] Always activate remember me
 &gt; 0
 created: src/Security/BlogAuthenticator.php
 updated: config/packages/security.yaml
 created: src/Controller/SecurityController.php
 created: templates/security/login.html.twig</code></pre>

<p>Ahora vamos a utilizar otro <strong>comando </strong>que nos servir&aacute; para generar todo <strong>el sistema de registro</strong>, as&iacute; que volvemos a la terminal y ejecutamos el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:registration-form</code></pre>

<p>Se abrir&aacute; el asistente y damos las siguientes respuestas:</p>

<ul>
	<li>En &quot;<strong>Do you want to add a @UniqueEntity validation annotation on your User class to make sure duplicate accounts aren&#39;t created?</strong>&quot;, indicamos yes, de esta forma evitaremos emails duplicados.</li>
	<li>En &quot;<strong>Do you want to send an email to verify the user&#39;s email address after registration?</strong>&quot;, ya que no vamos a configurar el sistema de env&iacute;o de emails, le decimos que no.</li>
	<li>En &quot;<strong>Do you want to automatically authenticate the user after registration?</strong>&quot;, indicamos yes.</li>
</ul>

<pre>
<code class="language-bash">Creating a registration form for App\Entity\User
 Do you want to add a @UniqueEntity validation annotation on your User class to make sure duplicate accounts aren''t created? (yes/no) [yes]:
 &gt;
 Do you want to send an email to verify the user''s email address after registration? (yes/no) [yes]:
 &gt; no
 Do you want to automatically authenticate the user after registration? (yes/no) [yes]:
 &gt;
 updated: src/Entity/User.php
 created: src/Form/RegistrationFormType.php
 created: src/Controller/RegistrationController.php
 created: templates/registration/register.html.twig</code></pre>

<p>Como puedes ver, <strong>se ha editado la entidad de User</strong>. El cambio que ha realizado es&nbsp;que ha convertido el email en clave &uacute;nica para evitar emails duplicados.</p>

<p>Ahora podemos revisar&nbsp;<strong>src\Controller\RegistrationController.php</strong> y&nbsp;<strong>src\Controller\SecurityController.php</strong> y podr&aacute;s&nbsp;ver que tenemos tanto los m&eacute;todos como las rutas definidas para el registro, login y logout as&iacute; que vamos a a&ntilde;adirlas tambi&eacute;n en nuestra barra de navegaci&oacute;n.</p>

<h3>Modificaci&oacute;n de templates</h3>

<p>Abrimos <strong>templates\base.html.twig</strong> y sustituimos la etiqueta HTML <strong>ul </strong>y su contenido por el siguiente:</p>

<pre>
<code class="language-django">&lt;ul class="hidden sm:flex justify-between w-96"&gt;
    &lt;li&gt;
        &lt;a href="{{ path(''get_posts'') }}"&gt;Inicio&lt;/a&gt;
    &lt;/li&gt;
    &lt;li&gt;
        &lt;a href="http://"&gt;Etiquetas&lt;/a&gt;
    &lt;/li&gt;
    &lt;li&gt;
        &lt;a href="http://"&gt;Acerca de mi&lt;/a&gt;
    &lt;/li&gt;
    {% if app.user %}
        &lt;li&gt;
            &lt;a href="{{ path(''app_logout'') }}"&gt;Cerrar sesión&lt;/a&gt; |
            &lt;strong&gt;{{ app.user.username }}&lt;/strong&gt;
        &lt;/li&gt;
    {% else %}
        &lt;li&gt;
            &lt;a href="{{ path(''app_login'') }}"&gt;Login&lt;/a&gt;
        &lt;/li&gt;
        &lt;li&gt;
            &lt;a href="{{ path(''app_register'') }}"&gt;Registro&lt;/a&gt;
        &lt;/li&gt;
    {% endif %}
&lt;/ul&gt;</code></pre>

<p>Cuando estamos autenticados, <strong>Symfony </strong>env&iacute;a a la plantilla dentro de<strong> app.user</strong> la informaci&oacute;n del usuario, as&iacute; que lo que hacemos es controlar si existe con <strong>una condici&oacute;n if</strong>. Si es as&iacute;, a&ntilde;adimos al men&uacute; de navegaci&oacute;n el link para cerrar sesi&oacute;n y el nombre del usuario. En el caso contrario mostramos los enlaces al login y al registro.</p>

<p>Tambi&eacute;n he modificado una de las clases de la etiqueta <strong>ul </strong>(w-64 por w-96), ya que ahora que hay m&aacute;s elementos, quedan muy juntos si no ampliamos el tama&ntilde;o.</p>

<p>Si pulsamos en cualquiera de las dos opciones (login y registro), podemos ver tanto el formulario de autenticaci&oacute;n como de registro, pero ahora se ven un poco feos &iquest;No? Vamos a mejorar el formato y para ello primero abrimos el archivo <strong>assets\styles\app.css</strong> para a&ntilde;adir unas cuantas clases:</p>

<pre>
<code class="language-css">.button {
    @apply inline-block p-2 mx-1 bg-orange-300 text-white uppercase text-xs font-medium text-center;
}

.button:hover {
    @apply bg-orange-400;
}

.header-login-register {
    @apply text-xl font-medium py-2;
}

.form-blog {
    @apply text-center;
}

.form-blog div {
    @apply p-2;
}

.form-blog div input[type=text], 
.form-blog div input[type=password], 
.form-blog div input[type=email] {
    @apply py-1 px-2 border-slate-300 border rounded w-full;
}

.form-blog label, .form-blog input {
    @apply block text-left;
}</code></pre>

<p>Tambi&eacute;n vamos a modificar el archivo&nbsp;<strong>templates\base.html.twig</strong> para tener la opci&oacute;n de no mostrar el footer en la p&aacute;gina de registro y login as&iacute; que lo abrimos y a&ntilde;adimos la siguiente modificaci&oacute;n:</p>

<pre>
<code class="language-django">{% block footer %}
&lt;footer class="text-center text-white bg-teal-900 py-4"&gt;
    &lt;ul class="md:flex justify-center"&gt;
        &lt;li&gt;&lt;a href="http://"&gt;Hola&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="http://"&gt;Privacidad&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&lt;a href="http://"&gt;Términos y condiciones&lt;/a&gt;&lt;/li&gt;
        &lt;li&gt;&amp;#174; {{''now''|date(''Y'')}} Mi blog con Symfony 6 y TailwindCSS 🧑‍💻&lt;/li&gt;
    &lt;/ul&gt;
&lt;/footer&gt;
{% endblock %}</code></pre>

<p>Aqu&iacute; lo que hemos hecho <strong>es meter el footer en un block</strong>, de esta forma podremos modificarlo en las templates de login y registro para que no muestre nada. En las dem&aacute;s plantillas, al no declarar el bloque, mostrar&aacute; este por defecto.</p>

<p>El siguiente paso es abrir la template&nbsp;<strong>templates\security\login.html.twig</strong> la cual contiene el formulario de autenticaci&oacute;n y reemplazamos su contenido por el siguiente:</p>

<pre>
<code class="language-django">{% extends ''base.html.twig'' %}

{% block title %}Iniciar sesión{% endblock %}

{% block body %}
&lt;div class="mt-10 md:flex justify-center"&gt;
    &lt;div class="max-w-full flex-row justify-center mb-8 md:mr-2"&gt;
        &lt;form method="post"&gt;
            {% if error %}
                &lt;div class="alert alert-danger"&gt;{{ error.messageKey|trans(error.messageData, ''security'') }}&lt;/div&gt;
            {% endif %}

            {% if app.user %}
                &lt;div class="mb-3"&gt;
                    You are logged in as {{ app.user.userIdentifier }}, &lt;a href="{{ path(''app_logout'') }}"&gt;Logout&lt;/a&gt;
                &lt;/div&gt;
            {% endif %}

            &lt;div class="form-blog"&gt;
                &lt;h1 class="header-login-register"&gt;Entra en mi blog de Symfony&lt;/h1&gt;
                &lt;div&gt;
                    &lt;label for="inputEmail" class="required"&gt;Email:&lt;/label&gt;
                    &lt;input type="email" value="{{ last_username }}" name="email" id="inputEmail" autocomplete="email" required autofocus&gt;
                &lt;/div&gt;
                &lt;div&gt;
                    &lt;label for="inputPassword" class="required"&gt;Contraseña:&lt;/label&gt;
                    &lt;input type="password" name="password" id="inputPassword" autocomplete="current-password" required&gt;
                &lt;/div&gt;

                &lt;input type="hidden" name="_csrf_token"
                    value="{{ csrf_token(''authenticate'') }}"
                &gt;

                &lt;button class="button" type="submit"&gt;
                    Iniciar sesión
                &lt;/button&gt;
            &lt;/div&gt;
        &lt;/form&gt;
    &lt;/div&gt;
&lt;/div&gt;
{% endblock %}
{% block footer %}{% endblock %}</code></pre>

<p>Como puedes observar, <strong>los cambios en cuanto a la versi&oacute;n anterior solo son de estilos </strong>y a&ntilde;adir el bloque&nbsp;<strong>{% block footer %}{% endblock %}</strong> vac&iacute;o para que <strong>no nos muestre el footer por defecto</strong>.</p>

<p>Por &uacute;ltimo, vamos al archivo&nbsp;<strong>templates\registration\register.html.twig</strong> y modificamos su contenido por el siguiente:</p>

<pre>
<code class="language-django">{% extends ''base.html.twig'' %}

{% block title %}Regístrate en mi blog de Symfony{% endblock %}

{% block body %}
&lt;div class="mt-10 md:flex justify-center"&gt;
    &lt;div class="max-w-full flex-row justify-center mb-8 md:mr-2 text-center"&gt;
    &lt;h1 class="header-login-register"&gt;Regístrate en mi blog de Symfony&lt;/h1&gt;

    {{ form_start(registrationForm) }}

        &lt;div class="form-blog"&gt;
            {{ form_row(registrationForm.email, {
                label: ''Email:''
            }) }}
            {{ form_row(registrationForm.username, {
                label: ''Nombre de usuario:''
            }) }}
            {{ form_row(registrationForm.plainPassword, {
                label: ''Contraseña:''
            }) }}
            {{ form_row(registrationForm.agreeTerms, {
                label: ''Aceptar términos:''
            }) }}

            &lt;button type="submit" class="button"&gt;Registrarse&lt;/button&gt;
        &lt;/div&gt;
    {{ form_end(registrationForm) }}
    &lt;/div&gt;
&lt;/div&gt;
{% endblock %}
{% block footer %}{% endblock %}
</code></pre>

<p>Al igual que en el caso anterior, <strong>solo he a&ntilde;adido algunos estilos</strong> y he modificado el texto de las labels para que sea congruente con el de la plantilla de login.</p>

<p>Si ahora accedes a cualquiera de las dos p&aacute;ginas <strong>desde el navegador</strong>, ver&aacute;s que ahora tienen mucho mejor aspecto.</p>

<h3>Modificaciones en BlogAuthenticator</h3>

<p>Antes de empezar a probar nuestro sistema de login y registro, necesitamos realizar unos peque&ntilde;os cambios. El primero ser&aacute; en el archivo&nbsp;<strong>src\Security\BlogAuthenticator.php</strong>, as&iacute; que lo abrimos y modificamos el siguiente m&eacute;todo:</p>

<pre>
<code class="language-php">public function onAuthenticationSuccess(Request $request, TokenInterface $token, string $firewallName): ?Response
{
    if ($targetPath = $this-&gt;getTargetPath($request-&gt;getSession(), $firewallName)) {
        return new RedirectResponse($targetPath);
    }

    return new RedirectResponse($this-&gt;urlGenerator-&gt;generate(''get_posts''));
}</code></pre>

<p>Por defecto, <strong>Symfony </strong>a&ntilde;ade una excepci&oacute;n en el m&eacute;todo <strong>onAuthenticationSuccess</strong>&nbsp;para que nosotros sustituyamos esa excepci&oacute;n por la l&iacute;nea comentada y nombre del recurso al que queramos que apunte.</p>

<p>En nuestro caso, al hacer login quiero que se dirija a la p&aacute;gina principal, por lo que indico el nombre que le dimos a la ruta (<strong>get_posts</strong>). De esta forma, cuando hagamos login siempre nos redirigir&aacute; a esa p&aacute;gina.</p>

<h3>Modificaciones en RegistrationController</h3>

<p>Ahora mismo, si queremos crear un nuevo usuario, podemos ir a registro y crearlo sin problema. Lo &uacute;nico es que no a&ntilde;adir&iacute;a autom&aacute;ticamente el&nbsp;&quot;<strong>ROLE_USER</strong>&quot; y nosotros queremos a&ntilde;adirlo, ya que lo necesitaremos m&aacute;s adelante, as&iacute; que vamos al archivo <strong>src\Controller\RegistrationController.php&nbsp;</strong>y realizamos el siguiente cambio:</p>

<pre>
<code class="language-php">...
if ($form-&gt;isSubmitted() &amp;&amp; $form-&gt;isValid()) {
    // encode the plain password
    $user-&gt;setPassword(
        $userPasswordHasher-&gt;hashPassword(
            $user,
            $form-&gt;get(''plainPassword'')-&gt;getData()
        )
    );

    $user-&gt;setRoles([''ROLE_USER'']);

    $entityManager-&gt;persist($user);
    $entityManager-&gt;flush();
    // do anything else you need here, like send an email
...</code></pre>

<p>En este caso, solo hemos a&ntilde;adido la l&iacute;nea&nbsp;<strong>$user-&gt;setRoles([&#39;ROLE_USER&#39;]);</strong> que setear&aacute; el <strong>ROLE_USER </strong>cuando creemos un usuario.</p>

<p>Ahora solo queda que pruebes que funciona todo. <strong>Registra un usuario, autent&iacute;cate con &eacute;l</strong>. Revisa la base de datos y ver&aacute;s tu nuevo usuario con su password encriptado. Cualquier cosa escr&iacute;beme un comentario que estar&eacute; encantado de ayudarte 😉.</p>

<p>Con esto ya podemos dar por finalizado este tutorial. En el pr&oacute;ximo profundizaremos m&aacute;s en el <strong>sistema de formularios</strong> y veremos como crear comentarios cuando estemos autenticados.</p>

<p>Como siempre os dejo el enlace al repo por si ten&eacute;is cualquier problema&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/autenticacion-registro-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/autenticacion-registro-symfony-6</a></p>', 1, '2023-02-25 11:20:36.254651+00', 'autenticacion-registro-symfony-6', 'f'),
('Parte 5: Optimización de queries con Doctrine, ajustes y página de post en Symfony 6', 'posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6.png', '<p>En este tutorial profundizaremos en el <strong>ORM Doctrine</strong> <strong>para optimizar nuestras queries y por consiguiente la velocidad de respuesta de nuestra web</strong> y a&ntilde;adiremos algunos ajustes en nuestro proyecto en <strong>Symfony 6</strong>. Tambi&eacute;n crearemos la p&aacute;gina para consultar un post en concreto y veremos como generar las urls autom&aacute;ticamente a cada post en <strong>Twig</strong>.</p>

<p>👋&iexcl;Hola! Una semana m&aacute;s seguimos con esta serie de <strong>Symfony 6</strong> y esta vez nos vamos a centrar m&aacute;s en unos peque&ntilde;os ajustes en nuestro proyecto y algo muy importante que es la optimizaci&oacute;n de queries. Yo creo que <strong>todos hemos o&iacute;do alguna vez eso de que Doctrine es lento o el cuello de botella</strong> en un proyecto en <strong>Symfony 6</strong> y muchas veces tiene que ver con el mal uso (o uso por defecto) de este. Hoy vamos a poner soluci&oacute;n a eso 💪.</p>

<p>Antes de empezar 🛑. Si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li>Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</li>
	<li><a href="https://cosasdedevs.com/posts/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
</ul>

<h2>Ajustes en PostFactory para que el contenido de un post sea mayor</h2>

<p>Actualmente, <strong>los posts que generamos con faker</strong> tienen un contenido muy peque&ntilde;o de apenas una l&iacute;nea. Para mejorar la visualizaci&oacute;n de un post vamos a modificar esto. Para ello, abrimos el archivo&nbsp;<strong>src\Factory\PostFactory.php</strong> y realizamos el siguiente cambio en la clave &quot;<strong>content</strong>&quot; dentro del m&eacute;todo <strong>getDefaults()</strong>:</p>

<pre>
<code class="language-php">return [
    ''content'' =&gt; self::faker()-&gt;text(500),
    ...
];</code></pre>

<p>Como ves, <strong>self::faker()-&gt;text(500)</strong> recibe ahora como par&aacute;metro 500, el cual indica el n&uacute;mero de caracteres que queremos que tenga el texto. De esta forma, el contenido del post ser&aacute; mayor.</p>

<p>Como siempre que actualizamos un <strong>Factory</strong>, debemos relanzar el siguiente comando que borrar&aacute; la informaci&oacute;n de la base de datos y la crear&aacute; de nuevo:</p>

<pre>
<code class="language-bash">php bin/console doctrine:fixtures:load</code></pre>

<h2>P&aacute;gina de post en concreto</h2>

<p>Ahora que ya tenemos m&aacute;s informaci&oacute;n, es hora de poder visualizar nuestros posts. Para ello abrimos el archivo&nbsp;<strong>src\Controller\BlogController.php</strong> y a&ntilde;adimos el siguiente m&eacute;todo:</p>

<pre>
<code class="language-php">#[Route(''/posts/{slug}'', name: ''get_post'')]
public function getPost(Post $post): Response
{
    return $this-&gt;render(''blog/post.html.twig'', [
        ''post'' =&gt; $post,
    ]);
}</code></pre>

<p>En este c&oacute;digo vemos un poco la magia de <strong>Symfony</strong> 🤔. En la ruta, definimos que los posts se encuentran en el segmento /posts/{slug}. Lo que est&aacute; entre llaves, significa que puede ser cualquier cadena de caracteres y la palabra que escribamos, ser&aacute; el nombre del par&aacute;metro que guardar&aacute; esa cadena de caracteres, por ejemplo:</p>

<pre>
<code class="language-bash">/posts/mi-post-1 (slug: mi-post-1)
/posts/esto-es-otro-post (slug: esto-es-otro-post)
/posts/hoy-estoy-creando-muchos-posts (slug: hoy-estoy-creando-muchos-posts)</code></pre>

<p>Despu&eacute;s definimos el nombre del recurso, en este caso <strong>get_post </strong>y ahora viene lo interesante. Por par&aacute;metro, el m&eacute;todo <strong>getPost </strong>recibe <strong>un objeto de la entidad&nbsp;Post</strong>. Esto es as&iacute; gracias al paquete (<a href="https://symfony.com/doc/current/routing.html#parameter-conversion" target="_blank">sensio/framework-extra-bundle</a>) el cual ya tenemos por la instalaci&oacute;n que hicimos en el primer tutorial&nbsp;y realiza las siguientes acciones:</p>

<ul>
	<li>En la ruta recibe el par&aacute;metro slug el cual almacena la ruta enviada.</li>
	<li>En el m&eacute;todo <strong>getPost </strong>recibimos por&nbsp;par&aacute;metro un objeto de tipo <strong>Post </strong>por lo que gracias al paquete que mencion&eacute; antes, el cual tiene soporte para conversi&oacute;n de par&aacute;metros que es lo que hace la &quot;magia&quot;.</li>
	<li>Con el par&aacute;metro enviado llamado <strong>slug</strong>, hace una consulta a la tabla posts en el que realiza la b&uacute;squeda de un post por la columna &quot;<strong>slug</strong>&quot; y con el valor enviado.</li>
	<li>Aqu&iacute; importante es que se llama <strong>slug </strong>porque le dimos ese nombre a la columna. Si por ejemplo queremos buscar por id, podemos enviar el id por URL. En la ruta lo llamamos id (/posts/{id} y realizar&iacute;a la b&uacute;squeda por esa columna y valor.</li>
	<li>Si no encuentra el <strong>post </strong>ya sea porque hayamos escrito mal la ruta o porque lo hemos borrado,&nbsp;devolver&aacute; un error 404.</li>
</ul>

<p>Si quer&eacute;is m&aacute;s informaci&oacute;n acerca de este punto, os dejo un enlace a la documentaci&oacute;n:</p>

<p><a href="https://symfony.com/doc/current/routing.html#parameter-conversion" target="_blank">https://symfony.com/doc/current/routing.html#parameter-conversion</a></p>

<p>En el siguiente paso, <strong>retornamos el renderizado de una plantilla</strong> que crearemos m&aacute;s adelante llamada &quot;<strong>blog/post.html.twig</strong>&quot; y enviamos el post por par&aacute;metro.</p>

<p>Ahora creamos el archivo&nbsp;<strong>templates\blog\post.html.twig</strong> y a&ntilde;adimos el siguiente c&oacute;digo:</p>

<pre>
<code class="language-django">{% extends ''base.html.twig'' %}

{% block title %}{{post.title}}{% endblock %}

{% block body %}

    &lt;div class="mt-10 md:flex justify-center"&gt;
        &lt;div class="max-w-full flex-row justify-center mb-8 md:mr-2"&gt;
            &lt;article class="max-w-xl text-center bg-white  shadow-md mb-4 p-2"&gt;
                &lt;a class="block mb-4" href="#"&gt;
                    &lt;h2 class="text-2xl font-bold"&gt;{{post.title}}&lt;/h2&gt;
                    &lt;div&gt;{{post.user.username}}&lt;/div&gt;
                    &lt;time class="text-gray-500" datetime="{{post.publicationDate|date("Y-m-d")}}"&gt;
                        {{post.publicationDate|date("Y-m-d H:i:s")}}
                    &lt;/time&gt;
                &lt;/a&gt;
                &lt;p class="text-justify"&gt;{{post.content}}&lt;/p&gt;
                &lt;div class="my-2"&gt;
                    {% for tag in post.tags %}
                        &lt;div class="tags"&gt;#{{tag.name}}&lt;/div&gt;
                    {% endfor %}
                &lt;/div&gt;
                &lt;div class="m-1 text-left"&gt;
                    &lt;h3&gt;Comentarios&lt;/h3&gt;
                    &lt;hr&gt;
                    &lt;div class="my-3 text-left"&gt;
                        {% for comment in post.comments %}
                            &lt;div class="p-3"&gt;
                                &lt;div&gt;Escrito por: &lt;strong&gt;{{comment.user.username}}&lt;/strong&gt;&lt;/div&gt;
                                &lt;div class="text-sm text-stone-500"&gt;{{comment.content}}&lt;/div&gt;
                            &lt;/div&gt;
                            &lt;hr&gt;
                        {% endfor %}
                    &lt;/div&gt;
                &lt;/div&gt;
            &lt;/article&gt;
        &lt;/div&gt;
            &lt;section&gt;
            &lt;div class="popular-posts text-center  bg-white border-gray-300 mb-4 pb-4 md:w-64 shadow-md"&gt;
                &lt;div&gt;
                    &lt;h3 class="font-bold text-2xl text-gray-900 border-b-2 border-gray-100 p-2 mb-2"&gt;Recomendados&lt;/h3&gt;
                &lt;/div&gt;
                &lt;div&gt;
                    &lt;ul&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 1&lt;/a&gt;
                        &lt;/li&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 2&lt;/a&gt;
                        &lt;/li&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 3&lt;/a&gt;
                        &lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/section&gt;
    &lt;/div&gt;

{% endblock %}</code></pre>

<p>Este caso es similar al que usamos para la <strong>template </strong>de posts, pero en este caso al ser solo uno no necesitamos recorrerlo. Como innovaci&oacute;n frente a la <strong>template </strong>anterior, aqu&iacute; mostramos el username del usuario al que pertenece el post con <strong>{{post.user.username}}</strong> y tambi&eacute;n el listado de <strong>comentarios </strong>relacionados con el post.</p>

<p>Para que desde la p&aacute;gina de inicio podamos acceder a un post pulsando en su t&iacute;tulo, debemos realizar el siguiente cambio en la template&nbsp;<strong>templates\blog\index.html.twig:</strong></p>

<pre>
<code class="language-django">...
{% for post in posts %}
        &lt;article class="max-w-xl text-center bg-white  shadow-md mb-4 p-2"&gt;
            &lt;a class="block mb-4" href="{{ path(''get_post'', {slug: post.slug })}}"&gt;
                &lt;h2 class="text-2xl font-bold"&gt;{{post.title}}&lt;/h2&gt;
...</code></pre>

<p>Como ves, solo he modificado el <strong>href </strong>de la etiqueta <strong>a</strong>. En ella utilizo la funci&oacute;n <strong>path </strong>la cual recibe como primer par&aacute;metro el nombre del recurso al que queremos acceder. Este nombre es el que damos al definir la ruta en el controlador. C&oacute;mo par&aacute;metro recibe el atributo slug el cual su valor ser&aacute; el slug del post que se est&aacute; pintando.</p>

<p>Si accedemos a la p&aacute;gina principal de nuestro proyecto&nbsp;y pulsamos en cualquiera de nuestros posts, ahora podremos acceder a ellos.</p>

<p>Ya que estamos, vamos a a&ntilde;adir el enlace para acceder a la p&aacute;gina de inicio desde la cabecera. Para ello abrimos el archivo&nbsp;<strong>templates\base.html.twig</strong> y modificamos el siguiente segmento de la plantilla:</p>

<pre>
<code class="language-django">...
&lt;li&gt;
    &lt;a href="{{ path(''get_posts'') }}"&gt;Inicio&lt;/a&gt;
&lt;/li&gt;
...</code></pre>

<p>Al igual que en el caso anterior, enviamos por par&aacute;metro el nombre del recurso a acceder y en este caso no necesitamos enviar ning&uacute;n par&aacute;metro adicional, as&iacute; que lo dejamos as&iacute;.</p>

<h2>Optimizaci&oacute;n de Queries con Doctrine</h2>

<p>Cuando visualizamos una web desde el navegador, si te fijas, abajo del todo tenemos una barra con mucha informaci&oacute;n llamada <strong>Symfony Profiler</strong>.</p>

<p>Esta <strong>es una herramienta de debug</strong> que nos devuelve informaci&oacute;n acerca de una petici&oacute;n como las consultas a la base de datos realizadas, velocidad de respuesta, el controlador que accede al recurso, estado de la respuesta y mucha m&aacute;s informaci&oacute;n que puedes visualizar pulsando en esta barra o desde la documentaci&oacute;n que te dejo aqu&iacute; abajo:</p>

<p><a href="https://symfony.com/doc/current/profiler.html" target="_blank">https://symfony.com/doc/current/profiler.html</a></p>

<p>Pues bien, hay una parte que casi me hizo llorar y es el n&uacute;mero de queries realizadas para obtener el listado de post:</p>

<p><a href="https://i.imgur.com/OTUSfyJ.png" target="_blank"><img alt="" src="https://i.imgur.com/OTUSfyJ.png" style="height:82px; width:188px" /></a></p>

<p><strong>&iquest;41 queries para mostrar el listado de posts?</strong></p>

<p>Esto es una barbaridad y <strong>cuantos m&aacute;s posts tengamos m&aacute;s va a repercutir en la velocidad de respuesta de nuestra web</strong>. <strong>Cuando hacemos una b&uacute;squeda a lo bruto con el m&eacute;todo findAll() de la clase PostRepository</strong> lo que hacemos es traer el listado de post y adem&aacute;s realiza las siguientes queries adicionales:</p>

<p>Una consulta para obtener <strong>el usuario al que pertenece cada post</strong> el cual ni siquiera estamos pintando ninguna informaci&oacute;n en la p&aacute;gina principal.</p>

<p>Otra consulta&nbsp;para obtener <strong>los tags relacionados con ese post</strong> y una tercera <strong>consulta para obtener los comentarios de cada post del cual solo nos interesa el n&uacute;mero total de comentarios</strong>,&nbsp;as&iacute; que vamos a solucionarlo para que en dos &uacute;nicas consultas obtengamos toda la informaci&oacute;n que necesitemos.</p>

<h3>Recuperar el listado de tags por post</h3>

<p>Para recuperar el listado de <strong>tags </strong>por post abrimos el archivo&nbsp;<strong>src\Repository\TagRepository.php</strong> el cual deber&iacute;amos usar cada vez que queramos crear un m&eacute;todo que realice alguna acci&oacute;n con la tabla tags y a&ntilde;adimos el siguiente m&eacute;todo:</p>

<pre>
<code class="language-php">public function getTagsByPostIds(array $post_ids): array
{
    $tags = $this-&gt;createQueryBuilder(''t'')
    -&gt;select(''p.id, t.name'')
    -&gt;innerJoin(''t.posts'', ''p'')
    -&gt;andWhere(''p.id IN (:post_ids)'')
    -&gt;setParameter(''post_ids'', $post_ids)
    -&gt;getQuery()
    -&gt;getResult();

    $tags_by_post = [];

    foreach($tags as $tag) {
        if(!isset($tags_by_post[$tag[''id'']])) {
            $tags_by_post[$tag[''id'']] = [];
        }

        $tags_by_post[$tag[''id'']][] = $tag[''name''];
    }

    return $tags_by_post;
}</code></pre>

<p>Aqu&iacute; utilizo el <a href="https://www.doctrine-project.org/projects/doctrine-orm/en/2.14/reference/query-builder.html#the-querybuilder" target="_blank">Query Builder de Doctrine</a> el cual <strong>tiene un lenguaje similar a SQL</strong> en el que vamos llamando a m&eacute;todos para construir la <strong>query</strong>. Te voy a explicar qu&eacute; hago en este caso y tambi&eacute;n te dejo el link a la documentaci&oacute;n para que aprendas a realizar consultas seg&uacute;n las necesidades de tus futuros proyectos:</p>

<p><a href="https://www.doctrine-project.org/projects/doctrine-orm/en/2.14/reference/query-builder.html#the-querybuilder" target="_blank">https://www.doctrine-project.org/projects/doctrine-orm/en/2.14/reference/query-builder.html#the-querybuilder</a></p>

<ul>
	<li>Aqu&iacute; tenemos un m&eacute;todo que recibe un array llamado <strong>$post_ids</strong> que contendr&aacute; un listado de ids de posts.</li>
	<li>El primer paso es crear el query Builder con &quot;<strong>$this-&gt;createQueryBuilder(&#39;t&#39;)</strong>&quot;. Este recibe por par&aacute;metro un alias para la <strong>tabla tags llamado t</strong>. Al estar dentro de <strong>TagRepository </strong>no hace falta que indiquemos la tabla a la que queremos hacer referencia, ya que la tiene asignada por defecto.</li>
	<li>En <strong>el m&eacute;todo select</strong> indico los par&aacute;metros que necesito, en este caso el id del post y el nombre del tag.</li>
	<li>Despu&eacute;s uso <strong>el m&eacute;todo innerJoin </strong>para crear la uni&oacute;n con la tabla posts.</li>
	<li>Con <strong>el m&eacute;todo andWhere</strong> indicio la condici&oacute;n para obtener el listado de tags que ser&aacute; todos los nombres de tags que est&eacute;n relacionados con los post ids enviados.</li>
	<li>Con <strong>el m&eacute;todo setParameter</strong> seteo el par&aacute;metro definido en el m&eacute;todo <strong>andWhere</strong>.</li>
	<li>Luego con <strong>el m&eacute;todo getQuery</strong> creamos una instancia de la clase <strong>Query de Doctrine&nbsp;</strong>con todo la informaci&oacute;n que hemos a&ntilde;adido en el paso anterior.</li>
	<li>Por &uacute;ltimo, <strong>con el m&eacute;todo getResults, ejecutamos la query</strong> y obtenemos un array con los resultados.</li>
</ul>

<p>Una vez tenemos la informaci&oacute;n, he creado un array asociativo en el que guardo los nombres de los tags asociados a un post y retorno el resultado.</p>

<p>Ahora nos dirigimos al archivo&nbsp;<strong>src\Repository\PostRepository.php</strong> y a&ntilde;adimos el siguiente c&oacute;digo:</p>

<pre>
<code class="language-php">
...
use App\Repository\TagRepository;

...
public function __construct(ManagerRegistry $registry, private TagRepository $tagRepository)
{
    parent::__construct($registry, Post::class);
}

...
public function getPaginatedPosts(int $page = 1, int $limit = 10)
{
    $posts = $this-&gt;createQueryBuilder(''post'')
        -&gt;select(''
            post.id,
            post.title,
            post.slug,
            post.publication_date,
            post.content,
            COUNT(comment.id) as total_comments
        '')
        -&gt;leftJoin(''post.comments'', ''comment'')
        -&gt;groupBy(''post.id'')
        -&gt;orderBy(''post.publication_date'', ''DESC'')
        -&gt;setFirstResult($limit * ($page - 1))
        -&gt;setMaxResults($limit)
        -&gt;getQuery()
        -&gt;getResult()
    ;

    $post_ids = array_map(fn($post) =&gt; $post[''id''], $posts);

    $tags_by_post = $this-&gt;tagRepository-&gt;getTagsByPostIds($post_ids);

    foreach($posts as &amp;$post) {
        $post[''tags''] = $tags_by_post[$post[''id'']] ?? [];
    }
    unset($post);

    return $posts;
}
...</code></pre>

<p>En este archivo he realizado tres cambios importantes:</p>

<p>Primero importo <strong>TagRepository</strong>, ya que la necesitaremos para <strong>recuperar los tags por post</strong>.</p>

<p>Despu&eacute;s en el constructor creo una instancia de <strong>TagRespository </strong>autom&aacute;ticamente gracias a la inyecci&oacute;n de dependencias de Symfony, adem&aacute;s al definir la visibilidad (en este caso privado) y gracias a PHP 8, ya no necesito definir la variable de clase fuera del constructor y despu&eacute;s setearla dentro de ella.</p>

<p>Por &uacute;ltimo, he creado un m&eacute;todo llamado <strong>getpaginatedPosts </strong>el cual puede recibir dos par&aacute;metros para paginar nuestra respuesta y as&iacute; no tener que mostrar todos los posts en la p&aacute;gina principal.</p>

<p>Construyo el <strong>createQueryBuilder </strong>para obtener el listado de posts y aqu&iacute; muy importante, solo selecciono los campos que me interesan para evitar obtener informaci&oacute;n que no necesitamos. Limito la respuesta con <strong>setMaxResults </strong>y el offset con <strong>setFirstResult</strong>.</p>

<p>Despu&eacute;s de obtener el resultado del <strong>queryBuilder</strong>, obtengo los ids de los posts y con ello lanzo el m&eacute;todo que creamos anteriormente en <strong>TagRepository </strong>para obtener los tags relacionados con un post.</p>

<p>Por &uacute;ltimo, a&ntilde;ado los <strong>tags </strong>a mi listado de posts y retorno el resultado.</p>

<p>Ahora nos dirigimos a&nbsp;<strong>src\Controller\BlogController.php</strong> y realizamos el siguiente cambio para ahora obtener los posts con nuestro nuevo m&eacute;todo:</p>

<pre>
<code class="language-php">public function index(PostRepository $postRepository): Response
{
    return $this-&gt;render(''blog/index.html.twig'', [
        ''posts'' =&gt; $postRepository-&gt;getPaginatedPosts()
    ]);
}</code></pre>

<p>Antes de recargar la p&aacute;gina, debemos ir a la template&nbsp;<strong>templates\blog\index.html.twig</strong> y realizar unos cambios:</p>

<pre>
<code class="language-django">...
{% for post in posts %}
    &lt;article class="max-w-xl text-center bg-white  shadow-md mb-4 p-2"&gt;
        &lt;a class="block mb-4" href="{{ path(''get_post'', {slug: post.slug })}}"&gt;
            &lt;h2 class="text-2xl font-bold"&gt;{{post.title}}&lt;/h2&gt;
            &lt;time class="text-gray-500" datetime="{{post.publication_date|date("Y-m-d")}}"&gt;
                {{post.publication_date|date("Y-m-d H:i:s")}}
            &lt;/time&gt;
        &lt;/a&gt;
        &lt;p class="text-justify"&gt;{{post.content}}&lt;/p&gt;
        &lt;div class="my-2"&gt;
            {% for tag in post.tags %}
                &lt;div class="tags"&gt;#{{tag}}&lt;/div&gt;
            {% endfor %}
        &lt;/div&gt;
        &lt;div class="inline-block w-full align-middle my-2"&gt;
            &lt;i class="fas fa-comments"&gt;&lt;/i&gt; &lt;span&gt;{{post.total_comments}} Comentarios&lt;/span&gt;
        &lt;/div&gt;
    &lt;/article&gt;
{% endfor %}
...</code></pre>

<p>B&aacute;sicamente, solo he cambiado dos cosas. Primero ahora es <strong>post.publication_date</strong> en vez de <strong>post.publicationDate</strong> porque antes nos devolv&iacute;a un objeto de la entidad post y ahora nos devuelve un array con el resultado.</p>

<p>El segundo cambio&nbsp;es en los comentarios. Ahora accedemos a <strong>post.total_coments</strong> para obtener el n&uacute;mero de comentarios.</p>

<p>Y listo, si ahora recargamos vemos que <strong>solo necesitamos dos queries para cargar toda la informaci&oacute;n</strong>. Te animo a que completes por tu lado todo el sistema de paginaci&oacute;n y me cuentes si lo has conseguido en los comentarios.</p>

<p>Consejos para la paginaci&oacute;n:</p>

<ul>
	<li>Crear un nuevo m&eacute;todo en <strong>PostRepository </strong>para obtener el n&uacute;mero total de posts.</li>
	<li>En la respuesta del controlador ya definir p&aacute;gina siguiente y anterior con los query params de limit y page. Investiga como recuperarlos en el controlador y env&iacute;alos al m&eacute;todo.</li>
	<li>Crea en la template botones para ir navegando por las p&aacute;ginas.</li>
</ul>

<p>En el pr&oacute;ximo tutorial veremos <strong>como autenticarnos en nuestra p&aacute;gina</strong> y trabajaremos con los <strong>formularios </strong>para crear comentarios.</p>

<p>Como siempre os dejo el enlace al repo por si ten&eacute;is cualquier problema&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6</a></p>', 1, '2023-02-19 09:24:33.199005+00', 'optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6', 'f'),
('Parte 4: Controladores, templates y estilos con Tailwind CSS en Symfony 6', 'posts/controladores-templates-estilos-tailwindcss-symfony-6.png', '<p>En el tutorial de esta semana veremos <strong>como crear nuestro primer controlador</strong>, aprenderemos a realizar <strong>b&uacute;squedas en nuestra base de datos con Doctrine</strong> para obtener todos los posts&nbsp;y enviaremos <strong>esos datos&nbsp;a una plantilla de Twig</strong> para visualizarlos en la web.&nbsp;Adem&aacute;s, veremos <strong>como instalar Tailwind CSS en Symfony 6</strong> el cual es un conjunto de clases de CSS para facilitarnos el trabajo a la hora de maquetar nuestra web.</p>

<p>👋 &iexcl;Hola! Hasta ahora solo hemos estado picando c&oacute;digo y no hemos visto nuestra web en el navegador ya en funcionamiento, pero eso cambia ya en este tutorial. Ahora que tenemos datos y ya he explicado unas cuantas cosas, es hora de meternos de lleno en esas partes que hab&iacute;amos dejado de lado hasta ahora.</p>

<p>Antes de empezar 🛑. Si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li>Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/hidden/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
</ul>

<p>Ahora mismo, <strong>s&iacute;&nbsp;levantamos nuestra web (symfony serve)</strong> y vamos al navegador, visualizaremos la p&aacute;gina por defecto del Symfony. Pues bien, la idea es cambiar eso y que en la p&aacute;gina principal de la web podamos ver el listado con nuestros posts.</p>

<h2>Crear un controlador en Symfony 6</h2>

<p>El primer paso ser&aacute; crear un controlador.&nbsp;<strong>Los controladores son un componente que se encarga de manejar solicitudes HTTP y retornar una respuesta</strong>. Un controlador en <strong>Symfony 6</strong> es una clase PHP en la cual <strong>podemos manejar las rutas</strong>, qu&eacute; <strong>m&eacute;todos son permitidos</strong> (GET, POST, etc.), realizar cualquier l&oacute;gica necesaria, como <strong>recuperar datos de una base de datos</strong>, procesar formularios y renderizar plantillas para generar una respuesta HTML.</p>

<p>Para crear un controlador, vamos a la terminal y lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:controller</code></pre>

<p>Como en ocasiones anteriores, nos aparecer&aacute; el asistente y nos preguntar&aacute; como queremos llamarlo. Yo lo he nombrado <strong>BlogController</strong>.</p>

<pre>
<code class="language-bash">Choose a name for your controller class (e.g. AgreeableKangarooController):
&gt; BlogController
created: src/Controller/BlogController.php
created: templates/blog/index.html.twig
Success! 
Next: Open your new controller class and add some pages!</code></pre>

<p>Al finalizar el proceso nos habr&aacute; creado dos archivos. <strong>El primero es el controlador y el segundo es una plantilla de Twig</strong> la cual usaremos m&aacute;s adelante y explicar&eacute; como funciona.</p>

<p>El siguiente paso es modificar <strong>BlogController </strong>para recuperar los posts de nuestra base de datos y mostrarlos en la plantilla. Abrimos el archivo y realizamos las siguientes modificaciones:</p>

<pre>
<code class="language-php">&lt;?php
...
use App\Repository\PostRepository;

class BlogController extends AbstractController
{
    #[Route(''/'', name: ''get_posts'')]
    public function index(PostRepository $postRepository): Response
    {
        return $this-&gt;render(''blog/index.html.twig'', [
            ''posts'' =&gt; $postRepository-&gt;findAll()
        ]);
    }
}
</code></pre>

<p>En esta clase he realizado varios cambios que son:</p>

<p>Primero he importado&nbsp;<strong>use App\Repository\PostRepository;</strong> ya que lo necesitaremos para recuperar los datos de los posts de la base de datos.</p>

<p>He modificado la l&iacute;nea <strong>#[Route...</strong>, <strong>la cual se encarga de manejar el enrutamiento</strong>. Como primer par&aacute;metro he dejado solo el slash&nbsp;lo cual indica que para acceder a este controlador <strong>deberemos ir a la p&aacute;gina principal de nuestra web</strong>. Tambi&eacute;n, he modificado su nombre. El uso de estos nombres los veremos m&aacute;s adelante.</p>

<p>El m&eacute;todo <strong>index </strong>ahora <strong>recibe el objeto $postRepository </strong>que es una instancia de <strong>PostRepository</strong>. Esto es lo que se llama <strong>inyecci&oacute;n de dependencias</strong> y cuando lo a&ntilde;adimos como par&aacute;metro, <strong>Symfony </strong>se encarga autom&aacute;ticamente de inicializar el objeto, el cual nos servir&aacute; para recuperar los posts de la base de datos.</p>

<p>Por &uacute;ltimo, <strong>se renderiza la plantilla y se retorna por respuesta</strong>. El m&eacute;todo <strong>render</strong>, recibe como segundo par&aacute;metro un array con informaci&oacute;n. Aqu&iacute; podemos enviar la informaci&oacute;n que queramos y luego utilizarla en la plantilla. Pues bien, aqu&iacute; he eliminado la clave que exist&iacute;a y <strong>he creado una nueva llamada posts</strong>.</p>

<p>Esta clave tiene como valor el listado con todos los posts. Como puedes observar, estoy utilizando <strong>$postRepository y el m&eacute;todo findAll() que retorna todos los elementos de una tabla</strong>.</p>

<p>Si quieres m&aacute;s informaci&oacute;n acerca de los distintos m&eacute;todos que podemos utilizar para extraer informaci&oacute;n de la base de datos, te dejo el siguiente enlace:</p>

<p><a href="https://symfony.com/doc/current/doctrine.html#fetching-objects-from-the-database" target="_blank">https://symfony.com/doc/current/doctrine.html#fetching-objects-from-the-database</a></p>

<p>Ahora que ya tenemos listo el controlador, vamos a editar la plantilla. Antes de seguir, voy a darte una breve explicaci&oacute;n de que son las <strong>plantillas Twig</strong>.</p>

<h3>Qu&eacute; es Twig en Symfony 6 🤔</h3>

<p><strong>Twig </strong>es un motor de plantillas que se utiliza en <strong>Symfony 6 para convertir nuestros archivos HTML en archivos din&aacute;micos</strong>.&nbsp;<strong>Twig </strong>permite escribir HTML y adem&aacute;s <strong>podemos usar sintaxis especial y variables que se reemplazan en tiempo de ejecuci&oacute;n</strong> con los datos proporcionados por el controlador.&nbsp;</p>

<p>Tambi&eacute;n, <strong>Twig </strong>ofrece una gran cantidad de funcionalidades para realizar tareas como iterar sobre colecciones de datos, aplicar filtros y realizar operaciones matem&aacute;ticas como veremos m&aacute;s adelante.</p>

<p>Si quieres m&aacute;s info sobre <strong>Twig</strong>, te dejo un enlace a la documentaci&oacute;n:</p>

<p><a href="https://symfony.com/doc/current/templates.html" target="_blank">https://symfony.com/doc/current/templates.html</a></p>

<p>Ahora que ya entendemos un poco mejor <strong>Twig</strong>, vamos a editar nuestra plantilla. Para ello abrimos el archivo&nbsp;<strong>templates/blog/index.html.twig</strong> y modificamos el contenido por el siguiente:</p>

<pre>
<code class="language-django">{% extends ''base.html.twig'' %}

{% block title %}Últimos posts{% endblock %}

{% block body %}

    {% for post in posts %}
        &lt;h2&gt;
            &lt;a href="#"&gt;
                {{ post.title }}
            &lt;/a&gt;
        &lt;/h2&gt;
        &lt;p&gt;
        {{ post.content }}
        &lt;/p&gt;
        &lt;hr&gt;
    {% endfor %}

{% endblock %}
</code></pre>

<p>Como puedes observar, <strong>esta plantilla extiende de la plantilla base.html.twig</strong>. Esta la podemos utilizar de base para las dem&aacute;s plantillas&nbsp;o podemos crear una nueva. En nuestro caso ser&aacute; la que utilizaremos de base para las dem&aacute;s plantillas. <strong>En base.html.twig tenemos la estructura de una p&aacute;gina con&nbsp;HTML</strong> y adem&aacute;s se definen bloques que podremos sustituir en las plantillas hijas.</p>

<p>En este caso, <strong>sustituimos el bloque title por defecto por uno para esta plantilla en particular</strong>.</p>

<p>En el bloque <strong>body </strong>que ser&aacute; el cuerpo de nuestra p&aacute;gina web, <strong>recorremos la variable posts que enviamos en el controlador</strong>. La podemos recorrer gracias a la sintaxis especial de <strong>Twig </strong>y vamos generando los distintos posts din&aacute;micamente.</p>

<p>De momento no me he complicado mucho y solo estamos pintando el t&iacute;tulo y el contenido del post. Si recargamos nuestra p&aacute;gina <strong>ya podremos ver el listado de posts</strong> aunque de forma bastante rudimentaria. <strong>Vamos a arreglar eso ahora mismo con Webpack y Tailwind CSS</strong>.</p>

<h3>Instalar Webpack y Tailwind CSS ⚒️</h3>

<p>Antes de nada para el que no lo conozca, voy a explicar que es Webpack y Tailwind CSS y posteriormente lo instalaremos en el proyecto.</p>

<h4>Qu&eacute; es Webpack</h4>

<p><strong><a href="https://webpack.js.org/" target="_blank">Webpack</a> </strong>es un empaquetador de m&oacute;dulos de JavaScript para aplicaciones web. <strong>Permite a los desarrolladores empaquetar todos los archivos necesarios para una aplicaci&oacute;n web, incluyendo JavaScript, HTML, CSS y otros recursos, en un solo archivo o paquete</strong>.</p>

<p>Esto hace que sea m&aacute;s f&aacute;cil y r&aacute;pido para un navegador cargar y ejecutar la aplicaci&oacute;n, <strong>ya que solo tiene que descargar un solo archivo en lugar de varios</strong>.</p>

<p>Adem&aacute;s, <strong>Webpack </strong>permite la optimizaci&oacute;n de los archivos empaquetados, como la minimizaci&oacute;n y compresi&oacute;n de c&oacute;digo, para mejorar la velocidad de carga y el rendimiento de la aplicaci&oacute;n.</p>

<h4>Qu&eacute; es Tailwind CSS</h4>

<p><a href="https://tailwindcss.com/" target="_blank">Tailwind CSS</a> es un framework de estilos de dise&ntilde;o para aplicaciones web.<strong> Este framework proporciona&nbsp;una gran cantidad de clases predefinidas para dar estilo a elementos HTML</strong>, lo que nos permite aplicar&nbsp;estos estilos en nuestras webs de forma m&aacute;s r&aacute;pida.</p>

<p>Una vez explicadas estas herramientas, vamos a instalarlas. Para instalar <strong>Webpack </strong>lanzaremos el siguiente comando:</p>

<pre>
<code class="language-bash">composer require symfony/webpack-encore-bundle</code></pre>

<p>Con este comando integraremos de forma muy sencilla <strong>Webpack&nbsp;</strong>en nuestro proyecto. Generar&aacute; la carpeta <strong>asserts </strong>que ser&aacute; la carpeta donde guardaremos <strong>nuestros archivos CSS y JavaScript</strong> y tambi&eacute;n crear&aacute; el archivo <strong>webpack.config.js</strong> con una configuraci&oacute;n por defecto para <strong>Symfony 6</strong>.</p>

<p><strong>El siguiente paso es instalar Tailwind CSS en nuestro proyecto</strong>. Para ello he seguido esta gu&iacute;a de la propia documentaci&oacute;n de Tailwind, pero tambi&eacute;n lo explicar&eacute; aqu&iacute; paso a paso:</p>

<p><a href="https://tailwindcss.com/docs/guides/symfony" target="_blank">https://tailwindcss.com/docs/guides/symfony</a></p>

<p>Para esta parte necesitaremos tener instalado <a href="https://es.wikipedia.org/wiki/Npm" target="_blank">npm</a>, el cual es el sistema de gesti&oacute;n de paquetes por defecto para <strong>Node.js</strong>. Si no lo tienes instalado, <a href="https://nodejs.org/es/download/" target="_blank">pincha aqu&iacute;</a>.</p>

<p>Con <strong>npm </strong>en nuestra m&aacute;quina, vamos a instalar <strong>Tailwind</strong>. Para ello lanzamos los siguientes comandos:</p>

<pre>
<code class="language-bash">npm install -D tailwindcss postcss autoprefixer postcss-loader
npx tailwindcss init -p</code></pre>

<p>El primero instalar&aacute; <strong>Tailwind </strong>y otros paquetes necesarios y el segundo generar&aacute; un archivo de configuraci&oacute;n para <strong>Tailwind </strong>llamado <strong>tailwind.config.js</strong> en la ra&iacute;z del proyecto.</p>

<p>Ahora abrimos el archivo <strong>webpack.config.js</strong> en la ra&iacute;z del proyecto y a&ntilde;adimos la siguiente l&iacute;nea dentro de <strong>Encore</strong> junto a las ya existentes:</p>

<pre>
<code class="language-javascript">Encore
  // ...
  .enablePostCssLoader()
;</code></pre>

<p>El siguiente paso es <strong>abrir el archivo tailwind.config.js</strong> y modificar su contenido por el siguiente:</p>

<pre>
<code class="language-javascript">/** @type {import(''tailwindcss'').Config} */
module.exports = {
  content: [
    "./assets/**/*.js",
    "./templates/**/*.html.twig",
  ],
  theme: {
    extend: {},
  },
  plugins: [],
}</code></pre>

<p>Una vez tenemos los archivos de configuraci&oacute;n listos, vamos a <strong>importar Tailwind a nuestros CSS</strong>. Abrimos el archivo&nbsp;<strong>asserts/styles/app.css</strong> en el cual a partir de ahora deber&aacute; ir todo nuestro CSS y sustituimos el bloque existente por el siguiente:</p>

<pre>
<code class="language-css">@tailwind base;
@tailwind components;
@tailwind utilities;</code></pre>

<p>De esta forma podremos utilizar todos los componentes de <strong>Tailwind </strong>en nuestra web.</p>

<p>Por &uacute;ltimo, abrimos una terminal y lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">npm run watch</code></pre>

<p>Con este comando, cada vez que realicemos un cambio&nbsp;en las plantillas o el CSS, actualizar&aacute; el archivo del que bebe nuestra web, el cual se encuentra en&nbsp;<strong>public\build\app.css</strong>.</p>

<p>Si vamos al navegador y actualizamos la p&aacute;gina principal, veremos que la letra y el formato de los t&iacute;tulos ha cambiado porque ya estamos usando <strong>Tailwind CSS</strong> 💪.</p>

<p>Ahora vamos a utilizar las clases de <strong>Tailwind </strong>en nuestro proyecto. Para no complicarnos mucho con explicaciones, voy a utilizar una plantilla de ejemplo de <strong>un tutorial que escrib&iacute; sobre como maquetar un blog con Tailwind CSS</strong>. Si quieres profundizar m&aacute;s sobre este framework, te dejo en enlace a continuaci&oacute;n:</p>

<p><a href="https://cosasdedevs.com/posts/maquetar-blog-tailwindcss/" target="_blank">https://cosasdedevs.com/posts/maquetar-blog-tailwindcss/</a></p>

<h3>Maquetar la p&aacute;gina principal con Tailwind CSS 🖼️</h3>

<p>El primer paso que haremos ser&aacute; a&ntilde;adir unas cuantas configuraciones generales para todas las plantillas, as&iacute; que abrimos el archivo&nbsp;<strong>assets\styles\app.css</strong> y a&ntilde;adimos las siguientes l&iacute;neas junto a lo ya existente:</p>

<pre>
<code class="language-css">header &gt; nav &gt; ul &gt; li &gt; a:hover {
    @apply text-blue-300;
}

.tags {
    @apply inline-block p-2 mx-1 bg-orange-300 text-white uppercase text-xs font-medium;
}

.popular-posts &gt; div &gt; ul &gt; li {
    @apply p-1;
}

.popular-posts &gt; div &gt; ul &gt; li &gt; a {
    @apply text-blue-400 underline text-lg;
}

.popular-posts &gt; div &gt; ul &gt; li &gt; a:hover {
    @apply text-blue-500;
}

footer &gt; ul &gt; li {
    @apply py-1 px-4;
}

footer &gt; ul &gt; li &gt; a:hover {
    @apply underline;
}</code></pre>

<p>Ahora vamos al archivo&nbsp;<strong>templates\base.html.twig</strong> y reemplazamos el c&oacute;digo existente por el siguiente:</p>

<pre>
<code class="language-django">&lt;!DOCTYPE html&gt;
&lt;html&gt;
    &lt;head&gt;
        &lt;meta charset="UTF-8"&gt;
        &lt;title&gt;{% block title %}Mi primer blog con Symfony 6{% endblock %}&lt;/title&gt;
        &lt;link rel="icon" href="data:image/svg+xml,&lt;svg xmlns=%22http://www.w3.org/2000/svg%22 viewBox=%220 0 128 128%22&gt;&lt;text y=%221.2em%22 font-size=%2296%22&gt;⚫️&lt;/text&gt;&lt;/svg&gt;"&gt;
        {# Run `composer require symfony/webpack-encore-bundle` to start using Symfony UX #}
        {% block stylesheets %}
            {{ encore_entry_link_tags(''app'') }}
        {% endblock %}

        {% block javascripts %}
            {{ encore_entry_script_tags(''app'') }}
        {% endblock %}
    &lt;link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.14.0/css/all.min.css" integrity="sha512-1PKOgIY59xJ8Co8+NE6FZ+LOAZKjy+KY8iq0G4B3CyeY6wYHN3yt9PW0XpSriVlkMXe40PTKnXrLnZ9+fkDaog==" crossorigin="anonymous" /&gt;
    &lt;/head&gt;
    &lt;body&gt;
        &lt;header class="bg-gray-900 shadow-md"&gt;
            &lt;nav class="flex justify-between items-center text-gray-200 px-4 shadow-md sm:py-4 sm:justify-around"&gt;
                &lt;div class="sm:hidden text-2xl"&gt;&amp;equiv;&lt;/div&gt;
                &lt;ul class="hidden sm:flex justify-between w-64"&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;Inicio&lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;Etiquetas&lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;Acerca de mi&lt;/a&gt;
                    &lt;/li&gt;
                &lt;/ul&gt;
                &lt;ul class="flex justify-between w-20"&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;
                            &lt;i class="fab fa-twitter"&gt;&lt;/i&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;
                            &lt;i class="fab fa-facebook-f"&gt;&lt;/i&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                    &lt;li&gt;
                        &lt;a href="http://"&gt;
                            &lt;i class="fas fa-rss"&gt;&lt;/i&gt;
                        &lt;/a&gt;
                    &lt;/li&gt;
                &lt;/ul&gt;
            &lt;/nav&gt;
            &lt;div class="bg-white text-center"&gt;
                &lt;div class="text-6xl font-bold"&gt;
                    Mi blog
                &lt;/div&gt;
                &lt;h1 class="text-gray-700 text-xl pb-4"&gt;con Symfony&lt;/h1&gt;
            &lt;/div&gt;
        &lt;/header&gt;
        {% block body %}{% endblock %}
        &lt;footer class="text-center text-white bg-teal-900 py-4"&gt;
            &lt;ul class="md:flex justify-center"&gt;
                &lt;li&gt;&lt;a href="http://"&gt;Hola&lt;/a&gt;&lt;/li&gt;
                &lt;li&gt;&lt;a href="http://"&gt;Privacidad&lt;/a&gt;&lt;/li&gt;
                &lt;li&gt;&lt;a href="http://"&gt;Términos y condiciones&lt;/a&gt;&lt;/li&gt;
                &lt;li&gt;&amp;#174; {{''now''|date(''Y'')}} Mi blog con Symfony 6 y TailwindCSS 🧑‍💻&lt;/li&gt;
            &lt;/ul&gt;
        &lt;/footer&gt;
    &lt;/body&gt;
&lt;/html&gt;
</code></pre>

<p>Con estos cambios hemos a&ntilde;adido la cabecera y la barra de navegaci&oacute;n. <strong>Tambi&eacute;n importamos <a href="https://fontawesome.com/" target="_blank">font awesome</a> la cual es una librer&iacute;a de iconos</strong>. Si recargamos la p&aacute;gina ya podr&aacute;s ver que va tomando mejor forma 💪.</p>

<p>Si te fijas dentro de la etiqueta <strong>head</strong>, tenemos la importaci&oacute;n del CSS que generemos con <strong>Webpack</strong>:</p>

<pre>
<code class="language-django">{% block stylesheets %}
    {{ encore_entry_link_tags(''app'') }}
{% endblock %}</code></pre>

<p>Para finalizar, editaremos la plantilla que utilizamos para renderizar nuestros posts. Abrimos el archivo&nbsp;<strong>templates\blog\index.html.twig</strong> y reemplazamos el c&oacute;digo existente por el siguiente:</p>

<pre>
<code class="language-django">{% extends ''base.html.twig'' %}

{% block title %}Mi blog con Symfony{% endblock %}

{% block body %}

    &lt;div class="mt-10 md:flex justify-center"&gt;
        &lt;div class="max-w-full flex-row justify-center mb-8 md:mr-2"&gt;
    {% for post in posts %}
            &lt;article class="max-w-xl text-center bg-white shadow-md mb-4 p-2"&gt;
                &lt;a class="block mb-4" href="http://"&gt;
                    &lt;h2 class="text-2xl font-bold"&gt;{{post.title}}&lt;/h2&gt;
                    &lt;time class="text-gray-500" datetime="{{post.publicationDate|date("Y-m-d")}}"&gt;
                        {{post.publicationDate|date("Y-m-d H:i:s")}}
                    &lt;/time&gt;
                &lt;/a&gt;
                &lt;p class="text-justify"&gt;{{post.content}}&lt;/p&gt;
                &lt;div class="my-2"&gt;
                    {% for tag in post.tags %}
                        &lt;div class="tags"&gt;#{{tag.name}}&lt;/div&gt;
                    {% endfor %}
                &lt;/div&gt;
                &lt;div class="inline-block w-full align-middle my-2"&gt;
                    &lt;i class="fas fa-comments"&gt;&lt;/i&gt; &lt;span&gt;{{post.comments|length}} Comentarios&lt;/span&gt;
                &lt;/div&gt;
            &lt;/article&gt;
    {% endfor %}
        &lt;/div&gt;
            &lt;section&gt;
            &lt;div class="popular-posts text-center  bg-white border-gray-300 mb-4 pb-4 md:w-64 shadow-md"&gt;
                &lt;div&gt;
                    &lt;h3 class="font-bold text-2xl text-gray-900 border-b-2 border-gray-100 p-2 mb-2"&gt;Recomendados&lt;/h3&gt;
                &lt;/div&gt;
                &lt;div&gt;
                    &lt;ul&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 1&lt;/a&gt;
                        &lt;/li&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 2&lt;/a&gt;
                        &lt;/li&gt;
                        &lt;li&gt;
                            &lt;a href="http://"&gt;Título del post 3&lt;/a&gt;
                        &lt;/li&gt;
                    &lt;/ul&gt;
                &lt;/div&gt;
            &lt;/div&gt;
        &lt;/section&gt;
    &lt;/div&gt;

{% endblock %}
</code></pre>

<p>Si recargas la p&aacute;gina, ahora se ver&aacute; todo mucho mejor. Adem&aacute;s he a&ntilde;adido m&aacute;s informaci&oacute;n como la <strong>fecha de publicaci&oacute;n</strong>, el <strong>contenido</strong>, los <strong>tags</strong> y el <strong>n&uacute;mero de comentarios por post</strong>.</p>

<p>Tambi&eacute;n a&ntilde;ad&iacute; <strong>una secci&oacute;n donde podr&iacute;amos a&ntilde;adir posts recomendados</strong> para que la web parezca m&aacute;s completa.</p>

<p>Y con esto podemos dar por finalizado este tutorial. En el siguiente seguiremos trabajando en la parte visual de la web, <strong>crearemos la p&aacute;gina para ver un post en particular, a&ntilde;adiremos paginaci&oacute;n y optimizaremos queries</strong>.</p>

<p>Como siempre os dejo el enlace al repo&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/controladores-templates-estilos-tailwindcss-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/controladores-templates-estilos-tailwindcss-symfony-6</a></p>', 1, '2023-02-11 07:14:11.094897+00', 'controladores-templates-estilos-tailwindcss-symfony-6', 'f'),
('Parte 3: Cómo crear datos falsos en una base de datos con Symfony 6', 'posts/como-crear-datos-falsos-base-de-datos-symfony-6.png', '<p>En este tutorial aprenderemos a usar herramientas para facilitar la creaci&oacute;n de datos falsos en nuestra base de datos para un proyecto con <strong>Symfony 6</strong>.</p>

<p>&iexcl;Hola! 👋 Seguimos con la motivaci&oacute;n a tope, as&iacute; que siguen saliendo tutoriales de <strong>Symfony 6</strong> 🤣. Esta semana continuamos con la&nbsp;serie de tutoriales para crear un blog con <strong>Symfony 6</strong> y esta vez vamos a ver como podemos crear datos falsos de forma sencilla para trabajar en nuestro proyecto en el entorno local.</p>

<p>Antes de empezar 🛑. Si te has perdido alguno de los tutoriales de esta serie, aqu&iacute; te dejo todos los tutoriales escritos hasta ahora:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank">Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</a></li>
	<li>Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/hidden/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
</ul>

<h2>Requisitos 🤔</h2>

<p>Para empezar, necesitaremos instalar dos nuevos paquetes&nbsp;a nuestro proyecto,&nbsp;<strong><a href="https://symfony.com/bundles/DoctrineFixturesBundle/current/index.html" target="_blank">DoctrineFixturesBundle</a> y <a href="https://symfony.com/bundles/ZenstruckFoundryBundle/current/index.html" target="_blank">Foundry</a></strong>. Ya que son para <strong>trabajar en local,&nbsp;</strong>solo los instalaremos en un entorno de desarrollo utilizando el flag <strong>--dev</strong>.</p>

<pre>
<code class="language-bash">composer require orm-fixtures --dev
composer require zenstruck/foundry --dev</code></pre>

<h3>DoctrineFixturesBundle</h3>

<p>Este paquete nos permite de forma f&aacute;cil&nbsp;cargar datos de prueba en la base de datos.&nbsp;Podemos definir &quot;<strong>fixtures</strong>&quot;, que <strong>son scripts PHP que podremos configurar para definir como poblamos la base de datos</strong>. Por ejemplo, crea&nbsp;6 usuarios o crea 10 post y as&iacute;gnale uno de los usuarios existentes. Esto lo veremos a continuaci&oacute;n con m&aacute;s profundidad.</p>

<p>Al instalar este paquete ya nos habr&aacute; generado un <strong>fixture </strong>llamado <strong>src/DataFixtures/AppFixtures.php</strong> que podremos configurar m&aacute;s adelante para cargar nuestros datos.</p>

<h3>Foundry</h3>

<p>El paquete <strong>Foundry </strong>nos permitir&aacute; crear los <strong>Factories </strong>de forma sencilla, los cuales <strong>son clases que utilizaremos para crear y configurar los datos</strong> que queremos generar para poder poblar la base de datos.</p>

<h3>Creaci&oacute;n de los Factories ⚒️</h3>

<p>Como he dicho antes vamos a crear los <strong>Factories</strong>. Gracias a la instalaci&oacute;n de&nbsp;<strong>Foundry </strong>ahora tenemos nuevos comandos y el siguiente nos ayudar&aacute; a crear un <strong>Factory </strong>para cada entidad, el cual nos permitir&aacute; generar los datos de prueba.</p>

<p>Para ello lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:factory</code></pre>

<p>Como en ocasiones anteriores, se ejecutar&aacute; el <strong>asistente </strong>y nos preguntar&aacute; para qu&eacute; entidades queremos que nos cree los <strong>Factories</strong>. <strong>Le diremos que para todas</strong>.</p>

<p>Una vez hecho esto, se crear&aacute; una carpeta llamada <strong>Factory </strong>dentro de <strong>src </strong>y esta contendr&aacute; <strong>cuatro archivos, uno por cada entidad</strong>.</p>

<p>Si los revisamos, puedes ver que tenemos una clase que extiende de <strong>ModelFactory</strong>. Al extender de esta clase, nos permitir&aacute; acceder a un objeto llamado <strong>faker()</strong> el cual nos permitir&aacute; generar datos de prueba.</p>

<p>Os dejo un enlace a su documentaci&oacute;n para que ve&aacute;is todos los tipos de datos que se pueden generar:</p>

<p><a href="https://fakerphp.github.io/" target="_blank">https://fakerphp.github.io/</a></p>

<p>Tambi&eacute;n, en todos los <strong>factories</strong>, hay un m&eacute;todo llamado <strong>getDefaults()</strong>. Este m&eacute;todo indica que tipo de datos queremos que almacenen nuestras tablas. Un ejemplo puede ser que genere un texto, o una fecha, un n&uacute;mero, etc.</p>

<p>Para que funcionen exactamente como queremos, vamos a editarlos y el primero ser&aacute; el archivo <strong>src/Factory/PostFactory.php</strong>:</p>

<pre>
<code class="language-php">
use Symfony\Component\String\Slugger\AsciiSlugger;

....
protected function getDefaults(): array
{
    $slugger = new AsciiSlugger();
    $title = self::faker()-&gt;unique()-&gt;sentence();
    $created_and_publicated = \DateTimeImmutable::createFromMutable(self::faker()-&gt;dateTime());

    return [
        ''content'' =&gt; self::faker()-&gt;text(),
        ''created_at'' =&gt; $created_and_publicated,
        ''publication_date'' =&gt; $created_and_publicated,
        ''is_draft'' =&gt; false,
        ''slug'' =&gt; strtolower($slugger-&gt;slug($title)),
        ''title'' =&gt; $title,
    ];
}</code></pre>

<p>Como puedes ver, he importado una librer&iacute;a nueva llamada <strong>AsciiSlugger </strong>que nos permitir&aacute; convertir el t&iacute;tulo a <a href="http://www.noticias.ltda/online-marketing/sito-web/slug-seo/" target="_blank"><strong>slug</strong></a>.</p>

<p>Dentro del array de configuraci&oacute;n he modificado.</p>

<ul>
	<li>En <strong>content</strong>, utilizamos el objecto <strong>faker()</strong> para generar un texto aleatorio utilizando el m&eacute;todo <strong>text()</strong>. Recuerda que m&aacute;s arriba te deje un enlace con la doc. de <strong>faker</strong> para que veas todos los tipos de datos que puedes generar y su funcionamiento m&aacute;s en profundidad.</li>
	<li>El campo <strong>created_at </strong>guardamos el valor que viene&nbsp;por defecto en la variable&nbsp;<strong>$created_and_publicated</strong> y lo asignamos tanto en <strong>created_at </strong>como en <strong>publication_date</strong>.</li>
	<li><strong>is_draft </strong>para que siempre sea false y as&iacute; podamos visualizarlos todos.</li>
	<li>El <strong>t&iacute;tulo</strong> lo cargu&eacute; anteriormente en una variable y utilic&eacute; <strong>faker </strong>para generar una frase &uacute;nica que nos sirva de t&iacute;tulo.</li>
	<li>El campo <strong>slug </strong>he almacenado el valor de la variable t&iacute;tulo convertido a <a href="https://www.noticias.ltda/online-marketing/sito-web/slug-seo/" target="_blank">slug</a>.</li>
	<li>He eliminado <strong>user</strong>, ya que lo asignaremos desde otra parte.</li>
</ul>

<p>El siguiente a editar es <strong>src/Factory/TagFactory.php</strong>:</p>

<pre>
<code class="language-php">protected function getDefaults(): array
{
    return [
        ''name'' =&gt; self::faker()-&gt;unique()-&gt;word(),
    ];
}</code></pre>

<p>En este solo <strong>he modificado el tipo de dato para que sea una palabra en vez de un texto.</strong></p>

<p><strong>El Factory de comentarios solo&nbsp;necesita un cambio,</strong>&nbsp;y es modificar el <strong>UserFactory </strong>de <strong>new()</strong> a&nbsp;<strong>random()</strong> para que cuando creemos un comentario, este utilice uno de los existentes y no genere un usuario nuevo. En el caso de post no hace falta tocarlo, ya que le forzaremos un post desde otra parte.</p>

<pre>
<code class="language-php">protected function getDefaults(): array
{
    return [
        ''content'' =&gt; self::faker()-&gt;text(),
        ''post'' =&gt; PostFactory::new(),
        ''created_at'' =&gt; new \DateTimeImmutable(),
        ''user'' =&gt; UserFactory::random()
    ];
}</code></pre>

<p>Por &uacute;ltimo, vamos a editar el <strong>Factory </strong>de usuarios que adem&aacute;s ser&aacute; el que tendr&aacute; m&aacute;s chicha, <strong>src/Factory/UserFactory.php</strong>:</p>

<pre>
<code class="language-php">
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
...
public function __construct(private UserPasswordHasherInterface $hasher)
{
    parent::__construct();
}
...
protected function getDefaults(): array
{
    return [
        ''email'' =&gt; self::faker()-&gt;email(),
        ''password'' =&gt; ''login123'',
        ''roles'' =&gt; [''ROLE_USER''],
        ''username'' =&gt; self::faker()-&gt;unique()-&gt;name(),
    ];
}
...
protected function initialize(): self
{
    return $this
        -&gt;afterInstantiate(function(User $user): void {
            $user-&gt;setPassword(
                $this-&gt;hasher-&gt;hashPassword($user, $user-&gt;getPassword())
            );
        })
    ;
}</code></pre>

<p>En este caso hemos realizado los siguientes cambios:</p>

<ul>
	<li>Hemos importado la librer&iacute;a&nbsp;<strong>UserPasswordHasherInterface </strong>la cual utilizaremos para <strong>hashear </strong>los passwords en la base de datos. De esta manera <strong>nunca tendremos el password en texto plano de nuestro usuario</strong>.</li>
	<li>En el <strong>constructor</strong>, inyectamos la dependencia de&nbsp;<strong>UserPasswordHasherInterface</strong>. De esta manera, ya tenemos el objeto para hashear nuestros passwords listo para ser utilizado.</li>
	<li>Ya en <strong>getDefaults()</strong>, he cambiado el <strong>faker </strong>del email para que sea de tipo email.</li>
	<li>El password lo he forzado con el valor &quot;login123&quot; <strong>para que conozcamos el login por defecto de cualquier usuario si queremos hacer pruebas con nuestros datos falsos</strong>.</li>
	<li>Ya que estamos usando el sistema de roles de <strong>Symfony</strong>, he a&ntilde;adido el rol <strong>ROLE_USER</strong>. Este rol podremos usarlo m&aacute;s adelante para limitar accesos a ciertas p&aacute;ginas&nbsp;solo los usuarios que est&eacute;n registrados y autenticados.</li>
	<li>Por &uacute;ltimo modifiqu&eacute; <strong>username </strong>para que reciba un nombre &uacute;nico.</li>
</ul>

<p>En el m&eacute;todo <strong>initialize()</strong>, realic&eacute; las modificaciones para que cuando se cree un usuario, <strong>antes de insertarlo en la base de datos, hashee el password</strong>.</p>

<h3>Configurar los datos que queremos crear 🧑&zwj;💻</h3>

<p>Para generar los datos, tenemos que editar un &uacute;ltimo archivo, este se llama&nbsp;<strong>src\DataFixtures\AppFixtures.php</strong>&nbsp;y como coment&eacute; anteriormente, este se gener&oacute; cuando instalamos el paquete&nbsp;<strong>orm-fixtures</strong>.</p>

<pre>
<code class="language-php">use App\Factory\TagFactory;
use App\Factory\PostFactory;
use App\Factory\CommentFactory;
use App\Factory\UserFactory;
...
public function load(ObjectManager $manager): void
{
    UserFactory::createOne([
        ''username'' =&gt; ''Admin'',
        ''email'' =&gt; ''admin@blog-symfony.com'',
        ''roles'' =&gt; [''ROLE_ADMIN'']
    ]);

    TagFactory::createMany(20);
    UserFactory::createMany(10);

    PostFactory::createMany(20, function () {
        return [
            ''comments'' =&gt; CommentFactory::new()-&gt;many(0, 8),
            ''tags'' =&gt; TagFactory::randomRange(1, 5),
            ''user'' =&gt; UserFactory::random(),
        ];
    });
}</code></pre>

<p>En esta clase, primero importaremos todos nuestros <strong>factories</strong>, ya que los necesitaremos para generar nuestros datos.</p>

<p>Toda la l&oacute;gica de la generaci&oacute;n de datos se realizar&aacute; desde el m&eacute;todo <strong>load()</strong> as&iacute; que ah&iacute; he a&ntilde;adido la funcionalidad que necesitamos y que explicar&eacute; a continuaci&oacute;n.</p>

<p>Primero he creado un usuario con una configuraci&oacute;n por defecto. Para ello utilizo el m&eacute;todo <strong>createOne() </strong>que nos permite crear un registro y <strong>recibe un array con la informaci&oacute;n que quiero forzar</strong>. Si no enviamos este par&aacute;metro, utilizar&aacute; la configuraci&oacute;n que asignamos en <strong>getDefaults()</strong> en <strong>UserFactory</strong>.</p>

<p>Esto lo hacemos as&iacute;&nbsp;para forzar a que tenga un email que conozcamos y no tengamos que mirar la bbdd cada vez que la reiniciemos los datos para buscar un usuario con el que autenticarnos. Adem&aacute;s, le asign&eacute; el rol <strong>ROLE_ADMIN </strong>que m&aacute;s adelante veremos para qu&eacute; sirve, aunque el nombre de alguna pista 🤣.</p>

<p>El siguiente paso ha sido crear&nbsp;20 tags nuevos con el m&eacute;todo <strong>createMany() el cual recibe como primer par&aacute;metro el n&uacute;mero de registros a crear</strong>, esta vez sin enviar ninguna configuraci&oacute;n adicional.&nbsp;Estos los utilizaremos posteriormente para asign&aacute;rselos a nuestros posts.</p>

<p><strong>Despu&eacute;s he creado 10 usuarios m&aacute;s</strong>. Al igual que con <strong>tags</strong>, esta vez no he forzado ninguna configuraci&oacute;n adicional.</p>

<p>Por &uacute;ltimo, he generado 20 posts. En este caso, como puedes ver, recibe una funci&oacute;n an&oacute;nima. Esta funci&oacute;n se ejecutar&aacute; cada vez que se cree uno de los 20 post y en ella realizo tres acciones.</p>

<ul>
	<li>Primero, para <strong>comments</strong>, uso <strong>CommentFactory::new()-&gt;many(0, 8)</strong> el cual generar&aacute; de 0 a 8 comentarios nuevos y estar&aacute;n asociados a este post.</li>
	<li>Despu&eacute;s, para <strong>tags</strong>, uso&nbsp;<strong>TagFactory::randomRange(1, 5)</strong>. El m&eacute;todo <strong>randomRange</strong>, escoger&aacute; de 1 a 5 tags existentes y los asociar&aacute; a este post.</li>
	<li>Por &uacute;ltimo, utilizo&nbsp;<strong>UserFactory::random()</strong>. El m&eacute;todo random retornar&aacute; uno de los usuarios ya existentes y los asociar&aacute; a este post.</li>
</ul>

<p>Para finalizar, solo nos queda generar los datos. Para ello debemos lanzar el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console doctrine:fixtures:load   </code></pre>

<p>Nos aparecer&aacute; el asistente y <strong>nos avisar&aacute; que antes de insertar los datos purgar&aacute; los datos ya existentes</strong>. Como es la primera vez nos da igual, pero en el futuro si lo vais a utilizar y ten&eacute;is alg&uacute;n dato que os interese conservar tened esto en cuenta.</p>

<pre>
<code class="language-bash"> Careful, database "blog_symfony" will be purged. Do you want to continue? (yes/no) [no]:
 &gt; yes

   &gt; purging database
   &gt; loading App\DataFixtures\AppFixtures</code></pre>

<p>Y listo, ya tenemos los datos de pruebas, as&iacute; que con esto podemos dar por cerrado este tutorial. Nos vemos en el siguiente en que aprenderemos a utilizar las plantillas y empezaremos a ver nuestro blog en funcionamiento 💪.</p>

<p>Como siempre tambi&eacute;n os dejo en enlace al repo&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/como-crear-datos-falsos-base-de-datos-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/como-crear-datos-falsos-base-de-datos-symfony-6</a></p>', 1, '2023-01-29 15:26:20.628206+00', 'como-crear-datos-falsos-base-de-datos-symfony-6', 'f'),
('Parte 2: Cómo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6', 'posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6.png', '<p>En este tutorial vamos a ver c&oacute;mo <strong>conectarnos a una base de datos</strong> <strong>y crear las entidades que despu&eacute;s nos servir&aacute;n para crear las tablas autom&aacute;ticamente con Symfony 6</strong>.</p>

<p>👋 Seguimos con la serie de tutoriales&nbsp;de <strong>Symfony 6</strong> 💪. La primera parte fue una introducci&oacute;n y en esta segunda parte nos vamos a meter m&aacute;s en el meollo, si te lo perdiste, os dejo a continuaci&oacute;n toda la serie hasta la fecha:</p>

<ul>
	<li><a href="https://cosasdedevs.com/posts/crear-web-app-symfony-6/" target="_blank">Parte 1: C&oacute;mo crear una webapp con Symfony 6</a></li>
	<li>Parte 2: C&oacute;mo crear entidades, migraciones y conectarnos a una base de datos con Symfony 6</li>
	<li><a href="http://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank">Parte 3: C&oacute;mo crear datos falsos en una base de datos con&nbsp;Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/controladores-templates-estilos-tailwindcss-symfony-6/" target="_blank">Parte 4:&nbsp;Controladores, templates y estilos con Tailwind CSS en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/posts/optimizacion-queries-doctrine-ajustes-pagina-post-symfony-6/" target="_blank">Parte 5: Optimizaci&oacute;n de queries con Doctrine, ajustes y p&aacute;gina de post en Symfony 6</a></li>
	<li><a href="https://cosasdedevs.com/hidden/autenticacion-registro-symfony-6/" target="_blank">Parte 6: Autenticaci&oacute;n y registro con Symfony 6</a></li>
</ul>

<p>Sin m&aacute;s dilaci&oacute;n, empezamos con la segunda parte 🚀.</p>

<h2>Tablas de nuestra base de datos</h2>

<p>Lo primero que <strong>vamos a&nbsp;definir son las tablas que vamos a necesitar</strong>, en mi caso he decidido crear cuatro tablas, <strong>users </strong>para almacenar los usuarios, <strong>posts </strong>para guardar los posts que escriba un usuario, <strong>tags </strong>para poder categorizar los posts y <strong>comments </strong>para guardar los comentarios que escriba un usuario en un post.</p>

<p>Aqu&iacute; te dejo las tablas, campos que he decidido crear y sus tipos.</p>

<pre>
<code class="language-bash">users
	- id: int
	- roles: json
	- password: string
	- email: string
	- username: string
tags
	- id: int
	- name: string
posts
	- id: int
	- title: string
	- slug: string
	- created_at: datetime
	- updated_at: datetime
	- publication_date
	- is_draft: boolean
	- content: longtext
	- id_user: int
comments
	- id: int
	- created_at: datetime
	- content: longtext
	- id_user: int
	- id_post: int</code></pre>

<h3>Conectarnos a la base de datos con Symfony 6 🚠</h3>

<p>Una vez definidas las tablas, vamos a crear la conexi&oacute;n a la base de datos. Para ello vamos <strong>al archivo .env en el directorio ra&iacute;z</strong> y dentro encontraremos una clave llamada&nbsp;<strong>DATABASE_URL </strong>en la que tendremos que indicar los par&aacute;metros de conexi&oacute;n.</p>

<p>Por defecto viene habilitada la conexi&oacute;n para <strong>PostgreSQL</strong>, pero como yo voy a utilizar <strong>MySQL</strong>, he comentado esta l&iacute;nea y he des comentado la l&iacute;nea de <strong>MySQL</strong>. Despu&eacute;s solo debemos sustituir los par&aacute;metros de conexi&oacute;n por defecto por los nuestros:</p>

<pre>
<code class="language-bash"># DATABASE_URL="mysql://&lt;user&gt;:&lt;password&gt;@127.0.0.1:3306/&lt;database_name&gt;?serverVersion=5.7&amp;charset=utf8mb4"
# En mi caso sería así:
DATABASE_URL="mysql://cosasdedevs:gEU7aa06m9G1@127.0.0.1:3306/blog_symfony?serverVersion=5.7&amp;charset=utf8mb4"</code></pre>

<p>En mi caso, he llamado a la base de datos <strong>blog_symfony </strong>y no te preocupes si no existe <strong>porque vamos a ver como crearla autom&aacute;ticamente con Symfony 6</strong>.</p>

<p>Si vas a utilizar una base de datos <strong>distinta a MySQL</strong>, te dejo este enlace que explica como crear los distintos tipos de conexiones:</p>

<p><a href="https://symfony.com/doc/current/doctrine.html#configuring-the-database" target="_blank">https://symfony.com/doc/current/doctrine.html#configuring-the-database</a></p>

<h3>Crear una base de datos con Symfony 6 🚧</h3>

<p>Una vez establecido los par&aacute;metros de conexi&oacute;n, <strong>ya podemos acceder a nuestra base de datos desde Symfony 6</strong>, pero para ello primero <strong>debemos crear la base de datos</strong>, esto lo podemos hacer con el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console doctrine:database:create</code></pre>

<p>Si todo ha ido bien, te aparecer&aacute; un mensaje confirm&aacute;ndote que la base de datos se ha creado satisfactoriamente. Si no es as&iacute;, <strong>revisa que tus par&aacute;metros de conexi&oacute;n son correctos y que el usuario de la base de datos tiene permisos para crear la base de datos</strong>.</p>

<p>Una vez tengamos la base de datos lista, es hora de crear las entidades y repositorios que necesitaremos 💪.</p>

<h3>Qu&eacute; son las entidades 🤔</h3>

<p><strong>Una entidad es una clase que representa un registro en la base de datos</strong>, como un usuario, un post o un comentario. Es una forma de modelar la informaci&oacute;n en la aplicaci&oacute;n para poder trabajar con ella en forma de objeto&nbsp;y est&aacute; mapeada a una tabla en la base de datos.</p>

<h3>Qu&eacute; son los repositorios 🤨</h3>

<p>Un repositorio es un objeto que proporciona una interfaz <strong>para acceder a los datos almacenados en la base de datos</strong>, como b&uacute;squeda, filtrado y actualizaci&oacute;n de entidades. Es una forma de abstraer la l&oacute;gica de acceso a datos y se asocia con una <strong>entidad espec&iacute;fica</strong>. Los repositorios son objetos de <a href="https://www.doctrine-project.org/" target="_blank">Doctrine</a>, que es el <a href="https://symfony.com/doc/current/doctrine.html" target="_blank">ORM </a>con el que trabajaremos en<strong> Symfony 6</strong>.</p>

<h3><a id="entidad-usuarios" name="entidad-usuarios">Crear la entidad para usuarios</a></h3>

<p>La primera entidad con la que vamos a trabajar ser&aacute; la de usuarios. Para ello&nbsp;nos valdremos de un comando de <strong>Symfony 6</strong> el cual nos crear&aacute; la entidad autom&aacute;ticamente con varios campos ya definidos y actualizar&aacute; <a href="https://symfony.com/doc/current/reference/configuration/security.html" target="_blank">el archivo de la configuraci&oacute;n de seguridad</a> de nuestro proyecto (<strong>config/packages/security.yaml</strong>):</p>

<pre>
<code class="language-bash">php bin/console make:user</code></pre>

<p>Una vez lanzado el comando, se habilitar&aacute; un asistente y&nbsp;nos har&aacute; una serie de preguntas en las que yo he aceptado todos los par&aacute;metros por defecto.</p>

<pre>
<code class="language-bash"> The name of the security user class (e.g. User) [User]:
 &gt; 

 Do you want to store user data in the database (via Doctrine)? (yes/no) [yes]:
 &gt;

 Enter a property name that will be the unique "display" name for the user (e.g. email, username, uuid) [email]:
 &gt;

 Will this app need to hash/check user passwords? Choose No if passwords are not needed or will be checked/hashed by some other system (e.g. a single sign-on server).

 Does this app need to hash/check user passwords? (yes/no) [yes]:
 &gt;

 created: src/Entity/User.php
 created: src/Repository/UserRepository.php
 updated: src/Entity/User.php
 updated: config/packages/security.yaml</code></pre>

<p>Si acced&eacute;is a la clase&nbsp;<strong>src/Entity/User.php</strong>, podr&eacute;is ver los campos ya predefinidos que son, <strong>id, email, roles y password</strong>. Como nosotros tambi&eacute;n queremos a&ntilde;adir el campo <strong>username</strong>, tendremos que editar la entidad. Para ello lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:entity</code></pre>

<ul>
	<li>Primero nos preguntar&aacute; que entidad queremos crear o editar, en este caso la entidad <strong>User</strong>.</li>
	<li>Despu&eacute;s nos pregunta el campo que queremos a&ntilde;adir, en nuestro caso <strong>username</strong>.</li>
	<li>El siguiente paso es indicar que tipo de dato es, en este caso, <strong>string</strong> (si queremos ver todos los tipos de datos, escribimos &#39;<strong>?</strong>&#39;, y nos aparecer&aacute; un listado con todos los tipos v&aacute;lidos).</li>
	<li>Luego indicaremos el tama&ntilde;o del campo, aqu&iacute; he indicado que tendr&aacute; <strong>un m&aacute;ximo de 100 caracteres</strong>.</li>
	<li>Por &uacute;ltimo nos preguntar&aacute; <strong>si queremos que el campo pueda ser nulo y le decimos que no</strong>.</li>
</ul>

<p>Ahora nos preguntar&aacute; si queremos a&ntilde;adir alg&uacute;n campo m&aacute;s y como no es as&iacute;, <strong>pulsamos enter</strong> y listo, ya tenemos el nuevo campo.</p>

<h3>Crear la entidad para tags</h3>

<p>Para crear la entidad <strong>tags</strong>, lanzaremos el comando de <strong>Symfony 6</strong> que nos permite generarlas, la diferencia con el comando anterior es que este es para crear cualquier tipo de entidad y el anterior se utiliza para crear concretamente la de usuarios con campos predefinidos y realiza las modificaciones en la configuraci&oacute;n de seguridad de nuestro proyecto como coment&eacute; anteriormente.</p>

<p>Este comando lo usaremos para crear/modificar&nbsp;el resto de entidades:</p>

<pre>
<code class="language-bash">php bin/console make:entity</code></pre>

<ul>
	<li>Primero nos pregunta el nombre que le queremos dar que ser&aacute; <strong>Tag</strong>.</li>
	<li>Despu&eacute;s nos pide a&ntilde;adir un campo, aqu&iacute; escribimos el nombre del campo que se llamar&aacute; <strong>name</strong>.</li>
	<li>Luego nos pregunta el tipo, en este caso ser&aacute; <strong>string</strong>.</li>
	<li>La siguiente pregunta es el tama&ntilde;o del campo, aqu&iacute; indicaremos <strong>50 caracteres</strong>.</li>
	<li>Y por &uacute;ltimo indicamos que <strong>no podr&aacute; ser nulo</strong>.</li>
</ul>

<p>Como no queremos a&ntilde;adir m&aacute;s campos, pulsamos enter y salimos del asistente.</p>

<h3>Crear la entidad para posts</h3>

<p>Al igual que en el caso anterior, lanzamos el comando para crear una entidad y en este caso la llamaremos <strong>Post</strong>. Despu&eacute;s solo debemos a&ntilde;adir los siguientes campos como ya hemos visto antes, pero esta vez <strong>NO SALGAS DEL ASISTENTE</strong> cuando a&ntilde;adas el &uacute;ltimo campo, <strong>ya que tendremos que a&ntilde;adir la relaci&oacute;n entre la tabla posts y users y posts y tags y esa la explicar&eacute; m&aacute;s a fondo</strong>.</p>

<ul>
	<li>Nombre: title, tipo: string, tama&ntilde;o 255, no nulo.</li>
	<li>Nombre: slug, tipo: string, tama&ntilde;o 255, no nulo.</li>
	<li>Nombre: created_at, tipo: datetime_immutable, no nulo.</li>
	<li>Nombre: updated_at, tipo: datetime_immutable, si puede ser nulo.</li>
	<li>Nombre: publication_date, tipo: datetime_immutable, si puede ser nulo.</li>
	<li>Nombre: is_draft, tipo: boolean, no nulo.</li>
	<li>Nombre: content, tipo: text, no nulo.</li>
</ul>

<p>Como he comentado antes, <strong>el siguiente campo ser&aacute; la relaci&oacute;n entre la tabla users y posts</strong>. Para crearlo seguiremos los siguientes pasos:</p>

<p>Primero a&ntilde;adimos el nombre de la propiedad que ser&aacute; llamada <strong>user</strong>.</p>

<p>Despu&eacute;s tenemos que a&ntilde;adir el tipo de dato, aqu&iacute; tenemos una posibilidad muy interesante y es que si le decimos de tipo <strong>relation</strong>, nos preguntar&aacute; con que entidad queremos relaciornala, <strong>en nuestro caso con la entidad User</strong> y que tipo de relaci&oacute;n queremos generar, lo que nos facilitar&aacute; mucho el trabajo:</p>

<pre>
<code class="language-bash">Field type (enter ? to see all types) [string]:
 &gt; relation

 What class should this entity be related to?:
 &gt; User

What type of relationship is this?
 ------------ ----------------------------------------------------------------- 
  Type         Description
 ------------ -----------------------------------------------------------------
  ManyToOne    Each Post relates to (has) one User.
               Each User can relate to (can have) many Post objects.

  OneToMany    Each Post can relate to (can have) many User objects.
               Each User relates to (has) one Post.

  ManyToMany   Each Post can relate to (can have) many User objects.
               Each User can also relate to (can also have) many Post objects.

  OneToOne     Each Post relates to (has) exactly one User.
               Each User also relates to (has) exactly one Post.
 ------------ -----------------------------------------------------------------</code></pre>

<p>Como ves, nos explica de forma clara que tipo de relaciones existen y que implica cada una. En nuestro caso, <strong>un post pertenecer&aacute; a un &uacute;nico usuario y un usuario podr&aacute; tener varios posts por lo que seleccionaremos ManyToOne</strong>.</p>

<p>Luego nos pregunta si queremos que <strong>el campo pueda ser nulo y le diremos que no</strong>.</p>

<p>Despu&eacute;s&nbsp;nos pregunta si queremos tener un m&eacute;todo para obtener todos los posts por usuario y tambi&eacute;n le decimos que no.</p>

<p>Por &uacute;ltimo, sin salir del asistente, vamos a a&ntilde;adir <strong>la relaci&oacute;n de tags con posts</strong>. Para ello seguimos los mismos pasos:</p>

<ul>
	<li>Como nombre la llamaremos <strong>tags</strong>.</li>
	<li>Ser&aacute; de tipo <strong>relation</strong>.</li>
	<li>La entidad relacionada ser&aacute; <strong>Tag</strong>.</li>
	<li>El tipo de relaci&oacute;n ser&aacute; <strong>ManyToMany </strong>porque un post puede tener varios tags y un tag puede pertenecer a varios posts.</li>
	<li>Por &uacute;ltimo nos pregunta si queremos crear el m&eacute;todo para obtener todos los posts de un tag y le decimos que s&iacute;.</li>
</ul>

<p>Listo, ya tenemos preparada la entidad para nuestros posts.</p>

<h3>Crear la entidad para comentarios</h3>

<p>Por &uacute;ltimo, crearemos la entidad para los comentarios. Lanzamos el comando y la llamaremos <strong>Comment</strong>.</p>

<p>Los campos deber&aacute;n tener la siguiente configuraci&oacute;n:</p>

<ul>
	<li>Nombre: created_at, tipo: datetime_immutable, no nulo.</li>
	<li>Nombre: content, tipo: text, no nulo.</li>
	<li>Nombre: user, tipo: ManyToOne, entidad: User, no nulo, obtener comentarios desde el usuario: no.</li>
	<li>Nombre: post, tipo: ManyToOne, entidad: Post, no nulo, obtener comentarios desde el post si, eliminar comentarios si se elimina el post, s&iacute;.</li>
</ul>

<h3>Modificar campos para que sean de tipo &uacute;nico</h3>

<p>Ahora que ya tenemos todas nuestras entidades listas, vamos a realizar unas peque&ntilde;as modificaciones, <strong>ya que quiero forzar a que algunos campos sean &uacute;nicos en la base de datos</strong> como el username, el nombre de un tag y el t&iacute;tulo y slug de los posts.</p>

<p>Primeo vamos a modificar el username. Para realizar esta acci&oacute;n, vamos a la entidad User.php (<strong>src/Entity/User.php</strong>) y modificamos la declaraci&oacute;n de la variable <strong>$username</strong> para que quede as&iacute;:</p>

<pre>
<code class="language-php">#[ORM\Column(length: 100, unique: true)]
private ?string $username = null;</code></pre>

<p>Como puedes ver, lo &uacute;nico que hemos hecho, es a&ntilde;adir a la <strong>anotaci&oacute;n </strong>de la columna el par&aacute;metro unique: true.</p>

<p>Ahora haremos lo mismo para Tag.php (<strong>src/Entity/Tag.php</strong>).</p>

<pre>
<code class="language-php">#[ORM\Column(length: 50, unique: true)]
private ?string $name = null;</code></pre>

<p>Y por &uacute;ltimo&nbsp;para Post.php (<strong>src/Entity/Post.php</strong>).</p>

<pre>
<code class="language-php">#[ORM\Column(length: 255, unique: true)]
private ?string $title = null;

#[ORM\Column(length: 255, unique: true)]
private ?string $slug = null;</code></pre>

<p>Ahora si tenemos las entidades listas, as&iacute; que el siguiente paso es generar las <strong>migraciones</strong>.</p>

<h3>Qu&eacute; son las migraciones</h3>

<p>Las <strong>migraciones </strong>son un proceso por el cual <strong>Symfony nos permite crear/actualizar la estructura de la base de datos</strong> de nuestra aplicaci&oacute;n sin perder datos. Las migraciones se definen como <strong>scripts en PHP</strong> que describen cambios en la estructura de la base de datos, como agregar o eliminar tablas, columnas, etc. Estos scripts se pueden generar y ejecutar de manera autom&aacute;tica y controlada mediante comandos de&nbsp;<strong>Symfony</strong>.</p>

<h3>Crear migraciones y subir los cambios a nuestra base de datos</h3>

<p><strong>Para crear el archivo de migraci&oacute;n</strong>, debemos lanzar el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console make:migration</code></pre>

<p>Este comando <strong>generar&aacute; un script PHP dentro de la carpeta migrations</strong> y si lo abrimos podremos ver las queries necesarias para crear nuestras tablas con base en la informaci&oacute;n almacenada en nuestras entidades.</p>

<p>Una vez creada la migraci&oacute;n, ya podemos crear nuestras tablas de forma autom&aacute;tica gracias a Symfony. Para ello debemos lanzar el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console doctrine:migration:migrate</code></pre>

<p>Si todo ha ido bien, podemos acceder a nuestra base de datos y visualizar las tablas.</p>

<p>Y listo, con esto podemos dar por finalizado este tutorial. Te dejo en enlace al repositorio <a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-entidades-migraciones-conexion-base-de-datos-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-entidades-migraciones-conexion-base-de-datos-symfony-6</a> y en el pr&oacute;ximo veremos <a href="https://cosasdedevs.com/posts/como-crear-datos-falsos-base-de-datos-symfony-6/" target="_blank"><strong>como crear datos de prueba en nuestras tablas</strong></a> para tener informaci&oacute;n con la que trabajar 💪.</p>', 1, '2023-01-29 09:14:51.637247+00', 'crear-entidades-migraciones-conexion-base-de-datos-symfony-6', 'f'),
('Parte 1: Cómo crear una webapp con Symfony 6', 'posts/crear-web-app-symfony-6.png', '<p>En este tutorial vamos a ver como crear una web completa y paso a paso con el Framework de <strong>Symfony 6</strong>&nbsp;y <strong>PHP 8.1</strong>.</p>

<p>👋 &iexcl;Hola! Cuanto tiempo sin escribir nada. Estos meses me los he tomado de relax en cuanto al blog (que en el curro para nada, ah&iacute; si me toc&oacute; pringar menos en las vacaciones de navidad 😅) y ahora que he recargado pilas he decidido escribir sobre <strong>Symfony</strong>.</p>

<p>He tenido una relaci&oacute;n de amor-odio durante&nbsp;muchos a&ntilde;os con <strong>Symfony </strong>(mi primera web fue creada con <strong>Symfony 2</strong>) pero viendo las posibilidades que ofrece he decidido darle otra oportunidad y aqu&iacute; estamos 🤷&zwj;♂️.</p>

<h2>Requisitos 🤔</h2>

<p>Para este tutorial vamos a utilizar la versi&oacute;n de <strong>Symfony 6.2.*</strong> por lo que necesitaremos tener instalado <strong>PHP 8.1</strong>&nbsp;y <a href="https://getcomposer.org/download/" target="_blank">Composer</a> en nuestro PC.</p>

<p>Tambi&eacute;n necesitaremos el <strong>CLI de Symfony</strong> para crear la estructura del proyecto. En el siguiente enlace se explica como instalarlo.</p>

<p><a href="https://symfony.com/download" target="_blank">https://symfony.com/download</a></p>

<p>Como tambi&eacute;n tocaremos algo de <strong>front</strong>, vamos a necesitar instalar <strong>Node</strong> y su gestor de paquetes <strong>npm</strong> el cual viene integrado con la instalaci&oacute;n de <strong>Node</strong>.</p>

<p><a href="https://nodejs.org/es/download/" target="_blank">https://nodejs.org/es/download/</a></p>

<p>Para la base de datos yo voy a utilizar <strong>MySQL</strong>, pero puedes utilizar la que quieras, eso s&iacute;, puede que cambien algunas cosas en las configuraciones y tengas que investigar por tu cuenta m&aacute;s all&aacute; de este tutorial.</p>

<p>Con esto listo ya podemos empezar 🤘.</p>

<h3>Crear un proyecto Web con Symfony</h3>

<p><strong>Para crear un proyecto Web en Symfony</strong>, abrimos la consola, vamos&nbsp;al directorio donde queramos alojar el proyecto y lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">symfony new blog_symfony --version="6.2.*" --webapp</code></pre>

<p>El comando &quot;<strong>symfony new</strong>&quot; crear&aacute; una carpeta llamada <strong>blog_symfony </strong>(pod&eacute;is cambiar <strong>blog_symfony </strong>por el nombre que quer&aacute;is).</p>

<p>Despu&eacute;s como opciones indicamos la <strong>versi&oacute;n </strong>con la que vamos a trabajar (si no a&ntilde;adimos esta opci&oacute;n, instalar&aacute; la &uacute;ltima estable).</p>

<p>Por &uacute;ltimo a&ntilde;adimos la opci&oacute;n <strong>--webapp</strong>, lo que har&aacute; que se instalen todas las dependencias necesarias para este tipo de proyecto.</p>

<h3>Estructura de un proyecto en Symfony 6</h3>

<p>Una vez lanzado el comando visto anteriormente, se generar&aacute; una carpeta con el nombre que le hayamos dado. Dentro de ella <strong>encontraremos varios directorios y archivos</strong> en el que os voy a explicar cu&aacute;les son los m&aacute;s importantes y que contienen.</p>

<ul>
	<li><code>bin/</code>: Contiene los archivos para ejecutar los comandos de <strong>Symfony</strong>, como crear un controlador, entidad, etc. Tambi&eacute;n podremos crear nuestros propios comandos.</li>
	<li><code>config/</code>: Contiene&nbsp;todos los archivos de configuraci&oacute;n del proyecto, como par&aacute;metros, servicios y rutas.</li>
	<li><code>migrations/</code>: En esta carpeta se almacenar&aacute;n todas las modificaciones que realicemos en la base de datos.</li>
	<li><code>src/</code>: Contiene el c&oacute;digo fuente de la aplicaci&oacute;n, incluyendo controladores, entidades y vistas.</li>
	<li><code>public/</code>: Guarda archivos est&aacute;ticos como im&aacute;genes, JavaScript y hojas de estilo, adem&aacute;s del punto de entrada a nuestro sitio web.</li>
	<li><code>templates/</code>: Contiene las <strong>plantillas Twig</strong> que se utilizan para generar la salida HTML din&aacute;micamente.</li>
	<li><code>var/</code>: Contiene archivos generados autom&aacute;ticamente como <strong>cach&eacute;s y logs</strong>.</li>
	<li><code>vendor/</code>: Contiene los paquetes de terceros utilizados por el proyecto.</li>
	<li><code>.env</code>: Contiene las variables de entorno del proyecto.</li>
	<li><code>composer.json</code>: Contiene las dependencias del proyecto y configuraciones adicionales para <strong>Composer</strong>.</li>
	<li><code>symfony.lock</code>: Contiene la versi&oacute;n espec&iacute;fica de <strong>Symfony </strong>y las dependencias utilizadas en el proyecto.</li>
</ul>

<h3>Levantar el proyecto en local 🚀</h3>

<p>Ahora que ya hemos explicado el contenido, vamos a ver <strong>como levantar el proyecto en nuestro PC</strong>. Para ello, vamos a la terminal y en el directorio ra&iacute;z del proyecto, lanzamos el siguiente comando:</p>

<pre>
<code class="language-bash">symfony serve</code></pre>

<p>Al ejecutar el comando se levantar&aacute; el proyecto y podremos acceder a &eacute;l desde el navegador en la siguiente ruta:</p>

<p><a href="http://127.0.0.1:8000 " target="_blank">http://127.0.0.1:8000&nbsp;</a></p>

<h3>C&oacute;mo solucionar el error del puerto ocupado&nbsp;🚩</h3>

<p>Alguna vez me ha pasado que ha apagado mi PC sin parar el proyecto. Al iniciar mi m&aacute;quina e intentar levantar el proyecto de nuevo, me ha aparecido un mensaje diciendo que el puerto ya est&aacute; ocupado. Esto lo he solucionado con el siguiente comando:</p>

<pre>
<code class="language-bash">symfony server:stop</code></pre>

<p>Este comando parar&aacute; el servicio si se qued&oacute; en el limbo y ya podremos levantarlo de nuevo 💪.</p>

<h3>Consola de Symfony 💻</h3>

<p><strong>Symfony </strong>nos provee de un <a href="https://symfony.com/doc/current/components/console.html" target="_blank">sistema de l&iacute;nea de comandos</a> que nos servir&aacute; de ayuda a la hora de crear controladores, entidades, actualizar la base de datos y muchas m&aacute;s cosas. En los pr&oacute;ximos tutoriales nos valdremos mucho de estos comandos para trabajar con nuestro proyecto, as&iacute; que si quer&eacute;is echarle un vistazo a todos los comandos disponibles, desde la terminal id al directorio ra&iacute;z del proyecto y lanzar el siguiente comando:</p>

<pre>
<code class="language-bash">php bin/console list</code></pre>

<p>Al lanzarlo, podremos ver un listado con todos los comandos y una breve descripci&oacute;n de los mismos.</p>

<p>Y listo, con esto podemos dar por finalizado este tutorial. En el pr&oacute;ximo tutorial que pod&eacute;is ver en el siguiente link, veremos&nbsp;<a href="https://cosasdedevs.com/posts/crear-entidades-migraciones-conexion-base-de-datos-symfony-6/" target="_blank"><strong>como crear la conexi&oacute;n a la base de datos, tablas y entidades para trabajar con nuestros datos en el proyecto</strong></a>&nbsp;💪.</p>

<p>Tambi&eacute;n os dejo el enlace al repositorio hasta este punto por si ten&eacute;is cualquier problema&nbsp;<a href="https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-web-app-symfony-6" target="_blank">https://github.com/albertorc87/blog-symfony-tutorial/tree/crear-web-app-symfony-6</a></p>', 1, '2023-01-21 07:37:52.392074+00', 'crear-web-app-symfony-6', 'f'),
('Introducción a la Arquitectura Hexagonal', 'posts/introduccion-arquitectura-hexagonal.png', '<p>La <strong>arquitectura hexagonal</strong> (tambi&eacute;n denominada patr&oacute;n de puertos y adaptadores) es un tipo arquitectura limpia o clean arquitecture en la que <strong>separamos en distintas capas nuestra aplicaci&oacute;n</strong> para evitar el acoplamiento y que de esta forma sean m&aacute;s escalables, testables y evitar en lo m&aacute;ximo posible la complejidad accidental.</p>

<p>&iexcl;Hola! 👋, sigo trabajando en mi aprendizaje de arquitecturas para el desarrollo de software y esta vez he estado he dado con la <strong>Arquitectura Hexagonal</strong>, as&iacute; que he decidido hacer una peque&ntilde;a introducci&oacute;n. Espero que os ayude a iniciaros en esta arquitectura 💪.</p>

<h2>Beneficios de usar Arquitectura Hexagonal</h2>

<ul>
	<li>Alto nivel de escalabilidad</li>
	<li>Nos ayuda a evitar en lo posible la complejidad accidental</li>
	<li>Al desacoplar las distintas partes, el c&oacute;digo es m&aacute;s f&aacute;cil de testear</li>
	<li>C&oacute;digo m&aacute;s mantenible y reutilizable</li>
</ul>

<h3>Cuando NO utilizarla</h3>

<p><strong>Evitarla en peque&ntilde;os proyectos que no vayan a cambiar</strong> o en el futuro tengan cambios peque&ntilde;os, ya que el tiempo de desarrollo (en las primeras fases) se puede alargar y no vale la pena para este tipo de proyectos.</p>

<h2>Capas de la arquitectura hexagonal</h2>

<p>La arquitectura hexagonal se divide en tres capas en la que cada capa solo puede comunicarse con la inmediata capa siguiente. Estas son<strong> infraestructura, aplicaci&oacute;n y dominio</strong>.</p>

<p style="text-align:center"><a href="https://i.imgur.com/9eqcL7e.png" target="_blank"><img alt="Capas de la arquitectura hexagonal" src="https://i.imgur.com/9eqcL7e.png" style="object-fit:scale-down; text-align:center" /></a></p>

<h3>Infraestructura</h3>

<p>En la infraestructura encontraremos <strong>los elementos que hacen de punto de entrada o salida de nuestra aplicaci&oacute;n</strong>. Como elementos de entrada pueden ser <strong>controladores de una API Rest, tambi&eacute;n controladores de un CLI</strong>. Como elementos externos pueden ser conexiones a bases de datos, env&iacute;os de emails, colas de mensajer&iacute;as (Kafka, RabbitMQ, etc.).</p>

<h3>Aplicaci&oacute;n</h3>

<p>En la capa de aplicaci&oacute;n ubicaremos <strong>los casos de uso de nuestra aplicaci&oacute;n</strong>,&nbsp;en un blog, por ejemplo, podr&iacute;a ser, registrar usuario, publicar un post, editar una categor&iacute;a, etc.</p>

<h3>Dominio</h3>

<p>En la capa de dominio hallaremos <strong>toda la l&oacute;gica de la aplicaci&oacute;n</strong>. Aqu&iacute; controlaremos las reglas de negocio que solo ser&aacute;n modificadas por criterios propios. Una regla podr&iacute;a ser que un usuario registrado tendr&iacute;a que confirmar su email para poder escribir comentarios.</p>

<h3>Conclusiones</h3>

<p>La Arquitectura Hexagonal nos puede ayudar con nuestros proyectos, <strong>pero en peque&ntilde;as aplicaciones habr&iacute;a que replantearnos si realmente es necesaria por la complejidad inicial que a&ntilde;ade al principio</strong>. Como siempre, ah&iacute; debes decidir t&uacute; y tu equipo cu&aacute;l es la mejor opci&oacute;n.</p>

<p>Para mi pr&oacute;ximo tutorial,&nbsp;<strong>voy a crear un proyecto utilizando Arquitectura Hexagonal, DDD y <a href="https://cosasdedevs.com/posts/que-es-cqrs/" target="_blank">CQRS</a></strong>, as&iacute; que estad atentos al blog o a mi Twitter si est&aacute;is interesados 😉.</p>

<h3>Fuentes</h3>

<p><a href="https://pro.codely.com/library/arquitectura-hexagonal-31201/66748/about/" target="_blank">Curso de Arquitectura Hexagonal de Codely.tv</a><br />
<a href="https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html" target="_blank">Post de arquitecturas limpias de Uncle Bob</a><br />
<a href="https://fideloper.com/hexagonal-architecture" target="_blank">Post de Fideloper Hexagonal Arquitecture</a><br />
<a href="https://medium.com/@edusalguero/arquitectura-hexagonal-59834bb44b7f" target="_blank">Post de Edu Salguero de Arquitecura Hexagonal</a></p>', 1, '2022-11-10 07:35:00.194284+00', 'introduccion-arquitectura-hexagonal', 'f'),
('¿Qué es CQRS (Command Query Responsibility Segregation)?', 'posts/que-es-cqrs.png', '<p>La abreviatura <strong>CQRS </strong>que significa <strong>Command Query Responsibility Segregation</strong> (separaci&oacute;n de la responsabilidad de consultas y comandos) es un patr&oacute;n de dise&ntilde;o de software el cual separa las consultas (recuperar datos) de los comandos (inserci&oacute;n, actualizaci&oacute;n y borrado de datos).</p>

<p>&iexcl;Hola 👋! &Uacute;ltimamente me estoy enfocando en <strong>aprender patrones de dise&ntilde;o de software</strong> y en mi camino he dado con <strong>CQRS</strong>. En este tutorial te voy a explicar que es <strong>CQRS </strong>y m&aacute;s adelante veremos como aplicarlo en un proyecto real.</p>

<h2>&iquest;Por qu&eacute; utilizar CQRS?</h2>

<p><strong>CQRS se utiliza en aplicaciones de alto rendimiento</strong>. Al separar las consultas de los comandos, podemos por ejemplo utilizar dos bases de datos, una <strong>NOSQL</strong>, ya que<strong>&nbsp;son m&aacute;s r&aacute;pidas a la hora de recuperar informaci&oacute;n,</strong>&nbsp;y otra <strong>SQL </strong>para los comandos (inserci&oacute;n, actualizaci&oacute;n y borrado) que son m&aacute;s veloces que las <strong>NOSQL </strong>a la hora de realizar estas acciones.</p>

<p><strong>Fomenta el uso del asincronismo en acciones m&aacute;s lentas</strong>, como puede ser por ejemplo un env&iacute;o masivo de emails, en el que podemos lanzar esta acci&oacute;n de forma <strong>as&iacute;ncrona </strong>sin esperar el resultado y as&iacute; no bloquear al usuario hasta que termine este proceso.</p>

<p>En este caso, podemos tener un <strong>websocket </strong>para recibir una notificaci&oacute;n confirmando la finalizaci&oacute;n del proceso o un panel donde podamos ver el estado de todos los trabajos as&iacute;ncronos que lancemos.</p>

<p>Tambi&eacute;n fomenta la reutilizaci&oacute;n de c&oacute;digo, por ejemplo en aplicaciones en las que tengas un servicio web, pero que adem&aacute;s tambi&eacute;n se pueda utilizar en consola <strong>(CLI)</strong>. En este caso puedes tener el controlador web y el controlador CLI y&nbsp;<strong>al utilizar CQRS, como tendremos separada toda la l&oacute;gica de negocio fuera los controladores</strong>, podremos reutilizarla y aprovecharla cuando la necesitemos. Esto lo veremos m&aacute;s claro en un pr&oacute;ximo tutorial ya con un ejemplo pr&aacute;ctico.</p>

<h3>Traza de la arquitectura CQRS</h3>

<p>Antes de meternos a fondo en materia, <strong>voy a explicar brevemente un ejemplo de la traza de ejecuci&oacute;n</strong> para que te vayan sonando los distintos componentes y despu&eacute;s explicar&eacute; para qu&eacute; sirven.</p>

<p>Por ejemplo, tenemos una petici&oacute;n POST para crear un usuario en una API:</p>

<ul>
	<li>El controlador recibir&aacute; los par&aacute;metros para la creaci&oacute;n del usuario</li>
	<li>Se crea un <strong>Command </strong>el cual ser&aacute; un <a href="https://cosasdedevs.com/diccionario-dev/que-es-dto/" target="_blank">DTO</a> (objeto de transferencia de datos) con los par&aacute;metros de creaci&oacute;n del usuario</li>
	<li>El&nbsp;<strong>CommandBus </strong>recibe por par&aacute;metro el <strong>Command&nbsp;</strong>el cual se encarga de enviarlo al <strong>CommandHandler</strong></li>
	<li>El <strong>CommnandHandler </strong>recibir&aacute; el <strong>Command </strong>y este se encargar&aacute; de enviarlo al caso de uso</li>
	<li>El caso de uso validar&aacute; los datos y los persistir&aacute; en la base de datos</li>
</ul>

<p>Importante decir que en el caso de las inserciones, actualizaciones o borrado,&nbsp;<strong>no se deber&aacute; realizar ning&uacute;n tipo de retorno</strong>, si por ejemplo hay un fallo por la validaci&oacute;n, se lanzar&aacute; una excepci&oacute;n y ya nosotros usando un framework o no, seremos los que nos tendremos que encargar de manejar ese error para mostrarle la informaci&oacute;n de lo que ha pasado al usuario.</p>

<p>En el caso de una consulta, el ejemplo ser&iacute;a similar, pero<strong>&nbsp;utilizar&iacute;amos la palabra Query en vez de Command</strong> (Query, QueryBus, QueryHandler) y en este caso s&iacute; que necesitamos realizar un retorno, ya que es una consulta.</p>

<h3>Command</h3>

<p><strong>En CQRS, un Command</strong> representa la intenci&oacute;n de realizar una acci&oacute;n en nuestro sistema que acabe modificando el estado de tal como puede ser crear un registro, modificar uno existe o eliminarlo.</p>

<p><strong>El formato del Command ser&aacute; un DTO</strong> (objeto de transferencia de datos) el cual representa la acci&oacute;n que queremos hacer. <strong>Como</strong> <strong>vimos anteriormente en la traza de una ejecuci&oacute;n con CQRS</strong>, si queremos crear un usuario, debemos crear un <strong>DTO </strong>que recibir&aacute; los par&aacute;metros que el usuario ha enviado a nuestra aplicaci&oacute;n:</p>

<pre>
<code class="language-php">final class CreateUserCommand extends Command
{

    public function __construct(
    	private string $userId,
    	private string $userName,
    	private string $userEmail
    )
    {
    }

    public function userId(): string
    {
        return $this-&gt;userId;
    }

    public function userName(): string
    {
        return $this-&gt;userName;
    }
    
    public function userEmail(): string
    {
        return $this-&gt;userEmail;
    }
}</code></pre>

<p>Este <strong>Command </strong>ser&iacute;a enviado desde el <strong>CommandBus </strong>hasta el <strong>CommandHandler </strong>y como coment&eacute; anteriormente, <strong>en el caso de uso ya nos encargamos de validar y persistir los datos</strong>.</p>

<h3>Query</h3>

<p><strong>En CQRS, una Query representa la intenci&oacute;n de solicitar datos a nuestro sistema</strong> sin que ello acabe alterando el estado de tal.</p>

<p>Al igual que en el <strong>Command</strong>, una <strong>Query </strong>ser&aacute; un <strong>DTO </strong>el cual representar&aacute; la petici&oacute;n de datos que queremos consultar. Por ejemplo, podr&iacute;amos querer consultar un listado de usuarios por X filtros:</p>

<pre>
<code class="language-php">final class GetUsersQuery extends Query
{

    public function __construct(
    	private ?string $orderBy = null,
    	private ?string $order = null,
    	private ?array $filters = null,
    	private ?int $limit = null,
    	private ?int $offset = null
    )
    {
    }

    public function orderBy(): ?string
    {
        return $this-&gt;orderBy;
    }

    public function order(): ?string
    {
        return $this-&gt;order;
    }

    public function filters(): ?array
    {
        return $this-&gt;filters;
    }

    public function limit(): ?int
    {
        return $this-&gt;limit;
    }

    public function offset(): ?int
    {
        return $this-&gt;offset;
    }
}</code></pre>

<p>Al igual que con el <strong>Command</strong>, esta <strong>Query </strong>ser&iacute;a enviada desde el <strong>QueryBus </strong>hasta el <strong>QueryHandler </strong>y desde el caso de uso se validar&iacute;an los filtros y se realizar&iacute;a la consulta.</p>

<h3>Command/Query Bus</h3>

<p>Aclarado esto, el siguiente paso <strong>es ver por donde se mueven estos Command/Query</strong>. Estos los crearemos desde el controlador y los lanzaremos al bus correspondiente (<strong>QueryBus </strong>o <strong>CommandBus</strong>). <strong>Este bus ser&aacute; el encargado de trasladar el DTO a su Handler correspondiente</strong>.</p>

<h3>Command/Query Handler</h3>

<p>En <strong>Handler </strong>recibir&aacute; el <strong>DTO </strong>y este lo enviar&aacute; al caso de uso.&nbsp;Gracias a esto, el controlador estar&aacute; completamente desacoplado del caso de uso y si queremos cambiarlo solo debemos realizar la modificaci&oacute;n en el <strong>Handler </strong>por el nuevo caso de uso y listo.</p>

<h3>Caso de uso</h3>

<p><strong>Aqu&iacute; es donde recibimos el DTO y aplicamos la l&oacute;gica de negocio</strong>, validaremos los datos y despu&eacute;s, seg&uacute;n el tipo, los persistiremos o los recuperaremos.</p>

<h3>Fuentes</h3>

<p>Para escribir este tutorial me he basado en las siguientes fuentes:</p>

<ul>
	<li><a href="https://pro.codely.com/library/cqrs-command-query-responsibility-segregation-29074/62554/about/" target="_blank">Curso de Codely.tv de&nbsp;CQRS: Command Query Responsibility Segregation</a></li>
	<li><a href="https://www.netmentor.es/entrada/patron-cqrs-explicado-10-minutos" target="_blank">Patr&oacute;n CQRS explicado en 10 minutos</a></li>
	<li><a href="https://www.oscarblancarteblog.com/2018/11/30/data-transfer-object-dto-patron-diseno/" target="_blank">&iquest;Qu&eacute; es un DTO?</a></li>
</ul>', 1, '2022-11-06 10:03:19.225105+00', 'que-es-cqrs', 'f');