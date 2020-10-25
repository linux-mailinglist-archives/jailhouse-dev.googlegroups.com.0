Return-Path: <jailhouse-dev+bncBAABB4O6236AKGQEUWYZI3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id ED80F2982A6
	for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Oct 2020 18:01:39 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id f28sf1910957lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 25 Oct 2020 10:01:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603645298; cv=pass;
        d=google.com; s=arc-20160816;
        b=RZ2jRTwHlQk9MNjWSaYDG3dpqpqIsN/0F2Yl7LmY7PjlCAKku7YUftEZX+h7R63jdq
         othHZ0BHrgBtBjDN7JrAynwc+wY9kynk0T7uJ8nT7HEYQjbJhN9c4QB/yhgYkSmMIMqJ
         fjmaYS9J/D2sPjji1BlZOinHhZQVqD4bICVfNP+1MDWhsBBvklMLdTA8ANMhqW0vIZ35
         OhrRBSaumVDi+MpcpIPCbwoZh5/coxuOb6tMFGaYUBfbLrPrJQm6n2KiIB0AnavaHnaG
         QfD5hMNFR3w7Hsd0OQfDe6o3Ifk1APZEJvtuuJH5ZAwiVr9S/EIUem4SnFQxgEL/rj1b
         x+BQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-subscribe:list-archive:list-help:list-post:list-id
         :mailing-list:precedence:content-transfer-encoding:mime-version
         :subject:list-unsubscribe:feedback-id:message-id:date:reply-to:from
         :to:sender:dkim-signature;
        bh=vr0AgDfQvBiRg9w8FxzKnX2YY2AnKcnfZhXb/qeDeQA=;
        b=NniQS/lrEDriUcNdFb249SyZHW+ktKIeMs4bwoIgjqrbvuQANighrAKsZOzBs+QpQv
         bCTOAlKNvXni0KpCE+y+Nb9Rh3oDqcaduJ8WuhE1+D/5Pf+K3ln5jZW3dsJkNCwZwrY0
         6HNNHmfDnsGKghpbykDPWJCne5//fPpSiacRiGSaWjs4S6WYsS1EeVmu208mNCUREZCm
         XZoCF7lWfn6lzYLizo6rTNUwNFi+Jg9kdLbr1iu+XyhNYDSO43RcbVrgLAHbTdxo0GqO
         BG/XHeQTOgiDFwAiQX3oVBn1X7O7CxWq4vWR0tAR5NI++FFGGRtbBdMUteEDctK5GOly
         /a1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="afzBK4/H";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:reply-to:date:message-id:feedback-id
         :list-unsubscribe:subject:mime-version:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe;
        bh=vr0AgDfQvBiRg9w8FxzKnX2YY2AnKcnfZhXb/qeDeQA=;
        b=TywSI4FnGPFF1BbRwHQ550GjhOA2TCXn4JfeM5xsXYZHlBjIhO1BIPksilhkOxldCn
         CRKJ8FUNmrYpyBAy92FCornvrVJYfpRCl+8lzkAvA1g18kUkJNDL/EmuDIA8FqKBpGHB
         eNI2ko3oefs9t6dx2G02x3Gm0gPQ1Fd55pS+/d46TxVAEh0xXz1qRdAwx8yOqoxTMXex
         7so3PXVGy7XJ+VL7bR0/FeDh/jUsDJr+1qHdqjAc7ew3Uj/KPy5PWei5pujvWIFHYBPx
         L4IMzN12ULV2y5EtXpnC+WTbW9wbtcldIgG+GO81fMc43vkX+iIJCEeSI+3tG0JTv/Lj
         2bBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:reply-to:date:message-id
         :feedback-id:list-unsubscribe:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe;
        bh=vr0AgDfQvBiRg9w8FxzKnX2YY2AnKcnfZhXb/qeDeQA=;
        b=At61PuzbwzAJDhd4NScyqFbPxLWyCAZ5SPZCX32dmOe3NqDi6uJF3K9xiq6egWaQ4z
         VWkO5IBn11/Hke75hWT3ImHiLgT9Y3xFAACSoS0um7Fu2RFW3JnLTapz62r9V7kfz99a
         mQMHdpvIy6KsgsQ3Wo4OTHt2YwBu67L1VIj+4v5r8IfF79S4SZGzk+yCAVexq9Lbp3Ai
         AVottZgj6y7RBe3ZFz/18g/+kbjFZXzjue/GnrMdEWJwt/HSYOoXSAjUYmQu7xAA2ol+
         N0vUnav9c4EUgoEpTGQ0zCvtQaE30AlmQ/0TD/xaTW4QMhpfLfr9p7f2lguhspD8VhYe
         qQrw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530zKJpnVPQ+f1roZwEZI/lGgbO+uXdqhYOYrV4/K9yucI+uQoHw
	CgVMN2+mGtKsVIvb2RNRGKA=
