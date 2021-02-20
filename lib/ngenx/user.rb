module User
    def self.userTest
        @user=`id -u`
        # print @user

        if @user.delete("\n") == "0"
            return true
        else
            print "ngenx runs with non root access, ".blue
            case
            when `(command -v sudo)`.to_s != ""
                puts "please run ngenx with ".blue + "sudo".cyan
            when `(command -v su)`.to_s != ""
                puts "please run ngenx with ".blue + "su -c".cyan
            else
                puts "plese run with root user.".blue
            end
            return false
        end
    end
end