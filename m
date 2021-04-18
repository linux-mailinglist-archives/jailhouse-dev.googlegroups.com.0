Return-Path: <jailhouse-dev+bncBAABB3MN6KBQMGQEUS3DUHQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EFD36374E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 21:22:22 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id 91-20020adf92e40000b029010470a9ebc4sf6733575wrn.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Apr 2021 12:22:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1618773742; cv=pass;
        d=google.com; s=arc-20160816;
        b=LPK3M/FBDnswIroquAZnrs4vANVVi6FI3OHw0vOKSTNSjYFuVZOnl2KCkLbLRhZMBn
         /ZlqwbGBJki4cIxp/qaEanbv564XyM3Jq19uwUcEWYhsVPQtKiygArEIREnK7NthYcuR
         0dKw7h20bYISQ01LaJPAJuNbkSS/XbbWuRDcVYMturKCovFJm4/G/q8rTSzeUHnRz5su
         z97YL5vT12nh2G0M+rKziRfEn7WVj392Khf+Pvqmx788fO1/fyCHDe4Cl820LBj5ypLP
         9MXH39Vd/02yE4GqGkNe+UK8GF7L4yOynAqYIrMt7koG6q9ylyIJQeqnWSUSq5DjF6vE
         YJQg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:list-unsubscribe:mime-version:subject
         :message-id:to:from:sender:dkim-signature;
        bh=DlpkPwXPLGYr1WXo4MFXjhLthTmGlIkZIassLHVmIuA=;
        b=wRCA5v9Fs2lLl9j4NGVVFuFv7AFIK+3lrRN1DG0srDzwSUxf2Nv8IwyJOBILEFd5zJ
         VKHIO7fQoW+Oz7l0Ji3t7EO/j2zL8dmFGGcD3xIVNyo9/RoiD3rc4s14rX410M9Rgj1n
         iG6YgF7Lt4PSNFY42xVzsSy+ZMm0bAdUFp0v9l59u5GzjdFs/LIf6GwRV28QuAViRJNN
         ZEtA8BSSmX/BOWGS1r4zlULyrX9xv2pYXuCNlCTxyCuOiweuYKYwP3uGLuc6KjmnEe+6
         BeZ6BZM/LelYTdZ5o7RxTmlxBcE/aSTqBNSuztRS5L5xiAodC0Vv+haIcKplzbP60oY3
         T/QA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=KqhSFsH8;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=EGeoqWYx;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:message-id:subject:mime-version:list-unsubscribe
         :date:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=DlpkPwXPLGYr1WXo4MFXjhLthTmGlIkZIassLHVmIuA=;
        b=orJPBnCyNQ8xgdxnQaXiaI/LLEj2IpQIKNF354DF80oa6bpZOQOr2LuZm8Nf/psSk7
         u6Hs9ls+NIq2uMWmk/C6r4eUcWcVSz/T04c3hFKc0/+SIFhX6PJKm/vg+yxUlUiKaKtx
         E99A+oqJZyzlPzWMpmWyq3De6WLlVBEcZanREAxLmfA6qxTIWYTc+FdHEL4eG7mzY3hH
         tuhwme2Hlo5nE1DkdWCSnwchkBVB1goRB3kChYR8JhGzaPXUiMd7XMD8SBeFYXlDj5+j
         2FofDmIi+O+S0E6zatt1X05/+I2EdFLJ93z1odDAv4WtwmJBQFtokgzQ5wq4jS5qV9eX
         7P6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:message-id:subject:mime-version
         :list-unsubscribe:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=DlpkPwXPLGYr1WXo4MFXjhLthTmGlIkZIassLHVmIuA=;
        b=C8lh26bQXf43jpPiCk6z7MhtYqZspJLNXC+xxjFinWLs2Z89eYQYPoXQnDT6KbEhM2
         djFLRjs8AgmyNSKzzKQJLySt+98V88IrUAkyxJL2uWzYBivISJIgj4YFuxudifCeQclZ
         QPcRZHKIvuXzjEuobXRIlqmvxMAF9qZM88UeRCU7u/MSapZaxIAezlMv0rwX3bbDYEXU
         pFespaEnMTGZfQi2gDTKfuE98WhQ+u7L1So2GvkzIebSiuOxu0mutBm8Yw5g747rtu0x
         ROy25vlqgeg/xHmrfUZLa4eRPVFkSj8cCFghHBv/ELrIXc4SW5nCUCYEPR0ITIIE186l
         CuLw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532HoBcJz009oJhY3sk34H1n2lvoRH9ruod7ocOcILlXv7HbAm+U
	Lz5QQDE3yRme31P6THWWwao=
