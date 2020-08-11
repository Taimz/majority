RSpec.describe Api::UsersController, type: :request do

  describe 'POST /users' do
    context 'when password format is correct' do
      before do
        params = {
            user: {
                username: "test_user",
                password: "Password@1"
            }
        }
        post '/api/users', params: params
      end
      it 'Should Create User' do
        expect(response).to have_http_status(201), response.body
      end
    end
    context 'when password format is incorrect' do
      before do
        params = {
            user: {
                username: "test_user_1",
                password: "test"
            }
        }
        post '/api/users', params: params
      end
      it 'Should Not Create User' do
        expect(response).to have_http_status(401), response.body
      end
    end
  end

end
