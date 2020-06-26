---
title: Repercusiones sobre la Aplicación Cuid.Ar en Argentina
description: 'Aplicación Cuid.Ar: ¿qué sabemos? ¿qué tendríamos que saber?'
image:
description: ''
order: 10
layout: post
uuid: 47901a37-3bac-456a-bf1e-6cc6765eacff
liquid: false
usuaries:
- 5
---

## CUID.AR

La última semana observamos cómo, después del anuncio de Alberto Fernández el viernes a la noche, se desplegaron, en diferentes medios masivos de comunicación, blogs y otras redes sociales, una serie de artículos y publicaciones sobre la función e implicaciones, tanto en materia de seguridad digital, vigilancia ciudadana y otros posibles impactos sociales, de la aplicación del gobierno CuidAR. En este marco, se publicó información especulativa que fue luego circulada como verdadera.

Nuestra idea del empoderamiento tecnológico se basa en problematizar y volver accesibles algunas de las tecnologías que nos rodean. Entendemos, además, la potencia que tiene el miedo como tecnología de gestión.

En base a esto, decidimos revisar y compartir este texto en el que narramos nuestras conclusiones y perspectivas.

Remarcamos que tenemos acceso a información limitada. En tanto el código fuente no esté publicado, no podemos analizar exactamente qué _hace_ la app. Como fuentes, utilizamos los términos y condiciones de la aplicación (solamente disponibles al descargarla) y nuestra propia experiencia como usuaries al probarla. En base a esto y a una lectura de varias fuentes secundarias (las publicaciones que mencionáramos), exponemos lo siguiente.

## ¿Qué dice hacer la aplicación de CuidAR?

**Actualmente tiene las siguientes funciones:**

- Informar sobre cuidados sanitarios y prácticas de aislamiento social;
- Proveer un test de autodiagnóstico;
- Especificar las condiciones de circulación procedentes de acuerdo a la cuarentena vigente;
- En base a lo anterior, brinda la posibilidad de vincular esta información con el permiso de circulación (Certificado Único Habilitante para Circulación), a la vez que lo valida o invalida según el resultado del diagnóstico de salud. Si lo valida, genera un token digital con QR que sería utilizado como prueba suficiente en caso de que lo requieran las fuerzas de seguridad. Así, otorga "pasaportes" de diferentes colores según el tipo de circulación pública que pueda o no tenerse y los vincula con el mencionado token.
- Proveer información de centros de salud cercanos, en caso de ser necesario;

_Cada 48hs, le usuarie debe repetir los pasos para completar el autodiagnóstico y actualizar la información._

En su artículo en [_Medium_](https://medium.com/@diego.garbervetsky/apps-para-covid-19-para-salir-de-casa-menos-es-m%C3%A1s-5b59619f9975), Diego Garbervetsky, Sebastián Uchitel, Sergio Romano y Fernando Schapachnik (colaboradores con la Secretaría de Innovación Pública en el desarrollo de la app), caracterizan la aplicación como "una especie de pasaporte sanitario digital" o "...más bien..." "...una credencial de circulación para la pandemia", en función de la cual "la app determina si podemos circular o no." Y cómo. Esto lo hace a través de credenciales por colores:

**Verde:** sin síntomas compatibles con COVID-19. Pueden tener permiso de circulación para las actividades y por los medios permitidos. Al vincular el autodiagnóstico con el Permiso Único para la Circulación, genera un token de seguridad con un código QR que podrá ser escaneado por las fuerzas para comprobarlo.

**Azul:** sin síntomas compatibles con COVID-19. Sin permiso de circulación, pueden desplazarse en el rango indicado para hacer compras en comercios de proximidad.

**Rosa:** quienes deban aislarse preventivamente y/o ser derivades a un centro de salud. También otorga un Token de Seguridad como resultado del autodiagnóstico e indica "En Observación. Contactate con el sistema de Salud. Mientras tanto, mantené el aislamiento y minimizá el contacto con otras personas."

A continuación, compartimos la Descripción de la Aplicación extraída de los Términos y Condiciones.

> 1. "la aplicación es una herramienta tecnológica que trata de brindar información sobre diversos temas referente a los síntomas y/o prevención del virus covid-19 con la finalidad de ayudar a prevenir la propagación del virus, como así también erigirse una fuente de información fidedigna para los usuarios_
> 
> 2. La app también incorporará vías de contacto cercanas al Usuario._
> 
> 3. El Usuario podrá responder algunas preguntas relacionadas con su estado de salud y sintomatología compatible con el virus COVID-19 a través de la Aplicación y recibir orientación y/o instrucciones para ser atendido en la unidad d) Se trate de datos personales relativos a la salud, y sea necesario por razones de salud pública, de emergencia o para la realización de estudios epidemiológicos, en tanto se preserve la identidad de los titulares de los datos mediante mecanismos de disociación adecuados; de salud más cercana._
> 
> 4. La aplicación utilizará las funciones de geolocalización de los dispositivos móviles con las siguientes finalidades específicas: i) recomendar medidas preventivas o de evaluación sanitaria; II) activar los sistemas de emergencia para la prestación de asistencia sanitaria; iii) conectar al usuario o usuaria con un sistema de atención sanitario cercano; iv) realizar comparaciones y predicciones, basadas en recomendaciones sanitarias que determine el Ministerio de Salud de la Nación, como por ejemplo, mapeos de zonas de riesgo y áreas de poco distanciamiento social que aumentan las posibilidades de propagación del virus COVID-19 y con la emergencia declarada; contribuir a investigaciones científicas que permitan desarrollar y/o mejorar técnicas sanitarias y preventivas relacionadas con la pandemia y la salud de la población.
> 
> 5. Adicionalmente, la Secretaría podrá incluir funcionalidades en la aplicación que permitan entre otras cosas formular denuncias sobre incumplimiento de la normativa de emergencia, recibir asistencia online o asistencia audiovisual sobre los cuidados, etc."

