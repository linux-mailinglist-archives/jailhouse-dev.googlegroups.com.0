Return-Path: <jailhouse-dev+bncBAABB7X623TQKGQEAONDNVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x837.google.com (mail-qt1-x837.google.com [IPv6:2607:f8b0:4864:20::837])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BC133C8B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  4 Jun 2019 02:46:56 +0200 (CEST)
Received: by mail-qt1-x837.google.com with SMTP id 37sf9194730qtc.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 03 Jun 2019 17:46:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559609215; cv=pass;
        d=google.com; s=arc-20160816;
        b=pt3Ek5D2CJ1SEboLp8bFtrSmoKwTcirLAWDjBi75IyWBO9gOFbCXZTi2CRX5VAQXFB
         2D3KBNrgjenoQhIijr0B+wPOylWplS/zySzk+ohKofMM7i2C1rXRGFxYVD7Z5Ur1SAQd
         0PaWrUODuU0XcGZrj2lL4IKxmO9d2RCAapJ8JX0mdQLmYUxOwF2cfKl8OUmfV+ORtCBl
         A0uIUSifTUx7N8Chs8x3iKH6qxiBNY3OgLm48ihpVDihJa9LT0hbg42tWhgqy5uL98ly
         WcpqUeGPBoPTgWCeMPaBnu+rhbs9LLfgccaVvs6ed/cEV8qaxjKSpJMVECrXCPo+8SqP
         sBVg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:acceptlanguage
         :content-language:accept-language:message-id:thread-index
         :thread-topic:subject:date:to:from:sender:dkim-signature;
        bh=M4snGfR8MQr3lUtiU1X1mmvvQ4gCZAwD8tKpuV+ONAU=;
        b=W2S2ssXxAgXJmfuTMvogLkm57hLXsOyYf5HfPBBvxdZ6A1ExG6uYspUI84gBsZilYu
         X80cLjpE4oDrEKojpVuQrHshFg8+HjwSbxWYospscYpvtiAATR3MJnDp8KvTsW1oN2m2
         Xw5xXeldBPXb0IelR5B2YTwWInttb6BVIOhjhe9c6pe3fe7PFm40qAY0m2lqL2gnBnUS
         T5UytbtPfqNioGKOMOh1v7WZX33Ey3y/otrZQur88opM/f2E5ymB3jQL4fqqh0GoE45p
         wyv8FQRQFzf47zuVbY3q9f9V1KklZVHUmSQcDNbt370tFBaaSHyBw/z5eTT1lDpXf5qc
         /hhg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:date:subject:thread-topic:thread-index:message-id
         :accept-language:content-language:acceptlanguage:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M4snGfR8MQr3lUtiU1X1mmvvQ4gCZAwD8tKpuV+ONAU=;
        b=g8Qd8N2s/9SKgM6WasBW67l8HvubijOqbqfwWmc3EIPX8Kj5TxJH5pYWK39pbguFMt
         bcOJEhl/g9X3BmqhMsYlnh7B3t3crO+CFuFV4v/nCL39mpcRPM6ZKKJVNcVhJnlXKJ0O
         QbLk8bBRErwNroNuL60Cz5B7LELkHQQfyFNaohiQemidE2M8a3DK8ZBpFDO58vFGkP8I
         DrtQebRs82lwH0VGbDKNsOl6he8h0Wf+fkV8QN1rspT82zoQr2S7k5TAaFIcV4IcsyBw
         wi5zNjyxxAjHJ5spyD7/zDD+fPqzz3tQ5MTGt9qJHaLzfkL1+p0FZTFop0QjeXMDKsNs
         5i/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:date:subject:thread-topic
         :thread-index:message-id:accept-language:content-language
         :acceptlanguage:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M4snGfR8MQr3lUtiU1X1mmvvQ4gCZAwD8tKpuV+ONAU=;
        b=PKZAfduIxxR5KdR6c177f5ivbhwGBHTK3Mz+QPLb+fVZ/AXNUTlqeoedovggYfHL9I
         1mVTkKrskud3+zQvDUDl0BYjQmsynOiCqH07cAw9pYxbtwH3cN1ScY74xEzOvW+HrUlQ
         M530wKU4GoP2QZN5yddYjbIzgo/XQPidf7N79IF96p+0vjKDWAiML1x12PElimtYxScT
         lAs/habCoA2tgOZ4mHEy2qoKdGqK7h6lUks/p2cAdh9bgZUTMPXzeiVhdo6YP2QLU/3/
         3NQISURRK0bH0bF6/xTeUellJjLTx3GoGoYLy+q9HV92jD9BW+miiArrKC5+rN1VPZ2c
         qldQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVOEF4jzt4ZE6p4lg7708XyrBiDYmef7mWcDpCHDrl0Kb5vLarY
	AEwyZNa88D1hdb5OXvppehY=
