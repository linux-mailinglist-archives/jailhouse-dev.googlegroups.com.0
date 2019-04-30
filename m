Return-Path: <jailhouse-dev+bncBD7KJ5F42UDRB7EXULTAKGQEK5EVQEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 43178FF23
	for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 19:55:09 +0200 (CEST)
Received: by mail-ed1-x53a.google.com with SMTP id q17sf6770997eda.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 30 Apr 2019 10:55:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556646909; cv=pass;
        d=google.com; s=arc-20160816;
        b=wwraQkVFAP3ZLNetbG1sDL6Fxz4PufqBQjS8hm122WfkGVWaUmDbuJphuFBIGvsYNI
         gYqqiQeYpTD5Je78l2PrIznhn01387mLQAl4svxjBYgWJnfgVlLE/Wu1aL6ndv+o/QCs
         tojQOPQw3WUvlcWn8RCwcndC5Uir5OvGZrh85HEY9ih5cQ5dypnCl1U+q+o2SGu+KkB+
         a1v0qtB5xZ1VEDxdmULowO7hkTaD70bvFyE+HWy5HYZTA5bJl+yvS7NjH8Vx5g4Im+5V
         G8kTBX8eBb90kN/8XoMcK+cRZaJeU0ixCVefZYcDMtiCYIb54hpNJ4znTO0jtn7Ve6I9
         DC+A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=Ow6SOctYrTux8krjeJkF/NqQk6XTRtXSeMrKZeLaExA=;
        b=X5qT9GBkNZt9xtZECSVan9tvNcQk/XQgZlcDdsbLvfR3BsTaVZnp+mexKQFbm9UOPf
         U9vQAEO4hA5L4cR2E5FnoAYsrbDwOJNukZk/7PEUWbSP2lmarp4w/xAqprrzLZW7mwgP
         9hgmKLv2yBncWj+QPnCnZ69B0uKmU/LjNb6X3MeWPs8Yp7dj1LH3yJnU1nNcShsQIZrE
         QRrkalyTwPUYK8HgWw0yrJdWiA3fNbna6yGEOFUrw/a4JsEblGRjm3pFiPN7DbHs1rY5
         Rl51Em/jwIm//d4yeKLQvEh/5pmI2RzTCYBk8hSHfHJqobeQzaGG+jJasM0+707B1z3B
         NEpg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b="YLxxO/ZI";
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.0.99 as permitted sender) smtp.mailfrom=arvid@softube.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ow6SOctYrTux8krjeJkF/NqQk6XTRtXSeMrKZeLaExA=;
        b=PIhjPmzw91U2lm5bx+Vhb11xsNx4ryG1M+BGoI3HYNlUbxE9l6D6o/UO57wXVjsMPX
         M9KTlb3K0+OZRj/P4eVB0euPlnKQ2oy/k4NL47joyC6M66vsmQvfUa2VJ0MLajSV7ZVv
         tQ840XJDg5Vkpy+9W42lmjb9xKChjf2EI4zd+2ieSG0N0zVv6WG0gbwSxyr9LgwS1kza
         1PiLeN1DWMpC8yJ/0/s5Kp15P/y4vALIwMP0aBpcW5OPdMLETD3OkqWHqtIUVsMOt/AU
         fpf1uWYPqwJ3mXjS955hIlsdgbDvlsEgkpL+aDJhzf/pwEtRNrYMIpEQvYLTZQl7Tw9a
         34lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Ow6SOctYrTux8krjeJkF/NqQk6XTRtXSeMrKZeLaExA=;
        b=m1IOg3eMsQlwMnVRvlSq6MTLcoyfA7RLFcSzNH02Rpx8JmyxlhaALVyKvlfhSbnpKW
         fJPI1BEijgLiNkR2JJYWAenWsioeoqA4qkMd43MBg2Fngg8rC82FAKUXKn8MAgRd4lzD
         3x0TJMrTPCd4O+K0tsWx56SmXCMK77MOjosbFUmDFp8pYnC3sOjyxxoXA+PcahR0MWp5
         ORms4sT7WwIfuRrhAo9s+KPRAY2SrDlaqTyMPPkT3CPZZAhj8GLocRW06JQUuHQAmXI9
         Ai67/OjoHZ21rW0BT1O0iaTBlINK/UgbXKM0TCblnOeY0xO7ZzveKlQD+/i1OzTKwYbN
         Owqg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWACGxNqehxe+XxybFa/ozN1Es3y/tplnZq01DQTBUfk7fqSnSF
	p1jfNucsgBPks9+OXvAPs14=
