require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe "associate" do
    it { should belong_to(:user) }
  end

  describe "validate" do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:favorite) }
    it { should validate_presence_of(:sex) }
  end

  describe "method" do
    describe "what_sex_is" do
      context "性別が検索条件で渡されている" do
        let(:profile){ FactoryBot.create(:profile) }

        subject { Profile.what_sex_is("男性") }

        it { is_expected.to eq [profile] }
      end

      context "性別が検索条件で渡されてない" do
        let(:profile){ FactoryBot.create(:profile) }

        subject { Profile.what_sex_is(nil) }

        it { is_expected.to eq [] }
      end
    end
  end
end