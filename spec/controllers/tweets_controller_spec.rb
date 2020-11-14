require 'rails_helper'

RSpec.describe TweetsController, type: :controller do
    let(:user){create(:user)}

    let(:profile){create(:profile, user:user)}
    let(:tweet){create(:tweet, user:user)}
    let(:anotheruser){create(:anotheruser)}
    let(:anotherprofile){create(:anotherprofile, user:anotheruser)}
    let(:update_attributes) do
        {title: 'happy',
        text: 'update text',
        user_id: user.id}
    end
    let!(:tweet2){create(:tweet2, user:user)}




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
                context "正しい値が与えられたとき" do
                    before {
                        login_as(user)
                        fill_profile(profile)
                        post :create, params: {tweet: {
                            title: "aa",
                            text: "aaa",
                            user_id: user.id}
                            }, session: {user_id: user.id}
                    }
                    it { expect(tweet).to be_valid}
                    it { expect(response).to redirect_to '/tweets'}
                    it { expect{tweet}.to change(Tweet, :count).by(1)}
                end

                context "正しい値が与えられなかったとき" do
                    before {
                        login_as(user)
                        fill_profile(profile)
                        post :create, params: {tweet: {
                            title: "",
                            text: "",
                            user_id: user.id}
                            }, session: {user_id: user.id}
                    }
                    it { expect(response).to render_template "new"}
                end
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

    describe "tweet#show" do
        context "ログイン時" do
            before{login_as(user)
                    fill_profile(profile)
                    get :show, params:{id: tweet.id}, session: {user_id: user.id}}
            it {expect(response).to have_http_status(200)}
            it {expect(response).to render_template(:show)}
            it {expect(assigns(:tweet)).to eq tweet}
        end
        context "未ログイン時" do
            before { get :show, params:{id: tweet.id}}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "tweet#edit" do
        context "ログイン時" do
            context "プロフィール入力済み" do
                before{login_as(user)
                    fill_profile(profile)
                    get :edit, params:{id: tweet.id}, session: {user_id: user.id}}
                it {expect(response).to have_http_status(200)}
                it {expect(response).to render_template(:edit)}
                it {expect(assigns(:tweet)).to eq tweet}
            end

            context "プロフィール未入力" do
                before{login_as(user)
                    get :edit, params:{id: tweet.id}, session: {user_id: user.id}}
                it {expect(response).to redirect_to new_profile_path}
            end

            context "正しくないユーザー" do
                before{login_as(anotheruser)
                        fill_profile(anotherprofile)
                        get :edit, params:{id: tweet.id}, session: {user_id: anotheruser.id}}
                it {expect(response).to redirect_to tweets_path}
            end
        end

        context "未ログイン時" do
            before { get :edit, params: {id: tweet.id, user_id: user.id}}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "tweet#update" do
        context "ログイン時" do
            context "プロフィール入力済み" do
                context "正しい値が渡されたとき" do
                    before {login_as(user)
                            fill_profile(profile)
                            patch :update, params: {id: tweet.id, tweet: update_attributes},  session: {user_id: user.id}
                            tweet.reload}
                    it {expect(response).to redirect_to "/tweets/#{tweet.id}"}
                    it {expect(assigns(:tweet)).to eq tweet}
                    it {expect(flash[:notice]).to be_present}
                    it {expect{tweet}.to change(Tweet, :count).by(0)}
                end

                context "正しい値が渡されなかったとき" do
                    before {login_as(user)
                            fill_profile(profile)
                            patch :update, params: {id: tweet.id, tweet: {title: ""}},  session: {user_id: user.id}
                            tweet.reload}
                    it {expect(response).to render_template "edit"}
                end

                context "正しくないユーザー" do
                    before{login_as(anotheruser)
                        fill_profile(anotherprofile)
                        patch :update, params: {id: tweet.id, tweet: update_attributes},  session: {user_id: anotheruser.id}
                        tweet.reload}
                    it {expect(response).to redirect_to tweets_path}
                end
            end

            context "プロフィール未入力" do
                before {login_as(user)
                        patch :update, params: {id: tweet.id, tweet: update_attributes},  session: {user_id: user.id}}
                it {expect(response).to redirect_to new_profile_path}
            end
        end

        context "未ログイン時" do
            before {patch :update, params: {id: tweet.id}}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "tweet#destroy" do
        context "ログイン時" do
            context "プロフィール入力済み" do
                before {login_as(user)
                        fill_profile(profile)}
                it { expect{tweet2.destroy}.to change(user.tweets, :count).by(-1)}
                it "削除後tweets_pathにリダイレクト" do
                    delete :destroy, params: {id: tweet2.id},session: {user_id: user.id}
                    expect(response).to redirect_to tweets_path
                end
                it "フラッシュメッセージあり" do
                    delete :destroy, params: {id: tweet2.id},session: {user_id: user.id}
                    expect(flash[:success]).to be_present
                end
            end

            context "正しくないユーザー" do
                before{login_as(anotheruser)
                        fill_profile(anotherprofile)
                        delete :destroy,  params: {id: tweet.id}, session: {user_id: anotheruser.id}}
                it { expect(response).to redirect_to tweets_path}
            end

            context "プロフィール未入力" do
                before {login_as(user)
                        delete :destroy, params: {id: tweet2.id},session: {user_id: user.id}}
                it { expect(response).to redirect_to new_profile_path}
            end
        end

        context "未ログイン時" do
            before {delete :destroy, params: {id:tweet.id}}
            it {expect(response).to redirect_to login_path}
        end
    end
end

