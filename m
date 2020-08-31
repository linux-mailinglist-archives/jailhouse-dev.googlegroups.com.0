Return-Path: <jailhouse-dev+bncBAABBZ4ZW35AKGQEHIEYA7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A30258487
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 01:51:03 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id s8sf2294546wrb.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 16:51:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598917863; cv=pass;
        d=google.com; s=arc-20160816;
        b=LIyr02gxcurwJvScsGMlZZWJiVfXdsFDO1Pl9xWnvZQeDg9Lan+TpF3PryjKqaRkwb
         ifpcUy6z9ZSjRPdd/dm7fyxiC6LMjXOcFiqNxSjn13t7dRe0dEZurUvb6codvj3+pwmf
         /ExWle9q7MBJcfM9zl5w9469Y/V4LLWEwZBZ0rN2q+M/mZJKNAc7MNIH4wNwmD0BakKP
         oX04fXD9DrYyI9hGBoOOdSwgtGrjzLNvtxzSjKADoBavC3Rudstaj7VIJdbDRm7D0o/0
         TnXTitWcdkMTbz8y84RqrsEGV5hF/GdX0jSV5kFpzsE1qDdxE79p8wb7USRHNwjDTGOK
         I1Ig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=cZv0ydXVf0u47osPXFXE8DH41qNaleUtjRlSit11p+w=;
        b=gpL44Y83gRKDxK8KYWdmlCWVKa+Wgp5eMv+q/NUYcBkiRHran9ehSMmXySaV+307bV
         7fVhYK3cHLmtjv1ZSvmWxvu9Q+fqZi5R3Ox+NEYUW1vRINbb5ChH92laffYpijNsv/Zs
         fTE7lLh0UMf8AdTKUugiB+BXZlt+Ng+CFQ0th0JKnYw4nFCg6YlBJC2YKsSeNMBrced+
         +PfdmDjTbx3hh5Ms3ZCcPjh2Bp8c4XsOS/vIMsXQxFWQAKcUkSUtT7jripUle5gX1SDH
         gzLegJ6RWTZGgc7pKspcDdRmf0xudRYG0jfO1bEUn7SxGEwp78vYI8MNwByknfe2Zbn+
         8G8Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (bad version) header.i=@ics.events header.s=dkim header.b=GOn1WN4S;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=cZv0ydXVf0u47osPXFXE8DH41qNaleUtjRlSit11p+w=;
        b=QG/eHoIPfsmB/W+18YY8Y4LeoQMfj/nQWq8K53p4pG3asKWwN/BIGv7F7SCkVXyioX
         ZU/7MiQUNSlBWJ5u8cluoXUl0tA8wNGvsB4P6L0Zsu0zDEsteWuV50pXDHOSGfdfs0gC
         2PiDhDogmyksUEHhsqm/NV/rZoDt6XbR3S2H90KSD8mmt4IMla9pH46kzxYWpS35kzM/
         +uk5FdC7ECVq6yJ2hm5EBJizbOpi8n+SFEYF0vDrvVuDPgDXwIE8ncNriMOOVWRRP3aH
         dsaoPm3prIRJHgzKMr7J5B5tiMzf3Sb2qecCQlMK/LA+eSSgxjrjeqxSxj5+0J5niRWY
         rNYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=cZv0ydXVf0u47osPXFXE8DH41qNaleUtjRlSit11p+w=;
        b=uAATvCBIr3sBn63Z6hcfGiNgTGx7WGK+h0+OPGPI29Hd7bb1WO1luTvtUOvzack7JX
         D/nN5DTO50/QppuRQ55ZY9JCiVsJkt+9A0vsAlYX4z7sm8S65cr9DnYLcGtOpYmb1yT1
         m9FXvF0RxfPQzHb18rHXZnQwP0ELH+yyCK66CClHqZNF+TSIZx2u/nY5cJiYPqDTeW9g
         0BeQm86A2yyGxUIp1HiJFoFkM8CbICbm32qJYllf7DgNTR3cE8DZwfUJv8T3hOXwHpwy
         EH2zeDFMI02Sfo5cZzzMa4OFI/6JAqOkfl8vOX+NaZ8l1TzaiiUuLCZalFG3pGUrpO8Y
         3Nrg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532CyWmE+DuSB9ewOF5w+LvBEQY+ztl+JDJRAi1pMEGvF8HgRFS1
	WPl1n4dtKbt0/A7nQBp60oA=
