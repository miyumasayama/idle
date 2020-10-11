require 'rails_helper'

RSpec.describe Room, type: :model do
    describe "associate" do
        it { should belong_to(:user)}
        it { should belong_to(:room)}
    end


end