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
    def self.run (p)
        Menu.prog = p
        Menu.intro

        # return -1 if !User.userTest
        @dry_run, @args = Args.args

        if @args == []
            Menu.options
            Tips.warning
        else
            case
            when Args.argsTest("-V")
                Version.mainVer
            when Args.argsTest("--version")
                Version.allVer
            when
                Tips.crash
                return -2
            end
        end
    end
end
