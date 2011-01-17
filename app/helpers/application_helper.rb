module ApplicationHelper
	
	#helper method to grab the percentage for today
	def percentage_for_today
		Glass.percentage_for(Time.now);
	end
	
	#helper method to tell us how many glasses we've had so far today.  Returns 0 if no glasses have been recorded yet.
	def glasses_so_far_today
		if Glass.current_day
			return Glass.current_day.number || 0
		else
			return 0
		end
	end
	
	#print out a graph using the google chart api for our water drinking history
	def generate_history_chart_url
		history, days = Glass.history
		history = history.reverse.join(',')
		days = days.reverse.join('|')
		url = "http://chart.apis.google.com/chart?chxl=1:|#{days}&chxr=1,10,0&chxt=y,x&chbh=a&chs=525x250&cht=bvg&chco=A8CBF9&chd=t:#{history}"
	end

end
