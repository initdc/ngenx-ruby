require 'colorize'

module Version

    MainVer     = "0.1.0"
    ArgsVer     = "0.1.0"
    OSVer       = "0.1.0"
    DistroVer   = "0.1.0"
    PKGVer      = "0.1.0"
    UserVer     = "0.1.0"
    GenVer      = "0.1.0"

    def mainVer
        puts "ngenx".cyan
        puts "MainVer:   ".blue + MainVer.green
    end

    def version
        puts "ngenx".cyan
        puts "MainVer:   ".blue + MainVer.green
        puts "ArgsVer:   ".blue + ArgsVer.green
        puts "OSVer:     ".blue + OSVer.green
        puts "DistroVer: ".blue + DistroVer.green
        puts "PKGVer:    ".blue + PKGVer.green
        puts "UserVer:   ".blue + UserVer.green
        puts "GenVer:    ".blue + GenVer.green
    end
end
