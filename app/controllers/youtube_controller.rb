
class YoutubeController < ApplicationController
    require 'trollop'
    GOOGLE_API_KEY = Rails.application.credentials.api_key[:google]

    def find_videos(keyword, after: 1.months.ago, before: Time.now)
        youtube = Google::Apis::YoutubeV3::YouTubeService.new
        youtube.key = GOOGLE_API_KEY
        next_page_token = nil
        opt = {
            q: keyword,
            type: 'video',
            max_results: 3,
            order: :date,
            page_token: next_page_token,
            published_after: after.iso8601,
            published_before: before.iso8601

        }
        
        youtube.list_searches(:snippet,opt)
    end

    def index
        @youtube_data = find_videos("アイドル")
    end
end