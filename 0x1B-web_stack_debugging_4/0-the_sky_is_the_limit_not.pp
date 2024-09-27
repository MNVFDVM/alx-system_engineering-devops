# Increases the amount of traffic an Nginx server can handle by modifying the default file.

# Increase the ULIMIT of the default file
exec { 'fix-ulimit-for-nginx':
  command => 'sed -i "s/15/4096/" /etc/default/nginx',
  path    => ['/usr/local/bin', '/bin'],
  onlyif  => 'grep -q "15" /etc/default/nginx',  # Ensure the change is applied only if needed
}

# Restart Nginx after fixing ULIMIT
exec { 'nginx-restart':
  command => '/etc/init.d/nginx restart',   # Using init.d to restart Nginx
  path    => ['/sbin', '/bin', '/usr/sbin', '/usr/bin'],
  subscribe => Exec['fix-ulimit-for-nginx'],  # Restart nginx only if the ULIMIT change happens
  refreshonly => true,  # Only restart when there's a change
}
