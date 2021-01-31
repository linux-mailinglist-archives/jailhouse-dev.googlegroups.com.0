Return-Path: <jailhouse-dev+bncBAABBZ7S3OAAMGQEFOBH6BA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D92309E37
	for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Jan 2021 19:39:36 +0100 (CET)
Received: by mail-wr1-x437.google.com with SMTP id h17sf4231711wrv.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 31 Jan 2021 10:39:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1612118375; cv=pass;
        d=google.com; s=arc-20160816;
        b=yKFYpRd+Momr+nql4KyfD55S0wsMpFe36C1prVdgdLFh/SjF2KUjxJMjcqnTedNSJn
         nHIlCw51CfKqoBoxXCq9yWCKpV4h4kwizvYqxRybKdYnS1cCu05cXM8jyDnm6NlZs6Be
         04Hk4QTay6z1pLPMgM7DbTxgeDLyT9/tAXH8nSvsi3tHfr5nXIAoT9J+HVgr2xgUyO36
         Kn/3RhMAPbxLXwwTvW3/1lDYih9BI1bbyZ2zkbOtfT/LM77EJunu3V3M8kbTCcI+rev8
         GHe/6CdydUAYsX3/eUcU6vpRg8B3IyOnZBK+t4qpD+ScciMasfl9UbL2354eSQQwcu/J
         TY+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=PF5ZDgDBLX/hj/aKcAQ27lSMPChXyaqJQROwcPT1lsQ=;
        b=PEeo6eXghzAonC3nmZWN7cnmgC5qRv9KvblF5a6lC7vrWWyxT8X26c/zqsrBDUfSXW
         RCq5tfCKcPUwmAoZURdeJL9LsdqyHs+FnFFLlVdQGD0Zsv8DPRS4eK0HCbyK41tZj327
         M495Z1ipnXDiCpZon8jbAi0cirxjQajbxsiWnysNC8j+yfH3IN6MgxoaFKA13nIn9E3d
         K9P7zdrC9B5U7u78ThN3svS+5IVy2UWudKR52My/sbQQWXRckJZaZQgZBwvfaDFFXcC3
         gAB7rpNg+Zf5honJBYxibOsizRLRKm1SqrNKW/uFqKi0IXJm/7yqRf2q/M8KCMx7ubfg
         nqHg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="aIId/IZC";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=PF5ZDgDBLX/hj/aKcAQ27lSMPChXyaqJQROwcPT1lsQ=;
        b=hzAJLgO9VKzWHZrxgxyEYYswC6u15lc/pNiZj+kT/RdygXqKOLV7wjRPilwVaD3OVf
         +UuxfXUDfR+JGzf3FzHC+X9MJ5ccO/mci9ayHjLuzp1aLfMkyuEI5AYaG55ajy21oMFv
         TsGKa09lVYdLm2E6W1daqPp++RykomT7UsrMdXfYBP809VUdZlVZMOiiCFryi+tq6ZfQ
         LpA0296uIK/l1+vb9Ma5/K/DzUHsvrGBIlvFWjnNSWruCWa0dMp8vSBHjMQH5z7PVL/b
         OhAggHJ2xHHNRZ0F2DLyvZRROLIOEe/fFA0dL9UqkVJEUE+V9AlrNYQYGEB/7qoNMYT+
         Dmsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=PF5ZDgDBLX/hj/aKcAQ27lSMPChXyaqJQROwcPT1lsQ=;
        b=EWVk+xxlP+U6MVO6UvYN8JtCpJE4h1sOPRy3D0IEz/Iv6Yx9gXjjc+zNFjPK5n880+
         hxeWucVCc2e8D2G05803rt3V1ASIlW296kgpGu3uVN/X0bEYJpkt8kR2j8MoaQSvWtJ6
         rWWNN6uwwrn0T0osdzzUYVrJeEvPuGoErtgxMAdG378Wcuezwsde/fIHKwtckhfEPd/k
         ft8L9/Glm7gYkqtoMl1RiwmsqcPd27lYFce58Btb2irjwYQ/EiQPJxuhAoPN+GuDV0hb
         H3yidchBIOPSxsVvr8D46ZQbenbLwBpk+d/e1HW183mIuKCC97na2s7n7hR+bm1OABOr
         uKxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wSNVW971Kq/Xd1xKY6AKPSMQ1y/YYn3NsqK1n064D3tVRsCwl
	iFzk6ZEZJ5AyWZgkVS3Fys4=
X-Google-Smtp-Source: ABdhPJziq0I6bZFDVY/2NUHKSBaY7jwPFYd4BKFPCzQdFZEooVBOSz8HbXYXl882QfhLo19PRhXLQQ==
X-Received: by 2002:adf:9e47:: with SMTP id v7mr14302019wre.185.1612118375749;
        Sun, 31 Jan 2021 10:39:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:385:: with SMTP id 127ls6693622wmd.0.canary-gmail; Sun,
 31 Jan 2021 10:39:35 -0800 (PST)
