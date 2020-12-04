class Menu
    def menu
        puts "It has some options here: ".magenta
        #puts
        puts "-a all things will be done by one step".yellow
        #puts
        puts "-b both http and https nginx conf".yellow
        #puts
        puts "-h http nginx conf only".yellow
        #puts
        puts "-s https nginx conf only".yellow
        #puts
        puts "-i install nginx-full, php and other requirements".yellow
        #puts
        puts "-d download #{@@program}, save to /var/www/#{@@program}".yellow
        #puts
        puts "-r renew or get a ssl certificate".yellow
        #puts
        puts "-v version".yellow
        #puts
        puts "-q quit".yellow
        puts
    end
end