## BackupChatViewer-hangouts -- A Google Takeout Hangout.json parser for BackupChatViewer
## Copyright (C) 2015 Alexander Scheel <alexander.m.scheel@gmail.com>

require 'set'
require 'json'
require 'fileutils'

module Hangouts
    class Export
        def initialize()
            @options = Hangouts.options()
            if File.exists?(@options.inpath)
                temporary = File.read(@options.inpath)
                @data = JSON.parse(temporary)
                temporary = nil
                GC.start()
            else
                puts "Missing input file #{@options.inpath}..."
            end
        end

        def start()
            if @options.dry
                export_dry()
            else
                export()
            end
        end

        def export_dry()
            puts "Writing timestamp: "
            puts "w`#{@options.outdir + "/timestamp.txt"}` #{@data['continuation_end_timestamp'][0...10]}"
            #File.write(@options.outdir + "/timestamp.txt").puts @data['continuation_end_timestamp'][0...10]
        end

        def export()
        end
    end
end
