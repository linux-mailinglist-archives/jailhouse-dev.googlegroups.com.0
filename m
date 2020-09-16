Return-Path: <jailhouse-dev+bncBDYOZ7URUIMBBVUXRD5QKGQEFU4ED3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103d.google.com (mail-pj1-x103d.google.com [IPv6:2607:f8b0:4864:20::103d])
	by mail.lfdr.de (Postfix) with ESMTPS id F356C26C303
	for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 14:57:59 +0200 (CEST)
Received: by mail-pj1-x103d.google.com with SMTP id f9sf1511164pjp.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 16 Sep 2020 05:57:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600261078; cv=pass;
        d=google.com; s=arc-20160816;
        b=dMrYVI1b1FVIzG9VA1JQsNTXRQnp5rI8JQuARBIP/gGb980sjmHeSX4xNMdI693txE
         Llr+ST+2TYY9qYA7cX9WGJLRqFgAYoi5nNdywF4kWufkcvF8DIpb/EcoeXiq7mdpeiEn
         MRGnoD5dak78yGr6hfEs/MEKA6Z/+KJhTFPCYWyGZPgZClOL9QvYV5eL2PqLurY6jSx3
         5sgPk3gwIQkutFv0ZC+S+c5kXp5kvRIj+kFMiO8jeVXK5VpEqm8AAzdWJMNm0NJtFa5g
         Ja2IxwODDdod6VO8hLqoxtLqiiy1t7MrmjjqsBTFbKoVJVBavcloeWZzhjLnFRtbF14V
         nVQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:message-id:mime-version:subject:to
         :from:date:sender:dkim-signature;
        bh=MPVTVAwH62TKk1Z0EoA+NII+WwfJ/lhiz7yiIDTV/uk=;
        b=XgSd8hhntMNLzZaUf9KDGfMF+CRvXTJ3EWV/fE8NU+iAwTSVv+OO0Bf5PmaPeiBxed
         V3D0ygYGPLcfPXfTjCj1rYFrstVo73e2/9oIMMraRxw0/pDCDUZgWb4Nw+ytXoJM0AG3
         Udovk3mZpqtq1ozLli7AC4bvRpEs+9K1JIpYnlwmPFJlK+b+zmxR0XfLt6rezYaDMgo9
         4R0v9DnTKR41mubl7g9MK3U8gC8JwY7zLL1DSbn52TXtYBBY9ixXCWC6pvgGhW65bgJ7
         506wywqrqffHT6qJDcLUzewbQFWaD97mZWI/hbM3vuBjnFGQ77ovyP9y2pIMEXt9zU8x
         fYHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of qyresearch.fendi@vip.163.com designates 59.111.176.110 as permitted sender) smtp.mailfrom=qyresearch.fendi@vip.163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=vip.163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:subject:mime-version:message-id
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MPVTVAwH62TKk1Z0EoA+NII+WwfJ/lhiz7yiIDTV/uk=;
        b=Uu29ELomx++czEXF0dvSIoU8X9oze2XxcqOpxJMP4pjwnQDtOmubpdUfXjfnZPf9z7
         WFMzsgOTZVXpXfeusJjqbTyQ8U3pGgPs/wg6BdsEAFiQVjn5CqxBmN1RmFaBbnGmPZtp
         GIW1g0TtSE9mpsOjsc5DVZflPiYtxv7ZWCVfIOUNnVEiF4aL9apoyhpPqpfQEQ2YXEp6
         AmqykIcEwtzmVD+LOijgfiAgkH5QZyw2lZd4G7LXr3GyPQt7PgzakYfVu+2tJ0LJVwSl
         lh/vi3m1OrJYwqoOzSKKCoYiLLqftcvy7u7w4p0oxjIYi3QTodEKX8OJyDIUw+z3uNg1
         nQVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:subject:mime-version
         :message-id:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=MPVTVAwH62TKk1Z0EoA+NII+WwfJ/lhiz7yiIDTV/uk=;
        b=iaSxmkAA+T867AfTovigZCOLuFpKLTydgXA6BuBDcHTeCY0s9ClECa4ixUcWQl4qHM
         e/z9ca0d9lGCFHapEBG4trifnTrUs8576BAdl1PDaIfuC9mmKZmqgjfjaFWyU2nw66qK
         bMj5wGQ1aE4hZ9a87mvCJuGNxbRSjh8n8WE8yDTBw5cUexdkFWKrYAKwKGSAT57kx9Vh
         L+F0kn0D5tz9R6nPTkrOr8x0Pep2ZHLYfuR0am7vhBaLTV1LpDdrlByIVH1uQmiHh0GL
         aARmtt0zLvysphuOlpeQbN97pQpMtV5PBq0wyblRMp0lrhoLlpsRRdkRHpxCBlCT8Qr9
         4ZkA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GXYx9cv4ITwLQg5Ok2ahpk/V3a5Zad7NRO4eKyJn+dmJaERtI
	I+nkfeBls0ytaLvG6+Ps3Sw=
