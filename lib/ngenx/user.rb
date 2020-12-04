class User
    def userTest
        @@user=`id -u`
        # puts @@user.delete("\n")

        if @@user.delete("\n") == "0"
            return true
        else
            print "Ngenx runs with non root access, ".blue
            if `echo $(command -v sudo)`
                puts "please run Ngenx with ".blue + "sudo".cyan
            elsif `echo $(command -v su)`
                puts "please run Ngenx with ".blue + "su -c".cyan
            else
                puts "plese run with root user.".blue
            end
        end
    end
end