def register_health(healths)
  health = {}

  puts "名前またはニックネームを入力した下さい。"
  health[:name] = gets.chomp
  puts "年齢を入力した下さい。"
  health[:age] = gets.to_i
  puts "歩行時間(分)を入力した下さい。"
  health[:walktime] = gets.to_i # 単位(分)
  puts "移動距離(km)を入力した下さい。"
  health[:distance] = gets.to_f  # 単位(km)
  puts "身長(cm)を入力した下さい。"
  health[:height] = (gets.to_f) * 0.01  # 単位(cm)⇒(m)
  puts "体重(kg)を入力した下さい。"
  health[:weight] = (gets.to_f)
  
  health[:speed] = (health[:distance] / (health[:walktime]/60) ).to_f.round(1)
  health[:bmi] = (health[:weight] / health[:height] / health[:height]).to_f.round(2)

  health[:stress]

  healths << health

  puts "\n"
end


def index_health(healths)

  puts "健康管理データの詳細をもっと見たい登録番号を入力して下さい。"
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒速度:#{health[:speed]}[km/h]"
  end
  input = gets.to_i
  
  show_health(healths[input-1])
end
def show_health(health)
  puts "氏名：#{health[:name]}"
  puts "年齢：#{health[:age]}歳"
  puts "............................................"
  puts "歩行時間：#{health[:walktime]}分"
  puts "移動距離：#{(health[:distance]*1000).to_f.round(0)}m(メートル)"
  puts "速度：#{(health[:speed]*1000/3600).to_f.round(2)}m/s(メートル秒)"
  puts "............................................"
  puts "身長：#{health[:height]*100}cm(センチメートル)"
  puts "体重：#{health[:weight]}kg(キログラム)"
  puts "BMI値:#{health[:bmi]}"
  puts "............................................"
end


def data_health(healths)
  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒BMI(体脂肪率):#{health[:bmi]}"

    if health[:bmi] > 24
      puts "⇒⇒痩せる事を考えましょう！"
      puts "--------------------------------------------"
    elsif health[:bmi] < 20
      puts "⇒⇒肥えても良いでしょう！"
      puts "--------------------------------------------"
    else
      puts "⇒⇒丁度良い感じです。"
      puts "--------------------------------------------"
    end

  end
  
end


def stress_health(healths)
  puts "日頃の仕事・家事・生活などストレス度合の判定しますので、下記のランク化したストレス[レベル1～5]の数字を入力して下さい！"
  puts "[レベル1]特に無くて楽々"
  puts "[レベル2]ややあっても平気"
  puts "[レベル3]何とかなってる"
  puts "[レベル4]大変で協力欲しい"
  puts "[レベル5]過剰で要改善"

  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒速度:#{health[:speed]}[km/h]  |  BMI(体脂肪率):#{health[:bmi]}"
    puts "→→→ストレスレベルを選択して下さい。"
    level = gets.to_i
    health[:stress] = level
    puts "--------------------------------------------"
  end
  
  status_health(healths)

end

def status_health(healths)

  healths.each_with_index do |health, index|
    puts "[#{index+1}]#{health[:name]}、#{health[:age]}歳⇒ストレスレベル:#{health[:stress]}  |  速度:#{health[:speed]}[km/h]  |  BMI(体脂肪率):#{health[:bmi]}"
    puts "⇒⇒⇒リフレッシュのケア対策レベル"
  end

  puts "--------------------------------------------"

end


healths = []


while true do

puts "+*+健康診断への受診内容[種類番号]を入力して下さい+*+"
puts "[0]健康診断での受診者を登録する"
puts "[1]健康診断の全受診者を一覧リストで表示する"
puts "[2]健康状態の体脂肪率の数値データ評価を列挙する"
puts "[3]現在のストレスチェックから健康状態をレベル表記する"
puts "[4]終了する"
option = gets.to_i

  case option
  when 0
    register_health(healths)
  when 1
    index_health(healths)
  when 2
    data_health(healths)
  when 3
    stress_health(healths)
  when 4
    puts "健康受診、お疲れさまでした。。。\n\n"
    exit
  else
    puts "受診内容[種類番号]が無い為、再度入力し直して下さい！\n\n"
  end

end