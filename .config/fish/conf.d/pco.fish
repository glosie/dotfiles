# PCO
set -gx AWS_CLI_PATH (which aws)
test -f $HOME/.pcorc; and source $HOME/.pcorc

if functions --query bass
    bass source ($HOME/Code/pco/bin/pco init - | psub)
end