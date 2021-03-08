# Semana do Flutter | Clean Architecture

## #1 - Primeiro a Arquitetura

Repositório com proposta de arquitetura limpa para o Dart/Flutter:

[Clean Dart](https://www.youtube.com/redirect?event=video_description&redir_token=QUFFLUhqbWk5SmIzdUp6U0tHNFpraDlIYk1JUDBodEM4Z3xBQ3Jtc0tteU1xOTNoSjhtaTg0alhsV1JDM1ZJM2twUlltT0k1V1hqZzN4Z2dDY3JUWmExX19aRWQzRnlfR2RfTXJVbE1jQjhEVjVCUmRnSWpvcnVMaG12UGk5MVVHejVIOGx3WXVyQlg5MWhzaXFEeWhKaFJSbw&q=https%3A%2F%2Fgithub.com%2FFlutterando%2FClean-Dart)

### Modelos

- Modelo 1 (MVC)
  - UI 
  - ViewModel
  - Repository

- Modelo 2
  - UI 
  - ViewModel (Bloc, Store) 
  - Use cases (Regras de negócio) & Entity (ou Model)
  - Repository (Enviar para use cases)
  - Data source (acessar os dados externos)

  - Divisões
    - (Use cases + Entity) => DOMAIN => Testes unitários
    - (Repository) => (suporte ao domínio) => INFRA => Testes unitários

    - (Use cases + Entity) + (Repository) => CORE

- Modelo 3

  - PRESENTER
    - Ui
    - Output
  
  - DOMAIN
    - Implementation
      - Entities
      - Use cases
    - Interfaces
      - Repositories
      - Services
  
  - INFRA
    - Implementations
      - Repositories
      - Services
    - Interfaces
      - Data sources
      - Drivers

  - EXTERNAL
    - Implementations
      - Data sources
      - Drivers
