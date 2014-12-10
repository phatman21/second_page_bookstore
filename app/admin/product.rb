ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

    permit_params :name, :description, :price, :stock_quantity, :image,
                  :category_id

     index title: 'Products' do
      selectable_column
      column :name

    column :price do |product|
      number_to_currency product.price
    end

    column :stock_quantity
    column :description
    column :category
    
    actions
  end

  form(html: { multipart: true }) do |f|
    f.inputs 'Product Details' do
      f.input :name
      f.input :price
      f.input :stock_quantity
      f.input :description
      f.input :category
      f.input :image
    end
    f.actions
  end
end
