#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
require './my_room_temper'
require './temper_producer'
require 'yaml'

class MainApp
	@temper_path = nil
	@talkpi_path = nil
	@topic = nil
	@broker_host = nil
	@client_id = nil

	def initialize(conf_file)
		data = YAML.load_file(conf_file)
		@temper_path = data['temper_path']
		@talkpi_path = data['talkpi_path']
		@topic = data['topic']
		@broker_host = data['broker_host']
		@client_id = data['client_id']
	end

	def main()
    puts @broker_host
    puts @client_id
		mrt = MyRoomTemper.new(@temper_path, @talkpi_path)
		tp = TemperProducer.new(@broker_host, @client_id, @topic)
		# message = mrt.get_temper()
    message = "test data"
		tp.send(message)
	end
end

# main 
if ARGV.legnth != 1
  puts "Please Input Config File"
  exit
end
file_path = File.expand_path(ARGV[0])
ma = MainApp.new(file_path)
ma.main()