X-Google-Smtp-Source: APXvYqzzt/2kmd6jE6uJPJ4vuJL4s4e20T2ryT/6Cez2vszpaVCIOLMHso4RP+merAH068/Bj5VFkw==
X-Received: by 2002:a17:906:fccb:: with SMTP id qx11mr9494662ejb.276.1556646908973;
        Tue, 30 Apr 2019 10:55:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1f51:: with SMTP id d17ls262435ejk.11.gmail; Tue, 30
 Apr 2019 10:55:07 -0700 (PDT)
X-Received: by 2002:a17:906:2a94:: with SMTP id l20mr34871940eje.44.1556646907922;
        Tue, 30 Apr 2019 10:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556646907; cv=none;
        d=google.com; s=arc-20160816;
        b=snVPvWuyJCCfkQa1fggap/C8zjJ2mUlv/qMo+XP0LaNn1E0d5ygOnxNHdsGLU1XHou
         v0VUojHxMy7rykd0J9v6MycE3VMEs/CdxR1do327s2jfTi7xf2yS+x3z4erLJo5+YZ7U
         /4km4a9fadyiu0xkTmdXL9Qm/z5b9xPjE2JMnKUySIhdrttNcQoPGWaBNfsa4bAjbOO/
         r+6ZkTj2nRzGJmCnzQQYvoydmnX1FVmEd8uqc+Z1NFustQ2CQtnyMZ7fxRNgzgRNu5FS
         Iya3Q0pQ0huOeO3O6DxLWziq8SQt7IB3xkyUc6BUgskTtx/0HeLna18SPgO2R5BEdL54
         zerw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=5Q1iZ08H2w4WJg3RLsgd9uVRFwvZYcZ4L77Bz8iVtew=;
        b=xhoUU9gjypzzs7vv2ieF+fos9FlbJaIaeyTcgHCeMPR4mEolZdSHtfCaj6dVcC5sk6
         7OsFlV6PA+pIeAnesdKepNZM5yPfk5LO02AXI6KeCkofKmNFhE5RoRyTHaJ5+pKcDX7G
         MLD/oJvajHJToqkmzcS4O/xU1fGkmC1gtebBr2Yh9obQ95GiNF6o7toTahNJc0JEPr2e
         CcJt6yMWHtUgW7LsSGhTbrc+had+uNhsJfzot4IUyd5XTmE4arXOlGay43P8ZJQf5kh3
         nm1JMyvxpUHujF0ie2KRMAI6KfeJIfq4hsm8lGVgCMsMGMarjoRU9fjvvjDVefv5pzrw
         nqzA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com header.b="YLxxO/ZI";
       spf=pass (google.com: domain of arvid@softube.com designates 40.107.0.99 as permitted sender) smtp.mailfrom=arvid@softube.com
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (mail-eopbgr00099.outbound.protection.outlook.com. [40.107.0.99])
        by gmr-mx.google.com with ESMTPS id t36si263930edb.0.2019.04.30.10.55.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 10:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of arvid@softube.com designates 40.107.0.99 as permitted sender) client-ip=40.107.0.99;
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com (10.168.150.22) by
 HE1PR0201MB2042.eurprd02.prod.outlook.com (10.167.187.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1813.11; Tue, 30 Apr 2019 17:55:05 +0000
Received: from HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96]) by HE1PR0201MB2332.eurprd02.prod.outlook.com
 ([fe80::69ad:976d:5122:6b96%8]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 17:55:05 +0000
From: =?utf-8?B?QXJ2aWQgUm9zw6lu?= <arvid@softube.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: Building on Orange Pi
Thread-Topic: Building on Orange Pi
Thread-Index: AQHU/33X36/w3ziF40Wwhk63RnMw+w==
Date: Tue, 30 Apr 2019 17:55:04 +0000
Message-ID: <F1D21E89-5762-4890-A51F-5BFC0F0B4E0A@softube.com>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [81.230.58.122]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6fac5d17-ea41-47a8-3136-08d6cd94f9e7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:HE1PR0201MB2042;
x-ms-traffictypediagnostic: HE1PR0201MB2042:
x-microsoft-antispam-prvs: <HE1PR0201MB2042648EE66AD25C7C04BAB6A13A0@HE1PR0201MB2042.eurprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(346002)(376002)(136003)(39850400004)(199004)(189003)(66946007)(82746002)(99286004)(71190400001)(71200400001)(86362001)(3846002)(25786009)(83716004)(486006)(2351001)(6116002)(8936002)(73956011)(54896002)(53936002)(64756008)(85182001)(7736002)(316002)(66446008)(6512007)(68736007)(6306002)(6506007)(102836004)(97736004)(85202003)(2501003)(76116006)(6916009)(66476007)(5660300002)(2906002)(66556008)(3480700005)(8676002)(508600001)(6486002)(36756003)(4744005)(186003)(26005)(5640700003)(6436002)(2616005)(33656002)(81166006)(81156014)(66066001)(14454004)(476003)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:HE1PR0201MB2042;H:HE1PR0201MB2332.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: softube.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: n8OFzI0z7IcjtVJ6aM1+VnRBKlcaMvRqFXrjCo4LPdCSpoLNgr5Z5hZWBsCjemuobdEHerFhCLqb+BrMKy0WkUJDT8jlqMvHOJyKl7l3IdZL0+5Kd18N+LJHuH4Kd8oNBMaT8RnQAnZlcFWP5VyuMgID9b3ApJV84HRcR3n5is1yo3Fqj1rMCjEHAmgGkg/0E/d8uM/sosTWBDGlDf9xmd4Y8U6z6s5kwM51MkTFp9adjFWheFQsnqdeh9+VtJI+bMYDmjqUZrTvoIGC3DJWVscChOEsXVRf2MibAFtw5Xc0uuV4JY9Xdr8BnGjvfeCcOj/FrsFAUCmQp3vdSfJXVWbqsuHlSGb37kl5p5rDBOJVu6xckbi7c7wNwJdw8npL98L/rGU3iMVVZdGf73lTFiydDkY7w9G35qxg+2y/piQ=
Content-Type: multipart/alternative;
	boundary="_000_F1D21E8957624890A51F5BFC0F0B4E0Asoftubecom_"
MIME-Version: 1.0
X-OriginatorOrg: softube.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fac5d17-ea41-47a8-3136-08d6cd94f9e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 17:55:05.0135
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8974e373-3f62-4142-9b7f-1b77262c89ea
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0201MB2042
X-Original-Sender: arvid@softube.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@Softube.onmicrosoft.com header.s=selector1-softube-com
 header.b="YLxxO/ZI";       spf=pass (google.com: domain of arvid@softube.com
 designates 40.107.0.99 as permitted sender) smtp.mailfrom=arvid@softube.com
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

--_000_F1D21E8957624890A51F5BFC0F0B4E0Asoftubecom_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

I have successfully been testing jailhouse using an Orange Pi Zero, and the=
 pre-built images. Very cool!

However, for some more testing, it would be convenient to be able to compil=
e the inmate code on the device itself, rather than trying the set up every=
thing with Yocto or however the images are built. I tried to compile the la=
test Jailhouse source on Debian installed on the board, but that doesn=E2=
=80=99t work out of the box at least. Has anyone here any experience regard=
ing this? What would be the simplest way of getting started to compile some=
 code for running various inmates on an Orange Pi Zero?

Best Regards,
Arvid

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

--_000_F1D21E8957624890A51F5BFC0F0B4E0Asoftubecom_
Content-Type: text/html; charset="UTF-8"
Content-ID: <0A685BBA167A444E8DC70A885136D4B3@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Calibri",sans-serif;}
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
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 70.85pt 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style>
</head>
<body lang=3D"SV" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt">Hi!<o:p></o:p></spa=
n></p>
<p class=3D"MsoNormal"><span style=3D"font-size:11.0pt"><o:p>&nbsp;</o:p></=
span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">I ha=
ve successfully been testing jailhouse using an Orange Pi Zero, and the pre=
-built images. Very cool!<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Howe=
ver, for some more testing, it would be convenient to be able to compile th=
e inmate code on the device itself, rather than trying the set up everythin=
g with Yocto or however the images are
 built. I tried to compile the latest Jailhouse source on Debian installed =
on the board, but that doesn=E2=80=99t work out of the box at least. Has an=
yone here any experience regarding this? What would be the simplest way of =
getting started to compile some code for
 running various inmates on an Orange Pi Zero?<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt"><o:p=
>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Best=
 Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"font-size:11.0pt">Arvi=
d<o:p></o:p></span></p>
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
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--_000_F1D21E8957624890A51F5BFC0F0B4E0Asoftubecom_--
