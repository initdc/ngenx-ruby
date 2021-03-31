module Tips
    def self.warning
        puts "You need to know this action will change system file, continue?".yellow
        input = gets
        puts "you input #{input}"

        if ["\r", "y","Y","yes"].include? input
            return true
        end
        return false
    end

    def self.choice (*o)
        o.each {|c| return true if @input.include?(c)}
        return false
    end

    def self.input
        g = ""
        while g == ""
            g = gets
        end
        return g
    end

    def self.exEnter
        g = ""
        while g == "" || g == "\r"
            g = gets
        end
        print g.to_s
        return g
    end

    def self.done
        puts "Completed.".green
    end

    def self.none
        puts "!!! Not completed".red
    end

    def self.quit
        puts "ngenx quit ...".blue
    end

    def self.crash
        puts "Unkonwn option".red
    end

    def self.colorTest
        puts "---".red + "---".green + "---".yellow + "---".blue + "---".magenta + "---".cyan
    end
end