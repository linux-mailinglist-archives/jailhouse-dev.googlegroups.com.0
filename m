Return-Path: <jailhouse-dev+bncBAABBI4YSP7QKGQET2E3KUY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E3FF2E284D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Dec 2020 18:13:08 +0100 (CET)
Received: by mail-lf1-x13e.google.com with SMTP id m18sf1103160lfa.0
        for <lists+jailhouse-dev@lfdr.de>; Thu, 24 Dec 2020 09:13:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1608829988; cv=pass;
        d=google.com; s=arc-20160816;
        b=orzpPipaNfCHvbgP5n/ODZfUM1Hp9N5qrF9Z0XT0PlQHHGEkXq0o58MY39P3VlUH6Z
         4hEBYJU0jqjJ5JYWifnRJfp2p1F/ygJwrauIL+wFMxfVr2BuK140OrBsQSkW8DohftJb
         oeenRr8KyJNo5z4wNS3c3ui5XDAgQ5ehWy67t2ff3XRN+f7z2lUAg4H/w+MNVOUcD3tR
         4zrL2Ljm6HiDp9qvcIc/WYklYaFmy8eq/pKqtO+EmDn4dnSAecAZK9w4PYQRxifEfdcm
         PtFccz0AKiq6sEJi0HfRqtk32Hm+RrIIWZLHIryj6MoeEhF47pohXv7z5iwSk9qx5AMf
         v4sA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=1wOhDfTUGQH9kDvX0BScDmFfj0ErSIX1Ank6RzJdcgM=;
        b=hHxuVAjggUF6feiOavH5bwj+9U+Dfw7kE25lzhN6X7clHnB0NA0jEdRj8pKHCFe1LM
         uoHif7h+UT4zUWrNHxb8ZZvEmOG3yu/ey4UkaJjNuduf6esBM/CJ/DXl86lFBTNCqEV2
         jkxTlbwxCjn0pMNJrinhppiE+LiBZ1nBOHRPrpuTv9iUIIut0TkVdcCUDC1fQfOdqlgU
         R+QbK9Gyto7SJ0GMg81XljUMskvCuzgkRjIgpHtoPa7oyLxhJXlZRWauzWX4FATXigwF
         /ZpCGsPrVanwDzdujNNi4aQITA8z2+8pLl8I9paSq6DHsfafaVuNzxxuRDELm9imCkTn
         M3bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b=rKKkjQfk;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=1wOhDfTUGQH9kDvX0BScDmFfj0ErSIX1Ank6RzJdcgM=;
        b=QpQCZYdmhqzbJMUScYwHGwRlYWZiHw0KwM1ZcoMY34IKaA5zHpF2Z/HgZU6Cx9jMAC
         uWgxxokk/PYOGz7vpSl9Ncc6ZasCzwz97tqem9xGIYvVhvtiv3gT95fzVDtGQ0MVAmWX
         35H6+kMQhEbg/D7zGAwiILrN33DKcfmjR34q46I/96/q+P4vHKiXadvH3vzZVgBk2bEe
         JsPmykQyimCHiWlvvahNfEqPSY8961GaHsXgwG1O0P6ZNYfyZHs/Zh7NzOvMLwdj/CLG
         e82zuZsbHymMoUMC8FtCOrjXeJ0TcRPl5RbbJ6jfYBHx/RuOCbYXia4XColkQqP+3DMv
         7x9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=1wOhDfTUGQH9kDvX0BScDmFfj0ErSIX1Ank6RzJdcgM=;
        b=jO3ToIULdH+Ekv1GvJlzxvmHMmC88xmljuxfhJdTI20eec7VumCIY82r4QBtds0wJQ
         fXdKLDKh+AWlzHjSKe2lC0A7e8UgeQiHVxnfNiw4gggb3z3qPTZeC8qj8K/KyEqKyw//
         I7ys+d75i9uSlG89ZKAjVBe49gHm2DIhK8di7AMQyru5370tamOy6m8u/PS5kPFPkLRl
         HLr6QgbGHgs3BvyrqwUgrUdb/heiSgR+hB9B41R/N5wDLAmYC3cQYeFiCe4GAGmannQD
         lldFoXw+R2a/DXn4Xnqc0ceGMjAwJx0QBQVgNCM/r8SMEHE6Ljxc3KaM/ejwgpnUvssh
         WwxQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532EvnCbR7ryy5Cpfe5Nxwy4kjv6/YJD5EanIH6G2Uowno81idAD
	rWBDQzIKNmvD7rb+T1hTaH0=
X-Google-Smtp-Source: ABdhPJwpbUMpUcWOGEN6kZLGUeFvNJYsHWTHi2yncOS0Ejru33Vmp5LYkMdEBqpNn8Mi8zw3jpRCEQ==
X-Received: by 2002:a2e:9f52:: with SMTP id v18mr15427977ljk.510.1608829988037;
        Thu, 24 Dec 2020 09:13:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c886:: with SMTP id y128ls6413585lff.0.gmail; Thu, 24
 Dec 2020 09:13:07 -0800 (PST)
