module ApplicationHelper
	def title
		base_title = 'PureModels'
		if @title.nil?
			base_title
		else
			"#{@title} | #{base_title}"
		end		
	end
end