X-Google-Smtp-Source: ABdhPJwfWtlUusJW1kxinJS7WLuEX+Y32LSC0oBP73D+6k+VnOuPoZ55NCilPgrFP/Agbm6n8n4/hA==
X-Received: by 2002:a7b:c312:: with SMTP id k18mr18373311wmj.89.1618773742296;
        Sun, 18 Apr 2021 12:22:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6804:: with SMTP id w4ls4844976wru.2.gmail; Sun, 18 Apr
 2021 12:22:21 -0700 (PDT)
X-Received: by 2002:adf:f94c:: with SMTP id q12mr10179737wrr.283.1618773741303;
        Sun, 18 Apr 2021 12:22:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1618773741; cv=none;
        d=google.com; s=arc-20160816;
        b=TAnYoRlp8ZTlekjOHf5COVHtaQPhtAMbPbhr7R0Zr2jGM9sHBUZI67tzCgNqzdxNLi
         KA3/BiImffHlR3kIkdq0TVWd3WEH6M+0GFoVGI3LnlSht8+cf0FRz52jA2y7CnlQ0Xlp
         Nbv96iDgArIBEXEU4WUeu+ZjxQqCBpOW+On/yXooykh1JrWzF0zghSWOwc2Ysryp7iwT
         oqadDUyYA3yB6NwsMqPQs2LpdoPuSrGsYGG1SXBG3bNBpRjjsXS5rytJtg5PPj6RhG85
         gvOPYxPGPbl/fdQGDj4nO1l+7AM/g628O7AJs4I1c7ZDSWJkifLpMrzCEL0GsPS7dqqs
         +/IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:list-unsubscribe:mime-version:subject:message-id:to:from
         :dkim-signature:dkim-signature;
        bh=NDa95qwgvIlkbZRH4xE+7XfmaC4dsnxDnmOfMZ5N/7c=;
        b=VQFbDZ82HF/8zzsNFTnc65gRObiy1BR0y44qxn4X7ZvkCdRi0Thzze69s0cl6dFDRk
         pstgBqxi0kRy9ZGaP1QcHgvZajOj3g9I94oNVKW9zT3kmw12ilPnvVQ8BLfNEsX5mZ7U
         n3atv/X2TILyAtDVvI/DChBqfSaDVg944dTkMno41j89N7H3A0SF/iysqmaHHMoT3x9d
         wMTApg5A8Wdo0WSQiExy4EJfZBiynfSwNZkI4pY08/Y0U1I42/d+UJtA8TdSGly6jwRU
         iTdNG0p8KnWlo85w0IvOk5Eo2smqqJS/IK4I8JMUcC36wqafsqH9R1JBKXQAe/LaDq6G
         EbGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=KqhSFsH8;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=EGeoqWYx;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
Received: from smtp2.email.tb.ru (smtp2.email.tb.ru. [185.147.82.194])
        by gmr-mx.google.com with ESMTP id t124si1024851wmb.3.2021.04.18.12.22.21
        for <jailhouse-dev@googlegroups.com>;
        Sun, 18 Apr 2021 12:22:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.194 as permitted sender) client-ip=185.147.82.194;
