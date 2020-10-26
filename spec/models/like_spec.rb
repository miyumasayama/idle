require 'rails_helper'

RSpec.describe Like, type: :model do
  describe "associate" do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end

  describe "validate" do
    it { should validate_presence_of(:user_id) }
    it { should validate_presence_of(:tweet_id) }
  end
end
