
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2$
create_project: 2default:default2
00:00:072default:default2
00:00:072default:default2
393.6172default:default2
67.8832default:defaultZ17-268h px� 
�
Command: %s
1870*	planAhead2�
sread_checkpoint -auto_incremental -incremental {D:/khar zadan/GUST/GUST/GUST.srcs/utils_1/imports/synth_1/main.dcp}2default:defaultZ12-2866h px� 
�
;Read reference checkpoint from %s for incremental synthesis3154*	planAhead2V
BD:/khar zadan/GUST/GUST/GUST.srcs/utils_1/imports/synth_1/main.dcp2default:defaultZ12-5825h px� 
T
-Please ensure there are no constraint changes3725*	planAheadZ12-7989h px� 
q
Command: %s
53*	vivadotcl2@
,synth_design -top main -part xc7k70tfbv676-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7k70t2default:defaultZ17-349h px� 
V
Loading part %s157*device2#
xc7k70tfbv676-12default:defaultZ21-403h px� 
�
HMultithreading enabled for synth_design using a maximum of %s processes.4828*oasys2
22default:defaultZ8-7079h px� 
a
?Launching helper process for spawning children vivado processes4827*oasysZ8-7078h px� 
`
#Helper process launched with PID %s4824*oasys2
105482default:defaultZ8-7075h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
ED:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
�
%s*synth2�
yStarting RTL Elaboration : Time (s): cpu = 00:00:08 ; elapsed = 00:00:08 . Memory (MB): peak = 1203.980 ; gain = 406.605
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
main2default:default2
 2default:default2H
2D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/main.v2default:default2
12default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2

multiplier2default:default2
 2default:default2N
8D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/multiplier.v2default:default2
12default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter value_size bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2

multiplier2default:default2
 2default:default2
02default:default2
12default:default2N
8D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/multiplier.v2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
adder2default:default2
 2default:default2I
3D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/adder.v2default:default2
12default:default8@Z8-6157h px� 
`
%s
*synth2H
4	Parameter value_size bound to: 32 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
adder2default:default2
 2default:default2
02default:default2
12default:default2I
3D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/adder.v2default:default2
12default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
	connector2default:default2
 2default:default2M
