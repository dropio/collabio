class HomeController < ApplicationController
  def index
    
    return unless request.post? && params_valid?
    
    @topic = params[:topic].downcase.gsub(/[^a-zA-Z0-9_]/,'_').squeeze('_')
    
    @drop = Dropio::Drop.create({ 
      :name => @topic,
      :guests_can_comment => true,
      :guests_can_add => true,
      :guests_can_delete => false,
      :expiration_length => "1_WEEK_FROM_LAST_VIEW"
      })
      
    RAILS_DEFAULT_LOGGER.info @drop.inspect
      
    @recipients, bad_emails = [],[]
    emails = params[:participants].split(",")
    filter = Regexp.new('^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$')
    emails.each {|email| (filter.match(email) ? @recipients : bad_emails) << email }

    InviteMailer.deliver_message(@drop, params[:coordinator], params[:topic], params[:time], @recipients, params[:message])
    
    redirect_to @drop.generate_url
  end
  
  private
  
  def params_valid?
    return false if params[:topic].blank?
    return false if params[:coordinator].blank?
    return false if params[:participants].blank?
    return false if params[:time].blank?
    
    return true
  end

end
