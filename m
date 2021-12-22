Return-Path: <jailhouse-dev+bncBCWJRXUWVQPBBIWYROHAMGQENA524XA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83b.google.com (mail-qt1-x83b.google.com [IPv6:2607:f8b0:4864:20::83b])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2947CEE7
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 10:13:07 +0100 (CET)
Received: by mail-qt1-x83b.google.com with SMTP id s6-20020a05622a018600b002b2d93b9c73sf1050763qtw.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Dec 2021 01:13:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=af/zHc9z44yJBk7WVWNRq9oxh+sPK9WUN+iFVMg1kPU=;
        b=QdZJjb5w9lLRPLRLI4kFHtST82TuUuYN7+Q6uc/tzHGYPPVLSyHbwMcTf/XzGqjV5M
         L3aye4hAHhWaWE9OY3+cZQnixDVvGEMNniKKQG44PaNPlN6hwWKnB+FQZWAdhIY2YFds
         f5e0RBA/hoNXT+KB32tBnlhM8TkujbhT272RC2zPVs/0o+BPOxtV0TAiRTE7FvS60trH
         TX84tEdQyeYmU8bfZ0J8mOwuYzx6cY3IfSc7qpxuVQs1417WNZlWJhBi/WlOsCduJMfW
         a3z05ec3aBXysSDXW52Zi4T3MgvQjQ+2q6KUTrvyAJmH3c/um00oefaEfkeUjTDOIuO8
         0Ciw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=af/zHc9z44yJBk7WVWNRq9oxh+sPK9WUN+iFVMg1kPU=;
        b=L1XkkGuWgQse5kyAr3ey020VbLPszwon4CB9AHGxhDQneUWcwvDlOu9rjBKDlpmWJQ
         i9I+5xoHkf2Us7+CMKea0RQTq9aWfpqY60tK2lieVer/UlE8LGwv7YdUsAMf0cjr5U7M
         WcDXrUOWFCO1sq1RX/s4IQtalwgGInBekjNy0EQYDcN1HGZnK9wp6wBsK0RfeqAu9v7q
         jvvbKdyCP+9XVODTy1z+v/OnePMFHVpFH45/HeoG2Krs0mo3dlxNh3yHhRVpRKE/PW8J
         okI1a/UlOq5aPNASlqqglWllWqZAkBRPANGx3RF96onwZAhiVMLUqWO2RWvCcm9TzEx6
         W6nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=af/zHc9z44yJBk7WVWNRq9oxh+sPK9WUN+iFVMg1kPU=;
        b=VOnxDikOUBMvX3W11yAocnqNi2jw1sGwezUWX6AQ+NzVK2Wl0weoqdgFXdpRWVMyW+
         Za0FsJf33aGBcVK7aj4549P/4n6oo2K+jJVKDveyqEPHYSoxDYt5YnqAFBoHsEXsuHrm
         Q7FsWPx0NsIctwy7uPwsX6+FBajSBSw65aguDkbS/I/Df7S4ke0wNQgzjauGI+uZVvra
         PS470Bqxblecic2MfwYFr8F0890tVOUOVKfyFxT4y8VbhQQ3N3rD1W8CZ1VYYo0lW2hR
         j7g+4N+m0ntncM6pMkIPZ+ZtTSrXyPtth5x2AkkvBjPkqvhWIIBWtc1WsvTzqNy/LUeC
         EuAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531hPdW9McTfBAOFiMc1DOdIs6PB4sAyuGreP6cdJ88zdYQoRkmw
	MRaNOwnwDSERRsSRcD2aHpI=
X-Google-Smtp-Source: ABdhPJwauYDql5yXYXviDKBbZTgxEDHUKH1q5siTIIxSrc2IAlU18tLSnbYeGw9rBdfPknio6mc8sw==
X-Received: by 2002:ac8:4e8a:: with SMTP id 10mr1398626qtp.578.1640164386495;
        Wed, 22 Dec 2021 01:13:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:40cc:: with SMTP id g12ls774960qko.4.gmail; Wed, 22
 Dec 2021 01:13:06 -0800 (PST)
