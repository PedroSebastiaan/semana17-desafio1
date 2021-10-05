# README

Para ingresar un  nuevo producto al catalogo (parte de la web que dispone solamente de una articulo de cada tipo) basta solamente con crear una variante, lo que se puede hacer de la siguiente manera:

#Color
red = Color.find_by(color_spec: 'red')

#Talla
m = Size.find_by(size_spec: 'm')

#Producto
p_05 = Product.find_by(name: "Zico Beach Sandal")

Variant.create(stock: 30, color_id: red.id, size_id: m.id, product_id: p_05.id)

Si esta variante se ingresa por primera vez a la base de datos, sera la que se muestre en el catalogo (esto estara sujeto al stock de la misma).

Con respecto al modelo "order_items", como el stock paso de star almacenado en el producto a estar almacenado en la variante, se cambia la referencia desde el producto a la variante.