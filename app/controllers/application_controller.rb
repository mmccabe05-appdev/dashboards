class ApplicationController < ActionController::Base
  require "open-uri"
  require "json"

  def main_page
    render({ :template => "main_page.html.erb" })
  end

  def forex
    @raw_symbol_data = open("https://api.exchangerate.host/symbols").read
    @symbol_parsed_data = JSON.parse(@raw_symbol_data)
    @symbol_hash = @symbol_parsed_data.fetch("symbols")

    @symbol_array = @symbol_hash.keys

    render({ :template => "forex.html.erb" })
  end

  def covid
    render({ :template => "covid.html.erb" })
  end

  def first_currency
    @raw_symbol_data = open("https://api.exchangerate.host/symbols").read
    @symbol_parsed_data = JSON.parse(@raw_symbol_data)
    @symbol_hash = @symbol_parsed_data.fetch("symbols")

    @symbol_array = @symbol_hash.keys

    @first_currency = params.fetch(:first_currency).to_s

    render({ :template => "first_currency.html.erb" })
  end

  def first_currency_second_currency
    @raw_symbol_data = open("https://api.exchangerate.host/symbols").read
    @symbol_parsed_data = JSON.parse(@raw_symbol_data)
    @symbol_hash = @symbol_parsed_data.fetch("symbols")

    @symbol_array = @symbol_hash.keys

    @first_currency = params.fetch(:first_currency).to_s
    @second_currency = params.fetch(:second_currency).to_s
    @currency_url = "https://api.exchangerate.host/convert?from=FROMCURRENCY&to=TOCURRENCY".gsub("FROMCURRENCY", @first_currency).gsub("TOCURRENCY", @second_currency)
    @raw_exchange_data = open(@currency_url).read
    @parsed_exchange_data = JSON.parse(@raw_exchange_data)
    

    render({ :template => "first_currency_second_currency.html.erb" })
  end
end
