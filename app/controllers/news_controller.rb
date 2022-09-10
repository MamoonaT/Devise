class NewsController < ApplicationController
	include New::WizardController

	steps :add_post, :add_twitter

	def show 
	 @new = current_new
	 render_wizrad
	end
 
	def update
		@post = current_post
		@post.update_attribute(params[:post])
		render_wizrad @post
	end
end
