describe "Roman" do
  context "when condition" do
    it "converts arabic numbers to roman numbers" do
      # expect(convert(1)).to eq "I"
      # expect(convert(2)).to eq "II"
      # expect(convert(3)).to eq "III"
      # expect(convert(10)).to eq "X"
      # expect(convert(11)).to eq "XI"
      # expect(convert(20)).to eq "XX"
      expect(convert(100)).to eq "C"
    end
  end
end