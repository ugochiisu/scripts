mol new input.psf
mol addfile input.dcd type dcd first 0 last -1 step 1 filebonds 1 autobonds 1 waitfor all

set all [atomselect 0 "all"]
set pro [atomselect 0 "protein"]

saltbr -sel $pro -ondist 4.0 -log output.log -outdir output_directory

quit
