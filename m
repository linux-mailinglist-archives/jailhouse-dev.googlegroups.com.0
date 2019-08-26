Return-Path: <jailhouse-dev+bncBCR7PPMN34DRBQUWSDVQKGQECNRVNVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x340.google.com (mail-ot1-x340.google.com [IPv6:2607:f8b0:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id B820C9D42B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 18:39:31 +0200 (CEST)
Received: by mail-ot1-x340.google.com with SMTP id k70sf10410884otk.6
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 09:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Te9n5T6QNQt8PN65NsX6NRk98JpuhtoWx6Uu1H2hVbY=;
        b=py5gsJj/Gik4peY5ckighJooxTIyxHrOu90BS1ZMFbG66tQWYvZ7oKxmJyu+pRN6GZ
         yefZDSYMDx1U0KZb1kVPztPwYokGsZd7TwV0q792+GLmtTDO95NUPv6BiLD1oh6ufO/o
         6KEkseGRHZU+WfY/g7aYNlvYRSs3bO6KMPdS8iYkjQODQpYno+gjEuur1cxRYGGmFIes
         QutDUUG/a0LKEW0T4kp5Xsbdmx+a2oQGIjfOnp/8axaTMnVIt1Oq/qY1LHglCWupQEhe
         YepIcV2usT71HYXanLNxY9NF5Btg3wv0zesdVRwDLLSxPT5AZZCXq2bhYRKOWfiWC8Nc
         BQrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Te9n5T6QNQt8PN65NsX6NRk98JpuhtoWx6Uu1H2hVbY=;
        b=U1ION7Dp1NiL7lfxLNfqaMEzOQXSMcYgMiYu/A3ALQxunTJ7MTHp9cWhaYiFfb2b/l
         O6kqnyNEc+pMi/Dr5r/ElIvDREfjHnFR1YWOJ450y9UiBenPsLDgrMGglOtl8fO4D2pW
         Z1gjW2qKBIomh43HX1oVFwg5D6S3cq9Aw1Kj7ODl6hHYNFYJEsLkPRyUmKy1mDiX1tcp
         go7IJW/3GsG/xDXv8m3ruOFwFjDudF78TEUNvA1w6ASg9mjlDs7bXq4eGUyk2r3XNxhw
         bzYrUvCYzLO66vQjz8W38/P25w2ICVfl6enOaZ6HDemO33G835NrT+2Wn2DVwVabPCCw
         bRwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Te9n5T6QNQt8PN65NsX6NRk98JpuhtoWx6Uu1H2hVbY=;
        b=BDf6qpnmXGT/heU8FXLXLEWXUt8ctcr1PsLYNa9kR4vEugXNDx8uA2Vjlj2lc1FH5o
         T22j54blo7dqNtLYBy+3lIlTKugm1e9cur1uzPD3cNUJzV47xTHDZ4sL2GWBg4CIhPJM
         pphyXHwMIGrbHBYP/sh0Lyy1ugst8uyWAgottVjnMBK836AGm4ynqKmGuaoLcYOa/VYE
         opLqyMYooHCMUIbHEScgD5vieuo8cxdlAhFjLSXheW/L3QIm8xn8i82DgF9tUCxVZVzu
         mwNqtdQ01aGgNbiRG53hx4D4Q65PIEGvafw1FVHob1ME99Qf88On8FjcSWZyGnXI9AKx
         VdKg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVMIgsWyuDBk5gFdKE/Dnovw0F6bBARc30f1zjoQpugrBpeIlI0
	Z6EXmKaGfl2io8YjwSS5Kx0=
X-Google-Smtp-Source: APXvYqywcQMfIyNS+0LeLnNHRq9HsB5s2qJitObwSxLONrWotq+gf5d8di5CCCZsJguXJpHi/dhDrg==
X-Received: by 2002:a9d:63c7:: with SMTP id e7mr16491774otl.165.1566837570467;
        Mon, 26 Aug 2019 09:39:30 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1e97:: with SMTP id n23ls406884otr.5.gmail; Mon, 26
 Aug 2019 09:39:30 -0700 (PDT)
X-Received: by 2002:a05:6830:1188:: with SMTP id u8mr9211687otq.150.1566837569948;
        Mon, 26 Aug 2019 09:39:29 -0700 (PDT)
Date: Mon, 26 Aug 2019 09:39:29 -0700 (PDT)
From: =?UTF-8?Q?Jo=C3=A3o_Reis?= <jpagsreis@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <71ab42b5-b8c9-4392-9575-759f6eb899a0@googlegroups.com>
In-Reply-To: <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
References: <885a6592-84d9-43f4-a037-10ce73f968ab@googlegroups.com>
 <43d8fdde-153f-40ec-8974-4388efab8315@googlegroups.com>
 <c30da773-76bd-3691-3828-e8f7ed592d52@siemens.com>
 <12a82b12-b9bd-4258-87fb-9525f4bb648a@googlegroups.com>
 <5fe86ed7-e82f-3fef-6eef-a888e4ef6be7@siemens.com>
 <1ebfd29b-3c2d-490d-bd2d-c7cbdad1507c@googlegroups.com>
 <164159e0-478e-c5e9-fc8a-e0c0cb27da7a@siemens.com>
 <f1de42fc-bae2-4962-ace6-a38e99a441d4@googlegroups.com>
 <dd33650a-c068-52ca-4da7-4537de652bfa@siemens.com>
 <82a56f53-a498-4a27-8458-250d9a7e7078@googlegroups.com>
 <211c06d2-9f92-cbd1-8215-12c577eefa62@siemens.com>
 <2add490d-0d13-44f6-9873-d7fcbf1c4141@googlegroups.com>
 <2dc2470b-9494-4f43-a582-06c2558fa985@googlegroups.com>
 <df7be3b4-a447-0ff1-f43b-ee37bf6513bb@web.de>
 <c183c116-5942-4d08-a0a7-a897e8fbed20@googlegroups.com>
 <6dfd2128-011a-420f-860f-4ccb472c079f@googlegroups.com>
 <67cdfa4b-86e9-496a-3878-b5a0016b75c0@siemens.com>
 <521c355a-eacc-434e-b50d-dd7c797be08a@googlegroups.com>
 <4fe67562-ffb1-a306-542e-c27b0450bca1@web.de>
Subject: Re: Colored Linux as inmate
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1883_526429622.1566837569310"
X-Original-Sender: jpagsreis@gmail.com
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

------=_Part_1883_526429622.1566837569310
Content-Type: multipart/alternative; 
	boundary="----=_Part_1884_1670630965.1566837569310"

------=_Part_1884_1670630965.1566837569310
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, that worked!
But when i connect to non-root cell using ssh, i issue commands like "cat=
=20
/proc/iomem", and it still displays the contents if i was still in root=20
cell. Is it normal?

segunda-feira, 26 de Agosto de 2019 =C3=A0s 07:02:08 UTC+1, Jan Kiszka escr=
eveu:
>
> On 26.08.19 04:39, Jo=C3=A3o Reis wrote:=20
> > After adding the driver and starting the non-root Linux, i can see in=
=20
> console=20
> > the link between root and non-root being established.=20
> > "Adding virtual PCI device 00:01.0 to cell "linux-non-root=20
> >    Shared memory connection established: "linux-non-root" <--> "root"".=
=20
> >=20
> > I can see the interrupt of ivshmem-net in /proc/interrupts and when i=
=20
> issue=20
> > "lspci" i can see the pci device listed with ivshmem-net driver attache=
d=20
> to it.=20
> > But, when i issue "ifconfig" i don't find any interface besides loopbac=
k=20
> and my=20
> > pc's interface, supposedly i would have to see linux non-root interface=
.=20
> Is=20
> > there something missing (some driver maybe)?=20
> >=20
>
> ifconfig <ethX> up? If the driver is attached, the interface must exist.=
=20
> ifconfig -a will tell you the name.=20
>
> Jan=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/71ab42b5-b8c9-4392-9575-759f6eb899a0%40googlegroups.com.

------=_Part_1884_1670630965.1566837569310
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you, that worked!<div>But when i connect to non-root=
 cell using ssh, i issue commands like &quot;cat /proc/iomem&quot;, and it =
still displays the contents if i was still in root cell. Is it normal?<br><=
br>segunda-feira, 26 de Agosto de 2019 =C3=A0s 07:02:08 UTC+1, Jan Kiszka e=
screveu:<blockquote class=3D"gmail_quote" style=3D"margin: 0;margin-left: 0=
.8ex;border-left: 1px #ccc solid;padding-left: 1ex;">On 26.08.19 04:39, Jo=
=C3=A3o Reis wrote:
<br>&gt; After adding the driver and starting the non-root Linux, i can see=
 in console
<br>&gt; the link between root and non-root being established.
<br>&gt; &quot;Adding virtual PCI device 00:01.0 to cell &quot;linux-non-ro=
ot
<br>&gt; =C2=A0=C2=A0 Shared memory connection established: &quot;linux-non=
-root&quot; &lt;--&gt; &quot;root&quot;&quot;.
<br>&gt;
<br>&gt; I can see the interrupt of ivshmem-net in /proc/interrupts and whe=
n i issue
<br>&gt; &quot;lspci&quot; i can see the pci device listed with ivshmem-net=
 driver attached to it.
<br>&gt; But, when i issue &quot;ifconfig&quot; i don&#39;t find any interf=
ace besides loopback and my
<br>&gt; pc&#39;s interface, supposedly i would have to see linux non-root =
interface. Is
<br>&gt; there something missing (some driver maybe)?
<br>&gt;
<br>
<br>ifconfig &lt;ethX&gt; up? If the driver is attached, the interface must=
 exist.
<br>ifconfig -a will tell you the name.
<br>
<br>Jan
<br></blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/71ab42b5-b8c9-4392-9575-759f6eb899a0%40googlegroup=
s.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/m=
sgid/jailhouse-dev/71ab42b5-b8c9-4392-9575-759f6eb899a0%40googlegroups.com<=
/a>.<br />

------=_Part_1884_1670630965.1566837569310--

------=_Part_1883_526429622.1566837569310--
