describe PostsController do
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
      expect(assigns(:posts)).to eq([post])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    before :each do
      @post = FactoryGirl.create(:post)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :show, id: @post
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested post to @post" do
      get :show, id: @post
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the :show view" do
      get :show, id: @post
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    before :each do
      @post = Post.new
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the :new view" do 
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before :each do
	@attrs = FactoryGirl.build(:post).attributes.symbolize_keys
      end

      it "creates a new post" do
        expect {
	  post :create, post: @attrs
        }.to change(Post, :count).by(1)
      end

      it "redirects to the home page do" do
        post :create, post: @attrs
        expect(response).to redirect_to :root
      end
    end

    context "with invalid attributes" do
      before :each do
	@attrs = FactoryGirl.build(:invalid_post).attributes.symbolize_keys
      end

      it "responds successfully with an HTTP 200 status code" do
        post :create, post: @attrs
	expect(response).to be_success
	expect(response.status).to eq(200)
      end

      it "does not create a new post" do
        expect {
	  post :create, post: @attrs
	}.to_not change(Post, :count)
      end

      it "re-renders the new view" do
	post :create, post: @attrs
	expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    before :each do
      @post = FactoryGirl.create(:post)
    end

    it "responds successfully with an HTTP 200 status code" do
      get :edit, id: @post
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "assigns the requested post to @post" do
      get :edit, id: @post
      expect(assigns(:post)).to eq(@post)
    end

    it "renders the :edit view" do
      get :edit, id: @post
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    before :each do 
      @post = FactoryGirl.create(:post)
    end

    context "with valid attributes" do
      before :each do
	@new_attrs = FactoryGirl.attributes_for(:post)
      end

      it "located the requested post" do
        put :update, id: @post, post: @new_attrs
	expect(assigns(:post)).to eq(@post)
      end

      it "changes the post's attributes" do
        put :update, id: @post, post: @new_attrs
        @post.reload
        expect(@post.title).to eq(@new_attrs[:title])
        expect(@post.body).to eq(@new_attrs[:body])	
      end

      it "redirects to updated post" do
	put :update, id: @post, post: @new_attrs
	expect(response).to redirect_to @post
      end
    end

    context "with invalid attributes" do
      before :each do
	@new_attrs = FactoryGirl.attributes_for(:invalid_post)
      end

      it "responds successfully with an HTTP 200 status code" do
        put :update, id: @post, post: @new_attrs
	expect(response).to be_success
	expect(response.status).to eq(200)
      end

      it "located the requested post" do
        put :update, id: @post, post: @new_attrs
        expect(assigns(:post)).to eq(@post)
      end

      it "does not change the post's attributes" do
	put :update, id: @post, post: FactoryGirl.attributes_for(:post, :title => nil)
	@post.reload
	expect(@post.title).to_not eq(nil)
      end

      it "re-renders the edit method" do
        put :update, id: @post, post: @new_attrs
	expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do 
      @post = FactoryGirl.create(:post)
    end

    it "deletes the post" do
      expect {
	delete :destroy, id: @post
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the management screen" do
      delete :destroy, id: @post
      expect(response).to redirect_to manage_url
    end
  end

end
