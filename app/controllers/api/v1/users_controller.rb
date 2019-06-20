class Api::V1::UsersController < ApplicationController
  before_action :verify_params_presence, only: :login
  def login
    user = User.find_for_authentication(email: params[:email])
    render_invalid_credentials and return if user.nil? || !user.valid_password?(params[:password])
    response = {
      user: {
        authentication_token: user.authentication_token
        email: user.email
      }
    }
    render json: response
  end

  private
  def verify_params_presence
    render json: { erro: "Email ou senha em branco" } unless params[:email].present? && params[:password].present?
  end

  def render_invalid_credentials
    render json: { erro: "Email ou senha inválidos" }
  end
end
