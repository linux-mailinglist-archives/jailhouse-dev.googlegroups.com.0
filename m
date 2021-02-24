Return-Path: <jailhouse-dev+bncBAABBQ5C3CAQMGQEFFFZZ4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B8513238D6
	for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Feb 2021 09:41:40 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id z22sf536042lfd.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 24 Feb 2021 00:41:40 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1614156099; cv=pass;
        d=google.com; s=arc-20160816;
        b=sugs0T2Id3dyCgTnTgPP2zV8COPFlL59pVW8wn7s6OWZkmE4VKJxX1xJN0zwfuGoFv
         NN/qk55JZDwqooA5Fr+NfdfSr58BfglhOeYL2ArAyQzYlZIluMyfi2d5jsvPof/SeQV+
         P8FnjfTtCNnXIibWe39Wjei7oQ7LM9GYoaYihTFu+/HuCnrHx+8ZUx8iyX8XU3I1lt+T
         Lwj1yNeUXc/F/c9I92BQCyYGlYHlkUcKgNDLnEUc1cM1Uy6tM+O2dZB+3nEJq+PNk85P
         O/UjXhuUxBoOyt1nCm2LSW7Hk243HSVesZxl+fTTDxNrM1AOcnoKE8dcAJ2AAyJ0VY/2
         aPAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:date:list-unsubscribe:mime-version:subject
         :message-id:to:from:sender:dkim-signature;
        bh=IzqunXMqhQ0E8pPhRmWAul8/m8qE4ir+Vj06v6PA1u8=;
        b=C1EJYCanljjpFYKSLuzHd9Bo4nq+ib/rrkJhGdx/bNG/z2AbNL6eMEycKu8QKsgXur
         Kt+8uzn4rNovnSpPUws+LSsWtR9MViU8v0G53rek/hZpRblBSjzmIA5BBnEEC4uBUfLM
         QKbs/Ic00+0h8gVFXyIES2UzIMTG84lurMulgKbjRF6i0l2xAWScJhjori+y3qr70NWG
         HZo2Qqc+Zubnm5B+tBBQ10Um0TVHk4PJ4HE89/A3CdjPKA3vJ5n06KKgwY+dsGJZG4pm
         FmsW7+zM4kYMhK0xoXpGXv9sVr5nzbNBz4SziaseRB5FWHGWsarTE25D1VmnLm7KHW83
         gr0Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=TopUL8HB;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=hyzUu3Oj;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:message-id:subject:mime-version:list-unsubscribe
         :date:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=IzqunXMqhQ0E8pPhRmWAul8/m8qE4ir+Vj06v6PA1u8=;
        b=NXp1RfpsnE+d0c285CbJNsVWqdGqaW96+ohtPENQTGvPdfPQm/JofJcKW+T4vaNsPs
         BPRaL1fwTSBpAplc6Mvc6w7AWltljz5XQVFqturaPtn5tkURLvIaROF7tK0WL2IWcu/D
         V50KbvWdiP3h6Z0l9WVwhZRNvMf4MZx+RYiXgoakJfn0UIScrQY/5m3t3VCW5Nin0ys1
         5zLgdv29iMumSbgWKPni/GbNsIz0REsxb0Wgwnlk/ogQ06CoEdD5z20pJ7h+ZDslw0Sb
         +RYbkbRgUe95qjr7dzyhZz631ANBXXnJBDULD50o5mCyIJ+Y65uvrjIujuuc7hrTVriR
         OhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:message-id:subject:mime-version
         :list-unsubscribe:date:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=IzqunXMqhQ0E8pPhRmWAul8/m8qE4ir+Vj06v6PA1u8=;
        b=kmk34SPzcyuNA0Hri/nJCU/jqVz4pPr4QwwCNeTOTj/bj2ppvW+3mDHPupVj8HC1vE
         GQ5obe6wf4EweQ8fL690UUM+zvgFrmBE2lZbVAlDmUjtdNICTWAEk+IDYawvuMTzA9tG
         IqO+CM8LKYVuGVGlB1Uk/PJ9HJPgFRWhWMtyvELJ4mRwq/MXXRcI5aHjj4COO0gg8K9r
         q3n1WqSdB2FYqoSqBi6qMTaSfu+1UDI4jdbbxR6EoNWfJ7ZU3VB+hjPaUa4Xo+t0jd+4
         5W+BuY/l+JLVepHz0cLXeWtSqcQRgtleP4TvBxUBDuxarUzNdnOJ+X6Zksb4HZ3G2FJz
         PTrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5327BYb8sZDFKtjz40BS1pulsYQzbp9yst8hmHQtjKB06TB+SE7z
	2q9K4SkvprQ2BGqTTPYGkz8=
