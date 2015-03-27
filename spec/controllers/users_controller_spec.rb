require 'rails_helper'

describe UsersController do
  describe "GET new" do 
    it "sets @user variable" do 
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end
  end

  describe "POST create" do 
    # let(:user_session) { Fabricate(:user) }

    context "with valid inputs" do 
      before do 
        post :create, user: Fabricate.attributes_for(:user)
      end

      it "creates the user" do 
        expect(User.count).to eq(1)
      end

      it "redirects to the root path" do 
        expect(response).to redirect_to root_path
      end

      it "sets the user session" do 
        expect(session[:user_id]).to eq(User.first.id)
      end
    end

    context "with invalid inputs" do 
      before do 
        post :create, user: { password: "password", full_name: "Mike mcdevitt" }
      end

      it "does not create the user" do 
        expect(User.count).to eq(0)
      end

      it "renders the new template" do 
        expect(response).to render_template 'new'
      end

      it "sets @user" do 
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
end
