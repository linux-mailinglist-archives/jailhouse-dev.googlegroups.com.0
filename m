Return-Path: <jailhouse-dev+bncBDMORPMP3UARB6NKUPWAKGQEVAGJ57I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id A0FE5BB6A0
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Sep 2019 16:23:54 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id k5sf6139733edx.13
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Sep 2019 07:23:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569248634; cv=pass;
        d=google.com; s=arc-20160816;
        b=RuSrXxIrHVPLFl2L3U3BsIw/TMVvZ7Y4tarONmokXK60wQFQV98aQEa19i+8TRwL04
         U9CtR0JJi+g7izS5AnGUTH4u8pRDVfnEpJfaSqoVSx22pK5s9Tvon7F7XB86f4A4RyaE
         GBvB4eEE/MUxc0hS5nKPoLkKR8d2iAg7gPEn8sJJ0UtXXTXux9t5H/EKC09uNK91SABC
         TFMTp+1GD2vakShzj3VWC4hbZeJd5jfexxaFAAkUWSgtV4qscAAT3MU0tW3cv8YW6eP2
         0qCyyUyj274JHb8CPfm4Y5hGrinfVyCFPknLBb17E13TMxhrENqSxaZn9dlzSJc18d++
         Oj2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:thread-index
         :mime-version:message-id:date:subject:to:from:reply-to:sender
         :dkim-signature;
        bh=y4EWpgIZaaptRLyKSh3MyFRO7xX926+YgvpR5E24mWI=;
        b=RdwRFtwOjG+TAiQCAn3/nN+5mIj6evFT1R6Pkjh3IshC4TmifUB5Mq19ABCyfzxaj0
         qsbXM9mI/J0FGP8Z4R9mKiLjdTcJYgvEnDS3kilRFwc4CdRuLVmY9RU9gtMJjih6Kmd0
         8GCSdm1ILpHQgSvOkfQCk2hqkMxDhTHih0Sbd1sp0OLgwOlgoATjE+1hGzxrSckrc4mE
         M3nwPokjMpX3hqjHwxH5sJUqQUrjhuACYJl3Ye9cjlRsrum/WthhvkNHFKa9NAS5YiNp
         dw/ybtkv0cC8wzLf1C68Kx97bqFgpq9Hcja6rKbdGS0HrtaEH+rMpVcrENUXnd0oQe1T
         sfpw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=neutral (google.com: 193.46.215.84 is neither permitted nor denied by best guess record for domain of chris@promosensebiz.com) smtp.mailfrom=chris@promosensebiz.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:reply-to:from:to:subject:date:message-id:mime-version
         :thread-index:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y4EWpgIZaaptRLyKSh3MyFRO7xX926+YgvpR5E24mWI=;
        b=gJK1n6WZcExG3hgmPm108vZTDFKHLSujAg91odXOV+Mlx2Cw+LZwrSJXz9Ac8m/+sI
         9mr6O+KGQDPBFTrFpwuKEroBrATO1i2AVImLj/qUhFV4qy+2/wB6IFl93O60ITJvQ8uj
         Ov7bh2FHJh5jzEhDOp4tdr4WdXqsL/xuVUx8dZbJNNrNMUba25iku12y7sKEJpojT9G1
         A+8TQ8ZCejQtGJZpsEfVfYBr/yp6+0r3+1t3G3DbWY1dhtsEqYYLB1E8BSdI1Br8Z2wU
         gr+86OTEZ4ih3yWgNFIn/7aTixTIh3YBa7jW29Jyig7WuHIY8BXvYJyu1jQQk6Yg6FD1
         pe2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:reply-to:from:to:subject:date:message-id
         :mime-version:thread-index:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=y4EWpgIZaaptRLyKSh3MyFRO7xX926+YgvpR5E24mWI=;
        b=DakV954tgapBOmf7OpPanX+7cuSOn3e5DYQtMJRuTTcFRTpD0Kk8r9hI8+SB6A9wFn
         nVCzuyTA+mc/83ujZtMJuwXm0MI1uqvuhbdcnKKWiwfrSloXvCXKiKoIZl1isPF7Iffp
         TWka7Xhy7tLOzWHpLJDZxS4TwyfZls6QbEFvsJx6SPWhUcME6QsSAKiB4I/DKj5qzz7u
         Bb/q9iOWwUz+fRSEHFG5Ub/0+m62BwN9VvXe04CwCljJqpbxjiFg4acKM6kiQ/w5panK
         ZEQmnoivrl0vG/VnC0BKlfgHBoZCVyClKGCe1m2YwZ1BUlL1wlapZ8FCIurGYU5d1F3j
         7Gbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUARAdbH5cfIMnuYEHjVld9Rj09+HdHY8xp8lLHPN+5TwD/VLq2
	XJQJlwI3SS2z192rZlh+7AE=
