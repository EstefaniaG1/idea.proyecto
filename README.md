# Filogenia multi-génica y factores de concordancia génica (gCF) en Phyllostomidae y Vespertilionidae: evaluando la radiación adaptativa en relación con la dieta especializada 

## Autora: Estefania Guallichico

## Objetivo del proyecto
Explorar la radiación adaptativa en murciélagos mediante un análisis filogenético multi-génico con énfasis en la familia Phyllostomidae, utilizando Vespertilionidae como grupo comparativo. Se emplean factores de concordancia génica (gCF) para evaluar la estabilidad filogenética de grupos ecológicos especializados por dieta:

* Frugívoros

* Nectarívoros

* Carnívoros/Piscívoros

Se busca determinar si estos grupos son monofiléticos y si existen señales de convergencia ecológica entre especies no emparentadas que comparten dieta.

![ ](https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=400,h=280,fit=crop/AQE3bBVaKPi5W2re/vampyressathyonef-mv05zx84OWipbk0M.jpg)
 

![ ](https://ecuador.inaturalist.org/photos/54080)

![ ](https://media.istockphoto.com/id/1309434997/es/foto/murci%C3%A9lago-de-bamb%C3%BA-mayor.jpg?s=612x612&w=0&k=20&c=DhYKqaT_GUQLFr1UAB8TgsMtquEUBuBsc-99ku_u5xk=)


## Proposito del proyecto 

El programa toma como base una alineación de secuencias genéticas (por ejemplo, genes mitocondriales o nucleares), genera árboles filogenéticos mediante IQ-TREE, y analiza la concordancia y soporte de los nodos mediante métricas como bootstrap y Gene Concordance Factors (gCF).

También se busca relacionar la estabilidad de los nodos con adaptaciones ecológicas dentro del grupo, como la dieta (nectarívora, frugívora, insectívora, etc.).

El repositorio incluye archivos de entrada, scripts en bash y visualizaciones generadas con FigTree.


## Requisitos para ejecutar el programa 

* Sisema operativo: Windows, Linux o Mac OS 
* Terminal: git bash 
* Programas necesarios: - `muscle`, `iqtree2`, `atom`, `muscle`, `iqtree`, `astral`, `java` 


## Como usar el programa 

* Alinear secuencias 
 muscle -in secuencias/COI.fasta -out alineamientos/COI_aln.fasta
* Construir arboles 
iqtree2 -s alineamientos/COI_aln.fasta -m MFP -bb 1000 -nt AUTO
* arboles consenso 
cat arboles/*.treefile > arboles/todos_los_arboles.tre
iqtree2 -t arboles/todos_los_arboles.tre --consense
* genes concordance
iqtree2 -s concatenado.fasta -p particiones.txt -m MFP -B 1000 \
--gcf arboles/todos_los_arboles.tre -t CONCAT --scf 100
* visualizacion
abrir el archivo.treefile en FigTree observar los nodos con soporte 

# Notas

Las especies usadas pertenecen a las familias Phyllostomidae (nectarívoros, frugívoros y carnívoros/piscívoros) y Vespertilionidae (insectívoros).

Se eligieron especies registradas en Ecuador para garantizar relevancia regional.

El proyecto permite evaluar si los rasgos ecológicos como la dieta determinan agrupamientos filogenéticos consistentes o si han evolucionado varias veces de forma independiente.

Cómo interpretar los valores de gCF y sCF:

gCF (Gene Concordance Factor): indica el porcentaje de árboles geneales (basados en un solo gen) que respaldan un nodo específico en el árbol concatenado.

Valores altos (por ejemplo, >70%) indican que la mayoría de los genes coinciden en esa relación filogenética.

Valores bajos sugieren conflicto entre genes, lo que puede deberse a eventos como convergencia, hibridación o evolución rápida.

sCF (Site Concordance Factor): representa el porcentaje de sitios informativos (posiciones de alineamiento) que apoyan un nodo. Es útil para evaluar la señal filogenética directa en la secuencia, independientemente del gen.

Comparando ambos valores (gCF vs. sCF) se puede evaluar si el conflicto se origina en la discrepancia entre genes o en falta de señal filogenética.

Esta información puede ayudar a determinar si los grupos ecológicos con dietas similares (ej. nectarívoros) evolucionaron juntos (monofilia) o si surgieron varias veces de forma independiente (convergencia adaptativa).
