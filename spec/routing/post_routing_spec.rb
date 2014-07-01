describe "Routing to Posts" do
  it "routes posts/category/:programming to posts#index with programming" do
    expect(:get => "/posts/category/programming").to route_to(
      :controller => "posts",
      :action => "index",
      :category => "programming"
    )
  end

  it "routes posts/category/:personal to posts#index with personal" do
    expect(:get => "/posts/category/personal").to route_to(
      :controller => "posts",
      :action => "index",
      :category => "personal"
    )
  end

  it "should not route to category with invalid category specified" do
    expect(:get => "/posts/category/foobar").not_to be_routable
  end

  it "routes posts/tag/:tag to posts#index with :tag" do
    expect(:get => "/posts/tag/tagName").to route_to(
      :controller => "posts",
      :action => "index",
      :tag => "tagName"
    )
  end
  
  it "should route to post correctly by slug" do
    expect(:get => "/posts/a-slug-for-an-article").to route_to(
      :controller => "posts",
      :action => "show",
      :id => "a-slug-for-an-article"
    )
  end

  it "should route to post correctly by id" do
    expect(:get => "/posts/1").to route_to(
      :controller => "posts",
      :action => "show",
      :id => "1"
    )
  end
end