X-Google-Smtp-Source: ABdhPJziefd4hMwN9+Dw2XGf6WPBQyoAtEwoQpYSDzW4e/XrxwvD4/FReDsh3UfN7nLZf+K1M2eC3g==
X-Received: by 2002:a2e:8e6e:: with SMTP id t14mr1829712ljk.23.1614156099356;
        Wed, 24 Feb 2021 00:41:39 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b4d1:: with SMTP id r17ls238241ljm.10.gmail; Wed, 24 Feb
 2021 00:41:38 -0800 (PST)
X-Received: by 2002:a2e:505d:: with SMTP id v29mr18256878ljd.393.1614156098418;
        Wed, 24 Feb 2021 00:41:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614156098; cv=none;
        d=google.com; s=arc-20160816;
        b=YFSRAN24CpiSxcV+7yl/Zu24nptSMbDc/x00C1z5yx+/oGE+mojfP00n4quH3PVrCJ
         WmT28EdNsdbjI1GGJWzFaW3rHSb++9IyANdnMHjR1D2+bwdoX0hWT4OOe6m6+sl7mkzY
         gDzIyQ3rNINWxAEJlIF4jp4eFkX7pbbtGVAaD+gZfNh3EyyhSd9tuA5P3F/ZGP9TbZXU
         Qm2DH88/lpPC8UZ3z9ulLGoyxrl2QAiK/IT/NqVpGl+lX0NwQWqABB/LKqsNbw0Uqesv
         uiytTLRkZVJU7ApmyfaANQ52NDhwxzEbmk6QHiAxATLd6Q9hNEgUm5vwg7XaR24CSVv1
         3iCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=date:list-unsubscribe:mime-version:subject:message-id:to:from
         :dkim-signature:dkim-signature;
        bh=2Rhw7R1K90GSbbT3mzz4NxpaMRwiHGEgWtJrZi50RTI=;
        b=mboQsPGkNW2UOMFm8U0dWvjAGflIIgp/KxULTjHn+8xL1IRoMKihJ821gOxl+3j+n5
         a2wRZ/MqFvVcNc6y/U3wNKs6dsghnQtXB9i87qWTMehi8EJCEG7eSmDO4xaxB352OAE3
         JCpCZcYhckptUcYu4nIikHwaeKYdiPDbl4byKnsxLscop9HzQJFYX+mFQbKPe8OexlKN
         ydip5W+qaIN2ROJ9YYfPYVBootBNoTFaZHhMxAwbnH1OWtWbKkr8zScjCUVICfKlzUKY
         yDG65eLf+cAJddu8B451QxjFn2EWxzmmdU/y5gUNCRUpMZ0SEsEorVO9l0gQLe3zTH7P
         kddg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@digscience.org header.s=us header.b=TopUL8HB;
       dkim=pass header.i=@topeml.com header.s=jul2015 header.b=hyzUu3Oj;
       spf=pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) smtp.mailfrom=postman3670461@email.tb.ru;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=digscience.org
Received: from smtp1.email.tb.ru (smtp1.email.tb.ru. [185.147.82.156])
        by gmr-mx.google.com with ESMTP id a26si62900lff.2.2021.02.24.00.41.38
        for <jailhouse-dev@googlegroups.com>;
        Wed, 24 Feb 2021 00:41:38 -0800 (PST)
Received-SPF: pass (google.com: domain of postman3670461@email.tb.ru designates 185.147.82.156 as permitted sender) client-ip=185.147.82.156;
Received: by smtp1.email.tb.ru id h6o8k42erpkd for <jailhouse-dev@googlegroups.com>; Wed, 24 Feb 2021 08:41:37 +0000 (envelope-from <postman3670461@email.tb.ru>)
From: "John Dreamer" <smart@digscience.org>
To: jailhouse-dev@googlegroups.com
Message-Id: <E1lEpjl-eBwrOT-MZ@ucs203-ucs-13.msgpanel.com>
Subject: 8th Conference with Springer. Scopus, WoS Indexation - Deadline
 EXTENDED - March 10, 2021
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="MWxFcGpsLWVCd3JPVC1NWg=="
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
X-Complaints-To: abuse@email.tb.ru
X-EnvId: eu1production.tr_3670461:1lEpjh-00001w-GUuT:1_amFpbGhvdXNlLWRldkBnb29nbGVncm91cHMuY29t_2_3027617
X-Feedback-ID: 3670461:transact:UO
X-ReplyTo: smart@digscience.org
Date: Wed, 24 Feb 2021 08:41:37 +0000
X-Original-Sender: smart@digscience.org
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@digscience.org header.s=us header.b=TopUL8HB;       dkim=pass
 header.i=@topeml.com header.s=jul2015 header.b=hyzUu3Oj;       spf=pass
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

