#node 'apache.fritz.box' {
#    include vim
#    include ssh
#}

node default {
    notify {'checkpoint_1':
        message  => "

            CHECKPOINT_1

            Applying Default BLOCK
            Looks like there is not definition for this node
        
        "
    }

}

node 'agent2.fritz.box' {
    include tomcat
    include vim
    include ssh
}

node 'agent3.fritz.box' {
    include vim
    include ssh
}

#node 'agent4.fritz.box' {
#    include vim
#    include ssh
#}

#node 'dbs.fritz.box' {
#    include vim
#    include ssh
#}