X-Google-Smtp-Source: ABdhPJztJFLisILTZnfQZ5ODLtenS4WqANZ0xf2r/tLr9Kp+ZxVV1t5BKS3+MCjwLvWS+vRrz4Ubdw==
X-Received: by 2002:a63:1a21:: with SMTP id a33mr18882915pga.305.1600261078603;
        Wed, 16 Sep 2020 05:57:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:d704:: with SMTP id y4ls1104073pju.3.canary-gmail;
 Wed, 16 Sep 2020 05:57:58 -0700 (PDT)
X-Received: by 2002:a17:90b:88d:: with SMTP id bj13mr3828633pjb.80.1600261077964;
        Wed, 16 Sep 2020 05:57:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600261077; cv=none;
        d=google.com; s=arc-20160816;
        b=NxrbhRcCBu6M+EoTebJOF57HLsuLB/9hdJLjfpPMUTomH89BOlFj5pfWLUZwzhZAY4
         TWgwjlRpVRJ65Vh/iC8xLSbiT37QzmYhigNv2MWodqUwKWmLl0+iDzFCA4v7BteVztA+
         VsMdM70f4t1PFaZvXWh9h5MX+kLd2K4MkVdQ7KTQarXmPE61Yk1i5ZwPBjvZz9ELvqta
         yxWtWF02z1iHSFIobQJZuDkfkT5ChXMtlVkcXkKE1BeOhBiWpwRZgwOfNpi9WKQ1rD/y
         ep8MJxu3AEzHV1Hn48G8ctuHDF6v5eJxk3qr11HssTWj2J/37wur3CapEgvKi3JbQydR
         3bJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=message-id:mime-version:disposition-notification-to:subject:to:from
         :date;
        bh=zyBrmrbwG+SfyU7PAmFfDOHK2q1PaoD0M2nqYfSF9tw=;
        b=hZG9YqXtnWoWVucyMkmua60lesUM4P8qSC+/zrw2SbgS9w0QjBOOBUvmRSflhf73Gg
         Sc9OVNdua9aa8FrDkgUafVI7EexTk6kXBLlhkoZiavBeO6jtr0MQeqRv9gdVaIvWlOln
         ROzbJOf5kaVhH62arn5vvT0cCKPkXFSijiPnwhc7NA7KoyxV2Z/qKiceqqdet29kM6o/
         iXj3HTJ6GNBg9OYZTZ9m4E/s1HDTH9NcBYwAUwtQuG0usCf0tgmXDk4iEmfFJC4pNxuQ
         9OzwkBM0iJqxwH6xriZdTLL/aZ3ATc9v6/Ka1oncqOW2n79G68ziEEPrUAGVNSPtsHMb
         ZHHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of qyresearch.fendi@vip.163.com designates 59.111.176.110 as permitted sender) smtp.mailfrom=qyresearch.fendi@vip.163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=vip.163.com
Received: from mail-176110.vip.163.com (mail-176110.vip.163.com. [59.111.176.110])
        by gmr-mx.google.com with ESMTP id p15si105927plr.5.2020.09.16.05.57.55
        for <jailhouse-dev@googlegroups.com>;
        Wed, 16 Sep 2020 05:57:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qyresearch.fendi@vip.163.com designates 59.111.176.110 as permitted sender) client-ip=59.111.176.110;
Received: from qyresearch.fendi$vip.163.com ( [36.44.97.178] ) by
 ajax-webmail-wmsvr10 (Coremail) ; Wed, 16 Sep 2020 20:33:08 +0800
 (GMT+08:00)
X-Originating-IP: [36.44.97.178]
Date: Wed, 16 Sep 2020 20:33:08 +0800 (GMT+08:00)
From: Fendi_Qyresearch <qyresearch.fendi@vip.163.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: New Trends in E-Prescribing System Market August 2020
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20200904(c7fce92a)
 Copyright (c) 2002-2020 www.mailtech.cn 163vip
Content-Type: multipart/alternative; 
	boundary="----=_Part_1161_1861104014.1600259588577"
