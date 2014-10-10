#!/usr/bin/ruby
require 'time'
class TimeUtils
	def getTime(ye,mo,da,ho,mi,se)
		return time = Time.new(ye,mo,da,ho,mi,se)
	end
	def getCurrentTime
		return time = Time.now
	end
	#resta a t1 el tiempo de t2
	def subtract(t1,t2) ##revisar name
		return (t1-t2).to_i
	end
	#resta a t1 el tiempo de t2 return in a array
	def subtractUTF(t1,t2)
		t3=subtract(t1,t2)
		days = (t3 / (60*60*24)).floor
		rest = (t3 % (60*60*24))
		hours = (rest / (60*60)).floor
		rest = (rest % (60*60))
		minutes = (rest / 60).floor
		rest = (rest % 60)
		result=[days,hours,minutes,rest]
		return result
	end
	#return the seconds left until t1
	def timeRemaining(t1)
		return subtract(t1,getCurrentTime)
	end
	#return el tiempo restante hasta la fecha indicada
	def timeRemainingUTF(t1)
		return subtractUTF(t1,getCurrentTime)
	end
	def addTime(da,ho,mi,se,t1=getCurrentTime)
		return t1+(da*60*60*24+ho*60*60+mi*60+se)
	end
	def stringToTime(s)
		return Time.parse(s)
	end
end
