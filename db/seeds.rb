User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "管理者"
  user.password = "password"
  user.password_confirmation = "password"
  user.is_admin = true
end

puts "Seed data created: admin@example.com / password"
