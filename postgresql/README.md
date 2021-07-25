auth_data_db_backup.sql is a plain text backup dump of a simple postgresql auth_data database

This database was created and tested with "PostgreSQL 13.3 (Ubuntu 13.3-1.pgdg20.04+1) on x86_64-pc-linux-gnu, compiled by gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, 64-bit"

restore the database:
`psql < auth_data_db_backup.sql`

This database contains 3 tables and 2 functions:

tables:
1. account_type
2. accounts
3. record_status

functions:
1. add_account
2. authenticate

The functions use the built in pgcrypto crypt and gen_salt functions internally to seed new passwords and to validate existing passwords

function calls:

```
SELECT public.add_account(
	3, 
	'username', 
	'plain_text_password'
)
```

```
SELECT account_id, authenticated FROM public.authenticate(
	'joe', 
	'password'
)
```
