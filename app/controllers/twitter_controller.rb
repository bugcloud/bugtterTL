class TwitterController < ApplicationController
  def index
    @show_page = 0
    @next = 0
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def error
    respond_to do |format|
      format.html # index.html.erb
      #format.xml  { render :xml => @second_statuses }
    end
  end

  def show_timeline
    if params[:twitter_username].blank? || params[:twitter_pass].blank?
      flash[:notice] = "Input USERNAME and PASSWARD."
      render :error
    else
      begin
        cl = initialize_twitter_by_basicauth(params[:twitter_username], params[:twitter_pass])
       #    cl = initialize_twitter_by_oauth
        @timeline = get_friends_timeline(cl, params[:range].to_i)
        respond_to do |format|
          format.html # show_timeline.html.erb
        end
      rescue Rubytter::APIError
        flash[:notice] = "Login failed. Check USERNAME and PASSWARD."
        render :error
      end
    end
  end

  def post_tweet
    if params[:twitter_username].blank? || params[:twitter_pass].blank? || params[:tweet].blank?
      flash[:notice] = "Input USERNAME,PASSWARD and tweet."
      render :error
    else
      begin
        cl = initialize_twitter_by_basicauth(params[:twitter_username], params[:twitter_pass])
        cl.update(params[:tweet])
        @timeline = get_friends_timeline(cl, params[:page])
        respond_to do |format|
          format.html # show_timeline.html.erb
        end
      rescue Rubytter::APIError
        flash[:notice] = "Login failed. Check USERNAME and PASSWARD."
        render :error
      end
    end
  end

  private
  def initialize_twitter_by_basicauth(user, pass)
    twitter_cl = Rubytter.new(user, pass)
    return twitter_cl
  end

  #This is my test method.
  #You can use this method if you set some KEYs in environment.rb
  #Ref:http://d.hatena.ne.jp/shibason/20090802/1249204953
  #  $CONSUMER_KEY
  #  $CONSUMER_SECRET
  #  $ACCESS_TOKEN
  #  $ACCESS_TOKEN_SECRET
#  def initialize_twitter_by_oauth()
#    consumer = OAuth::Consumer.new(
#      $CONSUMER_KEY,
#      $CONSUMER_SECRET,
#      :site => 'http://twitter.com'
#    )
#    access_token = OAuth::AccessToken.new(
#      consumer,
#      $ACCESS_TOKEN,
#      $ACCESS_TOKEN_SECRET
#    )
#    twitter_cl = OAuthRubytter.new(access_token)
#    return twitter_cl
#  end

  def get_friends_timeline(client, page)
    twitter_tl = client.friends_timeline(:page => page)
    return twitter_tl
  end

end
