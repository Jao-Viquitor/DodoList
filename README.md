# dodo

Dodo List: Porque até os dodos eram mais organizados que você! 🦤

Essa é a sua chance de provar que é mais eficiente que um pássaro extinto.
Com o Dodo List, você nunca mais vai esquecer suas tarefas importantes, como finalizar aquele relatório ou alimentar o peixe imaginário.
Tudo com um design elegante e divertido, que transforma até a procrastinação em algo estiloso. 📝✨

## Getting Started

# Gerenciador de Tarefas

Este projeto é um aplicativo de gerenciamento de tarefas desenvolvido em Flutter.
Ele permite que os usuários gerenciem suas tarefas de forma offline, utilizando o Hive para persistência local de dados.
O projeto segue a arquitetura MVVM para uma organização clara e sustentável.

## 📋 Funcionalidades

- **Listagem de Tarefas**: Exibe todas as tarefas com suporte a scroll infinito.
- **Tarefas Finalizadas**: Separa tarefas concluídas em uma visualização dedicada.
- **Criação de Tarefas**: Adiciona tarefas com título e descrição.
- **Gerenciamento de Tarefas**: Inclui pesquisa por título, exclusão individual e limpeza total de tarefas.

## 🛠️ Tecnologias Utilizadas

- **Flutter**: Versão 3.27.1
- **Dart**: Versão compatível com o Flutter 3.27.1
- **Hive**: Banco de dados local para persistência.
- **Arquitetura MVVM**: Para separar responsabilidades de forma clara.
- **Provider**: Para gerenciamento de estado.

## 🚀 Como Executar o Projeto

### Pré-requisitos

1. **Instale o Flutter**:
   Certifique-se de que o Flutter está instalado e configurado. Consulte o guia oficial de instalação: [Flutter Install](https://flutter.dev/docs/get-started/install).

2. **Verifique a versão do Java**:
   Pode ser necessário configurar o Flutter para usar a versão 17 do Java, nesse caso, instale o SDK correto e execute o seguinte comando:
   ```bash
   flutter config --jdk-dir="C:\Program Files\Java\jdk-17"
   ```

3. **Instale as dependências**:
   Execute o comando abaixo no terminal:
   ```bash
   flutter pub get
   ```

### Executando o Projeto

1. Inicie um emulador ou conecte um dispositivo físico.
2. Execute o aplicativo com:
   ```bash
   flutter run
   ```

## 🗂 Estrutura do Projeto

A estrutura do projeto foi organizada para refletir os princípios da arquitetura MVVM:

```plaintext
lib/
├── main.dart                   # Ponto de entrada da aplicação
├── core/                       # Temas e configurações globais
│   ├── theme/                  # Definições de tema e estilos
├── models/                     # Camada de dados
│   ├── models/                 # Definição de modelos de dados
│   ├── repositories/           # Operações no banco de dados Hive
├── presentation/               # Camada de apresentação
    ├── viewmodels/             # Conexão entre serviços e UI
    ├── view/                   # Telas do aplicativo
    └── widgets/                # Componentes reutilizáveis
        ├── appbar/             # Componentes para barra de aplicativos
        ├── bottomSheets/       # Folhas de ação inferiores
        ├── navbar/             # Navegação inferior
        └── task/               # Widgets relacionados às tarefas
```

### Principais Diretórios

- **core/**: Contém temas e configurações globais, como estilos de cores e fontes.
- **models/**: Define os modelos de dados e gerencia a persistência com repositórios.
- **presentation/**:
    - **viewmodels/**: Contém a lógica que conecta a interface com os serviços.
    - **view/**: Telas principais do aplicativo.
    - **widgets/**: Componentes reutilizáveis organizados em subpastas, como `appbar/`, `bottomSheets/`, `navbar/` e `task/`.

## 🐞 Dependências Utilizadas

- **Hive**: Persistência de dados local.
- **provider**: Gerenciamento de estado.
- **flutter_test**: Para testes automatizados.

## ✍️ Autor

Desenvolvido por João Victor Santos.

## 📫 Contato

Entre em contato para dúvidas ou suporte: victorsantos.ft18@gmail.com.

## 📃 Licença

Este projeto está sob a licença MIT. Consulte o arquivo `LICENSE` para mais detalhes.