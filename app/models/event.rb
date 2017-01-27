class Event < ApplicationRecord
  belongs_to :bar
  include PgSearch
  multisearchable :against => [:day, :start, :end, :bar]
  after_initialize do
    self[:day_int] = day_of_week(self.day)
  end


  def day_of_week(day)
    days = { "Monday" => 1, "Tuesday" => 2, "Wednesday" => 3, "Thursday" => 4, "Friday" => 5, "Saturday" => 6, "Sunday" => 7 }

    days[day]
  end



  def self.hourstring(time)
    time.strftime("%l")
  end

  def self.sorted
    e = Event.all.sort_by {|event| event.day_int}
    f = e.select {|event| event.day_int >= (Time.now.strftime("%w").to_i) }
    (e-f).each {|i| f << i}
    f
  end


end
