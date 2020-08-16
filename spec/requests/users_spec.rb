require 'rails_helper'

RSpec.describe 'Users' do
  let(:user) { create(:user) }

  it "creates a user and redirects to the user's page" do
    get '/users/signup'

    expect(response).to render_template(:new)

    post_params = {
      params: {
        user: {
          username: 'goce1',
          email: 'goce_test@yahoo.com',
          first_name: 'Goce',
          last_name: 'Arsoski',
          password: 'goce123',
          password_confirmation: 'goce123'
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).not_to be_nil
    expect(response).to redirect_to(assigns(:user))

    follow_redirect!
    expect(response).to render_template(:show)

    expect(response.body).to include('goce1')
    expect(response.body).to include('goce_test@yahoo.com')
  end

  it 'render New when user params are empty' do
    get '/users/signup'

    post_params = {
      params: {
        user: {
          username: '',
          email: '',
          first_name: '',
          last_name: '',
          password: '',
          password_confirmation: ''
        }
      }
    }

    post '/users', post_params

    expect(session[:user_id]).to be_nil
    expect(response).to render_template(:new)
  end

  it "edits a user and redirects to the user's page" do
    get '/login'
    expect(response).to have_http_status(:ok)

    log_in(user)

    get "/users/#{user.id}/edit"

    expect(response).to render_template(:edit)

    patch_params = {
      params: {
        user: {
          username: 'goce1',
          email: 'goce_test@yahoo.com',
          first_name: 'Goce',
          last_name: 'Arsoski',
          password: 'goce123',
          password_confirmation: 'goce123'
        }
      }
    }

    patch "/users/#{user.id}", patch_params

    expect(session[:user_id]).not_to be_nil
    expect(response).to redirect_to(assigns(:user))

    follow_redirect!
    expect(response).to render_template(:show)

    expect(response.body).to include('Goce Arsoski')
    expect(response.body).to include('goce1')
    expect(response.body).to include('goce_test@yahoo.com')
  end
end
