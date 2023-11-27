Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBBE6ZR6VQMGQEN36L37Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F7D7F970B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Nov 2023 02:10:46 +0100 (CET)
Received: by mail-pf1-x43b.google.com with SMTP id d2e1a72fcca58-6cbca33ad5dsf3847831b3a.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 26 Nov 2023 17:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701047444; x=1701652244; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVUc6iHgbBvMRC62Veaixi6WcDbG2NCGnmW02l8eQCE=;
        b=XBzohWJ+bSc5hWRqDYB07uvZleggFy5E7HvLuTGMOJNV6Yl7zPHfWz8DqDklAk76oI
         KT8Q+J0YgEsrmyl041JXj2+FIjVpnzGGCmwhT7LE0fc/XShslMT9Vd4kcaBA9ePtMtZJ
         ANx2imuhqZ30ra5mXBFLwKoo38DknUIn3pGRVzbwGBBMbkBETVm2pQi+7i0sLD9ABJr5
         a58RgApfqgfbpzZhXjRUPWkJNTC+6hCk1Z4B0aOPktT6fUno+OOrTozHY6DtoMU19I57
         IIrSIit8D308Vgtq5eM6jEdqN7muyrrb0PxsSzZclrWEb05bHPNOFW74kQ9MLYo2tlne
         W88A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701047444; x=1701652244; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVUc6iHgbBvMRC62Veaixi6WcDbG2NCGnmW02l8eQCE=;
        b=B2j5mQJ+v2tqtW9fptLaH50bMNwQE+ROi+e3AEpuwUoUY2HP126zLVtGLFORdB7Wmu
         +6tnOgTLFcTBM6osq6dzg2j8TBureDLk3Mv90Z8bX5/zxf8NvsE8+NXoUrZLrzTnln+a
         crtxC5lZ2badgJeT5OtlySW3Pd6Yfp6GcgG9pzqKQzRlQXi8b0Txv6kk09WMdbHzm+IP
         +SPKm3D3PSA+Ws2rbR8isnNdnWwWqjde7xNenlFwnENa2UjaNtE5j9iBJ1d/KLY3e6vp
         1Vp3dZyG5OFgKGiOC/Di+3pzAW2QqYVyP75lsULgxyLZP2OXSrG7xEkgCSOgajbubHVw
         36Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701047444; x=1701652244;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HVUc6iHgbBvMRC62Veaixi6WcDbG2NCGnmW02l8eQCE=;
        b=QetOkQU8ngbwKwpBaBo2JsDQ4Btw8RvJ1FPG2ID1yA8H+aeFhTaz4MHvDr4lfF/yF2
         6athmsSO5HjYgrR28UyKVgBQLtfpKdh6GgJaSxSTCwL1qzIePzHiWUGmjNZPhfkOx2q3
         7IO0qC73UF2wSMeoVS6mJpF1yji7uhjzTsPNH28usKduU6L/rfL20jAcQpu0mAjHBF8O
         ycxlSJNKlg2VKQjQzzqMLrSQAQJ3zaqL71jCHo4Lpz8Un4m0jFQFz4aF2rsfm8dvVIsb
         /+EeV3fw1wKXWSNaX3UjJLO2gVjj8I4qPx/DnIJ5914bV2eMWP41VIXria0/nJAAH80W
         AaMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YwwvD5u+frEmjW/mJSFIQgo0LSHDAxCOm8k3L87Dnv8bhH8kddc
	cS4XrLOfpY5O1+NbwmTUbhs=
X-Google-Smtp-Source: AGHT+IEE2lLEjCMnmZH+IKINgzseVx69yneK0i+W2yyW/6ypq1N+UE9t43VBubdEgmMn84+4GEK6iA==
X-Received: by 2002:a05:6a00:4983:b0:6cb:5bf7:a50e with SMTP id dn3-20020a056a00498300b006cb5bf7a50emr16001938pfb.12.1701047444081;
        Sun, 26 Nov 2023 17:10:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:4185:b0:6cb:bd53:aaac with SMTP id
 ca5-20020a056a00418500b006cbbd53aaacls2584152pfb.0.-pod-prod-04-us; Sun, 26
 Nov 2023 17:10:42 -0800 (PST)
