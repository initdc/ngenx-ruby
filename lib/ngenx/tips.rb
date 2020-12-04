class Tips
    def warning
        puts "You need to know this action will change system file, continue?".yellow
        choice = gets
        puts choice

        if !(["y","Y","\r","yes"].include?(choice))
            self.quit
        end
    end

    def done
        puts "Completed !".green
    end

    def none
        puts "!!! Not completed".red
    end

    def quit
        puts "Ngenx quit ...".blue
        return 0
    end

    def colorTest
        puts "---".red + "---".green + "---".yellow + "---".blue + "---".magenta + "---".cyan
    end

    def intro
        self.colorTest
        puts "nginx configuration generate tool ".blue + "(for #{@program})".cyan
        self.colorTest
    end
end