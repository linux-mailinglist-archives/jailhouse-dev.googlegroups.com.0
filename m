Return-Path: <jailhouse-dev+bncBCJ2NIVKYUNBB6W42P6QKGQEFCKSNUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83c.google.com (mail-qt1-x83c.google.com [IPv6:2607:f8b0:4864:20::83c])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B52B7A9C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 10:50:57 +0100 (CET)
Received: by mail-qt1-x83c.google.com with SMTP id w88sf1017801qtd.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 18 Nov 2020 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y568R7iR8et0ExsbWxGoLtfbhuBVg5KZHgtUmkKRSnM=;
        b=SvzD3iyj5WE92GFTJJASxktqWj5oLq8T+fP6bl78xoqc56e16v/yEOax1JiA4DeWMZ
         Mz/bnPoVcPHzaQ4oJcjM/3XdabMfb7N3hvytMv8t7P2vHV8vFjabnnaw+70p+MonXbxI
         OgcDSVct8+ah4iOsAKHepffCSr4OoUGCKciWb3ZbVXiRsVhrW9MjEhRWFYQQ3W4EmudW
         TK3YhBqk7/HtYVnU1hq7rpjN2h6Qz2x3rQAs7gMoVDxnJvVxqPsDEl+qzq9xOR1twrLi
         iecDlL/i2uUYC4JHex6QZX9H1wqNq+zdurZLpbW9qlyl+wJ8v7Dgi6a2raK59TMh1JQ2
         yMEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=y568R7iR8et0ExsbWxGoLtfbhuBVg5KZHgtUmkKRSnM=;
        b=Ha3l4FtvMGFO5BrLSRaS88lsJIMMfw5jJKJa+KA0TQ20Qu23ufxbt8BNWFibfjKQpo
         6p4DfZzNWPDDPUbJnkXW50jaBGm0XyZy7ZekMKwx2F2tongRY1t9yZyozQPPsREcaSVe
         06Suq/2eEGQuYyeWvXwykw4l1GUPxOaW5HXE4m6Q3cnRQXMYzziBJ9yjCIuT3odD8kcn
         FjIO3GRMVVUQTByHuPsWn+gKQHiyzMXfXiFOPqrIYBAAVpuongIzjbW8Pps60Zcswcng
         m5eLnranoPx2EzdQJiqV9HQ3HI7oBP4ARG/+f5JIlqjhtyh8NzkgQhMWWYUh8toIjw+P
         15BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=y568R7iR8et0ExsbWxGoLtfbhuBVg5KZHgtUmkKRSnM=;
        b=oGRxJ7TqCi/2V0oqqXY8SPLxSrRkDn72Agrc6hYeT0rIO4o21iCueEMPe8SZpGjK//
         4fa/1Ch7EQdnTGWaL96GLQvZj10NlUqcQOk/OOnClOfu9YEKJ3n3Ns2mElJD9rX2gmfX
         4XDqXZYk/PtlQag0IdOHM8+JqQPmMe993qjsnBwZ/8SaCcuiZBQaRsh602hFSKjOrX+5
         wBeJCe6/SMjECvkrAuEEcEjo+Zd5/qmP0ccsrPw05DKUojghqm+dh/X6/xkAz9yMf7vp
         rvIMLJqayEMExyzA5vPebEvgrVz2Dxg1WxOeXufvsYBAAC+PjIOutbWcT9KG12uxY7jZ
         5CNA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531TJrPORN32ODdmhixn+4zkN9englTUox9QBDuwkQ21hwlHf8dI
	bjJVO77DNdiDEyNr+rkH5xA=
X-Google-Smtp-Source: ABdhPJy8BvDjd+L7ndXaPspK2OW6sRwgXPDr5FPNQHxgmBBSWg64TEQQOL8X4rn+a8YUq9zkXslpww==
X-Received: by 2002:a37:8b42:: with SMTP id n63mr3890096qkd.297.1605693051083;
        Wed, 18 Nov 2020 01:50:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:584e:: with SMTP id h14ls7271744qth.2.gmail; Wed, 18 Nov
 2020 01:50:50 -0800 (PST)
