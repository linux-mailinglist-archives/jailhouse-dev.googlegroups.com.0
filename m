Return-Path: <jailhouse-dev+bncBCWY74EX3IPRBF5L4CTQMGQE5K5CVFI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFDE793514
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Sep 2023 08:00:57 +0200 (CEST)
Received: by mail-pf1-x43b.google.com with SMTP id d2e1a72fcca58-68bf123aca4sf3505657b3a.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Sep 2023 23:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1693980056; x=1694584856; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZuiF95LKQmAOXe1FQ2RupGmysmvmuI2BxWYfXW/C0vg=;
        b=kHTw+S4Ohnki07lPaNrTfYwsDFuhcnxr5j4A+ZhB7orhh34Ak5PVKYJ1lLISeMOWvd
         Divs2r+FAl29+K/GVQIZiHphM4EiPKBF6JTBCIURdA9VKb7kzuISGTO0XBdTJlEL3ezN
         fw4f7AW5PyH2tA8IN36DBEcV+3ACrZgZyVhfdO8ot62CYLAH0LI2dKtzcS67ZwecTjE8
         u5h0drr6ySNIFBAsoZuqf6aiRSL/Nq67qn7XMCCtXPQb88FbHRHDJ7wH2A2keDMFSk5K
         dlxMZcX652Gjh8K5s3uTRO+vIzJydGrNFQe+XJu/iWpYYeMU0hEbRbKtU+0YfMeu0qaU
         ZRew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693980056; x=1694584856; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZuiF95LKQmAOXe1FQ2RupGmysmvmuI2BxWYfXW/C0vg=;
        b=cjAmUrGL60rWG/BarjFPRBYdO36qsT+bu/zIEqFWQnvaj3gmRqiLa6EAtdXCtUkZcM
         oBXFwwnEr74oAjnLjAMN+Z/2mfoNL3cJQaueLCASbSrCsBLzk0gzuJC/EZVDF32nSnSA
         kit2zLurj0bP1mP3wTtbNqqvyiQUl+4vD/nkkKuPpFglNMezchsj1wIwcOa1+D6qxYxP
         UKJXLFtGjiz+ha/X9gIOoaq8KeP0ZVmh8Euo5enSRb8kUbuMJ5V3/5NqlhFdxlZ9xB+T
         FL+c7yM5vu6rAIns/98mvmgaEw3nq+XPIaT7Qs6QVY7Baxl4KoIE/MRUlDdGhEnGfR7s
         DXoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693980056; x=1694584856;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZuiF95LKQmAOXe1FQ2RupGmysmvmuI2BxWYfXW/C0vg=;
        b=fLjCST4pUBNejZPIF/NirWWkkbwjCYLteYUn5RrGNiyKT+CyLZn19knppmkYM293gT
         Bz03Shm+mjeQptF7C9uVS4IJ1K6Gcc1QNNipZDYbfgVHK0B7xK0X8iN8UA027To7pIBQ
         jzIvO9pbcC12LAyHwfF29/dOWbcLmb1jVqqaqa/U6AK1EohoB4+4xOGLvO/Af+ezjdUR
         lhLNxTUoyhJPd1m7Wiv/vSVeQn3trMX92YGf8P16M4A6b4+mxgxmS3qMxEArRB/5+C2f
         RTl3hLlsqE6XgmxlKzGwTv3VfRKAJIx3tQULF3MU5U54cfM35IFJSEAqyZFyTkIB3W9c
         3VXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0Yy0Sq1fry5llyGRh86u3zKxY7oS/uPcGUIMccvLEskxV64MI79X
	MHuEft9mWs0nRD7IPXcYNgA=
