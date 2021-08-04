class ssh::service {
    service { $::ssh::service_name:
      ensure     => $::ssh::service_state,
      require    => Package[$::ssh::packages],
      enable     => true,
      hasrestart => true,
      hasstatus  => true,
    }
}