X-Received: by 2002:ac8:4311:: with SMTP id z17mr3183529qtm.90.1605693049987;
        Wed, 18 Nov 2020 01:50:49 -0800 (PST)
Date: Wed, 18 Nov 2020 01:50:49 -0800 (PST)
From: Peter pan <peter.panjf@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <aa38bda6-400a-4342-8b72-e033c56fd89dn@googlegroups.com>
In-Reply-To: <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
References: <e223356c-fc2c-4c3b-98c3-6d27fba1099an@googlegroups.com>
 <7552cacf-519e-9cde-ba5a-c2e2121c5a54@siemens.com>
 <650b2d0f-b721-44a4-9572-28c2a88a7559n@googlegroups.com>
Subject: Re: one question about MSI-X support for vPCI
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_518_823336997.1605693049214"
X-Original-Sender: peter.panjf@gmail.com
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

------=_Part_518_823336997.1605693049214
Content-Type: multipart/alternative; 
	boundary="----=_Part_519_2116881440.1605693049214"

------=_Part_519_2116881440.1605693049214
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,

I have one new issue and not sure it is a know issue.

The issue is: when I ifconfig up ivshmem-net NIC in root cell firstly and=
=20
then ifconfig up ivshmem NIC in inmate cell (runing Linux),  I can ping=20
through between two NICs, but if I ifconfig up NIC in inmate cell before=20
ifconfig up the NIC in root cell, I can't ping through between two NICs,=20
and I found NIC in inmate can only receive packet sending from root cell=20
NIC, but NIC in root cell can't receive any packet and there is also no irq=
=20
received for ivshmem NIC.

Thanks.

Best Regards,
Jiafei.

=E5=9C=A82020=E5=B9=B411=E6=9C=8813=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 =E4=B8=8B=E5=8D=885:55:52<Peter pan> =E5=86=99=E9=81=93=EF=BC=9A

