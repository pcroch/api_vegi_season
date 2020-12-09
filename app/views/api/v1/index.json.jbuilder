# app/views/api/v1/products/index.json.jbuilder
# json.array! @products do |product|
#   json.extract! product, :id, :name, :kind
# end

# json.array! @categories do |category|
#   json.id category.id
#   json.name category.name
#   json.created_at category.created_at
# end
 p "hello"




json.array! @products, :id, :name
