---
layout: post
title: Sitios web transportables
author: f@sutty.nl
categories:
  - Jekyll
  - Hacks
  - IPFS
tags:
  - jekyll
  - transportable
  - hack
  - liquid
  - wordpress
  - ipfs
  - web distribuida
content_warning: Términos técnicos sobre desarrollo web
---

Para que un sitio web sea transportable, es decir poder colocar todos
sus archivos en cualquier dominio o cualquier subdirectorio, descargarlo
en nuestras computadoras y que siga funcionando, tiene que cumplir con
una serie de condiciones técnicas.

Por ejemplo, si tenemos nuestro sitio en la dirección
`http://sitio.com/` y lo queremos mover a `https://sitio.com` o
directamente cambiamos de dominio a `https://sitio.org`, el sitio tiene
que seguir funcionando sin modificaciones, apuntando a los recursos
(imágenes, hojas de estilos, etc.) en donde estén.  En algunos casos,
especialmente en sitios Wordpress, el sitio apunta a estos recursos con
su dirección exacta y completa (`https://sitio.com/imagen.png` en lugar
de `/imagen.png` o `imagen.png`) lo que produce que al moverlo de lugar,
los recursos se sigan buscando en la ubicación anterior.  Si la
ubicación anterior deja de estar disponible, el sitio se ve roto (sin
diseño, sin imágenes, sin animaciones, etc.)

Todo esto provoca que tengamos que pensar varias veces antes de cambiar
de ubicación un sitio web y que debamos planificarlo bien.  En el caso
que mencionábamos de Wordpress, hay que utilizar herramientas como
`PHP-Search-Replace-DB` para buscar la ubicación anterior y reemplazarla
por la nueva.  Y así con cada migración.

Desde que la web se está moviendo a ser segura por defecto y muchos
sitios comienzan a adoptar versiones HTTPS, cada vez tenemos que migrar
más sitios.  Y con la aparición de la web distribuida (¡esperemos!),
nuestros sitios tienen que ser transportables y funcionar desde
distintas ubicaciones.

Existen dos estrategias para evitar este problema.  Una son las "URLs
absolutas" y la otra son las "URLs relativas".  Una URL, para explicarlo
rápido, es la dirección desde donde se descarga un recurso web (una
página, una imagen, una hoja de estilos, etc.) y su forma completa es
algo como `https://sitio.org/recurso`.

## URLs absolutas

En el caso de las URLs absolutas, se trata de eliminar la parte de la
URL que indica el protocolo (`http://` o `https://`, pero puede haber
otros mucho menos usados), usuaria y contraseña (`usuaria@contraseña:`),
si el sitio necesita autenticación, el dominio (`sitio.org`) y el puerto
(`:8000` a continuación del dominio, aunque se infiere del protocolo,
`80` para `http` y `443` para `https`).  Aunque por lo general, en una
URL solo vemos el protocolo y el dominio en la forma
`https://sitio.org`.

Con las URLs absolutas, entonces, los recursos internos al sitio ya no
se vinculan con `https://sitio.org/recurso.png` y pasan a vincularse por
`/recurso.png`, es decir empiezan a llamarse desde la raíz o `/`, el
comienzo del sitio.

Las `/` son separadores de directorios ("carpetas"), entonces si vemos
una URL `/directorio/subdirectorio/recursos.png`, quiere decir que en la
raíz (la primera `/`) del sitio, hay un directorio/carpeta llamado
`directorio` y dentro otro directorio llamado `subdirectorio`.  Dentro
de este último deberíamos encontrar un archivo llamado `recurso.png`.
Si alguna de estas partes no existe, el servidor web dará un error 404 y
la página se verá rota.

La ventaja de esto es que a partir de ahora podemos mover el sitio de
`http://sitio.com` a `https://otrositio.org` sin que la ubicación de los
recursos se vea afectada, porque los navegadores agregan automáticamente
el protocolo y dominio en las URLs que no lo tienen.

La desventaja es que el sitio solo funciona con un servidor web y solo a
partir de la raíz (la primera `/`), es decir que no puede verse desde un
subdirectorio (moverlo de `http://sitio.com` a
`https://otrositio.org/sitio` por ejemplo), porque los recursos van a
ser buscados siempre en la raíz.

Esto hace imposible permitir la descarga del sitio para navegarlo
localmente, o que en un caso de censura o DDOS otra gente se puede
solidarizar subiendo copias de nuestro sitio al suyo.  En el caso de la
web distribuida, al menos con IPFS, los sitios van a estar ubicados
dentro de un "subdirectorio" cuyo nombre cambia por cada vez que se
modifica el sitio.  Todo esto hace que podamos independizar el sitio de
un dominio específico, pero aun no evita la dependencia de un servidor
web.

