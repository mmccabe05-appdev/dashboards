Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get("/", { :controller => "application", :action => "main_page" })
  get("/forex", { :controller => "application", :action => "forex" })
  get("/covid", { :controller => "application", :action => "covid" })
  get("/forex/:first_currency/", { :controller => "application", :action => "first_currency" })
  get("/forex/:first_currency/:second_currency", { :controller => "application", :action => "first_currency_second_currency" })
end
