class OS
    def osTest
        @@os=`uname`
        # puts @@os.delete("\n") == "Darwin"

        case @@os.delete("\n")
        when "Linux"
            puts "Supported OS: " + @@os
            return true
            # when "Darwin"
            # when "FreeBSD"
        else
            puts "Unsupported OS: " + @@os
            return false
        end
    end
end