X-Google-Smtp-Source: ABdhPJygJbOtO+wrIQINqeko6hz1BY6i0rFvjLreZkv2tiegTRnRRjBKdoyFZgkggHRq3ow/dVHjlg==
X-Received: by 2002:a2e:3e0e:: with SMTP id l14mr4086758lja.210.1603645298238;
        Sun, 25 Oct 2020 10:01:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:14d:: with SMTP id c13ls1034951ljd.8.gmail; Sun, 25
 Oct 2020 10:01:37 -0700 (PDT)
X-Received: by 2002:a2e:b009:: with SMTP id y9mr3956064ljk.372.1603645297085;
        Sun, 25 Oct 2020 10:01:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603645297; cv=none;
        d=google.com; s=arc-20160816;
        b=ZR67l9Qpxr5vre4/+9WSfnDC9kzAmhzYgztWhaDnKMC8xqqOi0TObTqjZSicKaUCwa
         ZIBlV3p5IoXqVYyk+hYlzTopeKoGNZfxKozioVAX7YoI4+t27UAIom3J+Xywky1QKAeZ
         YNpXxxqcdJv4JUMW8beyVLSAO4c4Wy64mM7T0eUyLF1rpc5TviW/5THuyI5rtO7CgZmj
         VQsZN20abwD0Y3zuwUKHmhOJrcWbcM+JSZPRfLZCUp2PdGjz3bXVZow3zBieJ9aDdja9
         wgZFcwENFNGUpwClP8k15ygA+LQOP1n0SyN1kS6ULZmROqUca6EvfH1ZHVpaExeDboRj
         /Idg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:list-unsubscribe
         :feedback-id:message-id:date:reply-to:from:to:dkim-signature;
        bh=OWNwjd3ukdp84MFV1NUAAvaV2FaAxMZF2bgcSduuCLY=;
        b=QDkApFpmrhwGxRMGje40Oq/qxPzJB/1tYsJMAoS4Wqvm4kIQ8WYRgvC/EcKBVGNAYo
         /ParPNDWpBYJXdJZQuFqakvoi8D1GriH+n1072nYnwoWU+cofLxyha5dkah5BhtD2ocY
         dTBB03caUEaPLxkmNSWpuQOk0w3DmL5OjSm/CsrV/gdY/wz73QxFl5xA+1Imne66f9y1
         XCDo3M5pjP2SyHRnTocSKkwfFDKOu8CX9FuDmyrkIUfcEN1uiG8+tUC5QbojGbP3LytL
         4UE8p9PrzoQbhX+jlCB1ISR9cA61cdObSGrlq7je0vOiBNs92VzLQZ1QOqIB+0xeulih
         VNKA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=fail header.i=@ics.events header.s=dkim header.b="afzBK4/H";
       spf=softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) smtp.mailfrom=conf@ics.events
Received: from s5mt162p.consultorpc.com (s5mt162p.consultorpc.com. [93.159.215.162])
        by gmr-mx.google.com with ESMTP id q11si160287lfo.8.2020.10.25.10.01.37
        for <jailhouse-dev@googlegroups.com>;
        Sun, 25 Oct 2020 10:01:37 -0700 (PDT)
Received-SPF: softfail (google.com: domain of transitioning conf@ics.events does not designate 93.159.215.162 as permitted sender) client-ip=93.159.215.162;
Received: by s5mt162p.consultorpc.com id himnmu16r3g5 for <jailhouse-dev@googlegroups.com>; Sun, 25 Oct 2020 18:01:32 +0100 (envelope-from <conf@ics.events>)
To: <jailhouse-dev@googlegroups.com>
From: "John Dreamer" <conf@ics.events>
Reply-To: "John Dreamer" <conf@ics.events>
Date: Sun, 25 Oct 2020 18:01:15 +0100
Message-ID: <57500d04020c0b000456530a03090452535e00540103025700575c08020657545c56500e510f5307050559510403@ics_ip-zone_com-6>
X-CcmId: 0c0246685a491d495f08046d555d0c5e515205530a040d5206
Feedback-ID: 218315:218315-35:1:Mailrelay
X-Report-Abuse: Please report abuse for this campaign here http://ics.mailrelay-v.com/ccm/abuse?a=218315&m=35&s=28238
X-OriginalSender: conf@ics.events
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>
Subject: =?utf-8?Q?=F0=9F=8E=83=20ICADS-Springer=20Publication=20(AISC=20?=
 =?utf-8?Q?series).Scopus=2CQ3.=20WoS=20Indexation.?=
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="-------5f95af5b29309"
Content-Transfer-Encoding: 7bit
X-Original-Sender: conf@ics.events
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=fail
 header.i=@ics.events header.s=dkim header.b="afzBK4/H";       spf=softfail
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

