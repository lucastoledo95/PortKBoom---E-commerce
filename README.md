# PortKBoom E-commerce / Portfólio Pessoal

Projeto full stack utilizando Angular SSR, Laravel API, Docker, Nginx e MySQL.

---

## Requisitos

- Docker Desktop instalado
- WSL2 habilitado

---

## Início Rápido

### 1. Clone o repositório

```bash
git clone https://github.com/lucastoledo95/PortKBoom---E-commerce
```

### 2. Suba o ambiente

```bash
docker-compose up
```

---

## Acessos

| Serviço | URL |
|---|---|
| Frontend | `https://localhost` |
| API | `https://api.localhost/api/status` |
| Banco de Dados | `127.0.0.1:3306` |

### Credenciais do banco

| Campo | Valor |
|---|---|
| Usuário | `root` |
| Senha | `root` |

---

## Estrutura do Projeto

```text
docker-compose.yml        # Orquestração dos containers
Dockerfile                # PHP 8.2 + pdo_mysql + gd
Dockerfile.nginx          # Nginx + SSL autoassinado
nginx.conf                # Configuração do proxy reverso

angular-front/            # Frontend Angular (SSR)
api.portkboom/            # Backend Laravel (API)
```

---

## Containers

| Serviço | Tecnologia | Porta | URL |
|---|---|---|---|
| angular | Node 20 + Angular | 4200 | `https://localhost` |
| laravel | PHP 8.2 FPM | 9000 | `https://api.localhost` |
| nginx | Nginx Alpine | 80 / 443 | Proxy reverso |
| mysql | MySQL 8.0 | 3306 | `127.0.0.1:3306` |

---

# Comandos Úteis

## Docker

```bash
docker-compose up              # Liga tudo com logs
docker-compose up -d           # Liga em segundo plano
docker-compose down            # Desliga tudo
docker-compose restart         # Reinicia containers
docker-compose logs -f         # Logs em tempo real
docker-compose up --build      # Rebuild das imagens
```

---

## Laravel

### Entrar no container

```bash
docker-compose exec laravel bash
```

### Comandos úteis

```bash
php artisan config:clear       # Limpa cache de configuração
php artisan cache:clear        # Limpa cache da aplicação
php artisan route:clear        # Limpa cache de rotas
php artisan view:clear         # Limpa cache de views

php artisan migrate            # Executa migrations
php artisan storage:link       # Cria link simbólico do storage
php artisan tinker             # Shell interativo
```

---

## Angular

### Entrar no container

```bash
docker-compose exec angular sh
```

### Hot Reload

O Angular detecta alterações automaticamente utilizando `--poll 2000`.

Basta salvar os arquivos no VS Code que o navegador será atualizado automaticamente.

---

## Banco de Dados

### Conexão com HeidiSQL ou outro cliente

| Campo | Valor |
|---|---|
| Hostname | `127.0.0.1` |
| Porta | `3306` |
| Usuário | `root` |
| Senha | `root` |
| Database | `api_portkboom` |

---

## Certificado SSL

O projeto utiliza certificado autoassinado gerado automaticamente durante o build do Nginx.

### Instalação no Windows

Isso evita avisos do navegador e problemas relacionados a cookies.

```bash
docker cp projeto_e-commerce-nginx-1:/etc/nginx/ssl/server.crt ssl/server.crt

certutil -delstore "Root" "localhost"

certutil -addstore -f "Root" ssl/server.crt
```

Após instalar o certificado, reinicie o navegador.

### Domínios cobertos

- `localhost`
- `api.localhost`

---

## URLs da API no Angular

Arquivo:

```text
angular-front/src/app/services/api-master.ts
```

Configuração:

```ts
apiUrl = 'https://api.localhost/api';
urlBase = 'https://api.localhost/';
```

---

## Variáveis de Ambiente (.env do Laravel)

Principais configurações utilizadas no Docker:

```env
APP_URL=https://api.localhost

DB_HOST=mysql
DB_USERNAME=laravel
DB_PASSWORD=laravel

SESSION_DOMAIN=.localhost
SANCTUM_STATEFUL_DOMAINS=localhost,api.localhost
```

> Importante: `DB_HOST` deve ser `mysql` (nome do container) e não `127.0.0.1`.
KEY_CRIPTOGRAFIA="QvvgI51pzrjIAV7DEI7vtYBDM9W38GjA" # KEY CRIPTOGRAFADA EM BASE64 PARA ENC.PHP -- exemplo
PROFILE_PHOTO_DEFAULT="logos/logo-profile.png" #  LOGO DA URL DEFAULT PROFILE
RECAPTCHA_SECRET_KEY=""

---

## Arquivo Hosts

Adicione a seguinte linha no arquivo:

```text
C:\Windows\System32\drivers\etc\hosts
```

```text
127.0.0.1 api.localhost
```

---

## Rebuild Completo

```bash
docker-compose down
docker-compose up --build
```