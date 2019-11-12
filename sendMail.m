% ===== Info =====
% Function for Send Mail
% URL: https://www.umi-mori.jp/article/matlab/send_mail.php
% Github: https://github.com/Masumi-M/SendMail_matlab

% ===== Main =====
function [] = sendMail(attachmentFilePath, attachmentFileName)

email = 'send_from@gmail.com';
password = 'send_from_password';
recipients = 'send_to@gmail.com';

setpref('Internet', 'E_mail', email);
setpref('Internet', 'SMTP_Server', 'smtp.gmail.com');
setpref('Internet', 'SMTP_Username', email);
setpref('Internet', 'SMTP_Password', password);

props = java.lang.System.getProperties;
props.setProperty('mail.smtp.auth','true');
props.setProperty('mail.smtp.socketFactory.class', 'javax.net.ssl.SSLSocketFactory');
props.setProperty('mail.smtp.socketFactory.port','465');  %Socket for SSL (465)

subject = 'Matlab Notification.';
message_line1 = strcat('Matlab PGM Ended.');
message_line2 = strcat('Attachment: [ ', char(attachmentFileName), ' ]');
message_line3 = strcat('Datetime: [ ', datestr(datetime('now','TimeZone','local','Format','d-MMM-y HH:mm:ss Z')), ' ]');

sendmail(recipients, subject, [message_line1 10 message_line2 10 message_line3], {char(attachmentFilePath)});

return

end