require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
    before do
        @user = FactoryBot.create(:user)
        @user2 = FactoryBot.create(:user2)
    end

    describe '#index'do
        it "responds successfully" do
            get :index
            expect(response).to be_successful
        end

        it "returns a 200 response" do
            get :index
            expect(response).to have_http_status "200"
        end

    end

    describe '#new' do
        before do 
            visit login_path
            fill_in 'session[email]', with: @user.email
            fill_in 'session[password]', with: @user.password
            click_button 'ログイン'
        end

        #context "valid" do
            #it "responds succesessfully" do
                #get :new
                #expect(response).to be_successful
            #end

            #it "returns a 200 response" do
                #get :new
                #expect(response.status).to eq 302
            #end
        #end
    end
end
