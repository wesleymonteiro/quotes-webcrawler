class Api::V1::QuotesController < Api::ApiController
  def index
    @quotes = current_user.quotes
    render json: @quotes
  end
end
