module Tweets
    def get_new
        visit tweets_path
        click_on "new-tweet"
    end
end

RSpec.configure do |config|
    config.include Tweets
end