set_global_assignment -entity "FrameBuf_single" -library "lib_FrameBuf_single" -name IP_TOOL_NAME "Qsys"
set_global_assignment -entity "FrameBuf_single" -library "lib_FrameBuf_single" -name IP_TOOL_VERSION "18.1"
set_global_assignment -entity "FrameBuf_single" -library "lib_FrameBuf_single" -name IP_TOOL_ENV "Qsys"
set_global_assignment -library "lib_FrameBuf_single" -name SPD_FILE [file join $::quartus(sip_path) "../FrameBuf_single.spd"]
set_global_assignment -library "lib_FrameBuf_single" -name MISC_FILE [file join $::quartus(sip_path) "../../FrameBuf_single.qsys"]

set_global_assignment -library "lib_FrameBuf_single" -name MISC_FILE [file join $::quartus(sip_path) "FrameBuf_single.v"]
set_global_assignment -library "lib_FrameBuf_single" -name MISC_FILE [file join $::quartus(sip_path) "submodules/FrameBuf_single_onchip_memory2_0.v"]
