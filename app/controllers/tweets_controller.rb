class TweetsController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = Rails.application.secrets.twitter_consumer_key
      config.consumer_secret = Rails.application.secrets.twitter_consumer_secret
    end

    @tweets = []
    since_id = nil

    # 検索ワードが存在していたらツイートを取得
    if params[:keyword].present?
      tweets = client.search(params[:keyword], count: 10, result_type: "recent",
        exclude: "retweets", since_id: since_id)

      # 取得したツイートをモデルに渡す
      tweets.take(10).each do |tw|
        tweet = Tweet.new(tw.full_text)
        @tweets << tweet
      end
    end
  end
end
