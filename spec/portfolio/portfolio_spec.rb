CURRENT_APPLE_PRICE = 200
CURRENT_QCOM_PRICE = 160
APPLE = "AAPL"
QUALCOMM = "QCOM"

class StubStockService
  def price(symbol)
    symbol == APPLE ? CURRENT_APPLE_PRICE : CURRENT_QCOM_PRICE
  end
end

describe Portfolio do
  let(:portfolio) { Portfolio.new }
  before() do
    portfolio.service = StubStockService.new
  end

  context "when created" do
    it "is empty" do
      expect(portfolio.empty?).to be true
    end

    it "has size 0" do
      expect(portfolio.size).to equal 0
    end

    it "answers 0 for shares of unpurchased symbol" do
      expect(portfolio[APPLE]).to equal 0
    end

    it "throws when purchasing too many shares" do
      expect { portfolio.sell(APPLE, 1) }.to raise_error(InvalidSaleError)
    end

    it "has value of 0" do
      expect(portfolio.value).to eq 0
    end
  end

  context "after purchase" do
    before() do
      portfolio.purchase(APPLE, 42)
    end

    it "is no longer empty" do
      expect(portfolio.empty?).to be false
    end

    it "has size 1" do
      expect(portfolio.size).to equal 1
    end

    it "returns share count for purchased symbol" do
      expect(portfolio[APPLE]).to equal 42
    end

    it "has value of share price" do
      expect(portfolio.value).to equal CURRENT_APPLE_PRICE * 42
    end
  end

  context "after multiple purchases different symbols" do
    before() do
      portfolio.purchase(APPLE, 20)
      portfolio.purchase(QUALCOMM, 10)
    end

    it "increments size for each unique symbol" do
      expect(portfolio.size).to equal 2
    end

    it "returns appropriate share count for symbol" do
      expect(portfolio[APPLE]).to equal 20
    end

    it "sums total of symbol values" do
      expect(portfolio.value).to equal 20 * CURRENT_APPLE_PRICE + 10 * CURRENT_QCOM_PRICE
    end
  end

  context "after sale of symbol" do
    before() do
      portfolio.purchase(APPLE, 20)
      portfolio.sell(APPLE, 12)
    end

    it "reduces share count" do
      expect(portfolio[APPLE]).to equal 20 - 12
    end
  end

  context "after selling all shares of symbol" do
    before() do
      portfolio.purchase(APPLE, 20)
      portfolio.sell(APPLE, 20)
    end

    it "decreases size" do
      expect(portfolio.size).to equal 0
    end
  end

  context "after multiple purchases same symbol" do
    before() do
      portfolio.purchase(APPLE, 20)
      portfolio.purchase(APPLE, 10)
    end

    it "only increments size for each unique symbol" do
      expect(portfolio.size).to equal 1
    end

    it "sums share count" do
      expect(portfolio[APPLE]).to equal 20 + 10
    end
  end
end