X-Received: by 2002:a05:620a:13b8:: with SMTP id m24mr115992qki.186.1640164385855;
        Wed, 22 Dec 2021 01:13:05 -0800 (PST)
Date: Wed, 22 Dec 2021 01:13:05 -0800 (PST)
From: jiajun huang <huangjiajun145041@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <1e24e708-b133-4785-8f07-aad465f0d7ffn@googlegroups.com>
In-Reply-To: <659e288e0ecaf6a4c364cbd4f3a30148a3a6150d.camel@siemens.com>
References: <AQHX9mhQ8Gt16vfZR06c8GatMbXE16w85I6AgAAF2gA=>
 <de30fff2-ed9d-4a83-8229-6cfd9a2ac99an@googlegroups.com>
 <993a2675-8e94-4153-afb6-2324877408f8n@googlegroups.com>
 <659e288e0ecaf6a4c364cbd4f3a30148a3a6150d.camel@siemens.com>
Subject: Re: FATAL: unsupported instruction (0x83 0x00 0x00 0x00) (0xf3 0x00
 0x00 0x00)
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_21016_1447551593.1640164385216"
X-Original-Sender: huangjiajun145041@gmail.com
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

------=_Part_21016_1447551593.1640164385216
Content-Type: multipart/alternative; 
	boundary="----=_Part_21017_649307183.1640164385216"

------=_Part_21017_649307183.1640164385216
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!  The cause of the bug is that the MMIO address is not page aligned=
=EF=BC=81

=E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C UTC=
+8 21:06:51<Bezdeka, Florian> =E5=86=99=E9=81=93=EF=BC=9A

