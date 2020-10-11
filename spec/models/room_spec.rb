require 'rails_helper'

RSpec.describe Room, type: :model do
    describe "associate" do
        it { should have_many(:messages)}
        it { should have_many(:entries)}
        it { should have_many(:users)}
    end


end