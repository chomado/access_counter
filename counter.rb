# カウンタ宣言
count = 0

# 今のカウンタ読み込んで, count へ代入
File.open("count.txt", "r") do |file|
	count = file.read.to_i
	count += 1
end

# カウンタファイル更新
File.open("count.txt", "w") do |file|
	file.print(count)
end