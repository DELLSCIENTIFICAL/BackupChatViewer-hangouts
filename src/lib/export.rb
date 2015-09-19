## BackupChatViewer-hangouts -- A Google Takeout Hangout.json parser for BackupChatViewer
## Copyright (C) 2015 Alexander Scheel <alexander.m.scheel@gmail.com>

require 'set'
require 'json'
require 'fileutils'
require 'date'

module Hangouts
    class Export
        def initialize()
            @options = Hangouts.options()
            if File.exists?(@options.inpath)
                puts "Reading file into JSON object in memory..."
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

        def export()
            puts "Writing timestamp.txt"
            # int[10]
            conv_file = File.write(@options.outdir + '/conversations.csv')
            conv_file.puts google_to_date(@data['continuation_end_timestamp'][0...10])

            puts "Writing conversations.csv"
            # conv_id,people_ids
            conv_file = File.write(@options.outdir + '/conversations.csv')
            conv_file.puts "conv_id,people_ids"
            @data['conversation_state'].each do |conv|
                conv_id = conv['conversation_id']['id']
                people_ids = Set.new
                conv['conversation_state']['conversation']['participant_data'].each do |part|
                    people_ids.add part['id']['chat_id']
                end
                people_ids = people_ids.to_a.join(':')
                conv_file.puts '"' +conv_id + '","' + people_ids + '"'
            end
            conv_file.close()

            puts "Writing people.csv"
            # chat_id,gaia_id,name
            people = Set.new
            people_file = File.write(@options.outdir + '/people.csv')
            people_file.puts "chat_id,gaia_id,name"
            @data['conversation_state'].each do |conv|
                conv['conversation_state']['conversation']['participant_data'].each do |part|
                    chat_id = part['id']['chat_id']
                    gaia_id = part['id']['gaia_id']
                    name = part['fallback_name'].to_s.gsub('"', '""')
                    name = "Unknown User" if part['fallback_name'].nil?
                    people.add({chat_id: chat_id, gaia_id: gaia_id, name: name})
                end
            end
            people.to_a.each do |person|
                people_file.puts '"' + person[:chat_id] + '","' + person[:gaia_id] + '","' + person[:name] + '"'
            end
            people_file.close()

            puts "Writing messages.csv"
            # conv_id,event_id,sender_id,message_id,segment_id,message_time,segment_type,segment_content
            messages_file = File.write(@options.outdir + '/messages.csv')
            messages_file.puts "conv_id,event_id,sender_id,message_id,segment_id,message_time,segment_type,segment_content"
            @data['conversation_state'].each do |conv|
                conv_id = conv['conversation_id']['id']
                if !conv['conversation_state'] .nil? and !conv['conversation_state']['event'].nil?
                    conv['conversation_state']['event'].each_with_index do |event, index|
                        event_id = event['event_id']
                        message_id = index
                        message_time = google_to_date(event['timestamp'])
                        sender_id = event['sender_id']['chat_id']
                        if !event['chat_message'].nil? and !event['chat_message']['message_content'].nil? and !event['chat_message']['message_content']['segment'].nil?
                            event['chat_message']['message_content']['segment'].each_with_index do |segment, index|
                                segment_type = segment['type']
                                segment_content = segment['text']
                                segment_id = index
                                messages_file.puts '"' + conv_id.to_s + '","' + event_id.to_s + '","' + sender_id.to_s + '","' + message_id.to_s + '","' + segment_id.to_s + '","' + message_time.to_s + '","' + segment_type.to_s + '","' + segment_content.to_s.gsub('"', '""') + '"'
                            end
                        end
                    end
                end
            end

            messages_file.close()
        end

        def export_dry()
            puts "Writing timestamp.txt"
            puts "w`" + @options.outdir + "/timestamp.txt`: " + google_to_date(@data['continuation_end_timestamp'])

            puts "Writing conversations.csv"
            @data['conversation_state'].each do |conv|
                conv_id = conv['conversation_id']['id']
                people_ids = Set.new
                conv['conversation_state']['conversation']['participant_data'].each do |part|
                    people_ids.add part['id']['chat_id']
                end
                people_ids = people_ids.to_a.join(':')
                puts "w`" + @options.outdir + '/conversations.csv`: "' +conv_id + '","' + people_ids + '"'
            end

            puts "Writing people.csv"
            # chat_id,gaia_id,name
            people = Set.new
            @data['conversation_state'].each do |conv|
                conv['conversation_state']['conversation']['participant_data'].each do |part|
                    chat_id = part['id']['chat_id']
                    gaia_id = part['id']['gaia_id']
                    name = part['fallback_name']
                    name = "Unknown User" if part['fallback_name'].nil?
                    people.add({chat_id: chat_id, gaia_id: gaia_id, name: name})
                end
            end
            people.to_a.each do |person|
                puts "w`" + @options.outdir + '/conversations.csv`: "' + person[:chat_id] + '","' + person[:gaia_id] + '","' + person[:name] + '"'
            end

            puts "Writing messages.csv"
            # conv_id,event_id,sender_id,message_id,segment_id,message_time,segment_type,segment_content
            @data['conversation_state'].each do |conv|
                conv_id = conv['conversation_id']['id']
                if !conv['conversation_state'] .nil? and !conv['conversation_state']['event'].nil?
                    conv['conversation_state']['event'].each_with_index do |event, index|
                        event_id = event['event_id']
                        message_id = index
                        message_time = google_to_date(event['timestamp'])
                        sender_id = event['sender_id']['chat_id']
                        if !event['chat_message'].nil? and !event['chat_message']['message_content'].nil? and !event['chat_message']['message_content']['segment'].nil?
                            event['chat_message']['message_content']['segment'].each_with_index do |segment, index|
                                segment_type = segment['type']
                                segment_content = segment['text']
                                segment_id = index
                                puts "w`" + '/messages.csv`: "' + conv_id.to_s + '","' + event_id.to_s + '","' + sender_id.to_s + '","' + message_id.to_s + '","' + segment_id.to_s + '","' + message_time.to_s + '","' + segment_type.to_s + '","' + segment_content.to_s.gsub('"', '""') + '"'
                            end
                        end
                    end
                end
            end
        end

        def google_to_date(input)
            return Time.at(input[0...10].to_i).strftime('%Y-%m-%d %H:%M:%S') + "." + input[10...14]
        end

        def close()
        end
    end
end
