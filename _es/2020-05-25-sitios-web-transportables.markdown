---
breaks: false
draft: true
layout: post
title: ¿Por qué los sitios web deben ser transportables?
author:
- Sutty
description: Es importante que podamos mover nuestros sitios web a cualquier lado para lograr resiliencia
categories:
- FAQ
tags:
- jekyll
- transportable
- hack
- liquid
- wordpress
- ipfs
- web distribuida
liquid: false
---

## Introducción

¿Qué es un sitio web "resiliente"? ¿Cómo se construye una página web
que resista eventualidades, ataques, sobrecargas y proteja nuestro
trabajo?  Una característica que lo asegura es la transportabilidad.
Es decir, que ante cualquier eventualidad, el sitio pueda moverse de un
lado a otro con un mínimo de esfuerzo.

Es muy recurrente en nuestro trabajo encontrarnos con situaciones donde
el sitio dejó de estar disponible porque el alojamiento no fue pagado
a tiempo, o una actualización no es compatible con nuestra
configuración.  O el alojamiento suspende el sitio porque superó los
límites de visitas del sitio, por un pico en el interés o por un ataque
concertado ("DDOS" por denegación distribuida de servicio, en inglés).

También se dan situaciones planificadas, que de todas formas dejan al
sitio  fuera de juego por un tiempo. Puede suceder que cambiemos de
nombre de dominio o habilitemos el protocolo HTTPS en nuestros sitios.
(Proceso que recomendamos especialmente, para proteger la integridad de
nuestro sitio y la privacidad de nuestres visitantes.)

Estos cambios en la estructura de un sitio deben estar bien pensadas,
porque afectan el tiempo que pasamos fuera de circulación.  Son sucesos
que en definitiva se hacen con cierta urgencia y tensión y que nos
desgastan.

Por estas experiencias, desde Sutty tomamos la decisión muy temprana de
que todos los sitios sean transportables.  Es decir: tomar todos los
archivos de un sitio y copiarlos a otro lugar debería ser lo más simple
posible y no requerir ningún cambio o adaptación al sitio tal y como
está.

