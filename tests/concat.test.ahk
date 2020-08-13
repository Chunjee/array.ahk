assert.label("concat")
arrays := [[1,2,3]
	, [4,5,6]
	, [7,8,9]]


assert.label("concat - Combine empty array and non empty array")
assert.test([1,2,3], [].concat(arrays[1]))

assert.label("concat - Combine two non empty arrays")
assert.test([1,2,3,4,5,6], arrays[1].concat(arrays[2]))

assert.label("concat - Combine three non empty arrays")
assert.test([1,2,3,4,5,6,7,8,9], [].concat(arrays*))


assert.label("concat - empty array in, empty array out")
assert.test([], [].concat([]))
assert.test([], [].concat())

assert.label("concat - plain values as arguments")
assert.test([].concat("Bill", "Ted"), ["Bill", "Ted"])
assert.test(["Bill"].concat("Ted"), ["Bill", "Ted"])