--MWxFcGpsLWVCd3JPVC1NWg==
Content-Type: multipart/alternative; 
	boundary="----=_Part_222668_1878947493.1614156097969"

------=_Part_222668_1878947493.1614156097969
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Author,

The submission deadline has been extended till
10th March 2021 as we understand many are facing unexpected challenges at t=
his time.
Grab the opportunity to submit your full research paper of 6 - 12 pages.

The 2021 International Conference on Comprehensible Science (ICCS 2021) wil=
l be held in Eilat, Israel, on June 18-20, 2021. Conference website is http=
s://ics.events/iccs-2021/ (https://email.tb.ru/ru/eu1_link_tracker?hash=3D6=
tw14x9o8fz18yriep6ujhqbzhz5tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmih=
ruycqwb599j39zsughm69zrtznswjewmbbkddeydyrwa7f9cqe1eib7sce5aaze8otfh4ohtfn1=
eti8pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8=
nc4xwgpsoiifhbqotjzd4saxh9wo819uma4n888b6rchqw6b7sxqk78pc&url=3DaHR0cHM6Ly9=
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

Submission: February 21, March 10 2021

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
1_unsubscribe?hash=3D6eyp5h4rbs9usenq4nktinga1955tf96h5x58wx7kshzfpnytry4dh=
oop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydyrwa7f9cqe1ei=
b7sce5aaze8otfh4ohtfn1eti8pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m=
14x4ct8rbcwoi743ehtry8nc4xwfh1u3bqzxfmddqfmsx5hbh6th7ybhawoxweajcatehbkdbib=
rp5u67rqxst6o58tjb753gj37gf4ocffy3ckufwmdzwzj85h9jm3ffgpqfdh857mhtyqoz748ho=
qnzcdrdqxaqmrj8e1arg85dyxkgg4z7k19pq6xtwg5gxjoc4dbnp3qa5nuinxw435bcondqjpwp=
kqcdtanfcyi8ra735bxb8kxy658zfquss)

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/E1lEpjl-eBwrOT-MZ%40ucs203-ucs-13.msgpanel.com.

------=_Part_222668_1878947493.1614156097969
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
ll;"><b><font style=3D"color: #574b90;"><font style></font>The submission d=
eadline has been extended till <br>10th March 2021 as we understand many ar=
e facing unexpected challenges at this time.<br>Grab the opportunity to sub=
mit your full research paper of 6 - 12 pages.</font></b><br><b><font style=
=3D"color: #904b90;"></font></b></p> <![endif]--><!--[if !mso]><!-- --> <p =
class=3D"s-text__subtitle sb-break-word sb-align-center" style=3D"margin: 0=
; font-size: 20px; line-height: 28px; text-align: center; word-break: break=
-word;"><b><font style=3D"color: #574b90;"><font style></font>The submissio=
n deadline has been extended till <br>10th March 2021 as we understand many=
 are facing unexpected challenges at this time.<br>Grab the opportunity to =
submit your full research paper of 6 - 12 pages.</font></b><br><b><font sty=
le=3D"color: #904b90;"></font></b></p> <!--<![endif]--></td></tr>   <tr>  <=
td class=3D"s-text__item  s-text__item_with-padding" style=3D"padding: 0; p=
adding-top: 16px;"><!--[if (gte mso 9)|(IE)]> <p class=3D"sb-font-p1 sb-bre=
ak-all sb-align-left" style=3D"margin: 0; font-size: 16px; line-height: 24p=
x; text-align: left; word-break: break-all;">The 2021 International Confere=
nce on Comprehensible Science (ICCS 2021) will be held in Eilat, Israel, on=
 June 18-20, 2021. Conference website is <font color=3D"#546de5"><a href=3D=
"https://ics.events/iccs-2021/" target=3D"_blank" class=3D"sb-link" data-li=
nk-id=3D"0" style=3D"color: inherit; text-decoration: underline;">https://i=
cs.events/iccs-2021/</a></font>.<br>Early submissions are greatly appreciat=
ed. A single attending author may present a maximum of two papers onsite/on=
line. The presentation, award submission and proceedings submission for a p=
aper must all be in English. <br>You may submit your paper online via Onlin=
e Submission and Review System. Submitted papers (until 12-page limit) must=
 comply with the requested format Template, be written in English, must not=
 have been published before, not be under review for any other conference o=
