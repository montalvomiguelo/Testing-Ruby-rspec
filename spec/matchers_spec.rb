describe "Matchers" do
  it "asserts on equality" do
    number = 3
    expect(number).to eq 3
  end

  it "asserts on mathematical operators" do
    number = 5
    expect(number).to(be > 2)
  end

  it "asserts on matching a regular expression" do
    email = "me@montalvomiguelo.com"
    regex = /\w+@\w+\.[a-z]{2,4}$/
    expect(email).to match regex
  end

  it "asserts on types and classes" do
    object = 2.3
    # expect(object).to be_a Numeric
    expect(object).to be_an_instance_of Float
  end

  it "asserts on truthiness" do
    nil_value = nil
    expect(nil_value).to be_falsy
  end

  it "asserts errors" do
    expect do
      raise ArgumentError
    end.to raise_error ArgumentError
  end

  it "asserts throws" do
    expect { throw :oops }.to throw_symbol :oops
  end

  it "asserts on predicates" do
    class Foo
      def chido?
        true
      end
    end

    object = Foo.new

    expect(object).to be_chido
  end

  it "asserts on collections" do
    list = [:one, :two, :three, :four]
    expect(list).to include :four
    expect(list).to start_with [:one]
    expect(list).to end_with [:three, :four]
  end

  it "negates asserts" do
    expect(3).not_to be 4
  end
end
