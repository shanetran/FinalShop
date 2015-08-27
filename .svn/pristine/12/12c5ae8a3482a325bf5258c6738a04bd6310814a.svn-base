class CommentsController < ApplicationController
   def create
   
   comment = Comment.create!(user_id: current_user.id, product_id: params[:product_id],
                     title: params[:title], message: params[:message], rate: params[:rate]).valid?
     if comment
       flash[:success] = "You added comment."
       redirect_to :back
     else
       flash[:errot] = "Add comment fail."
       redirect_to :back
     end 
   end
end