X-Google-Smtp-Source: AGHT+IE6C9LDA14iJWyrkkaWfrRjlHYtEScm+3xo9Qsy/5yxNd//Myg43XudaZsXlbbJbWn6Toq3dA==
X-Received: by 2002:a05:6a20:3248:b0:13b:a4fd:3017 with SMTP id hm8-20020a056a20324800b0013ba4fd3017mr12294003pzc.46.1693980056222;
        Tue, 05 Sep 2023 23:00:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:a:b0:68a:4bf6:aa03 with SMTP id h10-20020a056a00000a00b0068a4bf6aa03ls4852188pfk.0.-pod-prod-05-us;
 Tue, 05 Sep 2023 23:00:54 -0700 (PDT)
X-Received: by 2002:a63:b745:0:b0:56f:e58d:8839 with SMTP id w5-20020a63b745000000b0056fe58d8839mr3306702pgt.6.1693980054546;
        Tue, 05 Sep 2023 23:00:54 -0700 (PDT)
Date: Tue, 5 Sep 2023 23:00:53 -0700 (PDT)
From: Zhan Zheng <zzlossdev@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f683a15c-de4c-476f-a535-00998d1034f8n@googlegroups.com>
In-Reply-To: <30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n@googlegroups.com>
References: <ca381c51-0921-42cf-ad8f-2b6f6727ce6dn@googlegroups.com>
 <a5a7147d-750d-4000-87f5-6ca0cc93fcb2n@googlegroups.com>
 <a4c85fc2-4bf4-4c07-830f-67a60a6d40a6@oth-regensburg.de>
 <c43555c0-b479-43c3-8afc-41208516a92bn@googlegroups.com>
 <6c49d31b-6f95-4311-a02f-597fa6617c2en@googlegroups.com>
 <30d1fba1-3c8e-4ffd-9740-e5e11b544ff3n@googlegroups.com>
Subject: Re: when enter_hypervisor on rk3568, system reboot without oops
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_54670_246375617.1693980053552"
X-Original-Sender: zzlossdev@gmail.com
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

------=_Part_54670_246375617.1693980053552
Content-Type: multipart/alternative; 
	boundary="----=_Part_54671_1135392155.1693980053552"

------=_Part_54671_1135392155.1693980053552
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable


I tried to enable CONFIG_VIRTUALIZATION & CONFIG_KVM. dmesg (the attachment=
=20
below) shows KVM inited successfully, but `jailhouse enable rk3568.cell`=20
still rebooting system=20
=E5=9C=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8=
 11:41:11<bot crack> =E5=86=99=E9=81=93=EF=BC=9A

Does linux enable CONFIG_VIRTUALIZATION? What about KVM?

On Wednesday, September 6, 2023 at 11:18:25=E2=80=AFAM UTC+8 Zhan Zheng wro=
te:

i tracked the codes, and found out the 'hypervisor/arch/arm64/entry.S: hvc=
=20
#0' turn the machine reboot, can anyone point out the reason for me?
thanks

=E5=9C=A82023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8=
 08:44:46<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A


%% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/rk3568.cell=20
Reading configuration set:
  Architecture:  arm64
  Root cell:     RK3568=20
