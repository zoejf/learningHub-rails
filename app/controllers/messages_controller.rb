class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create 
    @message = Message.new(params[:message])
    if @message.valid?
      p "messages controller valid"
      #sends email when message is submitted
      ResourceMailer.resource_email(@message).deliver_now

      flash[:notice] = "Message sent! Thanks for suggesting a new resource."
      redirect_to root_path
    else
      flash[:error] = "Error, please try to submit form again."
      redirect_to about_path
    end 
  end

end