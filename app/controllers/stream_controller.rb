class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # our Twitter account's Streaming API role.
    redis = Redis::Namespace.new(:tweetstream,:redis => Redis.new)
    @status = TweetStream::Status.new(JSON.parse(redis.get("tweet")))
    redis.setnx(@status.id,@status)
    # The status object is a special Hash with
    # method access to its keys.
    @video = @status.video.info.video
    @videoid = @status.video.videoid
  end
end
