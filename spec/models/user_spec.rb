require 'rails_helper'

RSpec.describe User, type: :model do
  describe "associate" do
    it { should have_one(:profile) }
    it { should have_many(:tweets) }
    it { should have_many(:comments) }
    it { should have_many(:likes) }
    it { should have_many(:rooms) }
    it { should have_many(:messages) }
  end

  ##HACK 他のテスト
end
