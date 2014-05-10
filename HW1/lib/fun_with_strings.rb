module FunWithStrings
  # A部分——回文：编写一个方法palindrome?
  # 它返回true当且仅当它的接收者是一个回文
  def palindrome?
    self.gsub(/\W/,'').downcase.reverse == self.gsub(/\W/,'').downcase
    
  end

  # B部分——单词统计：定义一个函数 count_words，给定一个字符串作为输入，
  # 它返回一个散列表，散列表的键是字符串中的单词，值是单词出现的次数：
  def count_words
    self.split.group_by { |w| w.gsub(/\W/,'').downcase }.
	delete_if {|k,v| k.empty?}.
	inject({}) { |m,item| m.merge(item[0]=>item[1].count)}
    
  end

  # C部分——易位词:给定一个字符串中由空格分隔的单词序列，
  # 请你编写一个方法来把它们分成若干组易位词，并且返回这些词组。
  # 在将字符串分成易位词词组时不用考虑大小写
  def anagram_groups
    self.split.group_by{ |w| w.gsub(/\W/,'').downcase.split(//).sort }.
	values
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
