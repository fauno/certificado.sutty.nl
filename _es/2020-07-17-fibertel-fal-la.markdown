---
title: Fibertel fal.la
description: Crónica de cómo un error técnico se convierte en un problema político.
  Fibertel falla y restringe sitios web de Sutty, Njalla, Mozilla y otros.
author:
- Sutty
image:
  description: "-hola, soporte técnico? creo que le servidore está caíde -ya me encargo
    -no estés caiduche, servidore, todes pensamos que estás haciendo lo que podés
    y todes te queremos"
  path: public/iz3tk2918l5jphxyii4nbl735zw2/caido.png
order: 16
layout: post
uuid: 36249a9b-102f-4b78-b3ea-1d796d5c270a
liquid: false
usuaries:
- 5
- 1
---



Esta mañana nos enteramos de que algunas personas no podían acceder a los sitios que gestiona y aloja Sutty, nuestra gestora de sitios web.  Saltamos de la cama y empezamos a hacer pruebas: aunque nuestros servidores funcionaban bien, desde Fibertel y Personal la cosa no parecía querer arrancar.  Con la ayuda de varies amigues, encontramos un problema técnico desde estos proveedores. Al igual que si se tratara de un bloqueo judicial, su efecto impide el acceso a nuestros sitios y a muchos de los sitios que alojamos.

Podía ser un problema técnico, pero también podía tratarse de censura: tenemos experiencia con ambos panoramas ya que Internet, aunque parece un espacio libre y descentralizado, se sostiene sobre vías de distribución y bloqueo manejadas desde esferas corporativas.

En las pruebas que hicimos con amigues y aliades (¡gracias!) vimos que el problema residía en cómo Fibertel  obtiene información sobre los nombres de dominio, que son los servidores DNS.  Cuando se les consultaba a unos por el nombre \`sutty.nl\`, la información que respondían era la correcta, pero otros no sabían responder nada.  Para asegurarnos, comprobamos que con otros proveedores esto no pasaba.

> Si quieren una explicación más detallada sobre este proceso, pueden leer la última sección :)

En este punto temíamos lo peor, porque no solo puede tratarse de un problema técnico temporal, que se resuelve cuando otra persona como nosotres se despierta y reinicia el servidor antes de poder desayunar, sino de los efectos de un bloqueo general hacia nuestros sitios o más probable y modestamente a los de Njalla.  Esto ha pasado más notoriamente cuando se intentó censurar a [The Pirate Bay](https://thepiratebay.org/) o [Wikileaks](https://wikileaks.org/), e incluso en Argentina, por una [demanda de CAPIF](https://partidopirata.com.ar/2014/07/01/una-medida-desproporcionada-e-inutil/), hace algunos años que el dominio \`thepiratebay.org\` y sus alternativas están bloqueadas.

Continuamos las pruebas y determinamos que Fibertel tampoco era capaz de resolver los dominios mismos de njal.la.  Sin embargo esto no sucedía en todos los casos y desde otros proveedores, con lo que empezábamos a inclinarnos por un problema técnico. Compañeres nos comentaban al mismo tiempo que este es un problema típico que tienen los clientes de Fibertel y que hace algunas semanas pasó algo similar con [Twitter y Twitch](https://twitter.com/xsadakoh/status/1280153932409581568).  Hasta que se nos prendió el LED e intentamos pedirle a Fibertel que ubique \`la\` --la raíz que tienen en común varios dominios registrados por Njal.la... ¡y tampoco recibimos respuesta!

Así que desde la noche del 16 de julio hasta ahora que escribimos apresuradamente, reportamos que algunos servidores de DNS de Fibertel son incapaces de responder consultas para todos los dominios terminados en \`la\`, incluyendo los de algunas entidades como [Mozilla](https://mzl.la/) y que esto resulta en no poder acceder a la mayoría de los sitios alojados en Sutty.

Mientras ponemos en marcha los planes B a Z que teníamos planificados para estos casos, la reflexión que nos queda es lo frágil y corporativa que es la infraestructura actual de Internet. Dentro del esfuerzo que muchas personas hacemos todos los días para descentralizarla y apropiárnosla, con el objetivo de que sea cada vez más libre e inclusiva, también hay que pelear con problemas que nos generan organizaciones gigantes que tienen el control casi total sobre la infraestructura.

Nos referimos a proveedores de Internet que sobrevenden el ancho de banda disponible y nos lo cobran carísimo, que favorecen a otras empresas como Whatsapp y Mercadopago, proporcionándoles conexiones gratuitas, vulnerando la neutralidad de la red.

> **Necesitamos desmantelar la trama de poder detrás de la conectividad y ser cada vez más poderoses colectivamente frente a estos "servicios" que no nos tienen en cuenta**.

¡Les mantendremos al tanto!  Mientras tanto, pueden acceder a nuestro sitio a través de nuestro dominio alternativo [`https://sutty.ml/`](https://sutty.ml/)` ` y al panel a través de` `[`https://panel.sutty.ml/`](https://panel.sutty.ml/) aunque les pedimos un poco de paciencia para que el resto de los sitios vuelvan a funcionar.

## Los detalles técnicos: Cómo funciona y deja de funcionar DNS

Cuando intentamos a acceder a un sitio web, por ejemplo https://sutty.nl/ lo primero que hace el navegador es tomar el "nombre de dominio" que en este caso es \`sutty.nl\`, dividirlo en sus partes constitutivas y empezar a consultar a los servidores DNS, que son como el directorio telefónico o la agenda común de toda la Internet.  Para que la red DNS encuentre la dirección de \`sutty.nl\`, primero nuestra computadora consulta al proveedor de Internet y si este no sabe, a su vez consulta dónde está \`nl\` a la raíz del DNS, que es un \`.\` tácito.  \`nl\` a su vez responde que la información para \`sutty\` está en \`njal.la\` y entonces el camino empieza de vuelta por \`.\`, pasando por \`la\`, \`njal\` hasta llegar a \`sutty\`.  Lo que nos pasó es que en algún punto de esta camino la información desaparecía y el resultado es que al querer ingresar a `https://sutty.nl/`, no había dirección a dónde llegar, con lo que el sitio no funciona para nada.  Lo mismo pasaba con `https://panel.sutty.nl/` y otros sitios alojados.

Cada uno de estas partes del DNS es controlada por una entidad, a veces la misma, a veces distintas, cada cual con mayor o menor simpatía y compromiso efectivo con la privacidad.  Nosotres preferimos registrar nuestros dominios con [Njalla](https://njal.la/) porque tienen una larga trayectoria de alianza y compromiso contra la censura en Internet <3

## Actualización (20:30)

Nuestro amigo [void](https://void.partidopirata.com.ar) detectó todas las terminaciones de dominio que hasta el momento no funcionan:

> bh fo la vg art baby bar basketball best blog cam ceo college coop design fans feedback forum gay ink love luxury monster observer ooo pid realty reit rent rest rugby storage theatre tickets uno wiki xyz desi bar frl gent saarland zuerich

Nótese la presencia de `.blog` utilizado por la plataforma Wordpress, `.coop` por las cooperativas de todo el mundo…

Nos comentan también que Fibertel estaría al tanto del problema y trabajando para solucionarlo, aunque sin tiempo estimado aun.