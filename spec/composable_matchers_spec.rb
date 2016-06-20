class Product
  def initialize(id, name, collection)
    @id = id
    @name = name
    @collection = collection
  end

  def serial_data
    ["X-", @name[0], @collection[0], @id]
  end
end

describe "Composable Matchers" do
  it "works with nested data" do
    product = Product.new(23, "T-Shirt", "Man")
    expect(product.serial_data).to match [
      a_string_starting_with("X-"),
      a_string_starting_with("T"),
      a_string_starting_with("M"),
      a_value < 5000
    ]
  end

  it "compud matchers" do
    string = "montalvomiguelo"
    expect(string).to start_with("m").and end_with("o")
  end
end
