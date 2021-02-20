module Menu
    def self.prog= (x)
        @program = x
    end

    def self.intro
        puts "ngenx -- nginx configuration generate tool".blue + " (for #{@program})".cyan
        Tips.colorTest
    end

    def self.options
        puts "please select option: ".magenta
        #puts
        puts "a)  all things by one step".yellow
        #puts
        puts "g)  gen http nginx conf".yellow
        #puts
        puts "s)  gen sample nginx conf".yellow
        #puts
        puts "i)  install php and php-ext to run #{@program}".yellow + " (only for debian distro Linux)".red
        #puts
        puts "r)  renew or issue ssl certificate".yellow
        #puts
        puts "v)  version".yellow
        #puts
        puts "h)  help".yellow
        #puts
        puts "q)  quit".yellow
    end

    def self.help
        puts "ngenx -- nginx configuration generate tool"
        puts "The nginx is most powerful web server ever before, this tool helps you generate nginx configuration."
        puts
        puts "you can run ngenx with args: "
        puts
        puts "  -a  all things by one step"
        puts
        puts "  -D/--dry_run/-T/--test
      only download for testing, not to install"
        puts
        puts "  -g  gen http nginx conf"
        puts
        puts "  -h  help"
        puts
        puts "  -i  install php and php-ext to run #{@program} (only for debian distro Linux)"
        puts
        puts "  -r  renew or issue ssl certificate"
        puts
        puts "  -s  sample nginx conf"
        puts
        puts "  -V  version"
        puts
        puts "  --version
      main and module version"
        puts
    end

    def self.download
        `#{@pkg} install -y  --no-install-recommends wget unzip`
        `wget https://github.com/initdc/KodBox/archive/latest.zip -O /tmp/latest.zip`
        `mkdir -p /var/www/kodbox`
        `unzip /tmp/latest.zip -d /tmp` ; `cp -rf /tmp/KodBox-latest/* /var/www/kodbox`
        `chmod -Rf 777 /var/www/kodbox/*`
    end

    def self.renew
        `#{@pkg} install -y --no-install-recommends certbot python3-certbot-nginx`
        `certbot --non-interactive --redirect --agree-tos --nginx -d $domain -m $mail`
    end

    def self.install
        if !dry_run
            @dry_run = ``
        end

        case @distro.to_s
        when "ubuntu", "debian", "raspbian"
            dry_run ? ``:`#{@pkg} update`
            `#{@pkg} install -y --no-install-recommends #{@dry_run}\
            nginx \
            php \
            php-fpm \
            php-{common,curl,dom,exif,gd,iconv,intl,json,ldap,mbstring,mysqli,odbc,opcache,pdo-mysql,pdo-pgsql,pdo-sqlite,pgsql,redis,soap,tokenizer,xsl,zip}`
        when "fedora", "centos", "rhel", "opensuse"
            dry_run ? ``:`#{@pkg} update -y`
            `#{@pkg} install -y #{@dry_run}\
            nginx \
            php \
            php-fpm \
            php-{common,curl,dom,exif,gd,iconv,intl,json,ldap,mbstring,mysqli,odbc,opcache,pdo,pgsql,redis,soap,tokenizer,xsl,zip}`

        when "arch"
            dry_run ? ``:`#{@pkg} -Syu`
            `#{@pkg} -S#{@dry_run} --noconfirm \
            nginx \
            php \
            php-fpm \
            php-{gd,intl,ldap,odbc,pgsql,redis,xsl}`
        else
            puts "Unkown package manager, install failed"
        end
    end
end