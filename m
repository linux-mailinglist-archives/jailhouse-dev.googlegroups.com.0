Return-Path: <jailhouse-dev+bncBAABBKW24L7QKGQERFXJYDA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 189D92EF7DA
	for <lists+jailhouse-dev@lfdr.de>; Fri,  8 Jan 2021 20:06:19 +0100 (CET)
Received: by mail-wr1-x438.google.com with SMTP id r8sf4506350wro.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 08 Jan 2021 11:06:19 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610132778; cv=pass;
        d=google.com; s=arc-20160816;
        b=ddhnuqvL43WQmFT2WJ27eor52ZsUJxOgyc8P2AZ/OBuSKc6g6xOGOx5HE0O6cx/Aj6
         UsXUlM0o+fwHtcLVptgQ7rjUFNDh8HWZzA9LXUTMWeNY3q3MAK2QLFqbBxRasdTVEpLQ
         avgFov5y5rN7h5cTiZgZfx8M8ixssSgs+9X5kmoOx7BNq3PeJmIH6jVNxyOvIiV8mjtD
         M3FEKmdyhUHHaYKAVyqx4pPcTenCpAwT6Q8rW0CbIcaeqj4awKyywD+5BXtO6qJrIGBY
         mPglOoWzY3TPV3ozv+bM1wjODoWQkilqhHiD7KTiIk/kP9TRicL9aRneKvVflPi+Uvw1
         mbLw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:list-unsubscribe:mime-version:subject
         :message-id:to:from:sender:dkim-signature;
        bh=IKPqvRlaSI6yQQoyzPeiVyPVFtZXC+ZKGz+MmrlZXS4=;
        b=IU+IwXia6LFOMopVUuBIqhftrRc/cH1J807d0hGAyPfnGHKe6z7gH/Rbsj5NrAovdl
         lDly9l8X86wbf3Wq1q6vlAafr7jkz8CgSQDsVaR2FPvlJACHEXtlH/aYJ99+yQrcsm9Y
         N7kKiUPwoxJuFfwwSMw6FRiru+DeQ5uRXUi5XU1A5uzDZPUge2tR3bj1jUL7+J6idIP8
         ALClhGAypEYlb5OIgAXgqBtvfeSfZS3tFrxnCZwo4T8W0vU03SQPghwvW3/j3gjGTx6o
         PuVWu4VTDI1NoIE2zM0M3Y8xUxOzGOz8fd1KqJxyGb2BBbXpedLAnoUlB3Ql5TYqnK74
         s1dg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=qVCwh8UE;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=n3sq48gf;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:message-id:subject:mime-version:list-unsubscribe
         :date:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=IKPqvRlaSI6yQQoyzPeiVyPVFtZXC+ZKGz+MmrlZXS4=;
        b=cw24kKBqsw7Ut6yUtP0RXmgoea1JNvoK6UV/P+Lo5hVEFdRrq48eoHUEGcJFCGEGhu
         v+4lmAlRL2MIz/F74vpPNz7ujz7UV/kLxzmqqtUv/2ED3BLqQnZfZMlr78H2z5UWPh0b
         fBr3qJIE8mDQICcqsbScnjz3kTwRQd2lvsk/E7/Efs/YguVC4zZhR+wtDhCgKdC52rvb
         SjGWQeOL2jG9ske3Iqw9h01PbuQoLYeMRBAHB1vbR/f3jrO5yzYm2hPDQrzy1f+zOBGT
         VYzUw8GQYkZr8pJweJtuobz8kXdq4EOPyzshMoj7XM/x/qgDGzdnkqkwfonUWWAe5f5J
         zoLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:message-id:subject:mime-version
         :list-unsubscribe:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=IKPqvRlaSI6yQQoyzPeiVyPVFtZXC+ZKGz+MmrlZXS4=;
        b=A1Jm0wg75ecVOSM+7pQ+jo6v1vQGBzyY0i2cEPo84y7Z1uFsS6BirzFM7+abkSMK71
         WHuiZv4IMS7yjcGEAxGJn6ts3TeEjxBJOwLv19Ed+FSj8MgGZREaF2Hg2xdIf4qh5QFh
         luYcDsvxj9pYrjn1DazUcsfsxKg4Ai0VyRR+J4GbXoHDk9mCFuTrlxHeiJjmqxq/Hhbw
         UIyovialhvi8Ws1M62DdOq38Wq26dVOYqsD8ht6KssOqpaR6F+8aD1Me2BpWd6Cwix2U
         IaQqpEKVeS8rTEwng6bqEEV6QkXqbChrprDBvpWR/a0JIUGqcaIIyAI1hAhXUzc5Xsab
         RS0A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5328yLrN16MgRrUvI/Kn53zso2IqMRY2UAcaM15qU0GrkMkkuxat
	uNtColL5FhumnmhFS9S0Mjk=
X-Google-Smtp-Source: ABdhPJz45dnhn9/tiRGcMhawMEFwrMSKYKDBSA3LQyECuKBfvWUzSnxAcJQgtsmQNthzA+GtzTexaA==
X-Received: by 2002:a05:600c:4ed0:: with SMTP id g16mr4302955wmq.176.1610132778791;
        Fri, 08 Jan 2021 11:06:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6812:: with SMTP id w18ls2545685wru.1.gmail; Fri, 08 Jan
 2021 11:06:17 -0800 (PST)
