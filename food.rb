# encoding: UTF-8

# Food Processed
class Food
  attr_reader :milk, :cream, :ice, :veg_fru, :fruit
  attr_reader :vegetable, :dessert, :grain, :baking
  attr_reader :meat, :seafood, :egg, :sweat, :seasoning
  attr_reader :nutritious, :drink, :snack, :meal, :processed

  def initialize
    food
  end

  def food
    pre
    mid
    last
  end

  def pre
    @milk       = reader("assets/foods/01.0乳及乳製品")
    @cream      = reader("assets/foods/02.0脂肪、油及乳化脂肪製品")
    @ice        = reader("assets/foods/03.0食用冰品")
    @veg_fru    = reader("assets/foods/04.0蔬菜及水果類(包括蕈類、根莖菜類、豆類、藻類、堅果及種子類)")
    @fruit      = reader("assets/foods/04.1水果類")
  end

  def mid
    @vegetable  = reader("assets/foods/04.2蔬菜類(包括蕈類、根莖菜類、豆類、藻類、堅果及種子類)")
    @dessert    = reader("assets/foods/05.0糖果及甜點類")
    @grain      = reader("assets/foods/06.0穀類、塊根、塊莖等可供主食作物及其加工品")
    @baking     = reader("assets/foods/07.0烘焙食品")
    @meat       = reader("assets/foods/08.0肉類及其相關製品")
    @seafood    = reader("assets/foods/09.0水產及其製品")
    @egg        = reader("assets/foods/10.0蛋及蛋製品")
  end

  def last
    @sweat      = reader("assets/foods/11.0甜味料，包括蜂蜜")
    @seasoning  = reader("assets/foods/12.0調味品(鹽、香辛料、湯、調味醬、沙拉、蛋白質製品)")
    @nutritious = reader("assets/foods/13.0特定營養需求食品")
    @drink      = reader("assets/foods/14.0飲料類")
    @snack      = reader("assets/foods/15.0即食零嘴")
    @meal       = reader("assets/foods/16.0膳食補充品")
    @processed  = reader("assets/foods/17.0其他加工食品")
  end

  def reader(path)
    array = []
    File.open(path, 'r:UTF-8') do |f|
      f.each_line { |line| array << line }
    end
    array
  end
end
