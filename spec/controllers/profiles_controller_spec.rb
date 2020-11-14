require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do
    let(:user){create(:user)}
    let(:profile){create(:profile, user:user)}
    let(:anotheruser){create(:anotheruser)}
    let(:anotherprofile){create(:anotherprofile, user:anotheruser)}
    let(:user3){create(:user3)}
    let(:update_attributes) do
        {nickname: "陽子",
        age: profile.age,
        favorite: profile.favorite,
        sex: profile.sex,
        user_id: user.id}
    end
    let(:another_update_attributes) do
        {nickname: "陽子",
        age: anotherprofile.age,
        favorite: anotherprofile.favorite,
        sex: anotherprofile.sex,
        user_id: anotheruser.id}
    end


    describe "profile#new" do
        context "ログイン時" do
            before{login_as(user)
                    get :new, session: {user_id: user.id}}
            it {expect(response).to have_http_status(200)}
            it {expect(response).to render_template(:new)}
        end

        context "未ログイン時" do
            before{get :new}
            it{expect(response).to redirect_to login_path}
        end
    end


    describe "profile#create" do
        context "ログイン時" do
            before {login_as(anotheruser)}
            context "redirect_test" do
                before{
                        post :create, params: {profile:{
                                                    nickname:"あい",
                                                    age: 22,
                                                    favorite: "菅田将暉",
                                                    sex: "男性",
                                                    user_id: anotheruser.id
                                                }},
                                        session: {user_id: anotheruser.id}}
                it {expect(response).to have_http_status(302)}
                it {expect(response).to redirect_to tweets_path}
            end

            it "プロフィールが作られているか" do
                expect{post :create, params: {profile:{
                                                    nickname:"あい",
                                                    age: 22,
                                                    favorite: "菅田将暉",
                                                    sex: "男性",
                                                    user_id: user.id}},
                                        session: {user_id: user.id}}.to change(Profile, :count).by(1)
            end
        end

        context "未ログイン時" do
            before {post :create, params: {profile:{
                                                    nickname:"あい",
                                                    age: 22,
                                                    favorite: "菅田将暉",
                                                    sex: "男性",
                                                    user_id: user.id}}}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to login_path}

        end
    end

    describe "profile#show" do
        context "ログイン時" do
            context "自分のプロフィール" do
                before {get :show, params: {id: profile.id },session: {user_id: user.id} }
                it {expect(response).to have_http_status(200)}
                it {expect(response).to render_template(:show)}
                it {expect(response.body).to include("いいねした投稿")}
            end

            context "自分以外のプロフィール" do
                before {get :show, params: {id: anotherprofile.id },session: {user_id: user.id} }
                it {expect(response).to have_http_status(200)}
                it {expect(response).to render_template(:show)}
                it {expect(response.body).not_to include("いいねした投稿")}
            end
        end

        context "未ログイン時" do
            before { get :show, params: {id: user.id }}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "profile#edit" do
        context "ログイン時" do
            before {get :edit, params: {id: profile.id},session: {user_id: user.id}}
            it {expect(response).to have_http_status(200)}
            it {expect(response).to render_template(:edit)}
            it {expect(response.body).to include "菅田将暉"}
        end

        context "別のユーザーのeditへリクエストが送られた時" do
            before {get :edit, params: {id: anotherprofile.id},session: {user_id: user.id}}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to tweets_path}
        end

        context "未ログイン時" do
            before {get :edit, params: {id: profile.id}}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to login_path}
        end
    end

    describe "profile#update" do
        context "ログイン時" do
            before {patch :update, params: {id: profile.id, profile: update_attributes},
                            session: {user_id: user.id}
                            user.reload}
            it {expect(response).to redirect_to "/profiles/#{profile.id}"}
            it {expect(assigns(:profile)).to eq profile}
            it {expect{profile}.to change(Profile,:count).by(0)}
            it {expect(flash[:notice]).to be_present}
        end

        context "別のユーザーのupdateにリクエストした時" do
            before {patch :update, params: {id: anotherprofile.id, profile: another_update_attributes},
                            session: {user_id: user.id}
                            user.reload}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to tweets_path}
        end

        context "未ログイン時" do
            before {patch :update, params: {id: profile.id, profile: update_attributes}}
            it {expect(response).to have_http_status(302)}
            it {expect(response).to redirect_to login_path}
        end
    end


    #describe "profile#search" do
        #before {get :search, params: {search: {nickname_like: profile.nickname}},session: {user_id: user.id} }
        #t {expect(response).to include "有村架純"}
    #end
end