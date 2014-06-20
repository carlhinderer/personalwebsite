# Create admin account
admin = Admin.find_or_create_by!(:email => ENV["ADMIN_EMAIL"]) do |admin|
  admin.password = ENV["ADMIN_PASSWORD"]
  admin.password_confirmation = ENV["ADMIN_PASSWORD"]
end

# Add blog post categories
Category.find_or_create_by!(:name => 'Programming')
Category.find_or_create_by!(:name => 'Personal')
