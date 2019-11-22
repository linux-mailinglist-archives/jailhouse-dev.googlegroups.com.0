Return-Path: <jailhouse-dev+bncBCC4P4NJW4KRB3XO33XAKGQETXLPQ4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id C55601069E6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Nov 2019 11:24:46 +0100 (CET)
Received: by mail-wr1-x43e.google.com with SMTP id c6sf3622453wrm.18
        for <lists+jailhouse-dev@lfdr.de>; Fri, 22 Nov 2019 02:24:46 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1574418286; cv=pass;
        d=google.com; s=arc-20160816;
        b=QzT5LxrqsCTgXlApAGCZBJFkkYiRNqzNr81LXNuIHwgE8Po21bK0KjNMHVbuwllKIR
         7mCjKesmgHglgAsK1VhJsUYdv5q1BJWHMyrjOgFM9iDybWoxY+ZPqyFUJ2K9Xf3h3Md+
         +DzqtuyIH42yBywM2oLTVE2C6j68QoKctijN3e4YyX/28QaDoSUkr69++U1Lei0GesKk
         yzEfmmB9QUB1M1XGOf3ejazUxfYrRJSdRdngdTXmHo2ogzPmGiU0THLSc9FcLmbyCJb7
         r4hgrlP1oDWAAFhvrsMaQ3aSqsQfjFpzGQ7KI+whN5AQkeFdC/tvRtyO1Md+N1hsepR8
         /KoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :to:from:sender:dkim-signature;
        bh=30j5Sk0WfI3qs8UCMxrI9bYwCyl62Fbs2coUBS6NLow=;
        b=pgAkMH41FAKtQXP+/LikWDjocVviiCKN/38htMGMzLU4/oRxtUibzArP6HloItFSTc
         HM3xIVR2glmHGPDENXmQ9Q8MiY7qNhDGGkY9qFUQRzYS/Pqf6AiLamyV94lNyP9bVmBY
         uhJ0gFqEWlbnmtwnN+LAxqwqXxMes5RlNVvkupadYd6zFie2h4CFU9j400nUvAOtYJvK
         PFwsKcoOymPbCSt+UwNFvznKEArEQ1pHN/wHcwE5YwMD4QJvSyXP9yNGtlG0KyAPnjFf
         pUgUnIWldSfAvGnh80LugYmze4kuGTKtl442btPcGO02q8EvPggKt49hUNqUwE6GrkXC
         sfbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of martijn.pieterse@prodrive-technologies.com designates 212.61.153.67 as permitted sender) smtp.mailfrom=martijn.pieterse@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :accept-language:content-language:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=30j5Sk0WfI3qs8UCMxrI9bYwCyl62Fbs2coUBS6NLow=;
        b=kxDDhL19NmqTcIXkIOLcT9s5OXM4+SqJ6AzKD75PlXsEZ/5YGlw4dRnEPls8Lq7Lrg
         XZiZw8eIAcwAeesufLcARdSHlHiEjzK4tW3SfwW3aT7FGZ5Jx3NXfY+fx3AzejN9lHCK
         Sx4sYMdJmZfFg6aTl1pAz77OiRHnVkX/YZQBppvD8l9m31sZJsZ4Sed8YdUgXl6yqVVe
         T95N2k8a/JHorEZT1mBjbGV5Lejjq51qxdOc01P0BiX3F3nuCder8h+OxY411VgwRnMw
         i0yWu7PhbPoXi+0HvjzmgOLviKW7pVpxJOF4kyAV9WnsivZB/UZxageDQ3tJnFg9uif5
         1y0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:accept-language:content-language:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=30j5Sk0WfI3qs8UCMxrI9bYwCyl62Fbs2coUBS6NLow=;
        b=bJ7ASL0pdH7QDc2BieySNDkb39RYpR9ZOZgzRBb+7PAAlrfniM8zWwoydOGtNQD67i
         gnDi5DhEhrgXDqaJwKfX0DrJQsdzYgdDgjJdQjy0JVInrguN8ys2+ft5ljIGEn3T5mNX
         O7syiLAR7fPjMYauEjbZeOGNNzwx6bcPYdEHclrqcur9TAWAKJTZSP6aWNoQn2EGJLZN
         7qmHrfOkCVNkgBRvDu52E0FvBPtt/oY0cAXOVjj26dRBXEuhP1kHWLfeLbSLNbgdN+5w
         WZKaCSyW4p2dQvo6JoQXXf3KBMBKyl90bKsEZrL68cNbZu3x95FXOapDalQbRNkXrggV
         1wIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXy7L3OBm2px4vQxtOEXJ3xvFtpYpigo0wL/k1orZ6dHhnlk8RR
	KasmEbZc4IlzBKy8uG8b458=