MIME-Version: 1.0
Message-ID: <16af84c9.184.17496e781e1.Coremail.qyresearch.fendi@vip.163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: bpHICgBXJV0EBmJfBZUAAA--.4137W
X-CM-SenderInfo: 5t1uv2phduuxgoih0vnl6yx1iorwjhhfrp/1tbiHwSh1l6YHOaSgA
	AJsL
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==
X-Original-Sender: qyresearch.fendi@vip.163.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of qyresearch.fendi@vip.163.com designates 59.111.176.110
 as permitted sender) smtp.mailfrom=qyresearch.fendi@vip.163.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=vip.163.com
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

------=_Part_1161_1861104014.1600259588577
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Hope you are doing well.

This is Fendi from QYResearch INC.

Recently, we published the< Global E-Prescribing System Market Research Rep=
ort 2020>. We recommend you this report and kindly let us know if you are i=
nterested in it.

This report will walk you through the E-Prescribing System market from the =
following aspects in: Consumption, Sales, Revenue, Price, Cost, Gross Margi=
n, Market size, Market share, Growth Rate, Trends, etc. In addition, We hav=
e researched the situation of COVID-19 thoroughly and all the reported data=
 have considered the impact of COVID-19.

If you are interested in getting more details or Sample report, please cont=
act fendi@qyresearch.com

In case this report is not relevant to you, please forgive me for disturbin=
g. If you can direct me to the correct contact in your company, that would =
be most appreciated.

The following manufacturers are covered in this report:

l  Aprima

l  Cerner Corporation

l  eClinicalWorks

l  Practice Fusion

l  eMDs

l  Surescripts

l  Allscripts

l  iMedX

l  Athena health

l  Henry Schein e-prescribe

=E2=80=A6=E2=80=A6

(Other manufacturers Information=E2=80=A6=E2=80=A6)

Main chapters showed:

1 Report Overview

    1.1 Study Scope

    1.2 Market Analysis by Type

        1.2.1 Global E-Prescribing Systems Market Size Growth Rate by Type:=
 2020 VS 2026

        1.2.2 Stand-Alone System

        1.2.3 Integrated System

    1.3 Market by Application

        1.3.1 Global E-Prescribing Systems Market Share by Application: 202=
0 VS 2026

        1.3.2 Hospitals

        1.3.3 Clinics

        1.3.4 Pharmacy

    1.4 Study Objectives

    1.5 Years Considered

=20

2 Global Growth Trends

    2.1 Global E-Prescribing Systems Market Perspective (2015-2026)

    2.2 Global E-Prescribing Systems Growth Trends by Regions

        2.2.1 E-Prescribing Systems Market Size by Regions: 2015 VS 2020 VS=
 2026

        2.2.2 E-Prescribing Systems Historic Market Share by Regions (2015-=
2020)

        2.2.3 E-Prescribing Systems Forecasted Market Size by Regions (2021=
-2026)

    2.3 Industry Trends and Growth Strategy

        2.3.1 Market Trends

        2.3.2 Market Drivers

        2.3.3 Market Challenges

        2.3.4 Market Restraints

About QYResearch
QYResearch, established in 2007, focuses on custom research, management con=
sulting, IPO consulting, industry chain research, and data base &seminar se=
rvices.

QYResearch has more than 4000 global well-known customers, covering more th=
an 30 industries including energy, automobiles, pharmaceuticals, chemicals,=
 agriculture, etc. QYResearch built research or marketing centers in China =
(Beijing, Shengzhen, Guangzhou, and Hong Kong), USA, Canada, Germany, UK, F=
rance, etc.

Currently, QYResearch has become the first choice, worthy and trusted consu=
lting brand in Global business consulting services. As of now, QYResearch h=
as served the most of Fortune 500 companies.

Thank you for reading.

=20

------------------

Best Regards

Fendi Zhang | Senior Sales Manager

QYResearch INC.

Phone:  +86 13763338542(7*24H)

E-mail:  fendi@qyresearch.com

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/16af84c9.184.17496e781e1.Coremail.qyresearch.fendi%40vip.163.=
com.

------=_Part_1161_1861104014.1600259588577
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
</head>
<body>
<style>
    font{
        line-height: 1.6;
    }
    ul,ol{
        padding-left: 20px;
        list-style-position: inside;
    }
</style>
<div style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,Verdana,&quo=
t;Microsoft Yahei&quot;,SimSun,sans-serif;font-size:14px; line-height:1.6;"=
>
    <div></div>
<style>
    font{
        line-height: 1.6;
    }
    ul,ol{
        padding-left: 20px;
        list-style-position: inside;
    }
