Return-Path: <jailhouse-dev+bncBDOPPN7U7ANRBZ7M42IQMGQELTDGPVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x437.google.com (mail-pf1-x437.google.com [IPv6:2607:f8b0:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 8567D4E3DC7
	for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Mar 2022 12:43:37 +0100 (CET)
Received: by mail-pf1-x437.google.com with SMTP id 138-20020a621690000000b004fa807ac59asf5405261pfw.19
        for <lists+jailhouse-dev@lfdr.de>; Tue, 22 Mar 2022 04:43:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1647949416; cv=pass;
        d=google.com; s=arc-20160816;
        b=l9eZym1GC5tAnuVYyyFlFXff4sXskv+lenCnZhjId3JtjsquJmTQua7pwy89yk9wQA
         zvMebCEebetRxA4qYXQaMVUmY8o8r5fHhwSyf8uophVML5Ji5GDzmiaZc9BkEiR5WkzW
         juD6lAK6nZIXCFR1v1cfsk2UD4XrXrtGbDR+COMf5VdFWZV9caAU1KOlL5lBtikIvKBA
         IQKfHoMa/aCtFbe88PDvqZqwtgatjV2wnLU7MkN6knJ0Y06jI1rNHo6ZEufL+laKMcxV
         Q2c+n7Bpu53gcWMfD3ygmvMvk7PT9rMoQex3wAaBiQSbjjzwhFec7iItbvIl5rpKjUV8
         X2hg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version
         :content-language:accept-language:in-reply-to:references:message-id
         :date:thread-index:thread-topic:subject:to:from:dkim-signature;
        bh=pxUs6MCHCNKZxFXORiAr6wArdFavHaOwBvlSpV4dWsE=;
        b=pXFGUpIpJT80MhCW9mCKq+1KBOfL3B0NVPT9C/n9TesWRFWZL/UJGDOgzyOTarshQy
         b2p4AXTLjRVdMdN0KRobCBJ1PMjAJ3C8fgdwYgDbA9SNM33y3CToj4yAHrin+W8W49oL
         jE7Inka5NqY0Ip8rYwGkV+MPCkGDeqfh5TTu03cw3KfQ4LwhevLh83gybUW8q6dUO4Zc
         wSfyPW+VdRBZ9T98PomEj1t5skCfiTqlsmpgpLdYfFelyHf55urSiMiYFfKGrIvA8Sq4
         hGBONRrHiJzQuwWIHHCwGNiEtNf4Q1tmBG00vNQEtxzyYKtUPU2itW03cL5QI1y55iKx
         DQUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S3vVyThl;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=pxUs6MCHCNKZxFXORiAr6wArdFavHaOwBvlSpV4dWsE=;
        b=HU/QQ1SPJu7hO2TmWBzXewSIxyoQH7fJVrvsNVdomsuHX75CtBeZz6sscRFJlvmUsK
         9oGd+5XoLa+fkqXlgx0Ic25E6WqDPcbY7Um/tKZqqmVk/sWB4X5zBxoCCKXiFG7aHyZO
         08OvWPYUXV3j0ValIBTB67In3y1INlPvwOWuN9PiOw9pjziAgNg+7tqcqdhoqEcS08kb
         u9jZJQDBNTd+kRoPl7lJ4+046JWzkg764Alo2SUIBOFB5FpCTqLBZw1MnisL5Jk6+zWO
         cDdwbJRUdwFFhh3O8NQTEeOtuupBMZSyxQxNw7nKqvGknbXCjuvAaonn0jTyvE1715Sc
         xjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:thread-topic:thread-index:date
         :message-id:references:in-reply-to:accept-language:content-language
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:x-spam-checked-in-group
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pxUs6MCHCNKZxFXORiAr6wArdFavHaOwBvlSpV4dWsE=;
        b=d52SLF7u6N/pqbDGLTNtb8UvQ+WbZGtRFG1dqaU/h8Bb45BhIasgw9RmPAO/HvbQ09
         iOn/7FuGcsVQlEW7K/t6sgK2cEdT1K/xhlZnXreL02rnXrpJ1xDHq9SB0sxuy+uInfuZ
         3oAiiglLF41Nl9bPtAWY7WmGEKIPErWvhUlho3zKwgTvO5QKsE3LhPeji1x/9tGBD7qV
         8Oq9MZAKaiQoax++7wFXDcGxyHEPTl3uLo/epfbmhq/6FsAqMwpAelyrquMAFLweCHlK
         zvVcgo8/GbSIy3pzpsf9QFpYXm2pvi0gJn3AxnhvAf5gHfJyJMzFgsO9Mnvd5dVQIsud
         MpPw==
X-Gm-Message-State: AOAM532NQSPti8vZu/4kD8XZ7R/ekG7OaBaT3j6adqiWfhocQOCQWaig
	shxH4qzH+0ZCLGawU095trg=
X-Google-Smtp-Source: ABdhPJziAHQ56OLogCnfPeLHuhUjZiKHAAQfex1YFiGtMNFukBpaoUCjsKYfYf/KZ6ChIz676i7FKQ==
X-Received: by 2002:a63:ad4d:0:b0:378:4b82:b881 with SMTP id y13-20020a63ad4d000000b003784b82b881mr21974990pgo.282.1647949415913;
        Tue, 22 Mar 2022 04:43:35 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90b:3143:b0:1c7:5cee:3950 with SMTP id
 ip3-20020a17090b314300b001c75cee3950ls1527657pjb.1.canary-gmail; Tue, 22 Mar
 2022 04:43:35 -0700 (PDT)
X-Received: by 2002:a17:902:76ca:b0:153:ad09:9c73 with SMTP id j10-20020a17090276ca00b00153ad099c73mr18146495plt.63.1647949415059;
        Tue, 22 Mar 2022 04:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647949415; cv=none;
        d=google.com; s=arc-20160816;
        b=odK/QEREhG4QSQcG5cT6MnQrruGd3B//7AC2LbdPF2xUS4v/rW3Ow96FRmZX01yg4t
         PaWr9ZTW+k+tWGdrewCh35tJi2M88v+Iw8Y8GGBxbEBGUK9yoH04SArOpZncEJFE40xF
         B8AviTadTZqLo5lyG3+3wFSQdU3c0RYx9EF+UZmlZOU84LGVapdl3bkrMLCXB2DQwQB0
         3Vj8OTJz3Ps6u3vtsNSaSWJ/7wB26OdSkVpAbYPsXcBBA9X941xaAqyC14/DNEcqFH1B
         5tn122xf5W0bBJDL1rFhq83FJ6S16xUYuiNyVTbtMlY3MBLQoyMYBjXUPqHzhyeGYG4d
         T6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:in-reply-to
         :references:message-id:date:thread-index:thread-topic:subject:to
         :from:dkim-signature;
        bh=O53ivjiMBMGFh3ea9l2uEBeeHV+Yuro0JOKR5Kiz2e4=;
        b=y9zX14WhUWMfkp6nHkEZn1OcbiBZAMGj4G0QTtTt9h8kjCSm5a2dzrxxXHU/WAtigJ
         +IWUtCMaALk6G2q2ReicHxChpjOX89d1N/Fp8RVV3PgkxuYLvvslalXK58CqoI61dDrb
         svz+KAjXoj4newS2CYDGSgxriPPItrWg5joiSNQ8QCyKz91w4LRdSeQEkxl1hcI3kapI
         qmW7rCCsNaOADNWtD6/F6PUgVn1BIhjnl+NULvDLhBUU+E6mFLUbwvh4FpPb24HhPANG
         PIxQkvJkdmX7OwiqD5zNnvKRMxInh3fVzwY/2D9kRWwh5zuiwYMQ/F0+NR2lBppcOep6
         0WWg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=S3vVyThl;
       spf=pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=mranostay@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id k5-20020a170902e90500b001517cf05af9si978464pld.8.2022.03.22.04.43.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Mar 2022 04:43:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22MBhYfA129945;
	Tue, 22 Mar 2022 06:43:34 -0500
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22MBhYjS089342
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Mar 2022 06:43:34 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 22
 Mar 2022 06:43:33 -0500
Received: from DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12]) by
 DFLE106.ent.ti.com ([fe80::4dc:7374:f90c:1f12%17]) with mapi id
 15.01.2308.014; Tue, 22 Mar 2022 06:43:33 -0500
