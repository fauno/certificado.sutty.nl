---
title: "¿Cómo se construye una página web que resista eventualidades, ataques, sobrecargas
  y proteja nuestro trabajo? - sitios web transportables, te lo explicamos."
description: "Con \"transportable\" nos referimos a la característica que permite
  que el sitio web pueda ser descargado como una serie de archivos, ya sea para ser
  alojado en otro/s lugar/es, para mantener copias fuera de línea y/o para compartirlo
  entre pares (alojamiento distribuido).\r\nEsta característica de Sutty viene habilitada
  por defecto. Al final del artículo explicamos cómo aprovecharla."
image:
  description: ''
tags:
- sitios transportables
- complementos
- resiliencia web
- almacenamiento distribuido
- documentación
- artículo técnico
order: 11
layout: post
uuid: 165d8fb6-afc5-4ad9-be4b-915db4fbe7c6
liquid: false
usuaries:
- 5
---



<h2>Introducción</h2><div>¿Qué es un sitio web “resiliente”? ¿Cómo se construye una página web que resista eventualidades, ataques, sobrecargas y proteja nuestro trabajo? Una característica que lo asegura es la transportabilidad. Es decir, que ante cualquier eventualidad, el sitio pueda moverse de un lado a otro con un mínimo de esfuerzo.<br><br><br>
</div><div>Es muy recurrente en nuestro trabajo encontrarnos con situaciones donde el sitio dejó de estar disponible porque el alojamiento no fue pagado a tiempo , o una actualización no es compatible con nuestra configuración. O el alojamiento suspende el sitio porque superó los límites de visitas del sitio, por un pico en el interés o por un ataque concertado (“DDOS” por denegación distribuida de servicio, en inglés).<br><br><br>
</div><div>También se dan situaciones planificadas, que de todas formas dejan al sitio fuera de juego por un tiempo. Puede suceder que cambiemos de nombre de dominio o habilitemos el protocolo HTTPS en nuestros sitios. (Proceso que recomendamos especialmente, para proteger la integridad de nuestro sitio y la privacidad de nuestres visitantes.)<br><br><br>
</div><div>Estos cambios en la estructura de un sitio deben estar bien pensadas, porque afectan el tiempo que pasamos fuera de circulación. Son sucesos que en definitiva se hacen con cierta urgencia y tensión y que nos desgastan.<br><br><br>
</div><div>Por estas experiencias, desde Sutty tomamos la decisión muy temprana de que todos los sitios sean transportables. Es decir: tomar todos los archivos de un sitio y copiarlos a otro lugar debería ser lo más simple posible y no requerir ningún cambio o adaptación al sitio tal y como está.<br><br><br>
</div><div>Esto habilita otras estrategias sumamente interesantes y que también tienen que ver con la resiliencia de un sitio. Cuando un sitio es transportable, es posible archivarlo para resguardar la memoria histórica, teniendo a disposición distintas versiones. También es posible activar estrategias contra la censura, como las que aplicaron <em>Wikileaks</em> y <em>The Pirate Bay</em> en sus momentos de mayor persecución: pusieron a disposición copias de sus sitios para que fueran alojadas copias por toda la Internet, en solidaridad. Se nos ocurren otras, como poder descargarse los sitios y llevarlos en una memoria portátil a zonas donde no haya acceso a Internet, o alojar el sitio en infraestructuras distribuidas, como <a href="https://ipfs.io/">IPFS</a> (en inglés).<br><br><br>
</div><div>Para poder lograr esto, tuvimos que hacer algunos cambios en cómo se estructuran internamente los sitios y cómo se vinculan las distintas páginas entre sí.<br><br><br>
</div><h2>Cómo funcionan las direcciones web</h2><blockquote>
<strong>Aviso:</strong> La propuesta de Sutty es comunicar los aspectos técnicos para poder habilitar su apropiación. Por eso no los ocultamos, sino que tratamos de clarificarlos, lo que no siempre es inmediato. Si algo no se entiende, por favor <a href="https://docutopia.tupale.co/">contactanos</a> :)<br><br><br>
</blockquote><div>Un sitio web está compuesto de páginas web que representan las distintas partes del sitio. Cada página representa un artículo, por ejemplo, como si fuera un libro o revista. Luego hay otros recursos, como imágenes, videos y otros archivos relacionados, donde se definen el estilo de la página (colores, tipografía, etc.) y comportamientos específicos.<br><br><br>
</div><div>En los sitios generados por Sutty, todas estos recursos se almacenan en un directorio (nombre técnico de una carpeta). Esta estructura o árbol de archivos y sub-directorios se corresponde con la estructura de direcciones (“URLs”, <em>links</em>, vínculos) del sitio al que accedemos a través de un navegador.<br><br><br>
</div><div>Por ejemplo, a la dirección web <a href="https://sutty.nl/politica-de-privacidad/">https://sutty.nl/politica-de-privacidad/</a> le corresponde un archivo llamado index.html (este nombre es tácito en la dirección) dentro de un directorio llamado politica-de-privacidad. Su ubicación completa es politica-de-privacidad/index.html, porque las partes de una ubicación se unen con /. En Windows, las direcciones se unen con \, pero en web siempre es /.<br><br><br>
</div><div>Esta dirección de ejemplo no tiene imágenes, pero tiene una hoja de estilos (“CSS”) que define el diseño de la página y en este caso está ubicada en assets/css/styles.css.<br><br><br>
</div><div>Si lo representáramos en un árbol, sería así.<br><br><br>
</div><pre>sutty.nl/
├── assets
│   └── css
│       └── styles.css
└── politica-de-privacidad
    └── index.html
