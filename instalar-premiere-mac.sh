#!/usr/bin/env bash
set -euo pipefail
[[ "$(uname -s)" == Darwin ]] || { echo 'Use o Mac onde o Premiere esta instalado.'; exit 1; }
CODEX_BIN="${1:-$(command -v codex || true)}"
[[ -n "$CODEX_BIN" ]] || { echo 'Agente: localize o executavel Codex e passe seu caminho como primeiro argumento.'; exit 1; }
STAGE="$(mktemp -d)"
NODE_BIN="$(command -v node || true)"
if [[ -z "$NODE_BIN" ]]; then
 if [[ "$(uname -m)" == arm64 ]]; then ARCH=arm64; HASH=bed7eea5325e1108f32ce5228ddd6a5f0f08a499ee42aa7442aea583702f6057; else ARCH=x64; HASH=1462cb3b3046b815cf8ea436d3da450ec1a9f11dac7e5a46b0ada5305d7e8097; fi
 curl --fail --location --retry 3 "https://nodejs.org/dist/v24.21.0/node-v24.21.0-darwin-$ARCH.tar.gz" -o "$STAGE/node.tar.gz"
 [[ "$(shasum -a 256 "$STAGE/node.tar.gz" | awk '{print $1}')" == "$HASH" ]] || exit 1
 tar -xzf "$STAGE/node.tar.gz" -C "$STAGE"
 NODE_BIN="$STAGE/node-v24.21.0-darwin-$ARCH/bin/node"
fi
curl --fail --location --retry 3 'https://raw.githubusercontent.com/CriativosdoFuturo/trombino-kit-edicao-ia/main/premiere-setup-1.3.1.zip' -o "$STAGE/setup.zip"
[[ "$(shasum -a 256 "$STAGE/setup.zip" | awk '{print $1}')" == "d6d48c2396c73d2b7c8dbe0cb60be115a636ed9f3dab49d9ace7caafb9b3dc37" ]] || { echo 'SHA256 divergente; nao executar.'; exit 1; }
mkdir "$STAGE/setup"; unzip -q "$STAGE/setup.zip" -d "$STAGE/setup"
"$NODE_BIN" "$STAGE/setup/install.mjs" --codex "$CODEX_BIN"
ROOT="$HOME/Library/Application Support/CriativosdoFuturo/PremiereMCP"
"$ROOT/runtime/node" "$ROOT/doctor.mjs"
"$ROOT/runtime/node" "$ROOT/connection.mjs" --connect
