class vault::install inherits vault {
    group { $vault_group:
        ensure => present,
        system => true,
    }

    user { $vault_user:
        ensure => present,
        system => true,
        gid    => $vault_group,
    }

    file { $config_dir:
        ensure => 'directory',
        owner  => 'vault',
        group  => 'vault',
        mode   => '0755',
    }

    file { $log_dir:
        ensure => directory,
        owner  => $vault_user,
        group  => $adm_group,
        mode   => '0775',
    }

    $file_url = "${$vault_dist_url}/${package_version}/vault_${package_version}_${binary_zip_name}"
    $package_path = '/tmp/vault.zip'

    exec {"download vault":
        command => "/usr/bin/wget ${file_url} -O ${package_path}",
    }->
    exec { 'unzip vault':
        cwd     => $bin_dir,
        command => "/usr/bin/unzip ${package_path} -d ${bin_dir}",
        returns => [0, 9],
        creates => "${bin_dir}/vault", # Don't run if file already exists.
    }->
    exec { 'setcap vault':
        cwd     => $bin_dir,
        command => "/sbin/setcap cap_ipc_lock=+ep ${bin_dir}/vault",
    }->
    file { $package_path:
        ensure => absent,
    }
}