<br></pre><div>Para que un sitio web sea transportable, tenemos que poder copiar este directorio sutty.nl con todos sus archivos y que el sitio siga funcionando correctamente, es decir que la política de privacidad pueda encontrar su hoja de estilos, sin importar la ubicación donde lo guardemos. Si colocamos el sitio en C:\Users\sutty\copia de seguridad\sutty.nl tiene que funcionar lo mismo que si lo publicamos en web en <a href="https://sutty.neocities.org/">https://sutty.neocities.org/</a> o en <a href="https://solidaridadweb.org/sitios/sutty/">https://solidaridadweb.org/sitios/sutty/</a> (esta última es de ejemplo, ¡pero la anterior funciona!).<br><br><br>
</div><h2>Direcciones absolutas y relativas</h2><div>Existen distintas formas de vincular archivos entre sí, en nuestro caso, que la <em>política de privacidad</em> vincule a su <em>hoja de estilos</em>. Estas diferentes formas tienen distintos nombres y nos simplifican o dificultan la tarea de transportar un sitio.<br><br><br>
</div><div>A veces, las plataformas de publicación usan las direcciones completas de los distintos recursos. Por ejemplo, para que la política de privacidad vincule a su hoja de estilos, usa la dirección <a href="https://sutty.nl/assets/css/styles.css">https://sutty.nl/assets/css/styles.css</a>. Pero si cambiara alguno de los elementos de esta dirección, el archivo styles.css ya no podría ser encontrado.<br><br><br>
</div><div>Esto pasa bastante si estamos agregando soporte para HTTPS a nuestro sitio, porque la dirección cambió de <a href="http://sutty.nl/assets/css/styles.css">http://sutty.nl/assets/css/styles.css</a> (sin “s”) a <a href="https://sutty.nl/assets/css/styles.css">https://sutty.nl/assets/css/styles.css</a> (con “s”). También si cambiáramos nuestro dominio de sutty.nl a sutty.neocities.org, o copiáramos el sitio dentro otro como en <a href="https://solidaridadweb.org/sitios/sutty/assets/css/styles.css">https://solidaridadweb.org/sitios/sutty/assets/css/styles.css</a>.<br><br><br>
</div><div>Esta dirección es muy precisa, con lo que cualquier cambio de ubicación del sitio implica que debemos readecuar todas las direcciones dentro del sitio, que pueden ser pocas o montones, siempre con un grado de error. Hay programas que lo hacen también.<br><br><br>
</div><div>Todo esto provoca que tengamos que pensar varias veces antes de cambiar de ubicación un sitio web y que debamos planificarlo bien.<br><br><br>
</div><div>Hay dos estrategias posibles para poder cambiar la primera parte de la dirección (https://sutty.nl) sin “romper” el sitio.<br><br><br>
</div><h3>Direcciones absolutas</h3><div>En el caso de las URLs absolutas, se trata de eliminar la parte de la dirección que indican el protocolo (http:// o https://) y el dominio (sutty.nl). Hay otros componentes, aunque por lo general solo vemos estos dos.<br><br><br>
</div><div>Las direcciones absolutas indican la ubicación de los archivos a partir de la carpeta donde están guardados, representados por la primera / (la “raíz” del árbol).<br><br><br>
</div><div>En nuestro ejemplo entonces, la hoja de estilos estaría vinculada a la dirección /assets/css/styles.css en lugar de <a href="https://sutty.nl/assets/css/styles.css">https://sutty.nl/assets/css/styles.css</a>. Es decir, le removimos la dirección web.<br><br><br>
</div><div>De esta forma, es posible cambiar de HTTP a HTTPS o de sutty.nl a solidaridadweb.org sin realizar cambios en los archivos del sitio. Como la dirección ignora la ubicación web, podemos mover los archivos entre distintas ubicaciones sin preocuparnos por hacer cambios.<br><br><br>
</div><div>Sin embargo, el sitio solo funciona correctamente si lo movemos de una ubicación web a otra manteniendo el mismo nivel de ubicación. Si copiáramos el sitio a <a href="https://solidaridadweb.org/sitios/sutty/">https://solidaridadweb.org/sitios/sutty/</a>, la raíz de los archivos está en /sitios/sutty/, pero la ubicación la sigue buscando en /assets/css/styles.css. Si el sitio solidaridadweb.org no tiene un archivo en esa ubicación, las políticas de privacidad de Sutty no van a tener diseño --y si hubiera un archivo, ¡tendría el diseño equivocado!<br><br><br>
</div><div>Y aun así, todavía no podemos descargarnos el sitio a nuestra computadora y navegarlo.<br><br><br>
</div><h3>Direcciones relativas</h3><div>Para que un sitio sea realmente transportable y su conjunto de archivos pueda moverse por toda la web sin romperse, tenemos que usar direcciones relativas.<br><br><br>
</div><div>Estas direcciones no tienen una raíz absoluta. Los archivos se vinculan entre sí por su ubicación actual en un árbol de directorios que desconocen. De esta forma, el archivo politicas-de-privacidad/index.html vincula a ../assets/css/styles.css. Los .. representan el directorio anterior, sin importar su nombre y se pueden combinar para moverse varios niveles hacia atrás –../../../../.<br><br><br>
</div><div>Esta forma es un poco más compleja, pero nos da flexibilidad a la hora de transportar un sitio. Podemos guardar los archivos en <a href="https://sutty.nl">https://sutty.nl</a>, <a href="https://sutty.neocities.org">https://sutty.neocities.org</a>, <a href="https://solidaridadweb.org/sitios/sutty">https://solidaridadweb.org/sitios/sutty</a> o C:\Users\sutty o /home/alguien/sitios/copias/sutty y el sitio va a seguir funcionando.<br><br><br>
</div><div>Esta estrategia es muy importante para la característica que estábamos buscando porque nos permite copiar el sitio de un lugar a otro sin hacerle modificaciones.<br><br><br>
</div><h2>Cómo lo logramos</h2><div>Decíamos que es muy importante pero también agrega complejidad, porque cada archivo tiene que saber dónde están ubicados los otros archivos en relación a sí mismo.<br><br><br>
</div><div>En el desarrollo de esta característica llevamos a cabo un aprendizaje sobre distintas tecnologías/posibilidades web que estaban cayendo en desuso.<br><br><br>
</div><div>En principio, no todos los generadores de sitios, tanto estáticos como dinámicos, son capaces de generar ubicaciones relativas. Jekyll, el motor de Sutty, se cuenta entre los que no, pero es posible indicarle cómo hacerlo.<br><br><br>
</div><div>Una respuesta ha sido la de Rico Sta. Cruz, en su artículo <a href="https://ricostacruz.com/til/relative-paths-in-jekyll"><em>Relative paths in Jekyll</em></a> (“Ubicaciones relativas en Jekyll”) donde sugiere un código que es capaz de obtener la ubicación relativa a la página actual.<br><br><br>
</div><div>Sin embargo, este código tiene sus limitaciones, porque hay que expandirlo a la cantidad de niveles necesarios para un sitio --que nunca sabemos cuáles van a ser. Además, implica readaptar todas las plantillas para poder usar este esquema --un trabajo engorroso, aunque menor que adaptar todo un sitio.<br><br><br>
</div><div>La propuesta de Rico Sta. Cruz nos dio la inspiración para desarrollar nuestro propio complemento, que <strong>encuentra la ubicación relativa de forma automática y flexible</strong>, sin que le tengamos que indicar manualmente la ubicación, con cambios mínimos a las plantillas, que podrían ser automatizables también.<br><br><br>
</div><div>Logramos esto aprovechando un atributo de las páginas web llamado &lt;base&gt; (<a href="https://developer.mozilla.org/es/docs/Web/HTML/Elemento/base">documentación en Mozilla Web Docs</a>, aunque la versión en <a href="https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base">inglés es más completa</a>), que indica la ubicación relativa base para todos los archivos vinculados al documento actual. Con esto, solo necesitamos calcular la distancia del archivo hasta la carpeta raíz e intercambiarlos por los .. necesarios.<br><br><br>
</div><div>Otra cosa que necesitábamos cambiar es que las direcciones generadas por Jekyll ya no fueran absolutas. Esto fue solo complementar el código de Jekyll para remover la / inicial de todas las direcciones.<br><br><br>
</div><div>Estos dos simples cambios nos permiten generar sitios que se pueden transportar sin modificaciones, cumpliendo con nuestro primer objetivo.<br><br><br>
</div><h2>El complemento</h2><div>En Sutty trabajamos constantemente con software libre y nuestro compromiso es <a href="https://0xacab.org/sutty/">liberar todo el software que escribamos</a>. Este aprendizaje que hicimos quedó plasmado en un complemento que llamamos <a href="https://rubygems.org/gems/jekyll-relative-urls">jekyll-relative-urls</a> que cualquier sitio utilizando Jekyll puede instalar y utilizar, aun cuando no se aloje en Sutty.<br><br><br><br>
</div><h2>Cómo descargan su sitio con Sutty</h2><div>Una vez que tengan su sitio creado, pueden ir a la Configuración, que aparece como un botón en el lateral izquierdo del Panel (en ese mismo sitio, por si tienen más de uno).<br><br><br>
</div><div>Una vez en la pantalla de configuración, verán distintas opciones. Navegando hacia abajo de la lista, podrán encontrar la opción “Generar un archivo ZIP”. Pueden marcarla si no lo está y guardar la dirección en donde encontrarán el sitio comprimido, una vez que se genere. Será algo así como <a href="https://misitio.sutty.nl/misitio.sutty.nl.zip">https://misitio.sutty.nl/misitio.sutty.nl.zip<br></a><br><br>
</div><div>Deberán guardar los cambios y luego, al salir de la página, en el panel principal, publicarlos.<br><br><br>
</div><div>Yendo a la dirección indicada, podrán descargar una copia de su sitio. ¡Listo!<br><br><br>
</div><div><br></div>