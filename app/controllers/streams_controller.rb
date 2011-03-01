class StreamsController < ApplicationController

  respond_to :html, :xml, :json
  
  # GET /streams
  # GET /streams.xml
  def index
    redis = Redis::Namespace.new(:tweetstream,:redis => Redis.new)
    @status = TweetStream::Status.new(JSON.parse(redis.get("tweet")))
    # The status object is a special Hash with
    # method access to its keys.
    @video = @status.video.info.video
    @videoid = @status.video.videoid
    redis.setnx(@status.id, redis.get("tweet"))
    redis.zadd(session[:session_id], Time.now.to_i, @status.id)
    redis.zrevrange(session[:session_id],0,9,{:with_scores => true}).each do |k|
      puts Time.at k.to_i
    end
    render :template =>  "streams/show"
  end

  # GET /streams/1
  # GET /streams/1.xml
  def show
    redis = Redis::Namespace.new(:tweetstream,:redis => Redis.new)
    @status = TweetStream::Status.new(JSON.parse(redis.get(params[:id])))
    #@status = TweetStream::Status.new(JSON.parse(redis.get("tweet")))
    # The status object is a special Hash with
    # method access to its keys.
    @video = @status.video.info.video
    @videoid = @status.video.videoid
    #respond_with @stream
  end

end
