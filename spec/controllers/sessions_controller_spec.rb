require 'rails_helper'

describe SessionsController do
  let(:user) { Fabricate(:user) }

  describe "GET new" do 
    it "renders the new template for unauthenticated users" do 
      get :new
      expect(response).to render_template :new
    end

    it "redirects to the home path for authorized user" do 
      session[:user_id] = user.id 
      get :new
      expect(response).to redirect_to root_path
    end
  end

  describe "POST create" do 
    context "with valid params" do 
      before do 
        post :create, email: user.email, password: user.password
      end

      it "creates a new session for signed in user" do 
        expect(session[:user_id]).to eq(user.id)
      end

      it "redirects to the home path" do 
        expect(response).to redirect_to root_path
      end

      it "sets the flash" do 
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid params" do 
      before do 
        post :create, email: user.email, password: user.password + "asdf"
      end

      it "does not create a new session" do 
        expect(session[:user_id]).to be_nil
      end

      it "redirects to the login path" do 
        expect(response).to redirect_to login_path
      end

      it "sets the flash danger message" do 
        expect(flash[:danger]).to be_present
      end
    end
  end

  describe "GET destroy" do 
    before do 
      session[:user_id] = user.id 
      get :destroy
    end

    it "destroys the session" do 
      expect(session[:user_id]).to be_nil
    end

    it "redirects to the root path" do 
      expect(response).to redirect_to root_path
    end

    it "sets the flash success message" do 
      expect(flash[:success]).to be_present
    end
  end
end
























