From: "'Ranostay, Matthew' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
Subject: Re: k3-am65-idk: config checker warnings
Thread-Topic: k3-am65-idk: config checker warnings
Thread-Index: AQHYNs1844t2uJY+IUS0ydO+aJtvUazLVVkv
Date: Tue, 22 Mar 2022 11:43:33 +0000
Message-ID: <d21d6cb41f8545938356907612a911f8@ti.com>
References: <9dfb3644-f161-3108-0257-441cf47e5f45@siemens.com>
In-Reply-To: <9dfb3644-f161-3108-0257-441cf47e5f45@siemens.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.4.42.15]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: multipart/alternative;
	boundary="_000_d21d6cb41f8545938356907612a911f8ticom_"
MIME-Version: 1.0
X-Original-Sender: mranostay@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=S3vVyThl;       spf=pass
 (google.com: domain of mranostay@ti.com designates 198.47.23.248 as permitted
 sender) smtp.mailfrom=mranostay@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: "Ranostay, Matthew" <mranostay@ti.com>
Reply-To: "Ranostay, Matthew" <mranostay@ti.com>
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

--_000_d21d6cb41f8545938356907612a911f8ticom_
Content-Type: text/plain; charset="UTF-8"


________________________________
From: Jan Kiszka <jan.kiszka@siemens.com>
Sent: Sunday, March 13, 2022 7:28 PM
To: Ranostay, Matthew; Jailhouse
Subject: k3-am65-idk: config checker warnings

Hi Matt,

as you are already working with the configs, please have a look at this
as well (NOT a regression of your series):

Matt: Oops... seems I missed this email. Yes I will take a look, and resolved these if possible. Should my resolutions be applied before or after the eMMC changes in review?

