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
  let(:calculator) { PriceCalculator.new }

  it "privedes stubs to simulate state" do
    # for example, instantiating a new "Product"
    product_stub = double("Product")
    # and simulating the :price message in order to have a particular value
    allow(product_stub).to receive(:price).and_return(1.0, 100.25)

    2.times { calculator.add(product_stub) }
    calculator.add double(price: 100.25)

    expect(calculator.final_price).to eq 201.5
  end

  it "provides mocks to assert on message passing" do
    product_mock = double(:product)
    expect(product_mock).to receive(:price).and_return(2.0)
    calculator.add(product_mock)
    calculator.final_price
  end
end
