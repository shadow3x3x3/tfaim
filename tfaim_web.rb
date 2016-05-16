# coding: utf-8
require 'sinatra'
require 'tilt/erb'
require 'pry'
require_relative 'tfaim'

Choices = { 'Benzoic_cid' => '苯甲酸'
          }.freeze
Kind    = { 'Benzoic_cid' => 5
          }.freeze
t = Tfaim.new
full_food = {}
full_food[:milk]       = t.milk
full_food[:cream]      = t.cream
full_food[:ice]        = t.ice
full_food[:veg_fru]    = t.veg_fru
full_food[:fruit]      = t.fruit
full_food[:vegetable]  = t.vegetable
full_food[:dessert]    = t.dessert
full_food[:grain]      = t.grain
full_food[:baking]     = t.baking
full_food[:meat]       = t.meat
full_food[:seafood]    = t.seafood
full_food[:egg]        = t.egg
full_food[:sweat]      = t.sweat
full_food[:seasoning]  = t.seasoning
full_food[:nutritious] = t.nutritious
full_food[:drink]      = t.drink
full_food[:snack]      = t.snack
full_food[:meal]       = t.meal
full_food[:processed]  = t.processed

get '/' do
  @title = "添加物濃度"
  erb :index
end

post '/food_concentration' do
  @full_food  = full_food
  @title      = '輸入各類食物所含濃度'
  @kind       = params['kind']
  t.additives = @kind
  erb :food_concentration
end

post '/food_concentration/result' do
  t.concentration = take_input(params)
  @title  = '計算結果'
  @result = t.additives
  erb :result, layout: :result_layout
end

get '/food_concentration/result/:type' do
  @full_food = full_food
  type = params['type']
  case type
  when 'baby'
    @title        = '嬰兒攝食量評估表'
    @use_avg      = t.baby_use_avg
    @use_avg_sum  = sum(@use_avg.flatten)
    @use_high     = t.baby_use_high
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :under, layout: :result_layout
  when 'kid'
    @title       = '幼兒攝食量評估表'
    @use_avg     = t.kid_use_avg
    @use_avg_sum = sum(@use_avg.flatten)
    @use_high    = t.kid_use_high
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :under, layout: :result_layout
  when 'child'
    @title       = '孩童攝食量評估表'
    @use_avg     = t.child_use_avg
    @use_avg_sum = sum(@use_avg.flatten)
    @use_high    = t.child_use_high
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :under, layout: :result_layout
  when 'teenager'
    @title              = '青少年攝食量評估表'
    @male_use_avg       = t.teenager_male_use_avg
    @male_use_avg_sum   = sum(@male_use_avg.flatten)
    @male_use_high      = t.teenager_male_use_high
    @female_use_avg     = t.teenager_female_use_avg
    @female_use_avg_sum = sum(@female_use_avg.flatten)
    @female_use_high    = t.teenager_female_use_high
    @use_avg            = t.teenager_use_avg
    @use_avg_sum        = sum(@use_avg.flatten)
    @use_high           = t.teenager_use_high
    @male_use_max      = @male_use_high.flatten.max
    @female_use_max    = @female_use_high.flatten.max
    @male_cos_intake   = find_cos(@male_use_avg, @male_use_max, @male_use_high)
    @female_cos_intake = find_cos(@female_use_avg, @female_use_max, @female_use_high)
    @male_result       = @male_use_avg_sum + @male_use_max - @male_cos_intake
    @female_result     = @female_use_avg_sum + @female_use_max - @female_cos_intake
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :normal, layout: :result_layout
  when 'adult'
    @title              = '成年人攝食量評估表'
    @male_use_avg       = t.adult_male_use_avg
    @male_use_avg_sum   = sum(@male_use_avg.flatten)
    @male_use_high      = t.adult_male_use_high
    @female_use_avg     = t.adult_female_use_avg
    @female_use_avg_sum = sum(@female_use_avg.flatten)
    @female_use_high    = t.adult_female_use_high
    @use_avg            = t.adult_use_avg
    @use_avg_sum        = sum(@use_avg.flatten)
    @use_high           = t.adult_use_high
    @male_use_max      = @male_use_high.flatten.max
    @female_use_max    = @female_use_high.flatten.max
    @male_cos_intake   = find_cos(@male_use_avg, @male_use_max, @male_use_high)
    @female_cos_intake = find_cos(@female_use_avg, @female_use_max, @female_use_high)
    @male_result       = @male_use_avg_sum + @male_use_max - @male_cos_intake
    @female_result     = @female_use_avg_sum + @female_use_max - @female_cos_intake
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :normal, layout: :result_layout
  when 'older'
    @title              = '老年人攝食量評估表'
    @male_use_avg       = t.older_male_use_avg
    @male_use_avg_sum   = sum(@male_use_avg.flatten)
    @male_use_high      = t.older_male_use_high
    @female_use_avg     = t.older_female_use_avg
    @female_use_avg_sum = sum(@female_use_avg.flatten)
    @female_use_high    = t.older_female_use_high
    @use_avg            = t.older_use_avg
    @use_avg_sum        = sum(@use_avg.flatten)
    @use_high           = t.older_use_high
    @male_use_max      = @male_use_high.flatten.max
    @female_use_max    = @female_use_high.flatten.max
    @male_cos_intake   = find_cos(@male_use_avg, @male_use_max, @male_use_high)
    @female_cos_intake = find_cos(@female_use_avg, @female_use_max, @female_use_high)
    @male_result       = @male_use_avg_sum + @male_use_max - @male_cos_intake
    @female_result     = @female_use_avg_sum + @female_use_max - @female_cos_intake
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :normal, layout: :result_layout
  when 'elder'
    @title              = '高齡老年人攝食量評估表'
    @male_use_avg       = t.elder_male_use_avg
    @male_use_avg_sum   = sum(@male_use_avg.flatten)
    @male_use_high      = t.elder_male_use_high
    @female_use_avg     = t.elder_female_use_avg
    @female_use_avg_sum = sum(@female_use_avg.flatten)
    @female_use_high    = t.elder_female_use_high
    @use_avg            = t.elder_use_avg
    @use_avg_sum        = sum(@use_avg.flatten)
    @use_high           = t.elder_use_high
    @male_use_max      = @male_use_high.flatten.max
    @female_use_max    = @female_use_high.flatten.max
    @male_cos_intake   = find_cos(@male_use_avg, @male_use_max, @male_use_high)
    @female_cos_intake = find_cos(@female_use_avg, @female_use_max, @female_use_high)
    @male_result       = @male_use_avg_sum + @male_use_max - @male_cos_intake
    @female_result     = @female_use_avg_sum + @female_use_max - @female_cos_intake
    @use_max    = @use_high.flatten.max
    @cos_intake = find_cos(@use_avg, @use_max, @use_high)
    @result     = @use_avg_sum + @use_max - @cos_intake
    erb :normal, layout: :result_layout
  when 'EDI'
    @title = '攝食暴露量估計總表'
    erb :EDI, layout: :result_layout
  when 'ADI'
    @title = '暴露量估計總表'
    erb :ADI, layout: :result_layout
  end
end

def take_input(params)
  array = []
  params.each { |_key, value| array << value.to_f }
  array
end

def find_cos(find_array, value, chcek_array)
  index = chcek_array.flatten.index(value)
  find_array.flatten[index]
end

def sum(array)
  array.inject(&:+)
end
