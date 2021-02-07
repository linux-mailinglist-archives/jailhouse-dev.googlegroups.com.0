Return-Path: <jailhouse-dev+bncBAABBZGY72AAMGQESUSNKAI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 224BC3122F6
	for <lists+jailhouse-dev@lfdr.de>; Sun,  7 Feb 2021 10:01:25 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id r20sf8245107ljg.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 07 Feb 2021 01:01:25 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612688484; cv=pass;
        d=google.com; s=arc-20160816;
        b=oBm8sv39GWnR5L+3BJDJS5fgmtY80KNEU8n3rgyxtkqTZ9OmPXtEDTCfv2AKDDh+q6
         szvIhOhCeqIQoWhQt/F1puvD4fhxnZJtFmgGOm5hTTSzViummYhxT+yw9SYo8MfCSsxP
         REwPc0sym0Ye31lJdpHYOXvjjbunsk9uF9Yfr9qunYeZBPcsWpPqMDA78UWF/JxN1N8R
         oP78q5GtCoEEcMawHaUulihJzurH7Ng63iA8TBcrltPAdNXac5vfqPRWhqroSbinG1E3
         t+vJ8TwDyQo4ywVZTHOvmRxyXNCnfSo8HRIM+wgLTsSp/7qC1wNut0iqvb6xOwUr4/t4
         sFQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:list-unsubscribe:mime-version:subject
         :message-id:to:from:sender:dkim-signature;
        bh=06B4FNYQvO2MG0fpTSxPK8gEPZwEaFAGt/QcVYXjxkA=;
        b=R70YSWubbG6S9XEm4jKWpy5Q3p3+fCY8T4uWTL3OTDRde0ornCmFpjm7I0//y6xsm6
         AXEsxNjz+l40dAE9dTUFem92pLWgq/h3ZoqERZoG92HHehYYdSFKUhQS4q39D/w/9gZf
         33A9xrn34XE5d72mC2irRQBzCMVOSYcitVJOdrVDOrsItEe3NdKRRBawrm12dRb5maK+
         iDJ92/ZODX1m+DjC44TThb2e+MW95/9/4ExREK78lh5H4bOGb7EyRzOSyoADMu5jlUFs
         YtG8OlUfhg6x73sb9Ji9+Pkgm9S9Zx+w+2PVGXqGjiRJwE7nc/qtAaZuQDHSJg/G4CPd
         3rgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=MTPdzA8Y;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=G3zazmad;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:message-id:subject:mime-version:list-unsubscribe
         :date:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=06B4FNYQvO2MG0fpTSxPK8gEPZwEaFAGt/QcVYXjxkA=;
        b=BQNbKLFbNRQiAPA3HX1rLFDoPz3nQzv+NGdGeah9k0feTHPoNH6DNRCS4zvt7lsXHR
         mDVpjo5R1PLuPNjy8hhQ8JyyzD0nBadDzfM88+7u+Mem5cjdBeSdb8NH611sf3x/u5di
         6BAwHp46Mzzm2KLVPa67FUra+BbRJdJt+ZrphhGNizw7f5bLjZs4HXxLtlIxgHm5w1IX
         Mz0W/annyS2guY65G2gYldHRj5a1aqt5ZWM8PsLxWd1r8Q9dGnL5AR1nIskClAaftj0Y
         dx8Bvpx1DFjYP/ho0clqcXTQR9GnQYZNh0AMEYsr6OeYkA0ZNv+aPuxty5iKoPn0ht4+
         hZzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:message-id:subject:mime-version
         :list-unsubscribe:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=06B4FNYQvO2MG0fpTSxPK8gEPZwEaFAGt/QcVYXjxkA=;
        b=Qu2atSMonaSluQMSSkD+dSQ+pvYNpYfSAcLueWv32lWtBcK2QRX1abr6Ae4RJTzMW2
         xc7B+j5/xQxY1PlFm663gX7sXbpJiMVsZ06McRX9Kv/jpcSjH0sr5ibtKRaHSC2yeX85
         mfOfyNo39pHw0aN50yXXMp72uCf+arwLzBmHreXaUHybATPcQjg59GUkCmkdzmBeanJL
         uNtpM0TxtVU836YzrRdvDIJuX22Q7CrcjOu1Dk2r6rhjqBEt1vjfSwfEjt+3ZPlNO9iO
         oXKc/yPxLcAVNTzFz4QeOqMTHg3uYxEjEFl1L+JCatWNaDePsvOc8YOBptwr3xwddBsy
         QhGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531sjZgaOkovAJXT4whiZhjeMXb8KZVYxP5cmCmNs5LQzYqPE1Jd
	DvAQhYyy5bS8uaDlac07QYM=
X-Google-Smtp-Source: ABdhPJzLkxZvXpaW6mbD3nTGQ/aqP6VQm1oJjgsEMT1zgpPHlRTQqY8Sk7lObKZbhvdx+xu+YLxVww==
X-Received: by 2002:a2e:83cb:: with SMTP id s11mr7431467ljh.192.1612688484572;
        Sun, 07 Feb 2021 01:01:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:1314:: with SMTP id u20ls2320169lja.9.gmail; Sun,
 07 Feb 2021 01:01:23 -0800 (PST)
