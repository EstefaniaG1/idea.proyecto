#Descargar muscle y iqtree (opcional)

#correr muscle
./muscle3.8.31_i86linux64 -in rna.fna -out muscle_rna.fna -maxiters 1 -diags

#cargar iqtree
module load iqtree/2.2.2.6 *cambiar a carpeta opcional

#hacer filogenia 1 sin astral
for muscle in muscle_*
do
iqtree2 -s ${muscle}
done

#caragar astral
astral=/u/scratch/d/dechavez/Bioinformatica-PUCE/Astral/astral.5.7.8.jar (*descargar en mi carpeta)

#concatenar
cat *.treefile > All.Trees.Phyllostomidae2.tree

#hacer astral java
java -jar $astral -i All.Trees.Phyllostomidae2.tree -o Astral.Phyllostomidae2.tree

#hacer arbol concenso
iqtree2 -t Astral.Phyllostomidae4.tree --gcf All.Trees.Phyllostomidae4.tree --prefix GCF.concord

hacer que vaya a la carpeta resultados

../resultados/All.Trees.Phyllostomidae4.tree