X-Received: by 2002:a63:258:0:b0:5bd:d5fa:1b14 with SMTP id 85-20020a630258000000b005bdd5fa1b14mr1586828pgc.1.1701047442593;
        Sun, 26 Nov 2023 17:10:42 -0800 (PST)
Date: Sun, 26 Nov 2023 17:10:41 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <908fb2bf-874e-4c76-97e0-cb658a206afen@googlegroups.com>
In-Reply-To: <d55b7419-79f5-4c37-aaa4-d78fef2c26fa@oth-regensburg.de>
References: <a3ea29e3-da4c-4352-a328-9a04c86b8b1en@googlegroups.com>
 <1024f0c9-f851-46e2-abcb-3f3b40f5c47c@oth-regensburg.de>
 <dfb71410-9ebc-4c01-87a2-4cd8e9f22308n@googlegroups.com>
 <d55b7419-79f5-4c37-aaa4-d78fef2c26fa@oth-regensburg.de>
Subject: Re: jailhouse enable linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_127290_1587391675.1701047441479"
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

------=_Part_127290_1587391675.1701047441479
Content-Type: multipart/alternative; 
	boundary="----=_Part_127291_1541741011.1701047441479"

------=_Part_127291_1541741011.1701047441479
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There should be no issues with the device tree and configuration files, and=
=20
some kernel images can be enable. I will analyze the direction you provided=
=20
again.
tks.
=E5=9C=A82023=E5=B9=B411=E6=9C=8824=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 00:17:27<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

> Hi,
>
> On 23/11/2023 05:25, xin zhang wrote:
> > In none root cell, start command is :
> > jailhouse cell linux -i /home/file/rootfs.cpio -d=20
> > configs/arm64/dts/AMA0.dtb configs/arm64/linux.cell /home/file/Image -c=
=20
> > "console=3DttyAMA0,115200 root=3D/dev/ram0  ramdisk_size=3D0x1000000=20
> > earlycon=3Dpl011,0x28000000"
>
> Okay. Are you absolutely sure, that the device tree matches with the=20
> cell configuration? I wonder why the kernel tries to access virtual (!)=
=20
> address 0x1388, which apparently has no mapping. In case everything is=20
> configured correctly, then we have here some issue with the kernel, and=
=20
> you should debug in this direction.
>
> Ralf
>
> >=20
> > =E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89=
 UTC+8 21:15:15<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A
