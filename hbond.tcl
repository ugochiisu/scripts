 
package require hbonds 

mol new input.psf
mol addfile input.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all
set all [atomselect $i "all"]
set Sel1 [atomselect $i "protein and resid $resid and sidechain"]
set Sel2 [atomselect $i "protein and resid $resid and sidechain"]

hbonds -sel1 $Sel1 -DA both -sel2 $Sel2 -DA both -dist 4.0 -ang 30 -polar yes -type unique -writefile yes -outdir outputname-0 -log outputname.log -outfile outputname.hbonds.dat -detailout outputname.stdout

quit