X-Received: by 2002:a2e:90ca:: with SMTP id o10mr7585628ljg.150.1612688483708;
        Sun, 07 Feb 2021 01:01:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612688483; cv=none;
        d=google.com; s=arc-20160816;
        b=lcmNCx5csnFoR7k/V4N6B0ZCNl/IHQYbFym3nmkbTeJM822Zf51BqILhxv6YgBOn3y
         SYYD2XaYBD6/oUZjVS1ai5thE1Lq/nPESEeZTWCceeVjAGibI8FpvyBUSgvj6ast3Me/
         D+FjRracmjt4XXLGX4KW8rbtdbyX+U62FWBRo2izHMtHmR509XcQNbMl6CtgoU//3zCr
         tjM2U6iDpbAUb/vtdO/Kgv2xtVqR8wTEVrTKxw2Zd5d2pt9sS8oGj4Q6sQHs8y4DsZFA
         UHiayHYQ9DPaQ+rCVMLlmuAYWCc5R/T0zkj2QUqHpUedEE4+c2A/Lb/xQIHvz0YDHXLU
         rwQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:list-unsubscribe:mime-version:subject:message-id:to:from
         :dkim-signature:dkim-signature;
        bh=PkSTCMXpVHRxlsEgpY0ZC8wvDMlj/v2MRnrq5CSMP28=;
        b=mOBELDD9gFys8BYM4Xnz0wo5rfJoSOSx8Ubu1uJpc8g7gnJ/U748LhN5oXG/QaXJgk
         5q+Gat+qs4P2vFqS2LRo62cqpNo3vNTu6O+HJy7jf84Qa/Gmc/tYZwZubvxMc17Ht66c
         /XPLn0HXl9wNvUkuuKO3n253F1AYXvqgaVLmOHV0Hto36L6ihqgoGjOp2zXcbWTw4T14
         kXTjmmAIR5fzYpTxZ2hpRXC6DTJ7Dy4YDhrH1FuEFXBJ5uKmr2h3pFZOchXciLzC3fc2
         thWc/KE6qx/ZJtCWDBn/Ohes3n9pTrs4Cmv04eI+egWcZGsrW3V5ptmRQ4bwkZld5lsJ
         KQAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=MTPdzA8Y;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=G3zazmad;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
Received: from smtp2.email.tb.ru (smtp2.email.tb.ru. [185.147.82.194])
        by gmr-mx.google.com with ESMTP id g28si648336lfh.12.2021.02.07.01.01.23
        for <jailhouse-dev@googlegroups.com>;
        Sun, 07 Feb 2021 01:01:23 -0800 (PST)
Received-SPF: pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) client-ip=185.147.82.194;
Received: by smtp1.email.tb.ru id h3um662erm8j for <jailhouse-dev@googlegroups.com>; Sun, 7 Feb 2021 09:01:23 +0000 (envelope-from <postman3670461@email.tb.ru>)
From: "John Dreamer" <smart@digscience.org>
To: jailhouse-dev@googlegroups.com
Message-Id: <E1l8fwZ-HVPern-MY@ucs102-ucs-10.msgpanel.com>
Subject: 8th Conference with Springer Publication. Scopus, WoS Indexation -
 Deadline February 21, 2021
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MWw4ZndaLUhWUGVybi1NWQ=="
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Complaints-To: abuse@email.tb.ru
X-EnvId: eu1production.tr_3670461:1l8fwW-00002B-HUK4:1_amFpbGhvdXNlLWRldkBnb29nbGVncm91cHMuY29t_2_3027617
X-Feedback-ID: 3670461:transact:UO
X-ReplyTo: smart@digscience.org
Date: Sun, 7 Feb 2021 09:01:23 +0000
X-Original-Sender: smart@digscience.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@digscience.org header.s=us header.b=MTPdzA8Y;       dkim=pass
 header.i=@topeml.com header.s=jul2015 header.b=G3zazmad;       spf=pass
 (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194
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

--MWw4ZndaLUhWUGVybi1NWQ==
Content-Type: multipart/alternative; 
	boundary="----=_Part_5333487_745799765.1612688483395"

------=_Part_5333487_745799765.1612688483395
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Author,

You are cordially invited to submit your full paper
of 6 - 12 pages.

The 2021 International Conference on Comprehensible Science (ICCS 2021) wil=
l be held in Eilat, Israel, on June 18-20, 2021. Conference website is http=
s://ics.events/iccs-2021/ (https://email.tb.ru/ru/eu1_link_tracker?hash=3D6=
farog4ptbxh44riep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmih=
ruycqwb599j39zsughm69zrtznswjewmbbkddeydrmhkiwusd6fmrkba3syyfebnuk5adwq8qrj=
4q58pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8=
nc4xwgpsoiifhbqotjzd4saxh9wo819zxur9gzrd7fz3of5dwfp5k3oro&url=3DaHR0cHM6Ly9=
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
1_unsubscribe?hash=3D6kmnb3bwfrmb9knq4nktinga1955tf96h5x58wx7kshzfpnytry4dh=
oop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydrmhkiwusd6fmr=
kba3syyfebnuk5adwq8qrj4q58pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m=
14x4ct8rbcwoi743ehtry8nc4xwfh1u3bqzxfmddqfmsx5hbh6th7ybhawoxweajcatehbkdbib=
rp51gk9w1fb5xgp6fa11jinhxnowy1cbs4qay7bgf6p7et7j8xab7djrsrrxs7jtq11ymk8pufn=
a4cj7mhjeeuar5ywim9311amamd7i8kzdm1w7e6w911ns3k7jnum8gr8p43fuhghd8zzbb7n311=
7c6eekp736sc9igh3n1wwfaqbujsuxennqq6nrx87pfc7e)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1l8fwZ-HVPern-MY%40ucs102-ucs-10.msgpanel.com.

