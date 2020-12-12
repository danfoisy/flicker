set_global_assignment -entity "FrameBuf_lg" -library "lib_FrameBuf_lg" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "FrameBuf_lg" -library "lib_FrameBuf_lg" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "FrameBuf_lg" -library "lib_FrameBuf_lg" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_FrameBuf_lg" -name SPD_FILE [file join $::quartus(sip_path) "../FrameBuf_lg.spd"]
set_global_assignment -library "lib_FrameBuf_lg" -name MISC_FILE [file join $::quartus(sip_path) "../../FrameBuf_lg.qsys"]

set_global_assignment -library "lib_FrameBuf_lg" -name MISC_FILE [file join $::quartus(sip_path) "FrameBuf_lg.v"]
set_global_assignment -library "lib_FrameBuf_lg" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FrameBuf_lg_onchip_memory2_0.hex"]
set_global_assignment -library "lib_FrameBuf_lg" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FrameBuf_lg_onchip_memory2_0.v"]
