class InternetSpeed < ApplicationRecord
  # Define uma classe chamada 'InternetSpeed', que herda de 'ApplicationRecord'.
  # Isso significa que 'InternetSpeed' é um modelo no Rails, representando uma tabela chamada 'internet_speeds'.

  belongs_to :place
  # Estabelece uma relação "belongs_to" (pertence a) entre o modelo 'InternetSpeed' e o modelo 'Place'.
  # Isso indica que cada registro na tabela 'internet_speeds' está associado a um único registro na tabela 'places'.
  # Essa relação pressupõe que a tabela 'internet_speeds' tenha uma coluna chamada 'place_id',
  # que funciona como uma chave estrangeira referenciando a tabela 'places'.
end
