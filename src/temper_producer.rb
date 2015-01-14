#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
require 'poseidon'

class TemperProducer
	@producer = nil
	@topic = nil
	def initialize(broker_host, client_id, topic)
		@topic = topic
		@producer = Producer.new(broker_host, client_id, :type => :sync, :compression_codec => :gzip)
	end

	def send(message)
		@producer.send_messages([Poseidon::MessageToSend.new(@topic, message)])
	end
end