Received: by smtp1.email.tb.ru id hfi3eq2erpk1 for <jailhouse-dev@googlegroups.com>; Sun, 18 Apr 2021 19:22:20 +0000 (envelope-from <postman3670461@email.tb.ru>)
From: "Tatiana Antipova" <smart@digscience.org>
To: jailhouse-dev@googlegroups.com
Message-Id: <E1lYCzs-9E8mdi-Md@ucs202-ucs-3.msgpanel.com>
Subject: 9th International Conference with Springer. Scopus, WoS Indexation
 - Submission Deadline - August 11, 2021
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MWxZQ3pzLTlFOG1kaS1NZA=="
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Complaints-To: abuse@email.tb.ru
X-EnvId: eu1production.tr_3670461:1lYCzr-000010-6Yzg:1_amFpbGhvdXNlLWRldkBnb29nbGVncm91cHMuY29t_2_3027617
X-Feedback-ID: 3670461:transact:UO
X-ReplyTo: smart@digscience.org
Date: Sun, 18 Apr 2021 19:22:20 +0000
X-Original-Sender: smart@digscience.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@digscience.org header.s=us header.b=KqhSFsH8;       dkim=pass
 header.i=@topeml.com header.s=jul2015 header.b=EGeoqWYx;       spf=pass
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

--MWxZQ3pzLTlFOG1kaS1NZA==
Content-Type: multipart/alternative; 
	boundary="----=_Part_1300131_668680764.1618773740568"

------=_Part_1300131_668680764.1618773740568
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Author,

You are cordially invited to submit your full paper of 6 - 12 pages.

The 2021 International Conference on Digital Science (DSIC 2021) will be he=
ld in Luxembourg, Luxembourg, on October 15 =E2=80=93 17, 2021. Conference =
website is https://ics.events/dsic-2021/ (https://email.tb.ru/ru/eu1_link_t=
racker?hash=3D6r6fphewqpceqqriep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuq=
frqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydmqxamichfchr5do6pkao=
69eehia1e3fumjd7uazpc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8=
rbcwoi743ehtry8nc4xwgpsoiifhbqotja6jfpgwtyauebyesm6j5h8fafcj9cxfpybqb3ro&ur=
l=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2RzaWMtMjAyMS8~&uid=3DMzY3MDQ2MQ~~&ucs=3D2f208=
adbb288416d7ed0ad0aa9f2bf3b).

Early submissions are greatly appreciated. A single attending author may pr=
esent a maximum of two papers onsite/online. The presentation, award submis=
sion and proceedings submission for a paper must all be in English.
You may submit your paper via DSIC 2021 Submission Form on https://ics.even=
ts/dsic-2021/ (https://email.tb.ru/ru/eu1_link_tracker?hash=3D61gpjhryrwbdj=
criep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j3=
9zsughm69zrtznswjewmbbkddeydmqxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uckn=
5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwbu9h5hc=
werw9ae6jfpgwtyauebyesm6j5h8fafcj9cxfpybqb3ro&url=3DaHR0cHM6Ly9pY3MuZXZlbnR=
zL2RzaWMtMjAyMS8~&uid=3DMzY3MDQ2MQ~~&ucs=3D2f208adbb288416d7ed0ad0aa9f2bf3b=
). Submitted papers (until 12-page limit) must comply with the requested fo=
rmat Template, be written in English, must not have been published before, =
not be under review for any other conference or publication. Authors might =
also consider running their paper through a non-original material detection=
 software such as www.turnitin.com.
All submissions will be twice =C2=ABblind=C2=BB reviewed based on relevance=
, timeliness, originality, importance and clarity of expression with convin=
cing argumentative. Besides globally relevant meetings with internationally=
 representative program/scientific committees guaranteeing a strict peer-re=
viewing and paper selection process. In case your paper=E2=80=99s acceptanc=
e you will receive a notification letter. This letter will contain your pap=
er ID that you should include in all further correspondences.

