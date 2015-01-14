#! /usr/bin/ruby
# -*- encoding: utf-8 -*-
# require 'yaml'

class MyRoomTemper
	@temper_path = nil
	@talkpi_path = nil

	def initialize(temper_path, talkpi_path)
		@temper_path = temper_path
		@talkpi_path = talkpi_path
	end

	def get_temper()
		value = `#{@temper_path}/temper`
		array = value.split[2]
		return array[2]
	end

	def talk_temper(temper, speed = 0, volume = 0)
		talk = "現在の部屋の温度は#{temper}"
		`#{@talkpi_path}/AquesTalkPi -s #{speed} "#{talk}" | aplay`
	end
end
