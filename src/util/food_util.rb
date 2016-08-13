# Module FoodUtil
module FoodUtil
  def reader_to_f(path)
    array = []
    File.open(path, 'r:UTF-8') do |f|
      f.each_line { |line| array << line.to_f }
    end
    array
  end

  def clean(r)
    full = []
    full << r[0..17]    # 1
    full << r[18..27]   # 2
    full << r[28..32]   # 3
    full << [r[33]]     # 4
    full << r[34..51]   # 4.1
    full << r[52..75]   # 4.2
    full << r[76..88]   # 5
    full << r[89..120]  # 6
    full << r[120..132] # 7
    full << r[133..164] # 8
    full << r[165..194] # 9
    full << r[195..202] # 10
    full << r[203..216] # 11
    full << r[217..242] # 12
    full << r[243..251] # 13
    full << r[252..269] # 14
    full << r[270..271] # 15
    full << [r[272]]    # 16
    full << [r[273]]    # 17
    full
  end

  def ingestion_exposure(data, intake)
    data.map.with_index { |f, i| (f * intake[i] / 1000).round(3) }
  end
end
