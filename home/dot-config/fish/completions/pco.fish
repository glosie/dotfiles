
set -l commands \
        amis \
        app-name-validate \
        aws-config \
        aws-console \
        aws-temporary-credentials \
        block-ip \
        cloud-box \
        commands \
        completions \
        connect \
        console \
        db \
        db-schema-dump \
        dbconnect \
        deployment-cluster-copy \
        deployment-environment-copy \
        deregister-ami \
        each-app \
        env \
        gem \
        gem-versions \
        guardian \
        hackerone \
        halt-ecs-cluster-copy \
        help \
        init \
        list-cloudformation-stacks \
        login \
        maintenance \
        reload \
        restart \
        servers \
        sha \
        shell \
        ssm \
        suspended-asg-processes \
        update \
        update-generic-ami \
        vpn

# disable file completions
complete -c pco -f

# pco amis
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a amis -d "prints a list of the current aws amis"

# pco aws-console
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a aws-console -d "logs into the specified AWS account via SSO"

# pco aws-temporary-credentials
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a aws-temporary-credentials -d "generates temporary credentials for AWS"

# pco cloud-box
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a cloud-box -d "query and make changes to your CloudBox development environment"

set -l cloud_box_subcommands \
        allow-my-ip \
        ip \
        provision \
        ssh \
        start \
        stop \
        update-hosts \
        nuke \
        up

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a allow-my-ip -d "allow connections from your current IP address"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a ip -d "print the EC2 instance IP address"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a provision -d "create a new CloudBox"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a ssh -d "connect with SSH to your EC2 instance"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a start -d "start the EC2 instance"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a stop -d "stop the EC2 instance"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a update-hosts -d "update your local /etc/hosts to point *.pco.test URLs to your instance IP"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a nuke -d "delete your CloudBox and all data on your EC2 instance"

complete -c pco -n "__fish_seen_subcommand_from cloud-box" \
    -a up -d "all of the above (start, allow-my-ip, update-hosts, ssh)"

# pco commands
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a commands -d "list all pco commands"

# pco connect
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a connect -d "starts a SSH session for a given application / environment"

# pco console
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a console -d "opens a Rails console for a given application / environment"

# pco db-schema-dump
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a db-schema-dump -d "dump the structure.sql/schema.rb from production"

# pco deployment-cluster-copy
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a deployment-cluster-copy -d "copy a cloudformation deployment cluster stack to a new stack"

# pco  deployment-environment-copy
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a deployment-environment-copy -d "copy all cloudformation deployment cluster stacks from an environment to new stacks"

# pco deregister-ami
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a deregister-ami -d "deregisters an AMI only if not in use"

# pco gem-versions
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a gem-versions -d "prints all versions of a gem in use by our apps"

# pco hackerone
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a hackerone -d "interact with HackerOne and Trello"

# pco halt-ecs-cluster-copy
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a halt-ecs-cluster-copy -d "stop ECS tasks running deployment cluster copy scripts"

# pco list-cloudformation-stacks
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a list-cloudformation-stacks -d "list Cloudformations stacks in a given status"

# pco login
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a login -d "logs into an organization's account for a given app"

# pco maintenance
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a maintenance -d "stops rake tasks from running via cloudwatch"

# pco reload
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a reload -d "reload all services for the app / environment"

# pco restart
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a restart -d "restart all services for the app / environment"

# pco servers
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a servers -d "prints a list of our servers"

# pco sha
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a sha -d "prints the currently deployed shas"

# pco ssm
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a ssm -d "runs shell commands on specified hosts"

# pco suspended-asg-processes
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a suspended-asg-processes -d "list ASGs with suspended processes"

# pco update
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a update -d "updates local copy of pco app"

# pco update-generic-ami
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a update-pco-gem -d "helps with some of the mundane work when updating our internal gems"

# pco vpn
complete -f -c pco -n "not __fish_seen_subcommand_from $commands" \
    -a vpn -d "connects to the VPN"
