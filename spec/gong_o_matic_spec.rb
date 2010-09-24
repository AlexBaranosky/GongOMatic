require 'spec'
require File.dirname(__FILE__) + '/../src/gong_o_matic.rb'

PRACTCE_ROUTINE_FILE  = File.dirname(__FILE__) + '/practice_routine_for_test.txt'

describe GongOMatic do

  it "should give durations for each relevant line in the durations file" do
    GongOMatic.new.send(:read_practice_routine_from, PRACTCE_ROUTINE_FILE).size.should == 3
  end
  
end

describe PracticeRoutineParser do

  it "should read in lines as interval of seconds" do
    PracticeRoutineParser.parse_line("01:01:01 ** some message").duration.should == 3661
  end

  it "should raise exception if there are other than 3 sections per line" do
    proc { PracticeRoutineParser.parse_line("11:01:01:01 ** some message") }.should raise_error
    proc { PracticeRoutineParser.parse_line("11:01 ** some message") }.should raise_error
  end

  it "should ignore blank lines" do
    PracticeRoutineParser.parse_line("       ").should == nil
  end
  
  it "should ignore commented lines (which means, beginning with #)" do
    PracticeRoutineParser.parse_line("#commented line").should == nil
    PracticeRoutineParser.parse_line("      #commented line").should == nil

    proc { PracticeRoutineParser.parse_line("      wordsfirst #commented line") }.should raise_error
  end

end