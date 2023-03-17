for i in `ll | grep -E 'jdk|jre' | awk '{print $9}'`;
do echo ==========================$i; cd $i ; bash build-image.sh || break; done