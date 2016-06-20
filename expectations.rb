require 'minitest/autorun'

describe "Expectations" do
  it "asserts with binary operators" do
    23.must_be :<=, 100
  end

  it "asserts comparing floats" do
    Math::PI.must_be_close_to (22.0 / 7), 0.01
  end

  it "asserts on empty objects" do
    [].must_be_empty
  end

  it "asserts on instance of class" do
    [].must_be_instance_of(Array)
  end

  it "asserts on kind of class" do
    2.3.must_be_kind_of Numeric
  end

  it "asserts on equality" do
    number = 23
    number.must_be_same_as 23
  end

  it "asserts stderr or stdout" do
    proc { return 23 }.must_be_silent
  end

  it "asserts in float comparations to have a relative error less than epsilon" do
    number = 2.3
    number.must_be_within_epsilon 2.299
  end

  it "asserts on equality" do
    result = 2 + 4
    result.must_equal 6
  end

  it "asserts on collections" do
    arr = [1, 2, 3]
    arr.must_include 3
  end

  it "asserts on matching a regular expression" do
    email = "me@montalvomiguelo.com"
    regex = /\w+@\w+\.[a-z]{2,4}$/
    email.must_match regex
  end

  it "asserts on output" do
    arr = [1, 2]
    proc { print "#{arr.length}!" }.must_output "2!"
  end

  it "asserts on and object that responds to a method" do
    arr = [1, 2]
    arr.must_respond_to :count
  end

  it "asserts if the block throws sym" do
    proc { throw :oops }.must_throw :oops
  end

  it "negative asserts" do
    number = 1000
    arr = [2]
    number.wont_be :<=, 100
    arr.wont_be_empty
    number.wont_equal arr
  end

end
