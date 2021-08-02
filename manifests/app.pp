node 'puppet.fritz.box' {
  include base
}

node 'apache.fritz.box' {
  include base
  include vim
  include ssh
}

node default {
  notify {'checkpoint_1':
    message => "
			
			CHECKPOINT_1
			
			Applying Default BLOCK
			Looks like there is not definition for this node.
		
		"
  }
}

node 'agent2.fritz.box' {
  class {'tomcat':
    user          => 'root',
    group         => 'tomcat',
    service_state => running,
  }
  class {'ssh':
    permit_root_login       => 'yes',
    log_level               => 'VERBOSE',
    syslog_facility         => 'AUTHPRIV',
    use_dns                 => 'no',
    max_auth_tries          => 2,
    max_sessions            => 3,
    address_family          => 'inet',
    permit_empty_passwords  => 'no',
    password_authentication => 'yes',
    pubkey_authentication   => 'no',
  }
  include base
  include vim
}

node 'agent3.fritz.box' {
  class {'tomcat':
    user          => 'root',
    group         => 'tomcat',
    service_state => running,
  }
  class {'ssh':
    permit_root_login       => 'yes',
    log_level               => 'INFO',
    syslog_facility         => 'AUTHPRIV',
    use_dns                 => 'yes',
    max_auth_tries          => 3,
    max_sessions            => 2,
    address_family          => 'inet',
    permit_empty_passwords  => 'no',
    password_authentication => 'yes',
    pubkey_authentication   => 'no',
  }
  include base
  include vim
  include ssh
}

node 'agent4.fritz.box' {
  class {'ssh':
    permit_root_login       => 'yes',
    log_level               => 'INFO',
    syslog_facility         => 'AUTHPRIV',
    use_dns                 => 'yes',
    max_auth_tries          => 3,
    max_sessions            => 1,
    address_family          => 'inet',
    permit_empty_passwords  => 'no',
    password_authentication => 'yes',
    pubkey_authentication   => 'no',
  }
  include base
  include vim
}

node 'agent5.fritz.box' {
  class {'ssh':
    permit_root_login       => 'yes',
    log_level               => 'INFO',
    syslog_facility         => 'AUTHPRIV',
    use_dns                 => 'yes',
    max_auth_tries          => 3,
    max_sessions            => 2,
    address_family          => 'inet',
    permit_empty_passwords  => 'no',
    password_authentication => 'yes',
    pubkey_authentication   => 'no',
  }
  include vim
}

node 'dbs.fritz.box' {
  include base
  include vim
  include ssh
}