> >=20
> >=20
> >=20
> > On 22/11/2023 07:25, xin zhang wrote:
> > > when I run linux image on jailhouse, guset serial port print follow
> > > errors: where I can get ways to sovle it=EF=BC=9F
> >=20
> > Please provide more context. Does this happen in the root or
> > non-root cell?
> >=20
> > Ralf
> >=20
> > >
> > >
> > > [    0.069576][ 0] [    T0] Mount-cache hash table entries: 1024
> > (order:
> > > 1, 8192 bytes, linear)
> > > [    0.078110][ 0] [    T0] Mountpoint-cache hash table entries:
> > 1024
> > > (order: 1, 8192 bytes, linear)
> > > [    0.087451][ 0] [    T2] Unable to handle kernel paging
> > request at
> > > virtual address 0000000000001388
> > > [    0.096606][ 0] [    T2] Mem abort info:
> > > [    0.100564][ 0] [    T2]   ESR =3D 0x96000005
> > > [    0.104789][ 0] [    T2]   EC =3D 0x25: DABT (current EL), IL =3D
> > 32 bits
> > > [    0.111299][ 0] [    T2]   SET =3D 0, FnV =3D 0
> > > [    0.115522][ 0] [    T2]   EA =3D 0, S1PTW =3D 0
> > > [    0.119834][ 0] [    T2] Data abort info:
> > > [    0.123883][ 0] [    T2]   ISV =3D 0, ISS =3D 0x00000005
> > > [    0.128898][ 0] [    T2]   CM =3D 0, WnR =3D 0
> > > [    0.133034][ 0] [    T2] [0000000000001388] user address but
> > > active_mm is swapper
> > > [    0.140600][ 0] [    T2] Internal error: Oops: 96000005 [#1] SMP
> > > [    0.146667][ 0] [    T2] Modules linked in:
> > > [    0.150892][ 0] [    T2] CPU: 0 PID: 2 Comm: kthreadd Not tainted
> > > 5.4.18-101+ #2
> > > [    0.158367][ 0] [    T2] Source Version:
> > > e7f24793ad667e777f2cf6dab620d082517f6075
> > > [    0.165929][ 0] [    T2] Hardware name: FT-2000/4-D4-DSK
> > Development
> > > Board (DT)
> > > [    0.173317][ 0] [    T2] pstate: 80000005 (Nzcv daif -PAN -UAO)
> > > [    0.179302][ 0] [    T2] pc : __alloc_pages_nodemask+0xf8/0x308
> > > [    0.185283][ 0] [    T2] lr : __alloc_pages_nodemask+0xe0/0x308
> > > [    0.191263][ 0] [    T2] sp : ffffff8031867c30
> > > [    0.195749][ 0] [    T2] x29: ffffff8031867c30 x28:
> > 0000000000800700
> > > [    0.202258][ 0] [    T2] x27: ffffff8031823a80 x26:
> > 00000000ffffffff
> > > [    0.208766][ 0] [    T2] x25: 0000000000400dc0 x24:
> > 0000000000000001
> > > [    0.215273][ 0] [    T2] x23: 0000000000000000 x22:
> > ffffffc0113fa000
> > > [    0.221781][ 0] [    T2] x21: 0000000000000002 x20:
> > ffffffc0113f9000
> > > [    0.228289][ 0] [    T2] x19: 0000000000400dc0 x18:
> > 0000000000000014
> > > [    0.234797][ 0] [    T2] x17: 000000009242c113 x16:
> > 00000000b8b3e41b
> > > [    0.241305][ 0] [    T2] x15: 00000000b31b39bd x14:
> > 0000000000000000
> > > [    0.247817][ 0] [    T2] x13: 0000000000000001 x12:
> > 0000000000000001
> > > [    0.254325][ 0] [    T2] x11: 0000000002e03c00 x10:
> > 0000000005c05800
> > > [    0.260833][ 0] [    T2] x9 : 0000000000000191 x8 :
> > 0000000000000004
> > > [    0.267340][ 0] [    T2] x7 : ffffff8032fe0378 x6 :
> > 0000000000000000
> > > [    0.273848][ 0] [    T2] x5 : 0000000000000003 x4 :
> > 0000000000000000
> > > [    0.280355][ 0] [    T2] x3 : 0000000000001380 x2 :
> > 0000000000000000
> > > [    0.286863][ 0] [    T2] x1 : 0000000000000001 x0 :
> > 0000000000000000
> > > [    0.293370][ 0] [    T2] Call trace:
> > > [    0.296978][ 0] [    T2]  __alloc_pages_nodemask+0xf8/0x308
> > > [    0.302609][ 0] [    T2]  copy_process+0x1a4/0x1340
> > > [    0.307536][ 0] [    T2]  _do_fork+0x80/0x370
> > > [    0.311934][ 0] [    T2]  kernel_thread+0x6c/0x90
> > > [    0.316686][ 0] [    T2]  kthreadd+0x1e0/0x270
> > > [    0.321173][ 0] [    T2]  ret_from_fork+0x10/0x18
> > > [    0.325924][ 0] [    T2] Code: 3901c3a0 a9450ba3 b9406fa1
> > b5000b62
> > > (b9400860)
> > > [    0.333224][ 0] [    T2] ---[ end trace 7e9dcf3f049b9227 ]---
> > >
> > > --
> > > You received this message because you are subscribed to the Google
> > > Groups "Jailhouse" group.
> > > To unsubscribe from this group and stop receiving emails from it,
> > send
> > > an email to jailhouse-de...@googlegroups.com
> > > <mailto:jailhouse-de...@googlegroups.com>.
> > > To view this discussion on the web visit
> > >
> >=20
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com>=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9=
a04c86b8b1en%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >>.
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
> https://groups.google.com/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4=
cd8e9f22308n%40googlegroups.com=20
> <
> https://groups.google.com/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4=
cd8e9f22308n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter
> >.
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/908fb2bf-874e-4c76-97e0-cb658a206afen%40googlegroups.com.

------=_Part_127291_1541741011.1701047441479
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There should be no issues with the device tree and configuration files, and=
 some kernel images can be enable. I will analyze the direction you provide=
d again.<br /><div>tks.</div><div class=3D"gmail_quote"><div dir=3D"auto" c=
lass=3D"gmail_attr">=E5=9C=A82023=E5=B9=B411=E6=9C=8824=E6=97=A5=E6=98=9F=
=E6=9C=9F=E4=BA=94 UTC+8 00:17:27&lt;Ralf Ramsauer> =E5=86=99=E9=81=93=EF=
=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0=
.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Hi,
<br>
<br>On 23/11/2023 05:25, xin zhang wrote:
<br>&gt; In none root cell, start command is :
<br>&gt; jailhouse cell linux -i /home/file/rootfs.cpio -d=20
<br>&gt; configs/arm64/dts/AMA0.dtb configs/arm64/linux.cell /home/file/Ima=
ge -c=20
<br>&gt; &quot;console=3DttyAMA0,115200 root=3D/dev/ram0 =C2=A0ramdisk_size=
=3D0x1000000=20
<br>&gt; earlycon=3Dpl011,0x28000000&quot;
<br>
<br>Okay. Are you absolutely sure, that the device tree matches with the=20
<br>cell configuration? I wonder why the kernel tries to access virtual (!)=
=20
<br>address 0x1388, which apparently has no mapping. In case everything is=
=20
<br>configured correctly, then we have here some issue with the kernel, and=
=20
<br>you should debug in this direction.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; =E5=9C=A82023=E5=B9=B411=E6=9C=8822=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=B8=89 UTC+8 21:15:15&lt;Ralf Ramsauer&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt;=20
<br>&gt;=20
<br>&gt;=20
<br>&gt;     On 22/11/2023 07:25, xin zhang wrote:
<br>&gt;      &gt; when I run linux image on jailhouse, guset serial port p=
rint follow
<br>&gt;      &gt; errors: where I can get ways to sovle it=EF=BC=9F
<br>&gt;=20
<br>&gt;     Please provide more context. Does this happen in the root or
<br>&gt;     non-root cell?
<br>&gt;=20
<br>&gt;     Ralf
<br>&gt;=20
<br>&gt;      &gt;
<br>&gt;      &gt;
<br>&gt;      &gt; [ =C2=A0 =C2=A00.069576][ 0] [ =C2=A0 =C2=A0T0] Mount-ca=
che hash table entries: 1024
<br>&gt;     (order:
<br>&gt;      &gt; 1, 8192 bytes, linear)
<br>&gt;      &gt; [ =C2=A0 =C2=A00.078110][ 0] [ =C2=A0 =C2=A0T0] Mountpoi=
nt-cache hash table entries:
<br>&gt;     1024
<br>&gt;      &gt; (order: 1, 8192 bytes, linear)
<br>&gt;      &gt; [ =C2=A0 =C2=A00.087451][ 0] [ =C2=A0 =C2=A0T2] Unable t=
o handle kernel paging
<br>&gt;     request at
<br>&gt;      &gt; virtual address 0000000000001388
<br>&gt;      &gt; [ =C2=A0 =C2=A00.096606][ 0] [ =C2=A0 =C2=A0T2] Mem abor=
t info:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.100564][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 E=
SR =3D 0x96000005
<br>&gt;      &gt; [ =C2=A0 =C2=A00.104789][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 E=
C =3D 0x25: DABT (current EL), IL =3D
<br>&gt;     32 bits
<br>&gt;      &gt; [ =C2=A0 =C2=A00.111299][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 S=
ET =3D 0, FnV =3D 0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.115522][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 E=
A =3D 0, S1PTW =3D 0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.119834][ 0] [ =C2=A0 =C2=A0T2] Data abo=
rt info:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.123883][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 I=
SV =3D 0, ISS =3D 0x00000005
<br>&gt;      &gt; [ =C2=A0 =C2=A00.128898][ 0] [ =C2=A0 =C2=A0T2] =C2=A0 C=
M =3D 0, WnR =3D 0
<br>&gt;      &gt; [ =C2=A0 =C2=A00.133034][ 0] [ =C2=A0 =C2=A0T2] [0000000=
000001388] user address but
<br>&gt;      &gt; active_mm is swapper
<br>&gt;      &gt; [ =C2=A0 =C2=A00.140600][ 0] [ =C2=A0 =C2=A0T2] Internal=
 error: Oops: 96000005 [#1] SMP
<br>&gt;      &gt; [ =C2=A0 =C2=A00.146667][ 0] [ =C2=A0 =C2=A0T2] Modules =
linked in:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.150892][ 0] [ =C2=A0 =C2=A0T2] CPU: 0 P=
ID: 2 Comm: kthreadd Not tainted
<br>&gt;      &gt; 5.4.18-101+ #2
<br>&gt;      &gt; [ =C2=A0 =C2=A00.158367][ 0] [ =C2=A0 =C2=A0T2] Source V=
ersion:
<br>&gt;      &gt; e7f24793ad667e777f2cf6dab620d082517f6075
<br>&gt;      &gt; [ =C2=A0 =C2=A00.165929][ 0] [ =C2=A0 =C2=A0T2] Hardware=
 name: FT-2000/4-D4-DSK
<br>&gt;     Development
<br>&gt;      &gt; Board (DT)
<br>&gt;      &gt; [ =C2=A0 =C2=A00.173317][ 0] [ =C2=A0 =C2=A0T2] pstate: =
80000005 (Nzcv daif -PAN -UAO)
<br>&gt;      &gt; [ =C2=A0 =C2=A00.179302][ 0] [ =C2=A0 =C2=A0T2] pc : __a=
lloc_pages_nodemask+0xf8/0x308
<br>&gt;      &gt; [ =C2=A0 =C2=A00.185283][ 0] [ =C2=A0 =C2=A0T2] lr : __a=
lloc_pages_nodemask+0xe0/0x308
<br>&gt;      &gt; [ =C2=A0 =C2=A00.191263][ 0] [ =C2=A0 =C2=A0T2] sp : fff=
fff8031867c30
<br>&gt;      &gt; [ =C2=A0 =C2=A00.195749][ 0] [ =C2=A0 =C2=A0T2] x29: fff=
fff8031867c30 x28:
<br>&gt;     0000000000800700
<br>&gt;      &gt; [ =C2=A0 =C2=A00.202258][ 0] [ =C2=A0 =C2=A0T2] x27: fff=
fff8031823a80 x26:
<br>&gt;     00000000ffffffff
<br>&gt;      &gt; [ =C2=A0 =C2=A00.208766][ 0] [ =C2=A0 =C2=A0T2] x25: 000=
0000000400dc0 x24:
<br>&gt;     0000000000000001
<br>&gt;      &gt; [ =C2=A0 =C2=A00.215273][ 0] [ =C2=A0 =C2=A0T2] x23: 000=
0000000000000 x22:
<br>&gt;     ffffffc0113fa000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.221781][ 0] [ =C2=A0 =C2=A0T2] x21: 000=
0000000000002 x20:
<br>&gt;     ffffffc0113f9000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.228289][ 0] [ =C2=A0 =C2=A0T2] x19: 000=
0000000400dc0 x18:
<br>&gt;     0000000000000014
<br>&gt;      &gt; [ =C2=A0 =C2=A00.234797][ 0] [ =C2=A0 =C2=A0T2] x17: 000=
000009242c113 x16:
<br>&gt;     00000000b8b3e41b
<br>&gt;      &gt; [ =C2=A0 =C2=A00.241305][ 0] [ =C2=A0 =C2=A0T2] x15: 000=
00000b31b39bd x14:
<br>&gt;     0000000000000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.247817][ 0] [ =C2=A0 =C2=A0T2] x13: 000=
0000000000001 x12:
<br>&gt;     0000000000000001
<br>&gt;      &gt; [ =C2=A0 =C2=A00.254325][ 0] [ =C2=A0 =C2=A0T2] x11: 000=
0000002e03c00 x10:
<br>&gt;     0000000005c05800
<br>&gt;      &gt; [ =C2=A0 =C2=A00.260833][ 0] [ =C2=A0 =C2=A0T2] x9 : 000=
0000000000191 x8 :
<br>&gt;     0000000000000004
<br>&gt;      &gt; [ =C2=A0 =C2=A00.267340][ 0] [ =C2=A0 =C2=A0T2] x7 : fff=
fff8032fe0378 x6 :
<br>&gt;     0000000000000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.273848][ 0] [ =C2=A0 =C2=A0T2] x5 : 000=
0000000000003 x4 :
<br>&gt;     0000000000000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.280355][ 0] [ =C2=A0 =C2=A0T2] x3 : 000=
0000000001380 x2 :
<br>&gt;     0000000000000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.286863][ 0] [ =C2=A0 =C2=A0T2] x1 : 000=
0000000000001 x0 :
<br>&gt;     0000000000000000
<br>&gt;      &gt; [ =C2=A0 =C2=A00.293370][ 0] [ =C2=A0 =C2=A0T2] Call tra=
ce:
<br>&gt;      &gt; [ =C2=A0 =C2=A00.296978][ 0] [ =C2=A0 =C2=A0T2] =C2=A0__=
alloc_pages_nodemask+0xf8/0x308
<br>&gt;      &gt; [ =C2=A0 =C2=A00.302609][ 0] [ =C2=A0 =C2=A0T2] =C2=A0co=
py_process+0x1a4/0x1340
<br>&gt;      &gt; [ =C2=A0 =C2=A00.307536][ 0] [ =C2=A0 =C2=A0T2] =C2=A0_d=
o_fork+0x80/0x370
<br>&gt;      &gt; [ =C2=A0 =C2=A00.311934][ 0] [ =C2=A0 =C2=A0T2] =C2=A0ke=
rnel_thread+0x6c/0x90
<br>&gt;      &gt; [ =C2=A0 =C2=A00.316686][ 0] [ =C2=A0 =C2=A0T2] =C2=A0kt=
hreadd+0x1e0/0x270
<br>&gt;      &gt; [ =C2=A0 =C2=A00.321173][ 0] [ =C2=A0 =C2=A0T2] =C2=A0re=
t_from_fork+0x10/0x18
<br>&gt;      &gt; [ =C2=A0 =C2=A00.325924][ 0] [ =C2=A0 =C2=A0T2] Code: 39=
01c3a0 a9450ba3 b9406fa1
<br>&gt;     b5000b62
<br>&gt;      &gt; (b9400860)
<br>&gt;      &gt; [ =C2=A0 =C2=A00.333224][ 0] [ =C2=A0 =C2=A0T2] ---[ end=
 trace 7e9dcf3f049b9227 ]---