X-Received: by 2002:a5d:4243:: with SMTP id s3mr4969525wrr.31.1610132777886;
        Fri, 08 Jan 2021 11:06:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610132777; cv=none;
        d=google.com; s=arc-20160816;
        b=jr2GJJqnepsTic5muqFsh+DH05P6F1JUcLwxE+GbSoka+e5A0rIgw68odpugTTJHAs
         3MvTSesnCHth3Y+hpeWIO2KDezu1L5eimWWicbYTBRay4DxOk7wduLoUHNVhia/MAnk3
         YOkpOC0tt59JipAvV2UlR9vX4q+ejJ8o4bNM/2ceBLS12j8wbt0Q/0Gt9/mXROUncc1W
         go+EL9Iw1u3jAxUK1dm0fHX0/ZN/qxRlyGk8QemdTg1ZVVB+Aw+MwfGVplVnOcJpPGqM
         kxxjwEw1kkUhdfBLwTFuwCqEF4ibu9Vw0vi9MIzysGD8p/R9JAnUq9kz/wRGfz1dd7Lt
         ntuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:list-unsubscribe:mime-version:subject:message-id:to:from
         :dkim-signature:dkim-signature;
        bh=Ldd7OlRc3MXq3dfCxGi4SC2on1uz1A0tPJWEi+ZuPjg=;
        b=dFUnwYzWnYlGhxRpGhEehbsEDKFixBrZjYblNp8GaTBS79CfJXGOUg48o96LI4DtKC
         9bKCjYeWkqKBOlsM7Gqu/rebgHCgaEk1AUR8qhCcjn7S8i6NGEvU2GqA7FGhdlZIwAS6
         +fnIOAWNfqnGqRxUQRTyE9bCFMqk1Wor2pSIyY9UpuBpG4fBRLJx5h4OaUPRoLqRpSjG
         apFFmH5d6XHEKbsi3lHNaiv80i+aA0iM2gu7AXzaZsismGrM3eZRnvBmxAez/KN89sjt
         +7pxzYt6glxIgp4dXg+HscsE1pRzi7gfw81Zxaz0Lahm5IU4ouwLAdN3tRxMUDLAbMsL
         wX2A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=qVCwh8UE;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=n3sq48gf;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
Received: from smtp1.email.tb.ru (smtp1.email.tb.ru. [185.147.82.156])
        by gmr-mx.google.com with ESMTP id o135si597714wme.3.2021.01.08.11.06.17
        for <jailhouse-dev@googlegroups.com>;
        Fri, 08 Jan 2021 11:06:17 -0800 (PST)
Received-SPF: pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) client-ip=185.147.82.156;
Received: by smtp1.email.tb.ru id hv2mii2erm8j for <jailhouse-dev@googlegroups.com>; Fri, 8 Jan 2021 19:06:16 +0000 (envelope-from <postman3670461@email.tb.ru>)
From: "John Dreamer" <smart@digscience.org>
To: jailhouse-dev@googlegroups.com
Message-Id: <E1kxx5U-KWlYO5-MW@ucs102-ucs-9.msgpanel.com>
Subject: The 8th Conference with Springer Publication. Scopus, WoS
 Indexation - Deadline February 21, 2021
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MWt4eDVVLUtXbFlPNS1NVw=="
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Complaints-To: abuse@email.tb.ru
X-EnvId: eu1production.tr_3670461:1kxx5T-0001CB-CJuJ:1_amFpbGhvdXNlLWRldkBnb29nbGVncm91cHMuY29t_2_3027617
X-Feedback-ID: 3670461:transact:UO
X-ReplyTo: smart@digscience.org
Date: Fri, 8 Jan 2021 19:06:16 +0000
X-Original-Sender: smart@digscience.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@digscience.org header.s=us header.b=qVCwh8UE;       dkim=pass
 header.i=@topeml.com header.s=jul2015 header.b=n3sq48gf;       spf=pass
 (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156
 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

--MWt4eDVVLUtXbFlPNS1NVw==
Content-Type: multipart/alternative; 
	boundary="----=_Part_2242535_795176379.1610132776521"

------=_Part_2242535_795176379.1610132776521
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Author,

You are cordially invited to submit your full paper
of 6 - 12 pages.

The 2021 International Conference on Comprehensible Science (ICCS 2021) wil=
l be held in Eilat, Israel, on June 18-20, 2021. Conference website is http=
s://ics.events/iccs-2021/ (https://email.tb.ru/ru/eu1_link_tracker?hash=3D6=
659uday8jfn1ariep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmih=
ruycqwb599j39zsughm69zrtznswjewmbbkddeydyzxh37cony8c5wbncbtabb58qxht3w379hk=
hzg9pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8=
nc4xwgpsoiifhbqotjzd4saxh9wo819hxx46uxocopyappqs7g1e5wrqh&url=3DaHR0cHM6Ly9=
pY3MuZXZlbnRzL2ljY3MtMjAyMS8~&uid=3DMzY3MDQ2MQ~~&ucs=3D875aa839861819b946ca=
64157ac91752).
Early submissions are greatly appreciated. A single attending author may pr=
esent a maximum of two papers onsite/online. The presentation, award submis=
sion and proceedings submission for a paper must all be in English.
You may submit your paper online via Online Submission and Review System. S=
ubmitted papers (until 12-page limit) must comply with the requested format=
 Template, be written in English, must not have been published before, not =
