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
