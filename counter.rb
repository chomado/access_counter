# 書き込みロック(write lock)を使用してカウンタを更新。
File.open("count.txt", File::RDWR|File::CREAT, 0644) {|f|
	f.flock(File::LOCK_EX)
	value = f.read.to_i + 1
	f.rewind
	f.write("#{value}\n")
	f.flush
	f.truncate(f.pos)
}

# 読み込みロック(read lock)を使用してカウンタを読み込み。
File.open("count.txt", "r") {|f|
	f.flock(File::LOCK_SH)
	p f.read
}