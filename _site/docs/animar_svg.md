[Documentación en
MDN](https://developer.mozilla.org/en-US/docs/Web/SVG/Element/animate)

Para animar un SVG hay que generar un SVG con la posición inicial y uno
con la posición final y guardarlos en dos archivos separados.  En
Inkscape hay que elegir la opción SVG plano.

Luego, con `svgo` optimizar los archivos:

```bash
./node_modules/.bin/svgo assets/images/sutty.svg
./node_modules/.bin/svgo assets/images/sutty_final.svg
```

Abrir los dos archivos en un editor de texto y convertir los elementos a
animar en etiquetas con contenido.  Es decir si terminan en `/>`,
eliminar la `/` y cerrarlo con la misma etiqueta.

Por ejemplo:

```svg
<path />
<!-- Convertir en -->
<path></path>
```

Para que puedan colocarse las etiquetas `<animate>` dentro.

```svg
<path>
  <animate />
</path>
```

Luego, cada `<path>` tiene un atributo `d` que va a cambiar entre la
posición inicial y la final, entonces configuramos la animación para que
empiecen con uno y terminen con otro, copiando los valores desde los
archivos.

```svg
<!-- Trabajamos en el archivo que contiene la posición inicial -->
<path d="...">
  <animate attributeType="XML" attributeName="d"
    from="copiar desde este mismo archivo"
    to="copiar desde la posición final" dur="3s" fill="freeze"/>
</path>
```

`fill="freeze"` indica que cuando termina la animación hay que mantener
la posición final en lugar de volver a la inicial.  `dur="3s"` indica 3
segundos de duración.
