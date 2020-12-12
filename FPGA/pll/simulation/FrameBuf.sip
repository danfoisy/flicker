set_global_assignment -entity "FrameBuf" -library "lib_FrameBuf" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "FrameBuf" -library "lib_FrameBuf" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "FrameBuf" -library "lib_FrameBuf" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_FrameBuf" -name SPD_FILE [file join $::quartus(sip_path) "../FrameBuf.spd"]
set_global_assignment -library "lib_FrameBuf" -name MISC_FILE [file join $::quartus(sip_path) "../../FrameBuf.qsys"]

set_global_assignment -library "lib_FrameBuf" -name MISC_FILE [file join $::quartus(sip_path) "FrameBuf.v"]
set_global_assignment -library "lib_FrameBuf" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FrameBuf_onchip_memory2_0.hex"]
set_global_assignment -library "lib_FrameBuf" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FrameBuf_onchip_memory2_0.v"]