</style>
<div style=3D"font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91,Verdana,&quo=
t;Microsoft Yahei&quot;,SimSun,sans-serif;font-size:14px; line-height:1.6;"=
>
    <div></div><div>
    <div><p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;=
"><span lang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">Hi,<o:p>=
</o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">Hope you are doin=
g well.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">This is Fendi fro=
m QYResearch INC.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">Recently, we publ=
ished the&lt;&nbsp;<b>Global
E-Prescribing System Market Research Report 2020</b>&gt;.&nbsp;We recommend=
 you
this report and kindly let us know if you are interested in it.<o:p></o:p><=
/span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">This report will =
walk you through the <b>E-Prescribing
System </b>market from the following aspects in: Consumption, Sales, Revenu=
e,
Price, Cost, Gross Margin, Market size, Market share, Growth Rate, Trends, =
etc.
In addition, We have researched the situation of COVID-19 thoroughly and al=
l
the reported data have considered the impact of COVID-19.<o:p></o:p></span>=
</p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">If you are intere=
sted in <u>getting more details</u> or <u>Sample report</u>,
please contact <a href=3D"mailto:fendi@qyresearch.com">fendi@qyresearch.com=
</a><o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">In case this repo=
rt is not relevant to you, please forgive me for
disturbing. If you can direct me to the correct contact in your company, th=
at
would be most appreciated.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><b><spa=
n lang=3D"EN-US" style=3D"mso-bidi-font-size:
10.5pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;mso-bidi-font=
-family:Vijaya;
mso-font-kerning:0pt;mso-bidi-language:AR">The following manufacturers are
covered in this report:</span></b><span lang=3D"EN-US" style=3D"mso-bidi-fo=
nt-size:
10.5pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;mso-bidi-font=
-family:Vijaya"><o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Apri=
ma<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Cern=
er
Corporation<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">eCli=
nicalWorks<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Prac=
tice
Fusion<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">eMDs=
<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Sure=
scripts<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Alls=
cripts<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">iMed=
X<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Athe=
na
health<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm 10.5pt 21=
pt; text-indent: -21pt;"><span lang=3D"EN-US" style=3D"mso-bidi-font-size:1=
0.5pt;font-family:Wingdings;mso-fareast-font-family:
Wingdings;mso-bidi-font-family:Wingdings;mso-font-kerning:0pt;mso-bidi-lang=
uage:
AR">l<span style=3D"font-stretch: normal; font-size: 7pt; line-height: norm=
al; font-family: 'Times New Roman';">&nbsp;
</span></span><b><span lang=3D"EN-US" style=3D"mso-bidi-font-size:10.5pt;fo=
nt-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:Vijaya;mso-font-kerning:0pt;mso-bidi-language:AR">Henr=
y
Schein e-prescribe<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">=E2=80=A6=E2=80=
=A6<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">(Other manufactur=
ers Information=E2=80=A6=E2=80=A6)<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm; line-hei=
ght: 17.85pt;"><b><span lang=3D"EN-US" style=3D"font-family: Verdana, sans-=
serif;">Main chapters showed:<o:p></o:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">1 Report Overview=
<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 1.1 Study Scope<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 1.2 Market Analysis by Type<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.2.1 Global E-Prescribing
Systems Market Size Growth Rate by Type: 2020 VS 2026<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.2.2 Stand-Alone System<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.2.3 Integrated System<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 1.3 Market by Application<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.1 Global E-Prescribing
Systems Market Share by Application: 2020 VS 2026<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.2 Hospitals<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.3 Clinics<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 1.3.4 Pharmacy<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 1.4 Study Objectives<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 1.5 Years Considered<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;</span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">2 Global Growth T=
rends<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 2.1 Global E-Prescribing Systems
Market Perspective (2015-2026)<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 2.2 Global E-Prescribing Systems
Growth Trends by Regions<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.2.1 E-Prescribing Systems
Market Size by Regions: 2015 VS 2020 VS 2026<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.2.2 E-Prescribing Systems
Historic Market Share by Regions (2015-2020)<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.2.3 E-Prescribing Systems
Forecasted Market Size by Regions (2021-2026)<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
; 2.3 Industry Trends and Growth
Strategy<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.3.1 Market Trends<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.3.2 Market Drivers<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.3.3 Market Challenges<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; 2.3.4 Market Restraints<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><b><spa=
n lang=3D"EN-US" style=3D"font-size:14.0pt;font-family:&quot;Verdana&quot;,=
&quot;sans-serif&quot;;
mso-fareast-font-family:=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=91;mso-bidi-font-=
family:=E5=AE=8B=E4=BD=93;color:#002060;mso-font-kerning:
0pt">About QYResearch</span></b><span lang=3D"EN-US" style=3D"font-size: 11=
.5pt; font-family: Verdana, sans-serif;"><br>
</span><span lang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">QYR=
esearch, established in 2007, focuses on custom research, management
consulting, IPO consulting, industry chain research, and data base &amp;sem=
inar
services.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">QYResearch has mo=
re than 4000 global well-known customers, covering more
than 30 industries including energy, automobiles, pharmaceuticals, chemical=
s,
agriculture, etc. QYResearch built research or marketing centers in China (=
Beijing,
Shengzhen, Guangzhou, and Hong Kong), USA, Canada, Germany, UK, France, etc=
.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">Currently, QYRese=
arch has become the first choice, worthy and trusted
consulting brand in Global business consulting services. As of now, QYResea=
rch
has served the most of Fortune 500 companies.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left" style=3D"margin: 10.5pt 0cm;"><span l=
ang=3D"EN-US" style=3D"font-family: Verdana, sans-serif;">Thank you for rea=
ding.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left"><span lang=3D"EN-US" style=3D"font-fa=
mily: Verdana, sans-serif; background: white;"><o:p>&nbsp;</o:p></span></p>

