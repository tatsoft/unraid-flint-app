# unraid-flint-app

Unraid Community Applications template for **[Flint](https://github.com/lcy362/flint)** —
a local-first personal AI skills asset manager.

> Flint centralizes the skill directories used by your AI agents. Collect, tag,
> deduplicate and distribute `SKILL.md` skills from one local web UI. Skills stay
> plain files on your own disk: no cloud, no account, no telemetry.

## Install

1. In Unraid, open **Apps** and search for **Flint**, or add this repository as a
   Docker Repository and use the template directly.
2. Set the **Config** path (default `/mnt/user/appdata/flint`) and the **WebUI** port
   (default `8787`).
3. **Apply**. On first start the container installs `flint-skills-hub` from npm into
   the config path and serves the web UI.
4. Open the WebUI from the Docker tab, or browse `http://<server-ip>:8787`.

## What you get

| Container path | Host default | Purpose |
|---|---|---|
| `/config` | `/mnt/user/appdata/flint` | `config.json`, logs, npm install |

First start needs internet access for the npm install; later starts work offline and
are fast because everything persists in the appdata path.

## Usage

- **Library** — every skill from registered repositories, searchable, with previews.
- **Repositories** — register your own vault or third-party (read-only) sources.
- **Agents** — one card per real agent skills directory; deploy as symlinks or copies.
- **Presets** — bundle skills + tag matches, apply to an agent in one click.
- **Health** — sync / duplicates / broken links / config / repositories / projects.

## Requirements

- Unraid 7.0 or newer
- Docker enabled
- Docker enabled

## Support

Template issues: open an issue in this repository.

Application issues: https://github.com/lcy362/flint/issues

Logs: `docker logs flint`

## License

MIT — see [LICENSE](LICENSE). Flint itself is MIT licensed by its author.
