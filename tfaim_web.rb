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
  params_baby     = calc_baby(t)
  params_kid      = calc_kid(t)
  params_child    = calc_child(t)
  params_teenager = calc_teenager(t)
  params_adult    = calc_adult(t)
  params_older    = calc_older(t)
  params_elder    = calc_elder(t)

  case params['type']
  when 'baby'
    @title = '嬰兒攝食量評估表'

    @params = params_baby
    erb :under, layout: :result_layout
  when 'kid'
    @title = '幼兒攝食量評估表'

    @params = params_kid
    erb :under, layout: :result_layout
  when 'child'
    @title = '孩童攝食量評估表'

    @params = params_child
    erb :under, layout: :result_layout
  when 'teenager'
    @title = '青少年攝食量評估表'

    @params = params_teenager
    erb :normal, layout: :result_layout
  when 'adult'
    @title = '成年人攝食量評估表'

    @params = params_adult
    erb :normal, layout: :result_layout
  when 'older'
    @title = '老年人攝食量評估表'

    @params = params_older
    erb :normal, layout: :result_layout
  when 'elder'
    @title = '高齡老年人攝食量評估表'

    @params = params_elder
    erb :normal, layout: :result_layout
  when 'EDI'
    @title = '攝食暴露量估計總表'
    erb :EDI, layout: :result_layout
  when 'ADI'
    @title = '暴露量估計總表'
    erb :ADI, layout: :result_layout
  end
end

def calc_baby(t)
  params = {}

  params[:use_avg]     = t.baby_use_avg
  params[:use_avg_sum] = sum(params[:use_avg].flatten)
  params[:use_high]    = t.baby_use_high
  calc_under(params)
end

def calc_kid(t)
  params = {}

  params[:use_avg]     = t.kid_use_avg
  params[:use_avg_sum] = sum(params[:use_avg].flatten)
  params[:use_high]    = t.kid_use_high
  calc_under(params)
end

def calc_child(t)
  params = {}

  params[:use_avg]     = t.child_use_avg
  params[:use_avg_sum] = sum(params[:use_avg].flatten)
  params[:use_high]    = t.child_use_high
  calc_under(params)
end

def calc_teenager(t)
  params = {}

  params[:male_use_avg]       = t.teenager_male_use_avg
  params[:male_use_avg_sum]   = sum(params[:male_use_avg].flatten)
  params[:male_use_high]      = t.teenager_male_use_high
  params[:female_use_avg]     = t.teenager_female_use_avg
  params[:female_use_avg_sum] = sum(params[:female_use_avg].flatten)
  params[:female_use_high]    = t.teenager_female_use_high
  params[:use_avg]            = t.teenager_use_avg
  params[:use_avg_sum]        = sum(params[:use_avg].flatten)
  params[:use_high]           = t.teenager_use_high
  params[:male_use_max]       = params[:male_use_high].flatten.max
  params[:female_use_max]     = params[:female_use_high].flatten.max
  params[:male_cos_intake]    = find_cos(params[:male_use_avg], params[:male_use_max], params[:male_use_high])
  params[:female_cos_intake]  = find_cos(params[:female_use_avg], params[:female_use_max], params[:female_use_high])
  calc_upper(params)
end

def calc_adult(t)
  params = {}

  params[:male_use_avg]       = t.adult_male_use_avg
  params[:male_use_avg_sum]   = sum(params[:male_use_avg].flatten)
  params[:male_use_high]      = t.adult_male_use_high
  params[:female_use_avg]     = t.adult_female_use_avg
  params[:female_use_avg_sum] = sum(params[:female_use_avg].flatten)
  params[:female_use_high]    = t.adult_female_use_high
  params[:use_avg]            = t.adult_use_avg
  params[:use_avg_sum]        = sum(params[:use_avg].flatten)
  params[:use_high]           = t.adult_use_high
  params[:male_use_max]       = params[:male_use_high].flatten.max
  params[:female_use_max]     = params[:female_use_high].flatten.max
  params[:male_cos_intake]    = find_cos(params[:male_use_avg], params[:male_use_max], params[:male_use_high])
  params[:female_cos_intake]  = find_cos(params[:female_use_avg], params[:female_use_max], params[:female_use_high])
  calc_upper(params)
end

def calc_older(t)
  params = {}

  params[:male_use_avg]       = t.older_male_use_avg
  params[:male_use_avg_sum]   = sum(params[:male_use_avg].flatten)
  params[:male_use_high]      = t.older_male_use_high
  params[:female_use_avg]     = t.older_female_use_avg
  params[:female_use_avg_sum] = sum(params[:female_use_avg].flatten)
  params[:female_use_high]    = t.older_female_use_high
  params[:use_avg]            = t.older_use_avg
  params[:use_avg_sum]        = sum(params[:use_avg].flatten)
  params[:use_high]           = t.older_use_high
  params[:male_use_max]       = params[:male_use_high].flatten.max
  params[:female_use_max]     = params[:female_use_high].flatten.max
  params[:male_cos_intake]    = find_cos(params[:male_use_avg], params[:male_use_max], params[:male_use_high])
  params[:female_cos_intake]  = find_cos(params[:female_use_avg], params[:female_use_max], params[:female_use_high])
  calc_upper(params)
end

def calc_elder(t)
  params = {}

  params[:male_use_avg]       = t.elder_male_use_avg
  params[:male_use_avg_sum]   = sum(params[:male_use_avg].flatten)
  params[:male_use_high]      = t.elder_male_use_high
  params[:female_use_avg]     = t.elder_female_use_avg
  params[:female_use_avg_sum] = sum(params[:female_use_avg].flatten)
  params[:female_use_high]    = t.elder_female_use_high
  params[:use_avg]            = t.elder_use_avg
  params[:use_avg_sum]        = sum(params[:use_avg].flatten)
  params[:use_high]           = t.elder_use_high
  params[:male_use_max]       = params[:male_use_high].flatten.max
  params[:female_use_max]     = params[:female_use_high].flatten.max
  params[:male_cos_intake]    = find_cos(params[:male_use_avg], params[:male_use_max], params[:male_use_high])
  params[:female_cos_intake]  = find_cos(params[:female_use_avg], params[:female_use_max], params[:female_use_high])
  calc_upper(params)
end

def calc_under(params)
  params[:use_max]    = params[:use_high].flatten.max
  params[:cos_intake] = find_cos(params[:use_avg], params[:use_max], params[:use_high])
  params[:result]     = params[:use_avg_sum] + params[:use_max] - params[:cos_intake]
  params
end

def calc_upper(params)
  params[:male_result]   = params[:male_use_avg_sum] + params[:male_use_max] - params[:male_cos_intake]
  params[:female_result] = params[:female_use_avg_sum] + params[:female_use_max] - params[:female_cos_intake]
  params[:use_max]       = params[:use_high].flatten.max
  params[:cos_intake]    = find_cos(params[:use_avg], params[:use_max], params[:use_high])
  params[:result]        = params[:use_avg_sum] + params[:use_max] - params[:cos_intake]
  params
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
