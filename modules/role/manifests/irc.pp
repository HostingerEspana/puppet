# role: irc
class role::irc {
    include irc::irclogbot

    class { 'irc::ircrcbot':
        nickname     => 'MirahezeRC',
        network      => 'chat.freenode.net',
        network_port => '6697',
        channel      => '#miraheze-feed',
        udp_port     => '5070',
        sleeptime    => '0.5',
    }

    ufw::allow { 'ircrcbot port lizardfs6':
        proto => 'udp',
        port  => '5070',
        from  => '54.36.165.161',
    }

    ufw::allow { 'ircrcbot port mw1':
        proto => 'udp',
        port  => '5070',
        from  => '185.52.1.75',
    }

    ufw::allow { 'ircrcbot port mw2':
        proto => 'udp',
        port  => '5070',
        from  => '185.52.2.113',
    }

    ufw::allow { 'ircrcbot port mw3':
        proto => 'udp',
        port  => '5070',
        from  => '81.4.121.113',
    }

    motd::role { 'role::irc':
        description => 'IRC bots server',
    }
}
