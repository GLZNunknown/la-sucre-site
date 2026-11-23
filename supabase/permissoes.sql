-- Permissões das tabelas (projetos novos do Supabase não liberam por padrão).
-- A segurança de verdade continua nas regras (RLS) do schema.sql:
-- qualquer pessoa só LÊ; só quem está logado edita.
grant usage on schema public to anon, authenticated;
grant select on public.produtos, public.cestas, public.config to anon;
grant select, insert, update, delete on public.produtos, public.cestas, public.config to authenticated;
