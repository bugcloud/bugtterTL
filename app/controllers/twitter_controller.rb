class TwitterController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @second_statuses }
    end
  end

  def show_timeline
    @client = initialize_twitter(params[:twitter_username], params[:twitter_pass])
    @timeline = get_friends_timeline
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @second_statuses }
    end
  end

  private
  def initialize_twitter(user, pass)
    twitter_cl = Twitter::Client.new(:login => user, :password => pass)
    return twitter_cl
  end

  def get_friends_timeline
    twitter_tl = @client.timeline_for(:friend, :count => 10)
    return twitter_tl
  end

end
