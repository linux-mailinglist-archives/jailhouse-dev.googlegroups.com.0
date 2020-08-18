Return-Path: <jailhouse-dev+bncBCI7XTXZ6ADBB6GQ534QKGQEFCO434Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CBE24828E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 12:07:53 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id b1sf14039057qto.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 18 Aug 2020 03:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SNmCr4tGQE4Oo59zHiAPkS9tJvJcF7otQwfQ49L9Cpk=;
        b=DtahsYux6R2qCgHXIGmr95s9xwTQfkxP6Vj4+fq0jcsO1coDs3NImCffAMboqCgCb5
         /eYGQrBJYWHmUOLiHdFrI5WqsrlQ67lrZIh36MxQx48daTbvVGNVe10+qauXBjTvEZR4
         RhmubsV3MG9u4R3LGKdGf8Cm3g2nypM6lHh/QPnYt5/JvIF1Q/badeqZ6NOBpB7uPhEH
         SYc9tgK2qgsHlL0lN5K9/LSbVwQrr2ZMBiAB5sTDJa8lqkGNLylUZ6VAO1mWdYA7PxhC
         XaHjNdOdLt8P6t2eRhZ/MJz4IGYPF/iTSvJHg0RzS+HdBRgE+3zflgMTjP3sdNTaIIFm
         RFCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:in-reply-to:references:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SNmCr4tGQE4Oo59zHiAPkS9tJvJcF7otQwfQ49L9Cpk=;
        b=l1eYFpTPv8PN1cPTK1cJpPt38/E7QpYKSPNe168gjqscVcBgqbxRV1f0GR3czmSOrT
         +f+DMtf/I6tZUL+jaaaK7o7nnqtIjixAXvMITuc5oMf4eZB8e2yt4qa2mGSZ2+kK8x94
         y6BvUQh6vj4+G2KY5Cd6r4YxfSBmvewI4DnN0XwUlcMt0KeBGRuhikDQDqxW48bnEKzI
         jVUy5Xl3PqK2YoNZOtTbcH5R3F5Z91kY0ZM9UzWJAJ6g0xbewNqcdigB49Uq5JDfuHP8
         tT3gX5lFxpagkSA3zZtaJsJmGToIL2U5hxbESdFXIkN00QFeJ53VJhbtytMInVQv9W1o
         Aaqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=SNmCr4tGQE4Oo59zHiAPkS9tJvJcF7otQwfQ49L9Cpk=;
        b=Znpen9aCmNRzArhtP31Jzu68CMzTOf4sY7XLUzJZ+XGgzFlHSRvKWSikKKMmatC3Em
         GIVycHBP3x5EtRrSFyu9MAk0yskW7INpK9yNyFamIRR64xfU/srXpqXZb+GWpzZpNxyG
         PfSfTB4CMVNq5Ff9mT94X7o21FSjuyrPy3bTggE7EZOY9rZaAsqTXYrI8CIt91HZhTlQ
         NCYQmZRXwHuKx6bEcKxDKeVDjwYMJkWKxa9JYxlNvk3M9/+ear7oyqhUC4Cth7kSbLRg
         wS15VLKtZLESFSD3A0TOrAHqjpT8HSjN9Zwpd6uIrBoyRM4RxduWjpy2zpPzhParjz1F
         0vkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531+OnLxpSwmE+c5uPwuO6KrzknjUVxaF1ka53kA4Qt81iYkLjux
	D9d+XAp0qy3u+h1FinnSqOc=
X-Google-Smtp-Source: ABdhPJxVHL0HFv+PYm3h3RGBumvNbo4Mf7ZELUzOV74TyIyRoM+v9/XEifYzJO7zelXHXLwmqU0xqA==
X-Received: by 2002:ad4:564d:: with SMTP id bl13mr17644740qvb.60.1597745272596;
        Tue, 18 Aug 2020 03:07:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a2c2:: with SMTP id l185ls214544qke.9.gmail; Tue, 18 Aug
 2020 03:07:51 -0700 (PDT)
X-Received: by 2002:a37:ad07:: with SMTP id f7mr16369086qkm.228.1597745271740;
        Tue, 18 Aug 2020 03:07:51 -0700 (PDT)
Date: Tue, 18 Aug 2020 03:07:50 -0700 (PDT)
From: Jan-Marc Stranz <stranzjanmarc@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f2264785-a575-42ab-b129-343085d8bdcen@googlegroups.com>
In-Reply-To: <5775d148-cd2c-6764-9242-e1742bc018a6@siemens.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
 <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
 <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
 <df0e6993-5f54-4d99-95f6-b3a36ce677d1o@googlegroups.com>
 <5775d148-cd2c-6764-9242-e1742bc018a6@siemens.com>
Subject: Re: Starting jailhouse on real hardware without QEMU
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_100_1251200391.1597745270689"
X-Original-Sender: stranzjanmarc@gmail.com
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

------=_Part_100_1251200391.1597745270689
Content-Type: multipart/alternative; 
	boundary="----=_Part_101_646491246.1597745270689"

------=_Part_101_646491246.1597745270689
Content-Type: text/plain; charset="UTF-8"

I have now made a few calls to the command "sudo jailhouse enable 
$HOME/Projects/Jailhouse/jailhouse.git /configs /x86/sysconfig.cell".
Every time the whole Linux PC freezes.
The messages that are output via the COM interface show the following:

...
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid MMIO/RAM write, addr: 0x00000000feb82008 size: 4
RIP: 0xffffffffa14f3bb6 RSP: 0xffffb551c02a0cf0 FLAGS: 2
RAX: 0xffffb551c0080000 RBX: 0x0000000000000001 RCX: 0x000000003000000b
RDX: 0xffff97694adc0000 RSI: 0x3000000b00000000 RDI: 0x7ffffffffffff003
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000003cca84000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 5 (Cell: "RootCell")
...

or mostly

...
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid PIO read, port: 1771 size: 1
RIP: 0xffffffff9d8f5f48 RSP: 0xffffb84900127dd8 FLAGS: 93
RAX: 0x0000000000000000 RBX: 0x0000000000000002 RCX: 0x0000000000000068
RDX: 0x0000000000001771 RSI: 0xffffffff9e568b80 RDI: 0xffff898449e90498
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000003d7c1e000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 1 (Cell: "RootCell")
...

