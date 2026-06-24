#!/usr/bin/env bash
# 复现 RTX 5090 双卡训练的启动脚本。
#   PYTHONUNBUFFERED=1                          让 print 日志实时输出(否则被缓冲看着像卡住)
#   PYTORCH_CUDA_ALLOC_CONF=expandable_segments 减少显存碎片, 防止 OOM
# 用法: ./run.sh           # 前台运行
#       ./run.sh 2>&1 | tee /tmp/bfm_train.log   # 同时落盘
set -euo pipefail
cd "$(dirname "$0")"

PYTHONUNBUFFERED=1 PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True \
  uv run python -m humanoidverse.train "$@"
