require_relative '../util/food_util'
# Baby Module
module Baby
  extend FoodUtil

  @baby_full   = reader_to_f('assets/type/baby/intake_average.txt')
  @baby_high   = reader_to_f('assets/type/baby/intake_high.txt')

  def self.max_avg
  end

  def self.max_high
  end

  def self.use_avg(intake)
    r = ingestion_exposure(@baby_full, intake)
    clean(r)
  end

  def self.use_high(intake)
    r = ingestion_exposure(@baby_high, intake)
    clean(r)
  end
end
