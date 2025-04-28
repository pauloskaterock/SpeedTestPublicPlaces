class AddInternetSpeedsTable < ActiveRecord::Migration[8.0]
  # Define uma classe que representa uma migração do banco de dados no Rails.
  def change
    # Método principal que descreve as mudanças a serem feitas no banco de dados.
    create_table :internet_speeds, id: :uuid do |t|
      # Cria uma tabela chamada "internet_speeds" com um identificador do tipo UUID.

      t.references :place, null: false, foreign_key: true, index: true, type: :uuid
      # Cria uma coluna que faz referência a outra tabela, chamada "place".
      # "null: false" garante que a coluna não pode ser nula.
      # "foreign_key: true" adiciona uma restrição de chave estrangeira para garantir integridade referencial.
      # "index: true" cria um índice para melhorar o desempenho nas buscas.
      # "type: :uuid" especifica que o identificador é do tipo UUID.

      t.decimal :download_speed, null: false, scale: 2, precision: 15
      # Adiciona uma coluna "download_speed" para armazenar valores decimais.
      # "null: false" assegura que a coluna deve ter um valor.
      # "scale: 2" define o número de casas decimais (exemplo: 123.45).
      # "precision: 15" define o número total de dígitos (exemplo: 123456789012.45).

      t.string :download_units, null: false
      # Adiciona uma coluna "download_units" para armazenar a unidade de medida, como "Mbps".
      # "null: false" significa que este campo não pode ser vazio.

      t.timestamps
      # Adiciona automaticamente as colunas "created_at" e "updated_at", que registram
      # a data de criação e a última modificação da linha, respectivamente.
    end
    # Finaliza a definição da tabela.
  end
end

