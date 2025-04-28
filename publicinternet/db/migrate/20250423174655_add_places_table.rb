class AddPlacesTable < ActiveRecord::Migration[8.0]
  # Define uma classe de migração para criar ou modificar tabelas no banco de dados.
  # A versão da migração está definida como 8.0.

  def change
    # Método principal que descreve as alterações a serem feitas no banco de dados.
    create_table :internet_speeds, id: :uuid do |t|
      # Cria uma nova tabela chamada "internet_speeds", onde o identificador (ID)
      # será do tipo UUID (Universal Unique Identifier).

      t.float :download_speed, null: false
      # Adiciona uma coluna chamada "download_speed" para armazenar números decimais de ponto flutuante.
      # Isso é útil para registrar valores de velocidade de download (exemplo: 100.5 Mbps).
      # "null: false" garante que esta coluna não pode conter valores nulos (deve sempre ter um valor).

      t.string :download_speed_unit, null: false
      # Adiciona uma coluna chamada "download_speed_unit" para armazenar unidades de velocidade, como "Mbps".
      # "null: false" significa que este campo não pode ser vazio.

      t.timestamps
      # Adiciona automaticamente as colunas "created_at" e "updated_at", que registram
      # a data de criação e a última modificação de cada linha na tabela.
    end
    # Finaliza a criação da tabela.
  end
end