Publication and Indexation
Accepted and registered Papers will be published in the 2021 International =
Conference on Digital Science Proceeding by Springer, and then will be subm=
itted to ISI Proceedings, SCOPUS, and other indexations.
All our previous seven Proceedings have been indexed by Scopus and three of=
 seven indexed by WoS!
Due to the restrictions caused this year by COVID-19 Pandemic, correspondin=
g authors with ICCS2021 registration would have a discount of 50 USD in the=
 DSIC 2021 registration.

Important Deadlines:

01

Submission: August 11, 2021

02

Notification: September 17, 2021

03

Registration: September 23, 2021

ICCS 2021 Convener

=D0=AD=D1=82=D0=BE =D1=81=D0=BE=D0=BE=D0=B1=D1=89=D0=B5=D0=BD=D0=B8=D0=B5 =
=D0=B1=D1=8B=D0=BB=D0=BE =D0=BE=D1=82=D0=BF=D1=80=D0=B0=D0=B2=D0=BB=D0=B5=
=D0=BD=D0=BE jailhouse-dev@googlegroups.com =D0=BE=D1=82:
Tatiana Antipova | smart@digscience.org
=D0=9E=D1=82=D0=BF=D0=B8=D1=81=D0=B0=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =
=D1=80=D0=B0=D1=81=D1=81=D1=8B=D0=BB=D0=BA=D0=B8 (https://email.tb.ru/ru/eu=
1_unsubscribe?hash=3D6xjbdn4nxan64snq4nktinga1955tf96h5x58wx7kshzfpnytry4dh=
oop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydmqxamichfchr5=
do6pkao69eehia1e3fumjd7uazpc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m=
14x4ct8rbcwoi743ehtry8nc4xw8z1ju83gd5djxz89u8mntsd9eizs97jsrbddbegx1t8t75zc=
ggi8gaj7gn58xbrmsd6hiaeypwqkmptoscdrr3s31km5xerz8owr5mkykejzs8bwembsu5jy36f=
haukqf6sbhia41u7p9js353ffks5qw3pzqudb85jeg8u1xc388egitkrhey49bpn5wze8fwsxw8=
y6bkrmigimno6abdt75y81kpy3ecpjwy5dxutaunmztuuxjrgu5ajwx3sdcnf4n95nfj3ojy)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1lYCzs-9E8mdi-Md%40ucs202-ucs-3.msgpanel.com.

------=_Part_1300131_668680764.1618773740568
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
t" src=3D"https://s.tb.ru/uploads/mailings/t/ced01440-4db2-4ea1-a9ab-55b54e=
72cf1f/3de8a994-b2ab-49ac-ada9-e41479bca47a.jpeg" alt=3D"text image" style=
=3D"border: 0; width: 100%; max-width: 560px; height: auto;"><!--<![endif]-=
-><!--[if (gte mso 9)|(IE)]>
                                 <img class=3D"s-image__element" width=3D"5=
60" src=3D"https://s.tb.ru/uploads/mailings/t/ced01440-4db2-4ea1-a9ab-55b54=
e72cf1f/3de8a994-b2ab-49ac-ada9-e41479bca47a.jpeg" alt=3D"text image" style=
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
ll;"></p> <![endif]--><!--[if !mso]><!-- --> <p class=3D"s-text__subtitle s=
b-break-word sb-align-center" style=3D"margin: 0; font-size: 20px; line-hei=
ght: 28px; text-align: center; word-break: break-word;"></p> <!--<![endif]-=
-></td></tr>   <tr>  <td class=3D"s-text__item  s-text__item_with-padding" =
style=3D"padding: 0; padding-top: 16px;"><!--[if (gte mso 9)|(IE)]> <p clas=
s=3D"sb-font-p1 sb-break-all sb-align-left" style=3D"margin: 0; font-size: =
16px; line-height: 24px; text-align: left; word-break: break-all;"><font st=
yle=3D"color: #c44569;">You are cordially invited to submit your full paper=
 of 6 - 12 pages.</font><br><br>The 2021 International Conference on Digita=
