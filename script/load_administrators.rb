User.transaction do
  (1..5).each do |i|
    User.create(name: "dave#{i}", password: "secret", 
                  password_confirmation: "secret", permission: "1")
  end
end