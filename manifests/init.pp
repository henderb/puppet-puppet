class puppet {
    package { "puppet":     ensure  => installed }

    file { "puppetconf":
        name    => "/etc/puppet/puppet.conf",
        content => "puppet:///puppet/puppet.conf",
        owner   => root,
        mode    => 644,
    }

    service { "puppet":
        require => Package[puppet],
        subscribe => file[puppetconf],
        enable  => true,
        ensure  => running,
    }
}

class puppetmaster {
    package { "puppetmaster":   ensure => installed }

    service { "puppetmaster":
        require => Package[puppetmaster],
        enable  => false,
        ensure  => stopped,
    }
}