I've attached the system configuration and 4 log files.

What should be changed in the system configuration?
Port 1771 (0x06eb) is actually not used in the system configuration, is it?

I would be very grateful for any advice!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f2264785-a575-42ab-b129-343085d8bdcen%40googlegroups.com.

------=_Part_101_646491246.1597745270689
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div>I have now made a few calls to the command "<span style=3D"font-family=
: Courier New;">sudo jailhouse enable $HOME/Projects/Jailhouse/jailhouse.gi=
t /configs /x86/sysconfig.cell</span>".</div>Every time the whole Linux PC =
freezes.<br><div>The messages that are output via the COM interface show th=
e following:</div><div><br></div><div><span style=3D"font-family: Courier N=
ew;">...<br></span></div><div><span style=3D"font-family: Courier New;">Pag=
e pool usage after late setup: mem 359/978, remap 16517/131072<br>FATAL: In=
valid MMIO/RAM write, addr: 0x00000000feb82008 size: 4<br>RIP: 0xffffffffa1=
4f3bb6 RSP: 0xffffb551c02a0cf0 FLAGS: 2<br>RAX: 0xffffb551c0080000 RBX: 0x0=
000000000000001 RCX: 0x000000003000000b<br>RDX: 0xffff97694adc0000 RSI: 0x3=
000000b00000000 RDI: 0x7ffffffffffff003<br>CS: 10 BASE: 0x0000000000000000 =
AR-BYTES: 29b EFER.LMA 1<br>CR0: 0x0000000080050033 CR3: 0x00000003cca84000=
 CR4: 0x00000000003406e0<br>EFER: 0x0000000000001d01<br>Parking CPU 5 (Cell=
: "RootCell")</span></div><div><span style=3D"font-family: Courier New;">..=
.</span></div><div><br></div><div>or mostly<br></div><div><br></div><div><s=
pan style=3D"font-family: Courier New;">...</span></div><div><span style=3D=
"font-family: Courier New;">Page pool usage after late setup: mem 359/978, =
remap 16517/131072<br>FATAL: Invalid PIO read, port: 1771 size: 1<br>RIP: 0=
xffffffff9d8f5f48 RSP: 0xffffb84900127dd8 FLAGS: 93<br>RAX: 0x0000000000000=
000 RBX: 0x0000000000000002 RCX: 0x0000000000000068<br>RDX: 0x0000000000001=
771 RSI: 0xffffffff9e568b80 RDI: 0xffff898449e90498<br>CS: 10 BASE: 0x00000=
00000000000 AR-BYTES: 29b EFER.LMA 1<br>CR0: 0x0000000080050033 CR3: 0x0000=
0003d7c1e000 CR4: 0x00000000003406e0<br>EFER: 0x0000000000001d01<br>Parking=
 CPU 1 (Cell: "RootCell")</span></div><div><span style=3D"font-family: Cour=
ier New;">...</span></div><div><br></div><div>I've attached the system conf=
iguration and 4 log files.</div><div><br></div>What should be changed in th=
e system configuration?<br><div>Port 1771 (0x06eb) is actually not used in =
the system configuration, is it?</div><div><br></div><div>I would be very g=
rateful for any advice!</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/f2264785-a575-42ab-b129-343085d8bdcen%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/f2264785-a575-42ab-b129-343085d8bdcen%40googlegroups.co=
m</a>.<br />

------=_Part_101_646491246.1597745270689--

------=_Part_100_1251200391.1597745270689
Content-Type: text/plain; charset=US-ASCII; name="jailhouse enable 1.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jailhouse enable 1.log"
X-Attachment-Id: 4d74d9b2-bd57-4e31-9c7e-7da175a9f02f
Content-ID: <4d74d9b2-bd57-4e31-9c7e-7da175a9f02f>

Initializing Jailhouse hypervisor v0.12 (81-g9b4efcf4-dirty) on CPU 14
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 123/978, remap 1/131072
Initializing processors:
 CPU 14... (APIC ID 14) OK
 CPU 2... (APIC ID 2) OK
 CPU 3... (APIC ID 3) OK
 CPU 1... (APIC ID 1) OK
 CPU 0... (APIC ID 0) OK
 CPU 8... (APIC ID 8) OK
 CPU 9... (APIC ID 9) OK
 CPU 11... (APIC ID 11) OK
 CPU 10... (APIC ID 10) OK
 CPU 4... (APIC ID 4) OK
 CPU 5... (APIC ID 5) OK
 CPU 6... (APIC ID 6) OK
 CPU 12... (APIC ID 12) OK
 CPU 15... (APIC ID 15) OK
 CPU 7... (APIC ID 7) OK
 CPU 13... (APIC ID 13) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xfeb80000/0x80000