## URLs relativas

Para que un sitio sea realmente transportable y su conjunto de archivos
pueda moverse por toda la web sin romperse, tenemos que usar URLs
relativas.

Estas URLs, además del protocolo y dominio, eliminan la raíz del sitio.
Esto hace que los recursos en lugar de ser absolutos a la ubicación del
sitio (los recursos se buscan siempre a partir de la raíz), sean
relativos a la página actual (que también es un recurso).  Si estamos
navegando la página `https://otrositio.org/subdirectorio/pagina.html` y
esta vincula a una imagen `imagenes/imagen.png`, la URL de la imagen
será completada por el navegador a
`https://otrositio.org/subdirectorio/imagenes/imagen.png`.  Si lo
estuviéramos viendo con un navegador de archivos, tendríamos un
directorio/carpeta llamado `subdirectorio` y dentro otro llamado
`imagenes` junto a un archivo `pagina.html`.  Dentro del directorio
`imagenes` habrá un archivo `imagen.png`.

Las estructuras de directorios se suelen representar en árboles, donde
cada nivel representa archivos y directorios dentro del mismo directorio
superior.  En nuestro caso, el árbol del sitio sería:

```
/
  subdirectorio/
    imagenes/
      imagen.png
    pagina.html
```

Así visualizamos que `imagenes ` y `pagina.html` están en el mismo
nivel, mientras que `imagen.png` está un nivel más abajo, dentro de
`imagenes`.  En el caso de las URLs absolutas, la ubicación sería
`/subdirectorio/imagenes/imagen.png`.

Las URLs relativas pueden ser más complejas para referirnos a un recurso
que se encuentre en niveles anteriores, usamos `..` acompañados de una
`/` por cada nivel.  Por ejemplo, si desde `pagina.html` necesitamos el
recurso `hoja_de_estilos.css` ubicado en la raíz, lo llamaríamos por
`../hoja_de_estilos.css`, porque se encuentra en un nivel anterior y al
mismo que `subdirectorio`.  Si usáramos URLs absolutas, vincularíamos
por `/hoja_de_estilos.css`.

```
/
  hoja_de_estilos.css
  subdirectorio/
    imagenes/
      imagen.png
    pagina.html
```

Otro ejemplo es cuando queremos vincular a un recurso que está en otro
directorio, es decir tenemos que bajar hasta el nivel común y luego
subir.  Para llamar al recurso absoluto `/otro/recurso.jpg` desde
`pagina.html`, usaríamos la URL relativa `../otro/recurso.jpg`.

Con las URLs relativas, cada página web tiene que saber dónde está
ubicada para poder encontrar los recursos necesarios.  Esto hace que su
implementación sea más compleja y por lo general se prefieran las URLs
absolutas.  Pero como su ventaja principal es que podemos mover toda la
raíz del sitio a un subdirectorio y que todo siga funcionando, creemos
que vale la pena.

```
/
  sitio
    hoja_de_estilos.css
    subdirectorio/
      imagenes/
        imagen.png
      pagina.html
```

Por ejemplo, ahora creamos un directorio `sitio` en la raíz y movimos
todos los archivos dentro suyo.  La URL absoluta
`/subdirectorio/imagenes/imagen.png` dejó de funcionar porque ahora es
`/sitio/subdirectorio/imagenes/imagen.png`.  Sin embargo la URL relativa
`imagenes/imagen.png` se mantuvo igual, porque es independiente de la
raíz.  Lo mismo para `../hoja_de_estilos.css`.

## Jekyll

No todos los generadores de sitios, tanto estáticos como dinámicos, son
capaces de soportar URLs relativas.  Jekyll, nuestro generador de sitios
estáticos preferido, es uno de los que no.

