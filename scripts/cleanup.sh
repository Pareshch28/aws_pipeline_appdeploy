mkdir -p scripts
echo -e "#!/bin/bash\nrm -rf /var/www/html/index.html" > scripts/cleanup.sh
chmod +x scripts/cleanup.sh

rm -f /var/www/html/index.html