------=_Part_5333487_745799765.1612688483395
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
t" src=3D"https://s.tb.ru/uploads/mailings/t/b8eb1bf9-9740-4607-a664-a60330=
35bd1f/1d6b90f5-423e-4664-a53e-043a17e4a558.jpeg" alt=3D"text image" style=
=3D"border: 0; width: 100%; max-width: 560px; height: auto;"><!--<![endif]-=
-><!--[if (gte mso 9)|(IE)]>
                                 <img class=3D"s-image__element" width=3D"5=
60" src=3D"https://s.tb.ru/uploads/mailings/t/b8eb1bf9-9740-4607-a664-a6033=
035bd1f/1d6b90f5-423e-4664-a53e-043a17e4a558.jpeg" alt=3D"text image" style=
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
.ru/ru/eu1_link_tracker?hash=3D6farog4ptbxh44riep6ujhqbzhz5tf96h5x58wx7kshz=
fpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydrmh=
kiwusd6fmrkba3syyfebnuk5adwq8qrj4q58pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3f=
wgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwgpsoiifhbqotjzd4saxh9wo819zxur9gzrd7fz=
3of5dwfp5k3oro&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2ljY3MtMjAyMS8~&uid=3DMzY3MDQ=
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
er-radius: 21px; text-decoration: none; word-break: break-all; color: #111;=
 border-color: #fff; border: 2px solid hsla(0,0%,7%,.16);" href=3D"https://=
email.tb.ru/ru/eu1_link_tracker?hash=3D6ib5ttdmn13q5eriep6ujhqbzhz5tf96h5x5=
8wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbk=
ddeydrmhkiwusd6fmrkba3syyfebnuk5adwq8qrj4q58pc57uckn5pk34xmhosu17x5pci81kjt=
1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwbu9h5hcwerw9a8ppp7ctee39hd9egf=
m78oircytof5dwfp5k3oro&url=3DaHR0cHM6Ly9pY3MuZXZlbnRz&uid=3DMzY3MDQ2MQ~~&uc=
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
    <a href=3D"https://email.tb.ru/ru/eu1_unsubscribe?hash=3D6kmnb3bwfrmb9k=
nq4nktinga1955tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39=
zsughm69zrtznswjewmbbkddeydrmhkiwusd6fmrkba3syyfebnuk5adwq8qrj4q58pc57uckn5=
pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwfh1u3bqz=
xfmddqfmsx5hbh6th7ybhawoxweajcatehbkdbibrp51gk9w1fb5xgp6fa11jinhxnowy1cbs4q=
ay7bgf6p7et7j8xab7djrsrrxs7jtq11ymk8pufna4cj7mhjeeuar5ywim9311amamd7i8kzdm1=
w7e6w911ns3k7jnum8gr8p43fuhghd8zzbb7n3117c6eekp736sc9igh3n1wwfaqbujsuxennqq=
6nrx87pfc7e" style=3D"color: black;">=D0=9E=D1=82=D0=BF=D0=B8=D1=81=D0=B0=
=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =D1=80=D0=B0=D1=81=D1=81=D1=8B=D0=BB=
=D0=BA=D0=B8</a>
 </span>
</td></tr></table><center><table><tr><td><img src=3D"https://email.tb.ru/ru=
/eu1_read_tracker/3670461?hash=3D647fs11oz3h5z8pqa78tagai94u5tf96h5x58wx7ks=
hzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydr=
mhkiwusd6fmrkba3syyfebnuk5adwq8qrj4q58pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu=
3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwdxkkiknw7ibbnmirqs18pi4t7p" width=3D=
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
om/d/msgid/jailhouse-dev/E1l8fwZ-HVPern-MY%40ucs102-ucs-10.msgpanel.com?utm=
_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jail=
house-dev/E1l8fwZ-HVPern-MY%40ucs102-ucs-10.msgpanel.com</a>.<br />

------=_Part_5333487_745799765.1612688483395--

--MWw4ZndaLUhWUGVybi1NWQ==--