> Thanks Jan, now it works with INTx.
>
> Jiafei.
>
> =E5=9C=A82020=E5=B9=B411=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B U=
TC+8 =E4=B8=8B=E5=8D=889:05:15<j.kiszka...@gmail.com> =E5=86=99=E9=81=93=EF=
=BC=9A
>
>> On 12.11.20 09:50, Peter pan wrote:=20
>> > Dear Jailhouse Community,=20
>> >=20
>> > I am runing Jailhouse on kernel v5.4, and port some ivshmem patches=20
>> > from http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary=20
>> > <http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary>=20
>> >=20
>> > The issue I have is uio_shmem and ivshmem-net will probe failed when I=
=20
>> > use MSI-X mode for vPCI after I run Jailhouse enable command.  Please=
=20
>> > find the folowing log:=20
>> >=20
>> > [   21.581019] jailhouse: loading out-of-tree module taints kernel.=20
>> >=20
>> > [   30.000988] pci-host-generic fb500000.pci: host bridge /pci@0=20
>> ranges:=20
>> >=20
>> > [   30.000997] pci-host-generic fb500000.pci:   MEM=20
>> > 0xfb600000..0xfb603fff -> 0xfb600000=20
>> >=20
>> > [   30.001028] pci-host-generic fb500000.pci: ECAM at [mem=20
>> > 0xfb500000-0xfb5fffff] for [bus 00]=20
>> >=20
>> > [   30.001081] pci-host-generic fb500000.pci: PCI host bridge to bus=
=20
>> 0003:00=20
>> >=20
>> > [   30.001085] pci_bus 0003:00: root bus resource [bus 00]=20
>> >=20
>> > [   30.001087] pci_bus 0003:00: root bus resource [mem=20
>> > 0xfb600000-0xfb603fff]=20
>> >=20
>> > [   30.001105] pci 0003:00:00.0: [110a:4106] type 00 class 0xff0000=20
>> >=20
>> > [   30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x00000000-0x00000fff]=
=20
>> >=20
>> > [   30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x00000000-0x000001ff]=
=20
>> >=20
>> > [   30.001340] pci 0003:00:01.0: [110a:4106] type 00 class 0xff0001=20
>> >=20
>> > [   30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x00000000-0x00000fff]=
=20
>> >=20
>> > [   30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x00000000-0x000001ff]=
=20
>> >=20
>> > [   30.002389] pci 0003:00:00.0: BAR 0: assigned [mem=20
>> 0xfb600000-0xfb600fff]=20
>> >=20
>> > [   30.002397] pci 0003:00:01.0: BAR 0: assigned [mem=20
>> 0xfb601000-0xfb601fff]=20
>> >=20
>> > [   30.002403] pci 0003:00:00.0: BAR 1: assigned [mem=20
>> 0xfb602000-0xfb6021ff]=20
>> >=20
>> > [   30.002409] pci 0003:00:01.0: BAR 1: assigned [mem=20
>> 0xfb602200-0xfb6023ff]=20
>> >=20
>> > [   30.002478] uio_ivshmem 0003:00:00.0: enabling device (0000 -> 0002=
)=20
>> >=20
>> > [   30.002505] uio_ivshmem 0003:00:00.0: state_table at=20
>> > 0x00000000fb700000, size 0x0000000000001000=20
>> >=20
>> > [   30.002512] uio_ivshmem 0003:00:00.0: rw_section at=20
>> > 0x00000000fb701000, size 0x0000000000009000=20
>> >=20
>> > [   30.002520] uio_ivshmem 0003:00:00.0: input_sections at=20
>> > 0x00000000fb70a000, size 0x0000000000006000=20
>> >=20
>> > [   30.002524] uio_ivshmem 0003:00:00.0: output_section at=20
>> > 0x00000000fb70a000, size 0x0000000000002000=20
>> >=20
>> > [   30.002576] uio_ivshmem: probe of 0003:00:00.0 failed with error -2=
8=20
>> >=20
>> > [   30.002620] ivshmem-net 0003:00:01.0: enabling device (0000 -> 0002=
)=20
>> >=20
>> > [   30.002664] ivshmem-net 0003:00:01.0: TX memory at=20
>> > 0x00000000fb801000, size 0x000000000007f000=20
>> >=20
>> > [   30.002667] ivshmem-net 0003:00:01.0: RX memory at=20
>> > 0x00000000fb880000, size 0x000000000007f000=20
>> >=20
>> > [   30.047630] ivshmem-net: probe of 0003:00:01.0 failed with error -2=
8=20
>> >=20
>> > [   30.047714] The Jailhouse is opening.=20
>> >=20
>> >=20
>> > After some investigation I found the dts node of vPIC is added to root=
=20
>> > cell by using vpci_template.dts,  the Jailhouse=20
>> > driver create_vpci_of_overlay() in driver/pci.c can't add the handler=
=20
>> of=20
>> > "msi-parent" to this PCI node,  but the kernel driver of the virtual=
=20
>> PCI=20
>> > device use the following function =20
>> > ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ_MSI=
X);=20
>> > So the  driver will probe MSIX irq for the device, because there is no=
=20
>> > msi controller is speficied to vPCI, the result is no irq-domain is=20
>> > provided to this PCI and irq allocated failed.=20
>> >=20
>> > so how to fix such issue? Appreciate any comments and suggestions,=20
>> thanks.=20
>>
>> The vPCI support in Jailhouse injects interrupts as legacy INTx. For=20
>> that, you need to provide up to 4 (less if you have less ivshmem=20
>> devices) consecutive SPIs that are not in use by real devices (in any=20
>> cell). See other arm64 configs, specifically look for vpci_irq_base.=20
>>
>> Jan=20
>> --=20
>> Siemens AG, T RDA IOT=20
>> Corporate Competence Center Embedded Linux=20
>>
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/aa38bda6-400a-4342-8b72-e033c56fd89dn%40googlegroups.com.