r publication. Authors might also consider running their paper through an u=
noriginal text detection software such as www.turnitin.com. <br>All submiss=
ions will be twice =C2=ABblind=C2=BB reviewed based on relevance, timelines=
s, originality, importance and clarity of expression with convincing argume=
ntative. Besides globally relevant meetings with internationally representa=
tive program/scientific committees guaranteeing a strict peer-reviewing and=
 paper selection process. After that you will receive an email notification=
 containing an acceptance or rejection letter. This letter will contain a s=
ubmission number that you should include in all further correspondences.<br=
><br><b><font style=3D"color: #c44569;">Publication and Indexation</font></=
b><br>Accepted and registered Papers will be published in the 2021 Internat=
ional Conference on Comprehensible Science Proceeding by <b><font style=3D"=
color: #c44569;">Springer in a book of the Lecture Notes in Networks and Sy=
stems</font></b> series, and then will be submitted to <b><font style=3D"co=
lor: #f19066;">ISI Proceedings, SCOPUS</font></b>, and other indexations.<b=
r><br>We are prepared to offer virtual participation options, for anyone wh=
o cannot or chooses not to travel due to the situation regarding COVID-19. =
Due to the restrictions caused this year by COVID-19 Pandemic, correspondin=
g authors with registration in ICADS2021 will have a <b><font style=3D"colo=
r: #c44569;">discount of 50 USD</font></b> in the ICCS 2021 registration.<b=
r></p> <![endif]--><!--[if !mso]><!-- --> <p class=3D"sb-font-p1 sb-break-w=
ord sb-align-left" style=3D"margin: 0; font-size: 16px; line-height: 24px; =
text-align: left; word-break: break-word;">The 2021 International Conferenc=
e on Comprehensible Science (ICCS 2021) will be held in Eilat, Israel, on J=
une 18-20, 2021. Conference website is <font color=3D"#546de5"><a href=3D"h=
ttps://email.tb.ru/ru/eu1_link_tracker?hash=3D6tw14x9o8fz18yriep6ujhqbzhz5t=
f96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznsw=
jewmbbkddeydyrwa7f9cqe1eib7sce5aaze8otfh4ohtfn1eti8pc57uckn5pk34xmhosu17x5p=
ci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwgpsoiifhbqotjzd4saxh9wo=
819uma4n888b6rchqw6b7sxqk78pc&url=3DaHR0cHM6Ly9pY3MuZXZlbnRzL2ljY3MtMjAyMS8=
~&uid=3DMzY3MDQ2MQ~~&ucs=3D875aa839861819b946ca64157ac91752" target=3D"_bla=
nk" class=3D"sb-link" data-link-id=3D"0" style=3D"color: inherit; text-deco=
ration: underline;">https://ics.events/iccs-2021/</a></font>.<br>Early subm=
issions are greatly appreciated. A single attending author may present a ma=
ximum of two papers onsite/online. The presentation, award submission and p=
roceedings submission for a paper must all be in English. <br>You may submi=
t your paper online via Online Submission and Review System. Submitted pape=
rs (until 12-page limit) must comply with the requested format Template, be=
 written in English, must not have been published before, not be under revi=
ew for any other conference or publication. Authors might also consider run=
ning their paper through an unoriginal text detection software such as www.=
turnitin.com. <br>All submissions will be twice =C2=ABblind=C2=BB reviewed =
based on relevance, timeliness, originality, importance and clarity of expr=
ession with convincing argumentative. Besides globally relevant meetings wi=
th internationally representative program/scientific committees guaranteein=
g a strict peer-reviewing and paper selection process. After that you will =
receive an email notification containing an acceptance or rejection letter.=
 This letter will contain a submission number that you should include in al=
