# SysFlow

# PADRONIZAÇÕES DO PROJETO
---

Este documento aborda as documentações e os padrões utilizados para o desenvolvimento do projeto de banco de dados do SysFlow.

--- 
SOBRE AS DOCUMENTAÇÕES

Todas as documentações estão armazenadas no Git Hub dentro da pasta docs.

Existe dois arquivo brmodelos dentro da pasta docs e duas imagens correspondente aos modelos.

Os arquivos referentes a tabela de instâncias, dicionário de dados, tabela de permissões e dicionário de triggers estão dentro do link de arquivo excel-datas;

O arquivo "tabelas-de-permissoes-v.xlsx" contém as tabelas de permissões do projeto de banco de dados. Lá, há todos os ROLEs que existem no projeto e quais permissões eles possuem sobre os atributos de cada tabela contida no banco de dados;

O arquivo "row-permissions.json" dentro da pasta sql-policts contém as RLSs (row-permissions, na linguagem do Hasura) do projeto de banco de dados;

Todas as documentações se complementam. Caso haja alteração em alguma delas, todas devem ser alteradas para corresponder à mudança, de forma que não haja discrepância de informações entre elas. Aliás, o mesmo vale para o próprio banco de dados físico no Hasura — se ele for alterado, as documentações também devem ser atualizadas, e vice-versa;

Este documento aborda tópicos gerais, mas ele concentra mais informações sobre a documentação do modelo lógico, isso porque as especificações das outras documentações estão descritas em seus próprios arquivos, coisa que não é possível fazer com o arquivo do modelo lógico.

--- 
# SOBRE A MODELAGEM


A linguagem da modelagem é o idioma inglês;

O modelo foi desenvolvido no software BRModelo;

Todas as nomenclaturas utilizam a convenção snake case, que é a padrão para banco de dados;

O nome de todas as tabelas começa com tb_;

O nome de nenhuma tabela está no plural;

O modelo utiliza conceitos de cardinalidade mínima e máxima;

O nome das tabelas segue um padrão hierárquico, ou seja, se a tabela tiver alguma relação com a solicitação, o início do nome dela será tb_request_ e haverá alguma informação adicional na frente. O mesmo ocorre com as tabelas que se referem a tarefas e afins. Isso é uma forma de "agrupar" tabelas relacionadas pelo seu próprio nome;

Os nomes de atributos do tipo chave estrangeira aplicam a técnica trigramação;

Quando um atributo estiver vindo de outro schema, ele terá o prefixo schema_nomedoschema_nomedatabela em seu nome, de forma a indicar de qual schema e de qual tabela ele está vindo;

Chaves estrangeiras sempre são os últimos atributos da tabela;

Atributos que não possuem a notação (NULL) são NOT NULL, ou seja, de inserção obrigatória;

Atributos que possuem a notação (PRESET) tem seu valor inserido automaticamente durante o INSERT e não é necessário computar valor para eles. Esse valor é extraído do JWT do usuário;

Atributos que possuem a notação (DEFAULT) não precisam ter dados inseridos manualmente durante o INSERT. Apenas deixe que o sistema atribua o valor padrão, que pode ser variável ou estático;

Atributos que possuem a notação (PRESET DEFAULT algum_valor) são atributos que, por padrão, usarão o valor padrão presente no JWT do usuário, contudo caso esse usuário não possua um JWT, o valor DEFAULT será utilizado. Isso ocorre em atributos chave de usuário onde usuários titulares também possam ser registrados, pois eles não têm JWT, enquanto os outros usuários possuem;

Observação: não está sendo aplicada a trigramação para tabelas de outros schemas, como users, files e tenants. Exemplo: rs_users_to_fav.

SOBRE O BRMODELO
Abaixo, seguem algumas orientações sobre o BRModelo para facilitar a compreensão da modelagem:

O BRModelo representa chaves primárias com um ícone de chave preta. Além disso, elas sempre são o primeiro atributo de uma tabela;

O BRModelo representa chaves estrangeiras com um ícone de chave verde;

O BRModelo representa UNIQUE KEYs com um ícone azul da letra U;

Se você encontrar um ícone de chave estrangeira e um ícone de UNIQUE KEY no mesmo atributo, quer dizer que ele é tanto uma chave estrangeira quanto uma UNIQUE KEY.
