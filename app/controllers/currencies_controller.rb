class CurrenciesController < ApplicationController
  def first_currency
    #require "open-uri"
    @raw_data = open("https://api.exchangerate.host/symbols").read
    #@array_of_symboles
   render({ :template => "currency_templates/step_one.html.erb"})
  end

end