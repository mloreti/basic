json.user do
  json.(@user, :first_name, :last_name, :email)
end

if @token
  json.data do
    json.token @token
  end
end