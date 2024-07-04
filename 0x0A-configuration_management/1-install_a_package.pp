# This manifest installs Flask version 2.1.0 using pip3

# Ensure that python3-pip is installed
package { 'python3-pip':
  ensure => installed,
}

# Ensure that Flask version 2.1.0 is installed using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}
