require 'rails_helper'

RSpec.describe UsersController, type: :controller do
    describe "#new" do
        it "responds succesessfully" do
            get :new
            expect(response).to be_successful
        end

        it "returns a 200 response" do
            get :new
            expect(response).to have_http_status "200"
        end
    end

    describe "#create" do
        context "正しいとき" do
            it "redirect /profiles/new" do
                post :create,params: {
                    user:{
                        email: "921ohagi@gmail.com",
                        password: "miyumiyu"
                    }
                }
                expect(response).to redirect_to "/profiles/new"
            end

            it "returns a 302 request" do
                post :create, params:{
                    user:{
                        email: "921ohagi@gmail.com",
                        password: "miyumiyu"
                    }
                }
                expect(response).to have_http_status "302"
            end
        end

        context "正しくないとき" do
            it "redirect to /signup" do
                post :create,params: {
                    user:{
                        email: "",
                        password: "miyumiyu"
                    }
                }
                expect(response).to render_template(:new)
            end
        end
    end
end