(/home/zyz/works/jailhouse/configs/arm64/rk3568.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing PCI MMCONFIG interceptions: None
Missing resource interceptions for architecture arm64: None
=E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8=
 18:26:26<Ralf Ramsauer> =E5=86=99=E9=81=93=EF=BC=9A

Hi,=20

What does jailhouse config-check report on your system configuration?=20

Ralf=20

On 05/09/2023 10:52, Zhan Zheng wrote:=20
> dmesg in `screen-exchange`=20
>=20
> =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 16:00:57<Zhan Zheng> =E5=86=99=E9=81=93=EF=BC=9A=20
>=20
> hello, everyone. I'm porting jailhouse to rk3568 which running open=20
> harmony.=20
> jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wrote a=20
> basic root cell to test it.=20
> but when i `jailhouse enable rk3568.cell`, the system reboot. can=20
> someone help me pls?=20
> thanks=20
>=20
> --=20
> You received this message because you are subscribed to the Google=20
> Groups "Jailhouse" group.=20
> To unsubscribe from this group and stop receiving emails from it, send=20
> an email to jailhouse-de...@googlegroups.com=20
> <mailto:jailhouse-de...@googlegroups.com>.=20
> To view this discussion on the web visit=20
>=20
https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca=
0cc93fcb2n%40googlegroups.com=20
<
https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca=
0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&utm_source=3Dfooter>.=20


--=20
Mit freundlichen Gr=C3=BC=C3=9Fen=20

Dr. Ralf Ramsauer=20
Labor f=C3=BCr Digitalisierung=20
Fakult=C3=A4t f=C3=BCr Informatik und Mathematik=20

Ostbayerische Technische Hochschule Regensburg=20
Galgenbergstrasse 32=20
93053 Regensburg=20

Tel.: +49 (0)941 943-9267=20
E-Mail: ralf.r...@oth-regensburg.de=20
http://www.oth-regensburg.de=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f683a15c-de4c-476f-a535-00998d1034f8n%40googlegroups.com.

------=_Part_54671_1135392155.1693980053552
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br />I tried to enable CONFIG_VIRTUALIZATION &amp; CONFIG_KVM. dmesg (the =
attachment below) shows KVM inited successfully, but `jailhouse enable rk35=
68.cell` still rebooting system=C2=A0<br /><div><div dir=3D"auto">=E5=9C=A8=
2023=E5=B9=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 11:41:11=
&lt;bot crack&gt; =E5=86=99=E9=81=93=EF=BC=9A<br /></div><blockquote style=
=3D"margin: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">Does linux enable CONFIG_VIRTUALIZATION? What about KVM?=
<br /><br /><div><div dir=3D"auto">On Wednesday, September 6, 2023 at 11:18=
:25=E2=80=AFAM UTC+8 Zhan Zheng wrote:<br /></div><blockquote style=3D"marg=
in: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-l=
eft: 1ex;">i tracked the codes, and found out the 'hypervisor/arch/arm64/en=
try.S: hvc #0' turn the machine reboot, can anyone point out the reason for=
 me?<div>thanks<br /><br /></div><div><div dir=3D"auto">=E5=9C=A82023=E5=B9=
=B49=E6=9C=886=E6=97=A5=E6=98=9F=E6=9C=9F=E4=B8=89 UTC+8 08:44:46&lt;Zhan Z=
heng&gt; =E5=86=99=E9=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin=
: 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-lef=
t: 1ex;"><br />%% ./jailhouse-config-check ~/works/jailhouse/configs/arm64/=
rk3568.cell <br />Reading configuration set:<br />=C2=A0 Architecture: =C2=
=A0arm64<br />=C2=A0 Root cell: =C2=A0 =C2=A0 RK3568 (/home/zyz/works/jailh=
ouse/configs/arm64/rk3568.cell)<br />Overlapping memory regions inside cell=
: None<br />Overlapping memory regions with hypervisor: None<br />Missing P=
CI MMCONFIG interceptions: None<br />Missing resource interceptions for arc=
hitecture arm64: None<br /><div><div dir=3D"auto">=E5=9C=A82023=E5=B9=B49=
=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC+8 18:26:26&lt;Ralf Ramsa=
uer&gt; =E5=86=99=E9=81=93=EF=BC=9A<br /></div><blockquote style=3D"margin:=
 0px 0px 0px 0.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left=
: 1ex;">Hi,
<br />
<br />What does jailhouse config-check report on your system configuration?
<br />
<br />   Ralf
<br />
<br />On 05/09/2023 10:52, Zhan Zheng wrote:
<br />&gt; dmesg in `screen-exchange`
<br />&gt;=20
<br />&gt; =E5=9C=A82023=E5=B9=B49=E6=9C=885=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=BA=8C UTC+8 16:00:57&lt;Zhan Zheng&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br />&gt;=20
<br />&gt;     hello, everyone. I'm porting jailhouse to rk3568 which runni=
ng open
<br />&gt;     harmony.
<br />&gt;     jailhouse.ko, jailhouse.bin, jailhouse were ready, and i wro=
te a
<br />&gt;     basic root cell to test it.
<br />&gt;     but when i `jailhouse enable rk3568.cell`, the system reboot=
. can
<br />&gt;     someone help me pls?
<br />&gt;     thanks
<br />&gt;=20
<br />&gt; --=20
<br />&gt; You received this message because you are subscribed to the Goog=
le=20
<br />&gt; Groups "Jailhouse" group.
<br />&gt; To unsubscribe from this group and stop receiving emails from it=
, send=20
<br />&gt; an email to <a rel=3D"nofollow">jailhouse-de...@googlegroups.com=
</a>=20
<br />&gt; &lt;mailto:<a rel=3D"nofollow">jailhouse-de...@googlegroups.com<=
/a>&gt;.
<br />&gt; To view this discussion on the web visit=20
<br />&gt; <a href=3D"https://groups.google.com/d/msgid/jailhouse-dev/a5a71=
47d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com" rel=3D"nofollow" targe=
t=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-=
4000-87f5-6ca0cc93fcb2n%40googlegroups.com</a> &lt;<a href=3D"https://group=
s.google.com/d/msgid/jailhouse-dev/a5a7147d-750d-4000-87f5-6ca0cc93fcb2n%40=
googlegroups.com?utm_medium=3Demail&amp;utm_source=3Dfooter" rel=3D"nofollo=
w" target=3D"_blank">https://groups.google.com/d/msgid/jailhouse-dev/a5a714=
7d-750d-4000-87f5-6ca0cc93fcb2n%40googlegroups.com?utm_medium=3Demail&amp;u=
tm_source=3Dfooter</a>&gt;.
<br />
<br />--=20
<br />Mit freundlichen Gr=C3=BC=C3=9Fen
<br />
<br />Dr. Ralf Ramsauer
<br />Labor f=C3=BCr Digitalisierung
<br />Fakult=C3=A4t f=C3=BCr Informatik und Mathematik
<br />
<br />Ostbayerische Technische Hochschule Regensburg
<br />Galgenbergstrasse 32
<br />93053 Regensburg
<br />
<br />Tel.: <a value=3D"+499419439267" rel=3D"nofollow" target=3D"_blank">+=
49 (0)941 943-9267</a>
<br />E-Mail: <a rel=3D"nofollow">ralf.r...@oth-regensburg.de</a>
<br /><a href=3D"http://www.oth-regensburg.de" rel=3D"nofollow" target=3D"_=
blank">http://www.oth-regensburg.de</a>
<br /></blockquote></div></blockquote></div></blockquote></div></blockquote=
></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f683a15c-de4c-476f-a535-00998d1034f8n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f683a15c-de4c-476f-a535-00998d1034f8n%40googlegroups.co=
m</a>.<br />

------=_Part_54671_1135392155.1693980053552--

------=_Part_54670_246375617.1693980053552
Content-Type: application/octet-stream; name=screen-exchange
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=screen-exchange
X-Attachment-Id: 550c3b6e-d894-4a93-82f5-f919d804d8c5
Content-ID: <550c3b6e-d894-4a93-82f5-f919d804d8c5>

[    0.000000] Zone ranges:
[    0.000000]   DMA      [mem 0x0000000000200000-0x00000000791fffff]
[    0.000000]   DMA32    empty
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000000200000-0x00000000083fffff]
[    0.000000]   node   0: [mem 0x0000000009400000-0x00000000791fffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000000200000-0x00000000791fffff]
[    0.000000] On node 0, zone DMA: 512 pages in unavailable ranges
[    0.000000] cma: Reserved 16 MiB at 0x0000000075000000
[    0.000000] psci: probing for conduit method from DT.
[    0.000000] psci: PSCIv1.1 detected in firmware.
[    0.000000] psci: Using standard PSCI v0.2 function IDs
[    0.000000] psci: Trusted OS migration not required
[    0.000000] psci: SMC Calling Convention v1.2
[    0.000000] percpu: Embedded 31 pages/cpu s87976 r8192 d30808 u126976
[    0.000000] Detected VIPT I-cache on CPU0
[    0.000000] CPU features: detected: GIC system register CPU interface
[    0.000000] CPU features: detected: Virtualization Host Extensions
[    0.000000] CPU features: detected: ARM errata 1165522, 1319367, or 1530923
[    0.000000] alternatives: patching kernel code
[    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 483776
[    0.000000] Kernel command line: earlycon=uart8250,mmio32,0xfe660000 root=PARTUUID=614e0000-0000 rw rootwait rootfstype=ext4 mem=0x78000000 console=ttyFIQ0 hardware=rk3568 default_boot_device=fe310000.sdhci bootslots=2 ohos.required_mount.system=/dev/block/platform/fe310000.sdhci/by-name/system@/usr@ext4@ro,barrier=1@wait,required ohos.required_mount.vendor=/dev/block/platform/fe310000.sdhci/by-name/vendor@/vendor@ext4@ro,barrier=1@wait,required ohos.required_mount.misc=/dev/block/platform/fe310000.sdhci/by-name/misc@none@none@none@wait,required
[    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
[    0.000000] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.000000] Memory: 1874800K/1966080K available (18174K kernel code, 3364K rwdata, 5776K rodata, 1664K init, 913K bss, 74896K reserved, 16384K cma-reserved)
[    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.000000] ftrace: allocating 60259 entries in 236 pages
[    0.000000] ftrace: allocated 236 pages with 5 groups
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu:     RCU event tracing is enabled.
[    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=4.
[    0.000000]  Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] GICv3: GIC: Using split EOI/Deactivate mode
[    0.000000] GICv3: 320 SPIs implemented
[    0.000000] GICv3: 0 Extended SPIs implemented
[    0.000000] GICv3: Distributor has no Range Selector support
[    0.000000] GICv3: 16 PPIs implemented
[    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x00000000fd460000
[    0.000000] ITS [mem 0xfd440000-0xfd45ffff]
[    0.000000] ITS@0x00000000fd440000: allocated 8192 Devices @3e0000 (indirect, esz 8, psz 64K, shr 0)
[    0.000000] ITS@0x00000000fd440000: allocated 32768 Interrupt Collections @3f0000 (flat, esz 2, psz 64K, shr 0)
[    0.000000] ITS: using cache flushing for cmd queue
[    0.000000] GICv3: using LPI property table @0x0000000002800000
[    0.000000] GIC: using cache flushing for LPI property table
[    0.000000] GICv3: CPU0: using allocated LPI pending table @0x0000000002810000
[    0.000000] random: get_random_bytes called from start_kernel+0x228/0x4ec with crng_init=0
[    0.000000] arch_timer: cp15 timer(s) running at 24.00MHz (phys).
[    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x588fe9dc0, max_idle_ns: 440795202592 ns
[    0.000003] sched_clock: 56 bits at 24MHz, resolution 41ns, wraps every 4398046511097ns
[    0.001609] Console: colour dummy device 80x25
[    0.002048] Calibrating delay loop (skipped), value calculated using timer frequency.. 48.00 BogoMIPS (lpj=80000)
[    0.002995] pid_max: default: 32768 minimum: 301
[    0.003509] LSM: Security Framework initializing
[    0.003965] SELinux:  Initializing.
[    0.004383] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.005095] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
[    0.007522] rcu: Hierarchical SRCU implementation.
[    0.008724] Platform MSI: interrupt-controller@fd440000 domain created
[    0.009672] PCI/MSI: /interrupt-controller@fd400000/interrupt-controller@fd440000 domain created
[    0.011072] smp: Bringing up secondary CPUs ...
I/TC: Secondary CPU 1 initializing
I/TC: Secondary CPU 1 switching to normal world boot
I/TC: Secondary CPU 2 initializing
I/TC: Secondary CPU 2 switching to normal world boot
I/TC: Secondary CPU 3 initializing
I/TC: Secondary CPU 3 switching to normal world boot
[    0.012847] Detected VIPT I-cache on CPU1
[    0.012878] GICv3: CPU1: found redistributor 100 region 0:0x00000000fd480000
[    0.012896] GICv3: CPU1: using allocated LPI pending table @0x0000000002820000
[    0.012946] CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
[    0.014369] Detected VIPT I-cache on CPU2
[    0.014393] GICv3: CPU2: found redistributor 200 region 0:0x00000000fd4a0000
[    0.014408] GICv3: CPU2: using allocated LPI pending table @0x0000000002830000
[    0.014448] CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
[    0.015824] Detected VIPT I-cache on CPU3
[    0.015847] GICv3: CPU3: found redistributor 300 region 0:0x00000000fd4c0000
[    0.015862] GICv3: CPU3: using allocated LPI pending table @0x0000000002840000
[    0.015899] CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
[    0.016039] smp: Brought up 1 node, 4 CPUs
[    0.023238] SMP: Total of 4 processors activated.
[    0.023671] CPU features: detected: Privileged Access Never
[    0.024182] CPU features: detected: User Access Override
[    0.024669] CPU features: detected: 32-bit EL0 Support
[    0.025140] CPU features: detected: Common not Private translations
[    0.025737] CPU features: detected: RAS Extension Support
[    0.026234] CPU features: detected: Data cache clean to the PoU not required for I/D coherence
[    0.027022] CPU features: detected: CRC32 instructions
[    0.027493] CPU features: detected: Speculative Store Bypassing Safe (SSBS)
[    0.028131] CPU features: detected: 32-bit EL1 Support
[    0.028683] CPU: All CPU(s) started at EL2
[    0.030609] devtmpfs: initialized
[    0.046698] Registered cp15_barrier emulation handler
[    0.047182] Registered setend emulation handler
[    0.047605] KASLR disabled due to lack of seed
[    0.048262] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 6370867519511994 ns
[    0.049187] futex hash table entries: 1024 (order: 4, 65536 bytes, linear)
[    0.050437] pinctrl core: initialized pinctrl subsystem
[    0.051763] bbox:[info][blackbox_core.c:262] wait for log part [/data] begin!
[    0.052022] NET: Registered protocol family 16
[    0.054654] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
[    0.055446] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.056326] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.057137] audit: initializing netlink subsys (disabled)
[    0.057827] audit: type=2000 audit(0.056:1): state=initialized audit_enabled=0 res=1
[    0.059698] thermal_sys: Registered thermal governor 'fair_share'
[    0.059704] thermal_sys: Registered thermal governor 'step_wise'
[    0.060624] cpuidle: using governor menu
[    0.061557] Registered FIQ tty driver
[    0.061923] bbox:[info][blackbox_core.c:514] [SYSTEM] is registered successfully!
[    0.063292] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
[    0.064074] ASID allocator initialised with 65536 entries
[    0.077575] printk: console [ramoops-1] enabled
[    0.077998] pstore: Registered ramoops as persistent store backend
[    0.078567] ramoops: using 0xf0000@0x110000, ecc: 0
[    0.124894] rockchip-gpio fdd60000.gpio0: probed gpio0 (fdd60000.gpio0)
[    0.128162] rockchip-gpio fe740000.gpio1: probed gpio1 (fe740000.gpio1)
[    0.131590] rockchip-gpio fe750000.gpio2: probed gpio2 (fe750000.gpio2)
[    0.134353] rockchip-gpio fe760000.gpio3: probed gpio3 (fe760000.gpio3)
[    0.136687] rockchip-gpio fe770000.gpio4: probed gpio4 (fe770000.gpio4)
[    0.137384] rockchip-pinctrl pinctrl: probed pinctrl
[    0.150749] cryptd: max_cpu_qlen set to 1000
[    0.155568] fiq_debugger fiq_debugger.0: IRQ fiq not found
[    0.156104] fiq_debugger fiq_debugger.0: IRQ wakeup not found
[[    0.156734] printk: console [ttyFIQ0] enabled
    0.156734] printk: console [ttyFIQ0] enabled
