database -open waves -shm
probe -create -database waves -all -depth all -variables -transactions

# Configuração de radix para sinais
gui_set_radix -radix {decimal} -signals {waves::top.sqrt_vi_in.rad}
gui_set_radix -radix {decimal} -signals {waves::top.sqrt_vi_out.root}
gui_set_radix -radix {decimal} -signals {waves::top.sqrt_vi_out.rem}

set TopLevel.1 TopLevel.1
set Wave.1 [gui_create_window -type {Wave} -parent ${TopLevel.1}]

# Grupo de transações
set _session_group_1 transaction
gui_sg_create "$_session_group_1"
set transaction "$_session_group_1"

# Adicionar sinais ao grupo
gui_sg_addsignal -group "$_session_group_1" { 
    {uvm_test_top$env_h$agent_in_h$sequencer_h}
    top.sqrt_vi_in.clk
    top.sqrt_vi_in.start
    top.sqrt_vi_in.valid
    top.sqrt_vi_in.rad
    {uvm_test_top_env_h_agent_in_h_monitor_h_tr}
    top.sqrt_vi_out.valid
    top.sqrt_vi_out.busy
    top.sqrt_vi_out.root
    top.sqrt_vi_out.rem
    {uvm_test_top_env_h_refmod_h_tr_out}
} -objtype stream

# Configuração da janela de wave
gui_list_add_group -id ${Wave.1} -after {New Group} {transaction}
gui_list_set_height -id ${Wave.1} -height 131 -name {V1:uvm_test_top$env_h$agent_in_h$sequencer_h} -occurrence 1 -group ${transaction}
gui_list_set_height -id ${Wave.1} -height 80 -name {V1:uvm_test_top_env_h_agent_in_h_monitor_h_tr} -occurrence 1 -group ${transaction}
gui_list_set_height -id ${Wave.1} -height 80 -name {V1:uvm_test_top_env_h_refmod_h_tr_out} -occurrence 1 -group ${transaction}

# Fechar janelas desnecessárias
gui_close_window -type HSPane
gui_close_window -type DLPane
gui_close_window -type Transaction
gui_close_window -type Source
gui_close_window -type Console

# Zoom inicial
gui_wv_zoom_timerange -id ${Wave.1} 0 1000