be under review for any other conference or publication. Authors might also=
 consider running their paper through an unoriginal text detection software=
 such as www.turnitin.com.
All submissions will be twice =C2=ABblind=C2=BB reviewed based on relevance=
, timeliness, originality, importance and clarity of expression with convin=
cing argumentative. Besides globally relevant meetings with internationally=
 representative program/scientific committees guaranteeing a strict peer-re=
viewing and paper selection process. After that you will receive an email n=
otification containing an acceptance or rejection letter. This letter will =
contain a submission number that you should include in all further correspo=
ndences.

Publication and Indexation
Accepted and registered Papers will be published in the 2021 International =
Conference on Comprehensible Science Proceeding by Springer in a book of th=
e Lecture Notes in Networks and Systems series, and then will be submitted =
to ISI Proceedings, SCOPUS, and other indexations.

We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19. Due to=
 the restrictions caused this year by COVID-19 Pandemic, corresponding auth=
ors with registration in ICADS2021 will have a discount of 50 USD in the IC=
CS 2021 registration.

Important Deadlines:

01

Submission: February 21, 2021

02

Notification: March 30, 2020

03

Registration: April 21, 2021

ICCS 2021 Convener

=D0=AD=D1=82=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=B1=D1=8B=D0=BB=D0=BE =D0=BE=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=
=D0=BD=D0=BE jailhouse-dev@googlegroups.com =D0=BE=D1=82:
John Dreamer | smart@digscience.org
=D0=9E=D1=82=D0=BF=D0=B8=D1=81=D0=B0=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =
=D1=80=D0=B0=D1=81=D1=81=D1=8B=D0=BB=D0=BA=D0=B8 (https://email.tb.ru/ru/eu=
1_unsubscribe?hash=3D6uepq3ygn74ddqnq4nktinga1955tf96h5x58wx7kshzfpnytry4dh=
oop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydyzxh37cony8c5=
wbncbtabb58qxht3w379hkhzg9pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m=
14x4ct8rbcwoi743ehtry8nc4xwrsb9euab68am94jg9kqh5zgfzop68fc7un9zj4phaq5f51ky=
xhb687yem5jpzemejehany31suqoyeax6u6ipj5ufnr8zxr388wazkbowwdftkcstcq617r9xu7=
fxrww5kz1w6xay1jzoarjre3t958ma6ecxsgy6wcpix4if647h9depsc6uy3wgnr517tsf8kr9j=
iusn3yrgh15e4wha8dor1tkfymdsq34qqppqs7g1e5wrqh)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1kxx5U-KWlYO5-MW%40ucs102-ucs-9.msgpanel.com.

------=_Part_2242535_795176379.1610132776521
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "https://www=
.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
    <meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
    <meta name=3D"viewport" content=3D"width=3Ddevice-width, initial-scale=
=3D1, maximum-scale=3D1, user-scalable=3D0">
    <meta name=3D"format-detection" content=3D"telephone=3Dno">
    <title></title>
    <!--[if (gte mso 9)|(IE)]>
    <style type=3D"text/css">
        table {border-collapse: collapse;}
    </style>
    <![endif]-->

</head>

<body style=3D"min-width: 100%; padding: 0; background-color: #eeefef; marg=
in: 0;">
    <center class=3D"sb-wrapper" style=3D"width: 100%; table-layout: fixed;=
 -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%;">
        <div class=3D"sb-webkit" style=3D"max-width: 560px; border-radius: =
4px; overflow: hidden;">
            <!--[if (gte mso 9)|(IE)]>
                <table width=3D"560" align=3D"center" cellpadding=3D"0" cel=
lspacing=3D"0" border=3D"0" style=3D"border-spacing: 0; font-family: sans-s=
erif; color: #333;">
                    <tr>
                        <td style=3D"padding: 0;">
            <![endif]-->
                <table class=3D"sb-block s-image" style=3D"border-spacing: =
0; font-family: sans-serif; color: #333; background-color: #fff; position: =
relative; width: 100%; max-width: 560px; background-position: 50% 50%; marg=
in: 0 auto; word-break: break-word;" width=3D"100%" bgcolor=3D"#fff"><tr><t=
d class=3D"s-image__wrapper sb-full-width" style=3D"padding: 24px 0; width:=
 100%;" width=3D"100%"><!--[if !mso]><!-- --> <img class=3D"s-image__elemen=
t" src=3D"https://s.tb.ru/uploads/mailings/t/1fa30742-fafc-4152-a4ff-127b1f=
c3a819/c96f60ab-bee8-4838-8f7a-53af366d3304.jpeg" alt=3D"text image" style=
=3D"border: 0; width: 100%; max-width: 560px; height: auto;"><!--<![endif]-=
-><!--[if (gte mso 9)|(IE)]>
                                 <img class=3D"s-image__element" width=3D"5=
60" src=3D"https://s.tb.ru/uploads/mailings/t/1fa30742-fafc-4152-a4ff-127b1=
fc3a819/c96f60ab-bee8-4838-8f7a-53af366d3304.jpeg" alt=3D"text image" style=
=3D"border: 0; max-width: 560px; height: auto; width: 560px;">
                            <![endif]--></td></tr></table>                <=
