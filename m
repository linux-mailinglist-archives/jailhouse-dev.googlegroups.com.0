Return-Path: <jailhouse-dev+bncBCL6VUP7RYARBXUFTDTAKGQEUA72M4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33e.google.com (mail-ot1-x33e.google.com [IPv6:2607:f8b0:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBB8B670
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 21:45:36 +0200 (CEST)
Received: by mail-ot1-x33e.google.com with SMTP id z17sf226160otj.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 12:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=olYi4FIPXmVVUGBDG3FyxQGufLkM0hHNkJynqKHU6Yc=;
        b=mcoQTiKT9tLUI4eFxdHXITynVqZ+nVmolrMrlqpvxBG/DUJBqMXavAlW4aVLeHgMWv
         ARkfkAoQDQTDj+oEqgInGIkAiMXl6sF2qwLCx47kz1hjWWjob/YJ7xgYH9ydGSZZqMS0
         uhVB4GIe/9G9ikwCzCDZeGje2YmDUtdCj9YG9D8x54NRdwkYFiPEIV1AeoqMfJ2Pn4h0
         eKDXQDD6A6so+b7AOSAqFazrgI/AgNMUqGOgd+lp8EEUGC9mMPVittnk7KGzLDW6DuJL
         wBIsiOx7hB2MYr2GB3C6wvXY/H8Gmhfr6Tcy7vdgLU6/I+9QsFZJPvDKWrJSheqh6jZF
         9kcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=olYi4FIPXmVVUGBDG3FyxQGufLkM0hHNkJynqKHU6Yc=;
        b=fBXs/DBUQxp6v1HgrYhaMj6U77bfXL20C92F9IKXrYGYMeCXDPXPZprzUvJuBnIX/C
         H5PRU7E2BJq9oQR0+Zxq+hvJE4oIUJtWQQpMgUXFZdo4mHYMyi1Zwv4B9PtBHUSqFDKo
         L7pYWCfMAhavZCcdDm4Rb1S3HnzkepJEL9LDqm+cPCQtRL2boLKyjFaWcgDWAN7YqoPX
         4vg2R0vXhzurrFlaky7Prjw23JHpLB/cCUBRfHwRI8dxB7X6VS3agwlGXem0+UUKkmch
         ugXr/rQ2JTmO1Q20WWDst1idGH5+Dfo+xdFOyXtt5KjgnoMuXYHjpZYEshTjjZNrHZkH
         O/aQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUQLfw71Z/H5Uv2BBAxLd/Upmy+wkrYCt87Y+j82rVu11QoCNd8
	Q9ra6ZacOgtlyo+x25zuTSI=
X-Google-Smtp-Source: APXvYqwRd5N0ChQT+xsM+PkKJm65bZYvE70HkpvkZzysnWFkz++m9L3PAf1X64DX/SUVIGDQIwzD2w==
X-Received: by 2002:aca:c649:: with SMTP id w70mr9191394oif.174.1556480734305;
        Sun, 28 Apr 2019 12:45:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:aa94:: with SMTP id t142ls1489064oie.12.gmail; Sun, 28
 Apr 2019 12:45:33 -0700 (PDT)
X-Received: by 2002:aca:c649:: with SMTP id w70mr9191372oif.174.1556480733592;
        Sun, 28 Apr 2019 12:45:33 -0700 (PDT)
Date: Sun, 28 Apr 2019 12:45:32 -0700 (PDT)
From: =?UTF-8?Q?Hakk=C4=B1_Kurumahmut?= <hkurumahmut84@hotmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <cbeb1b02-5799-472c-bb5c-f6eb62a60305@googlegroups.com>
In-Reply-To: <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
References: <16e3b6ef-37e1-4734-aba4-247bcbbc18e0@googlegroups.com>
 <6526d7d9-09fb-c25e-0037-628998267794@siemens.com>
 <81bb9c90-1557-47ae-990d-b1bf417a58b9@googlegroups.com>
 <63f974a9-5944-4f1f-77a2-4bd7393ff8a6@siemens.com>
 <05d90171-db1f-4031-a7b2-48570eb37847@googlegroups.com>
 <fdfcd6e7-e2a5-4187-b079-ca643fb281a1@googlegroups.com>
 <32bc2861-e11e-4ab0-bdcf-063e2c05318d@googlegroups.com>
 <f704088f-99c1-4ec0-bd5e-90e15874cc7d@googlegroups.com>
 <3e5ad4e4-abac-03f5-5402-661e62a83944@siemens.com>
 <7f55a310-7bb7-4a3f-b111-0c2a24939b7c@googlegroups.com>
 <1f880925-0420-7c15-1aa4-07d001a6efce@siemens.com>
 <bcd32c87-28e7-4747-b3ab-ebaedf160309@googlegroups.com>
 <32d0b346-10e4-de18-1d24-95e4e4cff977@web.de>
 <9732f874-1271-4296-b2ef-ededba614a87@googlegroups.com>
 <7deff203-cf29-6353-128a-8b40f8d42584@web.de>
Subject: Re: JAILHOUSE hangs with exception when trying to enable the root
 cell
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1393_1173466369.1556480732944"
X-Original-Sender: hkurumahmut84@hotmail.com
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

------=_Part_1393_1173466369.1556480732944
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

28 Nisan 2019 Pazar 17:31:20 UTC+3 tarihinde Jan Kiszka yazd=C4=B1:
> On 28.04.19 13:18, Hakk=C4=B1 Kurumahmut wrote:
> > 28 Nisan 2019 Pazar 11:22:30 UTC+3 tarihinde Jan Kiszka wrote:
> >
> > Hi Jan,
> >
> >> I looked into that code again and noticed a long-pending bug here, and=
 also in the MSI hand-over logic. The effect was that actually no event was=
 generated at all when interrupt remapping (and x2APIC) was in use in the r=
oot cell. Your commenting out of the code above probably just made the loss=
 of the event (and, thus, the keystroke) less likely, but the proper fix is=
 to do the injection.
> >>
> >> There are a number of commits in the next branch now that should fix t=
he issue without the need for commenting out code. Please test.
> >
> >
> > I test your last commit with 2 laptop at next branch. (commit d235bde2a=
4738b4cddb1df926a39b8a1e11c0acc)
> >
> > I was only changed all pio bitmap values to zero.
> >
> > On "HP EliteBook 8460p Notebook", works very well. ENTER keyboard strik=
e was disappered. Root Cell CPUs were not crashed.
> >
> > On "HP EliteBook 8470p Notebook", ENTER key strike was disappeared too.=
 But it is generating some crashes. I think they are not related your last =
patch.
> >
> > I have installed Fedora 29 Workstation with "4.18.16-300.fc29.x86_64" k=
ernel at "HP EliteBook 8470p Notebook"
> >
> >
> > But I have received below exceptions. Do you have any advice?
> >
> > I have attached sysconfig.c, data collection archive, dmesg output and =
lspci outputs for "HP EliteBook 8470p Notebook".
> >
> >
> > Activating hypervisor
> > VT-d fault event reported by IOMMU 1:
> >   Source Identifier (bus:dev.func): 24:00.0
> >   Fault Reason: 0x25 Fault Info: ee00000000000 Type 0
>=20
> Does this one still appear, even if you enable the device only after jail=
house is running?

I jave disabled wifi (airplane mode) this error was disappered. I have test=
 disable and enable Root Cell continuously, but new problems are seen as SA=
TA based "Invalid MMIO/RAM read" errors. I will study this problem with tak=
ing into account your below advices.

> >
> > FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c34010 size: 4
>=20
> proc/iomem reports this as "reserved" but it is still used, likely for BI=
OS
> topics. Expand the region at b9c7f000 to include RAM down to b88ff000 as =
well.

I will test this situation. What is the parsing rules of /proc/iomem?=20

I have a Dell R710 Server. It is need intel_iommu=3Don because DMAR region =
does not seeen /proc/iomem. I have enabled it with kernel command so DMAR r=
egion is seen under reserved region but parser ignore this line. I debug pa=
rse_iomem_file() python function, I seen that parse_iomem_tree() function i=
gnoring other than HPET.=20

      if (s.lower() =3D=3D 'reserved'):
         regions.extend(IOMemRegionTree.find_hpet_regions(tree))


I have attached below code to find_hpet_regions()=20

     if (s.find('dmar') >=3D 0):
        regions.append(r)

Is my approach correct? Because I have received additional errors :)

> > RIP: 0xffffffffbc04eb25 RSP: 0xffffbb66c0e17ab0 FLAGS: 10046
> > RAX: 0xffffbb66c0002000 RBX: 0xffff998a76d52000 RCX: 0x0000000000000001
> > RDX: 0x0000000000000001 RSI: 0x0000000000000202 RDI: 0xffffbb66c0002010
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> > CR0: 0x0000000080050033 CR3: 0x00000001df20a004 CR4: 0x00000000001626f0
> > EFER: 0x0000000000000d01
> > Parking CPU 0 (Cell: "RootCell")
> >
> > FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
> > FATAL: Invalid MMIO/RAM read, addr: 0x00000000b9c3f000 size: 0
>=20
> The above will address this, too.

OK. I will study.

> > RIP: 0xffffffffbc901226 RSP: 0xffffbb66c1d1fe08 FLAGS: 10286
> > RAX: 0xffff998a47ac5800 RBX: 0x000000000000060d RCX: 0x000000000000060d
> > RDX: 0x000000000000060d RSI: 0xffffbb66c0d11000 RDI: 0xffff998a47ac5800
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> > CR0: 0x0000000080050033 CR3: 0x0000000218966001 CR4: 0x00000000001626e0
> > EFER: 0x0000000000000d01
> > Parking CPU 2 (Cell: "RootCell")
> >


Thanks.

HAKKI

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_1393_1173466369.1556480732944--