Initializing unit: IOAPIC
Initializing unit: Test device
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.3 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
Adding PCI device 00:03.1 to cell "RootCell"
Adding PCI device 00:04.0 to cell "RootCell"
Adding PCI device 00:07.0 to cell "RootCell"
Adding PCI device 00:07.1 to cell "RootCell"
Adding PCI device 00:08.0 to cell "RootCell"
Adding PCI device 00:08.1 to cell "RootCell"
Adding PCI device 00:14.0 to cell "RootCell"
Adding PCI device 00:14.3 to cell "RootCell"
Adding PCI device 00:18.0 to cell "RootCell"
Adding PCI device 00:18.1 to cell "RootCell"
Adding PCI device 00:18.2 to cell "RootCell"
Adding PCI device 00:18.3 to cell "RootCell"
Adding PCI device 00:18.4 to cell "RootCell"
Adding PCI device 00:18.5 to cell "RootCell"
Adding PCI device 00:18.6 to cell "RootCell"
Adding PCI device 00:18.7 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 03:00.1 to cell "RootCell"
Adding PCI device 03:00.2 to cell "RootCell"
Adding PCI device 1d:00.0 to cell "RootCell"
Adding PCI device 1d:04.0 to cell "RootCell"
Adding PCI device 1d:05.0 to cell "RootCell"
Adding PCI device 1d:06.0 to cell "RootCell"
Adding PCI device 1d:07.0 to cell "RootCell"
Adding PCI device 22:00.0 to cell "RootCell"
Adding PCI device 25:00.0 to cell "RootCell"
Adding PCI device 27:00.0 to cell "RootCell"
Adding PCI device 27:00.1 to cell "RootCell"
Adding PCI device 28:00.0 to cell "RootCell"
Adding PCI device 28:00.2 to cell "RootCell"
Adding PCI device 28:00.3 to cell "RootCell"
Adding PCI device 29:00.0 to cell "RootCell"
Adding PCI device 29:00.2 to cell "RootCell"
Adding PCI device 29:00.3 to cell "RootCell"
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid MMIO/RAM write, addr: 0x00000000feb82008 size: 4
RIP: 0xffffffffa14f3bb6 RSP: 0xffffb551c02a0cf0 FLAGS: 2
RAX: 0xffffb551c0080000 RBX: 0x0000000000000001 RCX: 0x000000003000000b
RDX: 0xffff97694adc0000 RSI: 0x3000000b00000000 RDI: 0x7ffffffffffff003
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000003cca84000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 5 (Cell: "RootCell")
Ignoring NMI IPI to CPU 0
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 5
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 8
Ignoring NMI IPI to CPU 9
Ignoring NMI IPI to CPU 10
Ignoring NMI IPI to CPU 11
Ignoring NMI IPI to CPU 12
Ignoring NMI IPI to CPU 13
Ignoring NMI IPI to CPU 14
Ignoring NMI IPI to CPU 15

------=_Part_100_1251200391.1597745270689
Content-Type: text/plain; charset=US-ASCII; name="jailhouse enable 4.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jailhouse enable 4.log"
X-Attachment-Id: 5622c987-63cf-474d-a238-693cf8ca98cb
Content-ID: <5622c987-63cf-474d-a238-693cf8ca98cb>

Initializing Jailhouse hypervisor v0.12 (81-g9b4efcf4-dirty) on CPU 4
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 123/978, remap 1/131072
Initializing processors:
 CPU 4... (APIC ID 4) OK
 CPU 8... (APIC ID 8) OK
 CPU 11... (APIC ID 11) OK
 CPU 10... (APIC ID 10) OK
 CPU 14... (APIC ID 14) OK
 CPU 15... (APIC ID 15) OK
 CPU 3... (APIC ID 3) OK
 CPU 6... (APIC ID 6) OK
 CPU 7... (APIC ID 7) OK
 CPU 5... (APIC ID 5) OK
 CPU 9... (APIC ID 9) OK
 CPU 0... (APIC ID 0) OK
 CPU 2... (APIC ID 2) OK
 CPU 13... (APIC ID 13) OK
 CPU 12... (APIC ID 12) OK
 CPU 1... (APIC ID 1) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xfeb80000/0x80000
Initializing unit: IOAPIC
Initializing unit: Test device
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.3 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
Adding PCI device 00:03.1 to cell "RootCell"
Adding PCI device 00:04.0 to cell "RootCell"
Adding PCI device 00:07.0 to cell "RootCell"
Adding PCI device 00:07.1 to cell "RootCell"
Adding PCI device 00:08.0 to cell "RootCell"
Adding PCI device 00:08.1 to cell "RootCell"
Adding PCI device 00:14.0 to cell "RootCell"
Adding PCI device 00:14.3 to cell "RootCell"
Adding PCI device 00:18.0 to cell "RootCell"
Adding PCI device 00:18.1 to cell "RootCell"
Adding PCI device 00:18.2 to cell "RootCell"
Adding PCI device 00:18.3 to cell "RootCell"
Adding PCI device 00:18.4 to cell "RootCell"
Adding PCI device 00:18.5 to cell "RootCell"
Adding PCI device 00:18.6 to cell "RootCell"
Adding PCI device 00:18.7 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 03:00.1 to cell "RootCell"
Adding PCI device 03:00.2 to cell "RootCell"
Adding PCI device 1d:00.0 to cell "RootCell"
Adding PCI device 1d:04.0 to cell "RootCell"
Adding PCI device 1d:05.0 to cell "RootCell"
Adding PCI device 1d:06.0 to cell "RootCell"
Adding PCI device 1d:07.0 to cell "RootCell"
Adding PCI device 22:00.0 to cell "RootCell"
Adding PCI device 25:00.0 to cell "RootCell"
Adding PCI device 27:00.0 to cell "RootCell"
Adding PCI device 27:00.1 to cell "RootCell"
Adding PCI device 28:00.0 to cell "RootCell"
Adding PCI device 28:00.2 to cell "RootCell"
Adding PCI device 28:00.3 to cell "RootCell"
Adding PCI device 29:00.0 to cell "RootCell"
Adding PCI device 29:00.2 to cell "RootCell"
Adding PCI device 29:00.3 to cell "RootCell"
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid PIO read, port: 1771 size: 1
RIP: 0xffffffffbd2f5f48 RSP: 0xffffad3840157dd8 FLAGS: 93
RAX: 0x0000000000000000 RBX: 0x0000000000000002 RCX: 0x0000000000000068
RDX: 0x0000000000001771 RSI: 0xffffffffbdf68b80 RDI: 0xffff8b7a89e92c98
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000004057c4000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 7 (Cell: "RootCell")
Ignoring NMI IPI to CPU 0
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 5
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
Ignoring NMI IPI to CPU 8
Ignoring NMI IPI to CPU 9
Ignoring NMI IPI to CPU 10
Ignoring NMI IPI to CPU 11
Ignoring NMI IPI to CPU 12
Ignoring NMI IPI to CPU 13
Ignoring NMI IPI to CPU 14
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2000000000002500, Operand 2: de4dd110
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002500, Operand 2: d8cf8040
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002500, Operand 2: de4dd100
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2008000000002500, Operand 2: fffffffdf8000000
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2000000000002803, Operand 2: fedd9990
 DeviceId (bus:dev.func): 28:00.3
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9180
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb91a0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb91c0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb91e0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9200
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9220
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9240
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9260
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9280
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb92a0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb92c0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb92e0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9300
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9330
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9350
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9370
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9390
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb93b0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb93d0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb93f0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9410
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9430
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9450
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9470
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9480
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb94a0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb94c0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb94e0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9500
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9520
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9540
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9560
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9580
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb95a0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb95c0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb95e0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9600
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9620
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9640
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9660
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9680
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb96a0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb96c0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb96e0
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9700
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9720
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9740
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9760
 DeviceId (bus:dev.func): 27:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002700, Operand 2: fedb9780

