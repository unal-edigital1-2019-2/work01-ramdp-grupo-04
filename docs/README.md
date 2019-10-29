##  ELECTRÓNICA DIGITAL 1 2019 -2 UNIVERSIDAD NACIONAL DE COLOMBIA 
## TRABAJO 01- EVALUACIÓN DE MEMORIA  MÁXIMA 

## Integrantes

1. Miguel Angel Martinez Fernandez 1024566585
1. David Ricardo Lugo Venegas 1075872618

## Introducción 
Para poder almacenar la información adquirida por la cámara ov7670, y teniendo en cuanta la cámara  usada no tiene memoria FIFO, se debe diseñar e implementar una memora RAM  de doble puerto 
![FigRAM](https://github.com/unal-edigital1-2019-2/work01-ramdp-grupo-04/blob/master/docs/figs/cajaramdp.png)
## Desarrollo
Analizar la máxima memoria ram que podemos alojar en la FPGA,  y planear el método de adquisición de los datos de la cámara  para lo cual se debe responder las siguientes preguntas:

### Pregunta 1:
¿Definir cuál es el tamaño máximo de buffer de memoria que puede crear?, se recomienda leer las especificaciones de la FPGA que está usando cada grupo. La respuesta se debe dar en bytes.

Para el desarrollo del proyecto se esta utilizando una Nexys 4 la cual posee como maximo una memoria RAM de 4860 Kbits o 607.5 KB

### Pregunta 2:
¿Cuál formato  y tamaño de imagen de la cámara OV7670  que se ajusta mejor al tamaño de memoria calculado en la pregunta 1?. Para ello revisar la hoja de datos de la cámara OV7670. Revisar el datasheet que se encuentra [aquí](https://github.com/unal-edigital1-2019-2/work1-ram/blob/master/docs/datasheet/OV7670_2006.pdf)

Teniendo en cuenta el datasheet de la camara OV7670, podemos observar que uno de los formatos que soporta es el RGB 565, el cual toma los 5 bits mas significativos para el rojo, los siguientes 6 bits para el verde y los ultimos 5 bits para el azul, podemos ver el el formato RGB 565 en la siguiente imagen :

![FigRGB565](https://github.com/unal-edigital1-2019-2/work01-ramdp-grupo-04/blob/master/docs/figs/RGB565.PNG)

Dado que la memoria de la Nexys 4 tiene un maximo de 607.5 KB y dejando memoria disponible para los demás modulos utilizaremos solo la mitad de la resolución disponible de la OV7670, se utilizara una resolución de 320 * 240 pixeles, y teniendo que el tamaño del pixel es de 2 Bytes, en total apartaremos para la visualización 153.6 KB, y tendremos disponibles para los demás modulos 453.9 KB.
### Pregunta 3:
¿Cuáles son los registros de configuración de la cámara OV7670 que permiten tener la configuración dada en la pregunta 2? Revisen los registros dados de la página 11 a la 26 del datasheet e indiquen la configuración para:

* Restablecer todos los registros
* Habilitar el escalado
* Configurar el formato y el tamaño del pixel
* Habilitar el test de barra de colores