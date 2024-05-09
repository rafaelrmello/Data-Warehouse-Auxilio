Criação do Data Warehouse do Auxílio Emergencial

Para a criação deste Data Warehouse, foi utilizado a ferramenta SQL Server para a criação de um banco de dados com dados fictícios. Foram criados 5 tabelas dimensões e uma tabela fato, e os dados foram inseridos manualmente.

Com a criação do Banco de dados e com os dados inseridos, foram feitos 5 analises desses dados, com códigos de consulta SQL.

Após essas analises, foram salvos os resultados dessas consultas SQL em arquivos CSV.

Com os arquivos CSV, foi criado um LakeHouse na plataforma Microsoft Fabric e foram gerados tabelas desses dados.

Com as tabelas do LakeHouse, importamos para o DataWarehouse e fizemos uma consulta SQl utilizando o SELECT para selecionar os campos das tabelas de cada consulta.

Exemplo do código SELECT utilizado nas consultas: SELECT [_c0] ,[_c1] FROM [LakehouseAuxilio_Emergencial].[dbo].[valortotalpagoporestado].

Após este SELECT, utilizamos o PowerBI para a geração de dashboards para utilizar na apresentação.