table class=3D"sb-block s-text sb-text-dark" style=3D"border-spacing: 0; fo=
nt-family: sans-serif; position: relative; width: 100%; max-width: 560px; b=
ackground-position: 50% 50%; margin: 0 auto; word-break: break-word; color:=
 #111; background-color: #ffffff;" cellspacing=3D"0" width=3D"100%" bgcolor=
=3D"#ffffff"><tr><td style=3D"padding: 0;">
                                            <table class=3D"s-text__wrapper=
 sb-full-width" style=3D"border-spacing: 0; font-family: sans-serif; positi=
on: relative; z-index: 2; width: 100%; color: #111;" width=3D"100%"><tr>  <=
td class=3D"s-text__row" style=3D"padding: 14px; font-size: 0; text-align: =
left;" align=3D"left">  <div class=3D"s-text__text-wrapper" style=3D"displa=
y: inline-block; width: 100%; vertical-align: top; max-width: 100%;"><table=
 style=3D"border-spacing: 0; font-family: sans-serif; color: #111;"><tr><td=
 class=3D"s-text__text-cell" style=3D"padding: 10px;"><table class=3D"s-tex=
t__list sb-table-layout-fixed" style=3D"border-spacing: 0; font-family: san=
s-serif; table-layout: fixed; color: #111;">  <tr>  <td class=3D"s-text__it=
em" style=3D"padding: 0;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-text__ov=
erhead sb-font-p2 sb-break-all" style=3D"margin: 0; color: #909090; font-si=
ze: 14px; line-height: 20px; word-break: break-all;"></p> <![endif]--><!--[=
if !mso]><!-- --> <p class=3D"s-text__overhead sb-font-p2 sb-break-word" st=
yle=3D"margin: 0; color: #909090; font-size: 14px; line-height: 20px; word-=
break: break-word;"></p> <!--<![endif]--></td></tr>   <tr>  <td class=3D"s-=
text__item  s-text__item_with-padding_small" style=3D"padding: 0; padding-t=
op: 4px;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-text__title sb-break-all=
 sb-align-center" style=3D"margin: 0; font-size: 28px; line-height: 36px; t=
ext-align: center; word-break: break-all;"><b><font style=3D"color: #c44569=
;">Dear Author</font></b>, </p> <![endif]--><!--[if !mso]><!-- --> <p class=
=3D"s-text__title sb-break-word sb-align-center" style=3D"margin: 0; font-s=
ize: 28px; line-height: 36px; text-align: center; word-break: break-word;">=
<b><font style=3D"color: #c44569;">Dear Author</font></b>, </p> <!--<![endi=
f]--></td></tr>   <tr>  <td class=3D"s-text__item  s-text__item_with-paddin=
g" style=3D"padding: 0; padding-top: 16px;"><!--[if (gte mso 9)|(IE)]> <p c=
lass=3D"s-text__subtitle sb-break-all sb-align-center" style=3D"margin: 0; =
font-size: 20px; line-height: 28px; text-align: center; word-break: break-a=
ll;"><b><font style=3D"color: #904b90;">You are cordially invited to submit=
 your full paper&nbsp;</font></b><br><b><font style=3D"color: #904b90;">of =
6 - 12 pages.</font></b></p> <![endif]--><!--[if !mso]><!-- --> <p class=3D=
"s-text__subtitle sb-break-word sb-align-center" style=3D"margin: 0; font-s=
ize: 20px; line-height: 28px; text-align: center; word-break: break-word;">=
<b><font style=3D"color: #904b90;">You are cordially invited to submit your=
 full paper&nbsp;</font></b><br><b><font style=3D"color: #904b90;">of 6 - 1=
2 pages.</font></b></p> <!--<![endif]--></td></tr>   <tr>  <td class=3D"s-t=
ext__item  s-text__item_with-padding" style=3D"padding: 0; padding-top: 16p=
x;"><!--[if (gte mso 9)|(IE)]> <p class=3D"sb-font-p1 sb-break-all sb-align=
-left" style=3D"margin: 0; font-size: 16px; line-height: 24px; text-align: =
left; word-break: break-all;">The 2021 International Conference on Comprehe=
nsible Science (ICCS 2021) will be held in Eilat, Israel, on June 18-20, 20=
21. Conference website is <font color=3D"#546de5"><a href=3D"https://ics.ev=
ents/iccs-2021/" target=3D"_blank" class=3D"sb-link" data-link-id=3D"0" sty=
le=3D"color: inherit; text-decoration: underline;">https://ics.events/iccs-=
2021/</a></font>.<br>Early submissions are greatly appreciated. A single at=
tending author may present a maximum of two papers onsite/online. The prese=
ntation, award submission and proceedings submission for a paper must all b=
e in English. <br>You may submit your paper online via Online Submission an=
d Review System. Submitted papers (until 12-page limit) must comply with th=
e requested format Template, be written in English, must not have been publ=
ished before, not be under review for any other conference or publication. =
Authors might also consider running their paper through an unoriginal text =
detection software such as www.turnitin.com. <br>All submissions will be tw=
ice =C2=ABblind=C2=BB reviewed based on relevance, timeliness, originality,=
 importance and clarity of expression with convincing argumentative. Beside=
