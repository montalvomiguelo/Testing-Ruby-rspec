class PriceCalculator
  def add(product)
    products << product
  end

  def products
    @products ||= []
  end

  def final_price
    price = 0
    @products.map do |product|
      price += product.price
    end
    price
  end
end

describe "Stubs" do
  it "privedes stubs to simulate state" do
    calculator = PriceCalculator.new
    product = double("Product")
    allow(product).to receive_messages(:price => 1.0)

    calculator.add(product)
    calculator.add double(price: 100.25)
    expect(calculator.final_price).to eq 101.25
  end
end
