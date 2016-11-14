class vault::config inherits vault {    
    file { $logrotate_vault_conf_file:
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("vault/logrotate.conf.erb"),
        require => Class['vault::install'],
    }
    
    file { "/etc/cron.d/logrotate-vault": 
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("vault/logrotate.cron.erb"),
        require => Class['vault::install'],
    }

    file { "/etc/rsyslog.d/30-vault.conf": 
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("vault/rsyslog-vault.conf.erb"),
        require => Class['vault::install'],
    }
    
    file { '/etc/init/vault.conf':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("vault/upstart-vault.conf.erb"),
        require => Class['vault::install'],
    }
    
    file { '/usr/local/bin/vault_dl_config':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template("vault/vault_dl_config.erb"),
        require => Class['vault::install'],
    }

    file { '/etc/init/mount_vault_log_disk.conf':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0644',
        content => template("vault/upstart-mount_vault_log_disk.conf.erb"),
        require => Class['vault::install'],
    }

    file { '/usr/local/bin/mount_vault_log_disk':
        ensure  => file,
        owner   => 'root',
        group   => 'root',
        mode    => '0755',
        content => template("vault/mount_vault_log_disk.erb"),
        require => Class['vault::install'],
    }
}
