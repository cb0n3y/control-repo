class vim::config {
    file { '/etc/vimrc':
        source  => 'puppet:///modules/vim/vimrc',
        mode    => '0644',
        owner   => 'root',
        group   => 'root',
    }
}