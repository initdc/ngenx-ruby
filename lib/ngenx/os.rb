module OS
    def self.osTest
        @os=`uname`
        # print @os

        case @os.delete("\n")
        when "Linux","Darwin"
            puts "Supported OS: " + @os
            return true
        # when "FreeBSD"
        else
            puts "Unsupported OS: " + @os
            return false
        end
    end
end