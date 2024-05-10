mol new input.psf
mol addfile input.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set helix1 [atomselect 0 "protein and not resid 480 to 492 and alpha"]
set helix2 [atomselect 0 "protein and resid 327 to 479 493 to 523 and alpha"]

set refhelix1 [atomselect 0 "protein and not resid 480 to 492 and alpha" frame 0]
set refhelix2 [atomselect 0 "protein and resid 327 to 479 493 to 523 and alpha" frame 0]

set all [atomselect 0 "all"]

set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
    \$all frame \$frame
    \$helix1 frame \$frame
    \$helix2 frame \$frame
    set trans [measure fit \$helix1 \$refhelix1]
    \$all move \$trans
    set rmsdh1 [measure rmsd \$helix1 \$refhelix1]
    #
    set trans [measure fit \$helix2 \$refhelix2]
    \$all move \$trans
    set rmsdh2 [measure rmsd \$helix2 \$refhelix2]
     puts stderr "\$frame \$rmsdh1 \$rmsdh2"
}
quit
