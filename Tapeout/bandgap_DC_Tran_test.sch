v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 1345.3515625 -1214.21875 2145.3515625 -814.21875 {flags=graph
y1=0
y2=1.2
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1

divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0


dataset=-1
unitx=1
logx=0
logy=0
x1=0
color=7
node=vdd
hilight_wave=-1
x2=2}
B 2 1345.3515625 -804.21875 2145.3515625 -404.21875 {flags=graph
y1=-2.6e-07
y2=0.61
ypos1=0
ypos2=2
divy=5
subdivy=1
unity=1

x2=2
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
dataset=-1
unitx=1
logx=0
logy=0
x1=0
hilight_wave=-1
color=4
node=vbg}
N 680 -593 680 -578 {
lab=GND}
N 1130 -615 1130 -570 {
lab=vdd}
N 1130 -510 1130 -480 {
lab=GND}
N 900 -702 950 -702 {
lab=VBG}
N 900 -702 900 -647 {
lab=VBG}
N 600 -593 680 -593 {lab=GND}
N 600 -673 600 -651 {lab=#net1}
N 710 -672 710 -593 {lab=GND}
N 680 -593 710 -593 {lab=GND}
N 710 -857 710 -812 {
lab=vdd}
N 830 -782 860 -782 {
lab=Vo1}
N 830 -702 900 -702 {lab=VBG}
N 900 -587 900 -550 {lab=GND}
C {devices/code_shown.sym} 820 -1113.828125 0 0 {name=bandgap only_toplevel=true value="
.control
.save all
alter V1 dc 1.2            
op
dc TEMP 130 -50 -1
write bgr_temp.raw
.endc

.control
.save all
tran 1m 2 
write bandgap_transient.raw
.endc
"
}
C {devices/code_shown.sym} 810 -1225 0 0 {name=MODEL only_toplevel=true
format="tcleval( @value )"
value="
.lib $::SG13G2_MODELS/cornerCAP.lib cap_typ
.lib $::SG13G2_MODELS/cornerRES.lib res_typ
.lib cornerMOSlv.lib mos_tt
"}
C {gnd.sym} 680 -578 0 1 {name=l4 lab=GND}
C {isource.sym} 600 -623 0 1 {name=I1 value=80u}
C {vsource.sym} 1130 -540 0 0 {name=V1 value="PULSE(0 1.2 0 1 0 1 2)" savecurrent=false}
C {lab_pin.sym} 1130 -615 0 1 {name=p6 sig_type=std_logic lab=vdd}
C {gnd.sym} 1130 -480 0 0 {name=l18 lab=GND}
C {gnd.sym} 900 -550 0 0 {name=l3 lab=GND}
C {opin.sym} 950 -702 0 0 {name=p11 lab=VBG}
C {sg13g2_pr/cap_cmim.sym} 900 -617 0 0 {name=C3
model=cap_cmim
w=72.965e-6
l=72.965e-6
m=1
spiceprefix=X}
C {launcher.sym} 1171.40625 -813.28125 0 0 {name=h5
descr="load DC" 
tclcommand="xschem raw_read $netlist_dir/bgr_temp.raw dc"
}
C {launcher.sym} 1171.40625 -768.28125 0 0 {name=h1
descr="load Transient" 
tclcommand="xschem raw_read $netlist_dir/bandgap_transient.raw tran"
}
C {/foss/designs/simulations/tiny_tapeout_final/BGreference_tt.sym} 680 -742 0 0 {name=x1}
C {lab_pin.sym} 710 -857 0 1 {name=p1 sig_type=std_logic lab=vdd}
C {iopin.sym} 860 -782 0 0 {name=p10 lab=Vo1}
