-- Dr. Aqsa Tariq's Dental Clinic — Supabase backend schema
-- Run this in Supabase Dashboard → SQL Editor (or via `supabase db push`)

create table if not exists public.appointments (
  id bigint generated always as identity primary key,
  full_name text not null,
  phone text not null,
  preferred_date date,
  service text,
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

alter table public.appointments enable row level security;

-- Allow anyone (site visitors) to submit an appointment
create policy "Allow public appointment submissions"
  on public.appointments
  for insert
  to anon, authenticated
  with check (true);

-- Allow reading only your own appointment via service role/admin
create policy "Allow admin full access"
  on public.appointments
  for all
  to service_role
  using (true)
  with check (true);