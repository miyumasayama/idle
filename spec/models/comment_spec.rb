require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe "associate" do
    it { should belong_to(:user) }
    it { should belong_to(:tweet) }
  end
end
