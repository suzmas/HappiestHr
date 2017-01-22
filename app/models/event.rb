class Event < ApplicationRecord
  belongs_to :bar

  def self.hourstring(time)
    time.strftime("%l")
  end


  def day_of_week
    days = { "Monday" => 1, "Tuesday" => 2, "Wednesday" => 3, "Thursday" => 4, "Friday" => 5, "Saturday" => 6, "Sunday" => 7 }

    days[day]
  end


  def self.sorted
    e = Event.all.sort {|event| event.day_of_week }
    f = e.select {|event| event.day_of_week >= (Time.now.strftime("%w").to_i) }
    (e-f).each {|i| f << i}
    f
  end


end
