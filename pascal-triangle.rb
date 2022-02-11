def pascal_triangle(n)
  raise ArgumentError, "must be positive." if n < 1
  yield tree = [1]
  (n-1).times do
    tree.unshift(0).push(0)
    yield tree = tree.each_cons(2).map {|element| element.sum}
  end
end

pascal_triangle(10){|row| puts row.join(" ").center(30)}
