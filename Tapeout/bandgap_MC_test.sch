v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
N -200 -155 -200 -110 {
lab=vdd}
N -200 -50 -200 -20 {
lab=GND}
N -285 -223 -285 -208 {
lab=GND}
N -75 -332 -25 -332 {
lab=VBG}
N -75 -332 -75 -277 {
lab=VBG}
N -365 -223 -285 -223 {lab=GND}
N -365 -303 -365 -281 {lab=#net1}
N -255 -302 -255 -223 {lab=GND}
N -285 -223 -255 -223 {lab=GND}
N -255 -487 -255 -442 {
lab=vdd}
N -135 -412 -105 -412 {
lab=Vo1}
N -135 -332 -75 -332 {lab=VBG}
N -75 -217 -75 -150 {lab=GND}
C {devices/code_shown.sym} -980 -463.828125 0 0 {name=NGSPICE only_toplevel=false 
value="
.param mm_ok=1
.param mc_ok=1

.control
  let run = 1
  let mc_runs = 100
  set curplot = new
  set scratch = $curplot
  dowhile run <= mc_runs
    reset
    dc temp 100 -50 -5
    set run = $&run
    set dc = $curplot
    setplot $scratch
    let off\{$run\} = \{$dc\}.v(VBG)
    let mytemp\{$run\} = \\"\{$dc\}.temp-sweep\\"
    setplot $dc
    let run = run + 1
  end
  set nolegend
  plot \{$scratch\}.allv vs \{$scratch\}.mytemp1
  write bandgap_testbench_mc_mis.raw \{$scratch\}.allv \{$scratch\}.mytemp1
.endc

"}
C {vsource.sym} -200 -80 0 0 {name=V1 value="DC 1.2" savecurrent=false}
C {lab_pin.sym} -200 -155 0 1 {name=p6 sig_type=std_logic lab=vdd}
C {gnd.sym} -200 -20 0 0 {name=l18 lab=GND}
C {devices/code_shown.sym} -950 -585 0 0 {name=MODEL1 only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib cornerMOSlv.lib mos_tt_stat"}
C {gnd.sym} -285 -208 0 1 {name=l4 lab=GND}
C {isource.sym} -365 -253 0 1 {name=I1 value=80u}
C {gnd.sym} -75 -160 0 0 {name=l3 lab=GND}
C {opin.sym} -25 -332 0 0 {name=p11 lab=VBG}
C {sg13g2_pr/cap_cmim.sym} -75 -247 0 0 {name=C3
model=cap_cmim
w=72.965e-6
l=72.965e-6
m=1
spiceprefix=X}
C {/foss/designs/simulations/tiny_tapeout_final/BGreference_tt.sym} -285 -372 0 0 {name=x1}
C {lab_pin.sym} -255 -487 0 1 {name=p1 sig_type=std_logic lab=vdd}
C {iopin.sym} -105 -412 0 0 {name=p10 lab=Vo1}
