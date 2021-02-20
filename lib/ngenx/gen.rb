module Gen
    def self.http(dom, path ,name)
        @domain = dom
        @conf_d = path
        @fileName = name

        @httpConf="server {
    listen 80;
    listen [::]:80;

"
        @redirectConf="server {
    listen 80 default_server;
    listen [::]:80 default_server;

    return 301 https://$host$request_uri;
}

"
        @sslConf="server {
    listen 443 ssl;
    listen [::]:443 ssl;

"
        @http2Conf="server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

"
        @server_nameConf="    server_name #{@domain}

        "
        @logConf="    access_log /var/log/nginx/#{@domain}.access;
    error_log /var/log/nginx/#{@domain}.error;

"
        @php_fpmConf="    root   /var/www/kodbox;
    index  index.php index.html index.htm;

    location /.git {
       deny all;
       return 403;
    }

    location ~ \.php(.*)$ {
        try_files $uri =404;
        fastcgi_pass        unix:/run/php/php-fpm.sock;
        include             fastcgi_params;
        fastcgi_param       SCRIPT_FILENAME    \$document_root\$fastcgi_script_name;
        fastcgi_param       SCRIPT_NAME        \$fastcgi_script_name;
        fastcgi_split_path_info                ^(.+\.php)(.*)$;
        fastcgi_param       PATH_INFO          \$fastcgi_path_info;
    }

    location ~* \.(jpg|jpeg|gif|png|css|js|ico|webp|tiff|ttf|svg)$ {
        expires     30d;
    }

    location ~ .*\.(js|css)?$ {
        expires     12h;
    }

    location ~ /\. {
        log_not_found   off;
        deny    all;
    }

    location ^~ /.well-known {
        allow   all;
        auth_basic  off;
    }

    location = /favicon.ico {
        log_not_found   off;
    }
}
"

        httpFile=File.open(@conf_d+@fileName,"w+")
        httpFile.write(@httpConf+@server_nameConf+@logConf+@php_fpmConf)
        httpFile.close
    end

    def self.sample
        @sampleConf = "server {
    listen 80;
    listen [::]:80;

    server_name _;

    root /var/www/html;
    index index.html index.htm index.nginx-debian.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
"

        sampleFile=File.open(@conf_d+@fileName,"w+")
        sampleFile.write(@sampleConf)
        sampleFile.close
    end
end
