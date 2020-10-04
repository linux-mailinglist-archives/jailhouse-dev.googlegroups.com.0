Return-Path: <jailhouse-dev+bncBAABBJ7D435QKGQECEDQ3NA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E758282A65
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 13:27:36 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id v128sf2525473lfa.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 04:27:36 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601810856; cv=pass;
        d=google.com; s=arc-20160816;
        b=xATwb/GXX78i7uUiD3KgzjhVziD6AD8nlOmme6UUl6rzjlhnQdCs8cBAgYA9F0gDQH
         4kZ8i/tiNQhbWvbFwnmNC3/FR/JmeyPk8QZDsZHSu+JvqO7arUIcPkU5hekqr4TTntGS
         8YY8t2Ef4ZuEIAYvSOxAgJ4CRTYszzulK4uMZKH0uyWnDO/V8AOQNx6ECc8caz6emsdm
         mE7ChvVsuTmFI42om1FoFdm0YbH8XzxVdIS/UNEAFGEOU4vaeJKCz7hqA+VmuS/7+VQG
         MFOcvYwFYfB2E5j1rZ4+bul2YYSQmNi2ZEzJA1fnCceCFrVtm1hmjhLOCFa5Z9HCEXqY
         z5Gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=7V5JjFOOIMiQw4bmUCzMUoisI+TPcxsA5bkJg++/CEg=;
        b=XVGwg52HRM32HYfyomjGiRn0VJGk0hgo3tFGJvaU6Ht7iwXSfyYDfj+Qq/3UVAz38s
         wako3AD66G7C4HkENhHViB0CzyiUHiv72/y2GD349TC0P+3w5DVnMNDOE7dSMf29b1v2
         vUxxyVNoKMeC65+I/RFwyGMKZ/8ki6zqlmIbqUVJAI4d8I3XAySe/sm38+xk/G2rz9fY
         4Ea3HZoZyaRBXCi5AITc2XbbWGWG0NAMD+3WNSgZpj0/N6A7YE8jVlJKC6DRhc8lMZUX
         izbqM4V5tp0RGzueac0SbMvu7yCUyqmhISba3/AaFl+aPGRMInwWvsxYszsQ4fc91/Uf
         +HAQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="ef3a/4Qg";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=7V5JjFOOIMiQw4bmUCzMUoisI+TPcxsA5bkJg++/CEg=;
        b=cgNMOLYVCa4zcY1gGFHjK8Sf1Oee0Hkk+N0a9DxURcY8PdxcGVJvZiOVl6o7F1oTBs
         7SFNaDRlTQ8M9NvxRlZe+8hTFR3bKRr/N2CflfpyUoa/5iJKZEIDLkMrTIA6jddg7KSO
         mJDY7R2BpRfVWQm+wApM2KEXRRTCfsRBAV/A3WvsC/PuOZ8ymGmjDWCqPEAwZsGm5bd4
         u7VLprrRX0rLsggcsithh2Dq8p4/LkE1eOH6AN5QueOEk9ms6GMTGw362WoZD8YnA+ix
         ZbIwAlIDoDcm0o6WVdbulqaswUZVKXKttiDkA1tztJQ1ZmAu4RGWCMZn1IX/VkJ39VGx
         pLIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=7V5JjFOOIMiQw4bmUCzMUoisI+TPcxsA5bkJg++/CEg=;
        b=LpH7Ekl7obBLajGIwtAZvqKmxulLPyLYe/lM0h4QiZm5WHuebqp6wJED2f/yWMrVXh
         nEjAaJcTkX4cnF1ax11so6nOP7b4lyax530zWPdUQOzsktpXOU1cjZxWDMejWuOhuxSn
         G/zRWj0z6vl6LXRVOvHo/yTi30jCsCYmPa4EB/tfia2btYris1TqQgI1Vy1ex1meTju6
         i1bO5DBxIyCzt8ci1pee/QIHhQR502xI1w5J4UEgbwhhRAk+S3P7WIhtxtLTZvfQSfbo
         7PIU87UF8bMoHDAtMmgJ7N9Hbw7AHqjhyn4yn/CzCYlfjS35SRTjGrKUC2F7uMkSukgV
         rdmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532zRf4c7C+rSP/YyoB2wBbuo9l8MBDQOUrdw3c/vBMEMRgc3Oto
	O6WAtAJ03O5Se3lI+74HfYw=
