class Distro
    def distroTest
        well_knownDistro = %i[
        "debian"
        "ubuntu"
        "opensuse"
        "fedora"
        "centos"
        "rhel"
        "mandriva"
        "mageia"
        "slackware"
        "vector"
        "zenwalk"
        "sabayon"
        "arch"
        "solus"
        "alpine"
        "gentoo"
        "lunar"
        "sourcemage"
        "nixos"
        "void"
        ]
        #os_release = `cat /etc/os-release`
        os_release = 'NAME="openSUSE Leap"
VERSION="15.2"
ID="opensuse-leap"
ID_LIKE="suse opensuse"
VERSION_ID="15.2"
PRETTY_NAME="openSUSE Leap 15.2"
ANSI_COLOR="0;32"
CPE_NAME="cpe:/o:opensuse:leap:15.2"
BUG_REPORT_URL="https://bugs.opensuse.org"
HOME_URL="https://www.opensuse.org/"
'
        id = /ID="?([a-z]+-?_?)+[a-z]+"?/.match(os_release)
        puts id
        @@distro = /[a-z]+/.match(id.to_s)
        puts @@distro.to_s

        if !(well_knownDistro.include?(@@distro))
            id_like = /ID_LIKE="?([a-z]+\s?)+[a-z]+"?/.match(os_release)
            puts id_like
            @@distro = /[a-z]+/.match(id_like.to_s)
            puts @@distro.to_s
        end

        case @@distro.to_s
        when "ubuntu", "debian", "raspbian"
            @@pkg = `apt-get`
            @@dry_run = ` -ds`
        when "fedora", "centos", "rhel"
            @@pkg = `yum`
            @@dry_run = ` --setopt tsflags=test`
        when "opensuse"
            @@pkg = `zypper`
            @@dry_run = `Dd`
        when "arch"
            @@pkg = `pacman`
            @@dry_run = `w `
        else
            puts "Unknown linux distro"
        end
    end
end