X-Google-Smtp-Source: APXvYqwS5YqRdvwZmklpgIQayQ0MBMLBXjDAUlvq1TL++G34BHv7hRG0RIlUbJ/rF1e4ANyqcuu0lA==
X-Received: by 2002:adf:edc5:: with SMTP id v5mr16771339wro.322.1574418286340;
        Fri, 22 Nov 2019 02:24:46 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:44d0:: with SMTP id z16ls4510007wrr.14.gmail; Fri, 22
 Nov 2019 02:24:45 -0800 (PST)
X-Received: by 2002:a5d:4a8f:: with SMTP id o15mr8087490wrq.50.1574418285706;
        Fri, 22 Nov 2019 02:24:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1574418285; cv=none;
        d=google.com; s=arc-20160816;
        b=gkM5J43VbYUR0L+QALbFMamo6ER4RLmJ7qOJia/Q4o2ul0LRJTIE82MKiahenWip8U
         8xf2cSBEYGDbwgiXM1fWoSjTJiL4MMoG9VWI+efAJwsPFZtMex5GshBojTSzQPC1CuxA
         oTNKn4Nw3pqj+K3RxChkHJgxZwTzU+ASKOZS7WMQq19FNfkc0UAqdL9cbrjV/oIIyppY
         6TPPEvOFCIEC0mRF4E+oKW+vrIZ2IPDDdEMGmYSW1JUPgZG28AjZ9WwRS/F9CO5+QhoA
         +WmF51FkVNUR0o+BtDSMdN9XsccerlCQXYDvYTe+gOxeIIExVW00yQv0upuqq5RrK+ev
         bRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-language:accept-language:message-id:date
         :thread-index:thread-topic:subject:to:from;
        bh=rzU8vZCrZDly8n2kUDqQ1j2p5I/ZzBXEwzDcu44H/0A=;
        b=SKobckw3/dkKg7vBDNNo4mgHe3WQmV5LbUxzDNr2W5NcLyGWnaWKchxfGaZ4CDDZCO
         vNf4GSUReptTGF/ms8IVge+6B5OSW029UzlsPIDRHl8m9LHeVljzacOGNBQ+dcQv/iTK
         COoWRJ1VD6JhRj2FI6D3+m3RuVnipK/iazkpUc3+NfZfgvPqK+rAdkVhhaowLvHOL4dG
         lfT/tGf3U/EEcwXGec8PcmvNgG275S0wjOuq0bBvWnYKmye7jINnaihOSeaiSN7mq7Hc
         TpUJo4k7dV59ZqJJauDYyRhJgZcTmGbYPlfx4KLjzGdFXRdiiEGRXHVllH2ukwHUsdKw
         T7QA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of martijn.pieterse@prodrive-technologies.com designates 212.61.153.67 as permitted sender) smtp.mailfrom=martijn.pieterse@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
Received: from mail.prodrive-technologies.com (mail.prodrive-technologies.com. [212.61.153.67])
        by gmr-mx.google.com with ESMTPS id d3si128628wmb.0.2019.11.22.02.24.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 Nov 2019 02:24:45 -0800 (PST)
Received-SPF: pass (google.com: domain of martijn.pieterse@prodrive-technologies.com designates 212.61.153.67 as permitted sender) client-ip=212.61.153.67;
Received: from mail.prodrive-technologies.com (localhost.localdomain [127.0.0.1])
	by localhost (Email Security Appliance) with SMTP id 4E7E132F23_DD7B76DB
	for <jailhouse-dev@googlegroups.com>; Fri, 22 Nov 2019 10:24:45 +0000 (GMT)