X-Received: by 2002:a05:6512:286:: with SMTP id j6mr12629220lfp.92.1608829987109;
        Thu, 24 Dec 2020 09:13:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608829987; cv=none;
        d=google.com; s=arc-20160816;
        b=B6yIJhbu9eWf12JYKsDPtfK4mQsDrY9B4bO1WFhvnXBXGwIeRQwcsS1SQKwgEFju2z
         yerZScWyE4WTIiWWb/LMuhuO/2jkQTBv/pLO7V8N24z8kd2Tt/0vbZV9ZwuCJ50jHu2n
         ilsmyu63yNQ0KytNAu4Q7Z9qnk5773hov8IPJ3b19p9xJONN88S9at39wx7nSxGWRTYo
         xREPAaNSpNnfdYaNp78ZSSJVxgppD/hzSZjxe4bFmzxe4cAnyLvTqptcvGatq2FwGeTa
         XZCMWjbBy9yaKBhm9HPVK4NUZqLydCJZZ34F1azOpFvwLmH0LNQHiM204NBJsMNUztGn
         NUtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=+z+t3nOg678gYAyHOkqSldqL/R7/zvTbPLYMXwQzmSw=;
        b=ZSlVXer5xs/RL6eyAmEDA6Ka/knqmP78K/3N5v1ARAVeaZKa6HJliQGNEProBo1J2L
         9ExUsWtrLrvCZXONVASzRco/gishDKmMwAluTtE9FlBQrZH6I+OIZkwsidnmp6DPhBLO
         aRfMdAYb9n6XLJPwVZ+e3nDUgvmLIw46KWHK+IIyYjnSQzffEKFFU6kJwQaqubxJA5o9
         jGyoNX2g0UaqQArD9MG1VUq9Oewiyh44UZhADd0DoQh3bdw9ju5SJgXbUyQKSYZBiSQ4
         M9KDXapiuCybqsO1MwDh/HVLW2oO+Oe5icX+hhOfT6TZKvvVksL38iMPpLsKvZsCrDt/
         jfTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b=rKKkjQfk;
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id t65si500892lff.3.2020.12.24.09.13.06
        for <jailhouse-dev@googlegroups.com>;
        Thu, 24 Dec 2020 09:13:07 -0800 (PST)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id hsj62216r3gn for <jailhouse-dev@googlegroups.com>; Thu, 24 Dec 2020 18:13:03 +0100 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Thu, 24 Dec 2020 18:12:36 +0100
Message-ID: <57500d04020c0b00065f510b0e095803510256540a01525850060b0905045b5057035607570053525602540a5406@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e51500c510b090d5204
Feedback-ID: 218315:218315-37:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=37&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?UTF-8?Q?=F0=9F=8E=84=20Merry=20Christmas=20to=20you=20and=20your=20family?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------5fe4cc0481542"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@ics.events header.s=dkim header.b=rKKkjQfk;       spf=softfail
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

---------5fe4cc0481542
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=F0=9F=8E=84 Merry Christmas to you and your family
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
jailhouse-dev/57500d04020c0b00065f510b0e095803510256540a01525850060b0905045=
b5057035607570053525602540a5406%40ics_ip-zone_com-6.

---------5fe4cc0481542
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=F0=9F=8E=84 Merry Christmas to you and your family</title=
></head><body>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"http://ics.mailrela=
y-v.com/newslink/369098/26.html"><img alt=3D"" src=3D"http://ics.ip-zone.co=
m/mailing-manager/domains/ics_ip-zone_com/files/img//merry-christmas24-12-2=
0.jpg" style=3D"width: 400px; height: 171px;" width=3D"400" height=3D"171">=
</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<span style=3D"font-size:22px;"><span style=3D"color:#ff0099;"><s=
trong>Dear Author,</strong></span></span>=C2=A0<br><strong>You are cordiall=
y invited to</strong> the 2021 International Conference on Comprehensible S=
cience (<strong>ICCS 2021)</strong>, to be held at <strong style=3D"box-siz=
ing: inherit; color: rgb(64, 64, 64); font-family: Ubuntu, Tahoma, Arial; f=
ont-size: 17px; text-align: justify; background-color: rgb(255, 255, 255);"=
>in Eilat, Israel, June 18-20, 2021</strong>, is an international forum for=
 researchers and practitioners to present and discuss the most recent innov=
ations, trends, results, experiences and concerns in the several advances o=
f Digital Science.<br>
Conference website <a href=3D"http://ics.mailrelay-v.com/newslink/369098/26=
.html">https://ics.events/iccs-2021/=E2=80=8B</a>.<br>
You may submit your paper online via Conference Submissions Form. Submitted=
 papers (until 10-12 page limit) must be written in English, must not have =
been published before, not be under review for any other conference or publ=
ication, must comply with <a href=3D"http://ics.mailrelay-v.com/newslink/36=
9098/14.html" target=3D"_blank"><strong>Template</strong></a> in <strong>.d=
oc/docx</strong> format.<br>
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.<br>
Accepted and registered Papers will be published in ICCS 2021 Proceeding <s=
trong>by Springer in a book of the </strong> <b><span lang=3D"EN-US" style=
=3D'font-size:12.0pt;
font-family:"Times New Roman",serif;mso-fareast-font-family:"Times New Roma=
n";
mso-ansi-language:EN-US;mso-fareast-language:RU;mso-bidi-language:AR-SA'>th=
e <span style=3D"color:#A30003">Lecture Notes in Networks and Systems serie=
s=C2=A0</span></span></b>(<strong>included in Scopus source list, Q4</stron=
g>), and then will be submitted to <strong>ISI Proceedings, SCOPUS, Google =
Scholar and other </strong>indexations.<br><br>
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
ICCS 2021 Organizer.<br><a href=3D"http://ics.mailrelay-v.com/newslink/3690=
98/23.html" target=3D"_blank"><strong>https://ics.events/</strong></a>.</di=
v>
<img src=3D"http://ics.mailrelay-v.com/newsimg/369098/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b00065f510b0e095803510256540a01525850=
060b0905045b5057035607570053525602540a5406%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b00065f510b0e095803510256540a01525850060b0905045b5057035607=
570053525602540a5406%40ics_ip-zone_com-6</a>.<br />

---------5fe4cc0481542--

