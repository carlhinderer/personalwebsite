describe CommentsController do
  login_admin

  describe "get #new" do
    before :each do
      @post = FactoryGirl.create(:post)
      @comment = Comment.new
      @comment.post = @post
    end

    it "responds successfully with an HTTP 200 status code" do
      get :new, :post_id => @post.id, :comment => @comment
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the :new view" do
      get :new, :post_id => @post.id, :comment => @comment
      expect(response).to render_template :new
    end
  end

  describe "post #create" do
    context "with valid attributes" do
      before :each do
	@comment = FactoryGirl.build(:comment)
	@attrs = @comment.attributes.symbolize_keys
      end

      it "creates a new comment" do
	expect{
	  post :create, :post_id => @attrs[:post_id], :comment => @attrs
	}.to change(Comment, :count).by(1)
      end

      it "redirects to the commented post" do
        post :create, :post_id => @attrs[:post_id], :comment => @attrs
	expect(response).to redirect_to post_path(@comment.post.slug)
      end
    end

    context "with invalid attributes" do
      before :each do
	@attrs = FactoryGirl.build(:invalid_comment).attributes.symbolize_keys
      end

      it "responds successfully with an HTTP 200 status code " do
	post :create, :post_id => @attrs[:post_id], :comment => @attrs
	expect(response).to be_success
	expect(response.status).to eq(200)
      end

      it "does not create a new comment" do
	expect {
	  post :create, :post_id => @attrs[:post_id], :comment => @attrs
        }.to_not change(Comment, :count)
      end

      it "re-renders the :new view" do
	post :create, :post_id => @attrs[:post_id], :comment => @attrs
	expect(response).to render_template :new
      end
    end
  end

  describe "delete #destroy" do
    before :each do
      @comment = FactoryGirl.create(:comment)
    end

    it "deletes the comment" do
      expect {
	delete :destroy, :post_id => @comment[:post_id], :id => @comment
      }.to change(Comment, :count).by(-1)
    end

    it "redirects to commented-on post" do
      delete :destroy, :post_id => @comment[:post_id], :id => @comment
      expect(response).to redirect_to post_url(@comment.post.slug)
    end
  end
end
