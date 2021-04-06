  class AuthController < ApplicationController
    skip_before_action :require_login, only: [:login]

    def login
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
          payload = {user_id: user.id}
          token = encode_token(payload)
          render json: {user: user.id, jwt: token, success: "Welcome back, #{user.email}"}
      else
          render json: {failure: "Log in failed! Username or password invalid!"}
      end
    end
  end