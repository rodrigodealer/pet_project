# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

brand = Brand.create(name: 'Chalesco')

size = ProductOption.create(name: 'Tamanho')
color = ProductOption.create(name: 'Cor')
type = ProductOption.create(name: 'Animal')

Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  properties: [
    size.name => [['G', 20], ['P', 30], ['M', 10]],
    color.name => [['Preto', 10]],
    type.name => [['Gato', 20]]
  ]
)

Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  properties: [
    size.name => [['G', 20], ['P', 30], ['M', 10]],
    color.name => [['Preto', 10]],
    type.name => [['Gato', 20]]
  ])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  properties: [
    size.name => [['G', 20], ['P', 30], ['M', 10]],
    color.name => [['Preto', 10]],
    type.name => [['Gato', 20]]
  ])
