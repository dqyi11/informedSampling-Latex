fun = @calc_ratio
X = [0.5 1]


y1 = calc_ratio(0.6)
y2 = calc_ratio(1)
level_set = fzero(fun, X)