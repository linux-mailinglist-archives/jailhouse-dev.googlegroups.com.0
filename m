Return-Path: <jailhouse-dev+bncBCFZVI4UTIEBBZ46Y7UAKGQELIYBJFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x337.google.com (mail-ot1-x337.google.com [IPv6:2607:f8b0:4864:20::337])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AE7524F4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 09:38:17 +0200 (CEST)
Received: by mail-ot1-x337.google.com with SMTP id b4sf8692849otf.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 00:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=PlJiEstrf7hNSS2SWKViylpc0TLg0W8DvVj6ZlC5CyU=;
        b=kMmVkfzpX9Ou1IEWCKE1L9tw0gNP2H6izh+T/UNJlFwv0CL+Ec3GNWiRy9R3A6wj6E
         YfJ8KqJClMaBMI6aougOYilUrGlnhFzXJnjHNe0xCs/t97xlf55Z6KPU0yAYWfmrc5Ep
         tsUYQFwFL+BcYzPbCVXKajX8y1i1Ata1MjIyX74rR3KwM02pRsZp7uBSVZPRGFi0iE6T
         HyR9yrb1pu6F6piaKS2ojcdjrSk2FfOcKor1a/TptjbdqM7JogV5BO0A4B2oULjPLULJ
         iOEFiqB3OPdWPYNcfk4/wt6bVTRP6n3FhchvcSt7/2tvkM/sA6oW1+U+t147oAYsD2cI
         Q8Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=PlJiEstrf7hNSS2SWKViylpc0TLg0W8DvVj6ZlC5CyU=;
        b=NthbTX9VA7lCVM+6/TK3Xp3W/OusCxRfnKgaZK/Yb34D0+8hJ39sXCkZClHxN9H4bO
         a9lKaHDlfv5spjPUqxmmwhBLbwiaAQKTNLatGDyvAXYAkTwYg5axTeVh9rIUz+K0zNQe
         KRR7FXX4vWeP7pMeZytxQMDqfedgTzGiUbvTmqmQG+2F8ynw3U9EPDaOQm3nBV6izReX
         NUnlqFdFKWhvEgQk7/3zQ+FsMHxIcfIeBSapifIIqq7u2eAk0ZkOQBVE5g7zbFSeOMNI
         H55adpajkV6kEIzd3R65s/uewfvpRa0Zhi6NXfz+oZu/1Pjh1Upabc2MTLccMD10AhkP
         8Y4w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWfWOJI32GnjzLa8fuABnofLToCjEKDcT1GpYTi4874pS6tqyp3
	usgzt3czuubZnmVmPqzIOtg=
X-Google-Smtp-Source: APXvYqwj7rIUUobeRZyj/jEtq0SQHF+aQJ0Qo7q3yTmRvyWMmMiqTg8VACGKusmvwymAXKOjuD033g==
X-Received: by 2002:a9d:6289:: with SMTP id x9mr45491911otk.82.1561448295843;
        Tue, 25 Jun 2019 00:38:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:634f:: with SMTP id y15ls402828otk.9.gmail; Tue, 25 Jun
 2019 00:38:15 -0700 (PDT)
X-Received: by 2002:a9d:5a16:: with SMTP id v22mr9025395oth.150.1561448295216;
        Tue, 25 Jun 2019 00:38:15 -0700 (PDT)
Date: Tue, 25 Jun 2019 00:38:14 -0700 (PDT)
From: Adam Przybylski <adamprz@gmx.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
In-Reply-To: <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2062_345773260.1561448294467"
X-Original-Sender: adamprz@gmx.de
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

