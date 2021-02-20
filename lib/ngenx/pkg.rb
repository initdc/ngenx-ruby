module PKG
    @pkg_dict = [
        "apk",
        "apt",
        "apt-get",
        "pacman",
        "yum",
        "zypper",
        "brew"
    ]

    def self.pkg
        @pkg_dict.each do |p|
            if `(command -v #{p})`.to_s != ""
                @pkg = p
            end
        end

        case @pkg
        when "apk"
            @install = "add"
            @dry_run_arg = ""
        when "apt", "apt-get"
            @install = "install"
            @dry_run_arg = "-ds"
        when "pacman"
            @install = "-Sy"
            @dry_run_arg = "-w"
        when "yum"
            @install = "install"
            @dry_run_arg = "--setopt tsflags=test"
        when "zypper"
            @install = "install"
            @dry_run_arg = "-Dd"
        when "brew"
            @install = "install"
            @dry_run_arg = ""
        end
    end

    def self.pkg_install (dry_run, s)
        if !dry_run
            %x("#{@pkg} #{@install} #{s}")
        else
            %x("#{@pkg} #{@install} #{@dry_run_arg} #{s}")
        end
    end
end