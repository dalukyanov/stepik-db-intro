-- Если ругается, перед выполненинем апдейта выполнить:
-- SET SQL_SAFE_UPDATES = 0;

update billing
	set payer_email='igor@mail.com'
where payer_email = 'alex@mail.com';