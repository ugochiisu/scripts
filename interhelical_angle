mol new input.psf
mol addfile input.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set helix1 [atomselect 0 "resid 355 to 388  and alpha"]
set helix2 [atomselect 0 "resid 423 to 442 and alpha"]
set helix3 [atomselect 0 "resid 466 to 479 and alpha"]
set helix4 [atomselect 0 "resid 497 to 508 and alpha"]
set helix5 [atomselect 0 "resid 511 to 528 and alpha"]


set num_steps [molinfo 0 get numframes]
for {set frame 1} {\$frame < \$num_steps} {incr frame} {
#
    \$helix1 frame \$frame
    \$helix2 frame \$frame
    \$helix3 frame \$frame
    \$helix4 frame \$frame
    \$helix5 frame \$frame
#
    set h1h2 [expr 180*(acos([vecdot [lindex [measure inertia \$helix1] 1 2] [lindex [measure inertia \$helix2] 1 2]]))/acos(-1)]
    if {\$h1h2 > 90} {set h1h2 [expr 180-\$h1h2]}
    set h1h3 [expr 180*(acos([vecdot [lindex [measure inertia \$helix1] 1 2] [lindex [measure inertia \$helix3] 1 2]]))/acos(-1)]
    if {\$h1h3 > 90} {set h1h3 [expr 180-\$h1h3]}
    set h1h4 [expr 180*(acos([vecdot [lindex [measure inertia \$helix1] 1 2] [lindex [measure inertia \$helix4] 1 2]]))/acos(-1)]
    if {\$h1h4 > 90} {set h1h4 [expr 180-\$h1h4]}
    set h1h5 [expr 180*(acos([vecdot [lindex [measure inertia \$helix1] 1 2] [lindex [measure inertia \$helix5] 1 2]]))/acos(-1)]
    if {\$h1h5 > 90} {set h1h5 [expr 180-\$h1h5]}
#
    set h2h3 [expr 180*(acos([vecdot [lindex [measure inertia \$helix2] 1 2] [lindex [measure inertia \$helix3] 1 2]]))/acos(-1)]
    if {\$h2h3 > 90} {set h2h3 [expr 180-\$h2h3]}
    set h2h4 [expr 180*(acos([vecdot [lindex [measure inertia \$helix2] 1 2] [lindex [measure inertia \$helix4] 1 2]]))/acos(-1)]
    if {\$h2h4 > 90} {set h2h4 [expr 180-\$h2h4]}
    set h2h5 [expr 180*(acos([vecdot [lindex [measure inertia \$helix2] 1 2] [lindex [measure inertia \$helix5] 1 2]]))/acos(-1)]
    if {\$h2h5 > 90} {set h2h5 [expr 180-\$h2h5]}
#
    set h3h4 [expr 180*(acos([vecdot [lindex [measure inertia \$helix3] 1 2] [lindex [measure inertia \$helix4] 1 2]]))/acos(-1)]
    if {\$h3h4 > 90} {set h3h4 [expr 180-\$h3h4]}
    set h3h5 [expr 180*(acos([vecdot [lindex [measure inertia \$helix3] 1 2] [lindex [measure inertia \$helix5] 1 2]]))/acos(-1)]
    if {\$h3h5 > 90} {set h3h5 [expr 180-\$h3h5]}
#
    set h4h5 [expr 180*(acos([vecdot [lindex [measure inertia \$helix4] 1 2] [lindex [measure inertia \$helix5] 1 2]]))/acos(-1)]
    if {\$h4h5 > 90} {set h4h5 [expr 180-\$h4h5]}
#
    puts stderr "\$frame \$h1h2 \$h1h3 \$h1h4 \$h1h5 \$h2h3 \$h2h4 \$h2h5 \$h3h4 \$h3h5 \$h4h5"
}

quit
