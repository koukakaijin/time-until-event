#!/usr/bin/ruby
require 'rbconfig'
class SystemUtils
	def os
		@os ||= (host_os = RbConfig::CONFIG['host_os']
			case host_os
			when /mswin|msys|mingw|cygwin|bccwin|wince|emc/
				:windows
			when /darwin|mac os/
				:macosx
			when /linux/
				:linux
			when /solaris|bsd/
				:unix
			else
				raise Error::WebDriverError, "unknown os: #{host_os.inspect}"
			end
		)
	end
	def clear
		os==:windows ? system("cls") : system("clear")
	end
	def file_exists?(file)
		File.file?(file)
	end
	#create a file with the initial value
	def createFile(file,time)
		File.open(file, "w+") do |f|
			f.print time
		end
	end
	def readFile(file)
		text = ""
		File.open(file, "r").each_line do |line|
			return text << line
		end
	end
	def directory_exists?(directory)
		File.directory?(directory)
	end
end
