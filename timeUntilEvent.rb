#!/usr/bin/ruby
chaos = Time.new(2014,10,24,12,00,00) #set time to event
today = Time.now
system("cls")
def panico(panic)
		days = (panic / (60*60*24)).floor
		rest = (panic % (60*60*24))
		hours = (rest / (60*60)).floor
		rest = (rest % (60*60))
		minutes = (rest / 60).floor
		rest = (rest % 60)
		p "Still #{days} days #{hours} hours #{minutes} minutes #{rest} seconds"
end
while((chaos-today).to_i>0) do
today = Time.now
panic = (chaos-today).to_i
system("cls")
panico(panic)
sleep(1)
today = Time.now
end
p "Chaos reached"