X-Google-Smtp-Source: APXvYqyz20Hejak9rJPHn87vTk4peTAbVtNl0VgfipODMJCLkSpuyd7EwPXvvTebbCrF1E/SuPI0kw==
X-Received: by 2002:a50:e691:: with SMTP id z17mr355055edm.84.1569248634259;
        Mon, 23 Sep 2019 07:23:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a50:ac25:: with SMTP id v34ls334930edc.10.gmail; Mon, 23 Sep
 2019 07:23:53 -0700 (PDT)
X-Received: by 2002:a50:b884:: with SMTP id l4mr258848ede.295.1569248633622;
        Mon, 23 Sep 2019 07:23:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569248633; cv=none;
        d=google.com; s=arc-20160816;
        b=h2Z5YGb/18TI/feP3zVCnT6GkjIckJKEq1tr620s+tI1lOCu/tXSi8YpSV89ltw27R
         bfUprutdYJMcxZ4/zIaf843RMlzytVzO+0FpQ5r/8mE2U6KH/Fui4hDYEOf0bBLemegu
         2jS0mDIVb1H9VZVSjil0/AUpME2gpFOuWzHBqXMIg1epfwg109gE/Fu+PoGpSn1hAQLC
         Wup6A6oLnimvye/ZCsxNqUQeg+quT9LbfSBJ5oAi2etkyvQiaIyvHm6c/6EPIMA2mVhT
         1T4jmO9PYGCAycQmlRIputMG9SnljW6ExdzKlMRHoAgamjPHuAPVY0fObt36dsejSt2y
         8vYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=disposition-notification-to:content-language:thread-index
         :mime-version:message-id:date:subject:to:from:reply-to
         :return-receipt-to;
        bh=0yDKnXjYIsdW7UtZl2fBVhFgR+Hd3+iQKAy8q3OG0O4=;
        b=IlRSuoqgPMfd24xG5+wHW3migpWSEXZesvZrBwJijWIBMy3t77oG21gRq6Q4kjyD3I
         Fo3jGsP+6HHQ5/LsZaAZfq4Og564m5Bs5ZW5cLwFrCGd0JX6t5xvbDDH9pSzhU0ty3VM
         z8RM+H2sXh5B2sPzBx2woP2017nJbFHDEeKCWSl1ud4zEgXzqP9pgyUmtTvLA4FHbRTT
         zjaeNWBBU+EXeCPUyU+hB7TP/B0C776yziF+v4k++HiBfvJtGpUAlj1GZdDKVSt+TVZD
         8Wr5SSMPv7Bcp08PvDODs6c9WwXl3S6P91nZIiJM/vSNUKWEdw/uVwTmfMjdWC2eTBbS
         kV0w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=neutral (google.com: 193.46.215.84 is neither permitted nor denied by best guess record for domain of chris@promosensebiz.com) smtp.mailfrom=chris@promosensebiz.com
Received: from newsgw-02.dd24.net (newsgw-02.dd24.net. [193.46.215.84])
        by gmr-mx.google.com with ESMTPS id q8si877060edn.5.2019.09.23.07.23.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Sep 2019 07:23:53 -0700 (PDT)