X-Google-Smtp-Source: ABdhPJw10tm2UFga+kVZTMug8IMUqsC+n/ZGiAwV0SjcI8F4Ggb/WSqZvGDbgatvk6W7XBDwyclIMA==
X-Received: by 2002:a2e:a318:: with SMTP id l24mr578009lje.170.1601810856028;
        Sun, 04 Oct 2020 04:27:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls858932lfp.3.gmail; Sun, 04 Oct
 2020 04:27:34 -0700 (PDT)
X-Received: by 2002:a19:915d:: with SMTP id y29mr4215911lfj.371.1601810854899;
        Sun, 04 Oct 2020 04:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601810854; cv=none;
        d=google.com; s=arc-20160816;
        b=OMUEZWQjdzrLBJyOmI0mw7rK4pIH8SlHuQ6W05kXmwrG4jfAqw4X+RGDsN3q8A0CHA
         MREbU1RWgd/yJqs5ToFifWhwChHKfzPePUUye32B5xEbyjfQfdzJtnx/5M/r5OUCYAxy
         WLNBoKrueiP6GrTkeYoY4l/m8sjnACwosC8pK4/xZCIpF5J1/aqr1Mt9dhHAi/eKADT9
         7AfnQCmoUUWt0bp+gJyZLPHOrmPW6gHe0bsjRLI9mZUJcMxUWGl6FLJqihD41tT/y3mk
         mS3rzKJeNTQgE9XmcMYjdgcMnHKWy1ngjqYgWK4+ej1ZhW8kELEh2udP2ctiT9PcjVm/
         hkhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=Ojr1+JoGmZKnSnFYMDrr7g9F3pkwjrjp8E5vnlUQdoU=;
        b=gAKck5x+IPP97yMBw++OsNyMcV6IxOWzvcFL344FFaY82og6xBD3oVfPs44wyGYWxm
         VBYWkV5LLfGM4f9NXBN+tapHfTOU+eqgW3MORxsSBf4NCQUIa74ixnrf+QAgo5n7iFvk
         WGzZ/6+lUwQJetHVnxkWcvi59myv01Ahs4C8AcqehDX+59skLuyX98A6tc/mxiWVG+1p
         qLERVK2sfmwjgThSioBIKtNK3YsxgBsc5EIxE/WVPAS6pqfNUAG7IsOwpYM7CtoIAD+7
         mW8RIHSbeo7FWQirY65qjHmOrTEv59cOQHgwrcqGUGxj7U7wxUardyn8zb9C7nl9Cq0c
         pVQw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="ef3a/4Qg";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id y12si68891ljc.1.2020.10.04.04.27.34
        for <jailhouse-dev@googlegroups.com>;
        Sun, 04 Oct 2020 04:27:34 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id hf6oqa16r3gv for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 13:27:32 +0200 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Sun, 04 Oct 2020 13:27:13 +0200
Message-ID: <57500d04020c0b000157550b00095253525401540401545957070e03035352595d5053520a5b0801535e53015054@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e515704550b070d5200
Feedback-ID: 218315:218315-33:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=33&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?UTF-8?Q?=F0=9F=94=97=F0=9F=93=99=F0=9F=93=A5Springer=20?=
 =?UTF-8?Q?Publication.Q3.Scopus=2C=20WoS=20Indexation.?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------5f79b191dfacc"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@ics.events header.s=dkim header.b="ef3a/4Qg";       spf=softfail
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

---------5f79b191dfacc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=F0=9F=94=97=F0=9F=93=99=F0=9F=93=A5Springer Publication.Q3.Scopus, WoS Ind=
exation.
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
mputing=E2=80=9D (included in Scopus source list, Q3 / JSR 0,184), and then=
 will be submitted to ISI Proceedings, SCOPUS, Google Scholar and other ind=
