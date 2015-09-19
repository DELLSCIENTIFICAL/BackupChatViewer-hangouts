#!/usr/bin/env ruby
## BackupChatViewer-hangouts -- A Google Takeout Hangout.json parser for BackupChatViewer
## Copyright (C) 2015 Alexander Scheel <alexander.m.scheel@gmail.com>

require 'set'
require "lib/options"

module Hangouts
    def self.start()
        @options = Hangouts::Options.new(ARGV)
        Hangouts::Options.new(['--help']) if ARGV.size == 0
        
        unless @options.dry
            unless Dir.exists?(@options.outdir)
                Dir.mkdir(@options.outdir)
            end
        end
        
        @options.tasks.each do |task|
            worker = nil
            if task == 'export'
                worker = Hangouts::Export.new
            else if task == 'list'
                worker = Hangouts::List.new
            else if task == 'accounts'
                worker = Hangouts::Accounts.new
            end
            
            if worker
                worker.start
                worker.close
                GC.start
            end
        end
    end 
    
    def self.options()
        return @options
    end
end

if __FILE__ == $0
    Hangouts.start()
end