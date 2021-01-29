class CreateFilmes < ActiveRecord::Migration[6.1]
  def change
    create_table :filmes do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end
end
