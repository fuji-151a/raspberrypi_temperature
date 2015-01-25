#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
require 'poseidon'

# 温度をKafkaにProduceするClass
class TemperProducer
	@producer = nil
	@topic = nil

  def initialize(broker_host, client_id, topic)
		@topic = topic
		@producer = Poseidon::Producer.new(get_broker_list(broker_host), client_id, :type => :sync, :compression_codec => :gzip)
  end

	def send(message)
    messages = []
    messages << Poseidon::MessageToSend.new(@topic, message)
		@producer.send_messages(messages)
	end

  private
  def get_broker_list(broker_host)
    broker_list = []
    broker_host = broker_host.gsub(" ", "")
    if broker_host.count(",") > 0
      broker_list = broker_host.split(",")
    else
      broker_list << broker_host
    end
  end

end
