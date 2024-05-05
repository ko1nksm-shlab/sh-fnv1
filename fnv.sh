fnv1() {
  od -An -to1 -v | {
    FNV_OFFSET_BASIS_32=2166136261 FNV_PRIME_32=16777619
    [ $((010)) -eq 8 ] && OCT="0" || OCT="8#"
    sum=$FNV_OFFSET_BASIS_32
    while IFS= read -r line; do
      for oct in $line; do
        sum=$(( ( ((((sum >> 16) * FNV_PRIME_32) & 65535) << 16)
                + ((sum & 65535) * FNV_PRIME_32) ) & 4294967295 ))
        sum=$((sum ^ ${OCT}$oct))
      done
    done
    if [ $sum -lt 0 ]; then
      printf "%04x%04x\n" $(( (sum >> 16) & 65535 )) $(( sum & 65535 ))
    else
      printf "%08x\n" "$sum"
    fi
  }
}

fnv1_str() {
  printf '%s\0' "$@" | od -An -to1 -v | {
    FNV_OFFSET_BASIS_32=2166136261 FNV_PRIME_32=16777619
    [ $((010)) -eq 8 ] && OCT="0" || OCT="8#"
    sum=$FNV_OFFSET_BASIS_32
    while IFS= read -r line; do
      for oct in $line; do
        if [ "$oct" != 000 ]; then
          sum=$(( ( ((((sum >> 16) * FNV_PRIME_32) & 65535) << 16)
                  + ((sum & 65535) * FNV_PRIME_32) ) & 4294967295 ))
          sum=$((sum ^ ${OCT}$oct))
          continue
        fi
        if [ $sum -lt 0 ]; then
          printf "%04x%04x\n" $(( (sum >> 16) & 65535 )) $(( sum & 65535 ))
        else
          printf "%08x\n" "$sum"
        fi
        sum=$FNV_OFFSET_BASIS_32
      done
    done
  }
}

fnv1a() {
  od -An -to1 -v | {
    FNV_OFFSET_BASIS_32=2166136261 FNV_PRIME_32=16777619
    [ $((010)) -eq 8 ] && OCT="0" || OCT="8#"
    sum=$FNV_OFFSET_BASIS_32
    while IFS= read -r line; do
      for oct in $line; do
        sum=$((sum ^ ${OCT}$oct))
        sum=$(( ( ((((sum >> 16) * FNV_PRIME_32) & 65535) << 16)
                + ((sum & 65535) * FNV_PRIME_32) ) & 4294967295 ))
      done
    done
    if [ $sum -lt 0 ]; then
      printf "%04x%04x\n" $(( (sum >> 16) & 65535 )) $(( sum & 65535 ))
    else
      printf "%08x\n" "$sum"
    fi
  }
}

fnv1a_str() {
  printf '%s\0' "$@" | od -An -to1 -v | {
    FNV_OFFSET_BASIS_32=2166136261 FNV_PRIME_32=16777619
    [ $((010)) -eq 8 ] && OCT="0" || OCT="8#"
    sum=$FNV_OFFSET_BASIS_32
    while IFS= read -r line; do
      for oct in $line; do
        if [ "$oct" != 000 ]; then
          sum=$((sum ^ ${OCT}$oct))
          sum=$(( ( ((((sum >> 16) * FNV_PRIME_32) & 65535) << 16)
                  + ((sum & 65535) * FNV_PRIME_32) ) & 4294967295 ))
          continue
        fi
        if [ $sum -lt 0 ]; then
          printf "%04x%04x\n" $(( (sum >> 16) & 65535 )) $(( sum & 65535 ))
        else
          printf "%08x\n" "$sum"
        fi
        sum=$FNV_OFFSET_BASIS_32
      done
    done
  }
}

