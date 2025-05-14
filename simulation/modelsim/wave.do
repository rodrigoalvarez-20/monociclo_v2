onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /monociclo/clk_i
add wave -noupdate /monociclo/rst_ni
add wave -noupdate /monociclo/monitor_o
add wave -noupdate /monociclo/if_inst_w
add wave -noupdate -radix hexadecimal -childformat {{{/monociclo/if_instblock_w[63]} -radix hexadecimal} {{/monociclo/if_instblock_w[62]} -radix hexadecimal} {{/monociclo/if_instblock_w[61]} -radix hexadecimal} {{/monociclo/if_instblock_w[60]} -radix hexadecimal} {{/monociclo/if_instblock_w[59]} -radix hexadecimal} {{/monociclo/if_instblock_w[58]} -radix hexadecimal} {{/monociclo/if_instblock_w[57]} -radix hexadecimal} {{/monociclo/if_instblock_w[56]} -radix hexadecimal} {{/monociclo/if_instblock_w[55]} -radix hexadecimal} {{/monociclo/if_instblock_w[54]} -radix hexadecimal} {{/monociclo/if_instblock_w[53]} -radix hexadecimal} {{/monociclo/if_instblock_w[52]} -radix hexadecimal} {{/monociclo/if_instblock_w[51]} -radix hexadecimal} {{/monociclo/if_instblock_w[50]} -radix hexadecimal} {{/monociclo/if_instblock_w[49]} -radix hexadecimal} {{/monociclo/if_instblock_w[48]} -radix hexadecimal} {{/monociclo/if_instblock_w[47]} -radix hexadecimal} {{/monociclo/if_instblock_w[46]} -radix hexadecimal} {{/monociclo/if_instblock_w[45]} -radix hexadecimal} {{/monociclo/if_instblock_w[44]} -radix hexadecimal} {{/monociclo/if_instblock_w[43]} -radix hexadecimal} {{/monociclo/if_instblock_w[42]} -radix hexadecimal} {{/monociclo/if_instblock_w[41]} -radix hexadecimal} {{/monociclo/if_instblock_w[40]} -radix hexadecimal} {{/monociclo/if_instblock_w[39]} -radix hexadecimal} {{/monociclo/if_instblock_w[38]} -radix hexadecimal} {{/monociclo/if_instblock_w[37]} -radix hexadecimal} {{/monociclo/if_instblock_w[36]} -radix hexadecimal} {{/monociclo/if_instblock_w[35]} -radix hexadecimal} {{/monociclo/if_instblock_w[34]} -radix hexadecimal} {{/monociclo/if_instblock_w[33]} -radix hexadecimal} {{/monociclo/if_instblock_w[32]} -radix hexadecimal} {{/monociclo/if_instblock_w[31]} -radix hexadecimal} {{/monociclo/if_instblock_w[30]} -radix hexadecimal} {{/monociclo/if_instblock_w[29]} -radix hexadecimal} {{/monociclo/if_instblock_w[28]} -radix hexadecimal} {{/monociclo/if_instblock_w[27]} -radix hexadecimal} {{/monociclo/if_instblock_w[26]} -radix hexadecimal} {{/monociclo/if_instblock_w[25]} -radix hexadecimal} {{/monociclo/if_instblock_w[24]} -radix hexadecimal} {{/monociclo/if_instblock_w[23]} -radix hexadecimal} {{/monociclo/if_instblock_w[22]} -radix hexadecimal} {{/monociclo/if_instblock_w[21]} -radix hexadecimal} {{/monociclo/if_instblock_w[20]} -radix hexadecimal} {{/monociclo/if_instblock_w[19]} -radix hexadecimal} {{/monociclo/if_instblock_w[18]} -radix hexadecimal} {{/monociclo/if_instblock_w[17]} -radix hexadecimal} {{/monociclo/if_instblock_w[16]} -radix hexadecimal} {{/monociclo/if_instblock_w[15]} -radix hexadecimal} {{/monociclo/if_instblock_w[14]} -radix hexadecimal} {{/monociclo/if_instblock_w[13]} -radix hexadecimal} {{/monociclo/if_instblock_w[12]} -radix hexadecimal} {{/monociclo/if_instblock_w[11]} -radix hexadecimal} {{/monociclo/if_instblock_w[10]} -radix hexadecimal} {{/monociclo/if_instblock_w[9]} -radix hexadecimal} {{/monociclo/if_instblock_w[8]} -radix hexadecimal} {{/monociclo/if_instblock_w[7]} -radix hexadecimal} {{/monociclo/if_instblock_w[6]} -radix hexadecimal} {{/monociclo/if_instblock_w[5]} -radix hexadecimal} {{/monociclo/if_instblock_w[4]} -radix hexadecimal} {{/monociclo/if_instblock_w[3]} -radix hexadecimal} {{/monociclo/if_instblock_w[2]} -radix hexadecimal} {{/monociclo/if_instblock_w[1]} -radix hexadecimal} {{/monociclo/if_instblock_w[0]} -radix hexadecimal}} -subitemconfig {{/monociclo/if_instblock_w[63]} {-radix hexadecimal} {/monociclo/if_instblock_w[62]} {-radix hexadecimal} {/monociclo/if_instblock_w[61]} {-radix hexadecimal} {/monociclo/if_instblock_w[60]} {-radix hexadecimal} {/monociclo/if_instblock_w[59]} {-radix hexadecimal} {/monociclo/if_instblock_w[58]} {-radix hexadecimal} {/monociclo/if_instblock_w[57]} {-radix hexadecimal} {/monociclo/if_instblock_w[56]} {-radix hexadecimal} {/monociclo/if_instblock_w[55]} {-radix hexadecimal} {/monociclo/if_instblock_w[54]} {-radix hexadecimal} {/monociclo/if_instblock_w[53]} {-radix hexadecimal} {/monociclo/if_instblock_w[52]} {-radix hexadecimal} {/monociclo/if_instblock_w[51]} {-radix hexadecimal} {/monociclo/if_instblock_w[50]} {-radix hexadecimal} {/monociclo/if_instblock_w[49]} {-radix hexadecimal} {/monociclo/if_instblock_w[48]} {-radix hexadecimal} {/monociclo/if_instblock_w[47]} {-radix hexadecimal} {/monociclo/if_instblock_w[46]} {-radix hexadecimal} {/monociclo/if_instblock_w[45]} {-radix hexadecimal} {/monociclo/if_instblock_w[44]} {-radix hexadecimal} {/monociclo/if_instblock_w[43]} {-radix hexadecimal} {/monociclo/if_instblock_w[42]} {-radix hexadecimal} {/monociclo/if_instblock_w[41]} {-radix hexadecimal} {/monociclo/if_instblock_w[40]} {-radix hexadecimal} {/monociclo/if_instblock_w[39]} {-radix hexadecimal} {/monociclo/if_instblock_w[38]} {-radix hexadecimal} {/monociclo/if_instblock_w[37]} {-radix hexadecimal} {/monociclo/if_instblock_w[36]} {-radix hexadecimal} {/monociclo/if_instblock_w[35]} {-radix hexadecimal} {/monociclo/if_instblock_w[34]} {-radix hexadecimal} {/monociclo/if_instblock_w[33]} {-radix hexadecimal} {/monociclo/if_instblock_w[32]} {-radix hexadecimal} {/monociclo/if_instblock_w[31]} {-radix hexadecimal} {/monociclo/if_instblock_w[30]} {-radix hexadecimal} {/monociclo/if_instblock_w[29]} {-radix hexadecimal} {/monociclo/if_instblock_w[28]} {-radix hexadecimal} {/monociclo/if_instblock_w[27]} {-radix hexadecimal} {/monociclo/if_instblock_w[26]} {-radix hexadecimal} {/monociclo/if_instblock_w[25]} {-radix hexadecimal} {/monociclo/if_instblock_w[24]} {-radix hexadecimal} {/monociclo/if_instblock_w[23]} {-radix hexadecimal} {/monociclo/if_instblock_w[22]} {-radix hexadecimal} {/monociclo/if_instblock_w[21]} {-radix hexadecimal} {/monociclo/if_instblock_w[20]} {-radix hexadecimal} {/monociclo/if_instblock_w[19]} {-radix hexadecimal} {/monociclo/if_instblock_w[18]} {-radix hexadecimal} {/monociclo/if_instblock_w[17]} {-radix hexadecimal} {/monociclo/if_instblock_w[16]} {-radix hexadecimal} {/monociclo/if_instblock_w[15]} {-radix hexadecimal} {/monociclo/if_instblock_w[14]} {-radix hexadecimal} {/monociclo/if_instblock_w[13]} {-radix hexadecimal} {/monociclo/if_instblock_w[12]} {-radix hexadecimal} {/monociclo/if_instblock_w[11]} {-radix hexadecimal} {/monociclo/if_instblock_w[10]} {-radix hexadecimal} {/monociclo/if_instblock_w[9]} {-radix hexadecimal} {/monociclo/if_instblock_w[8]} {-radix hexadecimal} {/monociclo/if_instblock_w[7]} {-radix hexadecimal} {/monociclo/if_instblock_w[6]} {-radix hexadecimal} {/monociclo/if_instblock_w[5]} {-radix hexadecimal} {/monociclo/if_instblock_w[4]} {-radix hexadecimal} {/monociclo/if_instblock_w[3]} {-radix hexadecimal} {/monociclo/if_instblock_w[2]} {-radix hexadecimal} {/monociclo/if_instblock_w[1]} {-radix hexadecimal} {/monociclo/if_instblock_w[0]} {-radix hexadecimal}} /monociclo/if_instblock_w
add wave -noupdate /monociclo/hit_w
add wave -noupdate /monociclo/opcode_w
add wave -noupdate -radix hexadecimal /monociclo/pc_next_w
add wave -noupdate /monociclo/iq_full_w
add wave -noupdate /monociclo/iq_empty_w
add wave -noupdate /monociclo/rf_write_w
add wave -noupdate /monociclo/rf_rd_w
add wave -noupdate /monociclo/rf_rs1_w
add wave -noupdate /monociclo/rf_rs2_w
add wave -noupdate /monociclo/rf_dators1_w
add wave -noupdate /monociclo/rf_dators2_w
add wave -noupdate -divider Fetchy
add wave -noupdate /monociclo/fetch_stg/clk_i
add wave -noupdate /monociclo/fetch_stg/rst_ni
add wave -noupdate -radix hexadecimal /monociclo/fetch_stg/if_instblock_i
add wave -noupdate /monociclo/fetch_stg/hit_i
add wave -noupdate -radix hexadecimal /monociclo/fetch_stg/pc_next_o
add wave -noupdate /monociclo/fetch_stg/if_inst_o
add wave -noupdate /monociclo/fetch_stg/iq_full_w
add wave -noupdate -radix hexadecimal /monociclo/fetch_stg/pc_w
add wave -noupdate /monociclo/fetch_stg/iq_empty_w
add wave -noupdate -divider Kiwi
add wave -noupdate /monociclo/icachel1/clk_i
add wave -noupdate /monociclo/icachel1/rst_ni
add wave -noupdate -radix hexadecimal /monociclo/icachel1/pc_i
add wave -noupdate /monociclo/icachel1/we_i
add wave -noupdate /monociclo/icachel1/inst_i
add wave -noupdate /monociclo/icachel1/re_i
add wave -noupdate -radix hexadecimal /monociclo/icachel1/inst_o
add wave -noupdate /monociclo/icachel1/hit
add wave -noupdate -radix hexadecimal /monociclo/icachel1/memoria
add wave -noupdate /monociclo/icachel1/valid
add wave -noupdate /monociclo/icachel1/tag
add wave -noupdate /monociclo/icachel1/idx_w
add wave -noupdate /monociclo/icachel1/tag_iw
add wave -noupdate /monociclo/icachel1/idx_r
add wave -noupdate /monociclo/icachel1/tag_mw
add wave -noupdate /monociclo/icachel1/valid_w
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {747 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 123
configure wave -valuecolwidth 416
configure wave -justifyvalue left
configure wave -signalnamewidth 1
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
WaveRestoreZoom {464 ps} {1134 ps}
