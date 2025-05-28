# Deploying Ruby/Sinatra App on Fly.io – Cheat Sheet

## 1. Ten‑second checklist before `fly deploy`

| ✔︎ | What to verify | Why it matters | Typical line / command |
|---|---|---|---|
| ☐ | **`fly.toml → [processes]`** matches your start command | Fly runs *exactly* this, not what’s in the Dockerfile `CMD` | `web = "bundle exec puma -C config/puma.rb"` |
| ☐ | **Port** in app (Puma) & Fly match | Mismatch → “host not permitted” / 502 | `internal_port = 8080` (fly.toml) & `port ENV.fetch('PORT', 8080)` (puma.rb) |
| ☐ | **Allowed hosts / CORS** configured | Avoid “Host not permitted” in browser | `set :bind, '0.0.0.0'` (+ protection tweaks) |
| ☐ | **Secrets & ENV** present | Missing keys = boot loop | `fly secrets set DATABASE_URL=...` |
| ☐ | **Machines healthy** | Crashing VM blocks deploy | `fly machines list` / `fly machine destroy <id>` |
| ☐ | **Image size sane (< 500 MB)** | Faster deploy & rollback | `docker images | grep book-viewer` |
| ☐ | **Rebuild cache when Ruby bumps** | Prevent version drift | `fly deploy --build-arg RUBY_VERSION=3.2.2` |

---

## 2. File highlights you’ll care about next time

### `Dockerfile`
```dockerfile
ARG RUBY_VERSION=3.2.2
FROM ruby:$RUBY_VERSION-slim as base

WORKDIR /app
RUN gem update --system --no-document && gem install -N bundler

FROM base as build
RUN apt-get update -qq && apt-get install --no-install-recommends -y build-essential
COPY Gemfile* .
RUN bundle install

FROM base
RUN useradd ruby --home /app --shell /bin/bash
USER ruby:ruby
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build --chown=ruby:ruby /app /app
COPY --chown=ruby:ruby . .

EXPOSE 8080
CMD ["bundle","exec","rackup","--host","0.0.0.0","--port","8080"]
```

### `config/puma.rb`
```ruby
port ENV.fetch('PORT', 8080)
threads 5, 5
```

### `fly.toml` snippet
```toml
app = "book-viewer-holy-frost-5259"
primary_region = "yyz"

[processes]
web = "bundle exec puma -C config/puma.rb"

[http_service]
  internal_port = 8080
  force_https   = true
  auto_start_machines = true
  auto_stop_machines  = "stop"
```

---

## 3. Common Fly.io commands

| Task | Command |
|------|---------|
| Launch new app | `fly launch` |
| Set secrets | `fly secrets set KEY=value` |
| Deploy (remote builder) | `fly deploy --remote-only` |
| View logs | `fly logs -a <app>` |
| Tail single machine | `fly logs --machine <id>` |
| SSH into VM | `fly ssh console -a <app>` |
| List / manage Machines | `fly machines list`, `fly machine restart <id>` |
| Rollback release | `fly releases list` → `fly deploy --image <sha>` |

---

## 4. Gotchas we hit

1. **Port collision (`Errno::EADDRINUSE`)** – only one process can bind 8080.  
2. **Literal `$PORT` in command** – use `ENV.fetch('PORT', 8080)` or hard‑code `8080`.  
3. **Host not permitted** – bind `0.0.0.0`, tweak Sinatra protection.  
4. **Restart loop (max 10)** – fix logs, then `fly machine start`.

---

## 5. One‑liner deploy recipe

```bash
export RUBY_VERSION=3.2.2
fly secrets set SESSION_SECRET=$(openssl rand -hex 32)
fly deploy --remote-only --build-arg RUBY_VERSION=$RUBY_VERSION
```

Happy flying 🛫
