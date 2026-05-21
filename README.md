# PortKBoom E-commerce / Portfólio projetopessoal

## Requisitos

- Docker Desktop instalado
- WSL2 habilitado

## Inicio Rapido

# 1. Clone o repositorio
git clone https://github.com/lucastoledo95/PortKBoom---E-commerce

# 2. Rode o ambiente
docker-compose up

Acessos:
- Frontend: https://localhost
- API: https://api.localhost/api/status
- Banco: 127.0.0.1:3306 (usuario: root / senha: root)

## Estrutura do Projeto

docker-compose.yml        # Orquestracao dos containers
Dockerfile                # PHP 8.2 + pdo_mysql + gd
Dockerfile.nginx          # Nginx + SSL autoassinado
nginx.conf                # Configuracao do proxy reverso
angular-front/            # Frontend Angular (SSR)
api.portkboom/            # Backend Laravel (API)

## Containers

Servico   Tecnologia        Porta   URL
angular   Node 20 + Angular 4200    https://localhost
laravel   PHP 8.2 FPM       9000    https://api.localhost
nginx     Nginx Alpine      80/443  Proxy reverso
mysql     MySQL 8.0         3306    127.0.0.1:3306

## Comandos Uteis

### Docker

docker-compose up              # Liga tudo com logs
docker-compose up -d           # Liga em segundo plano
docker-compose down            # Desliga tudo
docker-compose restart         # Reinicia todos os containers
docker-compose logs -f         # Acompanha logs em tempo real
docker-compose up --build      # Rebuilda imagens (Dockerfile)

### Laravel (dentro do container)

# Entrar no container
docker-compose exec laravel bash

# Comandos mais usados
php artisan config:clear       # Limpa cache de configuracao
php artisan cache:clear        # Limpa cache da aplicacao
php artisan route:clear        # Limpa cache de rotas
php artisan view:clear         # Limpa cache de views
php artisan migrate            # Roda migrations
php artisan storage:link       # Cria link simbolico do storage
php artisan tinker             # Shell interativo

### Angular

# Entrar no container
docker-compose exec angular sh

# Hot reload
# O Angular detecta mudancas automaticamente gracas ao --poll 2000
# Basta salvar o arquivo no VS Code e o navegador atualiza sozinho

## Banco de Dados

### Conectar com HeidiSQL ou outro cliente

Campo      Valor
Hostname   127.0.0.1
Porta      3306
Usuario    root
Senha      root
Database   api_portkboom


## Certificado SSL

O projeto usa certificado autoassinado gerado automaticamente no build do nginx.

Para instalar no Windows (evitar avisos do navegador e problemas de cookies):

docker cp projeto_e-commerce-nginx-1:/etc/nginx/ssl/server.crt ssl/server.crt
certutil -delstore "Root" "localhost"
certutil -addstore -f "Root" ssl/server.crt

Apos instalar, reinicie o navegador.

O certificado cobre:
- localhost
- api.localhost

## URLs da API (Angular)

Configuradas em angular-front/src/app/services/api-master.ts:

apiUrl = 'https://api.localhost/api';
urlBase = 'https://api.localhost/';

## Variaveis de Ambiente (.env do Laravel)

As configuracoes importantes para o Docker:

APP_URL=https://api.localhost
DB_HOST=mysql
DB_USERNAME=laravel
DB_PASSWORD=laravel
SESSION_DOMAIN=.localhost
SANCTUM_STATEFUL_DOMAINS=localhost,api.localhost

Importante: DB_HOST deve ser mysql (nome do container), nao 127.0.0.1.

## Arquivo Hosts

Adicione em C:\Windows\System32\drivers\etc\hosts:

127.0.0.1 api.localhost


### Rebuild completo

docker-compose down
docker-compose up --build
