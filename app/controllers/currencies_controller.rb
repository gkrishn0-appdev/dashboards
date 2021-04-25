class CurrenciesController < ApplicationController
  def first_currency
    #require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    #@array_of_symboles
   render({ :template => "currency_templates/step_one.html.erb"})
   @parsed_data = JSON.parse(@raw_data)
   @symbols_hash = @parsed_data.fetch("symbols")
   @array_of_symbols = @symbols_hash.keys

  end

end