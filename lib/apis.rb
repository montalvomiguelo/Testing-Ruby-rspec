class WebApi
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def list_products
    fetch_products_from_outside
  end

  def fetch_products_from_outside
    [
      {:name => "Tomato", :category => "Fruit", :price => 0.2 }
    ]
  end

end

class FileApi
  attr_accessor :location

  def initialize(location)
    @location = location
  end

  def list_products
    fetch_products_from_outside
  end

  def fetch_products_from_outside
    [
      {:name => "Tomato", :category => "Fruit", :price => 0.2 }
    ]
  end
end
