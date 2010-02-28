User.blueprint do
  password "password"
  password_confirmation "password"
end

User.blueprint(:admin) do
  login "admin"
end
