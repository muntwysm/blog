module Admin::UsersHelper
	def status_link_text(user)
		user.active? ? 'De-activate' : 'Activate'
	end
end
