require 'feeling_lucky/version'

module Levenshtein
  # This code is based directly on the Text gem implementation
  # Returns a value representing the "cost" of transforming str1 into str2
  # taken from https://github.com/threedaymonk/text/blob/master/lib/text/levenshtein.rb
  def distance(str1, str2)
    n = str1.length
    m = str2.length
    return m if n.zero?
    return n if m.zero?

    d = (0..m).to_a
    x = nil

    str1.each_char.with_index(1) do |char1, i|
      str2.each_char.with_index do |char2, j|
        cost = (char1 == char2) ? 0 : 1
        x = min3(
          d[j+1] + 1, # insertion
          i + 1,      # deletion
          d[j] + cost # substitution
        )
        d[j] = i
        i = x
      end
      d[m] = x
    end

    x
  end
  module_function :distance

  private

  def min3(a, b, c) # :nodoc:
    if a < b && a < c
      a
    elsif b < c
      b
    else
      c
    end
  end
  module_function :min3
end

def threshold(word)
  (word.size * 0.3).ceil
end

class Object
  def method_missing(meth, *args, &block)
    all_methods = self.methods + self.singleton_methods
    meth_str    = meth.to_s
    threshold   = threshold(meth_str)
    good_methods = all_methods.select {|word| Levenshtein.distance(meth_str, word.to_s) <= threshold }
    if good_methods.length > 0
      puts "#{self.class}:: for #{meth} picked #{good_methods.first}"
      begin
        self.send(good_methods.first, *args, &block)
      rescue Exception => e
        super
      end
    else
      super
    end
  end
end

module FeelingLucky
end