------=_Part_100_1251200391.1597745270689
Content-Type: text/plain; charset=US-ASCII; name="jailhouse enable 3.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jailhouse enable 3.log"
X-Attachment-Id: c3361268-ad3c-47ce-b0aa-b0780df85501
Content-ID: <c3361268-ad3c-47ce-b0aa-b0780df85501>

Initializing Jailhouse hypervisor v0.12 (81-g9b4efcf4-dirty) on CPU 12
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 123/978, remap 1/131072
Initializing processors:
 CPU 12... (APIC ID 12) OK
 CPU 1... (APIC ID 1) OK
 CPU 0... (APIC ID 0) OK
 CPU 7... (APIC ID 7) OK
 CPU 6... (APIC ID 6) OK
 CPU 11... (APIC ID 11) OK
 CPU 10... (APIC ID 10) OK
 CPU 8... (APIC ID 8) OK
 CPU 9... (APIC ID 9) OK
 CPU 15... (APIC ID 15) OK
 CPU 14... (APIC ID 14) OK
 CPU 13... (APIC ID 13) OK
 CPU 5... (APIC ID 5) OK
 CPU 2... (APIC ID 2) OK
 CPU 3... (APIC ID 3) OK
 CPU 4... (APIC ID 4) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xfeb80000/0x80000
Initializing unit: IOAPIC
Initializing unit: Test device
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.3 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
Adding PCI device 00:03.1 to cell "RootCell"
Adding PCI device 00:04.0 to cell "RootCell"
Adding PCI device 00:07.0 to cell "RootCell"
Adding PCI device 00:07.1 to cell "RootCell"
Adding PCI device 00:08.0 to cell "RootCell"
Adding PCI device 00:08.1 to cell "RootCell"
Adding PCI device 00:14.0 to cell "RootCell"
Adding PCI device 00:14.3 to cell "RootCell"
Adding PCI device 00:18.0 to cell "RootCell"
Adding PCI device 00:18.1 to cell "RootCell"
Adding PCI device 00:18.2 to cell "RootCell"
Adding PCI device 00:18.3 to cell "RootCell"
Adding PCI device 00:18.4 to cell "RootCell"
Adding PCI device 00:18.5 to cell "RootCell"
Adding PCI device 00:18.6 to cell "RootCell"
Adding PCI device 00:18.7 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 03:00.1 to cell "RootCell"
Adding PCI device 03:00.2 to cell "RootCell"
Adding PCI device 1d:00.0 to cell "RootCell"
Adding PCI device 1d:04.0 to cell "RootCell"
Adding PCI device 1d:05.0 to cell "RootCell"
Adding PCI device 1d:06.0 to cell "RootCell"
Adding PCI device 1d:07.0 to cell "RootCell"
Adding PCI device 22:00.0 to cell "RootCell"
Adding PCI device 25:00.0 to cell "RootCell"
Adding PCI device 27:00.0 to cell "RootCell"
Adding PCI device 27:00.1 to cell "RootCell"
Adding PCI device 28:00.0 to cell "RootCell"
Adding PCI device 28:00.2 to cell "RootCell"
Adding PCI device 28:00.3 to cell "RootCell"
Adding PCI device 29:00.0 to cell "RootCell"
Adding PCI device 29:00.2 to cell "RootCell"
Adding PCI device 29:00.3 to cell "RootCell"
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid PIO read, port: 1771 size: 1
RIP: 0xffffffffa30f5f48 RSP: 0xffffa7218013fdd8 FLAGS: 93
RAX: 0x0000000000000000 RBX: 0x0000000000000002 RCX: 0x0000000000000068
RDX: 0x0000000000001771 RSI: 0xffffffffa3d68b80 RDI: 0xffff902989e9a498
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000003cc9d8000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 4 (Cell: "RootCell")
Ignoring NMI IPI to CPU 0
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
Ignoring NMI IPI to CPU 8
Ignoring NMI IPI to CPU 9
Ignoring NMI IPI to CPU 10
Ignoring NMI IPI to CPU 11
Ignoring NMI IPI to CPU 12
Ignoring NMI IPI to CPU 13
Ignoring NMI IPI to CPU 14
Ignoring NMI IPI to CPU 15
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2000000000002803, Operand 2: fedf2880
 DeviceId (bus:dev.func): 28:00.3

------=_Part_100_1251200391.1597745270689
Content-Type: text/plain; charset=US-ASCII; name="jailhouse enable 2.log"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="jailhouse enable 2.log"
X-Attachment-Id: df6ad1e3-d1b6-4cf7-811f-366ef5733ed5
Content-ID: <df6ad1e3-d1b6-4cf7-811f-366ef5733ed5>

Initializing Jailhouse hypervisor v0.12 (81-g9b4efcf4-dirty) on CPU 14
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 123/978, remap 1/131072
Initializing processors:
 CPU 14... (APIC ID 14) OK
 CPU 9... (APIC ID 9) OK
 CPU 12... (APIC ID 12) OK
 CPU 4... (APIC ID 4) OK
 CPU 5... (APIC ID 5) OK
 CPU 1... (APIC ID 1) OK
 CPU 0... (APIC ID 0) OK
 CPU 3... (APIC ID 3) OK
 CPU 2... (APIC ID 2) OK
 CPU 8... (APIC ID 8) OK
 CPU 13... (APIC ID 13) OK
 CPU 7... (APIC ID 7) OK
 CPU 10... (APIC ID 10) OK
 CPU 11... (APIC ID 11) OK
 CPU 15... (APIC ID 15) OK
 CPU 6... (APIC ID 6) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xfeb80000/0x80000