Received: from mail.prodrive-technologies.com (exc04.bk.prodrive.nl [10.1.1.213])
	(using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
	(Client CN "mail.prodrive-technologies.com", Issuer "Prodrive Technologies B.V. OV SSL Issuing CA" (verified OK))
	by mail.prodrive-technologies.com (Sophos Email Appliance) with ESMTPS id A004930A02_DD7B76CF
	for <jailhouse-dev@googlegroups.com>; Fri, 22 Nov 2019 10:24:44 +0000 (GMT)
Received: from EXC04.bk.prodrive.nl (10.1.1.213) by EXC04.bk.prodrive.nl
 (10.1.1.213) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1779.2; Fri, 22
 Nov 2019 11:24:44 +0100
Received: from EXC04.bk.prodrive.nl ([fe80::c48:3638:97c9:de93]) by
 EXC04.bk.prodrive.nl ([fe80::c48:3638:97c9:de93%13]) with mapi id
 15.01.1779.002; Fri, 22 Nov 2019 11:24:44 +0100
From: Martijn Pieterse <martijn.pieterse@prodrive-technologies.com>
To: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Subject: jailhouse stops on cpu_down on dual socket setup
Thread-Topic: jailhouse stops on cpu_down on dual socket setup
Thread-Index: AdWhHw468p+z+JdFQ52BY1SW084XHA==
Date: Fri, 22 Nov 2019 10:24:44 +0000
Message-ID: <b326bfd4d6954f39989b5459b15c8b09@prodrive-technologies.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.2.1]
Content-Type: multipart/alternative;
	boundary="_000_b326bfd4d6954f39989b5459b15c8b09prodrivetechnologiescom_"
MIME-Version: 1.0
X-SASI-RCODE: 200
X-Original-Sender: martijn.pieterse@prodrive-technologies.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of martijn.pieterse@prodrive-technologies.com designates
 212.61.153.67 as permitted sender) smtp.mailfrom=martijn.pieterse@prodrive-technologies.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=prodrive-technologies.com
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

--_000_b326bfd4d6954f39989b5459b15c8b09prodrivetechnologiescom_
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

After successfully installing and running jailhouse on several systems I'm =
now trying to get jailhouse to run on a dual socket setup, which is giving =
me some problems.

I'm running Ubuntu 18.04, kernel version 4.15.0. Enabling jailhouse works f=
ine, it breaks when creating a cell (at the cpu_down()) call, or when disab=
ling a cpu with a shell command:
"echo 0 > /sys/devices/system/cpu/cpu2/online"

The last vmexit seems to be an NMI, after that is handled the system stops =
being responsive. I've added some printk's in the handle_vmexit code, but t=
his did not help me.

Because I never had problems with getting jailhouse up and running on a sin=
gle socket system, I'm assuming it has to do with the dual socket setup, bu=
t I'm out of ideas of how to diagnose this properly. The processors are the=
 4109T, but I don't think this matters.

The output on the serial port:
Initializing Jailhouse hypervisor v0.11 (36-gedfe64fd-dirty) on CPU 11
Code location: 0xfffffffff0000050
Using x2APIC
Page pool usage after early setup: mem 151/15823, remap 0/131072
Initializing processors:
CPU 11... (APIC ID 22) OK
CPU 6... (APIC ID 12) OK
CPU 3... (APIC ID 6) OK
CPU 1... (APIC ID 2) OK
CPU 12... (APIC ID 24) OK
CPU 13... (APIC ID 26) OK
CPU 9... (APIC ID 18) OK
CPU 0... (APIC ID 0) OK
CPU 5... (APIC ID 10) OK
CPU 7... (APIC ID 14) OK
CPU 4... (APIC ID 8) OK
CPU 14... (APIC ID 28) OK
CPU 2... (APIC ID 4) OK
CPU 10... (APIC ID 20) OK
CPU 8... (APIC ID 16) OK
CPU 15... (APIC ID 30) OK
Initializing unit: VT-d
DMAR unit @0xd37fc000/0x1000
DMAR unit @0xe0ffc000/0x1000
DMAR unit @0xee7fc000/0x1000
DMAR unit @0xfbffc000/0x1000
DMAR unit @0xaaffc000/0x1000
DMAR unit @0xb87fc000/0x1000
DMAR unit @0xc5ffc000/0x1000
DMAR unit @0x9d7fc000/0x1000
<<< Remove lots of PCI init >>>>
Adding PCI device d7:16.0 to cell "RootCell"
Adding PCI device d7:16.4 to cell "RootCell"
Page pool usage after late setup: mem 893/15823, remap 65598/131072
Activating hypervisor
NMI: cpu: 0
RIP: 0xffffffff8b33a2b3 RSP: 0xffffad66800ebe60 FLAGS: 2
RAX: 0xffffffff8c014460 RBX: 0x0000000000000003 RCX: 0xffff96745f61d150
RDX: 0x0000000000000003 RSI: 0x0000000000000286 RDI: 0xffffad6686ee7c90
CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x0000000c9ce0a002 CR4: 0x00000000007626f0
EFER: 0x0000000000000d01
VM_EXIT_INTR_INFO: 80000202


