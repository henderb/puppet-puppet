class puppet {
    package { "puppet":     ensure  => installed }

    # Make sure puppet talks to my server - debian init option file
    file { "puppetinit":
        name    => "/etc/default/puppet",
        content => template("puppet/puppetinit.erb"),
        owner   => "root",
    }

    service { "puppet":
        require => Package[puppet],
        subscribe => file[puppetinit],
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
