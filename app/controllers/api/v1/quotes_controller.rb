require 'open-uri'

class Api::V1::QuotesController < Api::ApiController
  def search
    request_from_uri
    response = {}
    @quotes = current_user.quotes.where(tags: params[:tag])
    response["quotes"] = @quotes.map do |quote|
      {
        quote: quote.quote,
        author: quote.author,
        author_about: quote.author_about,
        tags: quote.tags
      }
    end
    render json: response
  end

  private
  def request_from_uri
    url = 'http://quotes.toscrape.com'
    doc = Nokogiri::HTML(open "#{url}/tag/#{params[:tag]}")

    doc.css('.quote').each do |q|
      Quote.find_or_create_by(
        user: current_user,
        quote: q.css('.text').text,
        author: q.css('.author').text,
        author_about: 'http://quotes.toscrape.com' + q.css('span > a').attribute('href').value,
        tags: q.css('.tag').map { |tag| tag.text }
      )
    end
  end
end