Initializing unit: IOAPIC
Initializing unit: Test device
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.3 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
Adding PCI device 00:03.1 to cell "RootCell"
Adding PCI device 00:04.0 to cell "RootCell"
Adding PCI device 00:07.0 to cell "RootCell"
Adding PCI device 00:07.1 to cell "RootCell"
Adding PCI device 00:08.0 to cell "RootCell"
Adding PCI device 00:08.1 to cell "RootCell"
Adding PCI device 00:14.0 to cell "RootCell"
Adding PCI device 00:14.3 to cell "RootCell"
Adding PCI device 00:18.0 to cell "RootCell"
Adding PCI device 00:18.1 to cell "RootCell"
Adding PCI device 00:18.2 to cell "RootCell"
Adding PCI device 00:18.3 to cell "RootCell"
Adding PCI device 00:18.4 to cell "RootCell"
Adding PCI device 00:18.5 to cell "RootCell"
Adding PCI device 00:18.6 to cell "RootCell"
Adding PCI device 00:18.7 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 03:00.1 to cell "RootCell"
Adding PCI device 03:00.2 to cell "RootCell"
Adding PCI device 1d:00.0 to cell "RootCell"
Adding PCI device 1d:04.0 to cell "RootCell"
Adding PCI device 1d:05.0 to cell "RootCell"
Adding PCI device 1d:06.0 to cell "RootCell"
Adding PCI device 1d:07.0 to cell "RootCell"
Adding PCI device 22:00.0 to cell "RootCell"
Adding PCI device 25:00.0 to cell "RootCell"
Adding PCI device 27:00.0 to cell "RootCell"
Adding PCI device 27:00.1 to cell "RootCell"
Adding PCI device 28:00.0 to cell "RootCell"
Adding PCI device 28:00.2 to cell "RootCell"
Adding PCI device 28:00.3 to cell "RootCell"
Adding PCI device 29:00.0 to cell "RootCell"
Adding PCI device 29:00.2 to cell "RootCell"
Adding PCI device 29:00.3 to cell "RootCell"
Page pool usage after late setup: mem 359/978, remap 16517/131072
FATAL: Invalid PIO read, port: 1771 size: 1
RIP: 0xffffffff9d8f5f48 RSP: 0xffffb84900127dd8 FLAGS: 93
RAX: 0x0000000000000000 RBX: 0x0000000000000002 RCX: 0x0000000000000068
RDX: 0x0000000000001771 RSI: 0xffffffff9e568b80 RDI: 0xffff898449e90498
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000003d7c1e000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 1 (Cell: "RootCell")
Ignoring NMI IPI to CPU 0
Ignoring NMI IPI to CPU 1
Ignoring NMI IPI to CPU 2
Ignoring NMI IPI to CPU 3
Ignoring NMI IPI to CPU 4
Ignoring NMI IPI to CPU 6
Ignoring NMI IPI to CPU 7
Ignoring NMI IPI to CPU 8
Ignoring NMI IPI to CPU 9
Ignoring NMI IPI to CPU 10
Ignoring NMI IPI to CPU 11
Ignoring NMI IPI to CPU 12
Ignoring NMI IPI to CPU 13
Ignoring NMI IPI to CPU 14
Ignoring NMI IPI to CPU 15
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2000000000002500, Operand 2: d8f24f10
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002500, Operand 2: d637c000
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002500, Operand 2: d8f24f00
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2008000000002500, Operand 2: fffffffdf8000000
 DeviceId (bus:dev.func): 25:00.0
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2008000000002803, Operand 2: fffffffdf8000000
 DeviceId (bus:dev.func): 28:00.3
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2020000000002803, Operand 2: fede50c0
 DeviceId (bus:dev.func): 28:00.3

------=_Part_100_1251200391.1597745270689
Content-Type: text/x-csrc; charset=US-ASCII; name=sysconfig.c
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename=sysconfig.c
X-Attachment-Id: fd1d58dd-345c-4602-8dbf-8bc64d5dda57
Content-ID: <fd1d58dd-345c-4602-8dbf-8bc64d5dda57>

/*
 * Jailhouse, a Linux-based partitioning hypervisor
 *
 * Copyright (c) Siemens AG, 2014-2017
 *
 * This work is licensed under the terms of the GNU GPL, version 2.  See
 * the COPYING file in the top-level directory.
 *
 * Alternatively, you can use or redistribute this file under the following
 * BSD license:
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
 * THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Configuration for System manufacturer System Product Name
 * created with '/usr/local/libexec/jailhouse/jailhouse config create configs/x86/sysconfig.c'
 *
 * NOTE: This config expects the following to be appended to your kernel cmdline
 *       "memmap=0x5200000$0x3b000000"
 */

#include <jailhouse/types.h>
#include <jailhouse/cell-config.h>

