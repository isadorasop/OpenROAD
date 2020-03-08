source helpers.tcl
psn::set_log_pattern "\[%^%l%$\] %v"
puts [psn::has_transform gate_clone]
read_lef ../tests/data/libraries/Nangate45/NangateOpenCellLibrary.mod.lef
read_def clone1.def
read_liberty ../tests/data/libraries/Nangate45/NangateOpenCellLibrary_typical.lib
set_psn_wire_rc -resistance 0.0020 -capacitance 0.00020
optimize_design -no_pin_swap -clone_max_cap_factor 1.5
set def_file [make_result_file clone1.def]
write_def $def_file
diff_file $def_file clone1.defok