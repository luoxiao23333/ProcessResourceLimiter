Time	Sum	Command
17	8325	> __fish_on_interactive
198	8296	-> __fish_config_interactive
907	917	--> source /usr/share/fish/functions/__fish_config_interactive.fish
10	10	---> function __fish_config_interactive -d "Initializations that should be performed when entering interactive mode"...
2	21	--> if test $__fish_initialized -lt 3000...
19	19	---> test $__fish_initialized -lt 3000
2	9	--> if set -q __fish_config_interactive_done...
7	7	---> set -q __fish_config_interactive_done
10	10	--> set -g __fish_config_interactive_done
9	9	--> set -g __fish_active_key_bindings
7	7	--> function __init_uvar -d "Sets a universal variable if it's not already set"...
1	13	--> if test $__fish_initialized -lt 3100...
12	12	---> test $__fish_initialized -lt 3100
12	56	--> if not set -q FISH_UNIT_TESTS_RUNNING...
7	7	---> not set -q FISH_UNIT_TESTS_RUNNING
15	15	---> set -l script $__fish_data_dir/tools/create_manpage_completions.py
2	22	---> if not test -d $__fish_user_data_dir/generated_completions...
20	20	----> not test -d $__fish_user_data_dir/generated_completions
7	1253	--> if status --is-interactive...
6	6	---> status --is-interactive
174	344	---> functions -q fish_greeting
154	170	----> source /usr/share/fish/functions/fish_greeting.fish
16	16	-----> function fish_greeting...
24	896	---> fish_greeting
10	787	----> if not set -q fish_greeting...
9	9	-----> not set -q fish_greeting
113	297	-----> set -l line1 (_ 'Welcome to fish, the friendly interactive shell')
184	184	------> _ 'Welcome to fish, the friendly interactive shell'
113	448	-----> set -l line2 \n(printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal))
215	335	------> printf (_ 'Type %shelp%s for instructions on how to use fish') (set_color green) (set_color normal)
43	43	-------> _ 'Type %shelp%s for instructions on how to use fish'
63	63	-------> set_color green
14	14	-------> set_color normal
23	23	-----> set -g fish_greeting "$line1$line2"
3	9	----> if set -q fish_private_mode...
6	6	-----> set -q fish_private_mode
12	12	----> test -n "$fish_greeting"
64	64	----> echo $fish_greeting
19	158	--> if test -d /etc/init.d...
11	11	---> test -d /etc/init.d
59	59	---> complete -x -p "/etc/init.d/*" -a start --description 'Start service'
18	18	---> complete -x -p "/etc/init.d/*" -a stop --description 'Stop service'
17	17	---> complete -x -p "/etc/init.d/*" -a status --description 'Print service status'
17	17	---> complete -x -p "/etc/init.d/*" -a restart --description 'Stop and then start service'
17	17	---> complete -x -p "/etc/init.d/*" -a reload --description 'Reload service configuration'
12	12	--> complete -c [ --wraps test
9	9	--> complete -c ! --wraps not
248	494	--> complete -c(builtin -n | string match -rv '(\.|:|source|cd|contains|count|echo|exec|printf|random|realpath|set|\\[|test|for)') --no-files
246	246	---> builtin -n | string match -rv '(\.|:|source|cd|contains|count|echo|exec|printf|random|realpath|set|\\[|test|for)'
13	13	--> function __fish_reload_key_bindings -d "Reload key bindings when binding variable change" --on-variable fish_key_bindings...
32	4673	--> __fish_reload_key_bindings
23	43	---> __init_uvar fish_key_bindings fish_default_key_bindings
6	20	----> if not set --query $argv[1]...
14	14	-----> not set --query $argv[1]
1	25	---> if test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"...
24	24	----> test "$fish_key_bindings" = "$__fish_active_key_bindings" -a -n "$fish_key_bindings"
3	705	---> if not functions -q "$fish_key_bindings"...
149	702	----> not functions -q "$fish_key_bindings"
539	553	-----> source /usr/share/fish/functions/fish_default_key_bindings.fish
14	14	------> function fish_default_key_bindings -d "Default (Emacs-like) key bindings for fish"...
21	21	---> set -g __fish_active_key_bindings "$fish_key_bindings"
9	9	---> set -g fish_bind_mode default
7	3768	---> if test "$fish_key_bindings" = fish_default_key_bindings...
12	12	----> test "$fish_key_bindings" = fish_default_key_bindings
125	3749	----> fish_default_key_bindings 2>/dev/null
4	27	-----> if contains -- -h $argv...
13	13	------> contains -- -h $argv
10	10	------> contains -- --help $argv
9	82	-----> if not set -q argv[1]...
8	8	------> not set -q argv[1]
44	44	------> bind --erase --all --preset
1	21	------> if test "$fish_key_bindings" != fish_default_key_bindings...
20	20	-------> test "$fish_key_bindings" != fish_default_key_bindings
6	28	-----> if not contains -- -s $argv...
10	10	------> not contains -- -s $argv
12	12	------> set argv -s $argv
292	2783	-----> __fish_shared_key_bindings $argv
801	826	------> source /usr/share/fish/functions/__fish_shared_key_bindings.fish
11	11	-------> function __fish_shared_key_bindings -d "Bindings shared between emacs and vi mode"...
8	8	-------> function __fish_commandline_insert_escaped --description 'Insert the first arg escaped if a second arg is given'...
3	3	-------> function __fish_start_bracketed_paste...
3	3	-------> function __fish_stop_bracketed_paste...
4	28	------> if contains -- -h $argv...
14	14	-------> contains -- -h $argv
10	10	-------> contains -- --help $argv
16	16	------> bind --preset $argv \cy yank
14	14	------> bind --preset $argv \ey yank-pop
17	17	------> bind --preset $argv -k right forward-char
14	14	------> bind --preset $argv -k left backward-char
13	13	------> bind --preset $argv \e\[C forward-char
13	13	------> bind --preset $argv \e\[D backward-char
12	12	------> bind --preset $argv \eOC forward-char
12	12	------> bind --preset $argv \eOD backward-char
14	14	------> bind --preset $argv \e\[1\;5C forward-word
12	12	------> bind --preset $argv \e\[1\;5D backward-word
14	14	------> bind --preset $argv -k ppage beginning-of-history
13	13	------> bind --preset $argv -k npage end-of-history
12	12	------> bind --preset $argv \cx fish_clipboard_copy
12	12	------> bind --preset $argv \cv fish_clipboard_paste
12	12	------> bind --preset $argv \e cancel
13	13	------> bind --preset $argv \t complete
12	12	------> bind --preset $argv \cs pager-toggle-search
14	14	------> bind --preset $argv --key btab complete-and-search
15	15	------> bind --preset $argv \e\n "commandline -f expand-abbr; commandline -i \n"
14	14	------> bind --preset $argv \e\r "commandline -f expand-abbr; commandline -i \n"
23	23	------> bind --preset $argv -k down down-or-search
15	15	------> bind --preset $argv -k up up-or-search
13	13	------> bind --preset $argv \e\[A up-or-search
12	12	------> bind --preset $argv \e\[B down-or-search
11	11	------> bind --preset $argv \eOA up-or-search
11	11	------> bind --preset $argv \eOB down-or-search
19	19	------> bind --preset $argv -k sright forward-bigword
15	15	------> bind --preset $argv -k sleft backward-bigword
14	14	------> bind --preset $argv \e\eOC nextd-or-forward-word
13	13	------> bind --preset $argv \e\eOD prevd-or-backward-word
14	14	------> bind --preset $argv \e\e\[C nextd-or-forward-word
13	13	------> bind --preset $argv \e\e\[D prevd-or-backward-word
12	12	------> bind --preset $argv \eO3C nextd-or-forward-word
12	12	------> bind --preset $argv \eO3D prevd-or-backward-word
13	13	------> bind --preset $argv \e\[3C nextd-or-forward-word
12	12	------> bind --preset $argv \e\[3D prevd-or-backward-word
19	19	------> bind --preset $argv \e\[1\;3C nextd-or-forward-word
14	14	------> bind --preset $argv \e\[1\;3D prevd-or-backward-word
13	13	------> bind --preset $argv \e\[1\;9C nextd-or-forward-word
13	13	------> bind --preset $argv \e\[1\;9D prevd-or-backward-word
13	13	------> bind --preset $argv \e\eOA history-token-search-backward
13	13	------> bind --preset $argv \e\eOB history-token-search-forward
13	13	------> bind --preset $argv \e\e\[A history-token-search-backward
13	13	------> bind --preset $argv \e\e\[B history-token-search-forward
13	13	------> bind --preset $argv \eO3A history-token-search-backward
14	14	------> bind --preset $argv \eO3B history-token-search-forward
14	14	------> bind --preset $argv \e\[3A history-token-search-backward
13	13	------> bind --preset $argv \e\[3B history-token-search-forward
14	14	------> bind --preset $argv \e\[1\;3A history-token-search-backward
14	14	------> bind --preset $argv \e\[1\;3B history-token-search-forward
13	13	------> bind --preset $argv \e\[1\;9A history-token-search-backward
16	16	------> bind --preset $argv \e\[1\;9B history-token-search-forward
13	13	------> bind --preset $argv \e. history-token-search-backward
13	13	------> bind --preset $argv \el __fish_list_current_token
13	13	------> bind --preset $argv \eo __fish_preview_current_file
13	13	------> bind --preset $argv \ew __fish_whatis_current_token
15	15	------> bind --preset $argv \cl 'echo -n (clear | string replace \e\[3J ""); commandline -f repaint'
12	12	------> bind --preset $argv \cc cancel-commandline
13	13	------> bind --preset $argv \cu backward-kill-line
12	12	------> bind --preset $argv \cw backward-kill-path-component
13	13	------> bind --preset $argv \e\[F end-of-line
13	13	------> bind --preset $argv \e\[H beginning-of-line
18	18	------> bind --preset $argv \ed 'set -l cmd (commandline); if test -z "$cmd"; echo; dirh; commandline -f repaint; else; commandline -f kill-word; end'
13	13	------> bind --preset $argv \cd delete-or-exit
14	14	------> bind --preset $argv \es "fish_commandline_prepend sudo"
14	14	------> bind --preset $argv -k f1 __fish_man_page
13	13	------> bind --preset $argv \eh __fish_man_page
16	16	------> bind --preset $argv \ep __fish_paginate
20	20	------> bind --preset $argv \e\# __fish_toggle_comment_commandline
14	14	------> bind --preset $argv \ee edit_command_buffer
13	13	------> bind --preset $argv \ev edit_command_buffer
132	322	------> for mode in (bind --list-modes | string match -v paste)...
134	134	-------> bind --list-modes | string match -v paste
24	24	-------> bind --preset -M $mode \e\[I 'emit fish_focus_in'
16	16	-------> bind --preset -M $mode \e\[O false
16	16	-------> bind --preset -M $mode \e\[\?1004h false
120	261	------> for mode in (bind --list-modes | string match -v paste)...
117	117	-------> bind --list-modes | string match -v paste
24	24	-------> bind --preset -M $mode -m paste \e\[200~ __fish_start_bracketed_paste
13	13	------> bind --preset -M paste \e\[201~ __fish_stop_bracketed_paste
11	11	------> bind --preset -M paste "" self-insert
13	13	------> bind --preset -M paste \r "commandline -i \n"
15	15	------> bind --preset -M paste "'" "__fish_commandline_insert_escaped \' \$__fish_paste_quoted"
14	14	------> bind --preset -M paste \\ "__fish_commandline_insert_escaped \\\ \$__fish_paste_quoted"
11	11	------> bind --preset -M paste " " self-insert-notfirst
13	13	-----> bind --preset $argv "" self-insert
15	15	-----> bind --preset $argv " " self-insert expand-abbr
15	15	-----> bind --preset $argv ";" self-insert expand-abbr
14	14	-----> bind --preset $argv "|" self-insert expand-abbr
14	14	-----> bind --preset $argv "&" self-insert expand-abbr
14	14	-----> bind --preset $argv "^" self-insert expand-abbr
13	13	-----> bind --preset $argv ">" self-insert expand-abbr
13	13	-----> bind --preset $argv "<" self-insert expand-abbr
14	14	-----> bind --preset $argv ")" self-insert expand-abbr
17	17	-----> bind --preset $argv -k nul 'commandline -i " "'
12	12	-----> bind --preset $argv \n execute
13	13	-----> bind --preset $argv \r execute
13	13	-----> bind --preset $argv \ck kill-line
12	12	-----> bind --preset $argv \eOC forward-char
11	11	-----> bind --preset $argv \eOD backward-char
11	11	-----> bind --preset $argv \e\[C forward-char
12	12	-----> bind --preset $argv \e\[D backward-char
14	14	-----> bind --preset $argv -k right forward-char
13	13	-----> bind --preset $argv -k left backward-char
14	14	-----> bind --preset $argv -k dc delete-char
13	13	-----> bind --preset $argv -k backspace backward-delete-char
12	12	-----> bind --preset $argv \x7f backward-delete-char
19	19	-----> bind --preset $argv \e\[1~ beginning-of-line
13	13	-----> bind --preset $argv \e\[3~ delete-char
14	14	-----> bind --preset $argv \e\[4~ end-of-line
14	14	-----> bind --preset $argv -k home beginning-of-line
13	13	-----> bind --preset $argv -k end end-of-line
15	15	-----> bind --preset $argv \e\[3\;2~ backward-delete-char
13	13	-----> bind --preset $argv \ca beginning-of-line
13	13	-----> bind --preset $argv \ce end-of-line
12	12	-----> bind --preset $argv \ch backward-delete-char
13	13	-----> bind --preset $argv \cp up-or-search
13	13	-----> bind --preset $argv \cn down-or-search
13	13	-----> bind --preset $argv \cf forward-char
13	13	-----> bind --preset $argv \cb backward-char
13	13	-----> bind --preset $argv \ct transpose-chars
13	13	-----> bind --preset $argv \c_ undo
13	13	-----> bind --preset $argv \cz undo
14	14	-----> bind --preset $argv \e/ redo
13	13	-----> bind --preset $argv \et transpose-words
13	13	-----> bind --preset $argv \eu upcase-word
13	13	-----> bind --preset $argv \ec capitalize-word
14	14	-----> bind --preset $argv \e\x7f backward-kill-word
13	13	-----> bind --preset $argv \e\b backward-kill-word
14	14	-----> bind --preset $argv \eb backward-word
13	13	-----> bind --preset $argv \ef forward-word
13	13	-----> bind --preset $argv \e\< beginning-of-buffer
14	14	-----> bind --preset $argv \e\> end-of-buffer
12	12	-----> bind --preset $argv \ed kill-word
15	15	-----> bind --preset $argv \cr 'commandline | string length -q; and commandline -f history-search-backward'
18	34	-----> switch "$TERM"...
16	16	------> bind --preset $argv \e\x20ep fish_clipboard_paste
2	70	---> if functions --query fish_user_key_bindings >/dev/null...
68	68	----> functions --query fish_user_key_bindings >/dev/null
7	74	--> if not set -q FISH_UNIT_TESTS_RUNNING...
9	9	---> not set -q FISH_UNIT_TESTS_RUNNING
10	10	---> function __fish_enable_bracketed_paste --on-event fish_prompt --on-event fish_read...
7	7	---> function __fish_disable_bracketed_paste --on-event fish_preexec --on-event fish_exit...
16	41	---> __fish_enable_bracketed_paste
25	25	----> printf "\e[?2004h"
1	8	--> if set -q TMUX...
7	7	---> set -q TMUX
9	75	--> if not set -q fish_handle_reflow...
6	6	---> not set -q fish_handle_reflow
8	60	---> if set -q VTE_VERSION...
6	6	----> set -q VTE_VERSION
15	15	----> string match -q -- 'alacritty*' $TERM
14	14	----> string match -q -- '*kitty' $TERM
6	6	----> set -q KONSOLE_VERSION
11	11	----> set -g fish_handle_reflow 1
12	12	--> function __fish_winch_handler --on-signal WINCH -d "Repaint screen when window changes size"...
11	204	--> if not set -q FISH_UNIT_TESTS_RUNNING...
7	7	---> not set -q FISH_UNIT_TESTS_RUNNING
159	186	---> test 0"$VTE_VERSION" -ge 3405 -o "$TERM_PROGRAM" = Apple_Terminal -a (string match -r '\d+' 0"$TERM_PROGRAM_VERSION") -ge 309 -o "$TERM_PROGRAM" = WezTerm -o "$TERM" = foot
27	27	----> string match -r '\d+' 0"$TERM_PROGRAM_VERSION"
40	40	--> test -e $__fish_config_dir/completions/ -a -e $__fish_config_dir/conf.d/ -a -e $__fish_config_dir/functions/
14	14	--> test -e $__fish_config_dir/config.fish
17	17	--> set __fish_initialized 3100
12	12	-> functions -e __fish_on_interactive
64	74	> source /usr/share/fish/functions/fish_mode_prompt.fish
10	10	-> function fish_mode_prompt --description "Displays the current mode"...
20	340	> fish_mode_prompt
119	320	-> fish_default_mode_prompt
144	155	--> source /usr/share/fish/functions/fish_default_mode_prompt.fish
11	11	---> function fish_default_mode_prompt --description "Display the default mode for the prompt"...
5	46	--> if test "$fish_key_bindings" = fish_vi_key_bindings...
24	24	---> test "$fish_key_bindings" = fish_vi_key_bindings
17	17	---> test "$fish_key_bindings" = fish_hybrid_key_bindings
254	263	> source /usr/share/fish/functions/fish_prompt.fish
9	9	-> function fish_prompt --description 'Write out the prompt'...
65	24072	> fish_prompt
20	20	-> set -l last_pipestatus $pipestatus
14	14	-> set -lx __fish_last_status $status
76	90	-> set -l normal (set_color normal)
14	14	--> set_color normal
9	9	-> set -q fish_color_status
13	13	-> set -l color_cwd $fish_color_cwd
10	10	-> set -l suffix '>'
3	238	-> if functions -q fish_is_root_user...
102	190	--> functions -q fish_is_root_user
78	88	---> source /usr/share/fish/functions/fish_is_root_user.fish
10	10	----> function fish_is_root_user --description "Check if the user is root"...
20	45	--> fish_is_root_user
2	19	---> if contains -- $USER root toor Administrator...
17	17	----> contains -- $USER root toor Administrator
6	6	---> return 1
10	10	-> set -l bold_flag --bold
7	7	-> set -q __fish_prompt_status_generation
14	14	-> set -g __fish_prompt_status_generation $status_generation
7	29	-> if test $__fish_prompt_status_generation = $status_generation...
13	13	--> test $__fish_prompt_status_generation = $status_generation
9	9	--> set bold_flag
13	13	-> set __fish_prompt_status_generation $status_generation
65	86	-> set -l status_color (set_color $fish_color_status)
21	21	--> set_color $fish_color_status
64	85	-> set -l statusb_color (set_color $bold_flag $fish_color_status)
21	21	--> set_color $bold_flag $fish_color_status
63	582	-> set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
153	519	--> __fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus
225	235	---> source /usr/share/fish/functions/__fish_print_pipestatus.fish
10	10	----> function __fish_print_pipestatus --description "Print pipestatus for prompt"...
12	12	---> set -l last_status
5	30	---> if set -q __fish_last_status...
7	7	----> set -q __fish_last_status
18	18	----> set last_status $__fish_last_status
12	12	---> set -l left_brace $argv[1]
11	11	---> set -l right_brace $argv[2]
12	12	---> set -l separator $argv[3]
12	12	---> set -l brace_sep_color $argv[4]
11	11	---> set -l status_color $argv[5]
10	10	---> set -e argv[1 2 3 4 5]
2	8	---> if not set -q argv[1]...
6	6	----> not set -q argv[1]
1	13	---> if not contains $last_status 0 141...
12	12	----> not contains $last_status 0 141
238	22787	-> echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
107	989	--> prompt_login
195	205	---> source /usr/share/fish/functions/prompt_login.fish
10	10	----> function prompt_login --description "Print a description of the user and host suitable for the prompt"...
14	75	---> if not set -q __fish_machine...
11	11	----> not set -q __fish_machine
10	10	----> set -g __fish_machine
12	12	----> set -l debian_chroot $debian_chroot
2	19	----> if  test -r /etc/debian_chroot...
17	17	-----> test -r /etc/debian_chroot
2	9	----> if set -q debian_chroot[1]...
7	7	-----> set -q debian_chroot[1]
2	8	---> if set -q __fish_machine[1]...
6	6	----> set -q __fish_machine[1]
14	14	---> set -l color_host $fish_color_host
6	31	---> if set -q SSH_TTY...
6	6	----> set -q SSH_TTY
7	7	----> set -q fish_color_host_remote
12	12	----> set color_host $fish_color_host_remote
281	549	---> echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $color_host) (prompt_hostname) (set_color normal)
21	21	----> set_color $fish_color_user
15	15	----> set_color normal
19	19	----> set_color $color_host
107	198	----> prompt_hostname
56	61	-----> source /usr/share/fish/functions/prompt_hostname.fish
5	5	------> function prompt_hostname...
30	30	-----> string replace -r "\..*" "" $hostname
15	15	----> set_color normal
20	20	--> set_color $color_cwd
114	515	--> prompt_pwd
147	162	---> source /usr/share/fish/functions/prompt_pwd.fish
15	15	----> function prompt_pwd --description "Print the current working directory, shortened to fit the prompt"...
15	15	---> set -l options h/help
21	21	---> argparse -n prompt_pwd --max-args=0 $options -- $argv
1	8	---> if set -q _flag_help...
7	7	----> set -q _flag_help
7	7	---> set -q fish_prompt_pwd_dir_length
9	9	---> set -l fish_prompt_pwd_dir_length 1
14	14	---> set -l realhome ~
74	112	---> set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
38	38	----> string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
6	53	---> if [ $fish_prompt_pwd_dir_length -eq 0 ]...
16	16	----> [ $fish_prompt_pwd_dir_length -eq 0 ]
31	31	----> string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
105	21025	--> fish_vcs_prompt
69	79	---> source /usr/share/fish/functions/fish_vcs_prompt.fish
10	10	----> function fish_vcs_prompt --description "Print the prompts for all available vcsen"...
203	20841	---> fish_git_prompt $argv
2848	3818	----> source /usr/share/fish/functions/fish_git_prompt.fish
12	12	-----> function __fish_git_prompt_show_upstream --description "Helper function for fish_git_prompt"...
7	7	-----> function fish_git_prompt --description "Prompt function for Git"...
7	7	-----> function __fish_git_prompt_staged --description "fish_git_prompt helper, tells whether or not the current branch has staged files"...
7	7	-----> function __fish_git_prompt_untracked --description "fish_git_prompt helper, tells whether or not the current repository has untracked files"...
10	10	-----> function __fish_git_prompt_dirty --description "fish_git_prompt helper, tells whether or not the current branch has tracked, modified files"...
3	3	-----> function __fish_git_prompt_informative_status...
7	7	-----> function __fish_git_prompt_operation_branch_bare --description "fish_git_prompt helper, returns the current Git operation and branch"...
5	5	-----> function __fish_git_prompt_set_char...
6	6	-----> function __fish_git_prompt_validate_chars --description "fish_git_prompt helper, checks char variables"...
3	3	-----> function __fish_git_prompt_set_color...
6	6	-----> function __fish_git_prompt_validate_colors --description "fish_git_prompt helper, checks color variables"...
17	17	-----> set -l varargs
78	197	-----> for var in repaint describe_style show_informative_status use_informative_chars showdirtystate showstashstate showuntrackedfiles showupstream...
17	17	------> set -a varargs --on-variable __fish_git_prompt_$var
18	18	------> set -a varargs --on-variable __fish_git_prompt_$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_$var
16	16	------> set -a varargs --on-variable __fish_git_prompt_$var
35	35	-----> function __fish_git_prompt_reset $varargs --description "Event handler, resets prompt when functionality changes"...
11	11	-----> set -l varargs
72	290	-----> for var in '' _prefix _suffix _bare _merging _cleanstate _invalidstate _upstream _flags _branch _dirtystate _stagedstate _branch_detached _stashstate _untrackedfiles...
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
15	15	------> set -a varargs --on-variable __fish_git_prompt_color$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_color$var
17	17	------> set -a varargs --on-variable __fish_git_prompt_color$var
15	15	------> set -a varargs --on-variable __fish_git_prompt_color$var
15	15	------> set -a varargs --on-variable __fish_git_prompt_color$var
17	17	------> set -a varargs --on-variable __fish_git_prompt_color$var
13	13	-----> set -a varargs --on-variable __fish_git_prompt_showcolorhints
58	58	-----> function __fish_git_prompt_reset_color $varargs --description "Event handler, resets prompt when any color changes"...
10	10	-----> set -l varargs
58	224	-----> for var in cleanstate dirtystate invalidstate stagedstate stashstate stateseparator untrackedfiles upstream_ahead upstream_behind upstream_diverged upstream_equal upstream_prefix...
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
12	12	------> set -a varargs --on-variable __fish_git_prompt_char_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_char_$var
14	14	------> set -a varargs --on-variable __fish_git_prompt_char_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
13	13	------> set -a varargs --on-variable __fish_git_prompt_char_$var
15	15	------> set -a varargs --on-variable __fish_git_prompt_char_$var
18	18	------> set -a varargs --on-variable __fish_git_prompt_char_$var
15	15	------> set -a varargs --on-variable __fish_git_prompt_char_$var
42	42	-----> function __fish_git_prompt_reset_char $varargs --description "Event handler, resets prompt when any char changes"...
2	39	----> if not command -sq git...
37	37	-----> not command -sq git
129	1998	----> set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
1869	1869	-----> command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
16	16	----> test -n "$repo_info"
14	14	----> set -l git_dir $repo_info[1]
12	12	----> set -l inside_gitdir $repo_info[2]
11	11	----> set -l bare_repo $repo_info[3]
11	11	----> set -l inside_worktree $repo_info[4]
6	6	----> set -q repo_info[5]
11	11	----> set -l sha $repo_info[5]
77	2072	----> set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
60	1995	-----> __fish_git_prompt_operation_branch_bare $repo_info
15	15	------> set -l git_dir $argv[1]
13	13	------> set -l inside_gitdir $argv[2]
11	11	------> set -l bare_repo $argv[3]
6	6	------> set -q argv[5]
11	11	------> set -l sha $argv[5]
7	7	------> set -l branch
8	8	------> set -l operation
8	8	------> set -l detached no
8	8	------> set -l bare
8	8	------> set -l step
8	8	------> set -l total
34	120	------> if test -d $git_dir/rebase-merge...
17	17	-------> test -d $git_dir/rebase-merge
11	69	-------> if test -d $git_dir/rebase-apply...
13	13	--------> test -d $git_dir/rebase-apply
12	12	--------> test -f $git_dir/MERGE_HEAD
12	12	--------> test -f $git_dir/CHERRY_PICK_HEAD
10	10	--------> test -f $git_dir/REVERT_HEAD
11	11	--------> test -f $git_dir/BISECT_LOG
2	23	------> if test -n "$step" -a -n "$total"...
21	21	-------> test -n "$step" -a -n "$total"
10	1631	------> if test -z "$branch"...
9	9	-------> test -z "$branch"
4	1612	-------> if not set branch (command git symbolic-ref HEAD 2>/dev/null)...
97	1608	--------> not set branch (command git symbolic-ref HEAD 2>/dev/null)
1511	1511	---------> command git symbolic-ref HEAD 2>/dev/null
2	16	------> if test true = $inside_gitdir...
14	14	-------> test true = $inside_gitdir
12	12	------> echo $operation
12	12	------> echo $branch
10	10	------> echo $detached
8	8	------> echo $bare
13	13	----> set -l r $rbc[1]
12	12	----> set -l b $rbc[2]
12	12	----> set -l detached $rbc[3]
8	8	----> set -l dirtystate
9	9	----> set -l stagedstate
8	8	----> set -l invalidstate
8	8	----> set -l stashstate
8	8	----> set -l untrackedfiles
11	11	----> set -l c $rbc[4]
7	7	----> set -l p
9	9	----> set -l informative_status
7	7	----> set -q __fish_git_prompt_status_order
14	14	----> set -g __fish_git_prompt_status_order stagedstate invalidstate dirtystate untrackedfiles stashstate
10	7679	----> if not set -q ___fish_git_prompt_init...
7	7	-----> not set -q ___fish_git_prompt_init
48	3079	-----> __fish_git_prompt_validate_chars
61	274	------> __fish_git_prompt_set_char __fish_git_prompt_char_cleanstate '✔'
16	16	-------> set -l user_variable_name "$argv[1]"
11	11	-------> set -l char $argv[2]
2	9	-------> if set -q argv[3]...
7	7	--------> set -q argv[3]
13	13	-------> set -l variable _$user_variable_name
13	13	-------> set -l variable_done "$variable"_done
36	151	-------> if not set -q $variable...
9	9	--------> not set -q $variable
83	106	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
12	12	---------> echo $char
31	258	------> __fish_git_prompt_set_char __fish_git_prompt_char_dirtystate '*' '✚'
16	16	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
4	57	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
32	47	--------> begin...
8	8	---------> set -q __fish_git_prompt_show_informative_status
7	7	---------> set -q __fish_git_prompt_use_informative_chars
12	12	-------> set -l variable _$user_variable_name
13	13	-------> set -l variable_done "$variable"_done
7	117	-------> if not set -q $variable...
9	9	--------> not set -q $variable
77	101	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
13	13	---------> echo $char
32	279	------> __fish_git_prompt_set_char __fish_git_prompt_char_invalidstate '#' '✖'
14	14	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
12	66	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
34	48	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
7	7	---------> set -q __fish_git_prompt_use_informative_chars
15	15	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	128	-------> if not set -q $variable...
9	9	--------> not set -q $variable
91	113	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
11	11	---------> echo $char
30	266	------> __fish_git_prompt_set_char __fish_git_prompt_char_stagedstate '+' '●'
15	15	-------> set -l user_variable_name "$argv[1]"
11	11	-------> set -l char $argv[2]
3	57	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
35	48	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	128	-------> if not set -q $variable...
9	9	--------> not set -q $variable
90	113	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
12	12	---------> set -q $user_variable_name
11	11	---------> echo $char
30	255	------> __fish_git_prompt_set_char __fish_git_prompt_char_stashstate '$' '⚑'
15	15	-------> set -l user_variable_name "$argv[1]"
11	11	-------> set -l char $argv[2]
3	56	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
34	47	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
14	14	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
7	117	-------> if not set -q $variable...
9	9	--------> not set -q $variable
78	101	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
12	12	---------> set -q $user_variable_name
11	11	---------> echo $char
28	253	------> __fish_git_prompt_set_char __fish_git_prompt_char_stateseparator ' ' '|'
15	15	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
8	61	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
34	47	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	112	-------> if not set -q $variable...
9	9	--------> not set -q $variable
74	97	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
12	12	---------> echo $char
33	250	------> __fish_git_prompt_set_char __fish_git_prompt_char_untrackedfiles '%' '…'
14	14	-------> set -l user_variable_name "$argv[1]"
11	11	-------> set -l char $argv[2]
2	56	-------> if set -q argv[3]...
7	7	--------> set -q argv[3]
34	47	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
14	14	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
7	110	-------> if not set -q $variable...
8	8	--------> not set -q $variable
73	95	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
11	11	---------> echo $char
27	251	------> __fish_git_prompt_set_char __fish_git_prompt_char_upstream_ahead '>' '↑'
14	14	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
3	56	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
35	47	--------> begin...
6	6	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
10	117	-------> if not set -q $variable...
9	9	--------> not set -q $variable
77	98	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
10	10	---------> set -q $user_variable_name
11	11	---------> echo $char
29	251	------> __fish_git_prompt_set_char __fish_git_prompt_char_upstream_behind '<' '↓'
14	14	-------> set -l user_variable_name "$argv[1]"
11	11	-------> set -l char $argv[2]
3	55	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
33	46	--------> begin...
7	7	---------> set -q __fish_git_prompt_show_informative_status
6	6	---------> set -q __fish_git_prompt_use_informative_chars
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	117	-------> if not set -q $variable...
9	9	--------> not set -q $variable
75	102	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
16	16	---------> set -q $user_variable_name
11	11	---------> echo $char
29	233	------> __fish_git_prompt_set_char __fish_git_prompt_char_upstream_diverged '<>'
14	14	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
2	8	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
12	12	-------> set -l variable _$user_variable_name
11	11	-------> set -l variable_done "$variable"_done
35	147	-------> if not set -q $variable...
9	9	--------> not set -q $variable
76	103	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
16	16	---------> set -q $user_variable_name
11	11	---------> echo $char
28	228	------> __fish_git_prompt_set_char __fish_git_prompt_char_upstream_equal '='
16	16	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
3	9	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
34	138	-------> if not set -q $variable...
9	9	--------> not set -q $variable
73	95	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
12	12	---------> set -q $user_variable_name
10	10	---------> echo $char
26	233	------> __fish_git_prompt_set_char __fish_git_prompt_char_upstream_prefix ''
15	15	-------> set -l user_variable_name "$argv[1]"
12	12	-------> set -l char $argv[2]
2	8	-------> if set -q argv[3]...
6	6	--------> set -q argv[3]
12	12	-------> set -l variable _$user_variable_name
18	18	-------> set -l variable_done "$variable"_done
35	142	-------> if not set -q $variable...
10	10	--------> not set -q $variable
75	97	--------> set -g $variable (set -q $user_variable_name; and echo $$user_variable_name; or echo $char)
11	11	---------> set -q $user_variable_name
11	11	---------> echo $char
34	4574	-----> __fish_git_prompt_validate_colors
65	389	------> __fish_git_prompt_set_color __fish_git_prompt_color '' ''
15	15	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
96	211	-------> switch (count $argv)...
84	84	--------> count $argv
18	18	--------> set default "$argv[2]"
13	13	--------> set default_done "$argv[3]"
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
7	65	-------> if not set -q $variable...
9	9	--------> not set -q $variable
8	49	--------> if test -n "$$user_variable_name"...
13	13	---------> test -n "$$user_variable_name"
14	14	---------> set -g $variable $default
14	14	---------> set -g $variable_done $default_done
26	281	------> __fish_git_prompt_set_color __fish_git_prompt_color_prefix
14	14	-------> set -l user_variable_name "$argv[1]"
9	9	-------> set -l default default_done
94	144	-------> switch (count $argv)...
16	16	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
18	18	--------> set default_done $___fish_git_prompt_color_done
12	12	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	64	-------> if not set -q $variable...
9	9	--------> not set -q $variable
6	49	--------> if test -n "$$user_variable_name"...
13	13	---------> test -n "$$user_variable_name"
15	15	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
23	275	------> __fish_git_prompt_set_color __fish_git_prompt_color_suffix
14	14	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
98	142	-------> switch (count $argv)...
16	16	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
12	12	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
7	63	-------> if not set -q $variable...
8	8	--------> not set -q $variable
6	48	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
15	15	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
31	274	------> __fish_git_prompt_set_color __fish_git_prompt_color_bare
14	14	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
92	135	-------> switch (count $argv)...
16	16	--------> count $argv
15	15	--------> set default $___fish_git_prompt_color
12	12	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
11	11	-------> set -l variable_done "$variable"_done
5	62	-------> if not set -q $variable...
9	9	--------> not set -q $variable
7	48	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
14	14	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
23	275	------> __fish_git_prompt_set_color __fish_git_prompt_color_merging
15	15	-------> set -l user_variable_name "$argv[1]"
9	9	-------> set -l default default_done
96	140	-------> switch (count $argv)...
16	16	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
12	12	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	63	-------> if not set -q $variable...
9	9	--------> not set -q $variable
7	48	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
14	14	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
26	344	------> __fish_git_prompt_set_color __fish_git_prompt_color_cleanstate
14	14	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
161	207	-------> switch (count $argv)...
18	18	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
12	12	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	64	-------> if not set -q $variable...
9	9	--------> not set -q $variable
6	49	--------> if test -n "$$user_variable_name"...
13	13	---------> test -n "$$user_variable_name"
15	15	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
32	278	------> __fish_git_prompt_set_color __fish_git_prompt_color_invalidstate
14	14	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
93	137	-------> switch (count $argv)...
16	16	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
12	12	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
11	11	-------> set -l variable_done "$variable"_done
5	63	-------> if not set -q $variable...
9	9	--------> not set -q $variable
8	49	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
14	14	---------> set -g $variable $default
15	15	---------> set -g $variable_done $default_done
25	278	------> __fish_git_prompt_set_color __fish_git_prompt_color_upstream
14	14	-------> set -l user_variable_name "$argv[1]"
9	9	-------> set -l default default_done
92	141	-------> switch (count $argv)...
20	20	--------> count $argv
16	16	--------> set default $___fish_git_prompt_color
13	13	--------> set default_done $___fish_git_prompt_color_done
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
6	64	-------> if not set -q $variable...
9	9	--------> not set -q $variable
8	49	--------> if test -n "$$user_variable_name"...
13	13	---------> test -n "$$user_variable_name"
14	14	---------> set -g $variable $default
14	14	---------> set -g $variable_done $default_done
12	1140	------> if set -q __fish_git_prompt_showcolorhints...
6	6	-------> set -q __fish_git_prompt_showcolorhints
26	276	-------> __fish_git_prompt_set_color __fish_git_prompt_color_flags
14	14	--------> set -l user_variable_name "$argv[1]"
8	8	--------> set -l default default_done
92	134	--------> switch (count $argv)...
15	15	---------> count $argv
15	15	---------> set default $___fish_git_prompt_color
12	12	---------> set default_done $___fish_git_prompt_color_done
12	12	--------> set -l variable _$user_variable_name
19	19	--------> set -l variable_done "$variable"_done
7	63	--------> if not set -q $variable...
9	9	---------> not set -q $variable
7	47	---------> if test -n "$$user_variable_name"...
12	12	----------> test -n "$$user_variable_name"
14	14	----------> set -g $variable $default
14	14	----------> set -g $variable_done $default_done
25	272	-------> __fish_git_prompt_set_color __fish_git_prompt_color_branch
14	14	--------> set -l user_variable_name "$argv[1]"
8	8	--------> set -l default default_done
96	139	--------> switch (count $argv)...
15	15	---------> count $argv
16	16	---------> set default $___fish_git_prompt_color
12	12	---------> set default_done $___fish_git_prompt_color_done
13	13	--------> set -l variable _$user_variable_name
11	11	--------> set -l variable_done "$variable"_done
5	62	--------> if not set -q $variable...
9	9	---------> not set -q $variable
7	48	---------> if test -n "$$user_variable_name"...
13	13	----------> test -n "$$user_variable_name"
14	14	----------> set -g $variable $default
14	14	----------> set -g $variable_done $default_done
38	288	-------> __fish_git_prompt_set_color __fish_git_prompt_color_dirtystate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
14	14	--------> set -l user_variable_name "$argv[1]"
8	8	--------> set -l default default_done
93	139	--------> switch (count $argv)...
19	19	---------> count $argv
15	15	---------> set default "$argv[2]"
12	12	---------> set default_done "$argv[3]"
13	13	--------> set -l variable _$user_variable_name
12	12	--------> set -l variable_done "$variable"_done
6	64	--------> if not set -q $variable...
10	10	---------> not set -q $variable
7	48	---------> if test -n "$$user_variable_name"...
13	13	----------> test -n "$$user_variable_name"
14	14	----------> set -g $variable $default
14	14	----------> set -g $variable_done $default_done
33	286	-------> __fish_git_prompt_set_color __fish_git_prompt_color_stagedstate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
13	13	--------> set -l user_variable_name "$argv[1]"
8	8	--------> set -l default default_done
94	140	--------> switch (count $argv)...
18	18	---------> count $argv
16	16	---------> set default "$argv[2]"
12	12	---------> set default_done "$argv[3]"
13	13	--------> set -l variable _$user_variable_name
11	11	--------> set -l variable_done "$variable"_done
11	68	--------> if not set -q $variable...
9	9	---------> not set -q $variable
7	48	---------> if test -n "$$user_variable_name"...
13	13	----------> test -n "$$user_variable_name"
14	14	----------> set -g $variable $default
14	14	----------> set -g $variable_done $default_done
87	428	------> __fish_git_prompt_set_color __fish_git_prompt_color_branch_detached (set_color red)
18	18	-------> set_color red
17	17	-------> set -l user_variable_name "$argv[1]"
9	9	-------> set -l default default_done
93	203	-------> switch (count $argv)...
17	17	--------> count $argv
16	16	--------> set default "$argv[2]"
63	77	--------> set default_done (set_color normal)
14	14	---------> set_color normal
14	14	-------> set -l variable _$user_variable_name
11	11	-------> set -l variable_done "$variable"_done
7	69	-------> if not set -q $variable...
9	9	--------> not set -q $variable
12	53	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
15	15	---------> set -g $variable $default
14	14	---------> set -g $variable_done $default_done
37	292	------> __fish_git_prompt_set_color __fish_git_prompt_color_stashstate $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
14	14	-------> set -l user_variable_name "$argv[1]"
8	8	-------> set -l default default_done
94	141	-------> switch (count $argv)...
19	19	--------> count $argv
16	16	--------> set default "$argv[2]"
12	12	--------> set default_done "$argv[3]"
12	12	-------> set -l variable _$user_variable_name
17	17	-------> set -l variable_done "$variable"_done
6	63	-------> if not set -q $variable...
9	9	--------> not set -q $variable
7	48	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
15	15	---------> set -g $variable $default
14	14	---------> set -g $variable_done $default_done
31	286	------> __fish_git_prompt_set_color __fish_git_prompt_color_untrackedfiles $___fish_git_prompt_color_flags $___fish_git_prompt_color_flags_done
13	13	-------> set -l user_variable_name "$argv[1]"
9	9	-------> set -l default default_done
93	139	-------> switch (count $argv)...
18	18	--------> count $argv
16	16	--------> set default "$argv[2]"
12	12	--------> set default_done "$argv[3]"
13	13	-------> set -l variable _$user_variable_name
12	12	-------> set -l variable_done "$variable"_done
7	69	-------> if not set -q $variable...
9	9	--------> not set -q $variable
7	53	--------> if test -n "$$user_variable_name"...
12	12	---------> test -n "$$user_variable_name"
20	20	---------> set -g $variable $default
14	14	---------> set -g $variable_done $default_done
9	9	-----> set -g ___fish_git_prompt_init
17	17	----> set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"
88	1590	----> set -l informative (command git config --bool bash.showInformativeStatus)
1502	1502	-----> command git config --bool bash.showInformativeStatus
90	1304	----> set -l dirty (command git config --bool bash.showDirtyState)
1214	1214	-----> command git config --bool bash.showDirtyState
7	23	----> if not set -q dirty[1]...
9	9	-----> not set -q dirty[1]
7	7	-----> set -q __fish_git_prompt_showdirtystate
20	20	----> contains dirtystate $__fish_git_prompt_status_order
89	1301	----> set -l untracked (command git config --bool bash.showUntrackedFiles)
1212	1212	-----> command git config --bool bash.showUntrackedFiles
6	22	----> if not set -q untracked[1]...
9	9	-----> not set -q untracked[1]
7	7	-----> set -q __fish_git_prompt_showuntrackedfiles
19	19	----> contains untrackedfiles $__fish_git_prompt_status_order
11	100	----> if test true = $inside_worktree...
12	12	-----> test true = $inside_worktree
7	61	-----> if test "$informative" = true...
11	11	------> test "$informative" = true
4	12	------> begin...
8	8	-------> set -q __fish_git_prompt_show_informative_status
1	11	------> if test "$dirty" = true...
10	10	-------> test "$dirty" = true
3	9	------> if set -q __fish_git_prompt_showstashstate...
6	6	-------> set -q __fish_git_prompt_showstashstate
2	11	------> if test "$untracked" = true...
9	9	-------> test "$untracked" = true
4	16	-----> if set -q __fish_git_prompt_showupstream...
6	6	------> set -q __fish_git_prompt_showupstream
6	6	------> set -q __fish_git_prompt_show_informative_status
13	13	----> set -l branch_color $___fish_git_prompt_color_branch
12	12	----> set -l branch_done $___fish_git_prompt_color_branch_done
2	8	----> if set -q __fish_git_prompt_showcolorhints...
6	6	-----> set -q __fish_git_prompt_showcolorhints
10	10	----> set -l f ""
35	95	----> for i in $__fish_git_prompt_status_order...
2	14	-----> if test -n "$$i"...
12	12	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
2	11	-----> if test -n "$$i"...
9	9	------> test -n "$$i"
3	12	-----> if test -n "$$i"...
9	9	------> test -n "$$i"
74	92	----> set b (string replace refs/heads/ '' -- $b)
18	18	-----> string replace refs/heads/ '' -- $b
9	9	----> set -q __fish_git_prompt_shorten_branch_char_suffix
12	12	----> set -l __fish_git_prompt_shorten_branch_char_suffix "…"
2	24	----> if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"...
22	22	-----> string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"
6	31	----> if test -n "$b"...
10	10	-----> test -n "$b"
15	15	-----> set b "$branch_color$b$branch_done"
1	10	----> if test -n "$c"...
9	9	-----> test -n "$c"
2	10	----> if test -n "$r"...
8	8	-----> test -n "$r"
1	9	----> if test -n "$p"...
8	8	-----> test -n "$p"
1	9	----> if test -n "$f"...
8	8	-----> test -n "$f"
14	14	----> set -l format $argv[1]
13	33	----> if test -z "$format"...
9	9	-----> test -z "$format"
11	11	-----> set format " (%s)"
38	38	----> printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
119	124	> source /usr/share/fish/functions/fish_title.fish
5	5	-> function fish_title...
20	428	> fish_title
8	408	-> if not set -q INSIDE_EMACS...
11	11	--> not set -q INSIDE_EMACS
125	389	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
10	10	---> set -q argv[1]
10	10	---> status current-command
101	244	---> __fish_pwd
84	94	----> source /usr/share/fish/functions/__fish_pwd.fish
10	10	-----> function __fish_pwd --description "Show current path"...
7	49	----> if status test-feature regex-easyesc...
10	10	-----> status test-feature regex-easyesc
32	32	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
40	69	> __fish_disable_bracketed_paste history
29	29	-> printf "\e[?2004l"
22	317	> fish_title history
10	295	-> if not set -q INSIDE_EMACS...
13	13	--> not set -q INSIDE_EMACS
163	272	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
10	10	---> set -q argv[1]
15	15	---> echo $argv[1]
18	84	---> __fish_pwd
8	66	----> if status test-feature regex-easyesc...
12	12	-----> status test-feature regex-easyesc
46	46	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
250	1182203	> history
869	888	-> source /usr/share/fish/functions/history.fish
10	10	--> function __fish_unexpected_hist_args --no-scope-shadowing...
9	9	--> function history --description "display or manipulate interactive command history"...
16	16	-> set -l cmd history
16	16	-> set -l options --exclusive 'c,e,p' --exclusive 'S,D,M,V,X'
14	14	-> set -a options h/help c/contains e/exact p/prefix
18	18	-> set -a options C/case-sensitive R/reverse z/null 't/show-time=?' 'n#max'
14	14	-> set -a options S-search D-delete M-merge V-save X-clear
65	65	-> argparse -n $cmd $options -- $argv
4	11	-> if set -q _flag_help...
7	7	--> set -q _flag_help
9	9	-> set -l hist_cmd
9	9	-> set -l show_time
8	8	-> set -l max_count
8	8	-> set -l search_mode
7	7	-> set -q _flag_max
12	12	-> set max_count -n$_flag_max
6	6	-> set -q _flag_with_time
5	19	-> if set -q _flag_show_time[1]...
8	8	--> set -q _flag_show_time[1]
6	6	--> set -q _flag_show_time
6	6	-> set -q _flag_prefix
5	5	-> set -q _flag_contains
6	6	-> set -q _flag_exact
12	41	-> if set -q _flag_delete...
6	6	--> set -q _flag_delete
6	6	--> set -q _flag_save
6	6	--> set -q _flag_clear
5	5	--> set -q _flag_search
6	6	--> set -q _flag_merge
5	18	-> if not set -q hist_cmd[1]...
7	7	--> not set -q hist_cmd[1]
6	6	--> set -q argv[1]
11	28	-> if not set -q hist_cmd[1]...
7	7	--> not set -q hist_cmd[1]
10	10	--> set hist_cmd search
32	1180729	-> switch $hist_cmd...
13	13	--> test -z "$search_mode"
9	9	--> set search_mode --contains
57	1180675	--> if isatty stdout...
176	449	---> isatty stdout
155	166	----> source /usr/share/fish/functions/isatty.fish
11	11	-----> function isatty -d "Tests if a file descriptor is a tty"...
14	14	----> set -l options h/help
25	25	----> argparse -n isatty $options -- $argv
3	9	----> if set -q _flag_help...
6	6	-----> set -q _flag_help
3	10	----> if set -q argv[2]...
7	7	-----> set -q argv[2]
9	9	----> set -l fd
17	26	----> switch "$argv"...
9	9	-----> set fd 1
14	14	----> test -t "$fd"
11	11	---> set -l pager less
6	6	---> set -q PAGER
7	7	---> not set -qx LESS
11	11	---> set -x LESS --quit-if-one-screen
7	7	---> not set -qx LV
9	9	---> set -x LV -c
1180118	1180118	---> builtin history search $search_mode $show_time $max_count $_flag_case_sensitive $_flag_reverse $_flag_null -- $argv | $pager
30	74	> __fish_enable_bracketed_paste
44	44	-> printf "\e[?2004h"
23	91	> fish_mode_prompt
25	68	-> fish_default_mode_prompt
7	43	--> if test "$fish_key_bindings" = fish_vi_key_bindings...
23	23	---> test "$fish_key_bindings" = fish_vi_key_bindings
13	13	---> test "$fish_key_bindings" = fish_hybrid_key_bindings
50	11042	> fish_prompt
24	24	-> set -l last_pipestatus $pipestatus
15	15	-> set -lx __fish_last_status $status
74	95	-> set -l normal (set_color normal)
21	21	--> set_color normal
8	8	-> set -q fish_color_status
17	17	-> set -l color_cwd $fish_color_cwd
12	12	-> set -l suffix '>'
2	63	-> if functions -q fish_is_root_user...
15	15	--> functions -q fish_is_root_user
19	46	--> fish_is_root_user
3	19	---> if contains -- $USER root toor Administrator...
16	16	----> contains -- $USER root toor Administrator
8	8	---> return 1
10	10	-> set -l bold_flag --bold
8	8	-> set -q __fish_prompt_status_generation
2	17	-> if test $__fish_prompt_status_generation = $status_generation...
15	15	--> test $__fish_prompt_status_generation = $status_generation
14	14	-> set __fish_prompt_status_generation $status_generation
70	94	-> set -l status_color (set_color $fish_color_status)
24	24	--> set_color $fish_color_status
68	93	-> set -l statusb_color (set_color $bold_flag $fish_color_status)
25	25	--> set_color $bold_flag $fish_color_status
71	263	-> set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
59	192	--> __fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus
12	12	---> set -l last_status
7	27	---> if set -q __fish_last_status...
7	7	----> set -q __fish_last_status
13	13	----> set last_status $__fish_last_status
13	13	---> set -l left_brace $argv[1]
12	12	---> set -l right_brace $argv[2]
12	12	---> set -l separator $argv[3]
13	13	---> set -l brace_sep_color $argv[4]
11	11	---> set -l status_color $argv[5]
11	11	---> set -e argv[1 2 3 4 5]
2	8	---> if not set -q argv[1]...
6	6	----> not set -q argv[1]
2	14	---> if not contains $last_status 0 141...
12	12	----> not contains $last_status 0 141
246	10259	-> echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
26	513	--> prompt_login
2	12	---> if not set -q __fish_machine...
10	10	----> not set -q __fish_machine
2	9	---> if set -q __fish_machine[1]...
7	7	----> set -q __fish_machine[1]
14	14	---> set -l color_host $fish_color_host
9	36	---> if set -q SSH_TTY...
7	7	----> set -q SSH_TTY
7	7	----> set -q fish_color_host_remote
13	13	----> set color_host $fish_color_host_remote
277	416	---> echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $color_host) (prompt_hostname) (set_color normal)
23	23	----> set_color $fish_color_user
14	14	----> set_color normal
19	19	----> set_color $color_host
24	68	----> prompt_hostname
44	44	-----> string replace -r "\..*" "" $hostname
15	15	----> set_color normal
20	20	--> set_color $color_cwd
46	286	--> prompt_pwd
13	13	---> set -l options h/help
22	22	---> argparse -n prompt_pwd --max-args=0 $options -- $argv
2	8	---> if set -q _flag_help...
6	6	----> set -q _flag_help
7	7	---> set -q fish_prompt_pwd_dir_length
11	11	---> set -l fish_prompt_pwd_dir_length 1
15	15	---> set -l realhome ~
71	107	---> set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
36	36	----> string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
8	57	---> if [ $fish_prompt_pwd_dir_length -eq 0 ]...
16	16	----> [ $fish_prompt_pwd_dir_length -eq 0 ]
33	33	----> string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
24	9194	--> fish_vcs_prompt
107	9170	---> fish_git_prompt $argv
4	38	----> if not command -sq git...
34	34	-----> not command -sq git
123	1949	----> set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
1826	1826	-----> command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
16	16	----> test -n "$repo_info"
14	14	----> set -l git_dir $repo_info[1]
12	12	----> set -l inside_gitdir $repo_info[2]
12	12	----> set -l bare_repo $repo_info[3]
12	12	----> set -l inside_worktree $repo_info[4]
7	7	----> set -q repo_info[5]
12	12	----> set -l sha $repo_info[5]
76	2139	----> set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
69	2063	-----> __fish_git_prompt_operation_branch_bare $repo_info
16	16	------> set -l git_dir $argv[1]
13	13	------> set -l inside_gitdir $argv[2]
11	11	------> set -l bare_repo $argv[3]
6	6	------> set -q argv[5]
11	11	------> set -l sha $argv[5]
8	8	------> set -l branch
8	8	------> set -l operation
9	9	------> set -l detached no
7	7	------> set -l bare
7	7	------> set -l step
8	8	------> set -l total
36	118	------> if test -d $git_dir/rebase-merge...
16	16	-------> test -d $git_dir/rebase-merge
8	66	-------> if test -d $git_dir/rebase-apply...
12	12	--------> test -d $git_dir/rebase-apply
12	12	--------> test -f $git_dir/MERGE_HEAD
12	12	--------> test -f $git_dir/CHERRY_PICK_HEAD
11	11	--------> test -f $git_dir/REVERT_HEAD
11	11	--------> test -f $git_dir/BISECT_LOG
2	17	------> if test -n "$step" -a -n "$total"...
15	15	-------> test -n "$step" -a -n "$total"
11	1696	------> if test -z "$branch"...
8	8	-------> test -z "$branch"
4	1677	-------> if not set branch (command git symbolic-ref HEAD 2>/dev/null)...
92	1673	--------> not set branch (command git symbolic-ref HEAD 2>/dev/null)
1581	1581	---------> command git symbolic-ref HEAD 2>/dev/null
3	16	------> if test true = $inside_gitdir...
13	13	-------> test true = $inside_gitdir
12	12	------> echo $operation
12	12	------> echo $branch
10	10	------> echo $detached
9	9	------> echo $bare
13	13	----> set -l r $rbc[1]
12	12	----> set -l b $rbc[2]
12	12	----> set -l detached $rbc[3]
8	8	----> set -l dirtystate
8	8	----> set -l stagedstate
7	7	----> set -l invalidstate
7	7	----> set -l stashstate
8	8	----> set -l untrackedfiles
11	11	----> set -l c $rbc[4]
8	8	----> set -l p
9	9	----> set -l informative_status
10	10	----> set -q __fish_git_prompt_status_order
1	8	----> if not set -q ___fish_git_prompt_init...
7	7	-----> not set -q ___fish_git_prompt_init
19	19	----> set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"
91	1485	----> set -l informative (command git config --bool bash.showInformativeStatus)
1394	1394	-----> command git config --bool bash.showInformativeStatus
89	1300	----> set -l dirty (command git config --bool bash.showDirtyState)
1211	1211	-----> command git config --bool bash.showDirtyState
7	23	----> if not set -q dirty[1]...
9	9	-----> not set -q dirty[1]
7	7	-----> set -q __fish_git_prompt_showdirtystate
21	21	----> contains dirtystate $__fish_git_prompt_status_order
89	1303	----> set -l untracked (command git config --bool bash.showUntrackedFiles)
1214	1214	-----> command git config --bool bash.showUntrackedFiles
7	23	----> if not set -q untracked[1]...
9	9	-----> not set -q untracked[1]
7	7	-----> set -q __fish_git_prompt_showuntrackedfiles
19	19	----> contains untrackedfiles $__fish_git_prompt_status_order
11	101	----> if test true = $inside_worktree...
12	12	-----> test true = $inside_worktree
8	62	-----> if test "$informative" = true...
11	11	------> test "$informative" = true
5	12	------> begin...
7	7	-------> set -q __fish_git_prompt_show_informative_status
3	12	------> if test "$dirty" = true...
9	9	-------> test "$dirty" = true
1	8	------> if set -q __fish_git_prompt_showstashstate...
7	7	-------> set -q __fish_git_prompt_showstashstate
1	11	------> if test "$untracked" = true...
10	10	-------> test "$untracked" = true
4	16	-----> if set -q __fish_git_prompt_showupstream...
6	6	------> set -q __fish_git_prompt_showupstream
6	6	------> set -q __fish_git_prompt_show_informative_status
13	13	----> set -l branch_color $___fish_git_prompt_color_branch
16	16	----> set -l branch_done $___fish_git_prompt_color_branch_done
2	8	----> if set -q __fish_git_prompt_showcolorhints...
6	6	-----> set -q __fish_git_prompt_showcolorhints
9	9	----> set -l f ""
34	95	----> for i in $__fish_git_prompt_status_order...
2	14	-----> if test -n "$$i"...
12	12	------> test -n "$$i"
1	12	-----> if test -n "$$i"...
11	11	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
73	92	----> set b (string replace refs/heads/ '' -- $b)
19	19	-----> string replace refs/heads/ '' -- $b
8	8	----> set -q __fish_git_prompt_shorten_branch_char_suffix
14	14	----> set -l __fish_git_prompt_shorten_branch_char_suffix "…"
2	25	----> if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"...
23	23	-----> string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"
6	32	----> if test -n "$b"...
11	11	-----> test -n "$b"
15	15	-----> set b "$branch_color$b$branch_done"
1	10	----> if test -n "$c"...
9	9	-----> test -n "$c"
2	10	----> if test -n "$r"...
8	8	-----> test -n "$r"
3	10	----> if test -n "$p"...
7	7	-----> test -n "$p"
1	9	----> if test -n "$f"...
8	8	-----> test -n "$f"
14	14	----> set -l format $argv[1]
6	26	----> if test -z "$format"...
9	9	-----> test -z "$format"
11	11	-----> set format " (%s)"
46	46	----> printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
23	258	> fish_title
8	235	-> if not set -q INSIDE_EMACS...
12	12	--> not set -q INSIDE_EMACS
130	215	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
9	9	---> set -q argv[1]
9	9	---> status current-command
17	67	---> __fish_pwd
9	50	----> if status test-feature regex-easyesc...
10	10	-----> status test-feature regex-easyesc
31	31	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
26	52	> __fish_disable_bracketed_paste ls
26	26	-> printf "\e[?2004l"
20	285	> fish_title ls
10	265	-> if not set -q INSIDE_EMACS...
11	11	--> not set -q INSIDE_EMACS
152	244	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
10	10	---> set -q argv[1]
15	15	---> echo $argv[1]
18	67	---> __fish_pwd
7	49	----> if status test-feature regex-easyesc...
10	10	-----> status test-feature regex-easyesc
32	32	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
161	4023	> ls
296	315	-> source /usr/share/fish/functions/ls.fish
12	12	--> function __fish_set_lscolors --description 'Set $LS_COLORS if possible'...
7	7	--> function ls --description "List contents of directory"...
19	1878	-> if not set -q __fish_ls_color_opt...
10	10	--> not set -q __fish_ls_color_opt
14	14	--> set -g __fish_ls_color_opt
11	11	--> set -g __fish_ls_command ls
12	1824	--> if command -sq colorls...
49	49	---> command -sq colorls
17	1763	---> for opt in --color=auto -G --color -F...
32	1746	----> if command ls $opt / >/dev/null 2>/dev/null...
1676	1676	-----> command ls $opt / >/dev/null 2>/dev/null
33	33	-----> set -g __fish_ls_color_opt $opt
5	5	-----> break
21	34	-> __fish_set_lscolors
4	13	--> if ! set -qx LS_COLORS...
9	9	---> ! set -qx LS_COLORS
36	140	-> isatty stdout
12	12	--> set -l options h/help
26	26	--> argparse -n isatty $options -- $argv
3	9	--> if set -q _flag_help...
6	6	---> set -q _flag_help
3	10	--> if set -q argv[2]...
7	7	---> set -q argv[2]
8	8	--> set -l fd
16	25	--> switch "$argv"...
9	9	---> set fd 1
14	14	--> test -t "$fd"
11	11	-> set -a opt -F
1484	1484	-> command $__fish_ls_command $__fish_ls_color_opt $argv
25	63	> __fish_enable_bracketed_paste
38	38	-> printf "\e[?2004h"
24	92	> fish_mode_prompt
23	68	-> fish_default_mode_prompt
7	45	--> if test "$fish_key_bindings" = fish_vi_key_bindings...
26	26	---> test "$fish_key_bindings" = fish_vi_key_bindings
12	12	---> test "$fish_key_bindings" = fish_hybrid_key_bindings
51	10729	> fish_prompt
22	22	-> set -l last_pipestatus $pipestatus
16	16	-> set -lx __fish_last_status $status
73	91	-> set -l normal (set_color normal)
18	18	--> set_color normal
10	10	-> set -q fish_color_status
15	15	-> set -l color_cwd $fish_color_cwd
10	10	-> set -l suffix '>'
2	58	-> if functions -q fish_is_root_user...
12	12	--> functions -q fish_is_root_user
19	44	--> fish_is_root_user
3	19	---> if contains -- $USER root toor Administrator...
16	16	----> contains -- $USER root toor Administrator
6	6	---> return 1
11	11	-> set -l bold_flag --bold
7	7	-> set -q __fish_prompt_status_generation
1	17	-> if test $__fish_prompt_status_generation = $status_generation...
16	16	--> test $__fish_prompt_status_generation = $status_generation
15	15	-> set __fish_prompt_status_generation $status_generation
70	90	-> set -l status_color (set_color $fish_color_status)
20	20	--> set_color $fish_color_status
69	93	-> set -l statusb_color (set_color $bold_flag $fish_color_status)
24	24	--> set_color $bold_flag $fish_color_status
71	261	-> set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
61	190	--> __fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus
12	12	---> set -l last_status
6	25	---> if set -q __fish_last_status...
7	7	----> set -q __fish_last_status
12	12	----> set last_status $__fish_last_status
13	13	---> set -l left_brace $argv[1]
12	12	---> set -l right_brace $argv[2]
11	11	---> set -l separator $argv[3]
12	12	---> set -l brace_sep_color $argv[4]
11	11	---> set -l status_color $argv[5]
11	11	---> set -e argv[1 2 3 4 5]
3	9	---> if not set -q argv[1]...
6	6	----> not set -q argv[1]
1	13	---> if not contains $last_status 0 141...
12	12	----> not contains $last_status 0 141
246	9962	-> echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
29	511	--> prompt_login
2	11	---> if not set -q __fish_machine...
9	9	----> not set -q __fish_machine
3	9	---> if set -q __fish_machine[1]...
6	6	----> set -q __fish_machine[1]
14	14	---> set -l color_host $fish_color_host
7	34	---> if set -q SSH_TTY...
8	8	----> set -q SSH_TTY
7	7	----> set -q fish_color_host_remote
12	12	----> set color_host $fish_color_host_remote
280	414	---> echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $color_host) (prompt_hostname) (set_color normal)
22	22	----> set_color $fish_color_user
14	14	----> set_color normal
19	19	----> set_color $color_host
25	64	----> prompt_hostname
39	39	-----> string replace -r "\..*" "" $hostname
15	15	----> set_color normal
19	19	--> set_color $color_cwd
32	269	--> prompt_pwd
13	13	---> set -l options h/help
20	20	---> argparse -n prompt_pwd --max-args=0 $options -- $argv
3	9	---> if set -q _flag_help...
6	6	----> set -q _flag_help
6	6	---> set -q fish_prompt_pwd_dir_length
10	10	---> set -l fish_prompt_pwd_dir_length 1
14	14	---> set -l realhome ~
71	111	---> set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
40	40	----> string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
6	54	---> if [ $fish_prompt_pwd_dir_length -eq 0 ]...
16	16	----> [ $fish_prompt_pwd_dir_length -eq 0 ]
32	32	----> string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
23	8917	--> fish_vcs_prompt
107	8894	---> fish_git_prompt $argv
3	34	----> if not command -sq git...
31	31	-----> not command -sq git
123	1695	----> set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
1572	1572	-----> command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
16	16	----> test -n "$repo_info"
13	13	----> set -l git_dir $repo_info[1]
12	12	----> set -l inside_gitdir $repo_info[2]
12	12	----> set -l bare_repo $repo_info[3]
12	12	----> set -l inside_worktree $repo_info[4]
7	7	----> set -q repo_info[5]
12	12	----> set -l sha $repo_info[5]
76	2025	----> set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
59	1949	-----> __fish_git_prompt_operation_branch_bare $repo_info
16	16	------> set -l git_dir $argv[1]
12	12	------> set -l inside_gitdir $argv[2]
12	12	------> set -l bare_repo $argv[3]
7	7	------> set -q argv[5]
11	11	------> set -l sha $argv[5]
8	8	------> set -l branch
8	8	------> set -l operation
8	8	------> set -l detached no
8	8	------> set -l bare
8	8	------> set -l step
9	9	------> set -l total
34	121	------> if test -d $git_dir/rebase-merge...
16	16	-------> test -d $git_dir/rebase-merge
14	71	-------> if test -d $git_dir/rebase-apply...
13	13	--------> test -d $git_dir/rebase-apply
12	12	--------> test -f $git_dir/MERGE_HEAD
11	11	--------> test -f $git_dir/CHERRY_PICK_HEAD
10	10	--------> test -f $git_dir/REVERT_HEAD
11	11	--------> test -f $git_dir/BISECT_LOG
2	17	------> if test -n "$step" -a -n "$total"...
15	15	-------> test -n "$step" -a -n "$total"
11	1587	------> if test -z "$branch"...
8	8	-------> test -z "$branch"
2	1568	-------> if not set branch (command git symbolic-ref HEAD 2>/dev/null)...
90	1566	--------> not set branch (command git symbolic-ref HEAD 2>/dev/null)
1476	1476	---------> command git symbolic-ref HEAD 2>/dev/null
2	16	------> if test true = $inside_gitdir...
14	14	-------> test true = $inside_gitdir
12	12	------> echo $operation
12	12	------> echo $branch
10	10	------> echo $detached
8	8	------> echo $bare
13	13	----> set -l r $rbc[1]
12	12	----> set -l b $rbc[2]
12	12	----> set -l detached $rbc[3]
8	8	----> set -l dirtystate
9	9	----> set -l stagedstate
8	8	----> set -l invalidstate
8	8	----> set -l stashstate
8	8	----> set -l untrackedfiles
11	11	----> set -l c $rbc[4]
8	8	----> set -l p
9	9	----> set -l informative_status
9	9	----> set -q __fish_git_prompt_status_order
2	10	----> if not set -q ___fish_git_prompt_init...
8	8	-----> not set -q ___fish_git_prompt_init
22	22	----> set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"
94	1517	----> set -l informative (command git config --bool bash.showInformativeStatus)
1423	1423	-----> command git config --bool bash.showInformativeStatus
114	1326	----> set -l dirty (command git config --bool bash.showDirtyState)
1212	1212	-----> command git config --bool bash.showDirtyState
7	23	----> if not set -q dirty[1]...
9	9	-----> not set -q dirty[1]
7	7	-----> set -q __fish_git_prompt_showdirtystate
21	21	----> contains dirtystate $__fish_git_prompt_status_order
88	1319	----> set -l untracked (command git config --bool bash.showUntrackedFiles)
1231	1231	-----> command git config --bool bash.showUntrackedFiles
6	24	----> if not set -q untracked[1]...
10	10	-----> not set -q untracked[1]
8	8	-----> set -q __fish_git_prompt_showuntrackedfiles
19	19	----> contains untrackedfiles $__fish_git_prompt_status_order
9	100	----> if test true = $inside_worktree...
12	12	-----> test true = $inside_worktree
11	63	-----> if test "$informative" = true...
10	10	------> test "$informative" = true
4	11	------> begin...
7	7	-------> set -q __fish_git_prompt_show_informative_status
1	11	------> if test "$dirty" = true...
10	10	-------> test "$dirty" = true
2	9	------> if set -q __fish_git_prompt_showstashstate...
7	7	-------> set -q __fish_git_prompt_showstashstate
2	11	------> if test "$untracked" = true...
9	9	-------> test "$untracked" = true
3	16	-----> if set -q __fish_git_prompt_showupstream...
6	6	------> set -q __fish_git_prompt_showupstream
7	7	------> set -q __fish_git_prompt_show_informative_status
17	17	----> set -l branch_color $___fish_git_prompt_color_branch
14	14	----> set -l branch_done $___fish_git_prompt_color_branch_done
2	8	----> if set -q __fish_git_prompt_showcolorhints...
6	6	-----> set -q __fish_git_prompt_showcolorhints
21	21	----> set -l f ""
35	96	----> for i in $__fish_git_prompt_status_order...
3	16	-----> if test -n "$$i"...
13	13	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
2	11	-----> if test -n "$$i"...
9	9	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
78	97	----> set b (string replace refs/heads/ '' -- $b)
19	19	-----> string replace refs/heads/ '' -- $b
8	8	----> set -q __fish_git_prompt_shorten_branch_char_suffix
13	13	----> set -l __fish_git_prompt_shorten_branch_char_suffix "…"
3	25	----> if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"...
22	22	-----> string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"
6	31	----> if test -n "$b"...
10	10	-----> test -n "$b"
15	15	-----> set b "$branch_color$b$branch_done"
1	10	----> if test -n "$c"...
9	9	-----> test -n "$c"
2	10	----> if test -n "$r"...
8	8	-----> test -n "$r"
3	10	----> if test -n "$p"...
7	7	-----> test -n "$p"
1	9	----> if test -n "$f"...
8	8	-----> test -n "$f"
13	13	----> set -l format $argv[1]
5	25	----> if test -z "$format"...
9	9	-----> test -z "$format"
11	11	-----> set format " (%s)"
46	46	----> printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
23	258	> fish_title
10	235	-> if not set -q INSIDE_EMACS...
11	11	--> not set -q INSIDE_EMACS
129	214	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
9	9	---> set -q argv[1]
9	9	---> status current-command
20	67	---> __fish_pwd
8	47	----> if status test-feature regex-easyesc...
9	9	-----> status test-feature regex-easyesc
30	30	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
35	75	> __fish_disable_bracketed_paste history
40	40	-> printf "\e[?2004l"
23	312	> fish_title history
10	289	-> if not set -q INSIDE_EMACS...
13	13	--> not set -q INSIDE_EMACS
157	266	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
10	10	---> set -q argv[1]
15	15	---> echo $argv[1]
20	84	---> __fish_pwd
9	64	----> if status test-feature regex-easyesc...
13	13	-----> status test-feature regex-easyesc
42	42	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
103	7875702	> history
15	15	-> set -l cmd history
17	17	-> set -l options --exclusive 'c,e,p' --exclusive 'S,D,M,V,X'
14	14	-> set -a options h/help c/contains e/exact p/prefix
17	17	-> set -a options C/case-sensitive R/reverse z/null 't/show-time=?' 'n#max'
18	18	-> set -a options S-search D-delete M-merge V-save X-clear
74	74	-> argparse -n $cmd $options -- $argv
4	11	-> if set -q _flag_help...
7	7	--> set -q _flag_help
10	10	-> set -l hist_cmd
8	8	-> set -l show_time
8	8	-> set -l max_count
8	8	-> set -l search_mode
6	6	-> set -q _flag_max
11	11	-> set max_count -n$_flag_max
6	6	-> set -q _flag_with_time
5	19	-> if set -q _flag_show_time[1]...
8	8	--> set -q _flag_show_time[1]
6	6	--> set -q _flag_show_time
6	6	-> set -q _flag_prefix
6	6	-> set -q _flag_contains
6	6	-> set -q _flag_exact
12	43	-> if set -q _flag_delete...
6	6	--> set -q _flag_delete
6	6	--> set -q _flag_save
6	6	--> set -q _flag_clear
6	6	--> set -q _flag_search
7	7	--> set -q _flag_merge
5	18	-> if not set -q hist_cmd[1]...
7	7	--> not set -q hist_cmd[1]
6	6	--> set -q argv[1]
12	28	-> if not set -q hist_cmd[1]...
6	6	--> not set -q hist_cmd[1]
10	10	--> set hist_cmd search
34	7875250	-> switch $hist_cmd...
13	13	--> test -z "$search_mode"
9	9	--> set search_mode --contains
53	7875194	--> if isatty stdout...
35	131	---> isatty stdout
11	11	----> set -l options h/help
20	20	----> argparse -n isatty $options -- $argv
4	10	----> if set -q _flag_help...
6	6	-----> set -q _flag_help
3	9	----> if set -q argv[2]...
6	6	-----> set -q argv[2]
8	8	----> set -l fd
16	25	----> switch "$argv"...
9	9	-----> set fd 1
13	13	----> test -t "$fd"
11	11	---> set -l pager less
6	6	---> set -q PAGER
7	7	---> not set -qx LESS
12	12	---> set -x LESS --quit-if-one-screen
7	7	---> not set -qx LV
9	9	---> set -x LV -c
7874958	7874958	---> builtin history search $search_mode $show_time $max_count $_flag_case_sensitive $_flag_reverse $_flag_null -- $argv | $pager
31	122	> __fish_enable_bracketed_paste
91	91	-> printf "\e[?2004h"
23	134	> fish_mode_prompt
66	111	-> fish_default_mode_prompt
6	45	--> if test "$fish_key_bindings" = fish_vi_key_bindings...
26	26	---> test "$fish_key_bindings" = fish_vi_key_bindings
13	13	---> test "$fish_key_bindings" = fish_hybrid_key_bindings
52	11694	> fish_prompt
24	24	-> set -l last_pipestatus $pipestatus
16	16	-> set -lx __fish_last_status $status
77	126	-> set -l normal (set_color normal)
49	49	--> set_color normal
9	9	-> set -q fish_color_status
18	18	-> set -l color_cwd $fish_color_cwd
12	12	-> set -l suffix '>'
4	163	-> if functions -q fish_is_root_user...
83	83	--> functions -q fish_is_root_user
21	76	--> fish_is_root_user
2	49	---> if contains -- $USER root toor Administrator...
47	47	----> contains -- $USER root toor Administrator
6	6	---> return 1
11	11	-> set -l bold_flag --bold
7	7	-> set -q __fish_prompt_status_generation
1	16	-> if test $__fish_prompt_status_generation = $status_generation...
15	15	--> test $__fish_prompt_status_generation = $status_generation
14	14	-> set __fish_prompt_status_generation $status_generation
73	96	-> set -l status_color (set_color $fish_color_status)
23	23	--> set_color $fish_color_status
71	99	-> set -l statusb_color (set_color $bold_flag $fish_color_status)
28	28	--> set_color $bold_flag $fish_color_status
69	305	-> set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
99	236	--> __fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus
14	14	---> set -l last_status
8	28	---> if set -q __fish_last_status...
7	7	----> set -q __fish_last_status
13	13	----> set last_status $__fish_last_status
12	12	---> set -l left_brace $argv[1]
12	12	---> set -l right_brace $argv[2]
11	11	---> set -l separator $argv[3]
13	13	---> set -l brace_sep_color $argv[4]
12	12	---> set -l status_color $argv[5]
12	12	---> set -e argv[1 2 3 4 5]
2	9	---> if not set -q argv[1]...
7	7	----> not set -q argv[1]
2	14	---> if not contains $last_status 0 141...
12	12	----> not contains $last_status 0 141
279	10726	-> echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
64	606	--> prompt_login
3	13	---> if not set -q __fish_machine...
10	10	----> not set -q __fish_machine
2	9	---> if set -q __fish_machine[1]...
7	7	----> set -q __fish_machine[1]
15	15	---> set -l color_host $fish_color_host
9	36	---> if set -q SSH_TTY...
8	8	----> set -q SSH_TTY
7	7	----> set -q fish_color_host_remote
12	12	----> set color_host $fish_color_host_remote
292	469	---> echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $color_host) (prompt_hostname) (set_color normal)
22	22	----> set_color $fish_color_user
15	15	----> set_color normal
19	19	----> set_color $color_host
63	105	----> prompt_hostname
42	42	-----> string replace -r "\..*" "" $hostname
16	16	----> set_color normal
20	20	--> set_color $color_cwd
70	326	--> prompt_pwd
14	14	---> set -l options h/help
22	22	---> argparse -n prompt_pwd --max-args=0 $options -- $argv
3	9	---> if set -q _flag_help...
6	6	----> set -q _flag_help
6	6	---> set -q fish_prompt_pwd_dir_length
10	10	---> set -l fish_prompt_pwd_dir_length 1
15	15	---> set -l realhome ~
74	109	---> set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
35	35	----> string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
21	71	---> if [ $fish_prompt_pwd_dir_length -eq 0 ]...
17	17	----> [ $fish_prompt_pwd_dir_length -eq 0 ]
33	33	----> string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
61	9495	--> fish_vcs_prompt
149	9434	---> fish_git_prompt $argv
2	37	----> if not command -sq git...
35	35	-----> not command -sq git
142	2039	----> set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
1897	1897	-----> command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
18	18	----> test -n "$repo_info"
16	16	----> set -l git_dir $repo_info[1]
13	13	----> set -l inside_gitdir $repo_info[2]
12	12	----> set -l bare_repo $repo_info[3]
12	12	----> set -l inside_worktree $repo_info[4]
6	6	----> set -q repo_info[5]
12	12	----> set -l sha $repo_info[5]
85	2146	----> set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
65	2061	-----> __fish_git_prompt_operation_branch_bare $repo_info
18	18	------> set -l git_dir $argv[1]
12	12	------> set -l inside_gitdir $argv[2]
12	12	------> set -l bare_repo $argv[3]
6	6	------> set -q argv[5]
11	11	------> set -l sha $argv[5]
8	8	------> set -l branch
9	9	------> set -l operation
9	9	------> set -l detached no
9	9	------> set -l bare
8	8	------> set -l step
9	9	------> set -l total
37	119	------> if test -d $git_dir/rebase-merge...
17	17	-------> test -d $git_dir/rebase-merge
7	65	-------> if test -d $git_dir/rebase-apply...
12	12	--------> test -d $git_dir/rebase-apply
12	12	--------> test -f $git_dir/MERGE_HEAD
12	12	--------> test -f $git_dir/CHERRY_PICK_HEAD
11	11	--------> test -f $git_dir/REVERT_HEAD
11	11	--------> test -f $git_dir/BISECT_LOG
2	17	------> if test -n "$step" -a -n "$total"...
15	15	-------> test -n "$step" -a -n "$total"
11	1689	------> if test -z "$branch"...
9	9	-------> test -z "$branch"
3	1669	-------> if not set branch (command git symbolic-ref HEAD 2>/dev/null)...
96	1666	--------> not set branch (command git symbolic-ref HEAD 2>/dev/null)
1570	1570	---------> command git symbolic-ref HEAD 2>/dev/null
2	17	------> if test true = $inside_gitdir...
15	15	-------> test true = $inside_gitdir
13	13	------> echo $operation
12	12	------> echo $branch
10	10	------> echo $detached
8	8	------> echo $bare
13	13	----> set -l r $rbc[1]
12	12	----> set -l b $rbc[2]
13	13	----> set -l detached $rbc[3]
8	8	----> set -l dirtystate
9	9	----> set -l stagedstate
8	8	----> set -l invalidstate
8	8	----> set -l stashstate
8	8	----> set -l untrackedfiles
11	11	----> set -l c $rbc[4]
8	8	----> set -l p
8	8	----> set -l informative_status
10	10	----> set -q __fish_git_prompt_status_order
3	10	----> if not set -q ___fish_git_prompt_init...
7	7	-----> not set -q ___fish_git_prompt_init
22	22	----> set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"
105	1518	----> set -l informative (command git config --bool bash.showInformativeStatus)
1413	1413	-----> command git config --bool bash.showInformativeStatus
98	1318	----> set -l dirty (command git config --bool bash.showDirtyState)
1220	1220	-----> command git config --bool bash.showDirtyState
6	24	----> if not set -q dirty[1]...
10	10	-----> not set -q dirty[1]
8	8	-----> set -q __fish_git_prompt_showdirtystate
22	22	----> contains dirtystate $__fish_git_prompt_status_order
102	1330	----> set -l untracked (command git config --bool bash.showUntrackedFiles)
1228	1228	-----> command git config --bool bash.showUntrackedFiles
10	27	----> if not set -q untracked[1]...
10	10	-----> not set -q untracked[1]
7	7	-----> set -q __fish_git_prompt_showuntrackedfiles
22	22	----> contains untrackedfiles $__fish_git_prompt_status_order
13	108	----> if test true = $inside_worktree...
13	13	-----> test true = $inside_worktree
11	66	-----> if test "$informative" = true...
10	10	------> test "$informative" = true
5	13	------> begin...
8	8	-------> set -q __fish_git_prompt_show_informative_status
2	12	------> if test "$dirty" = true...
10	10	-------> test "$dirty" = true
1	8	------> if set -q __fish_git_prompt_showstashstate...
7	7	-------> set -q __fish_git_prompt_showstashstate
3	12	------> if test "$untracked" = true...
9	9	-------> test "$untracked" = true
2	16	-----> if set -q __fish_git_prompt_showupstream...
7	7	------> set -q __fish_git_prompt_showupstream
7	7	------> set -q __fish_git_prompt_show_informative_status
18	18	----> set -l branch_color $___fish_git_prompt_color_branch
15	15	----> set -l branch_done $___fish_git_prompt_color_branch_done
2	9	----> if set -q __fish_git_prompt_showcolorhints...
7	7	-----> set -q __fish_git_prompt_showcolorhints
10	10	----> set -l f ""
36	98	----> for i in $__fish_git_prompt_status_order...
2	15	-----> if test -n "$$i"...
13	13	------> test -n "$$i"
1	12	-----> if test -n "$$i"...
11	11	------> test -n "$$i"
2	11	-----> if test -n "$$i"...
9	9	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
80	99	----> set b (string replace refs/heads/ '' -- $b)
19	19	-----> string replace refs/heads/ '' -- $b
9	9	----> set -q __fish_git_prompt_shorten_branch_char_suffix
12	12	----> set -l __fish_git_prompt_shorten_branch_char_suffix "…"
3	28	----> if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"...
25	25	-----> string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"
6	32	----> if test -n "$b"...
10	10	-----> test -n "$b"
16	16	-----> set b "$branch_color$b$branch_done"
1	10	----> if test -n "$c"...
9	9	-----> test -n "$c"
2	10	----> if test -n "$r"...
8	8	-----> test -n "$r"
1	9	----> if test -n "$p"...
8	8	-----> test -n "$p"
2	10	----> if test -n "$f"...
8	8	-----> test -n "$f"
14	14	----> set -l format $argv[1]
6	26	----> if test -z "$format"...
9	9	-----> test -z "$format"
11	11	-----> set format " (%s)"
48	48	----> printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
23	308	> fish_title
9	285	-> if not set -q INSIDE_EMACS...
12	12	--> not set -q INSIDE_EMACS
139	264	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
9	9	---> set -q argv[1]
9	9	---> status current-command
57	107	---> __fish_pwd
8	50	----> if status test-feature regex-easyesc...
11	11	-----> status test-feature regex-easyesc
31	31	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
23	49	> __fish_enable_bracketed_paste
26	26	-> printf "\e[?2004h"
20	76	> fish_mode_prompt
18	56	-> fish_default_mode_prompt
6	38	--> if test "$fish_key_bindings" = fish_vi_key_bindings...
19	19	---> test "$fish_key_bindings" = fish_vi_key_bindings
13	13	---> test "$fish_key_bindings" = fish_hybrid_key_bindings
46	10695	> fish_prompt
22	22	-> set -l last_pipestatus $pipestatus
14	14	-> set -lx __fish_last_status $status
72	87	-> set -l normal (set_color normal)
15	15	--> set_color normal
8	8	-> set -q fish_color_status
14	14	-> set -l color_cwd $fish_color_cwd
11	11	-> set -l suffix '>'
3	55	-> if functions -q fish_is_root_user...
12	12	--> functions -q fish_is_root_user
18	40	--> fish_is_root_user
3	17	---> if contains -- $USER root toor Administrator...
14	14	----> contains -- $USER root toor Administrator
5	5	---> return 1
10	10	-> set -l bold_flag --bold
6	6	-> set -q __fish_prompt_status_generation
6	31	-> if test $__fish_prompt_status_generation = $status_generation...
15	15	--> test $__fish_prompt_status_generation = $status_generation
10	10	--> set bold_flag
13	13	-> set __fish_prompt_status_generation $status_generation
72	91	-> set -l status_color (set_color $fish_color_status)
19	19	--> set_color $fish_color_status
70	92	-> set -l statusb_color (set_color $bold_flag $fish_color_status)
22	22	--> set_color $bold_flag $fish_color_status
68	249	-> set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)
53	181	--> __fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus
11	11	---> set -l last_status
8	26	---> if set -q __fish_last_status...
6	6	----> set -q __fish_last_status
12	12	----> set last_status $__fish_last_status
12	12	---> set -l left_brace $argv[1]
12	12	---> set -l right_brace $argv[2]
12	12	---> set -l separator $argv[3]
12	12	---> set -l brace_sep_color $argv[4]
11	11	---> set -l status_color $argv[5]
10	10	---> set -e argv[1 2 3 4 5]
2	8	---> if not set -q argv[1]...
6	6	----> not set -q argv[1]
1	14	---> if not contains $last_status 0 141...
13	13	----> not contains $last_status 0 141
251	9946	-> echo -n -s (prompt_login)' ' (set_color $color_cwd) (prompt_pwd) $normal (fish_vcs_prompt) $normal " "$prompt_status $suffix " "
25	492	--> prompt_login
2	10	---> if not set -q __fish_machine...
8	8	----> not set -q __fish_machine
2	9	---> if set -q __fish_machine[1]...
7	7	----> set -q __fish_machine[1]
14	14	---> set -l color_host $fish_color_host
7	32	---> if set -q SSH_TTY...
6	6	----> set -q SSH_TTY
7	7	----> set -q fish_color_host_remote
12	12	----> set color_host $fish_color_host_remote
287	402	---> echo -n -s (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $color_host) (prompt_hostname) (set_color normal)
20	20	----> set_color $fish_color_user
14	14	----> set_color normal
19	19	----> set_color $color_host
20	47	----> prompt_hostname
27	27	-----> string replace -r "\..*" "" $hostname
15	15	----> set_color normal
19	19	--> set_color $color_cwd
33	289	--> prompt_pwd
13	13	---> set -l options h/help
21	21	---> argparse -n prompt_pwd --max-args=0 $options -- $argv
1	8	---> if set -q _flag_help...
7	7	----> set -q _flag_help
6	6	---> set -q fish_prompt_pwd_dir_length
15	15	---> set -l fish_prompt_pwd_dir_length 1
35	35	---> set -l realhome ~
74	106	---> set -l tmp (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
32	32	----> string replace -r '^'"$realhome"'($|/)' '~$1' $PWD
6	52	---> if [ $fish_prompt_pwd_dir_length -eq 0 ]...
15	15	----> [ $fish_prompt_pwd_dir_length -eq 0 ]
31	31	----> string replace -ar '(\.?[^/]{'"$fish_prompt_pwd_dir_length"'})[^/]*/' '$1/' $tmp
20	8895	--> fish_vcs_prompt
115	8875	---> fish_git_prompt $argv
3	34	----> if not command -sq git...
31	31	-----> not command -sq git
119	1681	----> set -l repo_info (command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null)
1562	1562	-----> command git rev-parse --git-dir --is-inside-git-dir --is-bare-repository --is-inside-work-tree HEAD 2>/dev/null
16	16	----> test -n "$repo_info"
14	14	----> set -l git_dir $repo_info[1]
12	12	----> set -l inside_gitdir $repo_info[2]
12	12	----> set -l bare_repo $repo_info[3]
12	12	----> set -l inside_worktree $repo_info[4]
7	7	----> set -q repo_info[5]
12	12	----> set -l sha $repo_info[5]
85	2056	----> set -l rbc (__fish_git_prompt_operation_branch_bare $repo_info)
64	1971	-----> __fish_git_prompt_operation_branch_bare $repo_info
16	16	------> set -l git_dir $argv[1]
12	12	------> set -l inside_gitdir $argv[2]
12	12	------> set -l bare_repo $argv[3]
6	6	------> set -q argv[5]
11	11	------> set -l sha $argv[5]
8	8	------> set -l branch
8	8	------> set -l operation
9	9	------> set -l detached no
7	7	------> set -l bare
7	7	------> set -l step
8	8	------> set -l total
35	117	------> if test -d $git_dir/rebase-merge...
17	17	-------> test -d $git_dir/rebase-merge
8	65	-------> if test -d $git_dir/rebase-apply...
13	13	--------> test -d $git_dir/rebase-apply
11	11	--------> test -f $git_dir/MERGE_HEAD
11	11	--------> test -f $git_dir/CHERRY_PICK_HEAD
11	11	--------> test -f $git_dir/REVERT_HEAD
11	11	--------> test -f $git_dir/BISECT_LOG
1	17	------> if test -n "$step" -a -n "$total"...
16	16	-------> test -n "$step" -a -n "$total"
10	1614	------> if test -z "$branch"...
8	8	-------> test -z "$branch"
4	1596	-------> if not set branch (command git symbolic-ref HEAD 2>/dev/null)...
102	1592	--------> not set branch (command git symbolic-ref HEAD 2>/dev/null)
1490	1490	---------> command git symbolic-ref HEAD 2>/dev/null
2	16	------> if test true = $inside_gitdir...
14	14	-------> test true = $inside_gitdir
11	11	------> echo $operation
11	11	------> echo $branch
9	9	------> echo $detached
8	8	------> echo $bare
13	13	----> set -l r $rbc[1]
11	11	----> set -l b $rbc[2]
12	12	----> set -l detached $rbc[3]
9	9	----> set -l dirtystate
9	9	----> set -l stagedstate
8	8	----> set -l invalidstate
8	8	----> set -l stashstate
8	8	----> set -l untrackedfiles
11	11	----> set -l c $rbc[4]
8	8	----> set -l p
8	8	----> set -l informative_status
7	7	----> set -q __fish_git_prompt_status_order
1	8	----> if not set -q ___fish_git_prompt_init...
7	7	-----> not set -q ___fish_git_prompt_init
18	18	----> set -l space "$___fish_git_prompt_color$___fish_git_prompt_char_stateseparator$___fish_git_prompt_color_done"
117	1495	----> set -l informative (command git config --bool bash.showInformativeStatus)
1378	1378	-----> command git config --bool bash.showInformativeStatus
116	1316	----> set -l dirty (command git config --bool bash.showDirtyState)
1200	1200	-----> command git config --bool bash.showDirtyState
7	23	----> if not set -q dirty[1]...
9	9	-----> not set -q dirty[1]
7	7	-----> set -q __fish_git_prompt_showdirtystate
19	19	----> contains dirtystate $__fish_git_prompt_status_order
93	1349	----> set -l untracked (command git config --bool bash.showUntrackedFiles)
1256	1256	-----> command git config --bool bash.showUntrackedFiles
6	23	----> if not set -q untracked[1]...
10	10	-----> not set -q untracked[1]
7	7	-----> set -q __fish_git_prompt_showuntrackedfiles
18	18	----> contains untrackedfiles $__fish_git_prompt_status_order
11	100	----> if test true = $inside_worktree...
11	11	-----> test true = $inside_worktree
8	62	-----> if test "$informative" = true...
11	11	------> test "$informative" = true
5	12	------> begin...
7	7	-------> set -q __fish_git_prompt_show_informative_status
2	12	------> if test "$dirty" = true...
10	10	-------> test "$dirty" = true
2	8	------> if set -q __fish_git_prompt_showstashstate...
6	6	-------> set -q __fish_git_prompt_showstashstate
2	11	------> if test "$untracked" = true...
9	9	-------> test "$untracked" = true
2	16	-----> if set -q __fish_git_prompt_showupstream...
7	7	------> set -q __fish_git_prompt_showupstream
7	7	------> set -q __fish_git_prompt_show_informative_status
14	14	----> set -l branch_color $___fish_git_prompt_color_branch
13	13	----> set -l branch_done $___fish_git_prompt_color_branch_done
1	8	----> if set -q __fish_git_prompt_showcolorhints...
7	7	-----> set -q __fish_git_prompt_showcolorhints
9	9	----> set -l f ""
35	93	----> for i in $__fish_git_prompt_status_order...
1	13	-----> if test -n "$$i"...
12	12	------> test -n "$$i"
2	12	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
2	11	-----> if test -n "$$i"...
9	9	------> test -n "$$i"
1	11	-----> if test -n "$$i"...
10	10	------> test -n "$$i"
77	96	----> set b (string replace refs/heads/ '' -- $b)
19	19	-----> string replace refs/heads/ '' -- $b
8	8	----> set -q __fish_git_prompt_shorten_branch_char_suffix
12	12	----> set -l __fish_git_prompt_shorten_branch_char_suffix "…"
2	24	----> if string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"...
22	22	-----> string match -qr '^\d+$' "$__fish_git_prompt_shorten_branch_len"
6	31	----> if test -n "$b"...
10	10	-----> test -n "$b"
15	15	-----> set b "$branch_color$b$branch_done"
1	10	----> if test -n "$c"...
9	9	-----> test -n "$c"
2	10	----> if test -n "$r"...
8	8	-----> test -n "$r"
1	9	----> if test -n "$p"...
8	8	-----> test -n "$p"
2	10	----> if test -n "$f"...
8	8	-----> test -n "$f"
13	13	----> set -l format $argv[1]
5	25	----> if test -z "$format"...
9	9	-----> test -z "$format"
11	11	-----> set format " (%s)"
38	38	----> printf "%s$format%s" "$___fish_git_prompt_color_prefix" "$___fish_git_prompt_color_prefix_done$c$b$f$r$p$informative_status$___fish_git_prompt_color_suffix" "$___fish_git_prompt_color_suffix_done"
20	254	> fish_title
9	234	-> if not set -q INSIDE_EMACS...
11	11	--> not set -q INSIDE_EMACS
134	214	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
8	8	---> set -q argv[1]
9	9	---> status current-command
17	63	---> __fish_pwd
8	46	----> if status test-feature regex-easyesc...
9	9	-----> status test-feature regex-easyesc
29	29	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
35	69	> __fish_disable_bracketed_paste exit
34	34	-> printf "\e[?2004l"
22	326	> fish_title exit
11	304	-> if not set -q INSIDE_EMACS...
14	14	--> not set -q INSIDE_EMACS
164	279	--> echo (set -q argv[1] && echo $argv[1] || status current-command) (__fish_pwd)
10	10	---> set -q argv[1]
15	15	---> echo $argv[1]
20	90	---> __fish_pwd
16	70	----> if status test-feature regex-easyesc...
12	12	-----> status test-feature regex-easyesc
42	42	-----> string replace -r '^/cygdrive/(.)?' '\\\U$1:' -- $PWD
84	84	> exit
15	45	> __fish_disable_bracketed_paste
30	30	-> printf "\e[?2004l"
