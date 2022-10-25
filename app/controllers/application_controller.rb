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


    # 10.times do |position|
    #   @symbol_array[position] = symbol_hash.fetch("symbols").to_s
    # end
    render({ :template => "forex.html.erb" })
  end

  def covid
    render({ :template => "covid.html.erb" })
  end

  def first_currency
    @raw_symbol_data = open("https://api.exchangerate.host/symbols").read
    symbol_hash = JSON.parse(@raw_symbol_data)
    @symbol_array = Array.new

    10.times do |position|
      @symbol_array[position] = symbol_hash.fetch("symbols").to_s
    end

    render({ :template => "first_currency.html.erb" })
  end

  def first_currency_second_currency
    render({ :template => "first_currency_second_currency.html.erb" })
  end
end
