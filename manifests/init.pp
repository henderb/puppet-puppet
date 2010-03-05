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
        enable  => true,
        ensure  => running,
    }
}

class puppetmaster {
    package { "puppetmaster":   ensure => installed }
}
