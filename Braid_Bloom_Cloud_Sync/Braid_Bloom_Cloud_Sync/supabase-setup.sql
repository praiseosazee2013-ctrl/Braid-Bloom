-- Braid & Bloom cloud backup table.
-- Run this in Supabase Dashboard > SQL Editor > New query.
-- Row Level Security ensures each signed-in user can access only their own row.

create table if not exists public.braid_bloom_backups (
  user_id uuid primary key references auth.users(id) on delete cascade,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.braid_bloom_backups enable row level security;

drop policy if exists "Users can read their own Braid Bloom backup" on public.braid_bloom_backups;
create policy "Users can read their own Braid Bloom backup"
on public.braid_bloom_backups for select
to authenticated
using ((select auth.uid()) = user_id);

drop policy if exists "Users can insert their own Braid Bloom backup" on public.braid_bloom_backups;
create policy "Users can insert their own Braid Bloom backup"
on public.braid_bloom_backups for insert
to authenticated
with check ((select auth.uid()) = user_id);

drop policy if exists "Users can update their own Braid Bloom backup" on public.braid_bloom_backups;
create policy "Users can update their own Braid Bloom backup"
on public.braid_bloom_backups for update
to authenticated
using ((select auth.uid()) = user_id)
with check ((select auth.uid()) = user_id);

grant select, insert, update on public.braid_bloom_backups to authenticated;