---------5f95af5b29309
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


=F0=9F=8E=83 ICADS-Springer Publication (AISC series).Scopus,Q3. WoS Indexa=
tion.
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Dear Researcher,=C2=A0
You are cordially invited to the 2021 International Conference on Advances =
in Digital Science (ICADS 2021), to be held in virtual format 19 =E2=80=93 =
21 February 2021, is an international forum for researchers and practitione=
rs to present and discuss the most recent innovations, trends, results, exp=
eriences and concerns in the several advances of Digital Science.

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


Due to the restrictions caused this year by COVID-19 Pandemic, correspondin=
g=C2=A0authors with registration in ICCS2020 will have a discount of 50 USD=
 in the ICADS 2021 registration.

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
jailhouse-dev/57500d04020c0b000456530a03090452535e00540103025700575c0802065=
7545c56500e510f5307050559510403%40ics_ip-zone_com-6.

---------5f95af5b29309
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w=
3.org/TR/REC-html40/loose.dtd">
<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"><title>=F0=9F=8E=83 ICADS-Springer Publication (AISC series).Scop=
us,Q3. WoS Indexation.</title></head><body>
<div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=C2=A0<a href=3D"http://ics.mailrela=
y-v.com/newslink/340285/25.html"><img alt=3D"" src=3D"https://powerlux.com.=
ua/upload/slider/halloween.jpg" style=3D"width: 370px; height: 128px;" widt=
h=3D"370" height=3D"128"></a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<span style=3D"font-size:22px;"><span sty=
le=3D"color:#ff0099;"><strong>Dear Researcher,</strong></span></span>=C2=A0=
<br><strong>You are cordially invited to</strong> the 2021 International Co=
nference on Advances in Digital Science (ICADS 2021), to be held in virtual=
 format 19 =E2=80=93 21 February 2021, is an international forum for resear=
chers and practitioners to present and discuss the most recent innovations,=
 trends, results, experiences and concerns in the several advances of Digit=
al Science.<br>
Conference website <a href=3D"http://ics.mailrelay-v.com/newslink/340285/24=
.html" target=3D"_blank">https://ics.events/<strong>icads-2021</strong>/</a=
>.<br>
You may submit your paper online via Conference Submissions Form=C2=A0on <a=
 href=3D"http://ics.mailrelay-v.com/newslink/340285/24.html">https://ics.ev=
ents/<strong>icads-2021</strong>/</a>. Submitted papers (until 10-12 page l=
imit) must be written in English, must not have been published before, not =
be under review for any other conference or publication, must comply with <=
a href=3D"http://ics.mailrelay-v.com/newslink/340285/14.html" target=3D"_bl=
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
Due to the restrictions caused this year by COVID-19 Pandemic,<span style=
=3D"color:#800080;"> <strong>corresponding</strong>=C2=A0<strong>authors wi=
th registration in ICCS2020 will have a discount of 50 USD in the ICADS 202=
1 registration</strong></span>.<br>
=C2=A0<br><strong>Important Dates</strong><br>
Submission: =C2=A0=C2=A0 <span style=3D"color:#FF0000;"><strong>November 01=
, 2020</strong></span><br>
Notification: =C2=A0 <strong>December 11, 2020</strong><br>
Registration:=C2=A0=C2=A0 <strong>December 21, 2020</strong><br>
Event Dates:=C2=A0=C2=A0 <strong>February 19-21, 2021</strong><br>
=C2=A0<br>
ICADS 2021 Convener.<br><a href=3D"http://ics.mailrelay-v.com/newslink/3402=
85/23.html" target=3D"_blank"><strong>https://ics.events/</strong></a>.<br>
=C2=A0</div>
<img src=3D"http://ics.mailrelay-v.com/newsimg/340285/logo.gif" width=3D"1"=
 height=3D"1" alt=3D"" border=3D"0"></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/57500d04020c0b000456530a03090452535e00540103025700=
575c08020657545c56500e510f5307050559510403%40ics_ip-zone_com-6?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/57500d04020c0b000456530a03090452535e00540103025700575c08020657545c56500e=
510f5307050559510403%40ics_ip-zone_com-6</a>.<br />

---------5f95af5b29309--

