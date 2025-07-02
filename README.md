#Radiación adaptativa en Phyllostomidae: evaluando la estabilidad de los nodos filogenéticos
 
## Autora: Estefania Guallichico

## Objetivo del proyecto

Este proyecto tiene como objetivo reconstruir las relaciones evolutivas entre especies de murciélagos de la familia Phyllostomidae mediante análisis filogenéticos multilocus. Evaluaremos bootstrap y Gene Concordance Factor (GCF) para identificar conflictos gene-especie que puedan reflejar procesos de especiación rápida o eventos evolutivos complejos.

## Por que Didelphidae y _Marmosa Lepida_
La familia **Didelphidae** representa un grupo diverso y ecológicamente importante de marsupiales del Neotrópico. Estos animales han colonizado una gran variedad de hábitats y presentan patrones interesantes de evolución adaptativa.

En particular, la especie **_Marmosa lepida_** se eligió como foco de estudio por su distribución restringida en la región amazónica y su relativa escasez de estudios filogenéticos detallados. Además, su inclusión permite explorar relaciones evolutivas poco resueltas dentro del grupo y fortalecer el conocimiento sobre biodiversidad sudamericana.

Ademas, algunos estudios han identificado en ciertos miembros de este grupo genes asociados a resistencia inmunológica, incluyendo respuestas contra patógenos intracelulares y virus. Esta familia posee un sistema inmune versátil, lo que la convierte en un modelo emergente para comprender mecanismos de defensa en mamíferos no placentarios. Analizar especies como *Marmosa lepida*, poco exploradas genéticamente, puede revelar variantes genéticas únicas, así como genes implicados en adaptación a ambientes tropicales extremos. Esta combinación de valor evolutivo y potencial biomédico refuerza la importancia de su estudio a través de enfoques filogenéticos integrados.

![ ](https://imgs.mongabay.com/wp-content/uploads/sites/25/2018/03/22183354/marsupial-marmosa-WWF-768x512.jpg)


## Que herramientas se debe de usar?

* Muscle: para alineamientos de genes
* IQ-TREE: para hacer filogenias
* astral: construye el árbol consenso, calcula los valores de Factor de Concordancia Genética gCF
* ATOM: para editar textos
* FigTree: Visualización de Árboles Filogenéticos
* FastQC: control y limpieza de calidad de lectura
* Mesquite: visualización y análisis de matriz de caracteres
  

## Requisitos para ejecutar el proyecto
- Sistema operativo basado en Unix o Git Bash en Windows
- Programas instalados en el PATH:
  - `muscle`, `iqtree2`, `trimmomatic`, `fastqc`, `bwa`, `samtools`

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
* Matriz de caracteres 
Adicionalmente, se utiliza una matriz de caracteres generada a partir de alineamientos para explorar las posiciones informativas entre especies. Esta matriz fue visualizada con Mesquite y se empleó para:

Identificar sitios filogenéticamente informativos

Comparar patrones de similitud

Construir árboles complementarios por parsimonia