## ¿Qué cosas no nos quedan en claro?

- En caso de diagnóstico que amerite la activación del [protocolo](https://www.buenosaires.gob.ar/sites/gcaba/files/p.cero10.05.pdf) para casos de mediano y alto riesgo, cómo se gestiona mediante la app.
- Cómo serán utilizadas las funciones de geolocalización para el relevamiento masivo de datos con fines estadístico-epidemiológicos y científicos (punto 4).
- Cuáles serán las características a desarrollar y la dirección que tomará la app, especialmente en relación con las funcionalidades de denuncia ante incumplimiento de la cuarentena, así como mejoras en el diagnóstico y asistencia hacia la derivación a centros de salud (punto 5).

## ¿Qué información debo proporcionar para usarla?

* Número de DNI y trámite (del DNI, no confundir con trámite de circulación).
* Género Masculino o Femenino (sin mayor especificidad que eso, aclaramos).
* Aceptar los términos y condiciones, que incluyen mantener actualizada la información personal (dirección, código postal).

## Aclaración respecto de los permisos de geo-referenciación

Si bien la app pide "Conocer tu localización es necesario para tener mejores estadísticas para controlar la pandemia, y poder asociarte a tu centro de salud más cercano" (sic), pese a todos los rumores y comentarios acerca de la voluntad de trackeo (seguimiento) estatal masivo, colocar la opción "cancelar" en lugar de "permitir" no impide continuar con su uso. Es decir, no es necesario utilizar el GPS.

La posibilidad de identificar la geolocalización, así, queda supeditada al control de señales de radio (torres de telefonía, por triangulación) y antenas de wifi (si estuviera habilitada esa opción), lo que podría disminuir la precisión.

## ¿Es obligatorio utilizarla?

En su discurso del 8 de mayo, el presidente Alberto Fernández declaró que "todo el que vuelva a trabajar tiene la obligación de bajar una aplicación del Gobierno Nacional que se llama CUIDAR" y que " en esa aplicación, uno se somete a un autocontrol, y eso nos permite hacer un seguimiento de la persona en lo que hace a su calidad sanitaria".

Encontramos que esta afirmación puede volverse un tanto inacertada ante el análisis (superficial) del comportamiento de la app.

Si bien tampoco encontramos que haya respaldo legal para estos dichos (ni en los boletines publicados, ni en los términos y condiciones de la aplicación) que refuercen la naturaleza obligatoria de su uso por parte de quienes estén autorizades a circular, no podemos dejar de notar que estas --cuanto menos-- imprecisiones tienen otras consecuencias asociadas. Una de ellas, prestarse a abusos policiales y de otras fuerzas. Otra, el impacto psico-físico en grupos vulnerabilizados, víctimas frecuentes de estos atropellos. Finalmente, dudas y suspicacias respecto de su utilización.

## Conclusiones

El anuncio tuvo repercusiones variadas y unas de las más evidentes, asociadas a la falta de seguridad y posible control estatal mediante la app.

En un primer análisis, nos vimos tentades a opinar acerca de la exageración tanto de las bondades como de los peligros de la app y, salvo pocas excepciones, la evidente falta de rigurosidad en las notas de divulgación difundidas.

Lo cierto es que no es posible llegar a una conclusión sin saber _qué hace realmente la app_.

Para ello, como tantas otras veces, señalamos que es fundamental contar con el código fuente (es decir, todo el código en el que está programado, pero _no_ los datos de les usuaries) publicado para su auditoría: quisiéramos poder analizar qué _hace_ la app, no solamente qué _dice_ que hace. Sin ello, sin que el código pueda ser auditable, estudiado, monitoreado, etc. por el conjunto de la población, no hay garantías de que la app cumpla con los criterios básicos de privacidad y seguridad para les usuaries, lo que equivale a decir que no podemos asegurar que la app no vulnere alguno de nuestros derechos humanos.

Problemas derivados de esto, que no analizaremos aquí:

- Privacidad/seguridad de los datos frente a intrusiones de tercerxs (obtención de información confidencial mediante ingeniería inversa).
- Utilización de los datos por parte del Estado y posibles violaciones a la privacidad (con especial atención a que los criterios de cesión de datos mediante consentimiento de su titular quedan exceptuados cuando "Se trate de datos personales relativos a la salud, y sea necesario por razones de salud pública, de emergencia o para la realización de estudios epidemiológicos, en tanto se preserve la identidad de los titulares de los datos mediante mecanismos de disociación adecuados;", según la [Ley de Protección de Datos Personales N° 25326](http://servicios.infoleg.gob.ar/infolegInternet/anexos/60000-64999/64790/norma.htm) art. 11-3-d.
- Soberanía tecnológica y Ley de Protección de Datos: ¿los datos están almacenados en servidores de Amazon que no están en el país? El Estado terceriza el almacenamiento de los datos en corporaciones, pero la Ley de Protección de Datos permitiría el traslado de datos a entidades extranjeras en casos epidemilógicos.
- Problemas generales derivados de los permisos en sistemas operativos como Android: los permisos son tan vagos e imprecisos que perdemos control sobre lo que no queremos ceder para obtener funcionalidades básicas (Ej: acceso a los datos de red para tener conexión).
- Problemas derivados del Derecho Informático y la ciudadanía.
- Problemas derivados de una mala política de comunicación oficial y falta de transparencia en la gestión de una aplicación oficial.