Met vriendelijke groet / Kind regards,
Martijn Pieterse

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b326bfd4d6954f39989b5459b15c8b09%40prodrive-technologies.com.

--_000_b326bfd4d6954f39989b5459b15c8b09prodrivetechnologiescom_
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
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
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"NL" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">After successfully installing a=
nd running jailhouse on several systems I&#8217;m now trying to get jailhou=
se to run on a dual socket setup, which is giving me some problems.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal">I&#8217;m running Ubuntu 18.04, kernel version 4.15.=
0. <span lang=3D"EN-US">
Enabling jailhouse works fine, it breaks when creating a cell (at the cpu_d=
own()) call, or when disabling a cpu with a shell command:<o:p></o:p></span=
></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&#8220;echo 0 &gt; /sys/devices=
/system/cpu/cpu2/online&#8221;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The last vmexit seems to be an =
NMI, after that is handled the system stops being responsive. I&#8217;ve ad=
ded some printk&#8217;s in the handle_vmexit code, but this did not help me=
.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Because I never had problems wi=
th getting jailhouse up and running on a single socket system, I&#8217;m as=
suming it has to do with the dual socket setup, but I&#8217;m out of ideas =
of how to diagnose this properly. The processors
 are the 4109T, but I don&#8217;t think this matters.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">The output on the serial port:<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Initializing Jailhouse hypervis=
or v0.11 (36-gedfe64fd-dirty) on CPU 11<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Code location: 0xfffffffff00000=
50<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Using x2APIC<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Page pool usage after early set=
up: mem 151/15823, remap 0/131072<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Initializing processors:<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 11... (APIC ID 22) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 6... (APIC ID 12) OK<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 3... (APIC ID 6) OK<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 1... (APIC ID 2) OK<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 12... (APIC ID 24) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 13... (APIC ID 26) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 9... (APIC ID 18) OK<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 0... (APIC ID 0) OK<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 5... (APIC ID 10) OK<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 7... (APIC ID 14) OK<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 4... (APIC ID 8) OK<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 14... (APIC ID 28) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 2... (APIC ID 4) OK<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 10... (APIC ID 20) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 8... (APIC ID 16) OK<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CPU 15... (APIC ID 30) OK<o:p><=
/o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Initializing unit: VT-d<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xd37fc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xe0ffc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xee7fc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xfbffc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xaaffc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xb87fc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0xc5ffc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">DMAR unit @0x9d7fc000/0x1000<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">&lt;&lt;&lt; Remove lots of PCI=
 init &gt;&gt;&gt;&gt;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Adding PCI device d7:16.0 to ce=
ll &quot;RootCell&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Adding PCI device d7:16.4 to ce=
ll &quot;RootCell&quot;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Page pool usage after late setu=
p: mem 893/15823, remap 65598/131072<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Activating hypervisor<o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">NMI: cpu: 0<o:p></o:p></span></=
p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RIP: 0xffffffff8b33a2b3 RSP: 0x=
ffffad66800ebe60 FLAGS: 2<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RAX: 0xffffffff8c014460 RBX: 0x=
0000000000000003 RCX: 0xffff96745f61d150<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">RDX: 0x0000000000000003 RSI: 0x=
0000000000000286 RDI: 0xffffad6686ee7c90<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CS: 10 BASE: 0x0000000000000000=
 AR-BYTES: a09b EFER.LMA 1<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">CR0: 0x0000000080050033 CR3: 0x=
0000000c9ce0a002 CR4: 0x00000000007626f0<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">EFER: 0x0000000000000d01<o:p></=
o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">VM_EXIT_INTR_INFO: 80000202<o:p=
></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;mso-fareast-language:NL">Met vriendelijke groet / Kind=
 regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"font-size:10.0pt;font-family:&quot;Ar=
ial&quot;,sans-serif;mso-fareast-language:NL">Martijn Pieterse</span><span =
style=3D"font-size:12.0pt;font-family:&quot;Arial&quot;,sans-serif;mso-fare=
ast-language:NL"><br>
<br>
</span><span lang=3D"EN-US"><o:p></o:p></span></p>
</div>
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
om/d/msgid/jailhouse-dev/b326bfd4d6954f39989b5459b15c8b09%40prodrive-techno=
logies.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.co=
m/d/msgid/jailhouse-dev/b326bfd4d6954f39989b5459b15c8b09%40prodrive-technol=
ogies.com</a>.<br />

--_000_b326bfd4d6954f39989b5459b15c8b09prodrivetechnologiescom_--
