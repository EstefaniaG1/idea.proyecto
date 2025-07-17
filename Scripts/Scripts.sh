# Comandos Filogenia Consenso 
# Solicitar sesión interactiva en un nodo del cluster
qrsh -l h_data=10G,h_rt=6:00:00

cd $SCRATCH/Bioinformatica-PUCE/RepotenBio/EstefaniaGuallichico/ProyectoFinal/obp_Vespertilionidae/ncbi_dataset/data

# Ejecutar MUSCLE (v3.8.31)
./muscle3.8.31_i86linux64 -in rna.fna -out muscle_rna.fna -maxiters 1 -diags

# Carga IQ-TREE (versión 2.2.2.6) 
module load iqtree/2.2.2.6

# Hacer filogenia 1 - Sin astral
for muscle in muscle_*
do
iqtree2 -s ${muscle}
done


# Utilizar versión 5.7.1 Astral - Descargada (Utilizar esta desde cualquier ubicación)
astral=$SCRATCH/Bioinformatica-PUCE/RepotenBio/EstefaniaGuallichico/ProyectoFinal/obp_Vespertilionidae/ncbi_dataset/data/Astral/ASTRAL-5.7.1/Astral/astral.5.7.1.jar

# Concatenar
cat *.treefile > All.Trees.OBPVespertilionidae.tree

# Hacer astral java
java -jar $astral -i All.Trees.OBPVespertilionidae.tree -o Astral.OBPVespertilionidae.tree

# Hacer arbol concenso
iqtree2 -t Astral.OBPVespertilionidae.tree --gcf All.Trees.OBPVespertilionidae.tree --prefix GCF.concord



