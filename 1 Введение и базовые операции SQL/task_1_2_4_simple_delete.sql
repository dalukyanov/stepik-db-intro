delete from billing
where payer_email is null
or recipient_email is null
or payer_email = ''
or recipient_email = ''
;