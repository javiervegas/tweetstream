#!/usr/bin/env ruby

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/../lib')
require 'mockingbird'

Mockingbird.setup(:port=>80) do
  pipe "/Users/javiervegas/ruby/rails3/tweetstream/test/fixtures/tweet.json", :wait=>1
  close
end