l further correspondences.<br><br><b><font style=3D"color: #c44569;">Public=
ation and Indexation</font></b><br>Accepted and registered Papers will be p=
ublished in the 2021 International Conference on Comprehensible Science Pro=
ceeding by <b><font style=3D"color: #c44569;">Springer in a book of the Lec=
ture Notes in Networks and Systems</font></b> series, and then will be subm=
itted to <b><font style=3D"color: #f19066;">ISI Proceedings, SCOPUS</font><=
/b>, and other indexations.<br><br>We are prepared to offer virtual partici=
pation options, for anyone who cannot or chooses not to travel due to the s=
ituation regarding COVID-19. Due to the restrictions caused this year by CO=
VID-19 Pandemic, corresponding authors with registration in ICADS2021 will =
have a <b><font style=3D"color: #c44569;">discount of 50 USD</font></b> in =
the ICCS 2021 registration.<br></p> <!--<![endif]--></td></tr>   </table></=
td></tr></table></div>  </td></tr></table>=20
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
bmission: 	<strike>February 21</strike>, March 10 2021</font></b></p> <![en=
dif]--><!--[if !mso]><!-- --> <p class=3D"s-advantages__title sb-align-left=
" style=3D"margin: 0; font-size: 20px; line-height: 28px; text-align: left;=
"><b><font style=3D"color: #c44569;">Submission: 	<strike>February 21</stri=
ke>, March 10 2021</font></b></p> <!--<![endif]--></td></tr>   <tr><td clas=
s=3D"s-advantages__text-row  s-advantages__text-row_with-padding" style=3D"=
padding: 0; padding-top: 8px;"><!--[if (gte mso 9)|(IE)]> <p class=3D"s-adv=
antages__subtitle sb-font-p2 sb-break-all sb-align-left" style=3D"margin: 0=
; color: #959ba4; font-size: 14px; line-height: 20px; text-align: left; wor=
d-break: break-all;"></p> <![endif]--><!--[if !mso]><!-- --> <p class=3D"s-=
advantages__subtitle sb-font-p2 sb-align-left" style=3D"margin: 0; color: #=
959ba4; font-size: 14px; line-height: 20px; text-align: left;"></p> <!--<![=
endif]--></td></tr>  </table></td></tr></table></div><!--[if (gte mso 9)|(I=
E)]>
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
email.tb.ru/ru/eu1_link_tracker?hash=3D64d3n5onj8tr7hriep6ujhqbzhz5tf96h5x5=
8wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbk=
ddeydyrwa7f9cqe1eib7sce5aaze8otfh4ohtfn1eti8pc57uckn5pk34xmhosu17x5pci81kjt=
1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwbu9h5hcwerw9a8ppp7ctee39hdcauy=
5khjgmnckqw6b7sxqk78pc&url=3DaHR0cHM6Ly9pY3MuZXZlbnRz&uid=3DMzY3MDQ2MQ~~&uc=
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
    <a href=3D"https://email.tb.ru/ru/eu1_unsubscribe?hash=3D6eyp5h4rbs9use=
nq4nktinga1955tf96h5x58wx7kshzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39=
zsughm69zrtznswjewmbbkddeydyrwa7f9cqe1eib7sce5aaze8otfh4ohtfn1eti8pc57uckn5=
pk34xmhosu17x5pci81kjt1ns1fu3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwfh1u3bqz=
xfmddqfmsx5hbh6th7ybhawoxweajcatehbkdbibrp5u67rqxst6o58tjb753gj37gf4ocffy3c=
kufwmdzwzj85h9jm3ffgpqfdh857mhtyqoz748hoqnzcdrdqxaqmrj8e1arg85dyxkgg4z7k19p=
q6xtwg5gxjoc4dbnp3qa5nuinxw435bcondqjpwpkqcdtanfcyi8ra735bxb8kxy658zfquss" =
style=3D"color: black;">=D0=9E=D1=82=D0=BF=D0=B8=D1=81=D0=B0=D1=82=D1=8C=D1=
=81=D1=8F =D0=BE=D1=82 =D1=80=D0=B0=D1=81=D1=81=D1=8B=D0=BB=D0=BA=D0=B8</a>
 </span>
</td></tr></table><center><table><tr><td><img src=3D"https://email.tb.ru/ru=
/eu1_read_tracker/3670461?hash=3D6ddqujjpzwpx7xpqa78tagai94u5tf96h5x58wx7ks=
hzfpnytry4dhoop9cuqfrqi4xob588fmihruycqwb599j39zsughm69zrtznswjewmbbkddeydy=
rwa7f9cqe1eib7sce5aaze8otfh4ohtfn1eti8pc57uckn5pk34xmhosu17x5pci81kjt1ns1fu=
3fwgs8pyrs6m14x4ct8rbcwoi743ehtry8nc4xwdxkkiknw7ibbncuec7dbcew6ic" width=3D=
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
om/d/msgid/jailhouse-dev/E1lEpjl-eBwrOT-MZ%40ucs203-ucs-13.msgpanel.com?utm=
_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jail=
house-dev/E1lEpjl-eBwrOT-MZ%40ucs203-ucs-13.msgpanel.com</a>.<br />

------=_Part_222668_1878947493.1614156097969--

--MWxFcGpsLWVCd3JPVC1NWg==--