------=_Part_519_2116881440.1605693049214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Jan,<div><br></div><div>I have one new issue and not sure it is a know =
issue.</div><div><br></div><div>The issue is: when I ifconfig up ivshmem-ne=
t NIC in root cell firstly and then ifconfig up ivshmem NIC in inmate cell =
(runing Linux),&nbsp; I can ping through between two NICs, but if I ifconfi=
g up NIC in inmate cell before ifconfig up the NIC in root cell, I can't pi=
ng through between two NICs, and I found NIC in inmate can only receive pac=
ket sending from root cell NIC, but NIC in root cell can't receive any pack=
et and there is also no irq received for ivshmem NIC.</div><div><br></div><=
div>Thanks.</div><div><br></div><div>Best Regards,</div><div>Jiafei.<br><br=
></div><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">=
=E5=9C=A82020=E5=B9=B411=E6=9C=8813=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=94 UTC=
+8 =E4=B8=8B=E5=8D=885:55:52&lt;Peter pan> =E5=86=99=E9=81=93=EF=BC=9A<br/>=
</div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; borde=
r-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">Thanks Jan, now i=
t works with INTx.<div><br></div><div>Jiafei.<br><br></div><div class=3D"gm=
ail_quote"><div dir=3D"auto" class=3D"gmail_attr">=E5=9C=A82020=E5=B9=B411=
=E6=9C=8812=E6=97=A5=E6=98=9F=E6=9C=9F=E5=9B=9B UTC+8 =E4=B8=8B=E5=8D=889:0=
5:15&lt;<a href data-email-masked rel=3D"nofollow">j.kiszka...@gmail.com</a=
>&gt; =E5=86=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">On 12.11.20 09:50, Peter pan wrote:
<br>&gt; Dear Jailhouse Community,
<br>&gt;=20
<br>&gt; I am runing Jailhouse on kernel v5.4, and port some ivshmem patche=
s
<br>&gt; from=C2=A0<a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dsumm=
ary" rel=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www=
.google.com/url?hl=3Dzh-CN&amp;q=3Dhttp://git.kiszka.org/?p%3Dlinux.git;a%3=
Dsummary&amp;source=3Dgmail&amp;ust=3D1605592257161000&amp;usg=3DAFQjCNFtVE=
m8RzkfdnpxjpL-eylmD7pkGQ">http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary<=
/a>
<br>&gt; &lt;<a href=3D"http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary" r=
el=3D"nofollow" target=3D"_blank" data-saferedirecturl=3D"https://www.googl=
e.com/url?hl=3Dzh-CN&amp;q=3Dhttp://git.kiszka.org/?p%3Dlinux.git;a%3Dsumma=
ry&amp;source=3Dgmail&amp;ust=3D1605592257161000&amp;usg=3DAFQjCNFtVEm8Rzkf=
dnpxjpL-eylmD7pkGQ">http://git.kiszka.org/?p=3Dlinux.git;a=3Dsummary</a>&gt=
;
<br>&gt;=20
<br>&gt; The issue I have is uio_shmem and ivshmem-net will probe failed wh=
en I
<br>&gt; use MSI-X mode for vPCI after I run Jailhouse enable command.=C2=
=A0 Please
<br>&gt; find the folowing log:
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 21.581019] jailhouse: loading out-of-tree module tai=
nts kernel.
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.000988] pci-host-generic fb500000.pci: host bridg=
e /pci@0 ranges:
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.000997] pci-host-generic fb500000.pci:=C2=A0=C2=
=A0 MEM
<br>&gt; 0xfb600000..0xfb603fff -&gt; 0xfb600000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001028] pci-host-generic fb500000.pci: ECAM at [m=
em
<br>&gt; 0xfb500000-0xfb5fffff] for [bus 00]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001081] pci-host-generic fb500000.pci: PCI host b=
ridge to bus 0003:00
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001085] pci_bus 0003:00: root bus resource [bus 0=
0]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001087] pci_bus 0003:00: root bus resource [mem
<br>&gt; 0xfb600000-0xfb603fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001105] pci 0003:00:00.0: [110a:4106] type 00 cla=
ss 0xff0000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001128] pci 0003:00:00.0: reg 0x10: [mem 0x000000=
00-0x00000fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001136] pci 0003:00:00.0: reg 0x14: [mem 0x000000=
00-0x000001ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001340] pci 0003:00:01.0: [110a:4106] type 00 cla=
ss 0xff0001
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001359] pci 0003:00:01.0: reg 0x10: [mem 0x000000=
00-0x00000fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.001368] pci 0003:00:01.0: reg 0x14: [mem 0x000000=
00-0x000001ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002389] pci 0003:00:00.0: BAR 0: assigned [mem 0x=
fb600000-0xfb600fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002397] pci 0003:00:01.0: BAR 0: assigned [mem 0x=
fb601000-0xfb601fff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002403] pci 0003:00:00.0: BAR 1: assigned [mem 0x=
fb602000-0xfb6021ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002409] pci 0003:00:01.0: BAR 1: assigned [mem 0x=
fb602200-0xfb6023ff]
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002478] uio_ivshmem 0003:00:00.0: enabling device=
 (0000 -&gt; 0002)
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002505] uio_ivshmem 0003:00:00.0: state_table at
<br>&gt; 0x00000000fb700000, size 0x0000000000001000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002512] uio_ivshmem 0003:00:00.0: rw_section at
<br>&gt; 0x00000000fb701000, size 0x0000000000009000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002520] uio_ivshmem 0003:00:00.0: input_sections =
at
<br>&gt; 0x00000000fb70a000, size 0x0000000000006000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002524] uio_ivshmem 0003:00:00.0: output_section =
at
<br>&gt; 0x00000000fb70a000, size 0x0000000000002000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002576] uio_ivshmem: probe of 0003:00:00.0 failed=
 with error -28
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002620] ivshmem-net 0003:00:01.0: enabling device=
 (0000 -&gt; 0002)
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002664] ivshmem-net 0003:00:01.0: TX memory at
<br>&gt; 0x00000000fb801000, size 0x000000000007f000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.002667] ivshmem-net 0003:00:01.0: RX memory at
<br>&gt; 0x00000000fb880000, size 0x000000000007f000
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.047630] ivshmem-net: probe of 0003:00:01.0 failed=
 with error -28
