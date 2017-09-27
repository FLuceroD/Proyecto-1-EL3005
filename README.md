# Proyecto-1-EL3005
Proyecto 1: Estudio de Técnicas de Procesamiento de Señales de Sistemas de Sonar

LAS IMAGENES DEL INFORME ESTAN EN LA CARPETA /IMG

TODOS LOS CODIGOS SE ENCUENTRAN EN LA CARPETA /CODIGOS

Parte b): Se ejecuta parte_b.m . Dentro del archivo se podrá modificar el set de datos
con k = (1...7)

==> Muestra los puntos del set de datos elegido, en coordenadas polares

Parte c): Se ejecuta parte_c.m . Esta funcion ocupa una matriz ya generada (errores_sonar.txt), para generar nuevos datos se debe utilizar la funcion ruido_senal.m recursivamente (se demora mucho)

==> Muestra la curva de error-ganancia para el set de datos elegido (k)

Parte d): Se ejecuta parte_d.m . Se selecciona el set de datos (k)

==> Muestra curva error-varianza, selecciona el optimo y muestra el error de este

Bonus : Se ejecuta bonus.m . Hace básicamente lo mismo que la parte d) pero con un pulso cuadrado

==> Muestra gráfico error-varianza, selecciona el optimo y muestra el error asociado a este 

OTROS CODIGOS

ruido_senal.m ; error_respuesta_senal.m ; error_respuesta_senal2.m ==> entregan el indicador \epsilon segun ganancia o ancho de la señal emitida

energia.m ==> entrega la energia de una señal

data_gen2.m ==> simula los datos al igual que data_gen.m pero para un pulso rectangular

correlacion_cruzada.m ==> computa la correlacion cruzada entre dos señales (es correcta, pero demora mucho la ejecucion, para los codigos se utilizó la funcion xcorr() de MATLAB, solo por velocidad)

pulso.m ==> genera un pulso rectangular, análogo a gaussian_signal.m




