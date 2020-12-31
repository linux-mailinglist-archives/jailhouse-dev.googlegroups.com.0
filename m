Return-Path: <jailhouse-dev+bncBAABBF6OXD7QKGQEEJJKOWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x140.google.com (mail-lf1-x140.google.com [IPv6:2a00:1450:4864:20::140])
	by mail.lfdr.de (Postfix) with ESMTPS id F034B2E81D2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Dec 2020 20:31:36 +0100 (CET)
Received: by mail-lf1-x140.google.com with SMTP id t194sf12291606lff.15
        for <lists+jailhouse-dev@lfdr.de>; Thu, 31 Dec 2020 11:31:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609443096; cv=pass;
        d=google.com; s=arc-20160816;
        b=phKVXH+/r7u3izn0EDBjulELIGTfMNw32JGj48mr4hD0BcQaIBSDFv3E0xQV/4oMcW
         xVJrO56TwbRhgkM+gvsUceLRK6CFyeIrV3p5RVlQ+/7K+E8zuu4x8KMnqFmR/Z+OMqx2
         OlEQVlRt0A+CtBYX6xpZQ+Hyee7XH+5cS8tqLh4eVtdQqGCUS9Sk6N5qoSblgvc4V0wx
         iSO72Ec+UJjW+L8N2HEB2sG/zbj9L/FBBMAPX0+vjisodmh3nRgGSGekHWR8aVerRDPZ
         +nNM2+NG3maur4GMzh3OWLvFoJSZmdBsagf8LZz8zTsnyLMvm6a0nHLDUnT74kKzvhmo
         Tj2g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=8pn0D6Pvi/3IkxbKx02n1MGrcxyeDRfe5cl2Y1Y53jg=;
        b=vxiJYp1vHvd8mJq69LxmSEbIrqEAOlW2tzbIG4MsVB9TabnTwxI5WriMYJjpAt/Zs8
         Bkbt/+lTlJDNwI2kGXG9Ko2cBpO9GbpcJmylihQSa6llVnH4rDA4RRkVwpJ7ET7atUb+
         +LMw8BpfKqjwoQW/+dGXn270qgRCysuD5zFqc55iP2X+Gg6d4cYXegoa0yigJ0x0jMXB
         onTU2HUd8slico11wUitP4/SJaBkyliu/TCyLYBS4IoNU0qbxwZkjgZWAz15Tray1Vho
         b4f8flrUHOkJQGfbk5rG043CL8IMieUyKLUjHLCKDK3hVGSNy4CSynhNbL6adNyOaV3I
         427Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (bad version) header.i=@ics.events header.s=dkim header.b=Fb7sZA65;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=8pn0D6Pvi/3IkxbKx02n1MGrcxyeDRfe5cl2Y1Y53jg=;
        b=rUyRexMU3riAVU1pIfsB6/9gNWUiKIcB4fHRQuRWcSky6ox4I34Rt5h4Yr2k1maKMo
         MH9MQRGs8Ath2R0yqUZ4fJooVsStLECYSQc3xLIbxvXx6llt1Tc9GLbmDHV66R9qsDkc
         g3rujlPOnTF5d3nMKoU3AdJ9n7QcYPH0vJHfH27zdQK1p81uIFf58lYkQN+nnbnqdYTB
         Qk97pLNccV+szOYpLiSvUfZ1c+78Gs8a6D951v36lsVVw39H11pWCbkarr5H8aRe8WrB
         tEL78P80q0aqapi6ChENi4h7QfmI82tpVgB3ActaRDomsSf0+HYNARKw5bUps9KC9a55
         Z2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=8pn0D6Pvi/3IkxbKx02n1MGrcxyeDRfe5cl2Y1Y53jg=;
        b=sua0g4wOwpxzgkK974fYJBQWn/5xnab39Z5Vk4/kZ/P0aOVw2eRl3YlBtpWYqRm9wz
         nUn3OUsyZnXtG7v5nEWTgQtVvu6XHaHT2yxBOhv8FwYcQpOT4LF0kxlJ6SvTj3q0M994
         SMHuE5RNtSH11NF+zLRa/HeClaEC/vyX3sttbYjek44oRm5z2q2Z8vSoV5BPTlg2yEDh
         gCRMU8rhOvBBgtLNEHros5eHXEGvO5QfnVmfJnQAEN2EI8AImr665f8jUqMGwY2iY5d3
         M6DKFIZ+hZKO60YJeArCMXwy0KvRHSPceR+F1evtjfdN9RUPBw7XIMoSO+jsbgn7Jpik
         edLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533Es2UiwIgR1T8wzcBTeZwx4oi8fq7UcGN2E+2yn3u/luSRHYWy
	JOieW4JdV842J51eHng08Mg=
