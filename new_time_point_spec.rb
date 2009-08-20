require 'rubygems'
require 'spec'
require "#{File.dirname(__FILE__)}/new_time_point"

describe TimePoint do
  it "1st-2nd And 4th Thursdays Of March And April 5-6:30pm And March 16th - 24th At 2-2:30pm" do
    t = TimePoint.parse("1st-2nd And 4th Thursdays Of March And April 5-6:30pm And March 16th - 24th At 2-2:30pm")
    # march 5, 12, 26, april 2, 9, 23
    t.occurs_on_day?(Time.parse('2009-03-04')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-03-11')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-03-25')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-01')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-08')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-22')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-03-05')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-03-12')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-03-26')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-04-02')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-04-09')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-04-23')).should eql(true)
    t.occurs_on_day?(Time.parse('2009-03-06')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-03-13')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-03-27')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-03')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-10')).should_not eql(true)
    t.occurs_on_day?(Time.parse('2009-04-24')).should_not eql(true)
    t.occurrances_on_day(Time.parse('2009-04-26')).length.should eql(2)
  end
end