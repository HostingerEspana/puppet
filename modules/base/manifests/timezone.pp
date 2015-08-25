# class base::timezone
class base::timezone {
    file { '/etc/timezone':
        ensure  => present,
        content => "Etc/UTC",
        path    => '/usr/bin:/usr/sbin:/bin:/sbin',
        unless  => "date +%Z | grep -q UTC",
    }

    exec { 'timezone_update':
        command     => 'dpkg-reconfigure tzdata',
        path        => '/usr/bin:/usr/sbin:/bin:/sbin',
        subscribe   => File['/etc/timezone'],
        refreshonly => true,
    }
}
