module Version
    def self.buildVer
        @major = 0
        @minor = 1
        @tiny  = 0
        @pre   = nil

        @ver = [@major, @minor, @tiny, @pre].compact.join(".")
    end

    MainVer     = self.buildVer
    ArgsVer     = "0.1.0"
    GenVer      = "0.1.0"
    MenuVer     = "0.1.0"
    OSVer       = "0.1.0"
    PKGVer      = "0.1.0"
    UserVer     = "0.1.0"

    def self.mainVer
        puts "ngenx"
        puts "Version:   " + MainVer
    end

    def self.allVer

        contributors = [

        ]

        puts "ngenx".cyan + " -- nginx configuration generate tool ".blue
        Tips.colorTest

        puts "Main:      ".blue + MainVer.green
        puts "Args:      ".blue + ArgsVer.green
        puts "OS:        ".blue + OSVer.green
        puts "Menu:      ".blue + MenuVer.green
        puts "PKG:       ".blue + PKGVer.green
        puts "User:      ".blue + UserVer.green
        puts "Gen:       ".blue + GenVer.green
        puts

        puts "Author:".blue
        puts "initdc".cyan
        print "Contributors: ".blue
        contributors.each {|x| print("\n#{x}".cyan)}
        puts
    end

end
