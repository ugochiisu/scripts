mol new input.psf
mol addfile input.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

pbc wrap -centersel "protein" -center com -compound residue -all
set num_steps [molinfo top get numframes]
set sel [atomselect top "water and same residue as (within 5 of protein and resid 327 to 479 493 to 523) and not (within 6 of lipids) and noh"]
set sel2 [atomselect top "water and same residue as (within 5 of protein and resid 366) and not (within 6 of lipids) and noh"]
set sel3 [atomselect top "water and same residue as (within 5 of protein and not resid 480 to 492) and not (within 6 of lipids) and noh"]
set pro [atomselect top "protein and resid 327 to 523 and alpha"]
set ref [atomselect top "protein and resid 327 to 523 and alpha" frame 0]
for {set frame 0} {\$frame < \$num_steps} {incr frame} {
    \$pro frame \$frame
    \$sel frame \$frame
    \$sel2 frame \$frame
    \$sel3 frame \$frame
    \$sel update
    \$sel2 update
    \$sel3 update
    \$sel move [measure fit \$pro \$ref]
     set wat [\$sel num]
    \$sel2 move [measure fit \$pro \$ref]
     set wat2 [\$sel2 num]
    \$sel3 move [measure fit \$pro \$ref]
     set wat3 [\$sel3 num]
     puts stderr "\$frame \$wat \$wat2 \$wat3"
}
quit