> On Tue, 2021-12-21 at 04:45 -0800, jiajun huang wrote:
> >=20
> > Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CPU 5
> > Code location: 0xfffffffff0000050
> > Using x2APIC
> > Page pool usage after early setup: mem 134/32207, remap 0/131072
> > Initializing processors:
> >  CPU 5... (APIC ID 34) OK
> >  CPU 1... (APIC ID 2) OK
> >  CPU 3... (APIC ID 6) OK
> >  CPU 0... (APIC ID 0) OK
> >  CPU 6... (APIC ID 36) OK
> >  CPU 2... (APIC ID 4) OK
> >  CPU 7... (APIC ID 38) OK
> >  CPU 4... (APIC ID 32) OK
> > Initializing unit: VT-d
> > DMAR unit @0xfbffe000/0x1000
> > DMAR unit @0xdfffc000/0x1000
> > Reserving 24 interrupt(s) for device 00:1f.7 at index 0
> > Reserving 24 interrupt(s) for device 00:05.4 at index 24
> > Reserving 24 interrupt(s) for device 80:05.4 at index 48
> > Initializing unit: IOAPIC
> > Initializing unit: Cache Allocation Technology
> > Initializing unit: PCI
> > Adding PCI device 00:00.0 to cell "RootCell"
> > Adding virtual PCI device 00:17.0 to cell "RootCell"
> > Adding virtual PCI device 00:18.0 to cell "RootCell"
> > Adding PCI device 00:01.0 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 00:01.0 at index 72
> > Adding PCI device 00:01.1 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 00:01.1 at index 74
> > Adding PCI device 00:03.0 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 00:03.0 at index 76
> > Adding PCI device 00:03.2 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 00:03.2 at index 78
> > Adding PCI device 00:05.0 to cell "RootCell"
> > Adding PCI device 00:05.2 to cell "RootCell"
> > Adding PCI device 00:05.4 to cell "RootCell"
> > Adding PCI device 00:11.0 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:11.0 at index 80
> > Adding PCI device 00:1a.0 to cell "RootCell"
> > Adding PCI device 00:1c.0 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1c.0 at index 81
> > Adding PCI device 00:1c.1 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1c.1 at index 82
> > Adding PCI device 00:1c.3 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1c.3 at index 83
> > Adding PCI device 00:1d.0 to cell "RootCell"
> > Adding PCI device 00:1e.0 to cell "RootCell"
> > Adding PCI device 00:1f.0 to cell "RootCell"
> > Adding PCI device 00:1f.2 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 00:1f.2 at index 84
> > Adding PCI device 00:1f.3 to cell "RootCell"
> > Adding PCI device 06:00.0 to cell "RootCell"
> > Reserving 5 interrupt(s) for device 06:00.0 at index 85
> > Adding PCI device 07:00.0 to cell "RootCell"
> > Reserving 5 interrupt(s) for device 07:00.0 at index 90
> > Adding PCI device 08:00.0 to cell "RootCell"
> > Reserving 1 interrupt(s) for device 08:00.0 at index 95
> > Adding PCI device 09:00.0 to cell "RootCell"
> > Adding PCI device 7f:08.0 to cell "RootCell"
> > Adding PCI device 7f:09.0 to cell "RootCell"
> > Adding PCI device 7f:0a.0 to cell "RootCell"
> > Adding PCI device 7f:0a.1 to cell "RootCell"
> > Adding PCI device 7f:0a.2 to cell "RootCell"
> > Adding PCI device 7f:0a.3 to cell "RootCell"
> > Adding PCI device 7f:0b.0 to cell "RootCell"
> > Adding PCI device 7f:0b.3 to cell "RootCell"
> > Adding PCI device 7f:0c.0 to cell "RootCell"
> > Adding PCI device 7f:0c.1 to cell "RootCell"
> > Adding PCI device 7f:0d.0 to cell "RootCell"
> > Adding PCI device 7f:0d.1 to cell "RootCell"
> > Adding PCI device 7f:0e.0 to cell "RootCell"
> > Adding PCI device 7f:0e.1 to cell "RootCell"
> > Adding PCI device 7f:0f.0 to cell "RootCell"
> > Adding PCI device 7f:0f.1 to cell "RootCell"
> > Adding PCI device 7f:0f.2 to cell "RootCell"
> > Adding PCI device 7f:0f.3 to cell "RootCell"
> > Adding PCI device 7f:0f.4 to cell "RootCell"
> > Adding PCI device 7f:0f.5 to cell "RootCell"
> > Adding PCI device 7f:10.0 to cell "RootCell"
> > Adding PCI device 7f:10.1 to cell "RootCell"
> > Adding PCI device 7f:10.2 to cell "RootCell"
> > Adding PCI device 7f:10.3 to cell "RootCell"
> > Adding PCI device 7f:10.4 to cell "RootCell"
> > Adding PCI device 7f:10.5 to cell "RootCell"
> > Adding PCI device 7f:10.6 to cell "RootCell"
> > Adding PCI device 7f:10.7 to cell "RootCell"
> > Adding PCI device 7f:13.0 to cell "RootCell"
> > Adding PCI device 7f:13.1 to cell "RootCell"
> > Adding PCI device 7f:13.4 to cell "RootCell"
> > Adding PCI device 7f:13.5 to cell "RootCell"
> > Adding PCI device 7f:16.0 to cell "RootCell"
> > Adding PCI device 7f:16.1 to cell "RootCell"
> > Adding PCI device 7f:16.2 to cell "RootCell"
> > Adding PCI device 80:03.0 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 80:03.0 at index 96
> > Adding PCI device 80:03.2 to cell "RootCell"
> > Reserving 2 interrupt(s) for device 80:03.2 at index 98
> > Adding PCI device 80:05.0 to cell "RootCell"
> > Adding PCI device 80:05.2 to cell "RootCell"
> > Adding PCI device 80:05.4 to cell "RootCell"
> > Adding PCI device ff:08.0 to cell "RootCell"
> > Adding PCI device ff:09.0 to cell "RootCell"
> > Adding PCI device ff:0a.0 to cell "RootCell"
> > Adding PCI device ff:0a.1 to cell "RootCell"
> > Adding PCI device ff:0a.2 to cell "RootCell"
> > Adding PCI device ff:0a.3 to cell "RootCell"
> > Adding PCI device ff:0b.0 to cell "RootCell"
> > Adding PCI device ff:0b.3 to cell "RootCell"
> > Adding PCI device ff:0c.0 to cell "RootCell"
> > Adding PCI device ff:0c.1 to cell "RootCell"
> > Adding PCI device ff:0d.0 to cell "RootCell"
> > Adding PCI device ff:0d.1 to cell "RootCell"
> > Adding PCI device ff:0e.0 to cell "RootCell"
> > Adding PCI device ff:0e.1 to cell "RootCell"
> > Adding PCI device ff:0f.0 to cell "RootCell"
> > Adding PCI device ff:0f.1 to cell "RootCell"
> > Adding PCI device ff:0f.2 to cell "RootCell"
> > Adding PCI device ff:0f.3 to cell "RootCell"
> > Adding PCI device ff:0f.4 to cell "RootCell"
> > Adding PCI device ff:0f.5 to cell "RootCell"
> > Adding PCI device ff:10.0 to cell "RootCell"
> > Adding PCI device ff:10.1 to cell "RootCell"
> > Adding PCI device ff:10.2 to cell "RootCell"
> > Adding PCI device ff:10.3 to cell "RootCell"
> > Adding PCI device ff:10.4 to cell "RootCell"
> > Adding PCI device ff:10.5 to cell "RootCell"
> > Adding PCI device ff:10.6 to cell "RootCell"
> > Adding PCI device ff:10.7 to cell "RootCell"
> > Adding PCI device ff:13.0 to cell "RootCell"
> > Adding PCI device ff:13.1 to cell "RootCell"
> > Adding PCI device ff:13.4 to cell "RootCell"
> > Adding PCI device ff:13.5 to cell "RootCell"
> > Adding PCI device ff:16.0 to cell "RootCell"
> > Adding PCI device ff:16.1 to cell "RootCell"
> > Adding PCI device ff:16.2 to cell "RootCell"
> > Page pool usage after late setup: mem 469/32207, remap 65549/131072
> > Activating hypervisor
> > FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
> > FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020 size: 0
> ^^
> +- First problem
>
> > RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS: 10286
> > RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX:
> > 0x0000000000000000
> > RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI:
> > 0xffff8e13d38c1018
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> > CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4:
> > 0x00000000001626e0
> > EFER: 0x0000000000000d01
> > Parking CPU 7 (Cell: "RootCell")
> > FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
> > FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b4800 size: 0
> ^^
> +- Second problem
>
> Are those memory regions related to your IVSHMEM devices? If so make
> sure that the root cell is allowed to read/write them.
>
> Normally those regions are located inside the hypervisor memory area
> (memmap=3D on JH kernel cmdline) and mapped into both communication
> partner cells using JAILHOUSE_SHMEM_NET_REGIONS() inside the
> .mem_regions field of cell configurations.
>
> HTH,
> Florian
>
> > RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS: 10246
> > RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX:
> > 0x0000000000000008
> > RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI:
> > 0xffff8e13eb7b4800
> > CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> > CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4:
> > 0x00000000001626e0
> > EFER: 0x0000000000000d01
> > Parking CPU 1 (Cell: "RootCell")
> >=20
> >=20
> > =E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=BA=8C=
 UTC+8 20:43:08<jiajun huang> =E5=86=99=E9=81=93=EF=BC=9A
