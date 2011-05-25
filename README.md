# tweetstream

Rails app that displays videos shared in Twitter. Its backend connects to the
Twitter firehose and looks for links to Youtube or Vimeo videos to display.
It can display generic shared videos or thematic channels. It uses resque
(a redis-powered queue) to enqueue videos for display.
