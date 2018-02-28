PGPASSWORD="dhis" pg_dump --host localhost --username dhis --no-password --format custom --blobs --verbose --dbname dhis --file "/home/ntc/dhis2-database-backup/DHIS_Backup_$(date +"%u").backup"
