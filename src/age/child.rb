require_relative '../util/food_util'
# Child Module
module Child
  extend FoodUtil

  @child_full   = reader_to_f('assets/type/child/intake_average.txt')
  @child_high   = reader_to_f('assets/type/child/intake_high.txt')

  def self.max_avg
  end

  def self.max_high
  end

  def self.use_avg(intake)
    r = ingestion_exposure(@child_full, intake)
    clean(r)
  end

  def self.use_high(intake)
    r = ingestion_exposure(@child_high, intake)
    clean(r)
  end
end
