# git
set -gx GIT_DUET_CO_AUTHORED_BY 1

set -l _git_log_oneline_format (string escape '%Cblue%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold cyan)<%an>%Creset')
set -l _git_log_medium_format (string escape '%C(bold)Commit:%C(reset) %C(green)%H%C(red)%d%n%C(bold)Author:%C(reset) %C(cyan)%an <%ae>%n%C(bold)Date:%C(reset)   %C(blue)%ai (%ar)%C(reset)%n%+B')
set -l _git_log_brief_format (string escape '%C(green)%h%C(reset) %s%n%C(blue)(%ar by %an)%C(red)%d%C(reset)%n')

abbr -a glo "git log"
abbr -a glg "git log --all --graph --pretty=format:$_git_log_oneline_format"
abbr -a gl "git log --pretty=format:$_git_log_medium_format"
abbr -a gls "git log --stat --pretty=format:$_git_log_medium_format"
abbr -a gld "git log --stat --patch --full-diff --pretty=format:$_git_log_medium_format"
abbr -a glb "git log --pretty=format:$_git_log_brief_format"
abbr -a glc "git shortlog --summary --numbered"

abbr -a gcp "git cherry-pick"
abbr -a gco "git checkout"
