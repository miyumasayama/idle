require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe User do
    describe '#create' do
      it 'is valid' do
        user = build(:user)     #factory_botによる。user=User.new(email: "mmm@gmail.com", password: "00000000", password_confirmation: "00000000")
        user.valid?
        expect(user).to be_valid  #expectの値とtoメソッドの内容があってれば成功
      end

      it 'is invalid without email' do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to raise_error
      end
    end
  end
end