s globally relevant meetings with internationally representative program/sc=
ientific committees guaranteeing a strict peer-reviewing and paper selectio=
n process. After that you will receive an email notification containing an =
acceptance or rejection letter. This letter will contain a submission numbe=
r that you should include in all further correspondences.<br><br><b><font s=
tyle=3D"color: #c44569;">Publication and Indexation</font></b><br>Accepted =
and registered Papers will be published in the 2021 International Conferenc=
e on Comprehensible Science Proceeding by <b><font style=3D"color: #c44569;=
">Springer in a book of the Lecture Notes in Networks and Systems</font></b=
> series, and then will be submitted to <b><font style=3D"color: #f19066;">=
ISI Proceedings, SCOPUS</font></b>, and other indexations.<br><br>We are pr=
epared to offer virtual participation options, for anyone who cannot or cho=
oses not to travel due to the situation regarding COVID-19. Due to the rest=
rictions caused this year by COVID-19 Pandemic, corresponding authors with =
registration in ICADS2021 will have a <b><font style=3D"color: #c44569;">di=
scount of 50 USD</font></b> in the ICCS 2021 registration.<br></p> <![endif=
]--><!--[if !mso]><!-- --> <p class=3D"sb-font-p1 sb-break-word sb-align-le=
ft" style=3D"margin: 0; font-size: 16px; line-height: 24px; text-align: lef=
t; word-break: break-word;">The 2021 International Conference on Comprehens=
ible Science (ICCS 2021) will be held in Eilat, Israel, on June 18-20, 2021=
. Conference website is <font color=3D"#546de5"><a href=3D"https://email.tb=
.ru/ru/eu1_link_tracker?hash=3D6659uday8jfn1ariep6ujhqbzhz5tf96h5x58wx7kshz=
fpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydyzx=
h37cony8c5wbncbtabb58qxht3w379hkhzg9pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3f=
wgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwgpsoiifhbqotjzd4saxh9wo819hxx46uxocopy=
appqs7g1e5wrqh&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2ljY3MtMjAyMS8~&uid=3DMzY3MDQ=
2MQ~~&ucs=3D875aa839861819b946ca64157ac91752" target=3D"_blank" class=3D"sb=
-link" data-link-id=3D"0" style=3D"color: inherit; text-decoration: underli=
ne;">https://ics.events/iccs-2021/</a></font>.<br>Early submissions are gre=
atly appreciated. A single attending author may present a maximum of two pa=
pers onsite/online. The presentation, award submission and proceedings subm=
ission for a paper must all be in English. <br>You may submit your paper on=
line via Online Submission and Review System. Submitted papers (until 12-pa=
ge limit) must comply with the requested format Template, be written in Eng=
lish, must not have been published before, not be under review for any othe=
r conference or publication. Authors might also consider running their pape=
r through an unoriginal text detection software such as www.turnitin.com. <=
br>All submissions will be twice =C2=ABblind=C2=BB reviewed based on releva=
nce, timeliness, originality, importance and clarity of expression with con=
vincing argumentative. Besides globally relevant meetings with internationa=
lly representative program/scientific committees guaranteeing a strict peer=
-reviewing and paper selection process. After that you will receive an emai=
l notification containing an acceptance or rejection letter. This letter wi=
ll contain a submission number that you should include in all further corre=
spondences.<br><br><b><font style=3D"color: #c44569;">Publication and Index=
ation</font></b><br>Accepted and registered Papers will be published in the=
 2021 International Conference on Comprehensible Science Proceeding by <b><=
font style=3D"color: #c44569;">Springer in a book of the Lecture Notes in N=
etworks and Systems</font></b> series, and then will be submitted to <b><fo=
nt style=3D"color: #f19066;">ISI Proceedings, SCOPUS</font></b>, and other =
indexations.<br><br>We are prepared to offer virtual participation options,=
 for anyone who cannot or chooses not to travel due to the situation regard=
ing COVID-19. Due to the restrictions caused this year by COVID-19 Pandemic=
, corresponding authors with registration in ICADS2021 will have a <b><font=
 style=3D"color: #c44569;">discount of 50 USD</font></b> in the ICCS 2021 r=
egistration.<br></p> <!--<![endif]--></td></tr>   </table></td></tr></table=
></div>  </td></tr></table>=20
                                        </td>
                                    </tr>
                                </table>
                                            <table class=3D"sb-block s-adva=
ntages sb-text-dark" style=3D"border-spacing: 0; font-family: sans-serif; p=
osition: relative; width: 100%; max-width: 560px; background-position: 50% =
50%; margin: 0 auto; word-break: break-word; color: #111; background-color:=
 #ffffff;" cellspacing=3D"0" width=3D"100%" bgcolor=3D"#ffffff"><tr><td sty=
le=3D"padding: 0;">
                                            <table class=3D"s-advantages__w=
