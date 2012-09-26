def shuffle(a)
  i = a.length
  r = Random.new
  shuffled = []
  while i > 1
    loc = (r.rand * i).floor
    shuffled << a[loc] 
    a.delete_at(loc)
    i = i - 1
  end
  return shuffled
end

a = Array (1..52)
print shuffle a


