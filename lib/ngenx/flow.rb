class Flow
    def initialize(prog,ver)
        @@program = prog
        @@version = ver
    end

    def install(dry_run)

        if !dry_run
            @@dry_run = ``
        end

        case @@distro.to_s
        when "ubuntu", "debian", "raspbian"
            dry_run ? ``:`#{@@pkg} update`
            `#{@@pkg} install -y --no-install-recommends #{@@dry_run}\
            nginx \
            php \
            php-fpm \
            php-{common,curl,dom,exif,gd,iconv,intl,json,ldap,mbstring,mysqli,odbc,opcache,pdo-mysql,pdo-pgsql,pdo-sqlite,pgsql,redis,soap,tokenizer,xsl,zip}`
        when "fedora", "centos", "rhel", "opensuse"
            dry_run ? ``:`#{@@pkg} update -y`
            `#{@@pkg} install -y #{@@dry_run}\
            nginx \
            php \
            php-fpm \
            php-{common,curl,dom,exif,gd,iconv,intl,json,ldap,mbstring,mysqli,odbc,opcache,pdo,pgsql,redis,soap,tokenizer,xsl,zip}`

        when "arch"
            dry_run ? ``:`#{@@pkg} -Syu`
            `#{@@pkg} -S#{@@dry_run} --noconfirm \
            nginx \
            php \
            php-fpm \
            php-{gd,intl,ldap,odbc,pgsql,redis,xsl}`
        else
            puts "Unkown package manager, install failed"
        end
    end

    def nginx
    end

    def php_fpm
    end

    def download
        `#{@@pkg} install -y  --no-install-recommends wget unzip`
        `wget https://github.com/initdc/KodBox/archive/latest.zip -O /tmp/latest.zip`
        `mkdir -p /var/www/kodbox`
        `unzip /tmp/latest.zip -d /tmp` ; `cp -rf /tmp/KodBox-latest/* /var/www/kodbox`
        `chmod -Rf 777 /var/www/kodbox/*`
    end

    def renew
        `#{@@pkg} install -y --no-install-recommends certbot python3-certbot-nginx`
        `certbot --non-interactive --redirect --agree-tos --nginx -d $domain -m $mail`
    end
end