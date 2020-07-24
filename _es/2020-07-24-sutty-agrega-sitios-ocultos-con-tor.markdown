---
title: Sutty agrega sitios ocultos con Tor
description: 'Nos sumamos a la campaña #MoreOnionsPorFavor de la red Tor para contribuir
  con la web anónima.'
image:
  description: ''
order: 17
layout: post
uuid: 122d39f7-420f-4556-aa07-6a43a76a92a6
liquid: false
usuaries:
- 5
---



La red Tor es reconocida por permitir la navegación anónima de la Web. Puede usarse a través de su [navegador Tor](https://www.torproject.org/es/download/) para acceder a sitios web sin que se pueda detectar nuestra ubicación física y al mismo tiempo nos protege de otras técnicas de identificación y rastreo que atentan contra nuestro derecho al anonimato, a la privacidad y a [así como la posibilidad de elegir qué hacer con nuestros datos](https://utopia.partidopirata.com.ar/zines/salarios_por_facebook.html).

Después de todo, no todos los servicios a los que accedemos cotidianamente adoptan [políticas de privacidad](https://docutopia.tupale.co/) consecuentes con estos derechos y los proveedores de Internet y otros intermediarios son capaces de saber qué sitios visitamos, aun cuando hacemos todo lo posible para que no suceda.

Quienes alojamos sitios podemos facilitar esta navegación anónima alojándolos dentro de la red Tor, de forma que se reduzcan al mínimo las chances de exponernos. Esto se logra utilizando direcciones web sólo disponibles a través de Tor, llamadas *hidden services* (“servicios ocultos”) o más comúnmente *onions* (“cebollas”).

Durante el mes de Julio, el proyecto Tor ha lanzado la campaña “[Más onions por favor](https://blog.torproject.org/more-onions-porfavor)” para promover la adopción de este tipo de direcciones.

**A partir de hoy, todos los sitios alojados en Sutty pueden usar la opción *Alojar como servicio oculto en Tor* en su configuración para activar esta alternativa anónima de alojamiento.**

Esto permite que les visitantes que lleguen a un sitio utilizando el navegador Tor, tengan la opción de cambiarse automáticamente a la dirección alternativa y a partir de ese momento solo acceder a nuestros sitios a través de ella.

> **¡Atención!** Esta “onionizacion” no anonimiza a les autores del sitio o la identificación de su alojamiento en Sutty. Pueden recurrir a otras estrategias para mantener el anonimato de les autores, como valerse de una dirección de correo anónima al registrarse. Solo requerimos que cumplan con nuestros [términos de servicio](https://docutopia.tupale.co/) y [código de convivencia](https://docutopia.tupale.co/) ;)

## **Cómo lo logramos**

En una jornada de *hackeo* colectivo de casi 9 horas, agregamos la capacidad al panel de Sutty para activar y desactivar la opción de obtener direcciones `.onion`, incorporamos [Tor a nuestra infraestructura](https://0xacab.org/sutty/containers/tor/) y desarrollamos un [complemento para Jekyll](https://0xacab.org/sutty/jekyll/jekyll-onion-location/) que permite anunciar la dirección alternativa.

Como siempre, todo lo que desarrollamos es software libre y antifascista.

> Si aprecian nuestro trabajo, les invitamos a ayudarnos a sostenerlo haciendo un [aporte a voluntad](https://donaciones.sutty.nl/) o [contratándonos para desarrollar un proyecto](https://docutopia.tupale.co/). También podemos convertir un sitio existente, con diseño y contenido, agregándole seguridad, velocidad y todas las características de Sutty :)

## **Qué falta**

Los sitios todavía **no** pueden publicarse **únicamente** dentro de la red Tor. Para esto necesitamos modificar algunos complementos asociados que anuncian la dirección pública del sitio y otra información que podría indicar en dónde está alojado. Por supuesto, ¡esto no afecta los niveles de privacidad actuales de Sutty!

## **Usando onions**

Cuando abran su sitio de Sutty en el navegador Tor, a partir de ahora les aparecerá una ventana invitándoles a *probar los servicios onion*: *Hay una versión más privada y segura de este sitio disponible sobre la red Tor vía servicios onion. Los servicios Onion ayudan a les publicadores de sitios web y sus visitantes a vencer la vigilancia y la censura*. Podrán elegir *Siempre priorizar Onions* y serán redirigides a la versión Onion del sitio (y posiblemente a configurar las Preferencias de navegación). También pueden *leer más* en el sitio de Tor.

Notarán que pueden navegar por la misma versión del sitio sin recurrir al onion, desde Tor. Entonces, ¿qué cambia?

* Los servicios Onion pueden ser accedidos **únicamente** a través de Tor.

* La ubicación y la dirección IP de los Onion están ocultos. Los sitios en Sutty van a seguir siendo accesibles a través de su dirección pública (por ej: [https://misitio.sutty.nl](https://misitio.sutty.nl/)), a través de cualquier navegador.

* El tráfico entre les usuaries de Tor y los Onions está cifrado punta a punta, independientemente de si se usa o no HTTPS (¡en Sutty usamos!).

* Las direcciones onion se generan automáticamente. Esto evita ataques como “de máquina en el medio”, es decir que una dirección se haga pasar por otra para redireccionar las visitas.

* ¿Aumenta la seguridad/ cuidados digitales? Sí.

* ¿Podremos publicar sitios totalmente anónimos? Por ahora, no. Esperamos poder ofrecerlo próximamente. Sí cuentan con la opción de difundir únicamente la dirección onion de su sitio. Pero es importante considerar que Sutty utiliza otras herramientas para que el sitio esté indexable y posicione alto (esté más visible) en buscadores.

* ¿Por qué nos cuentan que podemos crear sitios onion? En Sutty, nos comprometemos con el desarrollo, sostenimiento y activismo por una Internet libre, accesible, antifascista, que sirva como una verdadera red de pares. Este es otro paso que damos en esa dirección y nos gusta poder compartirlo :)