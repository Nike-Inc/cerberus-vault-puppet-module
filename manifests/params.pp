class vault::params {
    $vault_dist_url = 'https://releases.hashicorp.com/vault'
    $package_version = '0.7.0'
    $binary_zip_name = 'linux_amd64.zip'
    
    $vault_user = 'vault'
    $vault_group = 'vault'

    $vault_limit_nofile = '999999'

    $syslog_user = 'syslog'
    $adm_group = 'adm'
    
    $bin_dir = '/usr/local/bin'
    $config_dir = '/etc/vault'
    
    $log_dir = '/var/log/vault'
    $log_file = '/var/log/vault/vault.0.log'
    $log_audit_file = '/var/log/vault/vault_audit.0.log'
    $log_mount_disk_file = '/var/log/mount_vault_log_disk.log'
    
    $logrotate_vault_conf_file = '/etc/logrotate.d/vault'
}
