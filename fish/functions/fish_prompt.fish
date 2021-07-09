## OLD PROMPT
# # Defined in /usr/local/Cellar/fish/3.0.2/share/fish/functions/fish_prompt.fish @ line 5
# function fish_prompt --description 'Write out the prompt'
# 	set -l color_cwd
#     set -l suffix
#     switch "$USER"
#         case root toor
#             if set -q fish_color_cwd_root
#                 set color_cwd $fish_color_cwd_root
#             else
#                 set color_cwd $fish_color_cwd
#             end
#             set suffix '#'
#         case '*'
#             set color_cwd $fish_color_cwd
#             set suffix '>'
#     end
#
#     echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
# end
#

# Options
set -g fish_prompt_pwd_dir_length 0

set __fish_git_prompt_show_informative_status
set __fish_git_prompt_showcolorhints
set __fish_git_prompt_showupstream "informative"

# Colors
set green (set_color green)
set magenta (set_color magenta)
set normal (set_color normal)
set red (set_color red)
set yellow (set_color yellow)
set darkgrey (set_color 828282)

set __fish_git_prompt_color_branch magenta --bold
set __fish_git_prompt_color_dirtystate white
set __fish_git_prompt_color_invalidstate red
set __fish_git_prompt_color_merging yellow
set __fish_git_prompt_color_stagedstate yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Icons
set __fish_git_prompt_char_cleanstate ' 👍 '
set __fish_git_prompt_char_conflictedstate ' ⚠️ '
set __fish_git_prompt_char_dirtystate ' 💩 '
set __fish_git_prompt_char_invalidstate ' 🤮 '
set __fish_git_prompt_char_stagedstate ' 🚥 '
set __fish_git_prompt_char_stashstate ' 📦 '
set __fish_git_prompt_char_stateseparator ' | '
set __fish_git_prompt_char_untrackedfiles ' 🔍 '
set __fish_git_prompt_char_upstream_ahead ' ☝️ '
set __fish_git_prompt_char_upstream_behind ' 👇 '
set __fish_git_prompt_char_upstream_diverged ' 🚧 '
set __fish_git_prompt_char_upstream_equal ' 💯 '


function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
	set -l suffix
	switch "$USER"
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
			set suffix '#'
		case '*'
			set color_cwd $fish_color_cwd
			set suffix '$'
	end

	set -l timestring (date "+%H:%M")
	echo -n -s $darkgrey "($timestring) " (set_color $fish_color_user) "$USER" (set_color normal) @ (set_color $fish_color_host) (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) (__fish_git_prompt) (set_color normal) \n "$suffix "
end
