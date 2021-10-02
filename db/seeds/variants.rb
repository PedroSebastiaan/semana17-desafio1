Variant.destroy_all

#Colors
blue = Color.find_by(color_spec: 'blue')
black = Color.find_by(color_spec: 'black')
green = Color.find_by(color_spec: 'green')
yellow = Color.find_by(color_spec: 'yellow')
gray = Color.find_by(color_spec: 'gray')
red = Color.find_by(color_spec: 'red')

#Sizes
xl = Size.find_by(size_spec: 'xl')
l = Size.find_by(size_spec: 'l')
m = Size.find_by(size_spec: 'm')
s = Size.find_by(size_spec: 's')
xs = Size.find_by(size_spec: 'xs')

#Products
p_05 = Product.find_by(name: "Zico Beach Sandal")
p_06 = Product.find_by(name: "Adidas Superstart")
p_07 = Product.find_by(name: "Timberland Premium")

#Variants
v_01 = Variant.create(stock: 10, color_id: blue.id, size_id: xl.id, product_id: p_05.id)
v_02 = Variant.create(stock: 15, color_id: black.id, size_id: xl.id, product_id: p_05.id)
v_03 = Variant.create(stock: 30, color_id: yellow.id, size_id: xl.id, product_id: p_05.id)
v_04 = Variant.create(stock: 8, color_id: gray.id, size_id: xl.id, product_id: p_05.id)
v_05 = Variant.create(stock: 43, color_id: red.id, size_id: xl.id, product_id: p_05.id)

v_06 = Variant.create(stock: 10, color_id: black.id, size_id: l.id, product_id: p_05.id)
v_07 = Variant.create(stock: 15, color_id: yellow.id, size_id: l.id, product_id: p_05.id)

v_08 = Variant.create(stock: 10, color_id: yellow.id, size_id: m.id, product_id: p_05.id)
v_09 = Variant.create(stock: 15, color_id: gray.id, size_id: m.id, product_id: p_05.id)
v_10 = Variant.create(stock: 30, color_id: red.id, size_id: m.id, product_id: p_05.id)
