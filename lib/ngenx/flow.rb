require 'colorize'
require "ngenx/args"
require "ngenx/gen"
require "ngenx/menu"
require "ngenx/os"
require "ngenx/pkg"
require "ngenx/tips"
require "ngenx/user"
require "ngenx/version"

class Flow
    def self.caseFn (*f)
        case f
        when "A" "-A"
            Menu.AIO
        when "G" "-G"
            Gen.http ()
        when "S" "-S"
            Gen.sample
        when "I" "-I"
            Menu.install
        when "H" "-H"
            Menu.help
        when "V" "-V"
            Version.mainVer
        when "--dry_run" "--test"
            Menu.test
        when "--version"
            Version.allVer
        when
            Tips.crash
        end
    end

    def self.run (p)
        Menu.prog = p

        #return -1 if !User.userTest
        return -2 if !OS.osTest
        @dry_run, @args = Args.args

        if @args == []
            Menu.intro
            Menu.options
            self.caseFn Tips.input
        else
            self.caseFn Args.argsTest
        end
    end
end
