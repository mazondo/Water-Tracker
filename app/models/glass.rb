class Glass < ActiveRecord::Base
	
	#grab the current day
	def self.current_day
		Glass.for_the_date(Time.now)
	end
	
	#grab any day we need
	def self.for_the_date(date = Time.now)
		Glass.where("created_at > ? AND created_at < ?", date.beginning_of_day, date.end_of_day).first
	end
	
	#increment number of glasses for today by 1
	def self.one_more
		if current_day
			today = current_day
		else
			today = Glass.new
		end
		today.increment!("number")
		return today
	end
	
	#decrement number of glasses for today by 1
	def self.one_less
		if current_day
			today = current_day
			today.decrement!("number")
		end
	end	
	
	#grab values for the previous 10 days, including days with none
	def self.history
		values = []
		days = []
		(1..10).each do |n|
			values << percentage_for(n.days.ago)
			days << n.days.ago.strftime("%b %d")
		end
		return values, days
	end
	
	#calculate a percentage for any given day
	def self.percentage_for(date = Time.now)
	  	glasses = Glass.for_the_date(date)
	  	if glasses
	  		return ((glasses.number.to_f / APP_CONFIG['glasses_per_day'])*100).to_i
	  	else
	  		return 0
	  	end	
  	end
end
