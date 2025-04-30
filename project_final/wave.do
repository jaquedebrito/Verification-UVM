onerror {resume}
noview .main_pane.structure .main_pane.library .main_pane.objects .main_pane.process
quietly WaveActivateNextPane {} 0

add wave -noupdate -height 30 -expand -subitemconfig {/uvm_root/uvm_test_top/env_h/agent_in_h/sequencer_h/seq.s1 {-childformat {{/uvm_root/uvm_test_top/env_h/agent_in_h/sequencer_h/seq.s1.rad -radix decimal}} -expand} /uvm_root/uvm_test_top/env_h/agent_in_h/sequencer_h/seq.s1.rad {-height 16 -radix decimal}} /uvm_root/uvm_test_top/env_h/agent_in_h/sequencer_h/seq
add wave -noupdate /top/sqrt_vi_in/clk
add wave -noupdate /top/sqrt_vi_in/start
add wave -noupdate /top/sqrt_vi_in/valid
add wave -noupdate -radix decimal /top/sqrt_vi_in/rad
add wave -noupdate -childformat {{/uvm_root/uvm_test_top/env_h/agent_in_h/monitor_h/tr.t0.rad -radix decimal}} -expand -subitemconfig {/uvm_root/uvm_test_top/env_h/agent_in_h/monitor_h/tr.t0.rad {-radix decimal}} /uvm_root/uvm_test_top/env_h/agent_in_h/monitor_h/tr
add wave -noupdate /top/sqrt_vi_out/valid
add wave -noupdate /top/sqrt_vi_out/busy
add wave -noupdate -radix decimal /top/sqrt_vi_out/root
add wave -noupdate -radix decimal /top/sqrt_vi_out/rem
add wave -noupdate -childformat {{/uvm_root/uvm_test_top/env_h/refmod_h/tr_out.t0.root -radix decimal}} -expand -subitemconfig {/uvm_root/uvm_test_top/env_h/refmod_h/tr_out.t0.root {-radix decimal}} /uvm_root/uvm_test_top/env_h/refmod_h/tr_out

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
