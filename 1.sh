    echo
    echo Creating one big yaml file, 1.yaml, with all existing .yamls
    echo so one kubectl apply can create them all
    echo
    echo First deleting existing 1.yaml by moving it to /tmp
    mv 1.yaml /tmp 2>&1
    echo

# Sorting by size to ensure the namespace is the first yaml object,
  # since kubectl is flakey about that when doing a create -f

for f in $(ls -1ASr *.yaml); do
    echo $f
    cat $f >>1.yaml
    echo >>1.yaml
    echo >>1.yaml
    echo "#################################################" >>1.yaml
    echo "################# NEW YAML OBJECT ###############" >>1.yaml
    echo "#################################################" >>1.yaml
    echo "---">>1.yaml
done
