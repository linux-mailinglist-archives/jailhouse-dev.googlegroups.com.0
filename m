Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBBUVI7OVAMGQECDKUZEI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x103c.google.com (mail-pj1-x103c.google.com [IPv6:2607:f8b0:4864:20::103c])
	by mail.lfdr.de (Postfix) with ESMTPS id D94947F5761
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Nov 2023 05:25:56 +0100 (CET)
Received: by mail-pj1-x103c.google.com with SMTP id 98e67ed59e1d1-2856704e42esf138156a91.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Nov 2023 20:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1700713555; x=1701318355; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yt9XVOIVZBGjtkmwcOWYJloLFk+YJp4MTelzDqWAJio=;
        b=dGDhKy1WMV4SXBVXJii3PMpo1hAOQgDBJoz0sWHZJ/yuMGX2OB+/d5ymcqhSaENu8k
         +d41ofDiGIsIq1z5Yd7eH0/x0bVkoQ9eIyDNsIEM8j5Zv7o3OY4ZDapNgo3FwsPFH3sp
         SA14uuGQuWqjMmhjNIC9tgU93z1QR5LoebWDy4TjuJAyWTw5vGtwpr9ceE/oOeM4kG5X
         hBfwrj6HSruJHTOT5FYVyfiPGYgL5Mj0IP3tdsesqRZ9YJFE7rLUpyjuAHrG09bwbPI5
         cfcHqBi7AD4b6L/MSCL24SHUsKwAwZNX2NUlPNUvp5Evq6WIKzpPessvhuOgIvP+R4HH
         hXtw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700713555; x=1701318355; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yt9XVOIVZBGjtkmwcOWYJloLFk+YJp4MTelzDqWAJio=;
        b=UGnsUq+8+KEkUqxyZpAoFOPluzV8f8WBEchi0+qcmvc/LKugGPVlZIxtwkkMGRwlSa
         85qKpeF0mfphp/t2Wcuu3NSySaOBjAOuUI2BUd0ze7O5mztrgn994ALZrRMKccRi10hM
         YibVLY+9thOoB2yAtxDtHDI4rZ2lELGyFGymp5l1x0ziy6+LcSod28zVe3eiKoyCgvML
         8gSJGANjaBgHfkmj0Bm6CVBflkUUHcvAT8Wy9PINWaZlC1vFo6n4PT9EnU3LhksRjzAK
         wC5xatGs8gC0s648SNonste2b8xLsZ+zvEiRMXesI4GokenxNus2naT1qie+wnwvOw1L
         6LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700713555; x=1701318355;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yt9XVOIVZBGjtkmwcOWYJloLFk+YJp4MTelzDqWAJio=;
        b=K//JGaNoQsWlyHilOoLBMsCPvXzDSRmzYCC6ab67XyZIZaQZOvZZiSXhZ4D1gKHXb8
         O2WAZIDecuADZIP6wMVExhOK2/c8hU8TSPetKB+PR29FxplXw5N4XWAhrqhn0najODnv
         K/H1dpbb1t0gneiFPeKUqyEp7leROdKUrDaLgBFoB6Mfn5fkI3iM7QTjKi5T7BZi/kZm
         1tcVMcU6mJ5Z7oXO1nqrErcpkNMmppDNzQW1xKswht6Zhb/U1lqpYVzMj4gRtryBoRZn
         qeAc/w5jjukiehvaYHF6Xh75DY5ASbZQoNBgm2Wn2aFP3FEOdhpCPThBsj5p0EuVsA6v
         SLwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxcZRxYaDaNO+qQl1boMMtsr0kVGRooZwMTOEHkXSH2TwfMWnTv
	Fl7EqCv171g5gLgMpP9euJo=
X-Google-Smtp-Source: AGHT+IGWjNv7aRT+rtEG9txVQAQFOjQNRqPHWMI5YAE0aJ5QBnzXo10GLFxyX5kjQ46tksmB3qtzFQ==
X-Received: by 2002:a17:90b:180d:b0:283:2047:2c7d with SMTP id lw13-20020a17090b180d00b0028320472c7dmr4402603pjb.33.1700713555055;
        Wed, 22 Nov 2023 20:25:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:69a1:b0:280:976d:4cfe with SMTP id
 s30-20020a17090a69a100b00280976d4cfels310194pjj.1.-pod-prod-02-us; Wed, 22
 Nov 2023 20:25:53 -0800 (PST)