X-Google-Smtp-Source: ABdhPJynzcZCwFzlcAEIFjj80OCDWB5MC6JSS8Nxiugb6nI90nX9cZ6hqGBZJgu6f/9OLCDOA+/zLA==
X-Received: by 2002:a7b:c397:: with SMTP id s23mr1548765wmj.174.1598917863337;
        Mon, 31 Aug 2020 16:51:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:8:: with SMTP id h8ls654483wrx.3.gmail; Mon, 31 Aug
 2020 16:51:02 -0700 (PDT)
X-Received: by 2002:a05:6000:11c5:: with SMTP id i5mr3829812wrx.18.1598917862787;
        Mon, 31 Aug 2020 16:51:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598917862; cv=none;
        d=google.com; s=arc-20160816;
        b=eS7nCoR0IvWWToBEYts+a16Pxt6XTQorKHIcYW5RASg7wSrfMWSsmVPUi0Yqm3MIHu
         ZrVo8or9/XOIuYzR/HHInms5b1RQQb7BRKO9V4np20CNeCzSDuVhyGHmWFbs7X1WnwFL
         feaq3kUhy1297PNVE3OR1mwEPgZwkSKpfMhTbC+WeEgA9bv7d0Xq8zC8nrJAc6H0j1MS
         4KcPXfBMYCmNBvnsaNlyVTGzjA5g240Dsk895E2ZyR30qtvE9XJDYADtcZ2KQ/zTa5l8
         1vFuCkbDE2qI/Pvi219n+97NkUQz9WccCbG0OgxnmV/N04W6iuh+MvT9GdXGZ5GfIXF2
         OKng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=sL0UKYPtKzSppxYn1Nv8+MjvnAnEJ6gKV9o36z4aPFg=;
        b=zPsZd9CQ6bn2L6k2+yE60HDd5IrWsLGdXXaTfstbh8unmtLZdzCGIZL0HhqsOcor9a
         F/WRCdgNAPtpq8/aQ1qql76k9D7+507B8yXbaja7Ec/JWetid1Vz0q5aDGL30s6iSGvP
         /GbcnPsmnvfUlDdDGb3Q44nTnYdlzrqHdTLoT89vaJaSPyE0n5lU3mMkXEMrbGk/fV/N
         BfWpjbixHR8j6LPwzlzP+LDtAKSTn3+C7YqMa7iiC6PP3pRQO0ywy041cF7D/XDpQpzV
         kKp+QV/Xcl3Ut0fjCSsOqxQDkeFbOV0VLoXZ2b1Rap1i3KgntmGpds+gHGaXZrd6ImKf
         RyGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (bad version) header.i=@ics.events header.s=dkim header.b=GOn1WN4S;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id 64si28646wmb.1.2020.08.31.16.51.02
        for <jailhouse-dev@googlegroups.com>;
        Mon, 31 Aug 2020 16:51:02 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id h9m6ec16r3g5 for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 01:51:02 +0200 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Tue, 01 Sep 2020 01:50:42 +0200
Message-ID: <57500d04020c0b01095054020509580752040d595402550405015a05015057005c570102575b5451075658030350@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e505f035402020d5202
Feedback-ID: 218315:218315-31:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=31&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?utf-8?Q?=F0=9F=93=99=20Happy=20Back=20to=20the=20University=F0=9F=92=BB?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------5f4d8cd27a1bc"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (bad
 version) header.i=@ics.events header.s=dkim header.b=GOn1WN4S;
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

---------5f4d8cd27a1bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=F0=9F=93=99 Happy Back to the University=F0=9F=92=BB
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Dear Author,=C2=A0

You are cordially invited to the 2021 International Conference on Advances =
in Digital Science (ICADS 2021), to be held at Salvador, Brazil,=C2=A019 =
=E2=80=93 21 February 2021, is an international forum for researchers and p=
ractitioners to present and discuss the most recent innovations, trends, re=
sults, experiences and concerns in the several advances of Digital Science.

Conference website https://ics.events/icads-2021/.

You may submit your paper online via Conference Submissions Form=C2=A0on ht=
tps://ics.events/icads-2021/. Submitted papers (until 10-12 page limit) mus=
t be written in English, must not have been published before, not be under =
review for any other conference or publication, must comply with Template i=
n .doc/docx format.

All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.

