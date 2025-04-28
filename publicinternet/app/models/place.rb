class Place < ApplicationRecord
  # Define uma classe chamada 'Place', que herda de 'ApplicationRecord'.
  # Isso significa que 'Place' é um modelo no Rails, representando uma tabela no banco de dados chamada 'places'.

  has_many :internet_speeds
  # Estabelece uma associação "has_many" (tem muitos) entre o modelo 'Place' e o modelo 'InternetSpeed'.
  # Isso indica que cada registro na tabela 'places' pode estar relacionado a vários registros na tabela 'internet_speeds'.
  # Essa relação pressupõe que a tabela 'internet_speeds' contém uma coluna chamada 'place_id',
  # que funciona como uma chave estrangeira referenciando a tabela 'places'.
end
