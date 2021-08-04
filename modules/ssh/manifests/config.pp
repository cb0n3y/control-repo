class ssh::config inherits ssh {
    file { $::ssh::config_path:
        #source  => 'puppet:///modules/ssh/sshd_config',
        content => template('ssh/ssh.conf.erb'),
        mode    => '0644',
        owner   => $::ssh::user,
        group   => $::ssh::group,
        notify  => Service[$::ssh::service_name]
    }
}