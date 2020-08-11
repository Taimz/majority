shared_context :get_auth_token do
  before(:all) do
    params = {
        username: "test_user",
        password: "Password@1"
    }
    post '/api/login', params: params
    data = JSON.parse(response.body)
    @token = data["token"]
  end
end