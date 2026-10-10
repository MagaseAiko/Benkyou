#!/bin/sh
# uso: sh run.sh n4
cd "$(dirname "$0")"
export PYTHONIOENCODING=utf-8
python build.py "$1" && python check_reading.py "$1" && ../venv/Scripts/python check_sql.py "C:/Users/aiko4/Documents/Github/Benkyou/supabase/seed/grammar" "$1"
