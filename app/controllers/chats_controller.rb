class ChatsController < ApplicationController
  def index
    @chats = Chat.order(id: :desc).page(params[:page])
    respond_to do |format|
      format.html{}
      format.js {}
    end
  end

  def create
    if Chat.create(user_id: current_user.id, message: params[:chats][:message]).valid?
      @chats = Chat.order(id: :desc).page(params[:page])
      flash[:success] = "Add chat success..."
      respond_to do |format|
        format.html{}
        format.js {}
      end
    else
      flash[:error] = "Add chat fail !!!"
      redirect_to :back
    end
  end

  def update
    if Chat.find(params[:id]).update(message: params[:message])
      @chats = Chat.order(id: :desc).page(params[:page])
      flash[:success] = "Update chat success..."
      respond_to do |format|
        format.html{}
        format.js {}
      end
    else
      flash[:error] = "Update chat fail !!!"
      redirect_to :back
    end
  end

  def destroy
    if Chat.find(params[:id]).destroy
      @chats = Chat.order(id: :desc).page(params[:page])
      flash[:success] = "Delete chat success..."
      respond_to do |format|
        format.html {}
        format.js {}
      end
    end
  end
end
