Return-Path: <jailhouse-dev+bncBDFMXFHWY4HBBQGZVKYAMGQEFDO367Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb38.google.com (mail-yb1-xb38.google.com [IPv6:2607:f8b0:4864:20::b38])
	by mail.lfdr.de (Postfix) with ESMTPS id 500A1893B1A
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Apr 2024 14:46:58 +0200 (CEST)
Received: by mail-yb1-xb38.google.com with SMTP id 3f1490d57ef6-dcbfe1a42a4sf7248455276.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Apr 2024 05:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1711975617; x=1712580417; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eGfNdvjomfB3NmD0qYKOz52ZwixkZ3KXKEYj31L5/0Y=;
        b=uG3+O6BM5KdFxREbrMQW0b4RYT0l9eiqNlXPAT0kX+aiVmiBgQjCzWaWC1/sDjyARh
         HCzfwhdB23w4pwPBg3y41/LEw/8EYOnDlvTRPcXB+6WgFoRgkv/DVajOA6UtV3KtP7Fq
         VsTypBpcpGlUnQzfrN9QEPbQi30otE9l0MHfLp7cpQK1ch/9TKBhxo0KvsR+qI1sYFR9
         19bA5OI6kiCnLJeKoFmiCU1gIRLJB2oyPwNpxykpeA67XrrSZhGsNLAdkvB4FRgewkkW
         W5TTsLU17QtFeDd8umySU81Yv6wm4dJ/lOeB1CQa50El95iZWJBYMwBiUr/BIBdmdt6U
         3c8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711975617; x=1712580417; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:references:in-reply-to:message-id:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eGfNdvjomfB3NmD0qYKOz52ZwixkZ3KXKEYj31L5/0Y=;
        b=Nws4gE//8MD9LOuIGnWAxUkJbLRWo2xhxQcoI1C6X7BaCkB28D87EN0mm4siTvvCyH
         RG3EY9EX3gmyUCGXAfft1GJIkTO/Y4sb/4GPOED/rd99eTJKR+qTegMIXqSalnNmdzs+
         GbOfwPZAyURwFRLpiuaWK1wOuXLpPEuC8cKRBQD1zC0eVVcbHW99LD5X2hPXl2+n2Ru6
         9djuScX3yiCvhIXbF++gesB2SlXZ/Pq42CrgVCqBAZeXncnTrLAFf1FYym+8Hca8JkuJ
         QgtXD8/YGuYd1uKHzz2jikKPBNfBR979ktpgFkV1UPnLrsVj2gXC/8ZKYcGdmsHTptQ4
         GHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711975617; x=1712580417;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:references:in-reply-to
         :message-id:to:from:date:x-beenthere:x-gm-message-state:sender:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eGfNdvjomfB3NmD0qYKOz52ZwixkZ3KXKEYj31L5/0Y=;
        b=hTo5LmusLnQ+k4CHdvdL9KwjaAvPy7vc5tUEfVVeFA5nqZ/8jhqGTEuyjBbU2O2WM2
         ferg85HpwlKwMF3jc8x5a7h5ygfnfflBRyD9O4XiXyiIDvv+4pldZ+pW+vdz7abTCrI2
         rHfHsGVx+YJ8/uxaQ8YssYnoeMPsC8nVZi9kC2P/+NNVml4qBFO1lztb/q7L7oA1rgw7
         +nfrzwZiM2Fyc4sKdMnQbAQthmx4oYSprBttETjbsmpfLbJPS+RAdJHrh7UoWch7GXHu
         BS4fL1xW2/Fgv8YLlluFXX6RlAl+lkY6ysMsOR1CjoPwB9ylpDL3oVapFlPu5dnJpLN/
         RARQ==
Sender: jailhouse-dev@googlegroups.com
X-Forwarded-Encrypted: i=1; AJvYcCXX4iQqmmQ2qs2M3PNWACsTLIaSoO52usY4qymM1ORdZhTnvzpWz1P3M2+B22ZGSpMY3RfilkiGpNew04M/IPxXsZfqcm8hjMAc0zE=
X-Gm-Message-State: AOJu0YyRTD2j10ZVrK+JLzbsKUm7XbfvV3lbwFO6C0j5lnVkqDI6WGfr
	zM7XazS13ST7SeVCB0RqbYerbFlauUs5zYX3GqNWSdfe9iHBommn
