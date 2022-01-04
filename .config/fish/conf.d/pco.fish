# PCO
set -Ux AWS_CLI_PATH (which aws)
set -Ux MYSQL_PORT_3306_TCP_ADDR 127.0.0.1
set -Ux MYSQL_READER_PORT_3306_TCP_ADDR 127.0.0.1
set -Ux MYSQL_READER_PORT_3306_TCP_PORT 3307
test -f $HOME/.pcorc; and source $HOME/.pcorc

fish_add_path $HOME/pco-box/bin

if functions --query bass
    bass source ($HOME/Code/pco/bin/pco init - | psub)
end