Una respuesta ha sido la de Rico Sta. Cruz, en su artículo [_Relative
paths in Jekyll_](https://ricostacruz.com/til/relative-paths-in-jekyll)
donde sugiere un pedacito de código en formato Liquid (el de las
plantillas de Jekyll) que es capaz de obtener la URL relativa al recurso
actual.

```liquid
{% assign base = '' %}
{% assign depth = page.url | split: '/' | size | minus: 1 %}
{% if    depth <= 1 %}{% assign base = '.' %}
{% elsif depth == 2 %}{% assign base = '..' %}
{% elsif depth == 3 %}{% assign base = '../..' %}
{% elsif depth == 4 %}{% assign base = '../../..' %}{% endif %}
```

Luego la variable `base` puede usarse adelante de cada URL para volverla
relativa.  Sin embargo esta propuesta tiene dos problemas.  Por un lado,
tiene un límite de niveles, por lo que si tuviéramos más, tendríamos que
agregarlos.  En términos tecno-estéticos, podría ser considerada poco
"elegante".  El segundo problema es que implica modificar todas las
plantillas de Jekyll para prefijar cualquier URL con la variable `base`.

Contraproponemos una versión que encuentra la posición relativa
dinámicamente e involucra menos cambios en nuestras plantillas.

```liquid
<!DOCTYPE html>
<html>
  <head>
{% assign base = '' %}
{% assign depth = page.url | split: '/' %}
{% for dots in depth offset: 1 %}
  {% assign base = base | append: '../' %}
{% endfor %}
    <base href="{{ base }}" />
  </head>
</html>
```

El código en sí es lo escrito dentro del tag HTML `<head>`, que se
encuentra solo para saber su ubicación en el código de la plantilla.  Es
decir, hay que colocarlo una sola vez.

Lo que hace es decidir en base a la cantidad de `/` en la URL actual la
cantidad de niveles hasta la raíz y agregar los `..` correspondientes.
Luego, aprovechando la etiqueta `<base>` de HTML, le indica a los
navegadores que todas las URLs relativas van a estar referidas a esa
URL.  Lo que hace internamente el navegador es prefijar las URLs
relativas con la URL provista en `<base>`.[^base]

[^base]: [Aquí está la documentación para la etiqueta
`<base>`](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base).
Vinculamos a la versión en inglés porque la documentación en castellano
está desactualizada.

Luego, en nuestra plantillas, eliminamos la primera `/` de todas las
URLs.  En el caso de los recursos, solo eliminamos la `/` al principio.
En el caso de las URLs de los posts, que suelen llamarse con el código
Liquid `{{ post.url }}`, usamos el filtro `remove_first`:

```liquid
<a href="{{ post.url | remove_first: '/' }}">{{ post.title }}</a>
```

Este código genera una URL relativa a un post en particular.

Si nuestra plantilla usa la variable `baseurl` en la configuración,
también quitamos la `/` del principio.  Lo mismo cuando vinculamos
imágenes y otros recursos en los artículos Markdown y en otros recursos
como CSS y JS.

## A tener en cuenta

Las soluciones elegantes no siempre aplican a todos los casos.  Algunas
cosas a tener en cuenta que nos pueden dificultar el desarrollo del
sitio:

* Si vamos a usar links `#id` para saltar de un elemento a otro dentro
  de la misma página, por ejemplo en una tabla de contenido para ir a un
  subtítulo, el link tiene que incluir la URL de la página actual, de lo
  contrario el navegador lo autocompleta a la URL relativa y nos va a
  llevar a cualquier lado.

  ```html
  <a href="#menu">Ir al menú</a>
  ```

  Este link en lugar de llevarnos al menú sin cambiar de página, nos
  puede llevar al elemento con `id` "menu" en la página principal.

  ```html
  <a href="pagina.html#menu">Ir al menú</a>
  ```

  Este link es correcto y nos va a llevar al menú en la página actual.
  Sin embargo, va a forzar la recarga de la página en lugar de dar un
  salto.

  [Hay formas de imitar este comportamiento utilizando
  JavaScript](https://stackoverflow.com/questions/8108836/make-anchor-links-refer-to-the-current-page-when-using-base).

* Al parecer, Internet Explorer no soporta URLs relativas en la etiqueta
  `<base>`, con lo que si esperamos visitantes utilizando esos
  navegadores, el sitio no les va a funcionar correctamente.  En este
  sentido recomendamos una no-solución en la forma de un boicot activo
  contra Internet Explorer, ya que es uno de los navegadores que menos
  respeta los estándares web a la vez que es el más inseguro.  Este
  boicot puede darse usando una condición específica para Internet
  Explorer que invite a lxs visitantes a instalar Mozilla Firefox.

* Si usamos las etiquetas especiales [OpenGraph](http://ogp.me) y
  [Twitter
  Cards](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started)
  para proveer meta-información, todavía tenemos que utilizar URLs
  completas (con protocolo y dominio) para referirnos al sitio.  En el
  caso de Jekyll, esto se logra definiendo la URL base en una variable
  de la configuración `_config.yml` y utilizándola en las etiquetas
  necesarias.

Si estos puntos no nos convencen, todavía podemos usar la definición de
la variable Liquid `base` que proponemos, descartando la etiqueta
`<base>` y prefijando todas las URLs con `{{base}}` según la propuesta
de Rico Sta. Cruz.
