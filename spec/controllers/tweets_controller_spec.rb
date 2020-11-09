require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
    let(:user){create(:user)}
    let(:profile){create(:profile)}
    let(:tweet){create(:tweet)}

    describe 'tweet#index'do
        before {get :index}
        it {expect(response).to have_http_status(200)}
        it {expect(response).to render_template(:index)}
    end


    describe 'tweet#new' do
        context "ログイン時" do
            context "プロフィール入力済み" do
                before do
                    login_as(user)
                    fill_profile(profile)
                    get :new, session: {user_id: user.id}
                end

                it {expect(response).to have_http_status(200)}
                it {expect(response).to render_template(:new)}
            end

            context "プロフィール未入力" do
                before{login_as(user)
                        get :new, session: {user_id: user.id}}
                it {expect(response).to redirect_to new_profile_path}
            end

        end

        context "ログインしていない時" do
            before {get :new}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "tweet#create" do
        context "ログイン時" do
            context "プロフィール入力済み" do
                before {
                    login_as(user)
                    fill_profile(profile)
                    post :create, params: {
                            tweet: tweet},
                            session: {user_id: user.id}}
                    it {expect(response).to change(Tweet, :count).by(1)}
            end

            context "プロフィール未入力" do
                before{login_as(user)
                        post :create, session: {user_id: user.id}}
                it {expect(response).to redirect_to new_profile_path}
            end
        end

        context "未ログイン時" do
            before {post :create}
            it {expect(response).to redirect_to login_path}
        end

    end

end
