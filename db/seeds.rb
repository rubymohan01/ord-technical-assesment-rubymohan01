admin_email = 'admin@example.com'
admin_password = 'password123'

admin = Admin.find_or_initialize_by(email: admin_email)
if admin.new_record?
  admin.password = admin_password
  admin.password_confirmation = admin_password
  admin.save!
  puts "Admin user created: #{admin_email}"
else
  puts "Admin user already exists: #{admin_email}"
end