<br>&gt;      &gt;
<br>&gt;      &gt; --
<br>&gt;      &gt; You received this message because you are subscribed to =
the Google
<br>&gt;      &gt; Groups &quot;Jailhouse&quot; group.
<br>&gt;      &gt; To unsubscribe from this group and stop receiving emails=
 from it,
<br>&gt;     send
<br>&gt;      &gt; an email to <a href data-email-masked rel=3D"nofollow">j=
ailhouse-de...@googlegroups.com</a>
<br>&gt;      &gt; &lt;mailto:<a href data-email-masked rel=3D"nofollow">ja=
ilhouse-de...@googlegroups.com</a>&gt;.
<br>&gt;      &gt; To view this discussion on the web visit
<br>&gt;      &gt;
<br>&gt;     <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3e=
a29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com" target=3D"_blank" re=
l=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-C=
N&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-435=
2-a328-9a04c86b8b1en%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1701=
133495813000&amp;usg=3DAOvVaw3xXsXtr4tj1vF5yD2ItBSL">https://groups.google.=
com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegro=
ups.com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/=
a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com" target=3D"_blank"=
 rel=3D"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dz=
h-CN&amp;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-=
4352-a328-9a04c86b8b1en%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D1=
701133495813000&amp;usg=3DAOvVaw3xXsXtr4tj1vF5yD2ItBSL">https://groups.goog=
le.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40google=
groups.com</a>&gt; &lt;<a href=3D"https://groups.google.com/d/msgid/jailhou=
se-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegroups.com?utm_medium=
=3Demail&amp;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-s=
aferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://gro=
ups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%=
2540googlegroups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3D=
gmail&amp;ust=3D1701133495813000&amp;usg=3DAOvVaw3EsbtjPWIMZNUVEI-BJ6kO">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c=
86b8b1en%40googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a> =
&lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a3ea29e3-da4=
c-4352-a328-9a04c86b8b1en%40googlegroups.com?utm_medium=3Demail&amp;utm_sou=
rce=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.com/d/msg=
id/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%2540googlegroups.com=
?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;ust=3D1701=
133495813000&amp;usg=3DAOvVaw3EsbtjPWIMZNUVEI-BJ6kO">https://groups.google.=
com/d/msgid/jailhouse-dev/a3ea29e3-da4c-4352-a328-9a04c86b8b1en%40googlegro=
ups.com?utm_medium=3Demail&amp;utm_source=3Dfooter</a>&gt;&gt;.
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
<br>&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dfb7141=
0-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.com" target=3D"_blank" rel=3D=
"nofollow" data-saferedirecturl=3D"https://www.google.com/url?hl=3Dzh-CN&am=
p;q=3Dhttps://groups.google.com/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87=
a2-4cd8e9f22308n%2540googlegroups.com&amp;source=3Dgmail&amp;ust=3D17011334=
95813000&amp;usg=3DAOvVaw1Xt0L-48NS6-RWU2_e-BmE">https://groups.google.com/=
d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.=
com</a> &lt;<a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/dfb7=
1410-9ebc-4c01-87a2-4cd8e9f22308n%40googlegroups.com?utm_medium=3Demail&amp=
;utm_source=3Dfooter" target=3D"_blank" rel=3D"nofollow" data-saferedirectu=
rl=3D"https://www.google.com/url?hl=3Dzh-CN&amp;q=3Dhttps://groups.google.c=
om/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%2540googlegr=
oups.com?utm_medium%3Demail%26utm_source%3Dfooter&amp;source=3Dgmail&amp;us=
t=3D1701133495813000&amp;usg=3DAOvVaw2dyK5xE0NaibDhjxCh1woP">https://groups=
.google.com/d/msgid/jailhouse-dev/dfb71410-9ebc-4c01-87a2-4cd8e9f22308n%40g=
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
om/d/msgid/jailhouse-dev/908fb2bf-874e-4c76-97e0-cb658a206afen%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/908fb2bf-874e-4c76-97e0-cb658a206afen%40googlegroups.co=
m</a>.<br />

------=_Part_127291_1541741011.1701047441479--

------=_Part_127290_1587391675.1701047441479--