X-Received: by 2002:a05:600c:358e:: with SMTP id p14mr11755139wmq.73.1612118375005;
        Sun, 31 Jan 2021 10:39:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612118375; cv=none;
        d=google.com; s=arc-20160816;
        b=jvTj+jaGQhcZGFZSqezN8fNcvK9MiOcDe4Pf8xmgQ7Eex+NSwCHlfqQxgpvqVjY6eO
         5ByojfxB2DOfX5g5NBuC7FFJtujypO4aExsuDt/8BQrbOL0wTv709dp4s4TCe4Korc9I
         QOOuUDEKpBRQsBMOyy3YRkwiGU+S++hEXvIxEKbMQg9XPfh6c/jwIXj/newz35BjCPY0
         EJzT85HH9NSGKV9r32pI1sDrg5XkIJ+Xne6PKflkqjVtkafuefwwQl0tQIJYphTPx+kh
         apn7kSFjGh+9gPmGTX/161ruechVh1jOCZz7aO2/e0lOeTgwLa4TSx7tM3bTlE5SdIQO
         vPLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=CUqcCU4wt0x92DNsvK4981nSRfr1MMmQ4wCHm6ZvN2M=;
        b=PPwf48qp9p3YPE3ffU5xYLtYr2ymv18+yg4V2L2PXAXByBbY1bTuHImfVe2URklCFf
         F+sdKUHGOyfeo6TpgpLi75eP/q+SLhOEJpmOleyeicvyZ8OMFy7b8mcKSMWncFdG5xAU
         oPbIhfAj3wL1fkzM26N3qVszFewKSBjUlm+TUdEYVDC/fXxKKEIe+MqZ2ip0DHiy6hjE
         7S/RKoFqRu0I302FDc+iOGD/VLMi+a1E/NYIU71R6lfns7lWSO8WDL5xuEEhC5MULyas
         GHVT0GyGHEecYag+2DvtVCVOhX01bMQUpsEBERnQrgEmqbdcEsdfGP/pBp8SxD3DvDtF
         YDBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="aIId/IZC";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id m2si578411wmm.2.2021.01.31.10.39.34
        for <jailhouse-dev@googlegroups.com>;
        Sun, 31 Jan 2021 10:39:34 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id h2rsma16r3g7 for <jailhouse-dev@googlegroups.com>; Sun, 31 Jan 2021 19:39:33 +0100 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Sun, 31 Jan 2021 19:39:29 +0100