> > > Hi everyone,
> > > When I tried to add two ivshmem PCI devices to the root cell, a
> > > "FATAL: unsupported instruction" bug occurred. This bug is caused
> > > by x86_mmio_parse. How can I fix this bug? Below is my root-cell
> > > configuration and log output from the port.
> > >=20
> > > thanks=EF=BC=8C
> > >  Jiajun
>
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/1e24e708-b133-4785-8f07-aad465f0d7ffn%40googlegroups.com.

------=_Part_21017_649307183.1640164385216
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks!&nbsp;&nbsp;The cause of the bug is that the MMIO address is not pag=
e aligned=EF=BC=81<br><br><div class=3D"gmail_quote"><div dir=3D"auto" clas=
s=3D"gmail_attr">=E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=
=9C=9F=E4=BA=8C UTC+8 21:06:51&lt;Bezdeka, Florian> =E5=86=99=E9=81=93=EF=
=BC=9A<br/></div><blockquote class=3D"gmail_quote" style=3D"margin: 0 0 0 0=
.8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">On Tue=
, 2021-12-21 at 04:45 -0800, jiajun huang wrote:
<br>&gt;=20
<br>&gt; Initializing Jailhouse hypervisor v0.12 (294-g6af5edf-dirty) on CP=
U 5
<br>&gt; Code location: 0xfffffffff0000050
<br>&gt; Using x2APIC
<br>&gt; Page pool usage after early setup: mem 134/32207, remap 0/131072
<br>&gt; Initializing processors:
<br>&gt; =C2=A0CPU 5... (APIC ID 34) OK
<br>&gt; =C2=A0CPU 1... (APIC ID 2) OK
<br>&gt; =C2=A0CPU 3... (APIC ID 6) OK
<br>&gt; =C2=A0CPU 0... (APIC ID 0) OK
<br>&gt; =C2=A0CPU 6... (APIC ID 36) OK
<br>&gt; =C2=A0CPU 2... (APIC ID 4) OK
<br>&gt; =C2=A0CPU 7... (APIC ID 38) OK
<br>&gt; =C2=A0CPU 4... (APIC ID 32) OK
<br>&gt; Initializing unit: VT-d
<br>&gt; DMAR unit @0xfbffe000/0x1000
<br>&gt; DMAR unit @0xdfffc000/0x1000
<br>&gt; Reserving 24 interrupt(s) for device 00:1f.7 at index 0
<br>&gt; Reserving 24 interrupt(s) for device 00:05.4 at index 24
<br>&gt; Reserving 24 interrupt(s) for device 80:05.4 at index 48
<br>&gt; Initializing unit: IOAPIC
<br>&gt; Initializing unit: Cache Allocation Technology
<br>&gt; Initializing unit: PCI
<br>&gt; Adding PCI device 00:00.0 to cell &quot;RootCell&quot;
<br>&gt; Adding virtual PCI device 00:17.0 to cell &quot;RootCell&quot;
<br>&gt; Adding virtual PCI device 00:18.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:01.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 00:01.0 at index 72
<br>&gt; Adding PCI device 00:01.1 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 00:01.1 at index 74
<br>&gt; Adding PCI device 00:03.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 00:03.0 at index 76
<br>&gt; Adding PCI device 00:03.2 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 00:03.2 at index 78
<br>&gt; Adding PCI device 00:05.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:05.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:05.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:11.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:11.0 at index 80
<br>&gt; Adding PCI device 00:1a.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:1c.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1c.0 at index 81
<br>&gt; Adding PCI device 00:1c.1 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1c.1 at index 82
<br>&gt; Adding PCI device 00:1c.3 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1c.3 at index 83
<br>&gt; Adding PCI device 00:1d.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:1e.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:1f.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 00:1f.2 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 00:1f.2 at index 84
<br>&gt; Adding PCI device 00:1f.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 06:00.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 5 interrupt(s) for device 06:00.0 at index 85
<br>&gt; Adding PCI device 07:00.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 5 interrupt(s) for device 07:00.0 at index 90
<br>&gt; Adding PCI device 08:00.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 1 interrupt(s) for device 08:00.0 at index 95
<br>&gt; Adding PCI device 09:00.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:08.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:09.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0a.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0a.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0a.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0a.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0b.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0b.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0c.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0c.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0d.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0d.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0e.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0e.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:0f.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.6 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:10.7 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:13.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:13.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:13.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:13.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:16.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:16.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 7f:16.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 80:03.0 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 80:03.0 at index 96
<br>&gt; Adding PCI device 80:03.2 to cell &quot;RootCell&quot;
<br>&gt; Reserving 2 interrupt(s) for device 80:03.2 at index 98
<br>&gt; Adding PCI device 80:05.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 80:05.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device 80:05.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:08.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:09.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0a.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0a.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0a.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0a.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0b.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0b.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0c.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0c.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0d.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0d.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0e.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0e.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:0f.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.2 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.3 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.6 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:10.7 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:13.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:13.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:13.4 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:13.5 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:16.0 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:16.1 to cell &quot;RootCell&quot;
<br>&gt; Adding PCI device ff:16.2 to cell &quot;RootCell&quot;
<br>&gt; Page pool usage after late setup: mem 469/32207, remap 65549/13107=
2
<br>&gt; Activating hypervisor
<br>&gt; FATAL: unsupported instruction (0x83 0x00 0x00 0x00)
<br>&gt; FATAL: Invalid MMIO/RAM read, addr: 0x00000000538c1020 size: 0
<br>  ^^
<br>   +- First problem
<br>
<br>&gt; RIP: 0xffffffff91ac0aff RSP: 0xffffa70e496c3af0 FLAGS: 10286
<br>&gt; RAX: 0xffff8e13d38c1018 RBX: 0x00000000538c1018 RCX:
<br>&gt; 0x0000000000000000
<br>&gt; RDX: 0x0000000000000001 RSI: 0x0000000000000040 RDI:
<br>&gt; 0xffff8e13d38c1018
<br>&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
<br>&gt; CR0: 0x0000000080050033 CR3: 0x000000105704a002 CR4:
<br>&gt; 0x00000000001626e0
<br>&gt; EFER: 0x0000000000000d01
<br>&gt; Parking CPU 7 (Cell: &quot;RootCell&quot;)
<br>&gt; FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
<br>&gt; FATAL: Invalid MMIO/RAM write, addr: 0x000000006b7b4800 size: 0
<br>  ^^
<br>   +- Second problem
<br>
<br>Are those memory regions related to your IVSHMEM devices? If so make
<br>sure that the root cell is allowed to read/write them.
<br>
<br>Normally those regions are located inside the hypervisor memory area
<br>(memmap=3D on JH kernel cmdline) and mapped into both communication
<br>partner cells using JAILHOUSE_SHMEM_NET_REGIONS() inside the
<br>.mem_regions field of cell configurations.
<br>
<br>HTH,
<br>Florian
<br>
<br>&gt; RIP: 0xffffffff91c76ed6 RSP: 0xffffa70e4662f910 FLAGS: 10246
<br>&gt; RAX: 0xffff8e13eb7b4800 RBX: 0x0000000000000106 RCX:
<br>&gt; 0x0000000000000008
<br>&gt; RDX: 0x0000000000000008 RSI: 0xffff8e1bda209740 RDI:
<br>&gt; 0xffff8e13eb7b4800
<br>&gt; CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
<br>&gt; CR0: 0x0000000080050033 CR3: 0x00000008b7e0a001 CR4:
<br>&gt; 0x00000000001626e0
<br>&gt; EFER: 0x0000000000000d01
<br>&gt; Parking CPU 1 (Cell: &quot;RootCell&quot;)
<br>&gt;=20
<br>&gt;=20
<br>&gt; =E5=9C=A82021=E5=B9=B412=E6=9C=8821=E6=97=A5=E6=98=9F=E6=9C=9F=E4=
=BA=8C UTC+8 20:43:08&lt;jiajun huang&gt; =E5=86=99=E9=81=93=EF=BC=9A
<br>&gt; &gt; Hi everyone,
<br>&gt; &gt; When I tried to add two ivshmem PCI devices to the root cell,=
 a
<br>&gt; &gt; &quot;FATAL: unsupported instruction&quot; bug occurred. This=
 bug is caused
<br>&gt; &gt; by x86_mmio_parse. How can I fix this bug? Below is my root-c=
ell
<br>&gt; &gt; configuration and log output from the port.
<br>&gt; &gt;=20
<br>&gt; &gt; thanks=EF=BC=8C
<br>&gt; &gt; =C2=A0Jiajun
<br>
<br></blockquote></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/1e24e708-b133-4785-8f07-aad465f0d7ffn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/1e24e708-b133-4785-8f07-aad465f0d7ffn%40googlegroups.co=
m</a>.<br />

------=_Part_21017_649307183.1640164385216--

------=_Part_21016_1447551593.1640164385216--
