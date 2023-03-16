#!/bin/bash
yum update -y
yum install httpd -y

# Install PHP
yum install php php-mysql -y

# get RDS endpoint
rds_endpoint=$(terraform output rds_endpoint)

# get RDS username
rds_username=$(terraform output rds_username)

# get RDS password
rds_password=$(terraform output rds_password)

# get RDS database name
rds_database=$(terraform output rds_database)


# create config.php file
cat << EOF > /var/www/html/config.php
<?php
\$db_endpoint = "$rds_endpoint";
\$db_username = "$rds_username";
\$db_password = "$rds_password";
\rds_database = "$rds_database";
?>
EOF

# Set permissions on config.php
chmod 600 /var/www/html/config.php
chown apache:apache /var/www/html/config.php

# Create index.php file
echo "<?php phpinfo(); ?>" > /var/www/html/index.php

# Start httpd service
systemctl start httpd
systemctl enable httpd