exations.


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
jailhouse-dev/57500d04020c0b000157550b00095253525401540401545957070e0303535=
2595d5053520a5b0801535e53015054%40ics_ip-zone_com-6.

---------5f79b191dfacc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=F0=9F=94=97=F0=9F=93=99=F0=9F=93=A5Springer Publication.Q=
3.Scopus, WoS Indexation.</title></head><body>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<img alt=3D"" src=3D"http://ic=
s.ip-zone.com/mailing-manager/domains/ics_ip-zone_com/files/img//changedpro=
motion.jpg" style=3D"width: 260px; height: 195px;" width=3D"260" height=3D"=
195">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0<span style=3D"font-size:22px;"><span style=3D"color:#ff0099;"><s=
trong>Dear Author,</strong></span></span>=C2=A0<br><strong>You are cordiall=
y invited to</strong> the 2021 International Conference on Advances in Digi=
tal Science (ICADS 2021), to be held at Salvador, Brazil,=C2=A019 =E2=80=93=
 21 February 2021, is an international forum for researchers and practition=
ers to present and discuss the most recent innovations, trends, results, ex=
periences and concerns in the several advances of Digital Science.<br>
Conference website <a href=3D"http://ics.mailrelay-v.com/newslink/311496/24=
.html" target=3D"_blank">https://ics.events/<strong>icads-2021</strong>/</a=
>.<br>
You may submit your paper online via Conference Submissions Form=C2=A0on <a=
 href=3D"http://ics.mailrelay-v.com/newslink/311496/24.html">https://ics.ev=
ents/<strong>icads-2021</strong>/</a>. Submitted papers (until 10-12 page l=
imit) must be written in English, must not have been published before, not =
be under review for any other conference or publication, must comply with <=
a href=3D"http://ics.mailrelay-v.com/newslink/311496/14.html" target=3D"_bl=
ank"><strong>Template</strong></a> in <strong>.doc/docx</strong> format.<br=
>
All submissions will be twice =C2=ABblind=C2=BB reviewed by Scientific Comm=
ittee Members and invited Reviewers based on relevance, timeliness, origina=
lity, importance and clarity of expression with convincing argumentative an=
d a strict paper selection process.<br>
Accepted and registered Papers will be published in ICADS 2021 Proceeding <=
strong>by Springer in a book of the </strong><strong>=E2=80=9CAdvances in I=
ntelligent Systems and Computing=E2=80=9D </strong>(<strong>included in Sco=
pus source list, Q3 / JSR 0,184</strong>), and then will be submitted to <s=
trong>ISI Proceedings, SCOPUS, Google Scholar and other </strong>indexation=
s.<br><br>
We are prepared to offer virtual participation options, for anyone who cann=
ot or chooses not to travel due to the situation regarding COVID-19.<br>
Due to the restrictions caused this year by COVID-19 Pandemic, <span style=
=3D"color:#800080;"><strong>authors with registration in ICCS2020 will have=
 a discount of 50 USD in the ICADS 2021 registration</strong></span>.<br>
=C2=A0<br><strong>Important Dates</strong><br>
Submission: =C2=A0=C2=A0 <span style=3D"color:#FF0000;"><strong>November 01=
, 2020</strong></span><br>
Notification: =C2=A0 <strong>December 11, 2020</strong><br>
Registration:=C2=A0=C2=A0 <strong>December 21, 2020</strong><br>
Event Dates:=C2=A0=C2=A0 <strong>February 19-21, 2021</strong><br>
=C2=A0<br>
ICADS 2021 Convener.<br><a href=3D"http://ics.mailrelay-v.com/newslink/3114=
96/23.html" target=3D"_blank"><strong>https://ics.events/</strong></a>.<br>
=C2=A0</div>
<img src=3D"http://ics.mailrelay-v.com/newsimg/311496/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b000157550b00095253525401540401545957=
070e03035352595d5053520a5b0801535e53015054%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b000157550b00095253525401540401545957070e03035352595d505352=
0a5b0801535e53015054%40ics_ip-zone_com-6</a>.<br />

---------5f79b191dfacc--

