#!/bin/bash

# Backup directory, current location of the setup.sh file 
BACKUPDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DAY=$(date +"%u")

# Schedule for the backup, every midnight
#SCHEDULE="00 00 * * *"
SCHEDULE="* * * * *"

# Credentials
MYSQLUSER="root"
MYSQLPASS="password"

PGUSER="postgres"
PGPPASS=""

# add a cron job for backup
rm -f /etc/cron.d/bahmni-auto-backup		# remove the file if exists
touch /etc/cron.d/bahmni-auto-backup		# start writing the cronjob

# Printing to file
echo "#!/bin/sh" >> /etc/cron.d/bahmni-auto-backup
echo "" >> /etc/cron.d/bahmni-auto-backup
echo "# Backup openMRS database" >> /etc/cron.d/bahmni-auto-backup
echo "${SCHEDULE} root mysqldump -u${MYSQLUSER} -p${MYSQLPASS} openmrs > ${BACKUPDIR}/backups/openmrs_backup_${DAY}.sql" >> /etc/cron.d/bahmni-auto-backup

#echo "# Backup openELIS database" >> /etc/cron.d/bahmni-auto-backup
#echo "${SCHEDULE} root php ${DIR}/index.php sms" >> /etc/cron.d/bahmni-auto-backup
#PGPASSWORD="dhis" 
echo "${SCHEDULE} root pg_dump --host localhost --username clinlims --no-password --format custom --blobs --verbose --file \"${BACKUPDIR}/backups/openELIS_${DAY}.backup\"" >> /etc/cron.d/bahmni-auto-backup


#echo "# Backup openERP database" >> /etc/cron.d/bahmni-auto-backup
#echo "${SCHEDULE} root php ${DIR}/index.php sms" >> /etc/cron.d/bahmni-auto-backup