X-Google-Smtp-Source: AGHT+IErD2tmDWdLgOxRjBWzMaUkbk52QXoZVlX/xvr61GIwtdY9pOFzNmgZz5M8f+ocHgeHt4Yzvg==
X-Received: by 2002:a5b:d47:0:b0:ddd:696a:8656 with SMTP id f7-20020a5b0d47000000b00ddd696a8656mr7203447ybr.41.1711975617114;
        Mon, 01 Apr 2024 05:46:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3627:0:b0:dcc:4b24:c0da with SMTP id d39-20020a253627000000b00dcc4b24c0dals2727665yba.2.-pod-prod-02-us;
 Mon, 01 Apr 2024 05:46:55 -0700 (PDT)
X-Received: by 2002:a0d:eb47:0:b0:60a:6a5d:7db0 with SMTP id u68-20020a0deb47000000b0060a6a5d7db0mr2211538ywe.0.1711975615482;
        Mon, 01 Apr 2024 05:46:55 -0700 (PDT)
Date: Mon, 1 Apr 2024 05:46:54 -0700 (PDT)
From: Di Majo Massimiliano <massimilianodimajo097@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <41aa548d-222c-4377-afdd-35fab278e550n@googlegroups.com>
In-Reply-To: <07316f61-b354-4297-b364-6ed3688760d5@oth-regensburg.de>
References: <20240216193643.1524594-1-ralf.ramsauer@oth-regensburg.de>
 <50ceb5b9-dd2e-470b-98b4-2c3b028d534d@web.de>
 <07316f61-b354-4297-b364-6ed3688760d5@oth-regensburg.de>
Subject: Re: [EXT] Re: [PATCH] configs: x86: align with recent qemu device
 model
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15224_648055965.1711975614821"
X-Original-Sender: massimilianodimajo097@gmail.com
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

------=_Part_15224_648055965.1711975614821
Content-Type: multipart/alternative; 
	boundary="----=_Part_15225_1189109986.1711975614821"

------=_Part_15225_1189109986.1711975614821
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER
PAYPAL TRANSFER
CASHAPP TRANSFER
ZELLE TRANSFER
LOAN DEAL
TRANSFER WISE
WESTERN UNION TRANSFER
BITCOIN FLASHING
BANK ACCOUNT LOADING/FLASHING
IBAN TO IBAN TRANSFER
MONEYGRAM TRANSFER
IPIP/DTC
SLBC PROVIDER
CREDIT CARD TOP UP
DUMPS/ PINS
SEPA TRANSFER
WIRE TRANSFER
BITCOIN TOP UP
GLOBALPAY INC US
SKRILL USA
UNIONPAY RECEIVER

Thanks.


NOTE; ONLY SERIOUS / RELIABLE RECEIVERS CAN CONTACT.

DM ME ON WHATSAPP
+44 7529 555638

On Monday, February 19, 2024 at 5:37:24=E2=80=AFPM UTC+1 Ralf Ramsauer wrot=
e:

