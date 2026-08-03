#!/usr/bin/env bash
set -euo pipefail

target="${1:-}"
root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
temporary_root=""

skills=(shoe-analyzer product-matcher price-hunter deal-evaluator shoe-recommender review-summarizer weekly-market-report)

declare -A destinations=(
  [codex]="$HOME/.codex/skills"
  [claude]="$HOME/.claude/skills"
  [gemini]="$HOME/.gemini/skills"
  [copilot]="$HOME/.copilot/skills"
  [agents]="$HOME/.agents/skills"
)

if [[ -z "$target" ]]; then
  echo "Kullanım: ./install.sh codex|claude|gemini|copilot|agents|all"
  exit 1
fi

if [[ ! -f "$root_dir/shoe-analyzer/SKILL.md" ]]; then
  package_path="$root_dir/Ayakkabi-Avcisi-Skills-v1.0.0.zip"
  if [[ ! -f "$package_path" ]]; then
    echo "Skill paketi bulunamadı: $package_path"
    exit 1
  fi
  temporary_root="$(mktemp -d)"
  trap 'rm -rf "$temporary_root"' EXIT
  unzip -q "$package_path" -d "$temporary_root"
  root_dir="$temporary_root"
fi

if [[ "$target" == "all" ]]; then
  targets=(codex claude gemini copilot agents)
elif [[ -n "${destinations[$target]:-}" ]]; then
  targets=("$target")
else
  echo "Geçersiz hedef: $target"
  exit 1
fi

for selected_target in "${targets[@]}"; do
  destination="${destinations[$selected_target]}"
  mkdir -p "$destination"
  for skill in "${skills[@]}"; do
    test -f "$root_dir/$skill/SKILL.md"
    cp -R "$root_dir/$skill" "$destination/"
  done
  echo "Kuruldu: $selected_target -> $destination"
done

echo "Kurulum tamamlandı. Yapay zekâ uygulamasını yeniden başlatın veya skill listesini yenileyin."
