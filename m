Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBBXN562VAMGQEJ6Y7HCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113a.google.com (mail-yw1-x113a.google.com [IPv6:2607:f8b0:4864:20::113a])
	by mail.lfdr.de (Postfix) with ESMTPS id D04457F3E19
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 07:25:35 +0100 (CET)
Received: by mail-yw1-x113a.google.com with SMTP id 00721157ae682-5cca2c844d1sf1127887b3.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Nov 2023 22:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700634334; x=1701239134; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGPpP7BDbuaXJRA+nSwGgROovPkGd0+/Nk+LorPoPeA=;
        b=kcHxCz6BkacMXWfyzqWAt+a8WsWwrhIE2nQoGAW32gWG2xA1YwpqQRnT6oNksP6S4W
         CwGfHmWbBB5bkO3Sv7b+9tpC84bkJQB3ukNzB6dDnE59LQNT4kcU0YKqHj7aZh51KYSb
         kFlM0S0iT246rKkLplMTy/Hon3gn+oEg9ntZEuazl7BOApSpYzc2oRMS1gJVPV9ykwoE
         6OkIwBj8EGQz3hMXdadK6MRDBObmcDFfu49adCq12zQ1CMnYhsEJA0A6JXZyutau0+WV
         cYtd9uf98i2E0obk9o+JwxubiElV5wx/G2iS3NsGt54XQKdraEYrHq8D/mwyja+7AOS0
         Wblw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700634334; x=1701239134; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nGPpP7BDbuaXJRA+nSwGgROovPkGd0+/Nk+LorPoPeA=;
        b=a9gaNuuqqIU5R+AFKInMhB43LjA8rb8u2JmBca7qLMA+RU3e2bxemtkDcqk3PKpKVy
         GDSMxfMEFosroh0ReBqlisT9WpZmp6FRiZbH1zC6JBFT6QpHHPkm9C4Abj+/pPYjuric
         oZh9nChvRPdy+CQJbRGNTiNHOtLmmQp6aqgFuonrfWLprzCcJLNYRAZgsq6Xev4mUnU9
         bwpSeIFHDoIUpv8LYEEr8kIh2hAHZw0mWiELnsI/XO3DadpHvxMoj124DiBArNcDL/6n
         kGH9SbgMhjMhdFczNIqJVuvc0X6IPSo//I6nbLPzbg4BeuX+BLaTwRsR/dYd0Ai2lKwo
         nB5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700634334; x=1701239134;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGPpP7BDbuaXJRA+nSwGgROovPkGd0+/Nk+LorPoPeA=;
        b=t7rlIDBRw3P6f3n35rlUayKqfk1k481oHw/SH6Eiq856vwaOb8Xw1KJF27fCM7ZzKk
         hiDmJZ9JDDLZT277ixO/teg6jGj0oT0RSS8udi5TIKrnLTd54ER9URLRmhfEpU/m1tOQ
         acifKwXqy5u1C8sOqCScMd/nB3eHLLZuZod5UJSZRkq8W86q9LCdrMMelFYZPPFLmNI2
         KXQeSHCz5tMDDM8v4yfZEZwuwiGuaP7MPEt7mjaKp4Tm8+T7cSwpg+9AvChGPgEg4h7k
         7/tr72jX5ykBNVhwFN61dyCTS4tWWeulBVXtebZSaXM6e7QS8dcOtOBsToF75HDlbT3U
         7k9w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzdzMdmLB9NoDE3xO/OEed9QxydB9bt8gsoCRRhjGjkY2thVTSI
	arRXK4n8E0/uh8WbK76QHtM=
X-Google-Smtp-Source: AGHT+IFxzKOImIRSSLQI7cZMgJmBAMpQu6YjaywDmXo2Z/UzCn7rjCOXVQgO1+5EgntHDd+B9fSB2g==
X-Received: by 2002:a0d:d583:0:b0:5ca:6ae0:9c2b with SMTP id x125-20020a0dd583000000b005ca6ae09c2bmr1233955ywd.7.1700634334563;
        Tue, 21 Nov 2023 22:25:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:6c94:b0:6c3:6105:51b5 with SMTP id
 jc20-20020a056a006c9400b006c3610551b5ls3616227pfb.1.-pod-prod-08-us; Tue, 21
 Nov 2023 22:25:33 -0800 (PST)
