describe Comment do
  it { should validate_presence_of(:author) }
  it { should ensure_length_of(:author).is_at_most(40) }

  it { should ensure_length_of(:author_website).is_at_most(40) }

  it { should validate_presence_of(:body) }
  it { should ensure_length_of(:body).is_at_most(400) }
end
