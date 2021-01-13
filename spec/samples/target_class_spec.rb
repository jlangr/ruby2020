class Auto
  attr_reader :RPM

  def depress_brake
    # code here
  end

  def press_start_button
    @RPM = 1000
  end
end

describe Auto do
  let(:auto) { Auto.new }

  it "idles engine when started" do
    auto.depress_brake

    auto.press_start_button

    expect(auto.RPM).to be_between(950, 1100)
  end
end

describe TargetClass do
  let(:sut) { TargetClass.new }

  it "provides some behavior" do
    # Arrange

    # Act

    # Assert
  end

  it "rspec matchers" do
    condition = true
    something = "expected text"
    some_collection = []
    obj = Auto.new

    expect(condition).to be true
    expect(something).to eq "expected text"
    expect(something).not_to eq "unexpected text"
    expect("technology").to include "tech"
    expect("something").to match /.*thing$/
    expect { 4 / 0 }.to raise_error(ZeroDivisionError)
    expect(some_collection).to be_empty
    expect(obj).to be_instance_of(Auto)
    expect([12, 1, 1, 1, 2, 1, 3]).to include(12, 3)
    expect([2, 4, 8, 16, 32]).to all(be_even.and be < 64)
  end
end

