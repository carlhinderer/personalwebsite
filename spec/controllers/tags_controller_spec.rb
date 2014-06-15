describe TagsController do

  describe "get #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
    
    it "populates a collection of tags" do
      tag = FactoryGirl.create(:tag)
      get :index
      expect(assigns(:tags)).to eq([tag])
    end

    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "post #create" do
    context "with valid attributes" do
      before :each do
	@attrs = FactoryGirl.attributes_for(:tag)
      end

      it "creates the new tag" do
        expect {
	  post :create, tag: @attrs
	}.to change(Tag, :count).by(1)
      end

      it "redirects to the tags index page" do
	post :create, tag: @attrs
	expect(response).to redirect_to :tags
      end
    end

    context "with invalid attributes" do
      before :each do
	@attrs = FactoryGirl.attributes_for(:invalid_tag)
      end

      it "does not create the new tag" do
	expect {
	  post :create, tag: @attrs
	}.to_not change(Tag, :count)
      end

      it "re-renders the index template" do
	post :create, tag: @attrs
	expect(response).to redirect_to :tags
      end
    end
  end

  describe "delete #destroy" do
    before :each do
      @tag = FactoryGirl.create(:tag)
    end

    it "deletes the tag" do
      expect {
	delete :destroy, id: @tag
      }.to change(Tag, :count).by(-1)
    end

    it "redirects to the tags index page" do 
      delete :destroy, id: @tag
      expect(response).to redirect_to tags_url
    end
  end

end
