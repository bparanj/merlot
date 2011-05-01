class FeedbacksController < ApplicationController
  def new
    @feedback = Feedback.new
  end
  
  def create
    @feedback = Feedback.new(params[:feedback])
    if @feedback.valid?
      Pony.mail(:to => 'bparanj@gmail.com', :from => params[:email], 
                :subject => 'RadiumLogic Feedback', 
                :body => "Sent By: #{params[:feedback][:name]} Message is #{params[:feedback][:message]}" )
      flash[:notice] = "Message sent! Thank you for contacting us."
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
end