<p class=3D"MsoNormal" align=3D"left"><span lang=3D"EN-US" style=3D"font-si=
ze:9.0pt;font-family:&quot;Verdana&quot;,&quot;sans-serif&quot;;
mso-bidi-font-family:=E5=AE=8B=E4=BD=93;color:#909090;mso-font-kerning:0pt"=
>------------------<o:p></o:p></span></p>

<p class=3D"MsoNormal" style=3D"mso-margin-top-alt:auto;mso-margin-bottom-a=
lt:auto;
mso-pagination:widow-orphan;background:white"><b><span lang=3D"EN-US" style=
=3D"font-size: 9pt; font-family: Verdana, sans-serif;">Best Regards<o:p></o=
:p></span></b></p>

<p class=3D"MsoNormal" align=3D"left"><b><span lang=3D"EN-US" style=3D"font=
-size: 9pt; font-family: Verdana, sans-serif; background: white;">Fendi Zha=
ng</span></b><span lang=3D"EN-US" style=3D"font-size: 9pt; font-family: Ver=
dana, sans-serif; background: white;"> | Senior
Sales Manager<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left"><span lang=3D"EN-US" style=3D"font-si=
ze: 9pt; font-family: Verdana, sans-serif; background: white;">QYResearch I=
NC.<o:p></o:p></span></p>

<p class=3D"MsoNormal" align=3D"left"><b><span lang=3D"EN-US" style=3D"font=
-size: 9pt; font-family: Verdana, sans-serif; background: white;">Phone:</s=
pan></b><span lang=3D"EN-US" style=3D"font-size: 9pt; font-family: Verdana,=
 sans-serif; background: white;">&nbsp; +86 13763338542(7*24H)<o:p></o:p></=
span></p>

<p class=3D"MsoNormal" align=3D"left"><b><span lang=3D"EN-US" style=3D"font=
-size: 9pt; font-family: Verdana, sans-serif; background: white;">E-mail:</=
span></b><span lang=3D"EN-US" style=3D"font-size: 9pt; font-family: Verdana=
, sans-serif; background: white;">&nbsp; <u><a data-auto-link=3D"1" href=3D=
"mailto:fendi@qyresearch.com">fendi@qyresearch.com</a></u><o:p></o:p></span=
></p></div><div id=3D"ntes-pcmac-signature" style=3D"font-family:'=E5=BE=AE=
=E8=BD=AF=E9=9B=85=E9=BB=91'"><div style=3D"font-size:14px; padding: 0;  ma=
rgin:0;"><div style=3D"padding-bottom:10px;margin-bottom:10px;display:inlin=
e-block;"><div style=3D"font-family:&quot;=E5=BE=AE=E8=BD=AF=E9=9B=85=E9=BB=
=91&quot;; font-size: 14px; color:#000000">

   =20
</div>
        </div>
    </div>
     </div>
</div><style>
        font{
            line-height: 1.6;
        }
    </style>
</div><!--=F0=9F=98=80-->
</div>
</body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/16af84c9.184.17496e781e1.Coremail.qyresearch.fendi=
%40vip.163.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.googl=
e.com/d/msgid/jailhouse-dev/16af84c9.184.17496e781e1.Coremail.qyresearch.fe=
ndi%40vip.163.com</a>.<br />

------=_Part_1161_1861104014.1600259588577--