$ jailhouse config check -a arm64 configs/arm64/k3-am654-idk.cell
Reading configuration set:
  Root cell:     k3-am654-idk (configs/arm64/k3-am654-idk.cell)
Overlapping memory regions inside cell:

In cell 'k3-am654-idk', region 14
  phys_start: 0x0000000042040000
  virt_start: 0x0000000042040000
  size:       0x0000000003ac3000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
physically and virtually overlaps with region 15
  phys_start: 0x0000000045100000
  virt_start: 0x0000000045100000
  size:       0x0000000000c24000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO

Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture arm64:

In cell 'k3-am654-idk', region 10
  phys_start: 0x0000000001000000
  virt_start: 0x0000000001000000
  size:       0x000000000af04000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
overlaps with GICD
  phys_start: 0x0000000001800000
  virt_start: 0x0000000001800000
  size:       0x0000000000010000
  flags:

In cell 'k3-am654-idk', region 10
  phys_start: 0x0000000001000000
  virt_start: 0x0000000001000000
  size:       0x000000000af04000
  flags:      JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE | JAILHOUSE_MEM_IO
overlaps with GICR
  phys_start: 0x0000000001880000
  virt_start: 0x0000000001880000
  size:       0x0000000000020000
  flags:


This last two look particularly dangerous.

Jan

--
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d21d6cb41f8545938356907612a911f8%40ti.com.

--_000_d21d6cb41f8545938356907612a911f8ticom_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size: 12pt; color: rgb(0, 0,=
 0); font-family: Calibri, Helvetica, sans-serif, Helvetica, EmojiFont, &qu=
ot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, NotoColorEmoji, &qu=
ot;Segoe UI Symbol&quot;, &quot;Android Emoji&quot;, EmojiSymbols;" dir=3D"=
ltr">
<p><br>
</p>
<hr tabindex=3D"-1" style=3D"font-size: 12pt; display: inline-block; width:=
 98%;">
<div style=3D"color: rgb(0, 0, 0);">
<div>
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jan Kiszka &lt;jan.=
kiszka@siemens.com&gt;<br>
<b>Sent:</b> Sunday, March 13, 2022 7:28 PM<br>
<b>To:</b> Ranostay, Matthew; Jailhouse<br>
<b>Subject:</b> k3-am65-idk: config checker warnings</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hi Matt,<br>
<br>
as you are already working with the configs, please have a look at this <br=
>
as well (NOT a regression of your series):</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Matt: Oops...&nbsp;seems I missed this email. Yes =
I will take a look, and resolved these if possible. Should my resolutions b=
e applied before or after the eMMC changes in review?<span style=3D"font-si=
ze: 10pt;">&nbsp;</span></div>
<div class=3D"PlainText"><br>
$ jailhouse config check -a arm64 configs/arm64/k3-am654-idk.cell <br>
Reading configuration set:<br>
&nbsp; Root cell:&nbsp;&nbsp;&nbsp;&nbsp; k3-am654-idk (configs/arm64/k3-am=
654-idk.cell)<br>
Overlapping memory regions inside cell:<br>
<br>
In cell 'k3-am654-idk', region 14<br>
&nbsp; phys_start: 0x0000000042040000<br>
&nbsp; virt_start: 0x0000000042040000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000003ac3000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE | JAILHOUSE_MEM_IO<br>
physically and virtually overlaps with region 15<br>
&nbsp; phys_start: 0x0000000045100000<br>
&nbsp; virt_start: 0x0000000045100000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000000c24000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE | JAILHOUSE_MEM_IO<br>
<br>
Overlapping memory regions with hypervisor: None<br>
Missing PCI MMCONFIG interceptions: None<br>
Missing resource interceptions for architecture arm64:<br>
<br>
In cell 'k3-am654-idk', region 10<br>
&nbsp; phys_start: 0x0000000001000000<br>
&nbsp; virt_start: 0x0000000001000000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000000af04000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE | JAILHOUSE_MEM_IO<br>
overlaps with GICD<br>
&nbsp; phys_start: 0x0000000001800000<br>
&nbsp; virt_start: 0x0000000001800000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000000010000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
In cell 'k3-am654-idk', region 10<br>
&nbsp; phys_start: 0x0000000001000000<br>
&nbsp; virt_start: 0x0000000001000000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x000000000af04000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; JAILHOUSE_MEM_READ | JAILHOUSE_=
MEM_WRITE | JAILHOUSE_MEM_IO<br>
overlaps with GICR<br>
&nbsp; phys_start: 0x0000000001880000<br>
&nbsp; virt_start: 0x0000000001880000<br>
&nbsp; size:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0x0000000000020000<br>
&nbsp; flags:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
<br>
<br>
This last two look particularly dangerous.<br>
<br>
Jan<br>
<br>
-- <br>
Siemens AG, Technology<br>
Competence Center Embedded Linux<br>
</div>
</span></font></div>
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
om/d/msgid/jailhouse-dev/d21d6cb41f8545938356907612a911f8%40ti.com?utm_medi=
um=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhouse=
-dev/d21d6cb41f8545938356907612a911f8%40ti.com</a>.<br />

--_000_d21d6cb41f8545938356907612a911f8ticom_--
