set_global_assignment -entity "Pll" -library "lib_Pll" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "Pll" -library "lib_Pll" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "Pll" -library "lib_Pll" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_Pll" -name SPD_FILE [file join $::quartus(sip_path) "../Pll.spd"]
set_global_assignment -library "lib_Pll" -name MISC_FILE [file join $::quartus(sip_path) "../../Pll.qsys"]

set_global_assignment -library "lib_Pll" -name MISC_FILE [file join $::quartus(sip_path) "Pll.v"]
set_global_assignment -library "lib_Pll" -name MISC_FILE [file join $::quartus(sip_path) "submodules/Pll_altpll_0.vo"]
