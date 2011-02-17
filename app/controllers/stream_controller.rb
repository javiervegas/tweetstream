class StreamController < ApplicationController
  def index
    # This will pull a sample of all tweets based on
    # your Twitter account's Streaming API role.
    client = TweetStream::Client.new('javiervegas','9yogurines9')
    client.on_limit do |skip_count|
      return "limit #{skip_count}"
    end
    client.track('youtube') do |status|
      # The status object is a special Hash with
      # method access to its keys.
      @text =  status.text
      @url = status.entities.urls.first.andand["url"]
      @id = @text.scan(/youtu\.be\/([-\w]+)/).first
      puts "#{@text}  => #{@url}"
      break if !@id.nil?
    end
  end

  def show
  end

end
