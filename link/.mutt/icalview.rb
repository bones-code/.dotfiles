#!/usr/bin/env ruby
# From http://nickmurdoch.livejournal.com/391409.html

require "rubygems" 
require "icalendar"
require "date"

class DateTime
  def myformat
    (self.offset == 0 ? (DateTime.parse(self.strftime("%a %b %d %Y, %H:%M ") + self.icalendar_tzid)) : self).
        new_offset(Rational(Time.now.utc_offset - 60*60, 24*60*60)).strftime("%a %b %d %Y, %H:%M")
  end
end

cals = Icalendar.parse($<)
cals.each do |cal|
  cal.events.each do |event|
    puts "Organizer: #{event.organizer}"
    puts "Event:     #{event.summary}"
    puts "Starts:    #{event.dtstart.myformat} local time"
    puts "Ends:      #{event.dtend.myformat}"
    puts "Location:  #{event.location}"
    puts "Contact:   #{event.contacts}"
    puts "Description:\n#{event.description}"
    puts ""
    end
end
