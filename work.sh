#! /bin/bash
 
 file_path="/tmp/stamp"
 backup_dir="/opt/backup/"
 file_prefix="file_"
 file_size="200M"
mkdir -p "$backup_dir"
iterations=12
for((i=0;i<iterations;i++)); do
    timestamp=$(date + %Y%m%d%H%M%S)
    file_name="/tmp/file_$timestamp.txt"
    touch "$file_name"
    echo "created file :$file_name"
    if [[ $(date +%M) == "00" ]]; then
    mv /tmp/file_* "$backup_dir/"
    echo "Files moved to $backup_dir"
    fi
    sleep 300
    done 