7D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/connector.v2default:default2
12default:default8@Z8-6157h px� 
V
%s
*synth2>
*	Parameter N bound to: 4 - type: integer 
2default:defaulth p
x
� 
`
%s
*synth2H
4	Parameter value_size bound to: 32 - type: integer 
2default:defaulth p
x
� 
_
%s
*synth2G
3	Parameter index_size bound to: 7 - type: integer 
2default:defaulth p
x
� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
	connector2default:default2
 2default:default2
02default:default2
12default:default2M
7D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/connector.v2default:default2
12default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
main2default:default2
 2default:default2
02default:default2
12default:default2H
2D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/main.v2default:default2
12default:default8@Z8-6155h px� 
�
+Unused sequential element %s was removed. 
4326*oasys2
pos_reg2default:default2M
7D:/khar zadan/GUST/GUST/GUST.srcs/sim_1/new/connector.v2default:default2
142default:default8@Z8-6014h px� 
�
%s*synth2�
yFinished RTL Elaboration : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1312.512 ; gain = 515.137
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1312.512 ; gain = 515.137
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:11 ; elapsed = 00:00:11 . Memory (MB): peak = 1312.512 ; gain = 515.137
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.1442default:default2
1312.5122default:default2
0.0002default:defaultZ17-268h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
�
Parsing XDC File [%s]
179*designutils2O
9D:/khar zadan/GUST/GUST/GUST.srcs/constrs_1/new/clock.xdc2default:default8Z20-179h px� 
�
Finished Parsing XDC File [%s]
178*designutils2O
9D:/khar zadan/GUST/GUST/GUST.srcs/constrs_1/new/clock.xdc2default:default8Z20-178h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0012default:default2
1374.9612default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0422default:default2
1374.9612default:default2
0.0002default:defaultZ17-268h px� 
�
5undeclared symbol '%s', assumed default net type '%s'7502*oasys2
REGCCE2default:default2
wire2default:default2[
ED:/Xilinx/Vivado/2022.2/data/verilog/src/unimacro/BRAM_SINGLE_MACRO.v2default:default2
21702default:default8@Z8-11241h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
Finished Constraint Validation : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Loading part: xc7k70tfbv676-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:24 ; elapsed = 00:00:25 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
I
%s
*synth21
Start Preparing Guide Design
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
got a mismatch connector
2default:defaulth p
x
� 
B
%s
*synth2*
Is not a child genome
2default:defaulth p
x
� 
�
,IncrSynth : %sReverting to default synthesis4534*oasys2z
fDesign change found in an area of the design that prevents previous synthesis information being used, 2default:defaultZ8-6702h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Doing Graph Differ : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Preparing Guide Design : Time (s): cpu = 00:00:25 ; elapsed = 00:00:26 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:28 ; elapsed = 00:00:28 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
U
%s
*synth2=
)

Incremental Synthesis Report Summary:

2default:defaulth p
x
� 
N
%s
*synth26
"1. Incremental synthesis run: no

2default:defaulth p
x
� 
�
%s
*synth2�
�   Reason for not running incremental synthesis : Design change found in an area of the design that prevents previous synthesis information being used


2default:defaulth p
x
� 
�
�Flow is switching to default flow due to incremental criteria not met. If you would like to alter this behaviour and have the flow terminate instead, please set the following parameter config_implementation {autoIncr.Synth.RejectBehavior Terminate}4868*oasysZ8-7130h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	   2 Input   32 Bit       Adders := 128   
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	              128 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               32 Bit    Registers := 4     
2default:defaulth p
x
� 
?
%s
*synth2'
+---Multipliers : 
2default:defaulth p
x
� 
X
%s
*synth2@
,	              32x32  Multipliers := 4     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
&Parallel synthesis criteria is not met4829*oasysZ8-7080h px� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[1].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[1].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[1].i_m/temp_reg is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[1].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[1].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[1].i_m/temp_reg is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[1].i_m/temp0 is absorbed into DSP genblk1[1].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[2].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[2].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[2].i_m/temp_reg is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[2].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[2].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[2].i_m/temp_reg is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[2].i_m/temp0 is absorbed into DSP genblk1[2].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[3].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[3].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[3].i_m/temp_reg is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[3].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[3].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[3].i_m/temp_reg is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[3].i_m/temp0 is absorbed into DSP genblk1[3].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[4].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[4].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[4].i_m/temp_reg is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
u
%s
*synth2]
IDSP Report: Generating DSP genblk1[4].i_m/temp0, operation Mode is: A*B.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2i
UDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp0.
2default:defaulth p
x
� 
�
%s
*synth2k
WDSP Report: Generating DSP genblk1[4].i_m/temp_reg, operation Mode is: (PCIN>>17)+A*B.
2default:defaulth p
x
� 
�
%s
*synth2o
[DSP Report: register genblk1[4].i_m/temp_reg is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
�
%s
*synth2l
XDSP Report: operator genblk1[4].i_m/temp0 is absorbed into DSP genblk1[4].i_m/temp_reg.
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:51 ; elapsed = 00:00:52 . Memory (MB): peak = 1374.961 ; gain = 577.586
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Start ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
�
%s*synth2p
\
DSP: Preliminary Mapping Report (see note below. The ' indicates corresponding REG is set)
2default:defaulth px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|Module Name | DSP Mapping    | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth px� 
�
%s*synth2�
+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 16     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | A*B            | 18     | 18     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth px� 
�
%s*synth2�
�|main        | (PCIN>>17)+A*B | 18     | 16     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth px� 
�
%s*synth2�
�+------------+----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth px� 
�
%s*synth2�
�Note: The table above is a preliminary report that shows the DSPs inferred at the current stage of the synthesis flow. Some DSP may be reimplemented as non DSP primitives later in the synthesis flow. Multiple instantiated DSPs are reported only once.
2default:defaulth px� 
�
%s*synth2�
�---------------------------------------------------------------------------------
Finished ROM, RAM, DSP, Shift Register and Retiming Reporting
2default:defaulth px� 
~
%s*synth2f
R---------------------------------------------------------------------------------
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:01:04 ; elapsed = 00:01:05 . Memory (MB): peak = 1397.020 ; gain = 599.645
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
}Finished Timing Optimization : Time (s): cpu = 00:01:18 ; elapsed = 00:01:20 . Memory (MB): peak = 1482.312 ; gain = 684.938
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Technology Mapping : Time (s): cpu = 00:01:20 ; elapsed = 00:01:21 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
vFinished IO Insertion : Time (s): cpu = 00:01:27 ; elapsed = 00:01:28 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:01:27 ; elapsed = 00:01:28 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
i
%s
*synth2Q
=
DSP Final Report (the ' indicates corresponding REG is set)
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|Module Name | DSP Mapping     | A Size | B Size | C Size | D Size | P Size | AREG | BREG | CREG | DREG | ADREG | MREG | PREG | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (A*B)'          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | A*B             | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (PCIN>>17+A*B)' | 0      | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (A*B)'          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | A*B             | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (PCIN>>17+A*B)' | 0      | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (A*B)'          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | A*B             | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (PCIN>>17+A*B)' | 0      | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (A*B)'          | 17     | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | A*B             | 17     | 17     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 0    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�|main        | (PCIN>>17+A*B)' | 0      | 15     | -      | -      | 48     | 0    | 0    | -    | -    | -     | 0    | 1    | 
2default:defaulth p
x
� 
�
%s
*synth2�
�+------------+-----------------+--------+--------+--------+--------+--------+------+------+------+------+-------+------+------+

2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|      |Cell    |Count |
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
E
%s*synth2-
|1     |BUFG    |     1|
2default:defaulth px� 
E
%s*synth2-
|2     |CARRY4  |    48|
2default:defaulth px� 
E
%s*synth2-
|3     |DSP48E1 |    12|
2default:defaulth px� 
E
%s*synth2-
|5     |LUT2    |   201|
2default:defaulth px� 
E
%s*synth2-
|6     |LUT3    |    17|
2default:defaulth px� 
E
%s*synth2-
|7     |LUT4    |    22|
2default:defaulth px� 
E
%s*synth2-
|8     |LUT5    |   241|
2default:defaulth px� 
E
%s*synth2-
|9     |LUT6    |    32|
2default:defaulth px� 
E
%s*synth2-
|10    |FDRE    |   324|
2default:defaulth px� 
E
%s*synth2-
|11    |IBUF    |   290|
2default:defaulth px� 
E
%s*synth2-
|12    |OBUF    |   388|
2default:defaulth px� 
E
%s*synth2-
+------+--------+------+
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 2 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Runtime : Time (s): cpu = 00:01:12 ; elapsed = 00:01:25 . Memory (MB): peak = 1489.273 ; gain = 629.449
2default:defaulth p
x
� 
�
%s
*synth2�
�Synthesis Optimization Complete : Time (s): cpu = 00:01:27 ; elapsed = 00:01:29 . Memory (MB): peak = 1489.273 ; gain = 691.898
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0472default:default2
1501.0942default:default2
0.0002default:defaultZ17-268h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
602default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
1504.8202default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
f
$Synth Design complete, checksum: %s
562*	vivadotcl2
610e6fb2default:defaultZ4-1430h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
272default:default2
32default:default2
02default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:01:342default:default2
00:01:372default:default2
1504.8202default:default2
1086.3242default:defaultZ17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2F
2D:/khar zadan/GUST/GUST/GUST.runs/synth_1/main.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2r
^Executing : report_utilization -file main_utilization_synth.rpt -pb main_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Mon Jul 24 17:58:38 20232default:defaultZ17-206h px� 


End Record