X-Google-Smtp-Source: ABdhPJx/SuqFy513SsNWIiGrWD2qd0av69muMDEshDgwF7DRARfWZkOYXwmprq4wJQ4RnyqXPiJPNQ==
X-Received: by 2002:a19:4856:: with SMTP id v83mr24404300lfa.583.1609443096514;
        Thu, 31 Dec 2020 11:31:36 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:10d4:: with SMTP id k20ls672821lfg.3.gmail; Thu, 31
 Dec 2020 11:31:35 -0800 (PST)
X-Received: by 2002:ac2:5f72:: with SMTP id c18mr28413073lfc.34.1609443095290;
        Thu, 31 Dec 2020 11:31:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609443095; cv=none;
        d=google.com; s=arc-20160816;
        b=zCqaUKKH9rlmL+/VNdUN7U8+WCx/2mkwK3F/6bpdEXZQ1Bybaq9xNPN/U8Keu7Ml2K
         MdIW3vlRwauYO2AGiTmXJp+/brLdnt3R06MO/2fqtCQKfb8MK1nfPRP9nJS8PBDnomy3
         tRj6ams1Uos+wUd7YIFMcfvseXsOEw7oON81p1D5Fl1bXccXV0wBQKBQvo/nHM811BhK
         JzIKaYpJE4wzo4u6K9aJ3PLdrU9vrJEmxgg/z8/2UIUyJZwdZp10tFDvPH7N83izqmoL
         vCJA31KXcKzG7ZPUwTQ+/Oxfb/no6TWFTCZOaT9dSFsv8tygwh5EePn6W8idkkHuKzq2
         Zcrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=YjlrQroLRSiviuWSYxJzusXXhKv6DYAbSdWx6sKUOTU=;
        b=nTM+Jz+BbVxV/7rOgvSPLjfesJvgsd0/tUI965vLRp8J7D+vtD35z+Makq29UJT9rg
         +X8qr+1RSJnjWuKfFpiyzoVeijwF/v/CpJngwApI4zkHLwL0F2tzZT2xL2KHBFmFXuq0
         xdRU+5TR+m9KUnB9LKxW80HxoVw7Unrq6p0aFLqK3Rk9JkF1WtSs/LLZw+7dXv02ETp7
         7MT0ie9lC8PiYqjQUP7GEZMRU+PHCm88mEjVQnIbZwcJ0IDMw78wTwT9NYSEeHfpGs9A
         0V+rH6qoywLvZPpqsAx0HQA6SgGLn0VYXNy2F3Sh9CjnnpVm2lpN+CxWa95nFr9N9Poe
         PeYA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (bad version) header.i=@ics.events header.s=dkim header.b=Fb7sZA65;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id 207si1309765lfm.0.2020.12.31.11.31.35
        for <jailhouse-dev@googlegroups.com>;
        Thu, 31 Dec 2020 11:31:35 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id htojha16r3gj for <jailhouse-dev@googlegroups.com>; Thu, 31 Dec 2020 20:31:32 +0100 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Thu, 31 Dec 2020 20:31:18 +0100
