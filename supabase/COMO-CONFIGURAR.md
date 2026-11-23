# Como ligar o painel (Supabase) · La Sucre

Tempo: uns 10 minutos. Tudo no plano gratuito.

## 1. Criar o projeto
1. Entre em https://supabase.com e faça login (pode ser com o GitHub).
2. **New project** → nome `la-sucre`, escolha uma senha de banco (guarde), região **South America (São Paulo)**, plano **Free**.
3. Espere o projeto terminar de criar (1 a 2 minutos).

## 2. Criar as tabelas, a segurança e as fotos
1. No menu da esquerda: **SQL Editor** → **New query**.
2. Abra o arquivo `schema.sql` (nesta pasta), copie tudo, cole no editor e clique **Run**.
3. Deve aparecer "Success". Isso cria as tabelas, a pasta de fotos, as regras de segurança e já coloca os produtos atuais.

## 3. Criar o login do dono (Vinicius)
1. **Authentication** → **Users** → **Add user** → **Create new user**.
2. Coloque o e-mail dele e uma senha, e marque **Auto Confirm User**.
3. **IMPORTANTE:** vá em **Authentication** → **Sign In / Providers** (ou Settings) e **desligue "Allow new users to sign up"**.
   Sem isso, qualquer pessoa poderia criar uma conta e editar o cardápio.

## 4. Pegar a URL e a chave
1. **Project Settings** (engrenagem) → **API**.
2. Copie a **Project URL** (`https://xxxx.supabase.co`) e a chave **anon / public**.
   Essa chave é pública (pode ficar no site). **Nunca** use nem copie a `service_role`.
3. Passe essas duas para mim (ou cole você mesmo em `config.js`).

## 5. Entrar no painel
Abra `https://glznunknown.github.io/la-sucre-site/admin.html` e entre com o e-mail e a senha do passo 3.
