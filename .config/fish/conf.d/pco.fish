# PCO
set -Ux AWS_CLI_PATH (which aws)

if command -s docker > /dev/null
    set -Ux DOCKER_HOST (docker context inspect | jq -r '.[0].Endpoints.docker.Host')
end

test -f $HOME/.pcorc; and source $HOME/.pcorc

fish_add_path $HOME/pco-box/bin

if functions --query bass
    bass source $HOME/pco-box/env.sh
    bass source ($HOME/Code/pco/bin/pco init - | psub)
end