Received-SPF: neutral (google.com: 193.46.215.84 is neither permitted nor denied by best guess record for domain of chris@promosensebiz.com) client-ip=193.46.215.84;
Received: from BernardPC (unknown [103.86.106.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by newsrelay.moniker.com (Postfix) with ESMTPSA id CFEB95FCF3
	for <jailhouse-dev@googlegroups.com>; Mon, 23 Sep 2019 14:23:52 +0000 (UTC)
Reply-To: <chris@promosensebiz.com>
From: "Chris Clark" <chris@promosensebiz.com>
To: <jailhouse-dev@googlegroups.com>
Subject: Business Contacts-2019
Date: Mon, 23 Sep 2019 10:25:42 -0400
Message-ID: <!&!AAAAAAAAAAAYAAAAAAAAABNUduX45qpAl5M2GdNz5JPCgAAAEAAAAI5vnKeN73FHnXTZ/0xmZxgBAAAAAA==@promosensebiz.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0990_01D571F9.40E6CA80"
X-Mailer: Microsoft Outlook 15.0
Thread-Index: AdVyGsbtRXGZNVJgQ6WfrcUkMNCklg==
Content-Language: en-us
X-Original-Sender: chris@promosensebiz.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=neutral
 (google.com: 193.46.215.84 is neither permitted nor denied by best guess
 record for domain of chris@promosensebiz.com) smtp.mailfrom=chris@promosensebiz.com
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

This is a multipart message in MIME format.

------=_NextPart_000_0990_01D571F9.40E6CA80
Content-Type: text/plain; charset="UTF-8"

Hi,

 

Can I send you a sample of one of our B2B email lists? We provide email
lists based on your requirements.

 

All Industrial Sectors: Information Technology | Logistics | Oil & Gas |
Automotive | Energy | Transportation | Construction | Pharmaceuticals |
Veterinary | Travel & Tourism |Telecommunications | Retail | Banking |
Manufacturing |Health Care | Interior Designers | Facility Management |
Education & E-Learning | Architects | Food & Beverages | Real Estate| HR |
Hospitality | Aviation and more. etc

 

If you could send me your target audience (Industry/ Geography/ Titles),
I'll come up with the data counts, costs & few samples for your review.

 

If you do not wish to receive our emails you can reply Let Out in the
subject line.

 

Keep us posted on the same.

 

Chris Clark
Business Development

 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/!%26!AAAAAAAAAAAYAAAAAAAAABNUduX45qpAl5M2GdNz5JPCgAAAEAAAAI5vnKeN73FHnXTZ/0xmZxgBAAAAAA%3D%3D%40promosensebiz.com.

------=_NextPart_000_0990_01D571F9.40E6CA80
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 15 (filtered medium)"><style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
p.xsection1, li.xsection1, div.xsection1
	{mso-style-name:x_section1;
	margin-top:0in;
	margin-right:0in;
	margin-bottom:0in;
	margin-left:.15in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman","serif";
	color:black;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3D"#0563C1=
" vlink=3D"#954F72"><div class=3DWordSection1><p class=3Dxsection1 style=3D=
'margin-left:0in'><span style=3D'font-size:11.0pt;font-family:"Calibri","sa=
ns-serif";color:#244061'>Hi,</span><o:p></o:p></p><p class=3Dxsection1 styl=
e=3D'margin-left:0in'><span style=3D'font-size:11.0pt;font-family:"Calibri"=
,"sans-serif";color:#244061'>&nbsp;</span><o:p></o:p></p><p class=3Dxsectio=
n1 style=3D'margin-left:0in'><span style=3D'font-size:11.0pt;font-family:"C=
alibri","sans-serif";color:#244061'>Can I send you a sample of one of our B=
2B email lists?&nbsp;We provide email lists based on your requirements.</sp=
an><o:p></o:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><span styl=
e=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#244061'>&nb=
sp;</span><o:p></o:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><sp=
an style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#2440=
61'>All Industrial Sectors:&nbsp;Information Technology | Logistics | Oil &=
amp; Gas | Automotive | Energy | Transportation | Construction | Pharmaceut=
icals | Veterinary | Travel &amp; Tourism |Telecommunications | Retail&nbsp=
;| Banking | Manufacturing |Health Care | Interior Designers | Facility Man=
agement | Education &amp; E-Learning | Architects | Food &amp; Beverages | =
Real Estate| HR | Hospitality | Aviation and more&#8230; etc</span><o:p></o=
:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><span style=3D'font-s=
ize:11.0pt;font-family:"Calibri","sans-serif";color:#244061'>&nbsp;</span><=
o:p></o:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><span style=3D=
'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#244061'>If you =
could send me your target audience (Industry/ Geography/ Titles), I&#8217;l=
l come up with the data counts, costs &amp; few samples for your review.</s=
pan><o:p></o:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><span sty=
le=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#244061'>&n=
bsp;</span><o:p></o:p></p><p class=3Dxsection1 style=3D'margin-left:0in'><s=
pan style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#244=
061'>If you do not wish to receive our emails you can reply Let Out in the =
subject line.</span><o:p></o:p></p><p class=3Dxsection1 style=3D'margin-lef=
t:0in'><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";c=
olor:#244061'>&nbsp;</span><o:p></o:p></p><p class=3Dxsection1 style=3D'mar=
gin-left:0in'><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-s=
erif";color:#244061'>Keep us posted on the same.</span><o:p></o:p></p><p cl=
ass=3Dxsection1 style=3D'margin-left:0in;text-autospace:none'><span style=
=3D'font-size:11.0pt;font-family:"Calibri","sans-serif";color:#244061'>&nbs=
p;</span><o:p></o:p></p><p class=3DMsoNormal><span style=3D'font-size:11.0p=
t;font-family:"Calibri","sans-serif";color:#244061;background:white'>Chris =
Clark</span><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-ser=
if";color:#244061'><br><span style=3D'background:white'>Business Developmen=
t</span></span><span style=3D'font-size:11.0pt;font-family:"Calibri","sans-=
serif"'><o:p></o:p></span></p><p class=3DMsoNormal><span style=3D'font-size=
:11.0pt;font-family:"Calibri","sans-serif"'><o:p>&nbsp;</o:p></span></p></d=
iv></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/!%26!AAAAAAAAAAAYAAAAAAAAABNUduX45qpAl5M2GdNz5JPCg=
AAAEAAAAI5vnKeN73FHnXTZ/0xmZxgBAAAAAA%3D%3D%40promosensebiz.com?utm_medium=
=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse-d=
ev/!%26!AAAAAAAAAAAYAAAAAAAAABNUduX45qpAl5M2GdNz5JPCgAAAEAAAAI5vnKeN73FHnXT=
Z/0xmZxgBAAAAAA%3D%3D%40promosensebiz.com</a>.<br />

------=_NextPart_000_0990_01D571F9.40E6CA80--