X-Received: by 2002:a17:90a:65c7:b0:27d:3819:8129 with SMTP id i7-20020a17090a65c700b0027d38198129mr969596pjs.5.1700713553379;
        Wed, 22 Nov 2023 20:25:53 -0800 (PST)
Date: Wed, 22 Nov 2023 20:25:52 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <dfb71410-9ebc-4c01-87a2-4cd8e9f22308n@googlegroups.com>
In-Reply-To: <1024f0c9-f851-46e2-abcb-3f3b40f5c47c@oth-regensburg.de>
References: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
 <1024f0c9-f851-46e2-abcb-3f3b40f5c47c@oth-regensburg.de>
Subject: Re: jailhouse enable linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2768_1837631805.1700713552425"
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

------=_Part_2768_1837631805.1700713552425
Content-Type: multipart/alternative; 
	boundary="----=_Part_2769_1853597860.1700713552425"

------=_Part_2769_1853597860.1700713552425
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In none root cell, start command is :
jailhouse cell linux -i /home/file/rootfs.cpio -d=20
configs/arm64/dts/AMA0.dtb configs/arm64/linux.cell /home/file/Image -c=20
"console=3DttyAMA0,115200 root=3D/dev/ram0  ramdisk_size=3D0x1000000=20
earlycon=3Dpl011,0x28000000"

=E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC=
+8 21:15:15<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

>
>
> On 22/11/2023 07:25, xin zhang wrote:
> > when I run linux image on jailhouse, guset serial port print follow=20
> > errors: where I can get ways to sovle it=EF=BC=9F
>
> Please provide more context. Does this happen in the root or non-root cel=
l?
>
> Ralf
>
> >=20
> >=20
> > [    0.069576][ 0] [    T0] Mount-cache hash table entries: 1024 (order=
:=20
> > 1, 8192 bytes, linear)
> > [    0.078110][ 0] [    T0] Mountpoint-cache hash table entries: 1024=
=20
> > (order: 1, 8192 bytes, linear)
> > [    0.087451][ 0] [    T2] Unable to handle kernel paging request at=
=20
> > virtual address 0000000000001388
> > [    0.096606][ 0] [    T2] Mem abort info:
> > [    0.100564][ 0] [    T2]   ESR =3D 0x96000005
> > [    0.104789][ 0] [    T2]   EC =3D 0x25: DABT (current EL), IL =3D 32=
 bits