struct {
	struct jailhouse_system header;
	__u64 cpus[1];
	struct jailhouse_memory mem_regions[37];
	struct jailhouse_irqchip irqchips[2];
	struct jailhouse_pio pio_regions[8];
	struct jailhouse_pci_device pci_devices[39];
	struct jailhouse_pci_capability pci_caps[91];
} __attribute__((packed)) config = {
	.header = {
		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
		.revision = JAILHOUSE_CONFIG_REVISION,
		.flags = JAILHOUSE_SYS_VIRTUAL_DEBUG_CONSOLE,
		.hypervisor_memory = {
			.phys_start = 0x3b000000,
			.size = 0x600000,
		},
		.debug_console = {
			.address = 0x3f8,
			.type = JAILHOUSE_CON_TYPE_8250,
			.flags = JAILHOUSE_CON_ACCESS_PIO |
				 JAILHOUSE_CON_REGDIST_1,
		},
		.platform_info = {
			.pci_mmconfig_base = 0xf8000000,
			.pci_mmconfig_end_bus = 0x3f,
			.iommu_units = {
				{
					.type = JAILHOUSE_IOMMU_AMD,
					.base = 0xfeb80000,
					.size = 0x80000,
					.amd.bdf = 0x2,
					.amd.base_cap = 0x40,
					.amd.msi_cap = 0x64,
					.amd.features = 0x80048f6f,
				},
			},
			.x86 = {
				.pm_timer_address = 0x808,
				.vtd_interrupt_limit = 256,
			},
		},
		.root_cell = {
			.name = "RootCell",
			.cpu_set_size = sizeof(config.cpus),
			.num_memory_regions = ARRAY_SIZE(config.mem_regions),
			.num_irqchips = ARRAY_SIZE(config.irqchips),
			.num_pio_regions = ARRAY_SIZE(config.pio_regions),
			.num_pci_devices = ARRAY_SIZE(config.pci_devices),
			.num_pci_caps = ARRAY_SIZE(config.pci_caps),
		},
	},

	.cpus = {
		0x000000000000ffff,
	},

	.mem_regions = {
		/* MemRegion: 00000000-0009ffff : System RAM */
		{
			.phys_start = 0x0,
			.virt_start = 0x0,
			.size = 0xa0000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 00100000-09cfffff : System RAM */
		{
			.phys_start = 0x100000,
			.virt_start = 0x100000,
			.size = 0x9c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 0a000000-3affffff : System RAM */
		{
			.phys_start = 0xa000000,
			.virt_start = 0xa000000,
			.size = 0x31000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 40200000-9ff05017 : System RAM */
		{
			.phys_start = 0x40200000,
			.virt_start = 0x40200000,
			.size = 0x5fd06000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 9ff05018-9ff24857 : System RAM */
		{
			.phys_start = 0x9ff05018,
			.virt_start = 0x9ff05018,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 9ff24858-9ff25017 : System RAM */
		{
			.phys_start = 0x9ff24858,
			.virt_start = 0x9ff24858,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 9ff25018-9ff33057 : System RAM */
		{
			.phys_start = 0x9ff25018,
			.virt_start = 0x9ff25018,
			.size = 0xf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 9ff33058-d5745fff : System RAM */
		{
			.phys_start = 0x9ff33058,
			.virt_start = 0x9ff33058,
			.size = 0x35813000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d5746000-d575dfff : ACPI Tables */
		{
			.phys_start = 0xd5746000,
			.virt_start = 0xd5746000,
			.size = 0x18000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: d57e0000-d8dfbfff : System RAM */
		{
			.phys_start = 0xd57e0000,
			.virt_start = 0xd57e0000,
			.size = 0x361c000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: d8dfd000-dab00fff : System RAM */
		{
			.phys_start = 0xd8dfd000,
			.virt_start = 0xd8dfd000,
			.size = 0x1d04000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dac79000-dac81fff : ACPI Tables */
		{
			.phys_start = 0xdac79000,
			.virt_start = 0xdac79000,
			.size = 0x9000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dac82000-dad86fff : System RAM */
		{
			.phys_start = 0xdac82000,
			.virt_start = 0xdac82000,
			.size = 0x105000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: dad87000-db145fff : ACPI Non-volatile Storage */
		{
			.phys_start = 0xdad87000,
			.virt_start = 0xdad87000,
			.size = 0x3bf000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: dbe9e000-ddffffff : System RAM */
		{
			.phys_start = 0xdbe9e000,
			.virt_start = 0xdbe9e000,
			.size = 0x2162000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: e0000000-efffffff : 0000:27:00.0 */
		{
			.phys_start = 0xe0000000,
			.virt_start = 0xe0000000,
			.size = 0x10000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f1000000-f12fffff : efifb */
		{
			.phys_start = 0xf1000000,
			.virt_start = 0xf1000000,
			.size = 0x300000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f6000000-f6ffffff : nvidia */
		{
			.phys_start = 0xf6000000,
			.virt_start = 0xf6000000,
			.size = 0x1000000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7080000-f7083fff : ICH HD audio */
		{
			.phys_start = 0xf7080000,
			.virt_start = 0xf7080000,
			.size = 0x4000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7200000-f72fffff : xhci-hcd */
		{
			.phys_start = 0xf7200000,
			.virt_start = 0xf7200000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7300000-f73fffff : ccp */
		{
			.phys_start = 0xf7300000,
			.virt_start = 0xf7300000,
			.size = 0x100000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7401000-f7401fff : ccp */
		{
			.phys_start = 0xf7401000,
			.virt_start = 0xf7401000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7501000-f7503fff : 0000:25:00.0 */
		{
			.phys_start = 0xf7501000,
			.virt_start = 0xf7501000,
			.size = 0x3000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7504000-f7504fff : r8169 */
		{
			.phys_start = 0xf7504000,
			.virt_start = 0xf7504000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7600000-f7607fff : xhci-hcd */
		{
			.phys_start = 0xf7600000,
			.virt_start = 0xf7600000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7700000-f777ffff : 0000:03:00.1 */
		{
			.phys_start = 0xf7700000,
			.virt_start = 0xf7700000,
			.size = 0x80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7780000-f779ffff : ahci */
		{
			.phys_start = 0xf7780000,
			.virt_start = 0xf7780000,
			.size = 0x20000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f77a0000-f77a7fff : xhci-hcd */
		{
			.phys_start = 0xf77a0000,
			.virt_start = 0xf77a0000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7800000-f7807fff : ICH HD audio */
		{
			.phys_start = 0xf7800000,
			.virt_start = 0xf7800000,
			.size = 0x8000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: f7808000-f7808fff : ahci */
		{
			.phys_start = 0xf7808000,
			.virt_start = 0xf7808000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fed00000-fed003ff : HPET 0 */
		{
			.phys_start = 0xfed00000,
			.virt_start = 0xfed00000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: fedc0000-fedc0fff : pnp 00:05 */
		{
			.phys_start = 0xfedc0000,
			.virt_start = 0xfedc0000,
			.size = 0x1000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
		/* MemRegion: 100000000-23f1fffff : System RAM */
		{
			.phys_start = 0x100000000,
			.virt_start = 0x100000000,
			.size = 0x13f200000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 23f200000-241ffffff : Kernel */
		{
			.phys_start = 0x23f200000,
			.virt_start = 0x23f200000,
			.size = 0x2e00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 242000000-41f37ffff : System RAM */
		{
			.phys_start = 0x242000000,
			.virt_start = 0x242000000,
			.size = 0x1dd380000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 41f380000-41fffffff : RAM buffer */
		{
			.phys_start = 0x41f380000,
			.virt_start = 0x41f380000,
			.size = 0xc80000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA,
		},
		/* MemRegion: 3b600000-401fffff : JAILHOUSE Inmate Memory */
		{
			.phys_start = 0x3b600000,
			.virt_start = 0x3b600000,
			.size = 0x4c00000,
			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
		},
	},

	.irqchips = {
		/* IOAPIC 17, GSI base 0 */
		{
			.address = 0xfec00000,
			.id = 0xa0,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
		/* IOAPIC 18, GSI base 24 */
		{
			.address = 0xfec01000,
			.id = 0x1,
			.pin_bitmap = {
				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff
			},
		},
	},

	.pio_regions = {
		/* Port I/O: 0000-001f : dma1 */
		/* PIO_RANGE(0x0, 0x20), */
		/* Port I/O: 0020-0021 : pic1 */
		/* PIO_RANGE(0x20, 0x2), */
		/* Port I/O: 0040-0043 : timer0 */
		PIO_RANGE(0x40, 0x4),
		/* Port I/O: 0050-0053 : timer1 */
		/* PIO_RANGE(0x50, 0x4), */
		/* Port I/O: 0060-0060 : keyboard */
		PIO_RANGE(0x60, 0x1),
		/* Port I/O: 0061-0061 : PNP0800:00 */
		PIO_RANGE(0x61, 0x1),
		/* Port I/O: 0064-0064 : keyboard */
		PIO_RANGE(0x64, 0x1),
		/* Port I/O: 0070-0071 : rtc0 */
		PIO_RANGE(0x70, 0x2),
		/* Port I/O: 0080-008f : dma page reg */
		/* PIO_RANGE(0x80, 0x10), */
		/* Port I/O: 00a0-00a1 : pic2 */
		/* PIO_RANGE(0xa0, 0x2), */
		/* Port I/O: 00c0-00df : dma2 */
		/* PIO_RANGE(0xc0, 0x20), */
		/* Port I/O: 00f0-00ff : fpu */
		/* PIO_RANGE(0xf0, 0x10), */
		/* Port I/O: 0230-023f : pnp 00:03 */
		/* PIO_RANGE(0x230, 0x10), */
		/* Port I/O: 0290-029f : pnp 00:03 */
		/* PIO_RANGE(0x290, 0x10), */
		/* Port I/O: 0300-030f : pnp 00:03 */
		/* PIO_RANGE(0x300, 0x10), */
		/* Port I/O: 03b0-03df : PCI Bus 0000:00 */
		/* PIO_RANGE(0x3b0, 0x30), */
		/* Port I/O: 03f8-03ff : serial */
		PIO_RANGE(0x3f8, 0x8),
		/* Port I/O: 040b-040b : pnp 00:05 */
		/* PIO_RANGE(0x40b, 0x1), */
		/* Port I/O: 04d0-04d1 : pnp 00:05 */
		/* PIO_RANGE(0x4d0, 0x2), */
		/* Port I/O: 04d6-04d6 : pnp 00:05 */
		/* PIO_RANGE(0x4d6, 0x1), */
		/* Port I/O: 0800-0803 : ACPI PM1a_EVT_BLK */
		/* PIO_RANGE(0x800, 0x4), */
		/* Port I/O: 0804-0805 : ACPI PM1a_CNT_BLK */
		/* PIO_RANGE(0x804, 0x2), */
		/* Port I/O: 0808-080b : ACPI PM_TMR */
		/* PIO_RANGE(0x808, 0x4), */
		/* Port I/O: 0810-0815 : ACPI CPU throttle */
		/* PIO_RANGE(0x810, 0x6), */
		/* Port I/O: 0820-0827 : ACPI GPE0_BLK */
		/* PIO_RANGE(0x820, 0x8), */
		/* Port I/O: 0900-090f : pnp 00:05 */
		/* PIO_RANGE(0x900, 0x10), */
		/* Port I/O: 0910-091f : pnp 00:05 */
		/* PIO_RANGE(0x910, 0x10), */
		/* Port I/O: 0b00-0b08 : piix4_smbus */
		/* PIO_RANGE(0xb00, 0x9), */
		/* Port I/O: 0b20-0b3f : pnp 00:05 */
		/* PIO_RANGE(0xb20, 0x20), */
		/* Port I/O: 0c00-0c01 : pnp 00:05 */
		/* PIO_RANGE(0xc00, 0x2), */
		/* Port I/O: 0c14-0c14 : pnp 00:05 */
		/* PIO_RANGE(0xc14, 0x1), */
		/* Port I/O: 0c50-0c51 : pnp 00:05 */
		/* PIO_RANGE(0xc50, 0x2), */
		/* Port I/O: 0c52-0c52 : pnp 00:05 */
		/* PIO_RANGE(0xc52, 0x1), */
		/* Port I/O: 0c6c-0c6c : pnp 00:05 */
		/* PIO_RANGE(0xc6c, 0x1), */
		/* Port I/O: 0c6f-0c6f : pnp 00:05 */
		/* PIO_RANGE(0xc6f, 0x1), */
		/* Port I/O: 0cd0-0cd1 : pnp 00:05 */
		/* PIO_RANGE(0xcd0, 0x2), */
		/* Port I/O: 0cd2-0cd3 : pnp 00:05 */
		/* PIO_RANGE(0xcd2, 0x2), */
		/* Port I/O: 0cd4-0cd5 : pnp 00:05 */
		/* PIO_RANGE(0xcd4, 0x2), */
		/* Port I/O: 0cd6-0cd7 : pnp 00:05 */
		/* PIO_RANGE(0xcd6, 0x2), */
		/* Port I/O: 0cd8-0cdf : pnp 00:05 */
		/* PIO_RANGE(0xcd8, 0x8), */
		/* Port I/O: e000-e07f : 0000:27:00.0 */
		PIO_RANGE(0xe000, 0x80),
		/* Port I/O: f000-f0ff : 0000:25:00.0 */
		PIO_RANGE(0xf000, 0x100),
	},

	.pci_devices = {
		/* PCIDevice: 00:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.domain = 0x0,
			.bdf = 0x0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x8,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:01.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xb,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 11,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:02.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x10,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x18,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:03.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x19,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 11,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x20,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x38,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:07.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x39,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x40,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:08.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x41,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 11,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:14.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xa3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc0,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc1,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc2,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc3,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.4 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc4,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.5 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc5,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.6 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc6,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 00:18.7 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0xc7,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 0,
			.num_caps = 0,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x300,
			.bar_mask = {
				0xffff8000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 18,
			.num_caps = 7,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x301,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffe0000,
			},
			.caps_start = 25,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 03:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x302,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 29,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1d:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x1d00,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1d:04.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x1d20,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1d:05.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x1d28,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1d:06.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x1d30,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 1d:07.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x1d38,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 34,
			.num_caps = 7,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 22:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2200,
			.bar_mask = {
				0xffff8000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 41,
			.num_caps = 7,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 25:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2500,
			.bar_mask = {
				0xffffff00, 0x00000000, 0xfffff000,
				0xffffffff, 0xffffc000, 0xffffffff,
			},
			.caps_start = 48,
			.num_caps = 9,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 4,
			.msix_region_size = 0x1000,
			.msix_address = 0xf7500000,
		},
		/* PCIDevice: 27:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2700,
			.bar_mask = {
				0xff000000, 0xf0000000, 0xffffffff,
				0xfe000000, 0xffffffff, 0xffffff80,
			},
			.caps_start = 57,
			.num_caps = 8,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 27:00.1 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2701,
			.bar_mask = {
				0xffffc000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 65,
			.num_caps = 4,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 28:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2800,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 69,
			.num_caps = 5,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 28:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2802,
			.bar_mask = {
				0x00000000, 0x00000000, 0xfff00000,
				0x00000000, 0x00000000, 0xffffe000,
			},
			.caps_start = 74,
			.num_caps = 6,
			.num_msi_vectors = 2,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 2,
			.msix_region_size = 0x1000,
			.msix_address = 0xf7400000,
		},
		/* PCIDevice: 28:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2803,
			.bar_mask = {
				0xfff00000, 0xffffffff, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 80,
			.num_caps = 5,
			.num_msi_vectors = 8,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 29:00.0 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2900,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 69,
			.num_caps = 5,
			.num_msi_vectors = 0,
			.msi_64bits = 0,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 29:00.2 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2902,
			.bar_mask = {
				0x00000000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0xfffff000,
			},
			.caps_start = 85,
			.num_caps = 6,
			.num_msi_vectors = 16,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
		/* PCIDevice: 29:00.3 */
		{
			.type = JAILHOUSE_PCI_TYPE_DEVICE,
			.iommu = 0,
			.domain = 0x0,
			.bdf = 0x2903,
			.bar_mask = {
				0xffff8000, 0x00000000, 0x00000000,
				0x00000000, 0x00000000, 0x00000000,
			},
			.caps_start = 80,
			.num_caps = 5,
			.num_msi_vectors = 1,
			.msi_64bits = 1,
			.msi_maskable = 0,
			.num_msix_vectors = 0,
			.msix_region_size = 0x0,
			.msix_address = 0x0,
		},
	},

	.pci_caps = {
		/* PCIDevice: 00:01.3 */
		/* PCIDevice: 00:03.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x150,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ACS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x2a0,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x370,
			.len = 0x4,
			.flags = 0,
		},
		{
			.id = 0x23 | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x3c4,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 00:07.1 */
		/* PCIDevice: 00:08.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x58,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_HT,
			.start = 0xc8,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 03:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x400,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 03:00.1 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 03:00.2 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 1d:00.0 */
		/* PCIDevice: 1d:04.0 */
		/* PCIDevice: 1d:05.0 */
		/* PCIDevice: 1d:06.0 */
		/* PCIDevice: 1d:07.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_SSVID,
			.start = 0xc0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x400,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 22:00.0 */
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x78,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x80,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x200,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x280,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x300,
			.len = 0x8,
			.flags = 0,
		},
		/* PCIDevice: 25:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x40,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x50,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x70,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xb0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x140,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x160,
			.len = 0xc,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_LTR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x170,
			.len = 0x8,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_L1SS | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x178,
			.len = 0x4,
			.flags = 0,
		},
		/* PCIDevice: 27:00.0 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x60,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x68,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x78,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VC | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_PWR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x128,
			.len = 0x10,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x420,
			.len = 0x40,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x600,
			.len = 0x28,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x900,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 27:00.1 */
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x60,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0x68,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x78,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x40,
			.flags = 0,
		},
		/* PCIDevice: 28:00.0 */
		/* PCIDevice: 29:00.0 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_SECPCI | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x270,
			.len = 0x10,
			.flags = 0,
		},
		/* PCIDevice: 28:00.2 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_MSIX,
			.start = 0xc0,
			.len = 0xc,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		/* PCIDevice: 28:00.3 */
		/* PCIDevice: 29:00.3 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
		/* PCIDevice: 29:00.2 */
		{
			.id = PCI_CAP_ID_VNDR,
			.start = 0x48,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_PM,
			.start = 0x50,
			.len = 0x8,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_EXP,
			.start = 0x64,
			.len = 0x3c,
			.flags = 0,
		},
		{
			.id = PCI_CAP_ID_MSI,
			.start = 0xa0,
			.len = 0xe,
			.flags = JAILHOUSE_PCICAPS_WRITE,
		},
		{
			.id = PCI_CAP_ID_SATA,
			.start = 0xd0,
			.len = 0x2,
			.flags = 0,
		},
		{
			.id = PCI_EXT_CAP_ID_VNDR | JAILHOUSE_PCI_EXT_CAP,
			.start = 0x100,
			.len = 0x14,
			.flags = 0,
		},
	},
};

------=_Part_100_1251200391.1597745270689--
