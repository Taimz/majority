RSpec.describe "Api::UsersController::Me", type: :request do
  include_context :get_auth_token

  describe 'GET /users/me' do
    before do
      get '/api/users/me', headers: {Authorization: "Token " + @token}
    end
    it 'Should Fetch User' do
      expect(response).to have_http_status(200), response.body
    end
  end
end
