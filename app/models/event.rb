class Event < ApplicationRecord
  belongs_to :bar

  def day_of_week
    days = { "Monday" => 0, "Tuesday" => 1, "Wednesday" => 2, "Thursday" => 3, "Friday" => 4, "Saturday" => 5, "Sunday" => 6 }

    days[day]
  end


  def self.sorted
    Event.all.sort {|event| event.day_of_week }
  end


end
