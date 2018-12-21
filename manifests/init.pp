# Class: xcode_cli_tools
# ===========================
#
# Install XCode Command Line Tools. Compatible with OS X versions 10.9 - 10.11
# Utilizes the Apple SUS to install the tools; configure SUS according to
# your environment.
#
# Parameters
# ----------
#
# * `xcode_install_script_dir`
#  sets the directory where Xcode install script is temporarily stored.
# Defaults to /tmp, could also be /usr/local/
#
# Examples
# --------
#
# @example
#    class { 'xcode_cli_tools':
#
#    }
#
# Authors
# -------
#
# Antti Pettinen <antti.pettinen@tut.fi>
#
# Copyright
# ---------
#
# Original work Copyright (c) 2016 Tampere University of Technology
# Modified work Copyright 2018 Brian Call

class xcode_cli_tools (
  String[1] $xcode_install_script_dir = '/tmp'
) {
  if $facts['os']['family'] != 'Darwin' {
    fail('This module only supports macOS.')
  } elsif $facts['os']['release']['major'] >= '15' and $facts['xcode_cli_installed'] == false {

    file { 'set_install_on_demand':
      ensure => present,
      path   => '/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress',
      mode   => '0644',
      owner  => 'root',
      group  => 'wheel',
      before => Exec['install_Xcode_CLI_Tools'],
    }

    file { 'xcode_cli_install_script':
      ensure => file,
      source => 'puppet:///modules/xcode_cli_tools/install_xcode_cli_tools.sh',
      path   => "${xcode_install_script_dir}/install_xcode_cli_tools.sh",
      mode   => '0700',
      owner  => 'root',
      group  => 'wheel',
      before => Exec['install_xcode_cli_tools'],
    }

    exec { 'install_xcode_cli_tools':
      command => "${xcode_install_script_dir}/install_xcode_cli_tools.sh",
      require => [
        File['set_install_on_demand'],
        File['xcode_cli_install_script'],
      ],
    }

    exec { 'remove_install_on_demand':
      command => 'rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress',
      path    => '/bin',
      require => Exec['install_xcode_cli_tools'],
    }

    exec { 'remove_xcode_cli_install_script':
      command => "rm ${xcode_install_script_dir}/install_xcode_cli_tools.sh",
      path    => '/bin',
      require => Exec['install_xcode_cli_tools'],
    }
  } elsif $facts['xcode_cli_installed'] == true {
    notify { 'Xcode Command Line Tools is installed': }
  } else {
    fail('This module only supports macOS versions 10.9 or higher.')
  }
}