Message-ID: <57500d04020c0b00085555050409535d035f54550b06000755065a07525355555c54560e0a0b0651045f58530e05@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e515e065505030d520b
Feedback-ID: 218315:218315-38:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=38&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?utf-8?Q?=E2=9C=A8=20Happy=20New=20Year=20to=20you=20and=20your=20family?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------5fee27062b176"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (bad
 version) header.i=@ics.events header.s=dkim header.b=Fb7sZA65;
       spf=softfail (google.com: domain of transitioning conf@ics.events does
 not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
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

---------5fee27062b176
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=E2=9C=A8 Happy New Year to you and your family
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Dear Author,=C2=A0
You are cordially invited to the 2021 International Conference on Comprehen=
sible Science (ICCS 2021), to be held at in Eilat, Israel, June 18-20, 2021=
, is an international forum for researchers and practitioners to present an=
d discuss the most recent innovations, trends, results, experiences and con=
cerns in the several advances of Digital Science.

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
ISI Proceedings, SCOPUS, Google Scholar and other indexations.


We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.

Due to the restrictions caused this year by COVID-19 Pandemic, authors with=
 registration in ICADS 2021 will have a discount of 50 USD in the ICCS 2021=
 registration.

=C2=A0
Important Deadlines

Submission: =C2=A0=C2=A0 February 21, 2021

Notification: =C2=A0 March 30, 2021

Registration:=C2=A0=C2=A0 April 21, 2021

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
jailhouse-dev/57500d04020c0b00085555050409535d035f54550b06000755065a0752535=
5555c54560e0a0b0651045f58530e05%40ics_ip-zone_com-6.

---------5fee27062b176
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=E2=9C=A8 Happy New Year to you and your family</title></h=
ead><body>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<img alt=3D"" src=3D"http://ic=
s.ip-zone.com/mailing-manager/domains/ics_ip-zone_com/files/img//happynewye=
ar-newsletter.jpg" style=3D"width: 298px; height: 160px;" width=3D"298" hei=
ght=3D"160">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0<span style=3D"font-size:22px;"><span style=3D"color:#ff00=
99;"><strong>Dear Author,</strong></span></span>=C2=A0<br><strong>You are c=
ordially invited to</strong> the 2021 International Conference on Comprehen=
sible Science (<strong>ICCS 2021)</strong>, to be held at <strong style=3D"=
box-sizing: inherit; color: rgb(64, 64, 64); font-family: Ubuntu, Tahoma, A=
rial; font-size: 17px; text-align: justify; background-color: rgb(255, 255,=
 255);">in Eilat, Israel, June 18-20, 2021</strong>, is an international fo=
rum for researchers and practitioners to present and discuss the most recen=
t innovations, trends, results, experiences and concerns in the several adv=
ances of Digital Science.<br>
Conference website <a href=3D"http://ics.mailrelay-v.com/newslink/383472/26=
.html">https://ics.events/iccs-2021/=E2=80=8B</a>.<br>
You may submit your paper online via Conference Submissions Form. Submitted=
 papers (until 10-12 page limit) must be written in English, must not have =
been published before, not be under review for any other conference or publ=
ication, must comply with <a href=3D"http://ics.mailrelay-v.com/newslink/38=
3472/14.html" target=3D"_blank"><strong>Template</strong></a> in <strong>.d=
oc/docx</strong> format.<br>
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.<br>
Accepted and registered Papers will be published in ICCS 2021 Proceeding <s=
trong>by Springer in a book of the </strong> <b><span lang=3D"EN-US" style=
=3D'font-size:12.0pt;font-family:"Times New Roman",serif;mso-fareast-font-f=
amily:"Times New Roman";mso-ansi-language:EN-US;mso-fareast-language:RU;mso=
-bidi-language:AR-SA'>the <span style=3D"color:#A30003">Lecture Notes in Ne=
tworks and Systems series=C2=A0</span></span></b>(<strong>included in Scopu=
s source list, Q4</strong>), and then will be submitted to <strong>ISI Proc=
eedings, SCOPUS, Google Scholar and other </strong>indexations.<br><br>
We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.<br>
Due to the restrictions caused this year by COVID-19 Pandemic, <span style=
=3D"color:#800080;"><strong>authors with registration in ICADS 2021 will ha=
ve a discount of 50 USD in the ICCS 2021 registration</strong></span>.<br>
=C2=A0<br><strong>Important Deadlines</strong><br>
Submission: =C2=A0=C2=A0 <strong><span style=3D"color:#FF0000;">February 21=
, 2021</span></strong><br>
Notification: =C2=A0 <strong>March 30, 2021</strong><br>
Registration:=C2=A0=C2=A0 <strong>April 21, 2021</strong><br>
Event Dates:=C2=A0=C2=A0 <strong>June 18-20, 2021</strong><br>
=C2=A0<br>
ICCS 2021 Organizer.<br><a href=3D"http://ics.mailrelay-v.com/newslink/3834=
72/23.html" target=3D"_blank"><strong>https://ics.events/</strong></a>.</di=
v>
<img src=3D"http://ics.mailrelay-v.com/newsimg/383472/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b00085555050409535d035f54550b06000755=
065a07525355555c54560e0a0b0651045f58530e05%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b00085555050409535d035f54550b06000755065a07525355555c54560e=
0a0b0651045f58530e05%40ics_ip-zone_com-6</a>.<br />

---------5fee27062b176--

