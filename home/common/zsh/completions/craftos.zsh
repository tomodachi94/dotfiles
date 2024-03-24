#compdef craftos

_craftos() {
 local -a options
 options=(
    "(-d --directory)'{-d,--directory}'[Sets the directory that stores user data]: :_directories"
    "(--mc-save)'{-m,--mc-save}'[Uses the selected Minecraft save name for computer data]: :_arguments"
    "(--rom)'{-r,--rom}'[Sets the directory that holds the ROM & BIOS]: :_directories"
    "(-i --id)'{-i,--id}'[Sets the ID of the computer that will launch]: :_arguments"
    "(--script)'{-s,--script}'[Sets a script to be run before starting the shell]: :_files"
    "(--exec)'{-e,--exec}'[Sets Lua code to be run before starting the shell]: :_arguments"
    "(--args)'{-a,--args}'[Sets arguments to be passed to the file in --script]: :_arguments"
    "(--mount --mount-ro --mount-rw)'{-m,--mount}'[Automatically mounts a directory at startup]: :_directories"
    "(--mount-ro)'{-mr,--mount-ro}'[Forces mount to be read-only]: :_directories"
    "(--mount-rw)'{-mw,--mount-rw}'[Forces mount to be read-write]: :_directories"
    "(-h -? --help)'{-h,-?,--help}'[Shows this help message]"
    "(-V --version)'{-V,--version}'[Shows the current version]"
    "(--gui)'{-g,--gui}'[Outputs to a GUI terminal]"
    "(-c --cli)'{-c,--cli}'[Outputs using an ncurses-based interface]"
    "(--headless)'{-h,--headless}'[Outputs only text straight to stdout]"
    "(--raw)'{-r,--raw}'[Outputs terminal contents using a binary format]"
    "(--raw-client)'{-rc,--raw-client}'[Renders raw output from another terminal (GUI only)]"
    "(--raw-websocket)'{-rw,--raw-websocket}'[Like --raw-client, but connects to a WebSocket server]: :_urls"
    "(--tror)'{-t,--tror}'[Outputs TRoR (terminal redirect over Rednet) packets]"
    "(--hardware)'{-hw,--hardware}'[Outputs to a GUI terminal with hardware acceleration]"
    "(--single)'{-s,--single}'[Forces all screen output to a single window]"
    "(-a --assets-dir)'{-a,--assets-dir}'[Sets the CC:T directory that holds the ROM & BIOS]: :_directories"
    "(-C --computers-dir)'{-C,--computers-dir}'[Sets the directory that stores data for each computer]: :_directories"
    "(-c= --start-dir)'{-c=,--start-dir}'[Sets the directory that holds the startup computer's files]: :_directories"
    "(-d --data-dir)'{-d,--data-dir}'[Sets the directory that stores user data]: :_directories"
    "(--plugin)'{-p,--plugin}'[Adds an additional plugin to the load list]: :_files"
    "(-r --renderer)'{-r,--renderer}'[Lists all available renderers, or selects the renderer]: :_arguments"
 )

 _arguments -s -S $options
}

