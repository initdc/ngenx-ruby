module Args
    @args = ARGV
    @dry_run = false

    @dry_run_dict = [
        "--dry_run",
        "-D",
        "--test",
        "-T"
    ]
    def self.args
        @dry_run_dict.each do |d|
            @dry_run = true if @args.include?(d)
            @args = @args.delete_if {|a| a == d}
        end

        return @dry_run, @args
    end

    def self.argsTest(*d)
        d.each {|a| return true if @args.include?(a)}
        return false
    end
end