X-Google-Smtp-Source: APXvYqxbPRHr8yXgUZVNRJ+HFk4+yG9w/tbHo6TKbrV+jmXrEkxW/4G88MOZ/r7i5rjj88twrF1XsA==
X-Received: by 2002:aed:3764:: with SMTP id i91mr5592351qtb.203.1559609215302;
        Mon, 03 Jun 2019 17:46:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:b620:: with SMTP id f32ls3566370qve.4.gmail; Mon, 03 Jun
 2019 17:46:54 -0700 (PDT)
X-Received: by 2002:a0c:904f:: with SMTP id o73mr22833558qvo.188.1559609214811;
        Mon, 03 Jun 2019 17:46:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559609214; cv=none;
        d=google.com; s=arc-20160816;
        b=bsKvNQR9SW4j6wpGOQsy+LNadVzleJk5/meSUCPtfi9At2/V59nHviC+3cTYsCFYdK
         9U2fW8arCnfqgIy0Z3MC7uQFm354y6HIYDQ7YfzWuaTyClxaqYl+ZYt7fjxbHPjRIAep
         CA0Zk21jnzyDVwdY6/jK2V9yYDhI9HauuAP5o7zAYQhzzmbY6gpGNBqSTIADIkBLaxBy
         yliOc6zNWLs0dSrn/uyrjsVxWpi5MuyhSuhTxw98BzslAAfZBUTopbyWtOQPbQgS0gG9
         /VAmRcExrr/v3TLQ9SiXGZ+mKto4MvcyOuG2FhEYflkpmVJFG/siEMM5SybLLGjWNDs1
         8kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:acceptlanguage:content-language:accept-language
         :message-id:thread-index:thread-topic:subject:date:to:from;
        bh=SH95kUjsYSKWwcLulqoYnBFxBLBAwxidoynGptnC4GM=;
        b=BxEd+PhrlSynZdaXJUCAaiIVRx7bSwq/BFpYFJ9P79GtehsBRhy/SvZj7sr6pwRz+d
         s+8b2y83ReoDBkGtDTYfsJCu2AcFmDpIGhkfnUuW/c7tUiwKhnITegWO3mE1C/M8yyIp
         JINiRyDLYE87wMRUp9OXYikKl+GFJ1v358iZKz0xgnCecGrFuvZZ3zUZsqKsksT3Q1DQ
         DiT7M5mm6Fea2Oo/sjRwflaKI/c6FcXBbjtWUV/1uXbuM4cAWK5h+m6DmCjxrBuX7iQG
         QJN8veZJMAE1TcvWIccZkPvPhQFnHbFE/qnEG3cnxpyYCTePOa3d9P12D+ZmGFnrnJg2
         T29Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) smtp.mailfrom=lei.xiong@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.com.cn (david.siemens.com.cn. [194.138.202.53])
        by gmr-mx.google.com with ESMTPS id x22si848011qtx.2.2019.06.03.17.46.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 03 Jun 2019 17:46:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as permitted sender) client-ip=194.138.202.53;
Received: from mail.siemens.com.cn (mail.siemens.com.cn [194.138.237.52])
	by david.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x540koZ5023359
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 08:46:50 +0800
Received: from CNPEK01905.cn001.siemens.net (cnpek01905.cn001.siemens.net [139.24.236.71])
	by mail.siemens.com.cn (8.14.9/8.14.9) with ESMTP id x540koex018844
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 4 Jun 2019 08:46:50 +0800
Received: from CNPEK01937.cn001.siemens.net ([169.254.1.207]) by
 CNPEK01905.cn001.siemens.net ([139.24.236.71]) with mapi; Tue, 4 Jun 2019
 08:46:18 +0800
From: "Xiong, Lei" <lei.xiong@siemens.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Date: Tue, 4 Jun 2019 08:46:48 +0800
Subject: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Topic: How to disable CONFIG_VIDEO in the U-Boot config
Thread-Index: AdUabs+sImfJNc2/QHCyKO/jzXljOA==
Message-ID: <C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1@CNPEK01937.cn001.siemens.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
Content-Type: multipart/related;
	boundary="_004_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_";
	type="multipart/alternative"
MIME-Version: 1.0
X-Original-Sender: lei.xiong@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of lei.xiong@siemens.com designates 194.138.202.53 as
 permitted sender) smtp.mailfrom=lei.xiong@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

--_004_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_
Content-Type: multipart/alternative;
	boundary="_000_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_"

--_000_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_
Content-Type: text/plain; charset="UTF-8"

Dear colleagues,
In the "Setup on Banana Pi ARM board" part, it mentioned that "since v2015.10, you need to disable CONFIG_VIDEO in the U-Boot config, or U-Boot will configure the framebuffer at the end of the physical RAM where Jailhouse is located."
My question is that how to disable CONFIG_VIDEO in the U-Boot config?

With best regards,
Lei Xiong

