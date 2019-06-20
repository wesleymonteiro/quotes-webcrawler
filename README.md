# Quotes Web Crawler
Projeto criado para crawlear o site http://quotes.toscrape.com/ e mostrar as frases que contém a tag passada como parâmetro.

## Ferramentas
- Rails 5.1.7
- Ruby 2.5.3
- MongoDB
- Bundler
- RubyGems

## Como usar
- Instale as ferramentas necessárias
- Clone o projeto
- Na pasta clonada, rode o comando `bundle install` para instalar todas as gem usadas no projeto.
- Use o comando `rails s` para subir o servidor local
- Utilize alguma ferramenta como o Postman para ter acesso as APIs do projeto

# API

Usuários
--
 POST no endpoint `api/v1/users/sign_in` para criar seu usuário, ou GET no endpoint `api/v1/users/login` para receber seus dados, passando os seguintes parâmetros:
```json
{
  "email": "example@example.com",
  "password": "123456"
}
```
Após criar ou autenticar o usuário com sucesso, você receberá a resposta com token de acesso do usuário, da seguinte forma:
```json
{
  "user": {
    "authentication_token": "UjfXjDUBrfWYkR27G7B3",
    "email": "example@example.com"
  }
}
```


Frases
--
GET no endpoint `api/v1/quotes/search/:tag` para buscar as frases. Substitue `:tag` pela tag que deseja buscar, como por exemplo *life* e *smile*. 

No Header da requisição é necessário passar o "email" e o token do usuário para autenticação: 
```json
X-User-Email: "example@example.com",
X-User-Token: "123456"
```
Essa requisição irá retornar as frases no seguinte formato:

```json
{
    "quotes": [
        {
            "quote": "“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”",
            "author": "Albert Einstein",
            "author_about": "http://quotes.toscrape.com/author/Albert-Einstein",
            "tags": [
                "inspirational",
                "life",
                "live",
                "miracle",
                "miracles"
            ]
        }
    ]
}
```