set_global_assignment -entity "sdram" -library "lib_sdram" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "sdram" -library "lib_sdram" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "sdram" -library "lib_sdram" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_sdram" -name SPD_FILE [file join $::quartus(sip_path) "../sdram.spd"]
set_global_assignment -library "lib_sdram" -name MISC_FILE [file join $::quartus(sip_path) "../../sdram.qsys"]

set_global_assignment -library "lib_sdram" -name MISC_FILE [file join $::quartus(sip_path) "sdram.v"]
set_global_assignment -library "lib_sdram" -name MISC_FILE [file join $::quartus(sip_path) "submodules/sdram_new_sdram_controller_0.v"]
set_global_assignment -library "lib_sdram" -name MISC_FILE [file join $::quartus(sip_path) "submodules/sdram_new_sdram_controller_0_test_component.v"]