l Science (DSIC 2021) will be held in Luxembourg, Luxembourg, on October 15=
 =E2=80=93 17, 2021. Conference website is <a href=3D"https://ics.events/ds=
ic-2021/" target=3D"_blank" class=3D"sb-link" data-link-id=3D"0" style=3D"c=
olor: inherit; text-decoration: underline;">https://ics.events/dsic-2021/</=
a>.<br><br>Early submissions are greatly appreciated. A single attending au=
thor may present a maximum of two papers onsite/online. The presentation, a=
ward submission and proceedings submission for a paper must all be in Engli=
sh. <br>You may submit your paper via DSIC 2021 Submission Form on <a href=
=3D"https://ics.events/dsic-2021/" target=3D"_blank" class=3D"sb-link" data=
-link-id=3D"1" style=3D"color: inherit; text-decoration: underline;">https:=
//ics.events/dsic-2021/</a>. Submitted papers (until 12-page limit) must co=
mply with the requested format Template, be written in English, must not ha=
ve been published before, not be under review for any other conference or p=
ublication. Authors might also consider running their paper through a non-o=
riginal material detection software such as www.turnitin.com. <br>All submi=
ssions will be twice =C2=ABblind=C2=BB reviewed based on relevance, timelin=
ess, originality, importance and clarity of expression with convincing argu=
mentative. Besides globally relevant meetings with internationally represen=
tative program/scientific committees guaranteeing a strict peer-reviewing a=
nd paper selection process. In case your paper=E2=80=99s acceptance you wil=
l receive a notification letter. This letter will contain your paper ID tha=
t you should include in all further correspondences.<br><br><br><b><font st=
yle=3D"color: #c44569;">Publication and Indexation</font></b><br>Accepted a=
nd registered Papers will be published in the 2021 International Conference=
 on Digital Science Proceeding by <b><font style=3D"color: #c44569;">Spring=
er</font></b>, and then will be submitted to <b><font style=3D"color: #f190=
66;">ISI Proceedings, SCOPUS</font></b>, and other indexations.<br><b><font=
 style=3D"color: #c44569;">All our previous seven Proceedings have been ind=
exed by Scopus and three of seven indexed by WoS!</font></b><br>Due to the =
restrictions caused this year by COVID-19 Pandemic, corresponding authors w=
ith ICCS2021 registration would have a <b><font style=3D"color: #c44569;">d=
iscount of 50 USD</font></b> in the DSIC 2021 registration.<br></p> <![endi=
f]--><!--[if !mso]><!-- --> <p class=3D"sb-font-p1 sb-break-word sb-align-l=
eft" style=3D"margin: 0; font-size: 16px; line-height: 24px; text-align: le=
ft; word-break: break-word;"><font style=3D"color: #c44569;">You are cordia=
lly invited to submit your full paper of 6 - 12 pages.</font><br><br>The 20=
21 International Conference on Digital Science (DSIC 2021) will be held in =
Luxembourg, Luxembourg, on October 15 =E2=80=93 17, 2021. Conference websit=
e is <a href=3D"https://email.tb.ru/ru/eu1_link_tracker?hash=3D6r6fphewqpce=
qqriep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j=
39zsughm69zrtznswjewmbbkddeydmqxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uck=
n5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwgpsoii=
fhbqotja6jfpgwtyauebyesm6j5h8fafcj9cxfpybqb3ro&url=3DaHR0cHM6Ly9pY3MuZXZlbn=
RzL2RzaWMtMjAyMS8~&uid=3DMzY3MDQ2MQ~~&ucs=3D2f208adbb288416d7ed0ad0aa9f2bf3=
b" target=3D"_blank" class=3D"sb-link" data-link-id=3D"0" style=3D"color: i=
nherit; text-decoration: underline;">https://ics.events/dsic-2021/</a>.<br>=
<br>Early submissions are greatly appreciated. A single attending author ma=
y present a maximum of two papers onsite/online. The presentation, award su=
bmission and proceedings submission for a paper must all be in English. <br=
>You may submit your paper via DSIC 2021 Submission Form on <a href=3D"http=
s://email.tb.ru/ru/eu1_link_tracker?hash=3D61gpjhryrwbdjcriep6ujhqbzhz5tf96=
h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjew=
mbbkddeydmqxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uckn5pk34xmhosu17x5pci8=
1kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwbu9h5hcwerw9ae6jfpgwtyaueb=
yesm6j5h8fafcj9cxfpybqb3ro&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2RzaWMtMjAyMS8~&u=
id=3DMzY3MDQ2MQ~~&ucs=3D2f208adbb288416d7ed0ad0aa9f2bf3b" target=3D"_blank"=
 class=3D"sb-link" data-link-id=3D"1" style=3D"color: inherit; text-decorat=
