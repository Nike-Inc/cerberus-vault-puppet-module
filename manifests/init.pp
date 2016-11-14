class vault (
    $package_version = $vault::params::package_version
) inherits vault::params {
  include stdlib

  include vault::install
  include vault::config
}