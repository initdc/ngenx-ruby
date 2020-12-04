class Args
    @@args = ARGV
    print @@args

    @@dry_run = @@args.include?("--dry-run")
    @@args.delete_if { |d| d=="--dry-run" }
    print @@args

    @@arg1 = @@args[0]
end
