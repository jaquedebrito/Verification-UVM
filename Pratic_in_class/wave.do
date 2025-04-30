onerror {resume}
noview .main_pane.structure .main_pane.library .main_pane.objects .main_pane.process
quietly WaveActivateNextPane {} 0
add wave -noupdate -height 30 -expand -subitemconfig {/uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/sequencer_h_JaqueB/seq.s1 {-childformat {{/uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/sequencer_h_JaqueB/seq.s1.j -radix decimal}} -expand} /uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/sequencer_h_JaqueB/seq.s1.j {-height 16 -radix decimal}} /uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/sequencer_h_JaqueB/seq
add wave -noupdate /top/in/clock
add wave -noupdate /top/in/reset
add wave -noupdate /top/in/valid
add wave -noupdate -radix decimal /top/in/j
add wave -noupdate -childformat {{/uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/monitor_h_JaqueB/tr.t0.j -radix decimal}} -expand -subitemconfig {/uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/monitor_h_JaqueB/tr.t0.j {-radix decimal}} /uvm_root/uvm_test_top/env_JaquelineB/agent_h_Jaqueline/monitor_h_JaqueB/tr
add wave -noupdate /top/out/valid
add wave -noupdate -radix decimal /top/out/j
add wave -noupdate -childformat {{/uvm_root/uvm_test_top/env_JaquelineB/refmod_jaqueline/Jaque_out.t0.j -radix decimal}} -expand -subitemconfig {/uvm_root/uvm_test_top/env_JaquelineB/refmod_jaqueline/Jaque_out.t0.j {-radix decimal}} /uvm_root/uvm_test_top/env_JaquelineB/refmod_jaqueline/Jaque_out
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 400
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {250 ns}
