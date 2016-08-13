require_relative '../util/food_util'
# Elder Module
module Elder
  extend FoodUtil

  @m_avg  = reader_to_f('assets/type/elder/intake_average_male.txt')
  @m_high = reader_to_f('assets/type/elder/intake_high_male.txt')
  @f_avg  = reader_to_f('assets/type/elder/intake_average_female.txt')
  @f_high = reader_to_f('assets/type/elder/intake_high_female.txt')
  @avg    = reader_to_f('assets/type/elder/intake_average.txt')
  @high   = reader_to_f('assets/type/elder/intake_high.txt')

  def self.max_average
  end

  def self.max_high
  end

  # male
  def self.male_use_avg(intake)
    r = ingestion_exposure(@m_avg, intake)
    clean(r)
  end

  def self.male_use_high(intake)
    r = ingestion_exposure(@m_high, intake)
    clean(r)
  end

  # female
  def self.female_use_avg(intake)
    r = ingestion_exposure(@f_avg, intake)
    clean(r)
  end

  def self.female_use_high(intake)
    r = ingestion_exposure(@f_high, intake)
    clean(r)
  end

  # all
  def self.use_avg(intake)
    r = ingestion_exposure(@avg, intake)
    clean(r)
  end

  def self.use_high(intake)
    r = ingestion_exposure(@high, intake)
    clean(r)
  end
end