> > [    0.111299][ 0] [    T2]   SET =3D 0, FnV =3D 0
> > [    0.115522][ 0] [    T2]   EA =3D 0, S1PTW =3D 0
> > [    0.119834][ 0] [    T2] Data abort info:
> > [    0.123883][ 0] [    T2]   ISV =3D 0, ISS =3D 0x00000005
> > [    0.128898][ 0] [    T2]   CM =3D 0, WnR =3D 0
> > [    0.133034][ 0] [    T2] [0000000000001388] user address but=20
> > active_mm is swapper
> > [    0.140600][ 0] [    T2] Internal error: Oops: 96000005 [#1] SMP
> > [    0.146667][ 0] [    T2] Modules linked in:
> > [    0.150892][ 0] [    T2] CPU: 0 PID: 2 Comm: kthreadd Not tainted=20
> > 5.4.18-101+ #2
> > [    0.158367][ 0] [    T2] Source Version:=20
> > e7f24793ad667e777f2cf6dab620d082517f6075
> > [    0.165929][ 0] [    T2] Hardware name: FT-2000/4-D4-DSK Development=
=20
> > Board (DT)
> > [    0.173317][ 0] [    T2] pstate: 80000005 (Nzcv daif -PAN -UAO)
> > [    0.179302][ 0] [    T2] pc : __alloc_pages_nodemask+0xf8/0x308
> > [    0.185283][ 0] [    T2] lr : __alloc_pages_nodemask+0xe0/0x308
> > [    0.191263][ 0] [    T2] sp : ffffff8031867c30
> > [    0.195749][ 0] [    T2] x29: ffffff8031867c30 x28: 0000000000800700
> > [    0.202258][ 0] [    T2] x27: ffffff8031823a80 x26: 00000000ffffffff
> > [    0.208766][ 0] [    T2] x25: 0000000000400dc0 x24: 0000000000000001
> > [    0.215273][ 0] [    T2] x23: 0000000000000000 x22: ffffffc0113fa000
> > [    0.221781][ 0] [    T2] x21: 0000000000000002 x20: ffffffc0113f9000
> > [    0.228289][ 0] [    T2] x19: 0000000000400dc0 x18: 0000000000000014
> > [    0.234797][ 0] [    T2] x17: 000000009242c113 x16: 00000000b8b3e41b
> > [    0.241305][ 0] [    T2] x15: 00000000b31b39bd x14: 0000000000000000
> > [    0.247817][ 0] [    T2] x13: 0000000000000001 x12: 0000000000000001
> > [    0.254325][ 0] [    T2] x11: 0000000002e03c00 x10: 0000000005c05800
> > [    0.260833][ 0] [    T2] x9 : 0000000000000191 x8 : 0000000000000004
> > [    0.267340][ 0] [    T2] x7 : ffffff8032fe0378 x6 : 0000000000000000
> > [    0.273848][ 0] [    T2] x5 : 0000000000000003 x4 : 0000000000000000
> > [    0.280355][ 0] [    T2] x3 : 0000000000001380 x2 : 0000000000000000
> > [    0.286863][ 0] [    T2] x1 : 0000000000000001 x0 : 0000000000000000
> > [    0.293370][ 0] [    T2] Call trace:
> > [    0.296978][ 0] [    T2]  __alloc_pages_nodemask+0xf8/0x308
> > [    0.302609][ 0] [    T2]  copy_process+0x1a4/0x1340
> > [    0.307536][ 0] [    T2]  _do_fork+0x80/0x370
> > [    0.311934][ 0] [    T2]  kernel_thread+0x6c/0x90
> > [    0.316686][ 0] [    T2]  kthreadd+0x1e0/0x270
> > [    0.321173][ 0] [    T2]  ret_from_fork+0x10/0x18
> > [    0.325924][ 0] [    T2] Code: 3901c3a0 a9450ba3 b9406fa1 b5000b62=
=20
> > (b9400860)
> > [    0.333224][ 0] [    T2] ---[ end trace 7e9dcf3f049b9227 ]---
> >=20
> > --=20
> > You received this message because you are subscribed to the Google=20
> > Groups "Jailhouse" group.
> > To unsubscribe from this group and stop receiving emails from it, send=
=20
> > an email to jailhouse-de...@googlegroups.com=20
> > <mailto:jailhouse-de...@googlegroups.com>.
> > To view this discussion on the web visit=20
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.com.

------=_Part_2769_1853597860.1700713552425
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In none root cell, start command is :<div>jailhouse cell linux -i /home/fil=
e/rootfs.cpio -d configs/arm64/dts/AMA0.dtb configs/arm64/linux.cell /home/=
file/Image -c "console=3DttyAMA0,115200 root=3D/dev/ram0 =C2=A0ramdisk_size=
=3D0x1000000 earlycon=3Dpl011,0x28000000"<br /><br /></div><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82023=E5=B9=B411=
=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 21:15:15&lt;Ralf Rams=
auer> =E5=86=99=E9=81=93=EF=BC=9A<br/></div><blockquote class=3D"gmail_quot=
e" style=3D"margin: 0 0 0 0.8ex; border-left: 1px solid rgb(204, 204, 204);=
 padding-left: 1ex;">
<br>
<br>On 22/11/2023 07:25, xin zhang wrote:
<br>&gt; when I run linux image on jailhouse, guset serial port print follo=
w=20
<br>&gt; errors: where I can get ways to sovle it=EF=BC=9F
<br>
<br>Please provide more context. Does this happen in the root or non-root c=
ell?
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt;=20
<br>&gt; [ =C2=A0 =C2=A00.069576][ 0] [ =C2=A0 =C2=A0T0] Mount-cache hash t=
able entries: 1024 (order:=20
<br>&gt; 1, 8192 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.078110][ 0] [ =C2=A0 =C2=A0T0] Mountpoint-cache h=
ash table entries: 1024=20
<br>&gt; (order: 1, 8192 bytes, linear)
<br>&gt; [ =C2=A0 =C2=A00.087451][ 0] [ =C2=A0 =C2=A0T2] Unable to handle k=
ernel paging request at=20
<br>&gt; virtual address 0000000000001388
<br>&gt; [ =C2=A0 =C2=A00.096606][ 0] [ =C2=A0 =C2=A0T2] Mem abort info:
<br>&gt; [ =C2=A0 =C2=A00.100564][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ESR =3D 0x9=
6000005
<br>&gt; [ =C2=A0 =C2=A00.104789][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EC =3D 0x25=
: DABT (current EL), IL =3D 32 bits
<br>&gt; [ =C2=A0 =C2=A00.111299][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 SET =3D 0, =
FnV =3D 0
<br>&gt; [ =C2=A0 =C2=A00.115522][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 EA =3D 0, S=
1PTW =3D 0
<br>&gt; [ =C2=A0 =C2=A00.119834][ 0] [ =C2=A0 =C2=A0T2] Data abort info:
<br>&gt; [ =C2=A0 =C2=A00.123883][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 ISV =3D 0, =
ISS =3D 0x00000005
<br>&gt; [ =C2=A0 =C2=A00.128898][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 CM =3D 0, W=
nR =3D 0
<br>&gt; [ =C2=A0 =C2=A00.133034][ 0] [ =C2=A0 =C2=A0T2] [0000000000001388]=
 user address but=20
<br>&gt; active_mm is swapper
<br>&gt; [ =C2=A0 =C2=A00.140600][ 0] [ =C2=A0 =C2=A0T2] Internal error: Oo=
ps: 96000005 [#1] SMP
<br>&gt; [ =C2=A0 =C2=A00.146667][ 0] [ =C2=A0 =C2=A0T2] Modules linked in:
<br>&gt; [ =C2=A0 =C2=A00.150892][ 0] [ =C2=A0 =C2=A0T2] CPU: 0 PID: 2 Comm=
: kthreadd Not tainted=20
<br>&gt; 5.4.18-101+ #2
<br>&gt; [ =C2=A0 =C2=A00.158367][ 0] [ =C2=A0 =C2=A0T2] Source Version:=20
<br>&gt; e7f24793ad667e777f2cf6dab620d082517f6075
<br>&gt; [ =C2=A0 =C2=A00.165929][ 0] [ =C2=A0 =C2=A0T2] Hardware name: FT-=
2000/4-D4-DSK Development=20
<br>&gt; Board (DT)
<br>&gt; [ =C2=A0 =C2=A00.173317][ 0] [ =C2=A0 =C2=A0T2] pstate: 80000005 (=
Nzcv daif -PAN -UAO)
<br>&gt; [ =C2=A0 =C2=A00.179302][ 0] [ =C2=A0 =C2=A0T2] pc : __alloc_pages=
_nodemask+0xf8/0x308
<br>&gt; [ =C2=A0 =C2=A00.185283][ 0] [ =C2=A0 =C2=A0T2] lr : __alloc_pages=
_nodemask+0xe0/0x308
<br>&gt; [ =C2=A0 =C2=A00.191263][ 0] [ =C2=A0 =C2=A0T2] sp : ffffff8031867=
c30
<br>&gt; [ =C2=A0 =C2=A00.195749][ 0] [ =C2=A0 =C2=A0T2] x29: ffffff8031867=
c30 x28: 0000000000800700
<br>&gt; [ =C2=A0 =C2=A00.202258][ 0] [ =C2=A0 =C2=A0T2] x27: ffffff8031823=
a80 x26: 00000000ffffffff
<br>&gt; [ =C2=A0 =C2=A00.208766][ 0] [ =C2=A0 =C2=A0T2] x25: 0000000000400=
dc0 x24: 0000000000000001
<br>&gt; [ =C2=A0 =C2=A00.215273][ 0] [ =C2=A0 =C2=A0T2] x23: 0000000000000=
000 x22: ffffffc0113fa000
<br>&gt; [ =C2=A0 =C2=A00.221781][ 0] [ =C2=A0 =C2=A0T2] x21: 0000000000000=
002 x20: ffffffc0113f9000
<br>&gt; [ =C2=A0 =C2=A00.228289][ 0] [ =C2=A0 =C2=A0T2] x19: 0000000000400=
dc0 x18: 0000000000000014
<br>&gt; [ =C2=A0 =C2=A00.234797][ 0] [ =C2=A0 =C2=A0T2] x17: 000000009242c=
113 x16: 00000000b8b3e41b
<br>&gt; [ =C2=A0 =C2=A00.241305][ 0] [ =C2=A0 =C2=A0T2] x15: 00000000b31b3=
9bd x14: 0000000000000000
<br>&gt; [ =C2=A0 =C2=A00.247817][ 0] [ =C2=A0 =C2=A0T2] x13: 0000000000000=
001 x12: 0000000000000001
<br>&gt; [ =C2=A0 =C2=A00.254325][ 0] [ =C2=A0 =C2=A0T2] x11: 0000000002e03=
c00 x10: 0000000005c05800
<br>&gt; [ =C2=A0 =C2=A00.260833][ 0] [ =C2=A0 =C2=A0T2] x9 : 0000000000000=
191 x8 : 0000000000000004
<br>&gt; [ =C2=A0 =C2=A00.267340][ 0] [ =C2=A0 =C2=A0T2] x7 : ffffff8032fe0=
378 x6 : 0000000000000000
<br>&gt; [ =C2=A0 =C2=A00.273848][ 0] [ =C2=A0 =C2=A0T2] x5 : 0000000000000=
003 x4 : 0000000000000000
<br>&gt; [ =C2=A0 =C2=A00.280355][ 0] [ =C2=A0 =C2=A0T2] x3 : 0000000000001=
380 x2 : 0000000000000000
<br>&gt; [ =C2=A0 =C2=A00.286863][ 0] [ =C2=A0 =C2=A0T2] x1 : 0000000000000=
001 x0 : 0000000000000000
<br>&gt; [ =C2=A0 =C2=A00.293370][ 0] [ =C2=A0 =C2=A0T2] Call trace:
<br>&gt; [ =C2=A0 =C2=A00.296978][ 0] [ =C2=A0 =C2=A0T2] =C2=A0__alloc_page=
s_nodemask+0xf8/0x308
<br>&gt; [ =C2=A0 =C2=A00.302609][ 0] [ =C2=A0 =C2=A0T2] =C2=A0copy_process=
+0x1a4/0x1340
<br>&gt; [ =C2=A0 =C2=A00.307536][ 0] [ =C2=A0 =C2=A0T2] =C2=A0_do_fork+0x8=
0/0x370
<br>&gt; [ =C2=A0 =C2=A00.311934][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kernel_threa=
d+0x6c/0x90
<br>&gt; [ =C2=A0 =C2=A00.316686][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kthreadd+0x1=
e0/0x270
<br>&gt; [ =C2=A0 =C2=A00.321173][ 0] [ =C2=A0 =C2=A0T2] =C2=A0ret_from_for=
k+0x10/0x18
<br>&gt; [ =C2=A0 =C2=A00.325924][ 0] [ =C2=A0 =C2=A0T2] Code: 3901c3a0 a94=
50ba3 b9406fa1 b5000b62=20
<br>&gt; (b9400860)
<br>&gt; [ =C2=A0 =C2=A00.333224][ 0] [ =C2=A0 =C2=A0T2] ---[ end trace 7e9=
dcf3f049b9227 ]---
<br>&gt;=20
<br>&gt; --=20
<br>&gt; You received this message because you are subscribed to the Google=
=20
<br>&gt; Groups &quot;Jailhouse&quot; group.
<br>&gt; To unsubscribe from this group and stop receiving emails from it, =
send=20
<br>&gt; an email to <a href data-email-masked rel=3D"nofollow">jailhouse-d=
e...@googlegroups.com</a>=20
<br>&gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">jailhouse-de=
...@googlegroups.com</a>&gt;.
<br>&gt; To view this discussion on the web visit=20
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e=
3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a3=
28-9a04c86b8b1en%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17007998=
03382000&amp;usg=3DAOvVaw0F5Oj9v-4AjhpAZnNCr_pa">https://groups.google.com/=
d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3ea=
29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1700799803382000&amp;usg=3DAOvVaw10oQCkhR-nP4zfKOiBgpYB">https://groups=
.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40g=
ooglegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;.
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.co=
m</a>.<br />

------=_Part_2769_1853597860.1700713552425--

------=_Part_2768_1837631805.1700713552425--
