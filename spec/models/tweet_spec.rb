require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "is valid with user_id,title, and text" do
    user = @user
    tweet = user.tweets.build(
      user_id:1,
      title: "日向坂で会いましょう",
      text: "一緒に見よう"
    )
    expect(tweet).to be_valid
  end

  it "is invalid with title of 30 words" do
    user = @user
    tweet = user.tweets.build(
      user_id:1,
      title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
      text: "ooo"
    )
    expect(tweet).to be_invalid
  end

  it "is invalid with no title"do
    user = @user
    tweet = user.tweets.build(
      user_id:1,
      title: "",
      text: "ooo"
    )
    expect(tweet).to be_invalid
  end

  it "is invalid with no text" do
    user = @user
    tweet = user.tweets.build(
      user_id:1,
      title: "love",
      text: ""
    )
    expect(tweet).to be_invalid
  end  
end