rapper sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; fon=
t-family: sans-serif; position: relative; z-index: 2; min-height: 48px; wid=
th: 100%; table-layout: fixed; color: #111;" width=3D"100%">  <tr>  <td cla=
ss=3D"s-advantages__heading sb-full-width" style=3D"padding: 24px 24px 20px=
; width: 100%;" width=3D"100%">   <!--[if (gte mso 9)|(IE)]> <p class=3D"s-=
advantages__main-title sb-break-all sb-align-left" style=3D"margin: 0; font=
-size: 28px; line-height: 36px; text-align: left; word-break: break-all;"><=
b><font style=3D"color: #c44569;">Important Deadlines:</font></b></p> <![en=
dif]--><!--[if !mso]><!-- --> <p class=3D"s-advantages__main-title sb-align=
-left" style=3D"margin: 0; font-size: 28px; line-height: 36px; text-align: =
left;"><b><font style=3D"color: #c44569;">Important Deadlines:</font></b></=
p> <!--<![endif]--></td></tr>    <tr>  <td class=3D"s-advantages__row" styl=
e=3D"padding: 0 20px 24px; font-size: 0; text-align: left;" align=3D"left">=
<!--[if (gte mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">01</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;"><b><font style=3D"color: #c44569;">Su=
bmission: 	February 21, 2021</font></b></p> <![endif]--><!--[if !mso]><!-- =
--> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; font=
-size: 20px; line-height: 28px; text-align: left;"><b><font style=3D"color:=
 #c44569;">Submission: 	February 21, 2021</font></b></p> <!--<![endif]--></=
td></tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__text-row_=
with-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(=
IE)]> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-l=
eft" style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px=
; text-align: left; word-break: break-all;"></p> <![endif]--><!--[if !mso]>=
<!-- --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=
=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-ali=
gn: left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table></div=
><!--[if (gte mso 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>  <tr>  <td c=
lass=3D"s-advantages__row" style=3D"padding: 0 20px 24px; font-size: 0; tex=
t-align: left;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">02</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;"><b><font style=3D"color: #c44569;">No=
tification: 	March 30, 2020</font></b></p> <![endif]--><!--[if !mso]><!-- -=
-> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; font-=
size: 20px; line-height: 28px; text-align: left;"><b><font style=3D"color: =
#c44569;">Notification: 	March 30, 2020</font></b></p> <!--<![endif]--></td=
></tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__text-row_wi=
th-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE=
)]> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-lef=
t" style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; =
text-align: left; word-break: break-all;"></p> <![endif]--><!--[if !mso]><!=
-- --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=
=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-ali=
gn: left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table></div=
><!--[if (gte mso 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>  <tr>  <td c=
lass=3D"s-advantages__row" style=3D"padding: 0 20px 24px; font-size: 0; tex=
t-align: left;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                            <table class=3D"sb-full-width s=
b-table-layout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; =
width: 100%; table-layout: fixed; color: #111;" width=3D"100%">
                                                <tr>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                <td width=3D"64" valign=3D"=
top" style=3D"padding: 0;">
                                            <![endif]--><div class=3D"s-adv=
antages__number-wrapper" style=3D"display: inline-block; width: 100%; max-w=
idth: 64px; vertical-align: top;"><table class=3D"sb-full-width sb-table-la=
yout-fixed" style=3D"border-spacing: 0; font-family: sans-serif; width: 100=
%; table-layout: fixed; color: #111;" width=3D"100%"><tr><td class=3D"s-adv=
antages__number-cell" style=3D"padding: 0 4px 4px;"> <p class=3D"s-advantag=
es__number sb-font-arial" style=3D"margin: 0; font-size: 32px; line-height:=
 40px; color: #e3e4e6; white-space: nowrap; overflow: hidden; font-family: =
Arial,sans-serif;">03</p> </td></tr></table></div><!--[if (gte mso 9)|(IE)]=
>
                                                </td>
                                            <![endif]-->   <!--[if (gte mso=
 9)|(IE)]>
                                            <td width=3D"456" valign=3D"top=
" style=3D"padding: 0;">
                                        <![endif]--><div class=3D"s-advanta=
ges__text" style=3D"display: inline-block; width: 100%; max-width: 456px; v=
ertical-align: top;"><table class=3D"sb-full-width" style=3D"border-spacing=
: 0; font-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr=
><td class=3D"s-advantages__text-cell" style=3D"padding: 8px 4px 0;"><table=
 class=3D"sb-full-width sb-table-layout-fixed" style=3D"border-spacing: 0; =
font-family: sans-serif; width: 100%; table-layout: fixed; color: #111;" wi=
dth=3D"100%">  <tr><td class=3D"s-advantages__text-row" style=3D"padding: 0=
;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-advantages__title sb-break-all =
sb-align-left" style=3D"margin: 0; font-size: 20px; line-height: 28px; text=
-align: left; word-break: break-all;"><b><font style=3D"color: #c44569;">Re=
gistration:	April 21, 2021</font></b></p> <![endif]--><!--[if !mso]><!-- --=
> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; font-s=
ize: 20px; line-height: 28px; text-align: left;"><b><font style=3D"color: #=
c44569;">Registration:	April 21, 2021</font></b></p> <!--<![endif]--></td><=
/tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__text-row_with=
-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE)]=
> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-align-left"=
 style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; te=
xt-align: left; word-break: break-all;"></p> <![endif]--><!--[if !mso]><!--=
 --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" style=3D"=
margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text-align: =
left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table></div><!-=
-[if (gte mso 9)|(IE)]>
                                            </td>
                                        <![endif]-->  <!--[if (gte mso 9)|(=
IE)]>
                                                </tr>
                                            </table>
                                        <![endif]--></td></tr>   </table>=
=20
                                        </td>
                                    </tr>
                                </table>
                                            <table class=3D"sb-block s-head=
er sb-text-dark" style=3D"border-spacing: 0; font-family: sans-serif; posit=
ion: relative; width: 100%; max-width: 560px; background-position: 50% 50%;=
 margin: 0 auto; word-break: break-word; color: #111; background-color: #ff=
ffff;" cellspacing=3D"0" width=3D"100%" bgcolor=3D"#ffffff"><tr><td style=
=3D"padding: 0;">
                                            <table class=3D"s-header__wrapp=
er sb-full-width" style=3D"border-spacing: 0; font-family: sans-serif; posi=
tion: relative; z-index: 2; width: 100%; color: #111;" width=3D"100%"><tr> =
 <td class=3D"s-header__row" style=3D"padding: 10px 14px; font-size: 0; tex=
t-align: left;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                    <table class=3D"sb-full-width" style=3D=
"border-spacing: 0; font-family: sans-serif; width: 100%; color: #111;" wid=
th=3D"100%">
                                        <tr>
                                <![endif]-->  <!--[if (gte mso 9)|(IE)]>
                                        <td width=3D"100%" valign=3D"top" s=
tyle=3D"padding: 0;">
                                    <![endif]--><div class=3D"s-header__log=
o" style=3D"display: inline-block; width: 100%; max-width: 100%; vertical-a=
lign: middle;"><table class=3D"sb-full-width" style=3D"border-spacing: 0; f=
ont-family: sans-serif; width: 100%; color: #111;" width=3D"100%"><tr>  <td=
 class=3D"s-header__logo-cell  s-header__logo-cell_centered" style=3D"paddi=
ng: 10px; text-align: center;" align=3D"center">  <img class=3D"s-header__l=
ogo-image" src=3D"https://s.tb.ru/uploads/mailings/t/1fa30742-fafc-4152-a4f=
f-127b1fc3a819/feed057f-b6aa-4ec2-8dbf-a92e1b3fc46a.jpeg" alt=3D"=D0=A2=D0=
=B5=D0=BA=D1=81=D1=82 =D0=BB=D0=BE=D0=B3=D0=BE=D1=82=D0=B8=D0=BF=D0=B0" sty=
le=3D"border: 0; display: inline-block; width: 246px; height: auto;" width=
=3D"246">  </td></tr></table></div><!--[if (gte mso 9)|(IE)]>
                                        </td>
                                    <![endif]-->   <!--[if (gte mso 9)|(IE)=
]>
                                        </tr>
                                    </table>
                                <![endif]--></td></tr></table>=20
                                        </td>
                                    </tr>
                                </table>
                                            <table class=3D"sb-block s-butt=
ons sb-text-dark" style=3D"border-spacing: 0; font-family: sans-serif; posi=
tion: relative; width: 100%; max-width: 560px; background-position: 50% 50%=
; margin: 0 auto; word-break: break-word; color: #111; background-color: #f=
fffff;" cellspacing=3D"0" width=3D"100%" bgcolor=3D"#ffffff"><tr><td style=
=3D"padding: 0;">
                                            <table class=3D"s-buttons__wrap=
per sb-full-width" style=3D"border-spacing: 0; font-family: sans-serif; pos=
ition: relative; z-index: 2; width: 100%; color: #111;" width=3D"100%"><tr>=
  <td class=3D"s-buttons__content" style=3D"padding: 18px; text-align: left=
; font-size: 0;" align=3D"left"><!--[if (gte mso 9)|(IE)]>
                                    <table style=3D"border-spacing: 0; font=
-family: sans-serif; color: #111;">
                                        <tr>
                                <![endif]-->    <!--[if (gte mso 9)|(IE)]>
                                        <td style=3D"padding: 0;">
                                    <![endif]-->    <!--[if (gte mso 9)|(IE=
)]>
                    <v:roundrect xmlns:v=3D"urn:schemas-microsoft-com:vml" =
xmlns:w=3D"urn:schemas-microsoft-com:office:word" href=3D"https://ics.event=
s" style=3D"v-text-anchor: middle; mso-wrap-style: none; mso-position-horiz=
ontal: center; height: 40px;" arcsize=3D"53%" strokecolor=3D"hsla(0,0%,7%,.=
16)" strokeweight=3D"2px">
                        <v:fill opacity=3D"0%"></v:fill>
                        <v:textbox style=3D"mso-fit-shape-to-text:true">
                            <center class=3D"sb-button-outlook sb-font-aria=
l" style=3D"padding: 0 20px; font-size: 14px; line-height: 20px; text-align=
: center; font-family: Arial,sans-serif; color: #111111;"> ICCS 2021 Conven=
er </center>
                        </v:textbox>
                    </v:roundrect>
                    <![endif]--><!--[if !mso]><!-- -->  <a class=3D"sb-butt=
on sb-button_flat s-buttons__button pointer-events-auto  sb-button-scheme-d=
ark" style=3D"display: inline-block; vertical-align: top; margin: 6px; font=
-size: 14px; line-height: 20px; text-align: center; padding: 8px 20px; bord=
er-radius: 21px; text-decoration: none; word-break: break-all; border-color=
: #fff; color: #111; border: 2px solid hsla(0,0%,7%,.16);" href=3D"https://=
email.tb.ru/ru/eu1_link_tracker?hash=3D6w6mjumgbgnb4wriep6ujhqbzhz5tf96h5x5=
8wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbk=
ddeydyzxh37cony8c5wbncbtabb58qxht3w379hkhzg9pc57uckn5pk34xmhosu17x5pci81kjt=
1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwbu9h5hcwerw9a8ppp7ctee39hdpyi1=
koa6bcpeqppqs7g1e5wrqh&url=3DaHR0cHM6Ly9pY3MuZXZlbnRz&uid=3DMzY3MDQ2MQ~~&uc=
s=3D52310fa0f313d3356c7fa1a697933d9e"><!--[if (gte mso 9)|(IE)]>
                        <i style=3D"letter-spacing: 20px; mso-font-width: -=
100%; mso-text-raise: 4pt;">&nbsp;</i>
                        <span style=3D"mso-text-raise: 4pt;">
                    <!--<![endif]--> ICCS 2021 Convener <!--[if (gte mso 9)=
|(IE)]>
                        </span>
                        <i style=3D"letter-spacing: 20px; mso-font-width: -=
100%">&nbsp;</i>
                    <!--<![endif]--> </a>  <!--<![endif]-->   <!--[if (gte =
mso 9)|(IE)]>
                                        </td>
                                    <![endif]-->  <!--[if (gte mso 9)|(IE)]=
>
                                        </tr>
                                    </table>
                                <![endif]--></td></tr></table>=20
                                        </td>
                                    </tr>
                                </table>
                                             <table class=3D"sb-block s-foo=
ter-type-2 sb-text-dark" style=3D"border-spacing: 0; font-family: sans-seri=
f; position: relative; width: 100%; max-width: 560px; background-position: =
50% 50%; margin: 0 auto; word-break: break-word; color: #111; background-co=
lor: #ffffff;" cellspacing=3D"0" width=3D"100%" bgcolor=3D"#ffffff"><tr><td=
 style=3D"padding: 0;">
                                            <table class=3D"s-footer-type-2=
__wrapper sb-full-width" style=3D"border-spacing: 0; font-family: sans-seri=
f; position: relative; z-index: 2; width: 100%; color: #111;" width=3D"100%=
"><tr>  <td class=3D"s-footer-type-2__row" style=3D"width: 100%; padding: 2=
4px 24px 20px; text-align: center;" width=3D"100%" align=3D"center">    </t=
d></tr></table>=20
                                        </td>
                                    </tr>
                                </table>
                                         <!--[if (gte mso 9)|(IE)]>
                        </td>
                    </tr>
                </table>
            <![endif]-->
        </div>
    </center>
<table bgcolor=3D"white" align=3D"center" width=3D"100%"><tr><td align=3D"c=
enter">
 <span style=3D"font-family: arial,helvetica,sans-serif; color: black; font=
-size: 12px;">
  =D0=AD=D1=82=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5=
 =D0=B1=D1=8B=D0=BB=D0=BE =D0=BE=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=
=D0=BD=D0=BE jailhouse-dev@googlegroups.com =D0=BE=D1=82: <br/>
    John Dreamer | smart@digscience.org <br/>
    <a href=3D"https://email.tb.ru/ru/eu1_unsubscribe?hash=3D6uepq3ygn74ddq=
nq4nktinga1955tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39=
zsughm69zrtznswjewmbbkddeydyzxh37cony8c5wbncbtabb58qxht3w379hkhzg9pc57uckn5=
pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwrsb9euab=
68am94jg9kqh5zgfzop68fc7un9zj4phaq5f51kyxhb687yem5jpzemejehany31suqoyeax6u6=
ipj5ufnr8zxr388wazkbowwdftkcstcq617r9xu7fxrww5kz1w6xay1jzoarjre3t958ma6ecxs=
gy6wcpix4if647h9depsc6uy3wgnr517tsf8kr9jiusn3yrgh15e4wha8dor1tkfymdsq34qqpp=
qs7g1e5wrqh" style=3D"color: black;">=D0=9E=D1=82=D0=BF=D0=B8=D1=81=D0=B0=
=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =D1=80=D0=B0=D1=81=D1=81=D1=8B=D0=BB=
=D0=BA=D0=B8</a>
 </span>
</td></tr></table><center><table><tr><td><img src=3D"https://email.tb.ru/ru=
/eu1_read_tracker/3670461?hash=3D6o7n9tmdytqttipqa78tagai94u5tf96h5x58wx7ks=
hzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydy=
zxh37cony8c5wbncbtabb58qxht3w379hkhzg9pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu=
3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwdxkkiknw7ibbnbx4zyqwod3wgm" width=3D=
"1" height=3D"1" alt=3D"" title=3D"" border=3D"0"></td></tr></table></cente=
r></body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/E1kxx5U-KWlYO5-MW%40ucs102-ucs-9.msgpanel.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/E1kxx5U-KWlYO5-MW%40ucs102-ucs-9.msgpanel.com</a>.<br />

------=_Part_2242535_795176379.1610132776521--

--MWt4eDVVLUtXbFlPNS1NVw==--
