class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # your Twitter account's Streaming API role.
    TweetStream::Client.new('javiervegas','9yogurines9').track('youtube') do |@status|
      # The status object is a special Hash with
      # method access to its keys.
      @yturl = @status.entities.urls.first.andand["expanded_url"] || @status.entities.urls.first.andand["url"]
      @id = @yturl.scan(/youtube.com\/watch\?v=([-\w]+)/).first || @yturl.scan(/youtu\.be\/([-\w]+)/).first
      puts @status.text
      puts @status.entities.urls.first.andand["url"]
      puts @status.entities.urls.first.andand["expanded_url"]
      puts @yturl
      puts @id
      break if !@id.nil?
    end
    @video = VideoInfo.new(@yturl)
  end

  def show
  end

end
