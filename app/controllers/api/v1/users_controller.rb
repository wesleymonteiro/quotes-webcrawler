class Api::V1::UsersController < ApplicationController
  before_action :verify_params_presence
  def login
    @user = User.find_for_authentication(email: params[:email])
    render_invalid_credentials and return if @user.nil? || !@user.valid_password?(params[:password])
    render_user
  end

  def sign_in
    @user = User.create(email: params[:email], password: params[:password])
    @user.valid? ? render_user : render(json: @user.errors.messages) 
  end

  private
  def verify_params_presence
    render json: { erro: "Email ou senha em branco" } unless params[:email].present? && params[:password].present?
  end

  def render_invalid_credentials
    render json: { erro: "Email ou senha inválidos" }
  end

  def render_user
    response = {
      user: {
        authentication_token: @user.authentication_token,
        email: @user.email
      }
    }
    render json: response
  end
end
