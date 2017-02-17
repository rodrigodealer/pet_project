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
types = ProductOption.create(name: 'Tipo')

ProductTag.create(name: 'gato')
ProductTag.create(name: 'cachorro')
ProductTag.create(name: 'promoção')
ProductTag.create(name: 'saldão')
ProductTag.create(name: 'persa')
ProductTag.create(name: 'siamês')
ProductTag.create(name: 'westie')
ProductTag.create(name: 'schnauzer')

Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])

Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']],
    types.name => [['Gato', '40']]
])
Product.create(brand: brand,
  name: 'Pente',
  price: 30.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
Product.create(brand: brand,
  name: 'Lixa',
  price: 10.0,
  available: true,
  description: '<strong>Charlesco é a marca</strong><br />Produto recomendado por todos os criadores',
  height: 23,
  width: 30,
  weight: 150,
  depth: 5,
  properties: [
    size.name => [['G', '20'], ['P', '30'], ['M', '10']],
    color.name => [['Preto', '10']]
])