>
>
> On 18/02/2024 12:03, Jan Kiszka wrote:
> > On 16.02.24 20:36, Ralf Ramsauer wrote:
> >> Devices slightly changed with recent Qemu versions. Adapt changes of
> >> device topology.
> >>
> >> Signed-off-by: Ralf Ramsauer <ralf.r...@oth-regensburg.de>
> >> ---
> >>
> >> Tested with jailhouse enable, create, disable + apic demo.
> >>
> >> README.md | 2 +-
> >> configs/x86/qemu-x86.c | 80 +++++++++++++++++++++---------------------
> >> 2 files changed, 41 insertions(+), 41 deletions(-)
> >>
> >> diff --git a/README.md b/README.md
> >> index 2ab2a60a..f6fe011b 100644
> >> --- a/README.md
> >> +++ b/README.md
> >> @@ -255,7 +255,7 @@ https://github.com/siemens/jailhouse-images.
> >>
> >> The included system configuration qemu-x86.c can be used to run=20
> Jailhouse in
> >> QEMU/KVM virtual machine on x86 hosts (Intel and AMD are supported).=
=20
> Currently
> >> -it requires Linux 4.4 or newer on the host side. QEMU version 2.8 or=
=20
> newer is
> >> +it requires Linux 4.4 or newer on the host side. QEMU version 8.2 or=
=20
> newer is
> >=20
> > I'm reluctant to bump the requirements that high, given how many distro=
s
> > are on 7.2 or even 7.1. What about starting to use versioned machine
> > models instead? Say, 'qemu-system-x86_64 -machine pc-q35-7.0'? Similar
> > for the other archs (virt-x.y).
>
> Turns out we don't need that patch. My x86 Qemu test VM was pretty old,=
=20
> and I missed out the qemu option -device pcie-pci-bridge. With that=20
> option, everything seems to be fine, even with most recent versions of=20
> qemu.
>
> Ralf
>
> >=20
> > Jan
> >=20
> >> required.
> >>
> >> You also need a Linux guest image with a recent kernel (tested with >=
=3D=20
> 3.9) and
> >> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> >> index cdd3dd6d..7a585bd7 100644
> >> --- a/configs/x86/qemu-x86.c
> >> +++ b/configs/x86/qemu-x86.c
> >> @@ -179,52 +179,52 @@ struct {
> >> .size =3D 0x4000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
> >> + /* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
> >> {
> >> - .phys_start =3D 0xfea00000,
> >> - .virt_start =3D 0xfea00000,
> >> + .phys_start =3D 0xfeb40000,
> >> + .virt_start =3D 0xfeb40000,
> >> .size =3D 0x40000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea40000-fea5ffff : e1000e */
> >> + /* MemRegion: feb80000-feb9ffff : e1000e */
> >> {
> >> - .phys_start =3D 0xfea40000,
> >> - .virt_start =3D 0xfea40000,
> >> + .phys_start =3D 0xfeb80000,
> >> + .virt_start =3D 0xfeb80000,
> >> .size =3D 0x20000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea60000-fea7ffff : e1000e */
> >> + /* MemRegion: feba0000-febbffff : e1000e */
> >> {
> >> - .phys_start =3D 0xfea60000,
> >> - .virt_start =3D 0xfea60000,
> >> + .phys_start =3D 0xfeba0000,
> >> + .virt_start =3D 0xfeba0000,
> >> .size =3D 0x20000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea91000-fea93fff : e1000e */
> >> + /* MemRegion: febd0000-febd3fff : e1000e */
> >> {
> >> - .phys_start =3D 0xfea91000,
> >> - .virt_start =3D 0xfea91000,
> >> + .phys_start =3D 0xfebd0000,
> >> + .virt_start =3D 0xfebd0000,
> >> .size =3D 0x3000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audio) */
> >> + /* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audio) */
> >> {
> >> - .phys_start =3D 0xfea94000,
> >> - .virt_start =3D 0xfea94000,
> >> + .phys_start =3D 0xfebd4000,
> >> + .virt_start =3D 0xfebd4000,
> >> .size =3D 0x4000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
> >> + /* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
> >> {
> >> - .phys_start =3D 0xfea98000,
> >> - .virt_start =3D 0xfea98000,
> >> + .phys_start =3D 0xfebd8000,
> >> + .virt_start =3D 0xfebd8000,
> >> .size =3D 0x1000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> - /* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
> >> + /* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
> >> {
> >> - .phys_start =3D 0xfea9a000,
> >> - .virt_start =3D 0xfea9a000,
> >> + .phys_start =3D 0xfebd9000,
> >> + .virt_start =3D 0xfebd9000,
> >> .size =3D 0x1000,
> >> .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
> >> },
> >> @@ -264,6 +264,24 @@ struct {
> >> },
> >>
> >> .pci_devices =3D {
> >> + /* PCI bridge */
> >> + {
> >> + .type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
> >> + .domain =3D 0x0000,
> >> + .bdf =3D 0x0000,
> >> + .bar_mask =3D {
> >> + 0xffffff00, 0x00000000, 0x00000000,
> >> + 0x00000000, 0x00000000, 0x00000000,
> >> + },
> >> + .caps_start =3D 11,
> >> + .num_caps =3D 5,
> >> + .num_msi_vectors =3D 1,
> >> + .msi_64bits =3D 1,
> >> + .msi_maskable =3D 1,
> >> + .num_msix_vectors =3D 0,
> >> + .msix_region_size =3D 0x0,
> >> + .msix_address =3D 0x0,
> >> + },
> >> { /* VGA */
> >> .type =3D JAILHOUSE_PCI_TYPE_DEVICE,
> >> .domain =3D 0x0000,
> >> @@ -283,25 +301,7 @@ struct {
> >> .msi_64bits =3D 1,
> >> .num_msix_vectors =3D 5,
> >> .msix_region_size =3D 0x1000,
> >> - .msix_address =3D 0xfea90000,
> >> - },
> >> - /* PCI bridge */
> >> - {
> >> - .type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
> >> - .domain =3D 0x0000,
> >> - .bdf =3D 0x0018,
> >> - .bar_mask =3D {
> >> - 0xffffff00, 0x00000000, 0x00000000,
> >> - 0x00000000, 0x00000000, 0x00000000,
> >> - },
> >> - .caps_start =3D 11,
> >> - .num_caps =3D 5,
> >> - .num_msi_vectors =3D 1,
> >> - .msi_64bits =3D 1,
> >> - .msi_maskable =3D 1,
> >> - .num_msix_vectors =3D 0,
> >> - .msix_region_size =3D 0x0,
> >> - .msix_address =3D 0x0,
> >> + .msix_address =3D 0xfebd0000,
> >> },
> >> { /* ICH HD audio */
> >> .type =3D JAILHOUSE_PCI_TYPE_DEVICE,
> >=20
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/41aa548d-222c-4377-afdd-35fab278e550n%40googlegroups.com.

------=_Part_15225_1189109986.1711975614821
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

MT103/202 DIRECT WIRE TRANSFER<br />PAYPAL TRANSFER<br />CASHAPP TRANSFER<b=
r />ZELLE TRANSFER<br />LOAN DEAL<br />TRANSFER WISE<br />WESTERN UNION TRA=
NSFER<br />BITCOIN FLASHING<br />BANK ACCOUNT LOADING/FLASHING<br />IBAN TO=
 IBAN TRANSFER<br />MONEYGRAM TRANSFER<br />IPIP/DTC<br />SLBC PROVIDER<br =
/>CREDIT CARD TOP UP<br />DUMPS/ PINS<br />SEPA TRANSFER<br />WIRE TRANSFER=
<br />BITCOIN TOP UP<br />GLOBALPAY INC US<br />SKRILL USA<br />UNIONPAY RE=
CEIVER<br /><br />Thanks.<br /><br /><br />NOTE; ONLY SERIOUS / RELIABLE RE=
CEIVERS CAN CONTACT.<br /><br />DM ME ON WHATSAPP<br />+44 7529 555638<br /=
><br /><div class=3D"gmail_quote"><div dir=3D"auto" class=3D"gmail_attr">On=
 Monday, February 19, 2024 at 5:37:24=E2=80=AFPM UTC+1 Ralf Ramsauer wrote:=
<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0.8ex; =
border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
<br>On 18/02/2024 12:03, Jan Kiszka wrote:
<br>&gt; On 16.02.24 20:36, Ralf Ramsauer wrote:
<br>&gt;&gt; Devices slightly changed with recent Qemu versions. Adapt chan=
ges of
<br>&gt;&gt; device topology.
<br>&gt;&gt;
<br>&gt;&gt; Signed-off-by: Ralf Ramsauer &lt;<a href data-email-masked rel=
=3D"nofollow">ralf.r...@oth-regensburg.de</a>&gt;
<br>&gt;&gt; ---
<br>&gt;&gt;
<br>&gt;&gt; Tested with jailhouse enable, create, disable + apic demo.
<br>&gt;&gt;
<br>&gt;&gt;   README.md              |  2 +-
<br>&gt;&gt;   configs/x86/qemu-x86.c | 80 +++++++++++++++++++++-----------=
----------
<br>&gt;&gt;   2 files changed, 41 insertions(+), 41 deletions(-)
<br>&gt;&gt;
<br>&gt;&gt; diff --git a/README.md b/README.md
<br>&gt;&gt; index 2ab2a60a..f6fe011b 100644
<br>&gt;&gt; --- a/README.md
<br>&gt;&gt; +++ b/README.md
<br>&gt;&gt; @@ -255,7 +255,7 @@ <a href=3D"https://github.com/siemens/jail=
house-images" target=3D"_blank" rel=3D"nofollow" data-saferedirecturl=3D"ht=
tps://www.google.com/url?hl=3Den&amp;q=3Dhttps://github.com/siemens/jailhou=
se-images&amp;source=3Dgmail&amp;ust=3D1712061996342000&amp;usg=3DAOvVaw3j7=
GL3d94MGJPd3pFMASjD">https://github.com/siemens/jailhouse-images</a>.
<br>&gt;&gt;
<br>&gt;&gt;   The included system configuration qemu-x86.c can be used to =
run Jailhouse in
<br>&gt;&gt;   QEMU/KVM virtual machine on x86 hosts (Intel and AMD are sup=
ported). Currently
<br>&gt;&gt; -it requires Linux 4.4 or newer on the host side. QEMU version=
 2.8 or newer is
<br>&gt;&gt; +it requires Linux 4.4 or newer on the host side. QEMU version=
 8.2 or newer is
<br>&gt;=20
<br>&gt; I&#39;m reluctant to bump the requirements that high, given how ma=
ny distros
<br>&gt; are on 7.2 or even 7.1. What about starting to use versioned machi=
ne
<br>&gt; models instead? Say, &#39;qemu-system-x86_64 -machine pc-q35-7.0&#=
39;? Similar
<br>&gt; for the other archs (virt-x.y).
<br>
<br>Turns out we don&#39;t need that patch. My x86 Qemu test VM was pretty =
old,=20
<br>and I missed out the qemu option -device pcie-pci-bridge. With that=20
<br>option, everything seems to be fine, even with most recent versions of =
qemu.
<br>
<br>   Ralf
<br>
<br>&gt;=20
<br>&gt; Jan
<br>&gt;=20
<br>&gt;&gt;   required.
<br>&gt;&gt;
<br>&gt;&gt;   You also need a Linux guest image with a recent kernel (test=
ed with &gt;=3D 3.9) and
<br>&gt;&gt; diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
<br>&gt;&gt; index cdd3dd6d..7a585bd7 100644
<br>&gt;&gt; --- a/configs/x86/qemu-x86.c
<br>&gt;&gt; +++ b/configs/x86/qemu-x86.c
<br>&gt;&gt; @@ -179,52 +179,52 @@ struct {
<br>&gt;&gt;   			.size =3D 0x4000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
<br>&gt;&gt; +		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea00000,
<br>&gt;&gt; -			.virt_start =3D 0xfea00000,
<br>&gt;&gt; +			.phys_start =3D 0xfeb40000,
<br>&gt;&gt; +			.virt_start =3D 0xfeb40000,
<br>&gt;&gt;   			.size =3D 0x40000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea40000-fea5ffff : e1000e */
<br>&gt;&gt; +		/* MemRegion: feb80000-feb9ffff : e1000e */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea40000,
<br>&gt;&gt; -			.virt_start =3D 0xfea40000,
<br>&gt;&gt; +			.phys_start =3D 0xfeb80000,
<br>&gt;&gt; +			.virt_start =3D 0xfeb80000,
<br>&gt;&gt;   			.size =3D 0x20000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea60000-fea7ffff : e1000e */
<br>&gt;&gt; +		/* MemRegion: feba0000-febbffff : e1000e */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea60000,
<br>&gt;&gt; -			.virt_start =3D 0xfea60000,
<br>&gt;&gt; +			.phys_start =3D 0xfeba0000,
<br>&gt;&gt; +			.virt_start =3D 0xfeba0000,
<br>&gt;&gt;   			.size =3D 0x20000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea91000-fea93fff : e1000e */
<br>&gt;&gt; +		/* MemRegion: febd0000-febd3fff : e1000e */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea91000,
<br>&gt;&gt; -			.virt_start =3D 0xfea91000,
<br>&gt;&gt; +			.phys_start =3D 0xfebd0000,
<br>&gt;&gt; +			.virt_start =3D 0xfebd0000,
<br>&gt;&gt;   			.size =3D 0x3000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audi=
o) */
<br>&gt;&gt; +		/* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audi=
o) */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea94000,
<br>&gt;&gt; -			.virt_start =3D 0xfea94000,
<br>&gt;&gt; +			.phys_start =3D 0xfebd4000,
<br>&gt;&gt; +			.virt_start =3D 0xfebd4000,
<br>&gt;&gt;   			.size =3D 0x4000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
<br>&gt;&gt; +		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea98000,
<br>&gt;&gt; -			.virt_start =3D 0xfea98000,
<br>&gt;&gt; +			.phys_start =3D 0xfebd8000,
<br>&gt;&gt; +			.virt_start =3D 0xfebd8000,
<br>&gt;&gt;   			.size =3D 0x1000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; -		/* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
<br>&gt;&gt; +		/* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
<br>&gt;&gt;   		{
<br>&gt;&gt; -			.phys_start =3D 0xfea9a000,
<br>&gt;&gt; -			.virt_start =3D 0xfea9a000,
<br>&gt;&gt; +			.phys_start =3D 0xfebd9000,
<br>&gt;&gt; +			.virt_start =3D 0xfebd9000,
<br>&gt;&gt;   			.size =3D 0x1000,
<br>&gt;&gt;   			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
<br>&gt;&gt;   		},
<br>&gt;&gt; @@ -264,6 +264,24 @@ struct {
<br>&gt;&gt;   	},
<br>&gt;&gt;
<br>&gt;&gt;   	.pci_devices =3D {
<br>&gt;&gt; +		/* PCI bridge */
<br>&gt;&gt; +		{
<br>&gt;&gt; +			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
<br>&gt;&gt; +			.domain =3D 0x0000,
<br>&gt;&gt; +			.bdf =3D 0x0000,
<br>&gt;&gt; +			.bar_mask =3D {
<br>&gt;&gt; +				0xffffff00, 0x00000000, 0x00000000,
<br>&gt;&gt; +				0x00000000, 0x00000000, 0x00000000,
<br>&gt;&gt; +			},
<br>&gt;&gt; +			.caps_start =3D 11,
<br>&gt;&gt; +			.num_caps =3D 5,
<br>&gt;&gt; +			.num_msi_vectors =3D 1,
<br>&gt;&gt; +			.msi_64bits =3D 1,
<br>&gt;&gt; +			.msi_maskable =3D 1,
<br>&gt;&gt; +			.num_msix_vectors =3D 0,
<br>&gt;&gt; +			.msix_region_size =3D 0x0,
<br>&gt;&gt; +			.msix_address =3D 0x0,
<br>&gt;&gt; +		},
<br>&gt;&gt;   		{ /* VGA */
<br>&gt;&gt;   			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
<br>&gt;&gt;   			.domain =3D 0x0000,
<br>&gt;&gt; @@ -283,25 +301,7 @@ struct {
<br>&gt;&gt;   			.msi_64bits =3D 1,
<br>&gt;&gt;   			.num_msix_vectors =3D 5,
<br>&gt;&gt;   			.msix_region_size =3D 0x1000,
<br>&gt;&gt; -			.msix_address =3D 0xfea90000,
<br>&gt;&gt; -		},
<br>&gt;&gt; -		/* PCI bridge */
<br>&gt;&gt; -		{
<br>&gt;&gt; -			.type =3D JAILHOUSE_PCI_TYPE_BRIDGE,
<br>&gt;&gt; -			.domain =3D 0x0000,
<br>&gt;&gt; -			.bdf =3D 0x0018,
<br>&gt;&gt; -			.bar_mask =3D {
<br>&gt;&gt; -				0xffffff00, 0x00000000, 0x00000000,
<br>&gt;&gt; -				0x00000000, 0x00000000, 0x00000000,
<br>&gt;&gt; -			},
<br>&gt;&gt; -			.caps_start =3D 11,
<br>&gt;&gt; -			.num_caps =3D 5,
<br>&gt;&gt; -			.num_msi_vectors =3D 1,
<br>&gt;&gt; -			.msi_64bits =3D 1,
<br>&gt;&gt; -			.msi_maskable =3D 1,
<br>&gt;&gt; -			.num_msix_vectors =3D 0,
<br>&gt;&gt; -			.msix_region_size =3D 0x0,
<br>&gt;&gt; -			.msix_address =3D 0x0,
<br>&gt;&gt; +			.msix_address =3D 0xfebd0000,
<br>&gt;&gt;   		},
<br>&gt;&gt;   		{ /* ICH HD audio */
<br>&gt;&gt;   			.type =3D JAILHOUSE_PCI_TYPE_DEVICE,
<br>&gt;=20
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/41aa548d-222c-4377-afdd-35fab278e550n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/41aa548d-222c-4377-afdd-35fab278e550n%40googlegroups.co=
m</a>.<br />

------=_Part_15225_1189109986.1711975614821--

------=_Part_15224_648055965.1711975614821--