------=_Part_2062_345773260.1561448294467
Content-Type: text/plain; charset="UTF-8"

Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
> Am Fri, 21 Jun 2019 07:18:14 -0700
> schrieb Adam Przybylski:
> 
> > Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
> > > Am Fri, 21 Jun 2019 14:51:30 +0200
> > > schrieb Ralf Ramsauer:
> > >   
> > > > Hi,
> > > > 
> > > > On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
> > > > > Hi Adam,
> > > > > 
> > > > > On 21.06.2019 17:16, Adam Przybylski wrote:    
> > > > >> Dear Jailhouse Community,
> > > > >>
> > > > >> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> > > > >> Processor. Unfortunately the system hangs after I execute
> > > > >> "jailhouse enable sysconfig.cell".
> > > > >>
> > > > >> Do you have any hint how to debug and instrument this issue?
> > > > >>
> > > > >> Any kind of help is appreciated.
> > > > >>
> > > > >> Attached you can find the jailhouse logs, processor info, and
> > > > >> sysconfig.c.
> > > > >>
> > > > >> Looking forward to hear from you.    
> > > > > I'd say the following line is the culprit:
> > > > >     
> > > > >> FATAL: Invalid PIO read, port: 814 size: 1    
> > > > 
> > > > Could you please attach /proc/ioports? This will tell us the
> > > > secret behind Port 814.  
> > > 
> > > Not always, the driver doing that has to be so friendly to register
> > > the region.
> > >   
> > > > > 
> > > > > As a quick fix, you may grant your root cell access to all I/O
> > > > > ports and see if it helps.    
> > > > 
> > > > Allowing access will suppress the symptoms, yet we should
> > > > investigate its cause. Depending on the semantics of Port 819, to
> > > > allow access might have unintended side effects.
> > > > 
> > > > You could also try to disassemble your kernel (objdump -d
> > > > vmlinux) and check what function hides behind the instruction
> > > > pointer at the moment of the crash 0xffffffffa4ac3114.  
> > > 
> > > A look in the System.map can also answer that question. On a distro
> > > that will be ready to read somewhere in /boot/.
> > > 
> > > Henning
> > >   
> > > >   Ralf
> > > >   
> > > > > 
> > > > > Best,
> > > > > Valentine
> > > > >     
> > > > >>
> > > > >> Kind regards,
> > > > >> Adam Przybylski
> > > > >>    
> > > > >     
> > > >  
> > 
> > Hi,
> > 
> > I looked up the function which gets executed in the Kernel. It's
> > "acpi_idle_do_entry".
> 
> Well now you are back to what Valentine said. Open up those ports one
> by one, until the problem goes away. The alternative is to disable the
> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
> parameter, but you probably do not want that.
> 
> Note that whatever you allow might cause weaker isolation, in this case
> maybe real-time related.
> 
> Henning
> 
> > Adam
> >

Hi,

after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.

Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.

Any idea how to debug this?

Adam

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/98b65827-1a4c-48c7-8501-8103ee8e9284%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2062_345773260.1561448294467
Content-Type: text/plain; charset=US-ASCII; 
	name=jailhouse-enable-AMD-EPYC_201906250832.log
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; 
	filename=jailhouse-enable-AMD-EPYC_201906250832.log
X-Attachment-Id: 74c46530-1eaf-449a-9162-7ad57195dc9d
Content-ID: <74c46530-1eaf-449a-9162-7ad57195dc9d>

Initializing Jailhouse hypervisor v0.10 (136-g5a3c0f34) on CPU 7
Code location: 0xfffffffff0000050
Using xAPIC
Page pool usage after early setup: mem 126/979, remap 1/131072
Initializing processors:
 CPU 7... (APIC ID 25) OK
 CPU 6... (APIC ID 24) OK
 CPU 2... (APIC ID 8) OK
 CPU 3... (APIC ID 9) OK
 CPU 11... (APIC ID 41) OK
 CPU 10... (APIC ID 40) OK
 CPU 0... (APIC ID 0) OK
 CPU 1... (APIC ID 1) OK
 CPU 14... (APIC ID 56) OK
 CPU 15... (APIC ID 57) OK
 CPU 4... (APIC ID 16) OK
 CPU 5... (APIC ID 17) OK
 CPU 8... (APIC ID 32) OK
 CPU 9... (APIC ID 33) OK
 CPU 12... (APIC ID 48) OK
 CPU 13... (APIC ID 49) OK
