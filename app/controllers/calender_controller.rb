class CalendersController < ApplicationController
		def show
		end

		def getCalenderData
			@page = Calender.getPage()	
		end
end
