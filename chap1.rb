require 'debugger'
require 'benchmark'

module Chap1
  def insertion_sort_asc(a)
    for j in 1...a.length
      key = a[j]
      i = j - 1
      while i > -1 and a[i] > key
        a[i + 1] = a[i]
        i -= 1
      end
      a[i + 1] = key
    end
    return a
  end

  def insertion_sort_desc(a)
    for j in 1...a.length 
      key = a[j]
      i = j - 1
      while i > -1 and a[i] < key
        a[i + 1] = a[i]
        i -= 1
      end
      a[i + 1] = key
    end
    return a
  end

  def search_for(v, a)
    for i in 0...a.length
      return i if a[i] == v
    end
    return nil
  end

  def nbit_addition(a, b)
    bit1 = toBits(a)
    bit2 = toBits(b)
    bitLength = bit1.length > bit2.length ? bit1.length : bit2.length
    bit3 = []
    for i in 0...bitLength
      bit1[i] = 0 if bit1[i].nil? 
      bit2[i] = 0 if bit2[i].nil? 
      bit3[i] = 0 if bit3[i].nil?
      bit3[i] += (bit1[i] + bit2[i])
      if bit3[i] > 1
        bit3[i + 1] = 0 if bit3[i + 1].nil?
        bit3[i] %= 2
        bit3[i + 1] += 1
      end
    end
    bit3.join.to_s.reverse.to_i(2)
  end

  def toBits(value)
    bit = []
    value.to_s(2).reverse.split(//).each { |b| bit << b.to_i } 
    return bit
  end

  def selection_sort(a)
    b = []
    total = a.length
    while b.length < total
      lowest = a[0]
      for i in 0...a.length
        lowest = a[i] if a[i] < lowest
      end
      a.delete_at(a.index(lowest))
      b << lowest
    end
    return b
  end

  def peval(x, a) 
    sum = 0
    for i in 0...a.length
      sum += ((x ** i) * a[i])
    end
    return sum
  end

  def peval_ntime(x, a)
    sum = a[0]
    exp = 1
    for i in 1...a.length
      exp *= x
      sum += exp * a[i]
    end
    return sum
  end

  def horners_rule(x, a)
    sum = 0
    n = a.length - 1
    while n >= 0
      sum = a[n] + (x * sum)
      n -= 1
    end
    return sum 
  end

  def merge(x, y)
    z = []
    while x.length > 0 or y.length > 0
      if y[0].nil?
        z << x[0]
        x.delete_at(0)
      elsif x[0].nil? 
        z << y[0]
        y.delete_at(0)
      elsif x[0] > y[0] 
        z << y[0]
        y.delete_at(0)
      else
        z << x[0]
        x.delete_at(0)
      end
    end
    return z
  end

  def merge_sort(a)
    if a.length <= 1
      return a
    else
      q = (a.length/2).floor
      x = merge_sort(a[0...q])
      y = merge_sort(a[q...a.length])
      z = merge(x, y)
    end
    return z
  end

  def repeated_occurence?(a, v)
    a = merge_sort(a)
    counter = 0
    for i in 0...a.length
      counter += 1 if a[i] == v
      if counter == 2
        return true
      end
      if a[i] > v
        return false
      end
    end
  end

  def insert_sort_rec(a)
    if a.length > 1
      sa = insert_sort_rec(a[0...a.length - 1])
      key = a[a.length - 1]
      for i in 0...sa.length
        if key < sa[i]
          sa.insert(i, key)
          return sa
        end
      end
      sa << key
      return sa
    else return a
    end
  end

  def binary_search(key, a, min, max)
    i = ((min + max)/2).floor
    if a[i] == key 
      return i
    elsif min == max
      return nil
    elsif a[i] < key
      min = i + 1
    else
      max = i
    end
    binary_search(key, a, min, max)
  end

  def insert_sort_with_bin_search(a)
    for i in 1...a.length
      if(a[i] < a[i - 1])
        loc = binary_search_closest_index(a[i], a, 0, i - 1)
        a = a.insert(loc, a.delete_at(i))
      end
    end
    return a
  end

  def binary_search_closest_index(key, a, min, max)
    i = ((min + max)/2).floor
    if a[i] == key 
      return i
    elsif min == max
      return min
    elsif a[i] < key
      min = i + 1
    else
      max = i
    end
    binary_search_closest_index(key, a, min, max)
  end

  def find_sum(sum, a)
    a = merge_sort(a)
    for i in 0...a.length
      return true if binary_search(sum - a[i], a, i, a.length - 1)
    end
    return false
  end

  def merge_sort_with_insertion_sort(a)
    if a.length <= 1
      return a
    else
      q = (a.length/2).floor
      x = merge_sort(a[0...q])
      y = merge_sort(a[q...a.length])
      z = merge(x, y)
    end
    return z
  end
end
