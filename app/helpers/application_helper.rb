module ApplicationHelper
	
	def fix_url(str)
		if str != nil
			str.starts_with?("http://") ? str : "http://#{str}"
		end
	end

	def format_date(date)
		date.strftime("%m/%d/%y")
	end
	
end
