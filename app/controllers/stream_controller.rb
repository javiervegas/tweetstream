class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # our Twitter account's Streaming API role.
    redis = Redis.new
    @status = TweetStream::Status.new(JSON.parse(redis.get("tweet")))
    # The status object is a special Hash with
    # method access to its keys.
    @video = @status.video.video
  end

  def show
  end

end
