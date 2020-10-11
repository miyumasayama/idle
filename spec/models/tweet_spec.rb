require 'rails_helper'

RSpec.describe Tweet, type: :model do
  describe "associate" do
    it { should belong_to(:user) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
  end

  describe "validate" do
    it { should validate_presence_of(:title) }
  end
end
