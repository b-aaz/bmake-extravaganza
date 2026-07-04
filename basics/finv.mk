# Floating point sign INVerter.
finv.return:=${finv.args:[1]:C/^([^-+])/+\1/:S/^+/@/:S/^-/+/:S/^@/-/}
