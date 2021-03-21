# Aula 10

## Sobre Design Pattern


## Pastas

- Modules == Features (Clean Architecture)


## Obs:

```dart 
  final controller = HomeController(HomeRepositoryImpl());
```
Essa injeção na view é um problema.
  - Dificulta os testes
  - Violação de camada? assuntos diferentes...