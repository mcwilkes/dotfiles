# config.nu
#
# Installed by:
# version = "0.103.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

# edit_mode (string) "vi" or "emacs" sets the editing behavior of Reedline
$env.config.edit_mode = "vi"

# When in Emacs mode (default):
$env.PROMPT_INDICATOR = " - NU> "

# When in normal vi mode:
$env.PROMPT_INDICATOR_VI_NORMAL = " - NU> "
# When in vi insert-mode:
$env.PROMPT_INDICATOR_VI_INSERT = " - NU: "

# When a commandline extends across multiple lines:
$env.PROMPT_MULTILINE_INDICATOR = " - NU::: "
t
# $env.config = {
# }

alias cls = clear
alias x = exit
alias ll = ls -lta
alias z = zoxide
alias y = yazi
alias rgr = ranger
