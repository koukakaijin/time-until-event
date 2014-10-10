#!/usr/bin/ruby
require_relative 'Utils/TimeUtils.rb'
require_relative 'Utils/SystemUtils.rb'
t=TimeUtils.new
s=SystemUtils.new
def requestData
	puts "It is necessary that you insert the time to the event"
	puts "Insert days remaining (numeric value)"
	d = gets.chomp
	puts "Insert hours remaining (numeric value)"
	h = gets.chomp
	puts "Insert minutes remaining (numeric value)"
	m = gets.chomp
	puts "Insert seconds remaining (numeric value)"
	s = gets.chomp
	return t =[d.to_i,h.to_i,m.to_i,s.to_i]
end
if !s.directory_exists?("Config")
	Dir.mkdir("Config")
end
if (!s.file_exists?("Config/.conf.txt"))
	e = requestData #set time to event
	eventTime = t.addTime(e[0],e[1],e[2],e[3])
	s.createFile("Config/.conf.txt",eventTime)
end
chaos = t.stringToTime(s.readFile("Config/.conf.txt"))
s.clear
while(t.timeRemaining(chaos)>0) do
today = Time.now
s.clear
a = t.timeRemainingUTF(chaos)
p "Still #{a[0]} days #{a[1]} hours #{a[2]} minutes #{a[3]} seconds"
sleep(1)
end
p "Chaos reached"
