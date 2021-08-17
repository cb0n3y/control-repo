node default {
    notify {'checkpoint_1':
        message  => "

            CHECKPOINT_1

            Applying Default BLOCK
            Looks like there is not definition for this node
        
        "
    }

}

node 'agent1.fritz.box', 'agent2.fritz.box' {
    include ssh
    include tomcat
}
