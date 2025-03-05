# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
session_root "~/dev" # ~/dev folder

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "myDev"; then
  # new_window "misc"
  # load_window "example"
  # select_window 1
  # window_root "~/dev"

  new_window "Dev Window"
  split_v 20
  run_cmd "ls" # ls the ~/dev foldery 
  select_pane 0
  run_cmd "rgr"  # open ranger file explorer on ~/dev folder
  split_h 60
  run_cmd "btop"
  # run_cmd "z dot" # cd to /Downloads/dotfiles
  # run_cmd "lg" # run lazygit
  select_pane 0 # make nvim pane active
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