[    0.157528] printk: bootconsole [uart8250] disabled
[    0.157528] printk: bootconsole [uart8250] disabled
[    0.158194] Registered fiq debugger ttyFIQ0
[    0.159450] vcc3v3_sys: supplied by dc_12v
[    0.159937] vcc5v0_sys: supplied by dc_12v
[    0.161945] vcc2v5-sys: supplied by vcc3v3_sys
[    0.162331] pcie30_avdd0v9: supplied by vcc3v3_sys
[    0.162719] pcie30_avdd1v8: supplied by vcc3v3_sys
[    0.163095] vcc3v3_bu: supplied by vcc5v0_sys
[    0.164885] iommu: Default domain type: Translated
[    0.165183] rk_iommu fdea0800.iommu: version = 2
[    0.165844] rk_iommu fded0480.iommu: version = 2
[    0.166140] rk_iommu fdee0800.iommu: version = 2
[    0.166410] rk_iommu fdef0800.iommu: version = 2
[    0.166687] rk_iommu fdf40f00.iommu: version = 2
[    0.167010] rk_iommu fdf80800.iommu: version = 2
[    0.167281] rk_iommu fdff1a00.iommu: version = 2
[    0.167550] rk_iommu fe043e00.iommu: version = 2
[    0.168372] SCSI subsystem initialized
[    0.168650] usbcore: registered new interface driver usbfs
[    0.168703] usbcore: registered new interface driver hub
[    0.168746] usbcore: registered new device driver usb
[    0.168804] mc: Linux media interface: v0.10
[    0.168837] videodev: Linux video capture interface: v2.00
[    0.168917] pps_core: LinuxPPS API ver. 1 registered
[    0.168927] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.168946] PTP clock support registered
[    0.169656] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
[    0.169715] arm-scmi firmware:scmi: SCMI Protocol v2.0 'rockchip:' Firmware version 0x0
[    0.171882] Bluetooth: Core ver 2.22
[    0.171935] NET: Registered protocol family 31
[    0.171944] Bluetooth: HCI device and connection manager initialized
[    0.171958] Bluetooth: HCI socket layer initialized
[    0.171969] Bluetooth: L2CAP socket layer initialized
[    0.172043] Bluetooth: SCO socket layer initialized
[    0.172515] rockchip-cpuinfo cpuinfo: failed to get id cell: -517
[    0.173562] clocksource: Switched to clocksource arch_sys_counter
[    0.557108] VFS: Disk quotas dquot_6.6.0
[    0.557203] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.566282] NET: Registered protocol family 2
[    0.566471] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
[    0.568008] tcp_listen_portaddr_hash hash table entries: 1024 (order: 3, 40960 bytes, linear)
[    0.568113] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
[    0.568315] TCP bind hash table entries: 16384 (order: 7, 524288 bytes, linear)
[    0.568675] TCP: Hash tables configured (established 16384 bind 16384)
[    0.568947] UDP hash table entries: 1024 (order: 4, 98304 bytes, linear)
[    0.569069] UDP-Lite hash table entries: 1024 (order: 4, 98304 bytes, linear)
[    0.569289] NET: Registered protocol family 1
[    0.569948] RPC: Registered named UNIX socket transport module.
[    0.569962] RPC: Registered udp transport module.
[    0.569968] RPC: Registered tcp transport module.
[    0.569974] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    0.570954] PCI: CLS 0 bytes, default 64
[    0.571644] Trying to unpack rootfs image as initramfs...
[    0.651727] Freeing initrd memory: 4096K
[    0.652871] hw perfevents: enabled with armv8_cortex_a55 PMU driver, 7 counters available
[    0.653711] kvm [1]: IPA Size Limit: 40 bits
[    0.653745] kvm [1]: GICv3: no GICV resource entry
[    0.653754] kvm [1]: disabling GICv2 emulation
[    0.653761] kvm [1]: GIC system register CPU interface enabled
[    0.653908] kvm [1]: vgic interrupt IRQ9
[    0.654099] kvm [1]: VHE mode initialized successfully
------=_Part_54670_246375617.1693980053552--