Esto habilita otras estrategias sumamente interesantes y que también
tienen que ver con la resiliencia de un sitio.  Cuando un sitio es
transportable, es posible archivarlo para resguardar la memoria
histórica, teniendo a disposición distintas versiones.  También es
posible activar estrategias contra la censura, como las que aplicaron
_Wikileaks_ y _The Pirate Bay_ en sus momentos de mayor persecución:
pusieron a disposición copias de sus sitios para que fueran alojadas
copias por toda la Internet, en solidaridad.  Se nos ocurren otras, como
poder descargarse los sitios y llevarlos en una memoria portátil a zonas
donde no haya acceso a Internet, o alojar el sitio en infraestructuras
distribuidas, como [IPFS](https://ipfs.io/) (en inglés).

Para poder lograr esto, tuvimos que hacer algunos cambios en cómo se
estructuran internamente los sitios y cómo se vinculan las distintas
páginas entre sí.

## Cómo funcionan las direcciones web

> **Aviso:** La propuesta de Sutty es comunicar los aspectos técnicos
> para poder habilitar su apropiación.  Por eso no los ocultamos, sino
> que tratamos de clarificarlos, lo que no siempre es inmediato.  Si
> algo no se entiende, por favor [contactanos](index.html#contacto) :)

Un sitio web está compuesto de páginas web que representan las distintas
partes del sitio.  Cada página representa un artículo, por ejemplo, como
si fuera un libro o revista.  Luego hay otros recursos, como imágenes,
videos y otros archivos relacionados, donde se definen el estilo de la
página (colores, tipografía, etc.) y comportamientos específicos.

En los sitios generados por Sutty, todas estos recursos se almacenan en
un directorio (nombre técnico de una carpeta).  Esta estructura o árbol
de archivos y sub-directorios se corresponde con la estructura de
direcciones ("URLs", _links_, vínculos) del sitio al que accedemos
a través de un navegador.

Por ejemplo, a la dirección web
<https://sutty.nl/politica-de-privacidad/> le corresponde un archivo
llamado `index.html` (este nombre es tácito en la dirección) dentro de
un directorio llamado `politica-de-privacidad`.  Su ubicación completa
es `politica-de-privacidad/index.html`, porque las partes de una
ubicación se unen con `/`.  En Windows, las direcciones se unen con `\`,
pero en web siempre es `/`.

Esta dirección de ejemplo no tiene imágenes, pero tiene una hoja de
estilos ("CSS") que define el diseño de la página y en este caso está
ubicada en `assets/css/styles.css`.

Si lo representáramos en un árbol, sería así.

```
sutty.nl/
├── assets
│   └── css
│       └── styles.css
└── politica-de-privacidad
    └── index.html
```

Para que un sitio web sea transportable, tenemos que poder copiar este
directorio `sutty.nl` con todos sus archivos y que el sitio siga
funcionando correctamente, es decir que la política de privacidad pueda
encontrar su hoja de estilos, sin importar la ubicación donde lo
guardemos.  Si colocamos el sitio en `C:\Users\sutty\copia de
seguridad\sutty.nl` tiene que funcionar lo mismo que si lo publicamos en
web en <https://sutty.neocities.org/> o en
<https://solidaridadweb.org/sitios/sutty/> (esta última es de ejemplo,
¡pero la anterior funciona!).

## Direcciones absolutas y relativas

Existen distintas formas de vincular archivos entre sí, en nuestro caso,
que la política de privacidad vincule a su hoja de estilos.  Estas
diferentes formas tienen distintos nombres y nos simplifican
o dificultan la tarea de transportar un sitio.

A veces, las plataformas de publicación usan las direcciones completas
de los distintos recursos.  Por ejemplo, para que la política de
privacidad vincule a su hoja de estilos, usa la dirección
<https://sutty.nl/assets/css/styles.css>.  Pero si cambiara alguno de
los elementos de esta dirección, el archivo `styles.css` ya no podría
ser encontrado.

Esto pasa bastante si estamos agregando soporte para HTTPS a nuestro
sitio, porque la dirección cambió de
<http://sutty.nl/assets/css/styles.css> (sin "s")
a <https://sutty.nl/assets/css/styles.css> (con "s").  También si
cambiáramos nuestro dominio de `sutty.nl` a `sutty.neocities.org`,
o copiáramos el sitio dentro otro como en
<https://solidaridadweb.org/sitios/sutty/assets/css/styles.css>.

Esta dirección es muy precisa, con lo que cualquier cambio de ubicación
del sitio implica que debemos readecuar todas las direcciones dentro del
sitio, que pueden ser pocas o montones, siempre con un grado de error.
Hay programas que lo hacen también.

Todo esto provoca que tengamos que pensar varias veces antes de cambiar
de ubicación un sitio web y que debamos planificarlo bien.

Hay dos estrategias posibles para poder cambiar la primera parte de la
dirección (`https://sutty.nl`) sin "romper" el sitio.

### Direcciones absolutas

En el caso de las URLs absolutas, se trata de eliminar la parte de la
dirección que indican el protocolo (`http://` o `https://`) y el dominio
(`sutty.nl`).  Hay otros componentes, aunque por lo general solo vemos
estos dos.

Las direcciones absolutas indican la ubicación de los archivos a partir
de la carpeta donde están guardados, representados por la primera `/`
(la "raíz" del árbol).

En nuestro ejemplo entonces, la hoja de estilos estaría vinculada a la
dirección `/assets/css/styles.css` en lugar de
<https://sutty.nl/assets/css/styles.css>.  Es decir, le removimos la
dirección web.

De esta forma, es posible cambiar de HTTP a HTTPS o de `sutty.nl`
a `solidaridadweb.org` sin realizar cambios en los archivos del
sitio. Como la dirección ignora la ubicación web, podemos mover los
archivos entre distintas ubicaciones sin preocuparnos por hacer cambios.

Sin embargo, el sitio solo funciona correctamente si lo movemos de una
ubicación web a otra manteniendo el mismo nivel de ubicación.  Si
copiáramos el sitio a <https://solidaridadweb.org/sitios/sutty/>, la
raíz de los archivos está en `/sitios/sutty/`, pero la ubicación la
sigue buscando en `/assets/css/styles.css`.  Si el sitio
`solidaridadweb.org` no tiene un archivo en esa ubicación, las políticas
de privacidad de Sutty no van a tener diseño --y si hubiera un archivo,
¡tendría el diseño equivocado!

Y aun así, todavía no podemos descargarnos el sitio a nuestra
computadora y navegarlo.


### Direcciones relativas

Para que un sitio sea realmente transportable y su conjunto de archivos
pueda moverse por toda la web sin romperse, tenemos que usar direcciones
relativas.

Estas direcciones no tienen una raíz absoluta.  Los archivos se vinculan
entre sí por su ubicación actual en un árbol de directorios que
desconocen.  De esta forma, el archivo
`politicas-de-privacidad/index.html` vincula
a `../assets/css/styles.css`.  Los `..` representan el directorio
anterior, sin importar su nombre y se pueden combinar para moverse
varios niveles hacia atrás --`../../../../`.

Esta forma es un poco más compleja, pero nos da flexibilidad a la hora
de transportar un sitio.  Podemos guardar los archivos en
<https://sutty.nl>, <https://sutty.neocities.org>,
<https://solidaridadweb.org/sitios/sutty> o `C:\Users\sutty`
o `/home/alguien/sitios/copias/sutty` y el sitio va a seguir
funcionando.

Esta estrategia es muy importante para la característica que estábamos
buscando porque nos permite copiar el sitio de un lugar a otro sin
hacerle modificaciones.


## Cómo lo logramos

Decíamos que es muy importante pero también agrega complejidad, porque
cada archivo tiene que saber dónde están ubicados los otros archivos en
relación a sí mismo.

En el desarrollo de esta característica llevamos a cabo un aprendizaje
sobre distintas tecnologías/posibilidades web que estaban cayendo en
desuso.

En principio, no todos los generadores de sitios, tanto estáticos como
dinámicos, son capaces de generar ubicaciones relativas.  Jekyll, el
motor de Sutty, se cuenta entre los que no, pero es posible indicarle
cómo hacerlo.

Una respuesta ha sido la de Rico Sta. Cruz, en su artículo [_Relative
paths in Jekyll_](https://ricostacruz.com/til/relative-paths-in-jekyll)
("Ubicaciones relativas en Jekyll") donde sugiere un código que es capaz
de obtener la ubicación relativa a la página actual.

Sin embargo, este código tiene sus limitaciones, porque hay que
expandirlo a la cantidad de niveles necesarios para un sitio --que nunca
sabemos cuáles van a ser.  Además, implica readaptar todas las
plantillas para poder usar este esquema --un trabajo engorroso, aunque
menor que adaptar todo un sitio.

La propuesta de Rico Sta. Cruz nos dio la inspiración para desarrollar
nuestro propio complemento, que encuentra la ubicación relativa de forma
automática y flexible, sin que le tengamos que indicar manualmente la
ubicación, con cambios mínimos a las plantillas, que podrían ser
automatizables también.

Logramos esto aprovechando un atributo de las páginas web llamado
`<base>` ([documentación en Mozilla Web
Docs](https://developer.mozilla.org/es/docs/Web/HTML/Elemento/base),
aunque la versión en [inglés es más
completa](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/base)),
que indica la ubicación relativa base para todos los archivos vinculados
al documento actual.  Con esto, solo necesitamos calcular la distancia
del archivo hasta la carpeta raíz e intercambiarlos por los `..`
necesarios.

Otra cosa que necesitábamos cambiar es que las direcciones generadas por
Jekyll ya no fueran absolutas.  Esto fue solo complementar el código de
Jekyll para remover la `/` inicial de todas las direcciones.

Estos dos simples cambios nos permiten generar sitios que se pueden
transportar sin modificaciones, cumpliendo con nuestro primer objetivo.

## El complemento

En Sutty trabajamos constantemente con software libre y nuestro
compromiso es [liberar todo el software que
escribamos](https://0xacab.org/sutty/). Este aprendizaje que hicimos
quedó plasmado en un complemento que llamamos
[jekyll-relative-urls](https://rubygems.org/gems/jekyll-relative-urls)
que cualquier sitio utilizando Jekyll puede instalar y utilizar, aun
cuando no se aloje en Sutty.

