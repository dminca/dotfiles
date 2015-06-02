# LOCATION: ~/Projects/application/config/initializers/backtrace_silencers.rb
# Be sure to restart your server when you modify this file.

# You can add backtrace silencers for libraries that you're using but don't wish to see in your backtraces.
# Rails.backtrace_cleaner.add_silencer { |line| line =~ /my_noisy_library/ }

# You can also remove all the silencers if you're trying do debug a problem that might steem from framework code.
# Rails.backtrace_cleaner.remove_silencers!
# file://%s&amp;line=%d&amp;column=%d

if defined?(Footnotes)
  Footnotes::Filter.prefix = 'subl://open?url=file://%s:%d:%d'
end

