require "apis"

shared_examples_for "API" do |api|
  it "lists products" do
    expect(api.list_products).to match [
      a_hash_including(
        name: an_instance_of(String),
        category: an_instance_of(String),
        price: an_instance_of(Float)
      )
    ]
  end
end

describe WebApi do
  it "has a url" do
    api = WebApi.new("http://montalvomiguelo.com/api")
    expect(api).to respond_to(:url)
  end

  it_behaves_like "API", WebApi.new("http://montlvomiguelo.com/api")
end

describe FileApi do
  it "has a file location" do
    api = FileApi.new("/lib/api.db")
    expect(api).to respond_to :location
  end

  it_behaves_like "API", FileApi.new("/lib/api.db")
end
