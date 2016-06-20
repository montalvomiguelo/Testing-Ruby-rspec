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

# We used stubs to simulate some state
describe "Stubs" do
  it "privedes stubs to simulate state" do
    calculator = PriceCalculator.new

    # for example, instantiating a new "Product"
    product_stub = double("Product")
    # and simulating the :price message in order to have a particular value
    allow(product_stub).to receive(:price).and_return(1.0, 100.25)

    2.times { calculator.add(product_stub) }
    calculator.add double(price: 100.25)

    expect(calculator.final_price).to eq 201.5
  end
end
