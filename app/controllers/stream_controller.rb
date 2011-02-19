class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # our Twitter account's Streaming API role.
    TweetStream::Client.new('javiervegas','9yogurines9').track('vimeo','youtube') do |@status|
      # The status object is a special Hash with
      # method access to its keys.
      @videorurl = @status.entities.urls.first.andand["expanded_url"] || @status.entities.urls.first.andand["url"]
      @id = @videorurl.scan(/youtube.com\/watch\?v=([-\w]+)/).first #|| @videorurl.scan(/youtu\.be\/([-\w]+)/).first || @videorurl.scan(/vimeo.com\/\D*(\d+)/).first
      puts @status.text
      puts @status.entities.urls.first.andand["url"]
      puts @status.entities.urls.first.andand["expanded_url"]
      puts @videorurl
      puts @id
      break if !@id.nil?
    end
    @video = VideoInfo.new(@videorurl)
  end

  def show
  end

end
