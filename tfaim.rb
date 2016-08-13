require_relative 'src/food'

# read every ages
Dir[File.dirname(__FILE__) + '/src/age/*'].each { |file| require_relative file }

# Tfaim
class Tfaim < Food
  attr_accessor :additives, :concentration

  def initialize
    super
  end

  def baby_use_avg
    Baby.use_avg(@concentration)
  end

  def baby_use_high
    Baby.use_high(@concentration)
  end

  def kid_use_avg
    Kid.use_avg(@concentration)
  end

  def kid_use_high
    Kid.use_high(@concentration)
  end

  def child_use_avg
    Child.use_avg(@concentration)
  end

  def child_use_high
    Child.use_high(@concentration)
  end

  def teenager_male_use_avg
    Teenager.male_use_avg(@concentration)
  end

  def teenager_male_use_high
    Teenager.male_use_high(@concentration)
  end

  def teenager_female_use_avg
    Teenager.female_use_avg(@concentration)
  end

  def teenager_female_use_high
    Teenager.female_use_high(@concentration)
  end

  def teenager_use_avg
    Teenager.use_avg(@concentration)
  end

  def teenager_use_high
    Teenager.use_high(@concentration)
  end

  def adult_male_use_avg
    Teenager.male_use_avg(@concentration)
  end

  def adult_male_use_high
    Teenager.male_use_high(@concentration)
  end

  def adult_female_use_avg
    Teenager.female_use_avg(@concentration)
  end

  def adult_female_use_high
    Teenager.female_use_high(@concentration)
  end

  def adult_use_avg
    Teenager.use_avg(@concentration)
  end

  def adult_use_high
    Teenager.use_high(@concentration)
  end

  def older_male_use_avg
    Teenager.male_use_avg(@concentration)
  end

  def older_male_use_high
    Teenager.male_use_high(@concentration)
  end

  def older_female_use_avg
    Teenager.female_use_avg(@concentration)
  end

  def older_female_use_high
    Teenager.female_use_high(@concentration)
  end

  def older_use_avg
    Teenager.use_avg(@concentration)
  end

  def older_use_high
    Teenager.use_high(@concentration)
  end

  def elder_male_use_avg
    Teenager.male_use_avg(@concentration)
  end

  def elder_male_use_high
    Teenager.male_use_high(@concentration)
  end

  def elder_female_use_avg
    Teenager.female_use_avg(@concentration)
  end

  def elder_female_use_high
    Teenager.female_use_high(@concentration)
  end

  def elder_use_avg
    Teenager.use_avg(@concentration)
  end

  def elder_use_high
    Teenager.use_high(@concentration)
  end
end
