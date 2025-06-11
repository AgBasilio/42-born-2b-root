• La arquitectura de tu sistema operativo y su versión de kernel.                       | uname -a
• El número de núcleos físicos.                                                         | lscpu
• El número de núcleos virtuales.                                                       | nproc
• La memoria RAM disponible actualmente en tu servidor y su porcentaje de uso.          | free
• La memoria disponible actualmente en tu servidor y su utilización como un porcentaje. | df
• El porcentaje actual de uso de tus núcleos.                                           |
• La fecha y hora del último reinicio.                                                  | who
• Si LVM está activo o no.                                                              | 
• El número de conexiones activas.                                                      | ss -t 
• El número de usuarios del servidor.                                                   | w
• La dirección IPv4 de tu servidor y su MAC (Media Access Control)                      | ip address
• El número de comandos ejecutados con sudo.                                            | ss

Curso de BASH SCRIPTING desde CERO para PRINCIPIANTES: https://youtu.be/tNeRFm2jY7c?si=nKgqFspwMMqNaMae
shebang (o "hashbang"), le dice al sistema con qué programa debe ejecutar el script.
    #!/bin/bash
    con esta linea no hace falta especificar con que ejecutar el script
        con el shebang, para ejecutar el escript se lo invoca directamente $ ./miscript.sh
        sin el, debemos decir con que programa se debe ejecutar: $ bash miscript.sh


probar: Neofetch es una herramienta CLI (command-line interface) que muestra información sobre tu sistema -como la versión del kernel, el shell y el hardware- junto a un logotipo ASCII de tu distribución de Linux:

Comandos para el procesamiento de textos:
    https://persoal.citius.usc.es/tf.pena/ASR/Tema_2html/node23.html 