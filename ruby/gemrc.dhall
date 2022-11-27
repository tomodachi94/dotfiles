let home = env:HOME as Text
in { gemhome = "${home}/.local/lib/ruby/gems"
, gempath = [ "${home}/.local/lib/ruby/gems", "/usr/lib/ruby/gems" ]
}
