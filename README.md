# Semana do Flutter | Clean Architecture

## #1 - Primeiro a Arquitetura

Repositório com proposta de arquitetura limpa para o Dart/Flutter: [Clean Dart](https://github.com/Flutterando/Clean-Dart)

## Clean Dart

![alt text](./img/img1.png "Title")
 
## Presenter

- A Camada Presenter fica responsável por declarar as entradas, saídas e interações da aplicação.
- Usando o Flutter como exemplo, hospedaremos os Widgets, Pages e também alguma Gerência de Estado.

## Domain

- A camada de Domain hospedará as regras de negócio corporativa (Entity) e da aplicação (Usecase).

- Nossas entidades devem ser objetos simples podendo conter regras de validação dos seus dados por meio de funções ou ValueObjects. **A Entidade não deve usar nenhum Objeto das outras camadas**.

- Os casos de uso devem executar a lógica necessária para resolver o problema. Se o caso de uso precisar de algum acesso externo, então esse acesso deve ser feito por meio de contratos de interfaces, que serão implementados em uma camada de mais baixo nível.

- A camada Domain deve ser responsável apenas pela execução da lógica de negócio, não deve haver implementações de outros objetos como: **Repositories** ou **Services** dentro do Domain.

- Tomando um Repository como exemplo, teremos que ter apenas o contrato de interfaces (Abstrações) e a responsabilidade de implementação desse objeto deverá ser repassado a outra camada mais baixa.

## Infrastructure (Infra)

- Está camada dá suporte a camada Domain implementando suas interfaces. Para isso, essa camada se propõem a adaptar os dados externos para que possa cumprir os contratos do domínio.

- Muito provavelmente nessa camada iremos implementar alguma interface de um **Repository** ou **Services** que pode ou não depender de dados externos como uma API ou acesso a algum ***Hardware*** como por exemplo ***Bluetooth***.

- Para que o **Repository** possa processar e adaptar os dados externos devemos criar contratos para esses serviços visando passar a responsabilidade de implementação para a camada mais baixa da nossa arquitetura.

- Como sugestão, iremos criar objetos de **DataSource** quando quisermos acessar um dado externo, uma BaaS como ***Firebase*** ou um Cache Local usando ***SQLite*** por exemplo. 

- Outra sugestão seria criar objetos denominados **Drivers** para interfacear a comunicação com algum **Hardware** do dispositivo.

- Os acessos externos como* **Data sources** e **Drivers** devem ser implementados por outra camada, ficando apenas os contratos de interface nesta camada de **Infra**.