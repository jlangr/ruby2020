require 'date'

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

describe "given some context" do
  describe "when some event occurs" do
    it "then can be verified" do

    end
  end
end

Agile_Java = "Agile Java"
Patron_Id = 1

class Library
  def borrow(a, b)
    return DateTime.new(2021, 1, 20)
  end

  def return_material(x, y)
  end

  def available?(m)
    true
  end
end

describe('given a checked-out material') do
  let(:library) { Library.new }

  before(:each) do
    @due_date = library.borrow(Agile_Java, Patron_Id)
  end

  describe 'when returned late' do
    before(:each) do
      library.return_material(Agile_Java, @due_date + 1)
    end

    it 'is marked as available' do
      expect(library.available? Agile_Java).to be true
    end

    it 'generates a late fine' do
      # ...
    end

    it 'notifies patrons with hold' do
      # ...
    end
  end
end