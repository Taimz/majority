RSpec.describe Api::SessionsController, type: :request do
  include_context :get_auth_token

  describe 'POST /login' do
    context 'when username and password are correct' do
      before do
        params = {
            username: "test_user",
            password: "Password@1"
        }
        post '/api/login', params: params
      end
      it 'Should Login User' do
        expect(response).to have_http_status(200), response.body
      end
    end
    context 'when username and password are incorrect' do
      before do
        params = {
            username: "test_user",
            password: "Password"
        }
        post '/api/login', params: params
      end
      it 'Should Login User' do
        expect(response).to have_http_status(401), response.body
      end
    end
  end

  describe 'DELETE /logout' do
    before do
      delete '/api/logout', headers: {Authorization: "Token " + @token}
    end
    it 'Should Logout User' do
      expect(response).to have_http_status(200), response.body
    end
  end

  describe 'Delete User' do
    before do
      User.find({username: "test_user"}).first.delete
      @test_users = User.find({username: "test_user"}).size
    end
    it 'Should Delete User' do
      expect(@test_users).to match(0)
    end
  end
end
