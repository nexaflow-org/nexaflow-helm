#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT_DIR="${ROOT_DIR}/.tmp/kyverno-rendered"

rm -rf "${OUT_DIR}"
mkdir -p "${OUT_DIR}"

render_chart() {
  local release_name="$1"
  local chart_path="$2"
  shift 2

  local output_file="${OUT_DIR}/${release_name}.yaml"
  local -a args=()

  for values_file in "$@"; do
    args+=("-f" "${values_file}")
  done

  helm template "${release_name}" "${ROOT_DIR}/${chart_path}" "${args[@]}" > "${output_file}"
  echo "Rendered ${release_name} -> ${output_file}"
}

for chart_dir in "${ROOT_DIR}"/apps/test/*; do
  [[ -f "${chart_dir}/Chart.yaml" ]] || continue

  chart_name="$(basename "${chart_dir}")"
  base_values="${chart_dir}/values.yaml"

  if [[ -f "${chart_dir}/values-test.yaml" ]]; then
    render_chart "${chart_name}-test" "${chart_dir#${ROOT_DIR}/}" "${base_values}" "${chart_dir}/values-test.yaml"
  fi

  if [[ -f "${chart_dir}/values-prod.yaml" ]]; then
    render_chart "${chart_name}-prod" "${chart_dir#${ROOT_DIR}/}" "${base_values}" "${chart_dir}/values-prod.yaml"
  fi
done

render_chart "finagent-mysql" "infra/mysql" "${ROOT_DIR}/infra/mysql/values.yaml"

echo "All manifests rendered into ${OUT_DIR}"