Initializing unit: AMD IOMMU
AMD IOMMU @0xebf00000/0x80000
Initializing unit: IOAPIC
Initializing unit: PCI
Adding PCI device 00:00.0 to cell "RootCell"
Adding PCI device 00:01.0 to cell "RootCell"
Adding PCI device 00:01.6 to cell "RootCell"
Adding PCI device 00:02.0 to cell "RootCell"
Adding PCI device 00:03.0 to cell "RootCell"
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
Adding PCI device 00:19.0 to cell "RootCell"
Adding PCI device 00:19.1 to cell "RootCell"
Adding PCI device 00:19.2 to cell "RootCell"
Adding PCI device 00:19.3 to cell "RootCell"
Adding PCI device 00:19.4 to cell "RootCell"
Adding PCI device 00:19.5 to cell "RootCell"
Adding PCI device 00:19.6 to cell "RootCell"
Adding PCI device 00:19.7 to cell "RootCell"
Adding PCI device 00:1a.0 to cell "RootCell"
Adding PCI device 00:1a.1 to cell "RootCell"
Adding PCI device 00:1a.2 to cell "RootCell"
Adding PCI device 00:1a.3 to cell "RootCell"
Adding PCI device 00:1a.4 to cell "RootCell"
Adding PCI device 00:1a.5 to cell "RootCell"
Adding PCI device 00:1a.6 to cell "RootCell"
Adding PCI device 00:1a.7 to cell "RootCell"
Adding PCI device 00:1b.0 to cell "RootCell"
Adding PCI device 00:1b.1 to cell "RootCell"
Adding PCI device 00:1b.2 to cell "RootCell"
Adding PCI device 00:1b.3 to cell "RootCell"
Adding PCI device 00:1b.4 to cell "RootCell"
Adding PCI device 00:1b.5 to cell "RootCell"
Adding PCI device 00:1b.6 to cell "RootCell"
Adding PCI device 00:1b.7 to cell "RootCell"
Adding PCI device 01:00.0 to cell "RootCell"
Adding PCI device 02:00.0 to cell "RootCell"
Adding PCI device 03:00.0 to cell "RootCell"
Adding PCI device 03:00.2 to cell "RootCell"
Adding PCI device 03:00.3 to cell "RootCell"
Adding PCI device 04:00.0 to cell "RootCell"
Adding PCI device 04:00.1 to cell "RootCell"
Adding PCI device 04:00.2 to cell "RootCell"
Adding PCI device 20:00.0 to cell "RootCell"
Adding PCI device 20:00.2 to cell "RootCell"
Adding PCI device 20:01.0 to cell "RootCell"
Adding PCI device 20:02.0 to cell "RootCell"
Adding PCI device 20:03.0 to cell "RootCell"
Adding PCI device 20:04.0 to cell "RootCell"
Adding PCI device 20:07.0 to cell "RootCell"
Adding PCI device 20:07.1 to cell "RootCell"
Adding PCI device 20:08.0 to cell "RootCell"
Adding PCI device 20:08.1 to cell "RootCell"
Adding PCI device 21:00.0 to cell "RootCell"
Adding PCI device 21:00.2 to cell "RootCell"
Adding PCI device 21:00.3 to cell "RootCell"
Adding PCI device 22:00.0 to cell "RootCell"
Adding PCI device 22:00.1 to cell "RootCell"
Adding PCI device 22:00.2 to cell "RootCell"
Adding PCI device 40:00.0 to cell "RootCell"
Adding PCI device 40:00.2 to cell "RootCell"
Adding PCI device 40:01.0 to cell "RootCell"
Adding PCI device 40:02.0 to cell "RootCell"
Adding PCI device 40:03.0 to cell "RootCell"
Adding PCI device 40:04.0 to cell "RootCell"
Adding PCI device 40:07.0 to cell "RootCell"
Adding PCI device 40:07.1 to cell "RootCell"
Adding PCI device 40:08.0 to cell "RootCell"
Adding PCI device 40:08.1 to cell "RootCell"
Adding PCI device 41:00.0 to cell "RootCell"
Adding PCI device 41:00.2 to cell "RootCell"
Adding PCI device 42:00.0 to cell "RootCell"
Adding PCI device 42:00.1 to cell "RootCell"
Adding PCI device 60:00.0 to cell "RootCell"
Adding PCI device 60:00.2 to cell "RootCell"
Adding PCI device 60:01.0 to cell "RootCell"
Adding PCI device 60:01.1 to cell "RootCell"
Adding PCI device 60:02.0 to cell "RootCell"
Adding PCI device 60:03.0 to cell "RootCell"
Adding PCI device 60:03.2 to cell "RootCell"
Adding PCI device 60:03.3 to cell "RootCell"
Adding PCI device 60:03.4 to cell "RootCell"
Adding PCI device 60:04.0 to cell "RootCell"
Adding PCI device 60:07.0 to cell "RootCell"
Adding PCI device 60:07.1 to cell "RootCell"
Adding PCI device 60:08.0 to cell "RootCell"
Adding PCI device 60:08.1 to cell "RootCell"
Adding PCI device 61:00.0 to cell "RootCell"
Adding PCI device 62:00.0 to cell "RootCell"
Adding PCI device 63:00.0 to cell "RootCell"
Adding PCI device 63:00.1 to cell "RootCell"
Adding PCI device 64:00.0 to cell "RootCell"
Adding PCI device 65:00.0 to cell "RootCell"
Adding PCI device 66:00.0 to cell "RootCell"
Adding PCI device 67:00.0 to cell "RootCell"
Adding PCI device 67:00.2 to cell "RootCell"
Adding PCI device 68:00.0 to cell "RootCell"
Adding PCI device 68:00.1 to cell "RootCell"
Page pool usage after late setup: mem 544/979, remap 32915/131072
Activating hypervisor
FATAL: Invalid MMIO/RAM read, addr: 0x00000000da488d98 size: 8
RIP: 0xffffffff8f5e9d9d RSP: 0xffff8b8353003d80 FLAGS: 246
RAX: 0xffff8b8353003d80 RBX: 0x0000000000000040 RCX: 0x00000000da489000
RDX: 0x0000000000000000 RSI: 0x00000000da488da0 RDI: 0xffffb57840081d98
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000007f4616000 CR4: 0x00000000003406f0
EFER: 0x0000000000001d01
Parking CPU 0 (Cell: "RootCell")
FATAL: unsupported instruction (0xf3 0x00 0x00 0x00)
FATAL: Invalid MMIO/RAM write, addr: 0x00000000da470050 size: 0
RIP: 0xffffffff8fab1e72 RSP: 0xffff8b8353003a58 FLAGS: 6
RAX: 0xffffb578535a8050 RBX: 0xffff8b89488f00c8 RCX: 0x0000000000000292
RDX: 0x0000000000000003 RSI: 0xffff8b89488f0000 RDI: 0xffffb578535a8050
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000007f4616000 CR4: 0x00000000003406f0
EFER: 0x0000000000001d01
Parking CPU 0 (Cell: "RootCell")
AMD IOMMU 0 reported event
 EventCode: 2, Operand 1: 2000000000000303, Operand 2: 20db7d020
 DeviceId (bus:dev.func): 03:00.3
Ignoring NMI IPI to CPU 0
FATAL: Unhandled MSR read: c0002001
RIP: 0xffffffff8f071de4 RSP: 0xffff8b8754203d60 FLAGS: 246
RAX: 0x0000000000000000 RBX: 0xffff8b8754215f98 RCX: 0x00000000c0002001
RDX: 0x0000000000000000 RSI: 0xffff8b8754203d74 RDI: 0x00000000c0002001
CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
CR0: 0x0000000080050033 CR3: 0x00000007f4616000 CR4: 0x00000000003406e0
EFER: 0x0000000000001d01
Parking CPU 11 (Cell: "RootCell")
Ignoring NMI IPI to CPU 0

------=_Part_2062_345773260.1561448294467--
