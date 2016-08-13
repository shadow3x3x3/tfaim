require_relative '../util/food_util'
# Kid Module
module Kid
  extend FoodUtil

  @kid_full   = reader_to_f('assets/type/kid/intake_average.txt')
  @kid_high   = reader_to_f('assets/type/kid/intake_high.txt')

  def self.max_avg
  end

  def self.max_high
  end

  def self.use_avg(intake)
    r = ingestion_exposure(@kid_full, intake)
    clean(r)
  end

  def self.use_high(intake)
    r = ingestion_exposure(@kid_high, intake)
    clean(r)
  end
end
