class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :Title
      t.string :image
      t.string :Discription
      t.string :email

      t.timestamps
    end
  end
end