Siemens Ltd., China
CT RDA FOA ART-CN1
7, Wangjing Zhonghuan Nanlu
100102 BEIJING, China
mailto:lei.xiong@siemens.com
www.siemens.com/ingenuityforlife<https://siemens.com/ingenuityforlife>
[cid:image001.png@01D51AB2.0BB0E1A0]

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1%40CNPEK01937.cn001.siemens.net.
For more options, visit https://groups.google.com/d/optout.

--_000_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head><META HTTP-EQUIV=3D"Content-Type" CONTENT=
=3D"text/html; charset=3Dus-ascii"><meta name=3DGenerator content=3D"Micros=
oft Word 14 (filtered medium)"><!--[if !mso]><style>v\:* {behavior:url(#def=
ault#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
/* Font Definitions */
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:\5B8B\4F53;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@\5B8B\4F53";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Segoe UI";
	panose-1:2 11 5 2 4 2 4 2 2 3;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
p.MsoAcetate, li.MsoAcetate, div.MsoAcetate
	{mso-style-priority:99;
	mso-style-link:"Balloon Text Char";
	margin:0in;
	margin-bottom:.0001pt;
	font-size:8.0pt;
	font-family:"Tahoma","sans-serif";}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
span.BalloonTextChar
	{mso-style-name:"Balloon Text Char";
	mso-style-priority:99;
	mso-style-link:"Balloon Text";
	font-family:"Tahoma","sans-serif";}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--></head><body lang=3DEN-US link=3Dblue vli=
nk=3Dpurple><div class=3DWordSection1><p class=3DMsoNormal><span lang=3DEN =
style=3D'font-family:"Segoe UI","sans-serif";color:#24292E'>Dear colleagues=
,<o:p></o:p></span></p><p class=3DMsoNormal><span lang=3DEN style=3D'font-f=
amily:"Segoe UI","sans-serif";color:#24292E'>In the &#8220;Setup on Banana =
Pi ARM board&#8221; part, it mentioned that &#8220;</span><strong><span lan=
g=3DEN style=3D'font-size:10.5pt;font-family:"Segoe UI","sans-serif";color:=
#24292E'>since v2015.10, you need to disable CONFIG_VIDEO in the U-Boot con=
fig</span></strong><span lang=3DEN style=3D'font-size:10.5pt;font-family:"S=
egoe UI","sans-serif";color:#24292E'>, or U-Boot will configure the framebu=
ffer at the end of the physical RAM where Jailhouse is located.&#8221;<o:p>=
</o:p></span></p><p class=3DMsoNormal><span lang=3DEN style=3D'font-size:10=
.5pt;font-family:"Segoe UI","sans-serif";color:#24292E'>My question is that=
 how to disable CONFIG_VIDEO in the U-Boot config?<b><o:p></o:p></b></span>=
</p><p class=3DMsoNormal><o:p>&nbsp;</o:p></p><p class=3DMsoNormal><span st=
yle=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'>With best regards=
,<br>Lei Xiong<br><br>Siemens Ltd., China<br>CT RDA FOA ART-CN1<br>7, Wangj=
ing Zhonghuan Nanlu<br>100102 BEIJING, China<br><a href=3D"mailto:lei.xiong=
@siemens.com"><span style=3D'color:blue'>mailto:lei.xiong@siemens.com</span=
></a><br><a href=3D"https://siemens.com/ingenuityforlife"><span style=3D'co=
lor:blue'>www.siemens.com/ingenuityforlife</span></a><br></span><span style=
=3D'font-size:10.0pt;font-family:"Arial","sans-serif"'><img border=3D0 widt=
h=3D300 height=3D109 id=3D"_x0000_i1025" src=3D"cid:image001.png@01D51AB2.0=
BB0E1A0" alt=3D"www.siemens.com/ingenuityforlife"></span><o:p></o:p></p></d=
iv></body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1%40CNPEK=
01937.cn001.siemens.net?utm_medium=3Demail&utm_source=3Dfooter">https://gro=
ups.google.com/d/msgid/jailhouse-dev/C6C9DF0CAE5FD841919323C24BDCCA91D3A324=
2DA1%40CNPEK01937.cn001.siemens.net</a>.<br />
For more options, visit <a href=3D"https://groups.google.com/d/optout">http=
s://groups.google.com/d/optout</a>.<br />

--_000_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_--

--_004_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_
Content-Type: image/png; name="image001.png"
Content-Description: image001.png
Content-Disposition: inline; filename="image001.png"; size=9561;
	creation-date="Tue, 04 Jun 2019 00:46:17 GMT";
	modification-date="Tue, 04 Jun 2019 00:46:17 GMT"
Content-ID: <image001.png@01D51AB2.0BB0E1A0>
Content-Transfer-Encoding: base64

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

--_004_C6C9DF0CAE5FD841919323C24BDCCA91D3A3242DA1CNPEK01937cn0_--
