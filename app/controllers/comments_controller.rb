class CommentsController < ApplicationController

   def create
     comment = Comment.create!(user_id: current_user.id, product_id: params[:product_id],
                       title: params[:title], message: params[:message], rate: params[:rate]).valid?
     rating = Comment.where(product_id: params[:product_id]).average(:rate).to_f
     product = Product.find(params[:product_id]).update(avg_rating: rating)
     if comment && product
       flash[:success] = "You added comment."
       redirect_to :back
     else
       flash[:errot] = "Add comment fail."
       redirect_to :back
     end 
   end
   
   
   def update
     if Comment.find(params[:id]).update!(title: params[:title], message: params[:message], rate: params[:rate],
                                          user_id: current_user.id, product_id: params[:product_id])
        flash[:success] = "Update comment complete."
        redirect_to :back
     else
        flash[:error] = "Update comment fail !!!"
        redirect_to :back
     end
   end
   
   def destroy
     Comment.find(params[:id]).destroy
     flash[:success] = "Remove comment complete."
     redirect_to :back
   end
   
end