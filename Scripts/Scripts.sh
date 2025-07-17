#!/bin/bash

#Comandos para hacer filogenias concenso

#Iniciar sesión en un nodo computacionall

# Solicitar sesión interactiva en un nodo computacional

qrsh -l h_data=10G,h_rt=6:00:00


# Ejecutar MUSCLE (v3.8.31)
./muscle3.8.31_i86linux64 -in rna.fna -out muscle_rna.fna -maxiters 1 -diags

# Carga IQ-TREE (versión 2.2.2.6)
module load iqtree/2.2.2.6

# Hacer filogenia 1 - Sin astral
for muscle in muscle_*
do
iqtree2 -s ${muscle}
done

# Cragar Astral Utilizar versión 5.7.1 - Descargada (Utilizar esta desde cualquier ubicación)
astral=$SCRATCH/Bioinformatica-PUCE/RepotenBio/EstefaniaGuallichico/ProyectoFinal/obp_Vespertilionidae/ncbi_dataset/data/Astral/ASTRAL-5.7.1/Astral/astral.5.7.1.jar

#Filogenia consenso 
for file in All.Trees.*.tree
do
[ -e "$file" ] || continue
cat *.treefile > $file
suffix=$(echo "$file" | sed 's/^All\.tree\.\(.*\)\.tree$/\1/')
output_file="Astral.${suffix}.tree
java -jar $astral -i $file -o $output_file
iqtree2 -t $output_file --gcf $file --prefix GCF.concord
done

mv GCF.concord.* ../Results/
