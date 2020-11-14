require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    
    describe "user#new" do
        before {get :new}
        it {expect(response).to have_http_status(200)}
        it {expect(response).to render_template(:new)}
        it {expect(assigns(:user)).to be_a_new(User)}
    end

    describe "create" do
        context "有効なユーザー" do
            context "redirect_test" do
                before {post :create, params: {user:
                                            {email: "a@gmail.com",
                                            password: "aaaaaaaa",
                                            id: 1}}}
                it {expect(response).to  have_http_status(302)}
                it {expect(response).to redirect_to new_profile_path}
            end
            it "ユーザ増加" do 
                expect {post :create, params: {user:
                                            {email: "a@gmail.com",
                                            password: "aaaaaaaa",
                                            id: 1}}
                                            }.to change(User, :count).by(1)
            end
        end
        
        context "無効なユーザー" do
            let(:user){create(:user)}
            before {post :create, params: {user:
                                            {email: "user.email",
                                            password: "user.password",
                                            id: user.id}}}
            it {expect(response).to  have_http_status(200)}
            it {expect(response).to render_template(:new)}
            it {expect{user}.not_to change(User, :count)}


        end
    end
end
