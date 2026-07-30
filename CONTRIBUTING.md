# Contributing

Thanks for your interest in contributing to SkidLarpMaxxingLib.

Guidelines:

- Fork the repo and create a feature branch.
- Keep changes small and focused; open a PR describing the problem and your solution.
- Run `npm install` and `npm run build` before creating a PR. Ensure `dist/main.lua` builds.
- For documentation changes, update `README.md` and add examples under `tests/` where appropriate.

Code style:

- Follow the existing style in `src/` (Lua idioms used by Roblox/Luau).

Security & sensitive data:

- Do not commit secrets, API keys, or other sensitive data. Use repository secrets for CI where necessary.
