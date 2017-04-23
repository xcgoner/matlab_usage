function [] = mail_notify(emailto, subject, message)

mail = 'xcgoner_matlab@outlook.com';
psswd = '1234$#@!';
host = 'smtp-mail.outlook.com';
port  = '587';

m_subject = 'subject';
m_text = 'test';

setpref( 'Internet','E_mail', mail );
setpref( 'Internet', 'SMTP_Server', host );
setpref( 'Internet', 'SMTP_Username', mail );
setpref( 'Internet', 'SMTP_Password', psswd );

props = java.lang.System.getProperties;
props.setProperty( 'mail.smtp.user', mail );
props.setProperty( 'mail.smtp.host', host );
props.setProperty( 'mail.smtp.port', port );
props.setProperty( 'mail.smtp.starttls.enable', 'true' );
props.setProperty( 'mail.smtp.debug', 'true' );
props.setProperty( 'mail.smtp.auth', 'true' );
props.setProperty( 'mail.smtp.socketFactory.port', port );
% props.setProperty( 'mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory' );
props.remove('mail.smtp.socketFactory.class');
props.setProperty( 'mail.smtp.socketFactory.fallback', 'false' );

sendmail( emailto , subject, message );

end