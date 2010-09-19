require 'spec'
require File.dirname(__FILE__) + '/../src/gong_o_matic.rb'

DURATIONS_FILE  = File.dirname(__FILE__) + '/durations_for_test.txt'

describe GongOMatic do

  it "should give durations for each relevant line in the durations file" do
    GongOMatic.new.send(:read_practice_routine_from, DURATIONS_FILE).size.should == 3
  end
  
end

describe Parser do

  it "should read in lines as interval of seconds" do
    Parser.parse_line("01:01:01 ** some message").duration.should == 3661
  end

  it "should raise exception if there are other than 3 sections per line" do
    proc { Parser.parse_line("11:01:01:01 ** some message") }.should raise_error
    proc { Parser.parse_line("11:01 ** some message") }.should raise_error
  end

  it "should ignore blank lines" do
    Parser.parse_line("       ").should == nil
  end
  
  it "should ignore commented lines (which means, beginning with #)" do
    Parser.parse_line("#commented line").should == nil
    Parser.parse_line("      #commented line").should == nil

    proc { Parser.parse_line("      wordsfirst #commented line") }.should raise_error
  end

end