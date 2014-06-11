describe Comment do
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:body) }
end
