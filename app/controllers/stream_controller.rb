class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # our Twitter account's Streaming API role.
    until !@id.nil?
      redis = Redis.new
      @status = TweetStream::Status.new(JSON.parse(redis.get("tweet")))
      # The status object is a special Hash with
      # method access to its keys.
      @videorurl = @status.entities.urls.first.andand["expanded_url"] || @status.entities.urls.first.andand["url"]
      @id = @videorurl.scan(/youtube.com\/watch\?v=([-\w]+)/).first #|| @videorurl.scan(/youtu\.be\/([-\w]+)/).first || @videorurl.scan(/vimeo.com\/\D*(\d+)/).first
      puts @status.text
      puts @status.entities.urls.first.andand["url"]
      puts @status.entities.urls.first.andand["expanded_url"]
      puts @videorurl
      puts @id
    end
    @video = VideoInfo.new(@videorurl)
  end

  def show
  end

end