Accepted and registered Papers will be published in ICADS 2021 Proceeding b=
y Springer in a book of the =E2=80=9CAdvances in Intelligent Systems and Co=
mputing=E2=80=9D (included in Scopus source list with Q3 / JSR 0,184), and =
then will be submitted to ISI Proceedings, SCOPUS, Google Scholar and other=
 indexations.


We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.

Due to the restrictions caused this year by COVID-19 Pandemic, authors with=
 registration in ICCS2020 will have a discount of 50 USD in the ICADS 2021 =
registration.

=C2=A0

Important Dates

Submission: =C2=A0=C2=A0 November 01, 2020

Notification: =C2=A0 December 11, 2020

Registration:=C2=A0=C2=A0 December 21, 2020

Event Dates:=C2=A0=C2=A0 February 19-21, 2021

=C2=A0

ICADS 2021 Convener.
https://ics.events/.

=C2=A0

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/57500d04020c0b01095054020509580752040d595402550405015a0501505=
7005c570102575b5451075658030350%40ics_ip-zone_com-6.

---------5f4d8cd27a1bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=F0=9F=93=99 Happy Back to the University=F0=9F=92=BB</tit=
le></head><body>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span style=3D"font-siz=
e:22px;"><span style=3D"color:#ff0099;"><strong>Dear Author,</strong></span=
></span>=C2=A0</div>

<div style=3D"text-align: justify;"><strong>You are cordially invited to</s=
trong> the 2021 International Conference on Advances in Digital Science (IC=
ADS 2021), to be held at Salvador, Brazil,=C2=A019 =E2=80=93 21 February 20=
21, is an international forum for researchers and practitioners to present =
and discuss the most recent innovations, trends, results, experiences and c=
oncerns in the several advances of Digital Science.<br>
Conference website <a href=3D"http://ics.mailrelay-v.com/newslink/296503/24=
.html" target=3D"_blank">https://ics.events/<strong>icads-2021</strong>/</a=
>.<br>
You may submit your paper online via Conference Submissions Form=C2=A0on <a=
 href=3D"http://ics.mailrelay-v.com/newslink/296503/24.html">https://ics.ev=
ents/<strong>icads-2021</strong>/</a>. Submitted papers (until 10-12 page l=
imit) must be written in English, must not have been published before, not =
be under review for any other conference or publication, must comply with <=
a href=3D"http://ics.mailrelay-v.com/newslink/296503/14.html" target=3D"_bl=
ank"><strong>Template</strong></a> in <strong>.doc/docx</strong> format.<br=
>
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.<br>
Accepted and registered Papers will be published in ICADS 2021 Proceeding <=
span style=3D"color:#ff3300;"><strong>by Springer in a book of the </strong=
><strong>=E2=80=9CAdvances in Intelligent Systems and Computing=E2=80=9D </=
strong>(</span><strong><span style=3D"color:#ff3300;">included in Scopus so=
urce list with Q3 </span>/ JSR 0,184</strong>), and then will be submitted =
to <strong>ISI Proceedings, SCOPUS, Google Scholar and other </strong>index=
ations.<br><br>
We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.<br>
Due to the restrictions caused this year by COVID-19 Pandemic, <span style=
=3D"color:#800080;"><strong>authors with registration in ICCS2020 will have=
 a discount of 50 USD in the ICADS 2021 registration</strong></span>.<br>
=C2=A0</div>

<div><strong>Important Dates</strong><br>
Submission: =C2=A0=C2=A0 <strong>November 01, 2020</strong><br>
Notification: =C2=A0 <strong>December 11, 2020</strong><br>
Registration:=C2=A0=C2=A0 <strong>December 21, 2020</strong><br>
Event Dates:=C2=A0=C2=A0 <strong>February 19-21, 2021</strong><br>
=C2=A0<br>
ICADS 2021 Convener.<br><a href=3D"http://ics.mailrelay-v.com/newslink/2965=
03/23.html" target=3D"_blank"><strong>https://ics.events/</strong></a>.<br>
=C2=A0</div>
<img src=3D"http://ics.mailrelay-v.com/newsimg/296503/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b01095054020509580752040d595402550405=
015a05015057005c570102575b5451075658030350%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b01095054020509580752040d595402550405015a05015057005c570102=
575b5451075658030350%40ics_ip-zone_com-6</a>.<br />

---------5f4d8cd27a1bc--

