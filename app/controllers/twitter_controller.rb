class TwitterController < ApplicationController
  def index
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @second_statuses }
    end
  end

  def show_timeline
    cl = initialize_twitter(params[:twitter_username], params[:twitter_pass])
    @timeline = get_friends_timeline(cl)
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @second_statuses }
    end
  end

  private
  def initialize_twitter(user, pass)
    #Basic auth
    httpauth = Twitter::HTTPAuth.new(user, pass)
    twitter_cl = Twitter::Base.new(httpauth)
    return twitter_cl
  end

  def get_friends_timeline(client)
    twitter_tl = client.friends_timeline()
    return twitter_tl
  end

end
