create table if not exists app_state (
  id int primary key default 1,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz default now()
);

insert into app_state (id, data)
values (1, '{}'::jsonb)
on conflict (id) do nothing;

alter table app_state enable row level security;

create policy "public read/write demo" on app_state
  for all using (true) with check (true);
