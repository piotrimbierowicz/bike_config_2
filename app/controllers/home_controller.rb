# encoding: utf-8
class HomeController < ApplicationController

	def index
		
	end

	def data
		render :json => @data
	end

	def test
		result = ""
		for part in @data[:left_elements]
			for type in part[:types]
				for color in type[:colors]
					result += color[:file]
					if File.exist?('/Users/piotr/Documents/praca/bike_config/public/images/parts/' + color[:file])
						result += ' <span style="color:green">OK</span>'
					else
						result += ' <span style="color:red">E</span>'
					end
					result += '<br />'
				end
			end
		end
		for part in @data[:right_elements]
			for type in part[:types]
				for color in type[:colors]
					result += color[:file]
					if File.exist?('/Users/piotr/Documents/praca/bike_config/public/images/parts/' + color[:file])
						result += ' <span style="color:green">OK</span>'
					else
						result += ' <span style="color:red">E</span>'
					end
					result += '<br />'
				end
			end
		end
		render :text => result
	end

end