X-Received: by 2002:a63:5955:0:b0:5be:1b76:6a87 with SMTP id j21-20020a635955000000b005be1b766a87mr254591pgm.12.1700634332852;
        Tue, 21 Nov 2023 22:25:32 -0800 (PST)
Date: Tue, 21 Nov 2023 22:25:31 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
Subject: jailhouse enable linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_14850_944291073.1700634331481"
X-Original-Sender: zhangxin6483@gmail.com
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

------=_Part_14850_944291073.1700634331481
Content-Type: multipart/alternative; 
	boundary="----=_Part_14851_890014881.1700634331481"

------=_Part_14851_890014881.1700634331481
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

when I run linux image on jailhouse, guset serial port print follow errors:=
=20
where I can get ways to sovle it=EF=BC=9F


[    0.069576][ 0] [    T0] Mount-cache hash table entries: 1024 (order: 1,=
=20
8192 bytes, linear)
[    0.078110][ 0] [    T0] Mountpoint-cache hash table entries: 1024=20
(order: 1, 8192 bytes, linear)
[    0.087451][ 0] [    T2] Unable to handle kernel paging request at=20
virtual address 0000000000001388
[    0.096606][ 0] [    T2] Mem abort info:
[    0.100564][ 0] [    T2]   ESR =3D 0x96000005
[    0.104789][ 0] [    T2]   EC =3D 0x25: DABT (current EL), IL =3D 32 bit=
s
[    0.111299][ 0] [    T2]   SET =3D 0, FnV =3D 0
[    0.115522][ 0] [    T2]   EA =3D 0, S1PTW =3D 0
[    0.119834][ 0] [    T2] Data abort info:
[    0.123883][ 0] [    T2]   ISV =3D 0, ISS =3D 0x00000005
[    0.128898][ 0] [    T2]   CM =3D 0, WnR =3D 0
[    0.133034][ 0] [    T2] [0000000000001388] user address but active_mm=
=20
is swapper
[    0.140600][ 0] [    T2] Internal error: Oops: 96000005 [#1] SMP
[    0.146667][ 0] [    T2] Modules linked in:
[    0.150892][ 0] [    T2] CPU: 0 PID: 2 Comm: kthreadd Not tainted=20
5.4.18-101+ #2
[    0.158367][ 0] [    T2] Source Version:=20
e7f24793ad667e777f2cf6dab620d082517f6075
[    0.165929][ 0] [    T2] Hardware name: FT-2000/4-D4-DSK Development=20
Board (DT)
[    0.173317][ 0] [    T2] pstate: 80000005 (Nzcv daif -PAN -UAO)
[    0.179302][ 0] [    T2] pc : __alloc_pages_nodemask+0xf8/0x308
[    0.185283][ 0] [    T2] lr : __alloc_pages_nodemask+0xe0/0x308
[    0.191263][ 0] [    T2] sp : ffffff8031867c30
[    0.195749][ 0] [    T2] x29: ffffff8031867c30 x28: 0000000000800700
[    0.202258][ 0] [    T2] x27: ffffff8031823a80 x26: 00000000ffffffff
[    0.208766][ 0] [    T2] x25: 0000000000400dc0 x24: 0000000000000001
[    0.215273][ 0] [    T2] x23: 0000000000000000 x22: ffffffc0113fa000
[    0.221781][ 0] [    T2] x21: 0000000000000002 x20: ffffffc0113f9000
[    0.228289][ 0] [    T2] x19: 0000000000400dc0 x18: 0000000000000014
[    0.234797][ 0] [    T2] x17: 000000009242c113 x16: 00000000b8b3e41b
[    0.241305][ 0] [    T2] x15: 00000000b31b39bd x14: 0000000000000000
[    0.247817][ 0] [    T2] x13: 0000000000000001 x12: 0000000000000001
[    0.254325][ 0] [    T2] x11: 0000000002e03c00 x10: 0000000005c05800
[    0.260833][ 0] [    T2] x9 : 0000000000000191 x8 : 0000000000000004
[    0.267340][ 0] [    T2] x7 : ffffff8032fe0378 x6 : 0000000000000000
[    0.273848][ 0] [    T2] x5 : 0000000000000003 x4 : 0000000000000000
[    0.280355][ 0] [    T2] x3 : 0000000000001380 x2 : 0000000000000000
[    0.286863][ 0] [    T2] x1 : 0000000000000001 x0 : 0000000000000000
[    0.293370][ 0] [    T2] Call trace:
[    0.296978][ 0] [    T2]  __alloc_pages_nodemask+0xf8/0x308
[    0.302609][ 0] [    T2]  copy_process+0x1a4/0x1340
[    0.307536][ 0] [    T2]  _do_fork+0x80/0x370
[    0.311934][ 0] [    T2]  kernel_thread+0x6c/0x90
[    0.316686][ 0] [    T2]  kthreadd+0x1e0/0x270
[    0.321173][ 0] [    T2]  ret_from_fork+0x10/0x18
[    0.325924][ 0] [    T2] Code: 3901c3a0 a9450ba3 b9406fa1 b5000b62=20
(b9400860)
[    0.333224][ 0] [    T2] ---[ end trace 7e9dcf3f049b9227 ]---

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com.

------=_Part_14851_890014881.1700634331481
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>when I run linux image on jailhouse, guset serial port print follow er=
rors: where I can get ways to sovle it=EF=BC=9F</div><div><br /></div><div>=
<br /></div>[ =C2=A0 =C2=A00.069576][ 0] [ =C2=A0 =C2=A0T0] Mount-cache has=
h table entries: 1024 (order: 1, 8192 bytes, linear)<br />[ =C2=A0 =C2=A00.=
078110][ 0] [ =C2=A0 =C2=A0T0] Mountpoint-cache hash table entries: 1024 (o=
rder: 1, 8192 bytes, linear)<br />[ =C2=A0 =C2=A00.087451][ 0] [ =C2=A0 =C2=
=A0T2] Unable to handle kernel paging request at virtual address 0000000000=
001388<br />[ =C2=A0 =C2=A00.096606][ 0] [ =C2=A0 =C2=A0T2] Mem abort info:=
<br />[ =C2=A0 =C2=A00.100564][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ESR =3D 0x9600=
0005<br />[ =C2=A0 =C2=A00.104789][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EC =3D 0x2=
5: DABT (current EL), IL =3D 32 bits<br />[ =C2=A0 =C2=A00.111299][ 0] [ =
=C2=A0 =C2=A0T2] =C2=A0 SET =3D 0, FnV =3D 0<br />[ =C2=A0 =C2=A00.115522][=
 0] [ =C2=A0 =C2=A0T2] =C2=A0 EA =3D 0, S1PTW =3D 0<br />[ =C2=A0 =C2=A00.1=
19834][ 0] [ =C2=A0 =C2=A0T2] Data abort info:<br />[ =C2=A0 =C2=A00.123883=
][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ISV =3D 0, ISS =3D 0x00000005<br />[ =C2=A0=
 =C2=A00.128898][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 CM =3D 0, WnR =3D 0<br />[ =
=C2=A0 =C2=A00.133034][ 0] [ =C2=A0 =C2=A0T2] [0000000000001388] user addre=
ss but active_mm is swapper<br />[ =C2=A0 =C2=A00.140600][ 0] [ =C2=A0 =C2=
=A0T2] Internal error: Oops: 96000005 [#1] SMP<br />[ =C2=A0 =C2=A00.146667=
][ 0] [ =C2=A0 =C2=A0T2] Modules linked in:<br />[ =C2=A0 =C2=A00.150892][ =
0] [ =C2=A0 =C2=A0T2] CPU: 0 PID: 2 Comm: kthreadd Not tainted 5.4.18-101+ =
#2<br />[ =C2=A0 =C2=A00.158367][ 0] [ =C2=A0 =C2=A0T2] Source Version: e7f=
24793ad667e777f2cf6dab620d082517f6075<br />[ =C2=A0 =C2=A00.165929][ 0] [ =
=C2=A0 =C2=A0T2] Hardware name: FT-2000/4-D4-DSK Development Board (DT)<br =
/>[ =C2=A0 =C2=A00.173317][ 0] [ =C2=A0 =C2=A0T2] pstate: 80000005 (Nzcv da=
if -PAN -UAO)<br />[ =C2=A0 =C2=A00.179302][ 0] [ =C2=A0 =C2=A0T2] pc : __a=
lloc_pages_nodemask+0xf8/0x308<br />[ =C2=A0 =C2=A00.185283][ 0] [ =C2=A0 =
=C2=A0T2] lr : __alloc_pages_nodemask+0xe0/0x308<br />[ =C2=A0 =C2=A00.1912=
63][ 0] [ =C2=A0 =C2=A0T2] sp : ffffff8031867c30<br />[ =C2=A0 =C2=A00.1957=
49][ 0] [ =C2=A0 =C2=A0T2] x29: ffffff8031867c30 x28: 0000000000800700<br /=
>[ =C2=A0 =C2=A00.202258][ 0] [ =C2=A0 =C2=A0T2] x27: ffffff8031823a80 x26:=
 00000000ffffffff<br />[ =C2=A0 =C2=A00.208766][ 0] [ =C2=A0 =C2=A0T2] x25:=
 0000000000400dc0 x24: 0000000000000001<br />[ =C2=A0 =C2=A00.215273][ 0] [=
 =C2=A0 =C2=A0T2] x23: 0000000000000000 x22: ffffffc0113fa000<br />[ =C2=A0=
 =C2=A00.221781][ 0] [ =C2=A0 =C2=A0T2] x21: 0000000000000002 x20: ffffffc0=
113f9000<br />[ =C2=A0 =C2=A00.228289][ 0] [ =C2=A0 =C2=A0T2] x19: 00000000=
00400dc0 x18: 0000000000000014<br />[ =C2=A0 =C2=A00.234797][ 0] [ =C2=A0 =
=C2=A0T2] x17: 000000009242c113 x16: 00000000b8b3e41b<br />[ =C2=A0 =C2=A00=
.241305][ 0] [ =C2=A0 =C2=A0T2] x15: 00000000b31b39bd x14: 0000000000000000=
<br />[ =C2=A0 =C2=A00.247817][ 0] [ =C2=A0 =C2=A0T2] x13: 0000000000000001=
 x12: 0000000000000001<br />[ =C2=A0 =C2=A00.254325][ 0] [ =C2=A0 =C2=A0T2]=
 x11: 0000000002e03c00 x10: 0000000005c05800<br />[ =C2=A0 =C2=A00.260833][=
 0] [ =C2=A0 =C2=A0T2] x9 : 0000000000000191 x8 : 0000000000000004<br />[ =
=C2=A0 =C2=A00.267340][ 0] [ =C2=A0 =C2=A0T2] x7 : ffffff8032fe0378 x6 : 00=
00000000000000<br />[ =C2=A0 =C2=A00.273848][ 0] [ =C2=A0 =C2=A0T2] x5 : 00=
00000000000003 x4 : 0000000000000000<br />[ =C2=A0 =C2=A00.280355][ 0] [ =
=C2=A0 =C2=A0T2] x3 : 0000000000001380 x2 : 0000000000000000<br />[ =C2=A0 =
=C2=A00.286863][ 0] [ =C2=A0 =C2=A0T2] x1 : 0000000000000001 x0 : 000000000=
0000000<br />[ =C2=A0 =C2=A00.293370][ 0] [ =C2=A0 =C2=A0T2] Call trace:<br=
 />[ =C2=A0 =C2=A00.296978][ 0] [ =C2=A0 =C2=A0T2] =C2=A0__alloc_pages_node=
mask+0xf8/0x308<br />[ =C2=A0 =C2=A00.302609][ 0] [ =C2=A0 =C2=A0T2] =C2=A0=
copy_process+0x1a4/0x1340<br />[ =C2=A0 =C2=A00.307536][ 0] [ =C2=A0 =C2=A0=
T2] =C2=A0_do_fork+0x80/0x370<br />[ =C2=A0 =C2=A00.311934][ 0] [ =C2=A0 =
=C2=A0T2] =C2=A0kernel_thread+0x6c/0x90<br />[ =C2=A0 =C2=A00.316686][ 0] [=
 =C2=A0 =C2=A0T2] =C2=A0kthreadd+0x1e0/0x270<br />[ =C2=A0 =C2=A00.321173][=
 0] [ =C2=A0 =C2=A0T2] =C2=A0ret_from_fork+0x10/0x18<br />[ =C2=A0 =C2=A00.=
325924][ 0] [ =C2=A0 =C2=A0T2] Code: 3901c3a0 a9450ba3 b9406fa1 b5000b62 (b=
9400860)<br />[ =C2=A0 =C2=A00.333224][ 0] [ =C2=A0 =C2=A0T2] ---[ end trac=
e 7e9dcf3f049b9227 ]---<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.co=
m</a>.<br />

------=_Part_14851_890014881.1700634331481--

------=_Part_14850_944291073.1700634331481--
