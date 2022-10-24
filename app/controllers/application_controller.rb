class ApplicationController < ActionController::Base
  # require URI
  def main_page 

    render({:template => "main_page.html.erb"})
  end
  def forex 

    render({:template => "forex.html.erb"})
  end
  def covid 

    render({:template => "covid.html.erb"})
  end
end
