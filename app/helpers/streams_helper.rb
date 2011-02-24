module StreamsHelper
  def convert_seconds_to_time(seconds)
    full_minutes = seconds / 1.minutes
    seconds_in_last_minute = seconds - full_minutes.minutes.seconds
    (full_minutes>0?"#{full_minutes} minutes ":"")+"#{seconds_in_last_minute} seconds"
  end
end
