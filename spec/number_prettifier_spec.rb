require "spec_helper"

describe "NumberPrettifier" do

  it "should not change a small number" do
    NumberPrettifier.prettify(532).should == '532'
  end

  it "should truncate a million-something number" do
    NumberPrettifier.prettify(10**6).should == '1M'
  end

  it "should truncate a billion-something number" do
    NumberPrettifier.prettify(10**9).should == '1B'
  end

  it "should truncate a trillion-something number" do
    NumberPrettifier.prettify(10**12).should == '1T'
  end

  it "should round to one decimal place for non-integer numbers" do
    NumberPrettifier.prettify(2500000.34).should == '2.5M'
    NumberPrettifier.prettify(1.034).should == '1.0'
  end

  it "should round to one decimal place for integer numbers which are not evenly divisible" do
    NumberPrettifier.prettify(1123456789).should == '1.1B'
  end

end