---
title: Presentación de Sutty
author:
- f@sutty.nl
image:
  description: ''
draft: '<span class="translation_missing" title="translation missing: es.posts.submit.save_draft">Save
  Draft</span>'
layout: post
liquid: false
---



## Introducción

Cuando queremos tener nuestro propio sitio solemos recurrir a gestores
de contenido, como Wordpress y Drupal, dos de los gestores libres más
utilizados.  El gestor de contenido es el software que nos permite
editar el contenido del sitio, su estructura y diseño.  Por cada visita,
toman estas distintas partes y las combinan para generar una página web.

Sin embargo, para lograrlo requieren de varias piezas de software, como
bases de datos, servidores web e intérpretes de lenguaje, que deben
funcionar correctamente durante cada visita.  Esto los hace dinámicos.
Un pequeño cambio en alguna de las partes provoca una actualización
inmediata en todo el sitio.  Pero si una parte falla, el sitio deja de
estar disponible.

Además, deben mantenerse actualizados, ya que al ser software
funcionando en una computadora, una vulnerabilidad puede permitir a los
atacantes acceso al sitio, tanto como para extraer información como para
modificarla.  Las vulnerabilidades se resuelven con actualizaciones
constantes, aunque no todas las vulnerabilidades son solucionadas o
solucionables.

El correr en una computadora generando páginas web a demanda utiliza
recursos, como capacidad de procesamiento o utilización de memoria.
Esto implica que a más visitas hay cada vez más costos monetarios y/o
partes móviles como cachés, por un lado, pero también y de forma
invisible, un costo ecológico cada vez más alto, debido a que el uso de
recursos informáticos redunda en consumo de energía y emisión de calor.

Decimos que todo este proceso es invisible porque todos estos procesos
se dan en computadoras, pero de otras entidades.  Estas computadoras
invisibles se encuentran apiladas en galpones gigantescos, enfriadas
constantemente con aires acondicionados.  Es una práctica común que las
partes de estas computadoras se cambien no cuando fallan, sino cuando su
garantía vence, aun cuando no están demostrando fallas físicas.

Todo esto contribuye a una escalada de explotación humana, consumo
energético, extracción de recursos, basura electrónica y obsolecencia
programada.

## Todas las vulnerabilidades son políticas

Las vulnerabilidades, los cuellos de botella, el acceso a mayores
recursos o menos recursos tienen usos políticos que nos exponen
colectivamente.  Habilitan, aun sin quererlo, violencias, censura e
invisibilización en la forma de ataques de _defacing_[^defacing],
DDOS[^ddos], _doxxing_[^doxxing] y otros.

[^defacing]: Es decir, ingresar a un sitio y cambiarlo para que diga
  otra cosa.

[^ddos]: Los (D)DOS o denegación (distribuida) de servicio son ataques
  que apuntan a agotar los recursos de un sitio ya sea por su masividad
  o por amplificación, insumiendo un costo mucho menor a los atacantes.

[^doxxing]: El _doxxing_ es un ataque de amedrentamiento más social que
  técnico e implica la publicación de datos privados como dirección,
  números de teléfono, nombres de familiares, etc. con el objetivo de
  incitar a otros a participar del acoso.

Creemos en un ciberespacio libre de violencias y eso implica que lo
podamos habitar sin ser acosadxs ni acalladxs.  Las vulnerabilidades de
software redundan muchas veces en violencias hacia nosotrxs.

## Sitios estáticos, seguros, ecológicos y justos

Los sitios dinámicos no son la única posibilidad que tenemos para
publicar sitios web de forma más segura y ecológica.  Los sitios
estáticos también son capaces de mezclar contenido, estructura y diseño,
pero a diferencia de los dinámicos, este proceso se hace por única vez.
En lugar de generar una página por cada visita, todas las páginas que
componen el sitio se generan de una sola vez, ahorrando el consumo de
recursos.  Si hay un cambio, el sitio se vuelve a generar.  Aunque
parezca extraño, este proceso suele tomar algunos segundos.

Las ventajas de esta estrategia técnica son que el sitio se independiza
del software y puede funcionar en cualquier momento y en cualquier
lugar.  Los sitios estáticos también son transportables.  Al no
necesitar software para ser visualizado, son invulnerables a la mayoría
de los ataques más comunes a sitios web[^invulnerabilidad] y son más
veloces, porque el trabajo ya se hizo una vez.

[^invulnerabilidad]: No estamos contando otras vulnerabilidades
  posibles, como las de la computadora en sí, aunque generalmente más
  dificultosas.

Además, los consideramos más ecológicos y justos porque al consumir
menos recursos, contribuyen mucho menos a la explotación de recursos
naturales y de trabajadorxs, principalmente en África y Asia.  Incluso
hay colectivxs alojando [sus sitios en microservidores alimentados por
paneles
solares](https://solar.lowtechmagazine.com/2018/09/how-to-build-a-lowtech-website/).

Otra ventaja es que los sitios estáticos no suelen ocultar las
complejidades técnicas detrás de interfaces bonitas y pretendidamente
más simples de utilizar.  Nos empoderan como usuarixs obligándonos a
tomar contacto con la tecnología en sí y aprendemos de HTML, CSS,
lenguajes de programación, librerías y largos etc., a través de
herramientas simples en lugar de infraestructuras complejas.

Entendemos, claro, que esto último no puede ser deseable para todo el
mundo y por eso proponemos Sutty como la intersección entre sitios
estáticos seguros, justos, ecológicos y la inmediatez de uso de los
gestores de contenido más hegemónicos.

## Sutty

Sutty es una gestora de contenidos que aprovecha la madurez
técnica de uno de los generadores de sitios estáticos más utilizados,
llamado Jekyll.

La llamamos Sutty porque queríamos jugar con el costado literario de
Jekyll y a la vez recuperar y visibilizar otras perspectivas y otros
cuerpos.  Sutty es, pues, el nombre de una antropóloga interestelar,
lesbiana e india, del universo de ciencia ficción narrado por Ursula K.
Le Guin.

En cuanto a lo técnico, Sutty permite editar contenidos y publicarlos a
través de Jekyll.  Al ser dos proyectos corriendo en paralelo, es
posible modificar el sitio a través ambos a la vez, e incluso
independizarlo de Sutty.  Creemos que esto permite que nos apropiemos de
la propuesta de los sitios estáticos, sin ocultar complejidades ni
desempoderarnos como usuarixs.

Nuestra apuesta es reducir la dependencia en infraestructuras ajenas y
promover una web más justa y distribuida.  Por eso, cuando se genera un
sitio a través de Sutty, podrá ser publicado en cualquier plataforma.

Nuestra apuesta es ética y política.  Queremos que Sutty sea una
herramienta de difusión para nuestrxs colectivxs y campañas.  No se
trata de un servicio en la nube que se pretende políticamente neutro, al
mismo tiempo que habilita el auge del fascismo.
