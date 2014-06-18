describe ManageController do 
  login_admin

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "populates a collection of posts" do
      post = FactoryGirl.create(:post)
      get :index
      expect(assigns(:all_posts)).to eq([post])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
end
