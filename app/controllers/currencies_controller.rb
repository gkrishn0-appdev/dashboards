class CurrenciesController < ApplicationController
  def first_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
   @symbols_hash = @parsed_data.fetch("symbols")
   @array_of_symbols = @symbols_hash.keys
   render({ :template => "currency_templates/step_one.html.erb"})
  

  end
    def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
   @symbols_hash = @parsed_data.fetch("symbols")
   @array_of_symbols = @symbols_hash.keys
   @first = params.fetch("from_currency")
   #render({ :template => "currency_templates/step_one.html.erb"})
   render({ :template => "currency_templates/step_two.html.erb"})
  

  end
      def conversion

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
   @symbols_hash = @parsed_data.fetch("symbols")
   @array_of_symbols = @symbols_hash.keys
   @first = params.fetch("from_currency")
   @second = params.fetch("to_currency")
   @string2 = "https://api.exchangerate.host/convert?from=" + @first.to_s + "&to=" + @second.to_s
   @raw_data2 = open(@string2).read
   @parsed_data2 = JSON.parse(@raw_data2)
  #@symbols2 = @parsed_data.fetch("query")
   #@symbols_hash = @parsed_data.fetch("symbols2")
   #render({ :template => "currency_templates/step_one.html.erb"})
   #render({ :template => "currency_templates/step_two.html.erb"})
   render({ :template => "currency_templates/step_three.html.erb"})
  

  end

end