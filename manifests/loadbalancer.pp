node 'agent.fritz.box' {
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
  include base
  include ::haproxy
  haproxy::listen {'lb-01':
    collect_exported => false,
    ipaddress        => $::ipaddress,
    ports            => '80',
  }
  haproxy::balancermember {'agent2':
    listening_service => 'lb-01',
    server_names      => 'agent2.fritz.box',
    ipaddresses       => '192.168.178.75',
    ports             => '8080',
    options           => 'check',
  }
  haproxy::balancermember {'agent3':
    listening_service => 'lb-01',
    server_names      => 'agent2.fritz.box',
    ipaddresses       => '192.168.178.76',
    ports             => '8080',
    options           => 'check',
  }
}
