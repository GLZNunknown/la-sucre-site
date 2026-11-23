-- La Sucre · banco de dados (Supabase)
-- Cole este arquivo inteiro em: Supabase > SQL Editor > New query > Run.

create table if not exists public.produtos (
  id        text primary key,
  cat       text not null check (cat in ('doces','natal')),
  nome      text not null,
  curto     text,
  preco     numeric(10,2) not null check (preco >= 0),
  unidade   text default '',
  descricao text default '',
  sabores   text[] not null default '{}',
  img       text default '',
  ordem     int  not null default 0,
  ativo     boolean not null default true
);

create table if not exists public.cestas (
  id     text primary key,
  nome   text not null,
  preco  numeric(10,2) not null check (preco >= 0),
  itens  jsonb not null default '[]',
  ordem  int not null default 0,
  ativo  boolean not null default true
);

create table if not exists public.config (
  id         int primary key default 1 check (id = 1),
  whatsapp   text not null,
  embalagem  jsonb not null default '{"P":0,"M":0,"G":0,"personalizada":0}'
);

-- Segurança: qualquer pessoa LÊ o cardápio; só quem está logado EDITA.
alter table public.produtos enable row level security;
alter table public.cestas   enable row level security;
alter table public.config   enable row level security;

drop policy if exists "ler produtos" on public.produtos;
drop policy if exists "editar produtos" on public.produtos;
drop policy if exists "ler cestas" on public.cestas;
drop policy if exists "editar cestas" on public.cestas;
drop policy if exists "ler config" on public.config;
drop policy if exists "editar config" on public.config;

create policy "ler produtos"    on public.produtos for select using (true);
create policy "editar produtos" on public.produtos for all to authenticated using (true) with check (true);
create policy "ler cestas"      on public.cestas   for select using (true);
create policy "editar cestas"   on public.cestas   for all to authenticated using (true) with check (true);
create policy "ler config"      on public.config   for select using (true);
create policy "editar config"   on public.config   for all to authenticated using (true) with check (true);

-- Fotos: pasta pública "fotos" (qualquer um vê, só logado envia/apaga).
insert into storage.buckets (id, name, public) values ('fotos','fotos',true) on conflict (id) do nothing;
drop policy if exists "ver fotos" on storage.objects;
drop policy if exists "enviar fotos" on storage.objects;
drop policy if exists "trocar fotos" on storage.objects;
drop policy if exists "apagar fotos" on storage.objects;
create policy "ver fotos"    on storage.objects for select using (bucket_id = 'fotos');
create policy "enviar fotos" on storage.objects for insert to authenticated with check (bucket_id = 'fotos');
create policy "trocar fotos" on storage.objects for update to authenticated using (bucket_id = 'fotos');
create policy "apagar fotos" on storage.objects for delete to authenticated using (bucket_id = 'fotos');

-- Dados iniciais (os mesmos que já estão no site).
insert into public.config (id, whatsapp, embalagem) values (1, '554998039692', '{"P":0,"M":0,"G":0,"personalizada":0}') on conflict (id) do nothing;

insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('trufa','doces','Trufas','Trufa',4.5,'a unidade','Trufas artesanais com recheios de sabores variados.',array['Brigadeiro','Beijinho','Maracujá','Morango','Limão']::text[],'img/bombom-morango.jpg',1) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('barra','doces','Barra de chocolate recheada','Barra recheada',20,'a barra','Barra de chocolate artesanal recheada, embalada para presente.',array['Brigadeiro','Beijinho','Maracujá','Morango','Limão']::text[],'img/barra.jpg',2) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('minitorta','doces','Mini tortas (250 g)','Mini torta',16,'a unidade','Mini torta individual de 250 g.',array['Limão','Maracujá','Morango']::text[],'',3) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('ddl','doces','Doce de leite gourmet','Doce de leite gourmet',20,'o pote','Doce de leite gourmet em camadas, servido no potinho.',array['Brigadeiro','Maracujá','Morango','Bombom']::text[],'img/doce-de-leite.jpg',4) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('bombom-travessa','natal','Bombom de uva e morango na travessa','Bombom na travessa',90,'a travessa','Travessa de bombons de uva ou morango.',array['Uva','Morango']::text[],'',5) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('torta-travessa','natal','Tortas na travessa','Torta na travessa',75,'a travessa','Torta na travessa para compartilhar.',array['Limão','Maracujá','Morango']::text[],'',6) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('mousse','natal','Mousses na travessa','Mousse na travessa',60,'a travessa','Mousse na travessa, com casca de chocolate por cima.',array['Morango','Limão','Maracujá']::text[],'',7) on conflict (id) do nothing;
insert into public.produtos (id,cat,nome,curto,preco,unidade,descricao,sabores,img,ordem) values ('merengue','natal','Merengue de morango na travessa','Merengue de morango',100,'a travessa','Merengue de morango na travessa.',array[]::text[],'',8) on conflict (id) do nothing;

insert into public.cestas (id,nome,preco,itens,ordem) values ('P','Cesta P',45,'[{"prod":"trufa","qtd":2},{"prod":"minitorta","qtd":1},{"prod":"ddl","qtd":1}]'::jsonb,1) on conflict (id) do nothing;
insert into public.cestas (id,nome,preco,itens,ordem) values ('M','Cesta M',75,'[{"prod":"trufa","qtd":4},{"prod":"barra","qtd":1},{"prod":"ddl","qtd":1}]'::jsonb,2) on conflict (id) do nothing;
insert into public.cestas (id,nome,preco,itens,ordem) values ('G','Cesta G',125,'[{"prod":"trufa","qtd":6},{"prod":"barra","qtd":1},{"prod":"ddl","qtd":1},{"prod":"mousse","qtd":1}]'::jsonb,3) on conflict (id) do nothing;
