describe Post do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:body) }
  it { should validate_presence_of(:posted) }
  it { should validate_presence_of(:category_id) }
end
