## BackupChatViewer-hangouts -- A Google Takeout Hangout.json parser for BackupChatViewer
## Copyright (C) 2015 Alexander Scheel <alexander.m.scheel@gmail.com>

require 'optparse'

module Hangouts
    class Options
        attr_reader :inpath, :outdir, :dry, :tasks
        attr_accessor :conversations
        
        def initialize(args)
            @args = args.dup
            @inpath = "Hangouts.json"
            @outdir = "converted"
            @values = {}
            @tasks = []
            @conversations = []
            @dry = false
            
            @parsed = OptionParser.new do |opts|
                opts.on("-i", "--input FILENAME", String, "Path of Hangouts.json working file, default `Hangouts.json`") do |value|
                    @inpath = value
                end
                
                opts.on("-o", "--output DIRPATH", String, "Path to output directory, default `converted/`") do |value|
                    @outdir = value
                end
                
                opts.on("-d", "--dry", "Dry run only, default false") do |value|
                    @dry = true
                end
                
                opts.on("-l", "--list", "List conversation IDs") do |value|
                    @tasks.push('list')
                end
                
                opts.on("-e", "--export", "Export conversations") do |value|
                    @tasks.push('export')
                end
                
                opts.on("-c", "--conversations CONVERSATION[,CONVERSATION]", Array, "Only export selected conversations") do |values|
                    values.each do |value|
                        @conversations.push(value)
                    end
                end
                
                opts.on_tail("-h", "--help", "Display this help message and exit") do |value|
                    puts opts
                    exit 0
                end
            end.parse!(@args)
        end
    end
end