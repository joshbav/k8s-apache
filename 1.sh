    echo
    echo Creating one big yaml file, 1.yaml, with all existing .yamls
    echo so one kubectl apply can create them all
    echo
    echo First deleting existing 1.yaml by moving it to /tmp
    mv 1.yaml /tmp >/dev/null 2>&1
    echo

# Going to use arrays, so enable nullglob in case there are no matching files
shopt -s nullglob

### Do namespaces first

ns=(ns_*.yaml)

for ((i=0; i<${#ns[@]}; i++)); do
    echo "${ns[$i]}"
    cat ${ns[$i]} >>1.yaml
    echo >>1.yaml
    echo >>1.yaml
    echo "#################################################" >>1.yaml
    echo "################# NEW YAML OBJECT ###############" >>1.yaml
    echo "#################################################" >>1.yaml
    echo "---">>1.yaml
done

### Services  must be second, since you must create them before the deployment

svc=(svc_*.yaml)

for ((i=0; i<${#svc[@]}; i++)); do
    echo "${svc[$i]}"
    cat ${svc[$i]} >>1.yaml
    echo >>1.yaml
    echo >>1.yaml
    echo "#################################################" >>1.yaml
    echo "################# NEW YAML OBJECT ###############" >>1.yaml
    echo "#################################################" >>1.yaml
    echo "---">>1.yaml
done

### Now everything else

files=(*.yaml)

for ((i=0; i<${#files[@]}; i++)); do
    # Skip namespaces
    [[ ${files[$i]} = ns_* ]] && continue

    # Skip services
    [[ ${files[$i]} = svc_* ]] && continue

    # Skip 1.yaml that was just created
    [[ ${files[$i]} = 1.yaml ]] && continue

    echo "${files[$i]}"
    cat ${files[$i]} >>1.yaml
    echo >>1.yaml
    echo >>1.yaml
    echo "#################################################" >>1.yaml
    echo "################# NEW YAML OBJECT ###############" >>1.yaml
    echo "#################################################" >>1.yaml
    echo "---">>1.yaml
done