ion: underline;">https://ics.events/dsic-2021/</a>. Submitted papers (until=
 12-page limit) must comply with the requested format Template, be written =
in English, must not have been published before, not be under review for an=
y other conference or publication. Authors might also consider running thei=
r paper through a non-original material detection software such as www.turn=
itin.com. <br>All submissions will be twice =C2=ABblind=C2=BB reviewed base=
d on relevance, timeliness, originality, importance and clarity of expressi=
on with convincing argumentative. Besides globally relevant meetings with i=
nternationally representative program/scientific committees guaranteeing a =
strict peer-reviewing and paper selection process. In case your paper=E2=80=
=99s acceptance you will receive a notification letter. This letter will co=
ntain your paper ID that you should include in all further correspondences.=
<br><br><br><b><font style=3D"color: #c44569;">Publication and Indexation</=
font></b><br>Accepted and registered Papers will be published in the 2021 I=
nternational Conference on Digital Science Proceeding by <b><font style=3D"=
color: #c44569;">Springer</font></b>, and then will be submitted to <b><fon=
t style=3D"color: #f19066;">ISI Proceedings, SCOPUS</font></b>, and other i=
ndexations.<br><b><font style=3D"color: #c44569;">All our previous seven Pr=
oceedings have been indexed by Scopus and three of seven indexed by WoS!</f=
ont></b><br>Due to the restrictions caused this year by COVID-19 Pandemic, =
corresponding authors with ICCS2021 registration would have a <b><font styl=
e=3D"color: #c44569;">discount of 50 USD</font></b> in the DSIC 2021 regist=
ration.<br></p> <!--<![endif]--></td></tr>   </table></td></tr></table></di=
v>  </td></tr></table>=20
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
bmission: August&nbsp;11, 2021</font></b></p> <![endif]--><!--[if !mso]><!-=
- --> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; fo=
nt-size: 20px; line-height: 28px; text-align: left;"><b><font style=3D"colo=
r: #c44569;">Submission: August&nbsp;11, 2021</font></b></p> <!--<![endif]-=
-></td></tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__text-=
row_with-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso =
9)|(IE)]> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-ali=
gn-left" style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: =
20px; text-align: left; word-break: break-all;"></p> <![endif]--><!--[if !m=
so]><!-- --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" s=
tyle=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text=
-align: left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table><=
/div><!--[if (gte mso 9)|(IE)]>
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
tification: 	September 17, 2021</font></b></p> <![endif]--><!--[if !mso]><!=
-- --> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; f=
ont-size: 20px; line-height: 28px; text-align: left;"><b><font style=3D"col=
or: #c44569;">Notification: 	September 17, 2021</font></b></p> <!--<![endif=
]--></td></tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__tex=
t-row_with-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte ms=
o 9)|(IE)]> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-a=
lign-left" style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height=
: 20px; text-align: left; word-break: break-all;"></p> <![endif]--><!--[if =
!mso]><!-- --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left"=
 style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; te=