<br>&gt;=20
<br>&gt; [=C2=A0=C2=A0 30.047714] The Jailhouse is opening.
<br>&gt;=20
<br>&gt;=20
<br>&gt; After some investigation I found the dts node of vPIC is added to =
root
<br>&gt; cell by using vpci_template.dts,=C2=A0 the Jailhouse
<br>&gt; driver=C2=A0create_vpci_of_overlay() in=C2=A0driver/pci.c can&#39;=
t add the handler of
<br>&gt; &quot;msi-parent&quot; to this PCI node,=C2=A0 but the kernel driv=
er of the virtual PCI
<br>&gt; device use the following function=C2=A0
<br>&gt; ret =3D pci_alloc_irq_vectors(pdev, 1, 2, PCI_IRQ_LEGACY | PCI_IRQ=
_MSIX);
<br>&gt; So the=C2=A0 driver will probe MSIX irq for the device, because th=
ere is no
<br>&gt; msi controller is speficied to vPCI, the result is no irq-domain i=
s
<br>&gt; provided to this PCI and irq allocated failed.
<br>&gt;=20
<br>&gt; so how to fix such issue? Appreciate any comments and suggestions,=
 thanks.
<br>
<br>The vPCI support in Jailhouse injects interrupts as legacy INTx. For
<br>that, you need to provide up to 4 (less if you have less ivshmem
<br>devices) consecutive SPIs that are not in use by real devices (in any
<br>cell). See other arm64 configs, specifically look for vpci_irq_base.
<br>
<br>Jan
<br>--=20
<br>Siemens AG, T RDA IOT
<br>Corporate Competence Center Embedded Linux
<br>
<br></blockquote></div></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/aa38bda6-400a-4342-8b72-e033c56fd89dn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/aa38bda6-400a-4342-8b72-e033c56fd89dn%40googlegroups.co=
m</a>.<br />

------=_Part_519_2116881440.1605693049214--

------=_Part_518_823336997.1605693049214--
