#Radiación adaptativa en Phyllostomidae: evaluando la estabilidad de los nodos filogenéticos
 
## Autora: Estefania Guallichico

## Objetivo del proyecto

Se pretende explorar la radiacion adaptativa en la familia de murcielagos Phyllostomidae mediante el analisis de l estabilidad de los nodos. 

![ ](https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=400,h=280,fit=crop/AQE3bBVaKPi5W2re/vampyressathyonef-mv05zx84OWipbk0M.jpg)
 

## Proposito del proyecto 

El programa toma como base una alineación de secuencias genéticas (por ejemplo, genes mitocondriales o nucleares), genera árboles filogenéticos mediante IQ-TREE, y analiza la concordancia y soporte de los nodos mediante métricas como bootstrap y Gene Concordance Factors (gCF).

También se busca relacionar la estabilidad de los nodos con adaptaciones ecológicas dentro del grupo, como la dieta (nectarívora, frugívora, insectívora, etc.).

El repositorio incluye archivos de entrada, scripts en bash y visualizaciones generadas con FigTree.


## Requisitos para ejecutar el programa 

* Sisema operativo: Windows, Linux o Mac OS 
* Terminal: git bash 
* Programas necesarios: - `muscle`, `iqtree2`, `Perl`, `atom` 


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