xt-align: left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table=
></div><!--[if (gte mso 9)|(IE)]>
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
gistration:	September 23, 2021</font></b></p> <![endif]--><!--[if !mso]><!-=
- --> <p class=3D"s-advantages__title sb-align-left" style=3D"margin: 0; fo=
nt-size: 20px; line-height: 28px; text-align: left;"><b><font style=3D"colo=
r: #c44569;">Registration:	September 23, 2021</font></b></p> <!--<![endif]-=
-></td></tr>   <tr><td class=3D"s-advantages__text-row  s-advantages__text-=
row_with-padding" style=3D"padding: 0; padding-top: 8px;"><!--[if (gte mso =
9)|(IE)]> <p class=3D"s-advantages__subtitle sb-font-p2 sb-break-all sb-ali=
gn-left" style=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: =
20px; text-align: left; word-break: break-all;"></p> <![endif]--><!--[if !m=
so]><!-- --> <p class=3D"s-advantages__subtitle sb-font-p2 sb-align-left" s=
tyle=3D"margin: 0; color: #959ba4; font-size: 14px; line-height: 20px; text=
-align: left;"></p> <!--<![endif]--></td></tr>  </table></td></tr></table><=
/div><!--[if (gte mso 9)|(IE)]>
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
email.tb.ru/ru/eu1_link_tracker?hash=3D61n6gk9rwuksphriep6ujhqbzhz5tf96h5x5=
8wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbk=
ddeydmqxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uckn5pk34xmhosu17x5pci81kjt=
1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xw8frmiyipuzji38ppp7ctee39hdwgca=
3fnhj8ztej9cxfpybqb3ro&url=3DaHR0cHM6Ly9pY3MuZXZlbnRz&uid=3DMzY3MDQ2MQ~~&uc=
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
    Tatiana Antipova | smart@digscience.org <br/>
    <a href=3D"https://email.tb.ru/ru/eu1_unsubscribe?hash=3D6xjbdn4nxan64s=
nq4nktinga1955tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39=
zsughm69zrtznswjewmbbkddeydmqxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uckn5=
pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xw8z1ju83g=
d5djxz89u8mntsd9eizs97jsrbddbegx1t8t75zcggi8gaj7gn58xbrmsd6hiaeypwqkmptoscd=
rr3s31km5xerz8owr5mkykejzs8bwembsu5jy36fhaukqf6sbhia41u7p9js353ffks5qw3pzqu=
db85jeg8u1xc388egitkrhey49bpn5wze8fwsxw8y6bkrmigimno6abdt75y81kpy3ecpjwy5dx=
utaunmztuuxjrgu5ajwx3sdcnf4n95nfj3ojy" style=3D"color: black;">=D0=9E=D1=82=
=D0=BF=D0=B8=D1=81=D0=B0=D1=82=D1=8C=D1=81=D1=8F =D0=BE=D1=82 =D1=80=D0=B0=
=D1=81=D1=81=D1=8B=D0=BB=D0=BA=D0=B8</a>
 </span>
</td></tr></table><center><table><tr><td><img src=3D"https://email.tb.ru/ru=
/eu1_read_tracker/3670461?hash=3D6xdrtgf9bbptw8pqa78tagai94u5tf96h5x58wx7ks=
hzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydm=
qxamichfchr5do6pkao69eehia1e3fumjd7uazpc57uckn5pk34xmhosu17x5pci81kjt1ns1fu=
3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwdxkkiknw7ibbneex1z5cg3zmec" width=3D=
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
om/d/msgid/jailhouse-dev/E1lYCzs-9E8mdi-Md%40ucs202-ucs-3.msgpanel.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/E1lYCzs-9E8mdi-Md%40ucs202-ucs-3.msgpanel.com</a>.<br />

------=_Part_1300131_668680764.1618773740568--

--MWxZQ3pzLTlFOG1kaS1NZA==--
