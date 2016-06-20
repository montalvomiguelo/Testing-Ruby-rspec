require 'minitest/autorun'

class Book
  attr_reader :title
end

describe "Stubs" do
  it "provides stubs to simulate state" do
    book = Book.new
    book.stub(:title, "WordPress") do
      book.title.must_equal "WordPress"
    end
  end
end