Message-ID: <57500d04020c0b0700545904040952005451070250085553030600010252070555530505030e0604515e50060557@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e5656075904030d5503
Feedback-ID: 218315:218315-40:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=40&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?UTF-8?Q?=F0=9F=A7=AE=F0=9F=91=A8=E2=80=8D=F0=9F=94=AC8th=20?=
 =?UTF-8?Q?Conference=20with=20Springer=20Publication.=20Scopus=2C=20?=
 =?UTF-8?Q?WoS=20Indexation=20|=20Deadline=20for=20papers=20?=
 =?UTF-8?Q?submission-February=2021=2C=202021?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------6016f961180cc"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@ics.events header.s=dkim header.b="aIId/IZC";       spf=softfail
 (google.com: domain of transitioning conf@ics.events does not designate
 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>

This is a multi-part message in MIME format

---------6016f961180cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=F0=9F=A7=AE=F0=9F=91=A8=E2=80=8D=F0=9F=94=AC8th Conference with Springer P=
ublication. Scopus, WoS Indexation | Deadline for papers submission-Februar=
y 21, 2021
Dear Author,=C2=A0
We hope you continue to be safe as we all work through these extraordinary =
times and

already published sixth book since 2018 - https://ics.events/past-events/.



You are cordially invited to the 2021 International Conference on Comprehen=
sible Science (ICCS 2021), to be held at in Eilat, Israel, June 18-20, 2021=
.

Conference website https://ics.events/iccs-2021/=E2=80=8B.

You may submit your paper online via Conference Submissions Form. Submitted=
 papers (until 10-12 page limit) must be written in English, must not have =
been published before, not be under review for any other conference or publ=
ication, must comply with Template in .doc/docx format.

All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.

Accepted and registered Papers will be published in ICCS 2021 Proceeding by=
 Springer in a book of the  the Lecture Notes in Networks and Systems serie=
s=C2=A0(included in Scopus source list, Q4), and then will be submitted to =
ISI Proceedings, SCOPUS, and other indexations.


We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.

Due to the restrictions caused this year by COVID-19 Pandemic, authors with=
 registration in ICADS 2021 will have a discount of 50 USD in the ICCS 2021=
 registration.

=C2=A0
Important Deadlines

Submission: =C2=A0=C2=A0 February 21, 2021

Notification: =C2=A0 March 30, 2021

Registration:=C2=A0 =C2=A0April=C2=A021, 2021

Event Dates:=C2=A0=C2=A0 June 18-20, 2021

=C2=A0

ICCS 2021 Organizer.
https://ics.events/.

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/57500d04020c0b07005459040409520054510702500855530306000102520=
70555530505030e0604515e50060557%40ics_ip-zone_com-6.

---------6016f961180cc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=F0=9F=A7=AE=F0=9F=91=A8=E2=80=8D=F0=9F=94=AC8th Conferenc=
e with Springer Publication. Scopus, WoS Indexation | Deadline for papers s=
ubmission-February 21, 2021</title></head><body>
<div style=3D"text-align: center;"><span style=3D"font-size:22px;"><span st=
yle=3D"color:#ff0099;"><strong>Dear Author,</strong></span></span>=C2=A0<br=
><span style=3D"font-size:20px;"><strong>We hope you continue to be safe as=
 we all work through these extraordinary times and<br>
already published <span style=3D"color:#FF0000;">sixth</span> book since 20=
18</strong> - <a href=3D"http://ics.mailrelay-v.com/newslink/402862/21.html=
">https://ics.events/past-events/</a>.</span></div>

<div><img alt=3D"" src=3D"http://ics.ip-zone.com/mailing-manager/domains/ic=
s_ip-zone_com/files/img//sixbooksjpg.jpg" style=3D"width: 282px; height: 28=
0px;" width=3D"282" height=3D"280"></div>

<div style=3D"text-align: center;"><span style=3D"font-size:20px;"><strong>=
<span style=3D"color:#FF0000;">You are cordially invited</span> to</strong>=
 the 2021 International Conference on Comprehensible Science (<strong>ICCS =
2021)</strong>, to be held at <strong style=3D"box-sizing: inherit; color: =
rgb(64, 64, 64); font-family: Ubuntu, Tahoma, Arial; font-size: 17px; text-=
align: justify; background-color: rgb(255, 255, 255);">in Eilat, Israel, Ju=
ne 18-20, 2021.</strong></span></div>

<div style=3D"text-align: center;"><span style=3D"font-size:20px;">Conferen=
ce website <strong><a href=3D"http://ics.mailrelay-v.com/newslink/402862/26=
.html">https://ics.events/iccs-2021/=E2=80=8B</a>.</strong></span></div>

<div><span style=3D"font-size:20px;">You may submit your paper online via C=
onference Submissions Form. Submitted papers (until 10-12 page limit) must =
be written in English, must not have been published before, not be under re=
view for any other conference or publication, must comply with <a href=3D"h=
ttp://ics.mailrelay-v.com/newslink/402862/14.html" target=3D"_blank"><stron=
g>Template</strong></a> in <strong>.doc/docx</strong> format.<br>
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.<br>
Accepted and registered Papers will be published in ICCS 2021 Proceeding <s=
trong>by Springer in a book of the </strong> <b><span lang=3D"EN-US" style=
=3D'font-family: "Times New Roman", serif;'>the <span style=3D"color:#A3000=
3">Lecture Notes in Networks and Systems series=C2=A0</span></span></b>(<st=
rong>included in Scopus source list, Q4</strong>), and then will be submitt=
ed to <strong>ISI Proceedings, SCOPUS, and other </strong>indexations.<br><=
br>
We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.<br>
Due to the restrictions caused this year by COVID-19 Pandemic, <span style=
=3D"color:#800080;"><strong>authors with registration in ICADS 2021 will ha=
ve a discount of 50 USD in the ICCS 2021 registration</strong></span>.<br>
=C2=A0</span><br><span style=3D"font-size:22px;"><strong>Important Deadline=
s</strong><br>
Submission: =C2=A0=C2=A0 <strong>February 21, 2021</strong><br>
Notification: =C2=A0 <strong>March 30, 2021</strong><br>
Registration:=C2=A0 =C2=A0<strong>April=C2=A021, 2021</strong><br>
Event Dates:=C2=A0=C2=A0 <strong>June 18-20, 2021</strong></span><br>
=C2=A0<br>
ICCS 2021 Organizer.<br><a href=3D"http://ics.mailrelay-v.com/newslink/4028=
62/5.html"><strong>https://ics.events/</strong></a><a href=3D"http://ics.ma=
ilrelay-v.com/newslink/402862/5.html">.</a></div>
<img src=3D"http://ics.mailrelay-v.com/newsimg/402862/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b070054590404095200545107025008555303=
0600010252070555530505030e0604515e50060557%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b0700545904040952005451070250085553030600010252070555530505=
030e0604515e50060557%40ics_ip-zone_com-6</a>.<br />

---------6016f961180cc--

