Return-Path: <jailhouse-dev+bncBCFZVI4UTIEBBSF7ZDUAKGQEGA7AF6Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23c.google.com (mail-oi1-x23c.google.com [IPv6:2607:f8b0:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D75501E
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 15:21:14 +0200 (CEST)
Received: by mail-oi1-x23c.google.com with SMTP id t198sf6900154oih.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 06:21:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=aylucC27RJ+RqVMmmqnQ8i5ANNeJbeSgWIJdF7TDk44=;
        b=U10CT4ehhBDZW3EN5O4IbJ3RbdZyfKPgNMgsoieOBG2ZyrhUy//tKzRg4EIJfazxQG
         qrLIftLwrb7jZrBr99Ci+JB83z4qDu4vCr4mIM1RfpgR6vpmpXWVvV8NKTnxRQ9dDJcZ
         sG00+7hFRTnzLVsaIJ3ZfHeoeUSqMaUr2Md9/UGDfQlxg4aK+XhfGgdsozlVq+3EQ+ss
         YaMC6M2949m2qb261/gG/pXsgDvJt2B9nzSfzrd+xBPcRrZtwIXvs7xOoAzVQtMEQsA0
         eLs8iA+apIC95iXae3AF8OUH/r24kqbLQQdCEQ+N8QCDF8A/KqYg06ReTMErqoHsJyqj
         fPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=aylucC27RJ+RqVMmmqnQ8i5ANNeJbeSgWIJdF7TDk44=;
        b=nEFhiGN6vrJDLCmH1Rd70WGL7UtR0/njzwnH68cPAmXVaDb7yITMQdP5CwcN2Yn1e5
         uatUssWw+auetxbW36pvOw7/WCQBS017zFi4bWNosoRuVOuN1Cd5K/6daMHEhkwiKbip
         dX+Lz1Al6eOZk6v6/OmsMEOa1nSVHQ7ONUjkU94l5atFqrNvfrMSgYLZ/7lG8MsV4IKi
         evCRe4IdB3mYWGpxfir8sCKgtnFsX1T0G6aRFVqohd+HNwXoMs0UhhX/aUsaJxu4EVTW
         Zk1ZTkxsnjzOvbjNxFe1ozPF4LAngHz7PcPqdlap7BikdzErjaDEuA6bMLKplOFeS5Zr
         ssOg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXoafSng/MPEUVVFRtLIkcb29N39GQLztsq7A1j6PkEj9uJCv/8
	1ml+823z4rPWGqckm+ryjAE=
X-Google-Smtp-Source: APXvYqy2elAoUNaJcosbg81g1hvfrh6xxJX2qL+qWT/5pOUXuBMIINd4IuiBDG9wL713YwI3fazwUQ==
X-Received: by 2002:a05:6830:10d3:: with SMTP id z19mr24845718oto.196.1561468872963;
        Tue, 25 Jun 2019 06:21:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:71d0:: with SMTP id z16ls598973otj.2.gmail; Tue, 25 Jun
 2019 06:21:12 -0700 (PDT)
X-Received: by 2002:a9d:6f91:: with SMTP id h17mr45855498otq.67.1561468872195;
        Tue, 25 Jun 2019 06:21:12 -0700 (PDT)
Date: Tue, 25 Jun 2019 06:21:11 -0700 (PDT)
From: Adam Przybylski <adamprz@gmx.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <f3fc160a-01dd-44dd-998a-a8f1e48c03c6@googlegroups.com>
In-Reply-To: <121ab35d-79ab-5b00-9b27-473809a02707@oth-regensburg.de>
References: <d069200e-ba34-41bc-854c-8a95d62f2596@googlegroups.com>
 <ca059740-300b-f5df-3dda-65ef289599f6@gmail.com>
 <b22e6a12-a5df-c698-d4ce-652c5376ee4e@oth-regensburg.de>
 <20190621155406.18df2751@md1za8fc.ad001.siemens.net>
 <bc4047f6-c6c7-4b74-9084-51212c8bd4ad@googlegroups.com>
 <20190623183232.084b6744@md1za8fc.ad001.siemens.net>
 <98b65827-1a4c-48c7-8501-8103ee8e9284@googlegroups.com>
 <af790385-ad03-9fcc-33bb-60dfed20e169@oth-regensburg.de>
 <510bf146-8ec5-414d-8a22-33d61476ee1f@googlegroups.com>
 <e0d7a082-bb03-195a-d146-4ba627a93be4@oth-regensburg.de>
 <27b260ce-0dcd-4019-8dc5-c757500422c1@googlegroups.com>
 <121ab35d-79ab-5b00-9b27-473809a02707@oth-regensburg.de>
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2078_1806622792.1561468871432"
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

------=_Part_2078_1806622792.1561468871432
Content-Type: text/plain; charset="UTF-8"

Am Dienstag, 25. Juni 2019 14:50:44 UTC+2 schrieb Ralf Ramsauer:
> On 6/25/19 2:46 PM, Adam Przybylski wrote:
> > Am Dienstag, 25. Juni 2019 14:14:41 UTC+2 schrieb Ralf Ramsauer:
> >> On 6/25/19 1:31 PM, Adam Przybylski wrote:
> >>> Am Dienstag, 25. Juni 2019 12:10:03 UTC+2 schrieb Ralf Ramsauer:
> >>>> Hi,
> >>>>
> >>>> On 6/25/19 9:38 AM, Adam Przybylski wrote:
> >>>>> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
> >>>>>> Am Fri, 21 Jun 2019 07:18:14 -0700
> >>>>>> schrieb Adam Przybylski:
> >>>>>>
> >>>>>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
> >>>>>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
> >>>>>>>> schrieb Ralf Ramsauer:
> >>>>>>>>   
> >>>>>>>>> Hi,
> >>>>>>>>>
> >>>>>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
> >>>>>>>>>> Hi Adam,
> >>>>>>>>>>
> >>>>>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:    
> >>>>>>>>>>> Dear Jailhouse Community,
> >>>>>>>>>>>
> >>>>>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> >>>>>>>>>>> Processor. Unfortunately the system hangs after I execute
> >>>>>>>>>>> "jailhouse enable sysconfig.cell".
> >>>>>>>>>>>
> >>>>>>>>>>> Do you have any hint how to debug and instrument this issue?
> >>>>>>>>>>>
> >>>>>>>>>>> Any kind of help is appreciated.
> >>>>>>>>>>>
> >>>>>>>>>>> Attached you can find the jailhouse logs, processor info, and
> >>>>>>>>>>> sysconfig.c.
> >>>>>>>>>>>
> >>>>>>>>>>> Looking forward to hear from you.    
> >>>>>>>>>> I'd say the following line is the culprit:
> >>>>>>>>>>     
> >>>>>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1    
> >>>>>>>>>
> >>>>>>>>> Could you please attach /proc/ioports? This will tell us the
> >>>>>>>>> secret behind Port 814.  
> >>>>>>>>
> >>>>>>>> Not always, the driver doing that has to be so friendly to register
> >>>>>>>> the region.
> >>>>>>>>   
> >>>>>>>>>>
> >>>>>>>>>> As a quick fix, you may grant your root cell access to all I/O
> >>>>>>>>>> ports and see if it helps.    
> >>>>>>>>>
> >>>>>>>>> Allowing access will suppress the symptoms, yet we should
> >>>>>>>>> investigate its cause. Depending on the semantics of Port 819, to
> >>>>>>>>> allow access might have unintended side effects.
> >>>>>>>>>
> >>>>>>>>> You could also try to disassemble your kernel (objdump -d
> >>>>>>>>> vmlinux) and check what function hides behind the instruction
> >>>>>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.  
> >>>>>>>>
> >>>>>>>> A look in the System.map can also answer that question. On a distro
> >>>>>>>> that will be ready to read somewhere in /boot/.
> >>>>>>>>
> >>>>>>>> Henning
> >>>>>>>>   
> >>>>>>>>>   Ralf
> >>>>>>>>>   
> >>>>>>>>>>
> >>>>>>>>>> Best,
> >>>>>>>>>> Valentine
> >>>>>>>>>>     
> >>>>>>>>>>>
> >>>>>>>>>>> Kind regards,
> >>>>>>>>>>> Adam Przybylski
> >>>>>>>>>>>    
> >>>>>>>>>>     
> >>>>>>>>>  
> >>>>>>>
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> I looked up the function which gets executed in the Kernel. It's
> >>>>>>> "acpi_idle_do_entry".
> >>>>>>
> >>>>>> Well now you are back to what Valentine said. Open up those ports one
> >>>>>> by one, until the problem goes away. The alternative is to disable the
> >>>>>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
> >>>>>> parameter, but you probably do not want that.
> >>>>>>
> >>>>>> Note that whatever you allow might cause weaker isolation, in this case
> >>>>>> maybe real-time related.
> >>>>>>
> >>>>>> Henning
> >>>>>>
> >>>>>>> Adam
> >>>>>>>
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
> >>>>>
> >>>>> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.
> >>>>
> >>>> You can again look at the system.map to find the code behind the MSR access.
> >>>>
> >>>> The rest can probably solved by consolidating some non-page aligned
> >>>> spreaded memory regions in your config -- could you please attach the
> >>>> output of jailhouse config collect? It should contain all data that is
> >>>> relevant for debugging.
> >>>>
> >>>> Thanks
> >>>>   Ralf
> >>>>
> >>>>>
> >>>>> Any idea how to debug this?
> >>>>>
> >>>>> Adam
> >>>>>
> >>>
> >>> Hi,
> >>>
> >>> attached the jailhouse config collect output.
> >>
> >> Please try the attached config on next.
> >>
> >> You can use diff to see what I changed: I consolidated some memory
> >> regions to one large, contiguous region. Should at least solve the MMIO
> >> traps and the unknown instruction error.
> >>
> >> Remains the MSR access. What code is behind the instruction pointer?
> >>
> >> Thanks
> >>   Ralf
> >>
> >>>
> >>> Adam
> >>>
> > 
> > Hi,
> > 
> > the attached config works fine regarding the IOMMU/RAM accesses. Thank you!
> 
> Great, good to hear.
> 
> > 
> > The function behind the RIP is native_read_msr_safe.
> 
> Well... That doesn't help. :-)
> 
> could you please
> $ echo #define CRASH_CELL_ON_PANIC 1 >> include/jailhouse/config.h
> 
> and then recompile and reinstall jailhouse. This should give you a
> stacktrace of the kernel when the crash happens. Then we can go on
> debugging.
> 
>   Ralf
> 
> > 
> > Adam
> >

Attached the dmesg with the kernel crash.

Adam

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f3fc160a-01dd-44dd-998a-a8f1e48c03c6%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2078_1806622792.1561468871432
Content-Type: text/plain; charset=UTF-8; name=dmesg_201906251458.log
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename=dmesg_201906251458.log
X-Attachment-Id: 075b286d-80db-41d1-8b26-2a123aaccf56
Content-ID: <075b286d-80db-41d1-8b26-2a123aaccf56>

[    0.000000] Linux version 5.0.16-300.local.fc30.x86_64 (pz5qnq@toolbox) =
(gcc version 9.1.1 20190503 (Red Hat 9.1.1-1) (GCC)) #1 SMP Wed Jun 12 13:4=
8:57 UTC 2019
[    0.000000] Command line: BOOT_IMAGE=3D(hd8,gpt2)/vmlinuz-5.0.16-300.loc=
al.fc30.x86_64 root=3DUUID=3Ded3d2375-084d-422f-89dc-f609b60ffb0f ro amd_io=
mmu=3Doff memmap=3D0x5200000$0x3a000000 log_buf_len=3D128M
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832 by=
tes, using 'compacted' format.
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x0000000075daffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x0000000075db0000-0x0000000075ffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000076000000-0x00000000d9036fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x00000000d9037000-0x00000000da49cfff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000da49d000-0x00000000da4b7fff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x00000000da4b8000-0x00000000da50ffff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x00000000da510000-0x00000000dad6afff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000dad6b000-0x00000000dbffffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x00000000dc000000-0x00000000dfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ea700000-0x00000000ea87ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ea8f0000-0x00000000ea8f0fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000eb200000-0x00000000eb37ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000eb3f0000-0x00000000eb3f0fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000eb800000-0x00000000eb97ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000eb9f0000-0x00000000eb9f0fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ebf00000-0x00000000ebf7ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ebff0000-0x00000000ebff0fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fea00000-0x00000000feafffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed00000-0x00000000fed00fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed40000-0x00000000fed44fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed80000-0x00000000fed8ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc0000-0x00000000fedc0fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fedc2000-0x00000000fedc8fff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000feefffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000021f37ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000021f380000-0x000000021fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000220000000-0x000000041ff7ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000041ff80000-0x000000041fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000420000000-0x000000061ff7ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000061ff80000-0x000000061fffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000620000000-0x000000081ff7ffff] usabl=
e
[    0.000000] BIOS-e820: [mem 0x000000081ff80000-0x000000081fffffff] reser=
ved
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] e820: update [mem 0xd2b15018-0xd2b25857] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xd2b15018-0xd2b25857] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xd2afb018-0xd2b14457] usable =3D=3D> usab=
le
[    0.000000] e820: update [mem 0xd2afb018-0xd2b14457] usable =3D=3D> usab=
le
[    0.000000] extended physical RAM map:
[    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000009ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000000a0000-0x00000000000fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000039ffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000003a000000-0x000000003f1fff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x000000003f200000-0x0000000075daff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x0000000075db0000-0x0000000075ffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000076000000-0x00000000d2afb0=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000d2afb018-0x00000000d2b144=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000d2b14458-0x00000000d2b150=
17] usable
[    0.000000] reserve setup_data: [mem 0x00000000d2b15018-0x00000000d2b258=
57] usable
[    0.000000] reserve setup_data: [mem 0x00000000d2b25858-0x00000000d9036f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000d9037000-0x00000000da49cf=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000da49d000-0x00000000da4b7f=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000da4b8000-0x00000000da50ff=
ff] ACPI NVS
[    0.000000] reserve setup_data: [mem 0x00000000da510000-0x00000000dad6af=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000dad6b000-0x00000000dbffff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x00000000dc000000-0x00000000dfffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ea700000-0x00000000ea87ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ea8f0000-0x00000000ea8f0f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000eb200000-0x00000000eb37ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000eb3f0000-0x00000000eb3f0f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000eb800000-0x00000000eb97ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000eb9f0000-0x00000000eb9f0f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ebf00000-0x00000000ebf7ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ebff0000-0x00000000ebff0f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fea00000-0x00000000feafff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fec10000-0x00000000fec10f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed00000-0x00000000fed00f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed40000-0x00000000fed44f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fed80000-0x00000000fed8ff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc0000-0x00000000fedc0f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fedc2000-0x00000000fedc8f=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000feefff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000100000000-0x000000021f37ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000021f380000-0x000000021fffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000220000000-0x000000041ff7ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000041ff80000-0x000000041fffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000420000000-0x000000061ff7ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000061ff80000-0x000000061fffff=
ff] reserved
[    0.000000] reserve setup_data: [mem 0x0000000620000000-0x000000081ff7ff=
ff] usable
[    0.000000] reserve setup_data: [mem 0x000000081ff80000-0x000000081fffff=
ff] reserved
[    0.000000] user-defined physical RAM map:
[    0.000000] user: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] user: [mem 0x00000000000a0000-0x00000000000fffff] reserved
[    0.000000] user: [mem 0x0000000000100000-0x0000000039ffffff] usable
[    0.000000] user: [mem 0x000000003a000000-0x000000003f1fffff] reserved
[    0.000000] user: [mem 0x000000003f200000-0x0000000075daffff] usable
[    0.000000] user: [mem 0x0000000075db0000-0x0000000075ffffff] reserved
[    0.000000] user: [mem 0x0000000076000000-0x00000000d2afb017] usable
[    0.000000] user: [mem 0x00000000d2afb018-0x00000000d2b14457] usable
[    0.000000] user: [mem 0x00000000d2b14458-0x00000000d2b15017] usable
[    0.000000] user: [mem 0x00000000d2b15018-0x00000000d2b25857] usable
[    0.000000] user: [mem 0x00000000d2b25858-0x00000000d9036fff] usable
[    0.000000] user: [mem 0x00000000d9037000-0x00000000da49cfff] reserved
[    0.000000] user: [mem 0x00000000da49d000-0x00000000da4b7fff] usable
[    0.000000] user: [mem 0x00000000da4b8000-0x00000000da50ffff] ACPI NVS
[    0.000000] user: [mem 0x00000000da510000-0x00000000dad6afff] reserved
[    0.000000] user: [mem 0x00000000dad6b000-0x00000000dbffffff] usable
[    0.000000] user: [mem 0x00000000dc000000-0x00000000dfffffff] reserved
[    0.000000] user: [mem 0x00000000ea700000-0x00000000ea87ffff] reserved
[    0.000000] user: [mem 0x00000000ea8f0000-0x00000000ea8f0fff] reserved
[    0.000000] user: [mem 0x00000000eb200000-0x00000000eb37ffff] reserved
[    0.000000] user: [mem 0x00000000eb3f0000-0x00000000eb3f0fff] reserved
[    0.000000] user: [mem 0x00000000eb800000-0x00000000eb97ffff] reserved
[    0.000000] user: [mem 0x00000000eb9f0000-0x00000000eb9f0fff] reserved
[    0.000000] user: [mem 0x00000000ebf00000-0x00000000ebf7ffff] reserved
[    0.000000] user: [mem 0x00000000ebff0000-0x00000000ebff0fff] reserved
[    0.000000] user: [mem 0x00000000fea00000-0x00000000feafffff] reserved
[    0.000000] user: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.000000] user: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.000000] user: [mem 0x00000000fed00000-0x00000000fed00fff] reserved
[    0.000000] user: [mem 0x00000000fed40000-0x00000000fed44fff] reserved
[    0.000000] user: [mem 0x00000000fed80000-0x00000000fed8ffff] reserved
[    0.000000] user: [mem 0x00000000fedc0000-0x00000000fedc0fff] reserved
[    0.000000] user: [mem 0x00000000fedc2000-0x00000000fedc8fff] reserved
[    0.000000] user: [mem 0x00000000fee00000-0x00000000feefffff] reserved
[    0.000000] user: [mem 0x00000000ff000000-0x00000000ffffffff] reserved
[    0.000000] user: [mem 0x0000000100000000-0x000000021f37ffff] usable
[    0.000000] user: [mem 0x000000021f380000-0x000000021fffffff] reserved
[    0.000000] user: [mem 0x0000000220000000-0x000000041ff7ffff] usable
[    0.000000] user: [mem 0x000000041ff80000-0x000000041fffffff] reserved
[    0.000000] user: [mem 0x0000000420000000-0x000000061ff7ffff] usable
[    0.000000] user: [mem 0x000000061ff80000-0x000000061fffffff] reserved
[    0.000000] user: [mem 0x0000000620000000-0x000000081ff7ffff] usable
[    0.000000] user: [mem 0x000000081ff80000-0x000000081fffffff] reserved
[    0.000000] efi: EFI v2.60 by American Megatrends
[    0.000000] efi:  ACPI 2.0=3D0xda4b8000  ACPI=3D0xda4b8000  SMBIOS=3D0xd=
abe7000  SMBIOS 3.0=3D0xdabe6000  ESRT=3D0xd5b60f98  MEMATTR=3D0xd4ab2018=
=20
[    0.000000] secureboot: Secure boot disabled
[    0.000000] SMBIOS 3.1.1 present.
[    0.000000] DMI: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08/29/2018
[    0.000000] tsc: Fast TSC calibration using PIT
[    0.000000] tsc: Detected 2400.096 MHz processor
[    0.000598] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000601] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000615] last_pfn =3D 0x81ff80 max_arch_pfn =3D 0x400000000
[    0.000622] MTRR default type: uncachable
[    0.000624] MTRR fixed ranges enabled:
[    0.000626]   00000-9FFFF write-back
[    0.000627]   A0000-BFFFF write-through
[    0.000629]   C0000-FFFFF uncachable
[    0.000630] MTRR variable ranges enabled:
[    0.000632]   0 base 000000000000 mask FFFF80000000 write-back
[    0.000634]   1 base 000080000000 mask FFFFC0000000 write-back
[    0.000636]   2 base 0000C0000000 mask FFFFE0000000 write-back
[    0.000637]   3 base 0000DC000000 mask FFFFFC000000 uncachable
[    0.000639]   4 disabled
[    0.000640]   5 disabled
[    0.000641]   6 disabled
[    0.000642]   7 disabled
[    0.000644] TOM2: 0000000820000000 aka 33280M
[    0.001474] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.003273] e820: update [mem 0xdc000000-0xffffffff] usable =3D=3D> rese=
rved
[    0.003282] last_pfn =3D 0xdc000 max_arch_pfn =3D 0x400000000
[    0.027257] esrt: Reserving ESRT space from 0x00000000d5b60f98 to 0x0000=
0000d5b60fd0.
[    0.027274] check: Scanning 1 areas for low memory corruption
[    0.027280] Using GB pages for direct mapping
[    0.027283] BRK [0x3ec401000, 0x3ec401fff] PGTABLE
[    0.027286] BRK [0x3ec402000, 0x3ec402fff] PGTABLE
[    0.027288] BRK [0x3ec403000, 0x3ec403fff] PGTABLE
[    0.027357] BRK [0x3ec404000, 0x3ec404fff] PGTABLE
[    0.027360] BRK [0x3ec405000, 0x3ec405fff] PGTABLE
[    0.027739] BRK [0x3ec406000, 0x3ec406fff] PGTABLE
[    0.027836] BRK [0x3ec407000, 0x3ec407fff] PGTABLE
[    0.027987] BRK [0x3ec408000, 0x3ec408fff] PGTABLE
[    0.028089] BRK [0x3ec409000, 0x3ec409fff] PGTABLE
[    0.028215] BRK [0x3ec40a000, 0x3ec40afff] PGTABLE
[    0.028328] BRK [0x3ec40b000, 0x3ec40bfff] PGTABLE
[    0.028516] BRK [0x3ec40c000, 0x3ec40cfff] PGTABLE
[    0.044231] printk: log_buf_len: 134217728 bytes
[    0.044236] printk: early log buf free: 248440(94%)
[    0.044238] RAMDISK: [mem 0x7af6d000-0x7cbd1fff]
[    0.044248] ACPI: Early table checksum verification disabled
[    0.044255] ACPI: RSDP 0x00000000DA4B8000 000024 (v02 AMD   )
[    0.044261] ACPI: XSDT 0x00000000DA4B80B8 0000F4 (v01 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044269] ACPI: FACP 0x00000000DA4C4F30 000114 (v06 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044277] ACPI: DSDT 0x00000000DA4B8248 00CCE4 (v02 AMD    GBTUACPI 03=
242016 INTL 20120913)
[    0.044282] ACPI: FACS 0x00000000DA50FE80 000040
[    0.044286] ACPI: APIC 0x00000000DA4C5048 000482 (v04 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044290] ACPI: FPDT 0x00000000DA4C54D0 000044 (v01 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044294] ACPI: FIDT 0x00000000DA4C5518 00009C (v01 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044299] ACPI: SSDT 0x00000000DA4C55B8 0000D2 (v02 AMD    AMD ALIB 00=
000002 MSFT 04000000)
[    0.044303] ACPI: SPMI 0x00000000DA4C5690 000041 (v05 AMD    GBTUACPI 00=
000000 AMI. 00000000)
[    0.044307] ACPI: SSDT 0x00000000DA4C56D8 0000FC (v02 AMD    CPUSSDT  03=
242016 AMI  03242016)
[    0.044312] ACPI: MCFG 0x00000000DA4C57D8 00003C (v01 AMD    GBTUACPI 03=
242016 MSFT 00010013)
[    0.044316] ACPI: SSDT 0x00000000DA4C5818 001F04 (v01 AMD    AMD CPU  00=
000001 AMD  00000001)
[    0.044320] ACPI: SRAT 0x00000000DA4C7720 000220 (v03 AMD    AMD SRAT 00=
000001 AMD  00000001)
[    0.044324] ACPI: MSCT 0x00000000DA4C7940 00004E (v01 AMD    AMD MSCT 00=
000000 AMD  00000001)
[    0.044329] ACPI: SLIT 0x00000000DA4C7990 00003C (v01 AMD    AMD SLIT 00=
000001 AMD  00000001)
[    0.044333] ACPI: CRAT 0x00000000DA4C79D0 001FC0 (v01 AMD    AMD CRAT 00=
000001 AMD  00000001)
[    0.044337] ACPI: CDIT 0x00000000DA4C9990 000038 (v01 AMD    AMD CDIT 00=
000001 AMD  00000001)
[    0.044341] ACPI: BERT 0x00000000DA4C99C8 000030 (v01 AMD    AMD BERT 00=
000001 AMD  00000001)
[    0.044345] ACPI: EINJ 0x00000000DA4C99F8 000150 (v01 AMD    AMD EINJ 00=
000001 AMD  00000001)
[    0.044349] ACPI: HEST 0x00000000DA4C9B48 000608 (v01 AMD    AMD HEST 00=
000001 AMD  00000001)
[    0.044354] ACPI: HPET 0x00000000DA4CA150 000038 (v01 AMD    GBTUACPI 03=
242016 AMI  00000005)
[    0.044358] ACPI: SSDT 0x00000000DA4CA188 000024 (v01 AMDFCH FCHZP    00=
001000 INTL 20120913)
[    0.044362] ACPI: UEFI 0x00000000DA4CA1B0 000042 (v01                 00=
000000      00000000)
[    0.044366] ACPI: VFCT 0x00000000DA4CA1F8 00EE84 (v01 AMD    GBTUACPI 00=
000001 AMD  31504F47)
[    0.044371] ACPI: IVRS 0x00000000DA4D9080 0001F0 (v02 AMD    AMD IVRS 00=
000001 AMD  00000000)
[    0.044375] ACPI: BGRT 0x00000000DA4D9270 000038 (v01 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044379] ACPI: SSDT 0x00000000DA4D92A8 001630 (v01 AMD    CPMCMN   00=
000001 INTL 20120913)
[    0.044383] ACPI: WSMT 0x00000000DA4DA8D8 000028 (v01 AMD    GBTUACPI 03=
242016 AMI  00010013)
[    0.044387] ACPI: ERST 0x00000000DA4DA900 000230 (v01 AMIER  AMI.ERST 00=
000000 AMI. 00000000)
[    0.044396] ACPI: Local APIC address 0xfee00000
[    0.044437] SRAT: PXM 0 -> APIC 0x00 -> Node 0
[    0.044440] SRAT: PXM 0 -> APIC 0x01 -> Node 0
[    0.044442] SRAT: PXM 0 -> APIC 0x08 -> Node 0
[    0.044444] SRAT: PXM 0 -> APIC 0x09 -> Node 0
[    0.044446] SRAT: PXM 1 -> APIC 0x10 -> Node 1
[    0.044448] SRAT: PXM 1 -> APIC 0x11 -> Node 1
[    0.044450] SRAT: PXM 1 -> APIC 0x18 -> Node 1
[    0.044452] SRAT: PXM 1 -> APIC 0x19 -> Node 1
[    0.044454] SRAT: PXM 2 -> APIC 0x20 -> Node 2
[    0.044456] SRAT: PXM 2 -> APIC 0x21 -> Node 2
[    0.044458] SRAT: PXM 2 -> APIC 0x28 -> Node 2
[    0.044460] SRAT: PXM 2 -> APIC 0x29 -> Node 2
[    0.044462] SRAT: PXM 3 -> APIC 0x30 -> Node 3
[    0.044464] SRAT: PXM 3 -> APIC 0x31 -> Node 3
[    0.044466] SRAT: PXM 3 -> APIC 0x38 -> Node 3
[    0.044468] SRAT: PXM 3 -> APIC 0x39 -> Node 3
[    0.044472] ACPI: SRAT: Node 0 PXM 0 [mem 0x00000000-0x0009ffff]
[    0.044475] ACPI: SRAT: Node 0 PXM 0 [mem 0x00100000-0xdfffffff]
[    0.044477] ACPI: SRAT: Node 0 PXM 0 [mem 0x100000000-0x21fffffff]
[    0.044479] ACPI: SRAT: Node 1 PXM 1 [mem 0x220000000-0x41fffffff]
[    0.044481] ACPI: SRAT: Node 2 PXM 2 [mem 0x420000000-0x61fffffff]
[    0.044484] ACPI: SRAT: Node 3 PXM 3 [mem 0x620000000-0x81fffffff]
[    0.044491] NUMA: Initialized distance table, cnt=3D4
[    0.044494] NUMA: Node 0 [mem 0x00000000-0x0009ffff] + [mem 0x00100000-0=
xdfffffff] -> [mem 0x00000000-0xdfffffff]
[    0.044497] NUMA: Node 0 [mem 0x00000000-0xdfffffff] + [mem 0x100000000-=
0x21fffffff] -> [mem 0x00000000-0x21fffffff]
[    0.044511] NODE_DATA(0) allocated [mem 0x21f355000-0x21f37ffff]
[    0.044529] NODE_DATA(1) allocated [mem 0x41ff55000-0x41ff7ffff]
[    0.044547] NODE_DATA(2) allocated [mem 0x61ff55000-0x61ff7ffff]
[    0.044564] NODE_DATA(3) allocated [mem 0x81ff54000-0x81ff7efff]
[    0.109320] Zone ranges:
[    0.109327]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.109330]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.109332]   Normal   [mem 0x0000000100000000-0x000000081ff7ffff]
[    0.109335]   Device   empty
[    0.109337] Movable zone start for each node
[    0.109342] Early memory node ranges
[    0.109344]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.109346]   node   0: [mem 0x0000000000100000-0x0000000039ffffff]
[    0.109348]   node   0: [mem 0x000000003f200000-0x0000000075daffff]
[    0.109350]   node   0: [mem 0x0000000076000000-0x00000000d9036fff]
[    0.109352]   node   0: [mem 0x00000000da49d000-0x00000000da4b7fff]
[    0.109354]   node   0: [mem 0x00000000dad6b000-0x00000000dbffffff]
[    0.109356]   node   0: [mem 0x0000000100000000-0x000000021f37ffff]
[    0.109358]   node   1: [mem 0x0000000220000000-0x000000041ff7ffff]
[    0.109360]   node   2: [mem 0x0000000420000000-0x000000061ff7ffff]
[    0.109362]   node   3: [mem 0x0000000620000000-0x000000081ff7ffff]
[    0.110057] Zeroed struct page in unavailable ranges: 48970 pages
[    0.110059] Initmem setup node 0 [mem 0x0000000000001000-0x000000021f37f=
fff]
[    0.110063] On node 0 totalpages: 2048438
[    0.110066]   DMA zone: 64 pages used for memmap
[    0.110067]   DMA zone: 23 pages reserved
[    0.110069]   DMA zone: 3999 pages, LIFO batch:0
[    0.110160]   DMA32 zone: 13563 pages used for memmap
[    0.110161]   DMA32 zone: 867991 pages, LIFO batch:63
[    0.130150]   Normal zone: 18382 pages used for memmap
[    0.130154]   Normal zone: 1176448 pages, LIFO batch:63
[    0.155030] Initmem setup node 1 [mem 0x0000000220000000-0x000000041ff7f=
fff]
[    0.155036] On node 1 totalpages: 2097024
[    0.155038]   Normal zone: 32766 pages used for memmap
[    0.155040]   Normal zone: 2097024 pages, LIFO batch:63
[    0.199411] Initmem setup node 2 [mem 0x0000000420000000-0x000000061ff7f=
fff]
[    0.199418] On node 2 totalpages: 2097024
[    0.199421]   Normal zone: 32766 pages used for memmap
[    0.199423]   Normal zone: 2097024 pages, LIFO batch:63
[    0.243804] Initmem setup node 3 [mem 0x0000000620000000-0x000000081ff7f=
fff]
[    0.243811] On node 3 totalpages: 2097024
[    0.243813]   Normal zone: 32766 pages used for memmap
[    0.243815]   Normal zone: 2097024 pages, LIFO batch:63
[    0.288483] ACPI: PM-Timer IO Port: 0x808
[    0.288489] ACPI: Local APIC address 0xfee00000
[    0.288502] ACPI: LAPIC_NMI (acpi_id[0xff] high edge lint[0x1])
[    0.288527] IOAPIC[0]: apic_id 128, version 33, address 0xfec00000, GSI =
0-23
[    0.288537] IOAPIC[1]: apic_id 129, version 33, address 0xebff0000, GSI =
24-55
[    0.288549] IOAPIC[2]: apic_id 130, version 33, address 0xeb9f0000, GSI =
56-87
[    0.288560] IOAPIC[3]: apic_id 131, version 33, address 0xeb3f0000, GSI =
88-119
[    0.288566] IOAPIC[4]: apic_id 132, version 33, address 0xea8f0000, GSI =
120-151
[    0.288570] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.288573] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.288576] ACPI: IRQ0 used by override.
[    0.288578] ACPI: IRQ9 used by override.
[    0.288581] Using ACPI (MADT) for SMP configuration information
[    0.288584] ACPI: HPET id: 0x10228201 base: 0xfed00000
[    0.288598] smpboot: Allowing 128 CPUs, 112 hotplug CPUs
[    0.288657] PM: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.288661] PM: Registered nosave memory: [mem 0x000a0000-0x000fffff]
[    0.288664] PM: Registered nosave memory: [mem 0x3a000000-0x3f1fffff]
[    0.288668] PM: Registered nosave memory: [mem 0x75db0000-0x75ffffff]
[    0.288671] PM: Registered nosave memory: [mem 0xd2afb000-0xd2afbfff]
[    0.288675] PM: Registered nosave memory: [mem 0xd2b14000-0xd2b14fff]
[    0.288677] PM: Registered nosave memory: [mem 0xd2b15000-0xd2b15fff]
[    0.288680] PM: Registered nosave memory: [mem 0xd2b25000-0xd2b25fff]
[    0.288683] PM: Registered nosave memory: [mem 0xd9037000-0xda49cfff]
[    0.288687] PM: Registered nosave memory: [mem 0xda4b8000-0xda50ffff]
[    0.288689] PM: Registered nosave memory: [mem 0xda510000-0xdad6afff]
[    0.288692] PM: Registered nosave memory: [mem 0xdc000000-0xdfffffff]
[    0.288694] PM: Registered nosave memory: [mem 0xe0000000-0xea6fffff]
[    0.288696] PM: Registered nosave memory: [mem 0xea700000-0xea87ffff]
[    0.288698] PM: Registered nosave memory: [mem 0xea880000-0xea8effff]
[    0.288700] PM: Registered nosave memory: [mem 0xea8f0000-0xea8f0fff]
[    0.288702] PM: Registered nosave memory: [mem 0xea8f1000-0xeb1fffff]
[    0.288704] PM: Registered nosave memory: [mem 0xeb200000-0xeb37ffff]
[    0.288706] PM: Registered nosave memory: [mem 0xeb380000-0xeb3effff]
[    0.288708] PM: Registered nosave memory: [mem 0xeb3f0000-0xeb3f0fff]
[    0.288709] PM: Registered nosave memory: [mem 0xeb3f1000-0xeb7fffff]
[    0.288711] PM: Registered nosave memory: [mem 0xeb800000-0xeb97ffff]
[    0.288713] PM: Registered nosave memory: [mem 0xeb980000-0xeb9effff]
[    0.288715] PM: Registered nosave memory: [mem 0xeb9f0000-0xeb9f0fff]
[    0.288717] PM: Registered nosave memory: [mem 0xeb9f1000-0xebefffff]
[    0.288719] PM: Registered nosave memory: [mem 0xebf00000-0xebf7ffff]
[    0.288721] PM: Registered nosave memory: [mem 0xebf80000-0xebfeffff]
[    0.288723] PM: Registered nosave memory: [mem 0xebff0000-0xebff0fff]
[    0.288725] PM: Registered nosave memory: [mem 0xebff1000-0xfe9fffff]
[    0.288727] PM: Registered nosave memory: [mem 0xfea00000-0xfeafffff]
[    0.288729] PM: Registered nosave memory: [mem 0xfeb00000-0xfebfffff]
[    0.288731] PM: Registered nosave memory: [mem 0xfec00000-0xfec00fff]
[    0.288733] PM: Registered nosave memory: [mem 0xfec01000-0xfec0ffff]
[    0.288735] PM: Registered nosave memory: [mem 0xfec10000-0xfec10fff]
[    0.288737] PM: Registered nosave memory: [mem 0xfec11000-0xfecfffff]
[    0.288739] PM: Registered nosave memory: [mem 0xfed00000-0xfed00fff]
[    0.288741] PM: Registered nosave memory: [mem 0xfed01000-0xfed3ffff]
[    0.288743] PM: Registered nosave memory: [mem 0xfed40000-0xfed44fff]
[    0.288745] PM: Registered nosave memory: [mem 0xfed45000-0xfed7ffff]
[    0.288747] PM: Registered nosave memory: [mem 0xfed80000-0xfed8ffff]
[    0.288749] PM: Registered nosave memory: [mem 0xfed90000-0xfedbffff]
[    0.288751] PM: Registered nosave memory: [mem 0xfedc0000-0xfedc0fff]
[    0.288753] PM: Registered nosave memory: [mem 0xfedc1000-0xfedc1fff]
[    0.288754] PM: Registered nosave memory: [mem 0xfedc2000-0xfedc8fff]
[    0.288756] PM: Registered nosave memory: [mem 0xfedc9000-0xfedfffff]
[    0.288758] PM: Registered nosave memory: [mem 0xfee00000-0xfeefffff]
[    0.288760] PM: Registered nosave memory: [mem 0xfef00000-0xfeffffff]
[    0.288762] PM: Registered nosave memory: [mem 0xff000000-0xffffffff]
[    0.288766] PM: Registered nosave memory: [mem 0x21f380000-0x21fffffff]
[    0.288769] PM: Registered nosave memory: [mem 0x41ff80000-0x41fffffff]
[    0.288773] PM: Registered nosave memory: [mem 0x61ff80000-0x61fffffff]
[    0.288777] [mem 0xebff1000-0xfe9fffff] available for PCI devices
[    0.288780] Booting paravirtualized kernel on bare hardware
[    0.288787] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.427536] random: get_random_bytes called from start_kernel+0x9b/0x544=
 with crng_init=3D0
[    0.427550] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:128 nr_cpu_ids:12=
8 nr_node_ids:4
[    0.492204] percpu: Embedded 494 pages/cpu s1986560 r8192 d28672 u209715=
2
[    0.492228] pcpu-alloc: s1986560 r8192 d28672 u2097152 alloc=3D1*2097152
[    0.492230] pcpu-alloc: [0] 000 [0] 001 [0] 002 [0] 003=20
[    0.492235] pcpu-alloc: [0] 016 [0] 020 [0] 024 [0] 028=20
[    0.492239] pcpu-alloc: [0] 032 [0] 036 [0] 040 [0] 044=20
[    0.492243] pcpu-alloc: [0] 048 [0] 052 [0] 056 [0] 060=20
[    0.492247] pcpu-alloc: [0] 064 [0] 068 [0] 072 [0] 076=20
[    0.492250] pcpu-alloc: [0] 080 [0] 084 [0] 088 [0] 092=20
[    0.492254] pcpu-alloc: [0] 096 [0] 100 [0] 104 [0] 108=20
[    0.492258] pcpu-alloc: [0] 112 [0] 116 [0] 120 [0] 124=20
[    0.492262] pcpu-alloc: [1] 004 [1] 005 [1] 006 [1] 007=20
[    0.492265] pcpu-alloc: [1] 017 [1] 021 [1] 025 [1] 029=20
[    0.492269] pcpu-alloc: [1] 033 [1] 037 [1] 041 [1] 045=20
[    0.492273] pcpu-alloc: [1] 049 [1] 053 [1] 057 [1] 061=20
[    0.492276] pcpu-alloc: [1] 065 [1] 069 [1] 073 [1] 077=20
[    0.492280] pcpu-alloc: [1] 081 [1] 085 [1] 089 [1] 093=20
[    0.492284] pcpu-alloc: [1] 097 [1] 101 [1] 105 [1] 109=20
[    0.492287] pcpu-alloc: [1] 113 [1] 117 [1] 121 [1] 125=20
[    0.492291] pcpu-alloc: [2] 008 [2] 009 [2] 010 [2] 011=20
[    0.492295] pcpu-alloc: [2] 018 [2] 022 [2] 026 [2] 030=20
[    0.492298] pcpu-alloc: [2] 034 [2] 038 [2] 042 [2] 046=20
[    0.492302] pcpu-alloc: [2] 050 [2] 054 [2] 058 [2] 062=20
[    0.492306] pcpu-alloc: [2] 066 [2] 070 [2] 074 [2] 078=20
[    0.492309] pcpu-alloc: [2] 082 [2] 086 [2] 090 [2] 094=20
[    0.492313] pcpu-alloc: [2] 098 [2] 102 [2] 106 [2] 110=20
[    0.492317] pcpu-alloc: [2] 114 [2] 118 [2] 122 [2] 126=20
[    0.492320] pcpu-alloc: [3] 012 [3] 013 [3] 014 [3] 015=20
[    0.492324] pcpu-alloc: [3] 019 [3] 023 [3] 027 [3] 031=20
[    0.492328] pcpu-alloc: [3] 035 [3] 039 [3] 043 [3] 047=20
[    0.492331] pcpu-alloc: [3] 051 [3] 055 [3] 059 [3] 063=20
[    0.492335] pcpu-alloc: [3] 067 [3] 071 [3] 075 [3] 079=20
[    0.492339] pcpu-alloc: [3] 083 [3] 087 [3] 091 [3] 095=20
[    0.492342] pcpu-alloc: [3] 099 [3] 103 [3] 107 [3] 111=20
[    0.492346] pcpu-alloc: [3] 115 [3] 119 [3] 123 [3] 127=20
[    0.492451] Built 4 zonelists, mobility grouping on.  Total pages: 82091=
80
[    0.492453] Policy zone: Normal
[    0.492465] Kernel command line: BOOT_IMAGE=3D(hd8,gpt2)/vmlinuz-5.0.16-=
300.local.fc30.x86_64 root=3DUUID=3Ded3d2375-084d-422f-89dc-f609b60ffb0f ro=
 amd_iommu=3Doff memmap=3D0x5200000$0x3a000000 log_buf_len=3D128M
[    1.722225] Memory: 32226332K/33358040K available (14339K kernel code, 3=
233K rwdata, 4388K rodata, 4876K init, 18484K bss, 1131708K reserved, 0K cm=
a-reserved)
[    1.723508] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D128,=
 Nodes=3D4
[    1.723812] ftrace: allocating 39559 entries in 155 pages
[    1.742214] Running RCU self tests
[    1.742218] rcu: Hierarchical RCU implementation.
[    1.742220] rcu: =09RCU lockdep checking is enabled.
[    1.742222] rcu: =09RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_i=
ds=3D128.
[    1.742224] rcu: =09RCU callback double-/use-after-free debug enabled.
[    1.742227] =09Tasks RCU enabled.
[    1.742229] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    1.742231] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D128
[    1.745843] NR_IRQS: 524544, nr_irqs: 3624, preallocated irqs: 16
[    1.746932] Console: colour dummy device 80x25
[    1.749682] printk: console [tty0] enabled
[    1.749712] Lock dependency validator: Copyright (c) 2006 Red Hat, Inc.,=
 Ingo Molnar
[    1.749724] ... MAX_LOCKDEP_SUBCLASSES:  8
[    1.749731] ... MAX_LOCK_DEPTH:          48
[    1.749738] ... MAX_LOCKDEP_KEYS:        8191
[    1.749745] ... CLASSHASH_SIZE:          4096
[    1.749752] ... MAX_LOCKDEP_ENTRIES:     32768
[    1.749759] ... MAX_LOCKDEP_CHAINS:      65536
[    1.749766] ... CHAINHASH_SIZE:          32768
[    1.749774]  memory used by lock dependency info: 7775 kB
[    1.749782]  per task-struct memory footprint: 2688 bytes
[    1.749791] kmemleak: Kernel memory leak detector disabled
[    1.750019] mempolicy: Enabling automatic NUMA balancing. Configure with=
 numa_balancing=3D or the kernel.numa_balancing sysctl
[    1.750057] ACPI: Core revision 20181213
[    1.750602] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, =
max_idle_ns: 133484873504 ns
[    1.750651] hpet clockevent registered
[    1.750665] APIC: Switch to symmetric I/O mode setup
[    1.751782] AMD-Vi: AMD IOMMU disabled on kernel command-line
[    1.751853] WARNING: CPU: 0 PID: 0 at kernel/workqueue.c:2675 flush_work=
queue+0x506/0x560
[    1.751865] Modules linked in:
[    1.751873] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.0.16-300.local.f=
c30.x86_64 #1
[    1.751885] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[    1.751898] RIP: 0010:flush_workqueue+0x506/0x560
[    1.751906] Code: 20 ec 45 00 84 c0 0f 84 c5 fc ff ff 4c 89 ab f0 00 00 =
00 4c 89 b5 50 ff ff ff 4c 89 a5 58 ff ff ff 4d 89 2c 24 e9 a7 fc ff ff <0f=
> 0b e9 cb fc ff ff 0f 0b e9 8e fe ff ff 0f 0b e9 7d fe ff ff 0f
[    1.751930] RSP: 0000:ffffffff8f603cf0 EFLAGS: 00010246
[    1.751939] RAX: ffffffff8f603d78 RBX: 0000000000000000 RCX: 00000000000=
00000
[    1.751949] RDX: ffffffff90261238 RSI: 0000000000000001 RDI: ffffffff902=
61238
[    1.751960] RBP: ffffffff8f603dc0 R08: 0000000000000002 R09: 00000000000=
00000
[    1.751970] R10: ffffffff8f603de0 R11: 0000000000000000 R12: dead0000000=
00200
[    1.751980] R13: ffffffff8f603d10 R14: 0000000000010000 R15: 00000000000=
00001
[    1.751991] FS:  0000000000000000(0000) GS:ffff97ad93000000(0000) knlGS:=
0000000000000000
[    1.752003] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[    1.752011] CR2: ffff97b39fdff000 CR3: 00000003ea616000 CR4: 00000000000=
406b0
[    1.752022] Call Trace:
[    1.752031]  ? mark_held_locks+0x57/0x80
[    1.752041]  ? _raw_spin_unlock_irq+0x29/0x40
[    1.752057]  ? kmem_cache_destroy+0x5d/0x290
[    1.752065]  kmem_cache_destroy+0x5d/0x290
[    1.752074]  ? __free_pages_ok+0x25d/0x580
[    1.752086]  free_iommu_resources+0x66/0x1ae
[    1.752095]  iommu_go_to_state+0xb4f/0x13a6
[    1.752106]  amd_iommu_prepare+0x16/0x2a
[    1.752114]  irq_remapping_prepare+0x36/0x46
[    1.752123]  enable_IR_x2apic+0x21/0x1a9
[    1.752131]  default_setup_apic_routing+0x12/0x6f
[    1.752140]  apic_intr_mode_init+0x15c/0x197
[    1.752149]  x86_late_time_init+0x17/0x1c
[    1.752158]  start_kernel+0x48a/0x544
[    1.752168]  secondary_startup_64+0xa4/0xb0
[    1.752181] irq event stamp: 1564
[    1.752188] hardirqs last  enabled at (1563): [<ffffffff8eac3639>] _raw_=
spin_unlock_irq+0x29/0x40
[    1.752202] hardirqs last disabled at (1564): [<ffffffff8e0037f7>] trace=
_hardirqs_off_thunk+0x1a/0x1c
[    1.752217] softirqs last  enabled at (1282): [<ffffffff8ee0035d>] __do_=
softirq+0x35d/0x468
[    1.752229] softirqs last disabled at (1275): [<ffffffff8e0ee4e9>] irq_e=
xit+0x119/0x120
[    1.752243] ---[ end trace 3b29a267a344a2e2 ]---
[    1.752463] Switched APIC routing to physical flat.
[    1.753856] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D=
-1
[    1.758666] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x2298925753e, max_idle_ns: 440795325958 ns
[    1.758700] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 4800.19 BogoMIPS (lpj=3D2400096)
[    1.758719] pid_max: default: 131072 minimum: 1024
[    1.768261] ---[ User Space ]---
[    1.768269] 0x0000000000000000-0x0000000000001000           4K     RW   =
                  x  pte
[    1.768292] 0x0000000000001000-0x0000000000200000        2044K          =
                     pte
[    1.768308] 0x0000000000200000-0x0000000001000000          14M          =
                     pmd
[    1.768324] 0x0000000001000000-0x0000000001020000         128K          =
                     pte
[    1.768344] 0x0000000001020000-0x0000000001200000        1920K          =
                     pte
[    1.768362] 0x0000000001200000-0x0000000030000000         750M          =
                     pmd
[    1.768378] 0x0000000030000000-0x000000003003b000         236K          =
                     pte
[    1.768398] 0x000000003003b000-0x0000000030200000        1812K          =
                     pte
[    1.768414] 0x0000000030200000-0x0000000040000000         254M          =
                     pmd
[    1.768429] 0x0000000040000000-0x00000000c0000000           2G          =
                     pud
[    1.768445] 0x00000000c0000000-0x00000000d2e00000         302M          =
                     pmd
[    1.768464] 0x00000000d2e00000-0x00000000d2f8a000        1576K          =
                     pte
[    1.768481] 0x00000000d2f8a000-0x00000000d3000000         472K     RW   =
                  x  pte
[    1.768498] 0x00000000d3000000-0x00000000d5a00000          42M     RW   =
      PSE         x  pmd
[    1.768518] 0x00000000d5a00000-0x00000000d5b61000        1412K     RW   =
                  x  pte
[    1.768536] 0x00000000d5b61000-0x00000000d5c00000         636K          =
                     pte
[    1.768551] 0x00000000d5c00000-0x00000000d6200000           6M          =
                     pmd
[    1.768569] 0x00000000d6200000-0x00000000d6310000        1088K          =
                     pte
[    1.768585] 0x00000000d6310000-0x00000000d6368000         352K     RW   =
                  x  pte
[    1.768603] 0x00000000d6368000-0x00000000d6400000         608K          =
                     pte
[    1.768619] 0x00000000d6400000-0x00000000d8a00000          38M          =
                     pmd
[    1.768634] 0x00000000d8a00000-0x00000000d8a37000         220K          =
                     pte
[    1.768653] 0x00000000d8a37000-0x00000000d8bc2000        1580K          =
                     pte
[    1.768669] 0x00000000d8bc2000-0x00000000d8c00000         248K          =
                     pte
[    1.768684] 0x00000000d8c00000-0x00000000d9000000           4M          =
                     pmd
[    1.768695] 0x00000000d9000000-0x00000000d9037000         220K          =
                     pte
[    1.768715] 0x00000000d9037000-0x00000000d9200000        1828K          =
                     pte
[    1.768730] 0x00000000d9200000-0x00000000da400000          18M          =
                     pmd
[    1.768748] 0x00000000da400000-0x00000000da510000        1088K          =
                     pte
[    1.768766] 0x00000000da510000-0x00000000da600000         960K     RW   =
                  NX pte
[    1.768782] 0x00000000da600000-0x00000000dac00000           6M     RW   =
      PSE         NX pmd
[    1.768801] 0x00000000dac00000-0x00000000dacc3000         780K     RW   =
                  NX pte
[    1.768818] 0x00000000dacc3000-0x00000000dacc6000          12K     ro   =
                  x  pte
[    1.768835] 0x00000000dacc6000-0x00000000daccb000          20K     RW   =
                  NX pte
[    1.768851] 0x00000000daccb000-0x00000000daccc000           4K     ro   =
                  x  pte
[    1.768868] 0x00000000daccc000-0x00000000dacd0000          16K     RW   =
                  NX pte
[    1.768885] 0x00000000dacd0000-0x00000000dacd1000           4K     ro   =
                  x  pte
[    1.768902] 0x00000000dacd1000-0x00000000dacd5000          16K     RW   =
                  NX pte
[    1.768918] 0x00000000dacd5000-0x00000000dacd8000          12K     ro   =
                  x  pte
[    1.768935] 0x00000000dacd8000-0x00000000dacdd000          20K     RW   =
                  NX pte
[    1.768952] 0x00000000dacdd000-0x00000000dacdf000           8K     ro   =
                  x  pte
[    1.768969] 0x00000000dacdf000-0x00000000dace4000          20K     RW   =
                  NX pte
[    1.768986] 0x00000000dace4000-0x00000000dace5000           4K     ro   =
                  x  pte
[    1.769002] 0x00000000dace5000-0x00000000dace9000          16K     RW   =
                  NX pte
[    1.769019] 0x00000000dace9000-0x00000000dacea000           4K     ro   =
                  x  pte
[    1.769036] 0x00000000dacea000-0x00000000dacee000          16K     RW   =
                  NX pte
[    1.769052] 0x00000000dacee000-0x00000000dacf0000           8K     ro   =
                  x  pte
[    1.769069] 0x00000000dacf0000-0x00000000dacf5000          20K     RW   =
                  NX pte
[    1.769086] 0x00000000dacf5000-0x00000000dacf6000           4K     ro   =
                  x  pte
[    1.769103] 0x00000000dacf6000-0x00000000dacfa000          16K     RW   =
                  NX pte
[    1.769120] 0x00000000dacfa000-0x00000000dacfd000          12K     ro   =
                  x  pte
[    1.769136] 0x00000000dacfd000-0x00000000dad01000          16K     RW   =
                  NX pte
[    1.769153] 0x00000000dad01000-0x00000000dad0e000          52K     ro   =
                  x  pte
[    1.769170] 0x00000000dad0e000-0x00000000dad15000          28K     RW   =
                  NX pte
[    1.769187] 0x00000000dad15000-0x00000000dad17000           8K     ro   =
                  x  pte
[    1.769204] 0x00000000dad17000-0x00000000dad1d000          24K     RW   =
                  NX pte
[    1.769220] 0x00000000dad1d000-0x00000000dad1f000           8K     ro   =
                  x  pte
[    1.769237] 0x00000000dad1f000-0x00000000dad25000          24K     RW   =
                  NX pte
[    1.769254] 0x00000000dad25000-0x00000000dad26000           4K     ro   =
                  x  pte
[    1.769271] 0x00000000dad26000-0x00000000dad2b000          20K     RW   =
                  NX pte
[    1.769288] 0x00000000dad2b000-0x00000000dad2c000           4K     ro   =
                  x  pte
[    1.769304] 0x00000000dad2c000-0x00000000dad31000          20K     RW   =
                  NX pte
[    1.769321] 0x00000000dad31000-0x00000000dad32000           4K     ro   =
                  x  pte
[    1.769338] 0x00000000dad32000-0x00000000dad37000          20K     RW   =
                  NX pte
[    1.769355] 0x00000000dad37000-0x00000000dad38000           4K     ro   =
                  x  pte
[    1.769371] 0x00000000dad38000-0x00000000dad3d000          20K     RW   =
                  NX pte
[    1.769388] 0x00000000dad3d000-0x00000000dad40000          12K     ro   =
                  x  pte
[    1.769405] 0x00000000dad40000-0x00000000dad45000          20K     RW   =
                  NX pte
[    1.769422] 0x00000000dad45000-0x00000000dad4f000          40K     ro   =
                  x  pte
[    1.769439] 0x00000000dad4f000-0x00000000dad56000          28K     RW   =
                  NX pte
[    1.769456] 0x00000000dad56000-0x00000000dad5b000          20K     ro   =
                  x  pte
[    1.769472] 0x00000000dad5b000-0x00000000dad61000          24K     RW   =
                  NX pte
[    1.769489] 0x00000000dad61000-0x00000000dad65000          16K     ro   =
                  x  pte
[    1.769506] 0x00000000dad65000-0x00000000dad6b000          24K     RW   =
                  NX pte
[    1.769524] 0x00000000dad6b000-0x00000000dae00000         596K          =
                     pte
[    1.769539] 0x00000000dae00000-0x00000000dc000000          18M          =
                     pmd
[    1.769556] 0x00000000dc000000-0x00000000ea600000         230M          =
                     pmd
[    1.769573] 0x00000000ea600000-0x00000000ea700000           1M          =
                     pte
[    1.769592] 0x00000000ea700000-0x00000000ea880000        1536K     RW   =
                  x  pte
[    1.769610] 0x00000000ea880000-0x00000000ea8f0000         448K          =
                     pte
[    1.769625] 0x00000000ea8f0000-0x00000000ea8f1000           4K     RW   =
                  x  pte
[    1.769644] 0x00000000ea8f1000-0x00000000eaa00000        1084K          =
                     pte
[    1.769659] 0x00000000eaa00000-0x00000000eb200000           8M          =
                     pmd
[    1.769678] 0x00000000eb200000-0x00000000eb380000        1536K     RW   =
                  x  pte
[    1.769709] 0x00000000eb380000-0x00000000eb3f0000         448K          =
                     pte
[    1.769724] 0x00000000eb3f0000-0x00000000eb3f1000           4K     RW   =
                  x  pte
[    1.769741] 0x00000000eb3f1000-0x00000000eb400000          60K          =
                     pte
[    1.769756] 0x00000000eb400000-0x00000000eb800000           4M          =
                     pmd
[    1.769775] 0x00000000eb800000-0x00000000eb980000        1536K     RW   =
                  x  pte
[    1.769793] 0x00000000eb980000-0x00000000eb9f0000         448K          =
                     pte
[    1.769808] 0x00000000eb9f0000-0x00000000eb9f1000           4K     RW   =
                  x  pte
[    1.769825] 0x00000000eb9f1000-0x00000000eba00000          60K          =
                     pte
[    1.769840] 0x00000000eba00000-0x00000000ebe00000           4M          =
                     pmd
[    1.769858] 0x00000000ebe00000-0x00000000ebf00000           1M          =
                     pte
[    1.769874] 0x00000000ebf00000-0x00000000ebf80000         512K     RW   =
                  x  pte
[    1.769892] 0x00000000ebf80000-0x00000000ebff0000         448K          =
                     pte
[    1.769907] 0x00000000ebff0000-0x00000000ebff1000           4K     RW   =
                  x  pte
[    1.769924] 0x00000000ebff1000-0x00000000ec000000          60K          =
                     pte
[    1.769940] 0x00000000ec000000-0x00000000fea00000         298M          =
                     pmd
[    1.769958] 0x00000000fea00000-0x00000000feb00000           1M     RW   =
                  x  pte
[    1.769977] 0x00000000feb00000-0x00000000fec00000           1M          =
                     pte
[    1.769992] 0x00000000fec00000-0x00000000fec01000           4K     RW   =
                  x  pte
[    1.770009] 0x00000000fec01000-0x00000000fec10000          60K          =
                     pte
[    1.770024] 0x00000000fec10000-0x00000000fec11000           4K     RW   =
                  x  pte
[    1.770043] 0x00000000fec11000-0x00000000fed00000         956K          =
                     pte
[    1.770058] 0x00000000fed00000-0x00000000fed01000           4K     RW   =
                  x  pte
[    1.770075] 0x00000000fed01000-0x00000000fed40000         252K          =
                     pte
[    1.770091] 0x00000000fed40000-0x00000000fed45000          20K     RW   =
                  x  pte
[    1.770108] 0x00000000fed45000-0x00000000fed80000         236K          =
                     pte
[    1.770123] 0x00000000fed80000-0x00000000fed90000          64K     RW   =
                  x  pte
[    1.770140] 0x00000000fed90000-0x00000000fedc0000         192K          =
                     pte
[    1.770155] 0x00000000fedc0000-0x00000000fedc1000           4K     RW   =
                  x  pte
[    1.770172] 0x00000000fedc1000-0x00000000fedc2000           4K          =
                     pte
[    1.770187] 0x00000000fedc2000-0x00000000fedc9000          28K     RW   =
                  x  pte
[    1.770205] 0x00000000fedc9000-0x00000000fee00000         220K          =
                     pte
[    1.770222] 0x00000000fee00000-0x00000000fef00000           1M     RW   =
                  x  pte
[    1.770241] 0x00000000fef00000-0x00000000ff000000           1M          =
                     pte
[    1.770257] 0x00000000ff000000-0x0000000100000000          16M     RW   =
      PSE         x  pmd
[    1.770273] 0x0000000100000000-0x0000000200000000           4G          =
                     pud
[    1.770290] 0x0000000200000000-0x0000000212c00000         300M          =
                     pmd
[    1.770309] 0x0000000212c00000-0x0000000212db2000        1736K          =
                     pte
[    1.770324] 0x0000000212db2000-0x0000000212db4000           8K     RW   =
                  NX pte
[    1.770342] 0x0000000212db4000-0x0000000212e00000         304K          =
                     pte
[    1.770359] 0x0000000212e00000-0x0000000240000000         722M          =
                     pmd
[    1.770378] 0x0000000240000000-0x0000008000000000         503G          =
                     pud
[    1.770398] 0x0000008000000000-0xffff800000000000   17179737600G        =
                       pgd
[    1.770414] ---[ Kernel Space ]---
[    1.770421] 0xffff800000000000-0xffff808000000000         512G          =
                     pgd
[    1.770436] ---[ LDT remap ]---
[    1.770443] 0xffff808000000000-0xffff810000000000         512G          =
                     pgd
[    1.770458] ---[ Low Kernel Mapping ]---
[    1.770466] 0xffff810000000000-0xffff818000000000         512G          =
                     pgd
[    1.770481] ---[ vmalloc() Area ]---
[    1.770488] 0xffff818000000000-0xffff820000000000         512G          =
                     pgd
[    1.770503] ---[ Vmemmap ]---
[    1.770511] 0xffff820000000000-0xffff978000000000       22016G          =
                     pgd
[    1.770527] 0xffff978000000000-0xffff97ab80000000         174G          =
                     pud
[    1.770547] 0xffff97ab80000000-0xffff97ab80200000           2M     RW   =
              GLB NX pte
[    1.770567] 0xffff97ab80200000-0xffff97abba000000         926M     RW   =
      PSE     GLB NX pmd
[    1.770584] 0xffff97abba000000-0xffff97abbf200000          82M          =
                     pmd
[    1.770603] 0xffff97abbf200000-0xffff97abf5c00000         874M     RW   =
      PSE     GLB NX pmd
[    1.770624] 0xffff97abf5c00000-0xffff97abf5db0000        1728K     RW   =
              GLB NX pte
[    1.770641] 0xffff97abf5db0000-0xffff97abf5e00000         320K          =
                     pte
[    1.770657] 0xffff97abf5e00000-0xffff97abf6000000           2M          =
                     pmd
[    1.770673] 0xffff97abf6000000-0xffff97ac00000000         160M     RW   =
      PSE     GLB NX pmd
[    1.770689] 0xffff97ac00000000-0xffff97ac40000000           1G     RW   =
      PSE     GLB NX pud
[    1.770712] 0xffff97ac40000000-0xffff97ac59000000         400M     RW   =
      PSE     GLB NX pmd
[    1.770729] 0xffff97ac59000000-0xffff97ac59037000         220K     RW   =
              GLB NX pte
[    1.770750] 0xffff97ac59037000-0xffff97ac59200000        1828K          =
                     pte
[    1.770765] 0xffff97ac59200000-0xffff97ac5a400000          18M          =
                     pmd
[    1.770782] 0xffff97ac5a400000-0xffff97ac5a49d000         628K          =
                     pte
[    1.770797] 0xffff97ac5a49d000-0xffff97ac5a4b8000         108K     RW   =
              GLB NX pte
[    1.770817] 0xffff97ac5a4b8000-0xffff97ac5a600000        1312K          =
                     pte
[    1.770832] 0xffff97ac5a600000-0xffff97ac5ac00000           6M          =
                     pmd
[    1.770851] 0xffff97ac5ac00000-0xffff97ac5ad6b000        1452K          =
                     pte
[    1.770867] 0xffff97ac5ad6b000-0xffff97ac5ae00000         596K     RW   =
              GLB NX pte
[    1.770884] 0xffff97ac5ae00000-0xffff97ac5c000000          18M     RW   =
      PSE     GLB NX pmd
[    1.770903] 0xffff97ac5c000000-0xffff97ac80000000         576M          =
                     pmd
[    1.770918] 0xffff97ac80000000-0xffff97ad80000000           4G     RW   =
      PSE     GLB NX pud
[    1.770937] 0xffff97ad80000000-0xffff97ad9f200000         498M     RW   =
      PSE     GLB NX pmd
[    1.770957] 0xffff97ad9f200000-0xffff97ad9f380000        1536K     RW   =
              GLB NX pte
[    1.770975] 0xffff97ad9f380000-0xffff97ad9f400000         512K          =
                     pte
[    1.770990] 0xffff97ad9f400000-0xffff97ada0000000          12M          =
                     pmd
[    1.771007] 0xffff97ada0000000-0xffff97adc0000000         512M     RW   =
      PSE     GLB NX pmd
[    1.771024] 0xffff97adc0000000-0xffff97af80000000           7G     RW   =
      PSE     GLB NX pud
[    1.771043] 0xffff97af80000000-0xffff97af9fe00000         510M     RW   =
      PSE     GLB NX pmd
[    1.771064] 0xffff97af9fe00000-0xffff97af9ff80000        1536K     RW   =
              GLB NX pte
[    1.771082] 0xffff97af9ff80000-0xffff97afa0000000         512K          =
                     pte
[    1.771099] 0xffff97afa0000000-0xffff97afc0000000         512M     RW   =
      PSE     GLB NX pmd
[    1.771116] 0xffff97afc0000000-0xffff97b180000000           7G     RW   =
      PSE     GLB NX pud
[    1.771135] 0xffff97b180000000-0xffff97b19fe00000         510M     RW   =
      PSE     GLB NX pmd
[    1.771155] 0xffff97b19fe00000-0xffff97b19ff80000        1536K     RW   =
              GLB NX pte
[    1.771173] 0xffff97b19ff80000-0xffff97b1a0000000         512K          =
                     pte
[    1.771190] 0xffff97b1a0000000-0xffff97b1c0000000         512M     RW   =
      PSE     GLB NX pmd
[    1.771207] 0xffff97b1c0000000-0xffff97b380000000           7G     RW   =
      PSE     GLB NX pud
[    1.771226] 0xffff97b380000000-0xffff97b39fe00000         510M     RW   =
      PSE     GLB NX pmd
[    1.771246] 0xffff97b39fe00000-0xffff97b39ff80000        1536K     RW   =
              GLB NX pte
[    1.771264] 0xffff97b39ff80000-0xffff97b3a0000000         512K          =
                     pte
[    1.771281] 0xffff97b3a0000000-0xffff97b3c0000000         512M          =
                     pmd
[    1.771298] 0xffff97b3c0000000-0xffff980000000000         305G          =
                     pud
[    1.771314] 0xffff980000000000-0xffffae0000000000          22T          =
                     pgd
[    1.771330] 0xffffae0000000000-0xffffae1580000000          86G          =
                     pud
[    1.771345] 0xffffae1580000000-0xffffae1580002000           8K     RW   =
              GLB NX pte
[    1.771362] 0xffffae1580002000-0xffffae1580003000           4K          =
                     pte
[    1.771377] 0xffffae1580003000-0xffffae1580004000           4K     RW   =
              GLB NX pte
[    1.771394] 0xffffae1580004000-0xffffae1580005000           4K          =
                     pte
[    1.771409] 0xffffae1580005000-0xffffae1580006000           4K     RW   =
  PCD         GLB NX pte
[    1.771426] 0xffffae1580006000-0xffffae1580008000           8K          =
                     pte
[    1.771441] 0xffffae1580008000-0xffffae158000b000          12K     RW   =
              GLB NX pte
[    1.771458] 0xffffae158000b000-0xffffae158000c000           4K          =
                     pte
[    1.771473] 0xffffae158000c000-0xffffae158000f000          12K     RW   =
              GLB NX pte
[    1.771490] 0xffffae158000f000-0xffffae1580010000           4K          =
                     pte
[    1.771505] 0xffffae1580010000-0xffffae158001d000          52K     RW   =
              GLB NX pte
[    1.771522] 0xffffae158001d000-0xffffae158001e000           4K          =
                     pte
[    1.771537] 0xffffae158001e000-0xffffae1580020000           8K     RW   =
              GLB NX pte
[    1.771554] 0xffffae1580020000-0xffffae1580022000           8K          =
                     pte
[    1.771569] 0xffffae1580022000-0xffffae1580024000           8K     RW   =
              GLB NX pte
[    1.771586] 0xffffae1580024000-0xffffae1580030000          48K          =
                     pte
[    1.771601] 0xffffae1580030000-0xffffae1580040000          64K     RW   =
              GLB NX pte
[    1.771627] 0xffffae1580040000-0xffffae1580400000        3840K          =
                     pte
[    1.771645] 0xffffae1580400000-0xffffae15c0000000        1020M          =
                     pmd
[    1.771663] 0xffffae15c0000000-0xffffae8000000000         425G          =
                     pud
[    1.771681] 0xffffae8000000000-0xffffef0000000000       66048G          =
                     pgd
[    1.771696] 0xffffef0000000000-0xffffef2cc0000000         179G          =
                     pud
[    1.771711] 0xffffef2cc0000000-0xffffef2cc3800000          56M     RW   =
      PSE     GLB NX pmd
[    1.771728] 0xffffef2cc3800000-0xffffef2cc4000000           8M          =
                     pmd
[    1.771745] 0xffffef2cc4000000-0xffffef2ce0800000         456M     RW   =
      PSE     GLB NX pmd
[    1.771764] 0xffffef2ce0800000-0xffffef2d00000000         504M          =
                     pmd
[    1.771781] 0xffffef2d00000000-0xffffef8000000000         332G          =
                     pud
[    1.771797] 0xffffef8000000000-0xfffffe0000000000       14848G          =
                     pgd
[    1.771812] ---[ CPU entry Area ]---
[    1.771819] 0xfffffe0000000000-0xfffffe0000002000           8K     ro   =
              GLB NX pte
[    1.771836] 0xfffffe0000002000-0xfffffe0000003000           4K     RW   =
              GLB NX pte
[    1.771853] 0xfffffe0000003000-0xfffffe0000006000          12K     ro   =
              GLB NX pte
[    1.771869] 0xfffffe0000006000-0xfffffe000000b000          20K     RW   =
              GLB NX pte
[    1.771886] 0xfffffe000000b000-0xfffffe000002c000         132K          =
                     pte
[    1.771902] 0xfffffe000002c000-0xfffffe000002d000           4K     ro   =
              GLB NX pte
[    1.771918] 0xfffffe000002d000-0xfffffe000002e000           4K     RW   =
              GLB NX pte
[    1.771935] 0xfffffe000002e000-0xfffffe0000031000          12K     ro   =
              GLB NX pte
[    1.771952] 0xfffffe0000031000-0xfffffe0000036000          20K     RW   =
              GLB NX pte
[    1.771969] 0xfffffe0000036000-0xfffffe0000057000         132K          =
                     pte
[    1.771984] 0xfffffe0000057000-0xfffffe0000058000           4K     ro   =
              GLB NX pte
[    1.772001] 0xfffffe0000058000-0xfffffe0000059000           4K     RW   =
              GLB NX pte
[    1.772018] 0xfffffe0000059000-0xfffffe000005c000          12K     ro   =
              GLB NX pte
[    1.772034] 0xfffffe000005c000-0xfffffe0000061000          20K     RW   =
              GLB NX pte
[    1.772051] 0xfffffe0000061000-0xfffffe0000082000         132K          =
                     pte
[    1.772066] 0xfffffe0000082000-0xfffffe0000083000           4K     ro   =
              GLB NX pte
[    1.772083] 0xfffffe0000083000-0xfffffe0000084000           4K     RW   =
              GLB NX pte
[    1.772100] 0xfffffe0000084000-0xfffffe0000087000          12K     ro   =
              GLB NX pte
[    1.772117] 0xfffffe0000087000-0xfffffe000008c000          20K     RW   =
              GLB NX pte
[    1.772134] 0xfffffe000008c000-0xfffffe00000ad000         132K          =
                     pte
[    1.772149] 0xfffffe00000ad000-0xfffffe00000ae000           4K     ro   =
              GLB NX pte
[    1.772166] 0xfffffe00000ae000-0xfffffe00000af000           4K     RW   =
              GLB NX pte
[    1.772182] 0xfffffe00000af000-0xfffffe00000b2000          12K     ro   =
              GLB NX pte
[    1.772199] 0xfffffe00000b2000-0xfffffe00000b7000          20K     RW   =
              GLB NX pte
[    1.772216] 0xfffffe00000b7000-0xfffffe00000d8000         132K          =
                     pte
[    1.772231] 0xfffffe00000d8000-0xfffffe00000d9000           4K     ro   =
              GLB NX pte
[    1.772248] 0xfffffe00000d9000-0xfffffe00000da000           4K     RW   =
              GLB NX pte
[    1.772265] 0xfffffe00000da000-0xfffffe00000dd000          12K     ro   =
              GLB NX pte
[    1.772282] 0xfffffe00000dd000-0xfffffe00000e2000          20K     RW   =
              GLB NX pte
[    1.772299] 0xfffffe00000e2000-0xfffffe0000103000         132K          =
                     pte
[    1.772314] 0xfffffe0000103000-0xfffffe0000104000           4K     ro   =
              GLB NX pte
[    1.772331] 0xfffffe0000104000-0xfffffe0000105000           4K     RW   =
              GLB NX pte
[    1.772347] 0xfffffe0000105000-0xfffffe0000108000          12K     ro   =
              GLB NX pte
[    1.772364] 0xfffffe0000108000-0xfffffe000010d000          20K     RW   =
              GLB NX pte
[    1.772381] 0xfffffe000010d000-0xfffffe000012e000         132K          =
                     pte
[    1.772396] 0xfffffe000012e000-0xfffffe000012f000           4K     ro   =
              GLB NX pte
[    1.772413] 0xfffffe000012f000-0xfffffe0000130000           4K     RW   =
              GLB NX pte
[    1.772430] 0xfffffe0000130000-0xfffffe0000133000          12K     ro   =
              GLB NX pte
[    1.772447] 0xfffffe0000133000-0xfffffe0000138000          20K     RW   =
              GLB NX pte
[    1.772464] 0xfffffe0000138000-0xfffffe0000159000         132K          =
                     pte
[    1.772479] 0xfffffe0000159000-0xfffffe000015a000           4K     ro   =
              GLB NX pte
[    1.772496] 0xfffffe000015a000-0xfffffe000015b000           4K     RW   =
              GLB NX pte
[    1.772512] 0xfffffe000015b000-0xfffffe000015e000          12K     ro   =
              GLB NX pte
[    1.772529] 0xfffffe000015e000-0xfffffe0000163000          20K     RW   =
              GLB NX pte
[    1.772546] 0xfffffe0000163000-0xfffffe0000184000         132K          =
                     pte
[    1.772561] 0xfffffe0000184000-0xfffffe0000185000           4K     ro   =
              GLB NX pte
[    1.772578] 0xfffffe0000185000-0xfffffe0000186000           4K     RW   =
              GLB NX pte
[    1.772595] 0xfffffe0000186000-0xfffffe0000189000          12K     ro   =
              GLB NX pte
[    1.772612] 0xfffffe0000189000-0xfffffe000018e000          20K     RW   =
              GLB NX pte
[    1.772629] 0xfffffe000018e000-0xfffffe00001af000         132K          =
                     pte
[    1.772644] 0xfffffe00001af000-0xfffffe00001b0000           4K     ro   =
              GLB NX pte
[    1.772661] 0xfffffe00001b0000-0xfffffe00001b1000           4K     RW   =
              GLB NX pte
[    1.772677] 0xfffffe00001b1000-0xfffffe00001b4000          12K     ro   =
              GLB NX pte
[    1.772695] 0xfffffe00001b4000-0xfffffe00001b9000          20K     RW   =
              GLB NX pte
[    1.772712] 0xfffffe00001b9000-0xfffffe00001da000         132K          =
                     pte
[    1.772727] 0xfffffe00001da000-0xfffffe00001db000           4K     ro   =
              GLB NX pte
[    1.772744] 0xfffffe00001db000-0xfffffe00001dc000           4K     RW   =
              GLB NX pte
[    1.772760] 0xfffffe00001dc000-0xfffffe00001df000          12K     ro   =
              GLB NX pte
[    1.772777] 0xfffffe00001df000-0xfffffe00001e4000          20K     RW   =
              GLB NX pte
[    1.772794] 0xfffffe00001e4000-0xfffffe0000205000         132K          =
                     pte
[    1.772810] 0xfffffe0000205000-0xfffffe0000206000           4K     ro   =
              GLB NX pte
[    1.772826] 0xfffffe0000206000-0xfffffe0000207000           4K     RW   =
              GLB NX pte
[    1.772843] 0xfffffe0000207000-0xfffffe000020a000          12K     ro   =
              GLB NX pte
[    1.772860] 0xfffffe000020a000-0xfffffe000020f000          20K     RW   =
              GLB NX pte
[    1.772877] 0xfffffe000020f000-0xfffffe0000230000         132K          =
                     pte
[    1.772892] 0xfffffe0000230000-0xfffffe0000231000           4K     ro   =
              GLB NX pte
[    1.772909] 0xfffffe0000231000-0xfffffe0000232000           4K     RW   =
              GLB NX pte
[    1.772926] 0xfffffe0000232000-0xfffffe0000235000          12K     ro   =
              GLB NX pte
[    1.772942] 0xfffffe0000235000-0xfffffe000023a000          20K     RW   =
              GLB NX pte
[    1.772959] 0xfffffe000023a000-0xfffffe000025b000         132K          =
                     pte
[    1.772975] 0xfffffe000025b000-0xfffffe000025c000           4K     ro   =
              GLB NX pte
[    1.772991] 0xfffffe000025c000-0xfffffe000025d000           4K     RW   =
              GLB NX pte
[    1.773008] 0xfffffe000025d000-0xfffffe0000260000          12K     ro   =
              GLB NX pte
[    1.773025] 0xfffffe0000260000-0xfffffe0000265000          20K     RW   =
              GLB NX pte
[    1.773042] 0xfffffe0000265000-0xfffffe0000286000         132K          =
                     pte
[    1.773057] 0xfffffe0000286000-0xfffffe0000287000           4K     ro   =
              GLB NX pte
[    1.773074] 0xfffffe0000287000-0xfffffe0000288000           4K     RW   =
              GLB NX pte
[    1.773091] 0xfffffe0000288000-0xfffffe000028b000          12K     ro   =
              GLB NX pte
[    1.773108] 0xfffffe000028b000-0xfffffe0000290000          20K     RW   =
              GLB NX pte
[    1.773125] 0xfffffe0000290000-0xfffffe00002b1000         132K          =
                     pte
[    1.773140] 0xfffffe00002b1000-0xfffffe00002b2000           4K     ro   =
              GLB NX pte
[    1.773157] 0xfffffe00002b2000-0xfffffe00002b3000           4K     RW   =
              GLB NX pte
[    1.773173] 0xfffffe00002b3000-0xfffffe00002b6000          12K     ro   =
              GLB NX pte
[    1.773190] 0xfffffe00002b6000-0xfffffe00002bb000          20K     RW   =
              GLB NX pte
[    1.773207] 0xfffffe00002bb000-0xfffffe00002dc000         132K          =
                     pte
[    1.773222] 0xfffffe00002dc000-0xfffffe00002dd000           4K     ro   =
              GLB NX pte
[    1.773239] 0xfffffe00002dd000-0xfffffe00002de000           4K     RW   =
              GLB NX pte
[    1.773256] 0xfffffe00002de000-0xfffffe00002e1000          12K     ro   =
              GLB NX pte
[    1.773273] 0xfffffe00002e1000-0xfffffe00002e6000          20K     RW   =
              GLB NX pte
[    1.773290] 0xfffffe00002e6000-0xfffffe0000307000         132K          =
                     pte
[    1.773305] 0xfffffe0000307000-0xfffffe0000308000           4K     ro   =
              GLB NX pte
[    1.773322] 0xfffffe0000308000-0xfffffe0000309000           4K     RW   =
              GLB NX pte
[    1.773338] 0xfffffe0000309000-0xfffffe000030c000          12K     ro   =
              GLB NX pte
[    1.773355] 0xfffffe000030c000-0xfffffe0000311000          20K     RW   =
              GLB NX pte
[    1.773372] 0xfffffe0000311000-0xfffffe0000332000         132K          =
                     pte
[    1.773387] 0xfffffe0000332000-0xfffffe0000333000           4K     ro   =
              GLB NX pte
[    1.773404] 0xfffffe0000333000-0xfffffe0000334000           4K     RW   =
              GLB NX pte
[    1.773421] 0xfffffe0000334000-0xfffffe0000337000          12K     ro   =
              GLB NX pte
[    1.773438] 0xfffffe0000337000-0xfffffe000033c000          20K     RW   =
              GLB NX pte
[    1.773455] 0xfffffe000033c000-0xfffffe000035d000         132K          =
                     pte
[    1.773470] 0xfffffe000035d000-0xfffffe000035e000           4K     ro   =
              GLB NX pte
[    1.773487] 0xfffffe000035e000-0xfffffe000035f000           4K     RW   =
              GLB NX pte
[    1.773503] 0xfffffe000035f000-0xfffffe0000362000          12K     ro   =
              GLB NX pte
[    1.773520] 0xfffffe0000362000-0xfffffe0000367000          20K     RW   =
              GLB NX pte
[    1.773537] 0xfffffe0000367000-0xfffffe0000388000         132K          =
                     pte
[    1.773552] 0xfffffe0000388000-0xfffffe0000389000           4K     ro   =
              GLB NX pte
[    1.773569] 0xfffffe0000389000-0xfffffe000038a000           4K     RW   =
              GLB NX pte
[    1.773586] 0xfffffe000038a000-0xfffffe000038d000          12K     ro   =
              GLB NX pte
[    1.773603] 0xfffffe000038d000-0xfffffe0000392000          20K     RW   =
              GLB NX pte
[    1.773620] 0xfffffe0000392000-0xfffffe00003b3000         132K          =
                     pte
[    1.773635] 0xfffffe00003b3000-0xfffffe00003b4000           4K     ro   =
              GLB NX pte
[    1.773652] 0xfffffe00003b4000-0xfffffe00003b5000           4K     RW   =
              GLB NX pte
[    1.773668] 0xfffffe00003b5000-0xfffffe00003b8000          12K     ro   =
              GLB NX pte
[    1.773695] 0xfffffe00003b8000-0xfffffe00003bd000          20K     RW   =
              GLB NX pte
[    1.773712] 0xfffffe00003bd000-0xfffffe00003de000         132K          =
                     pte
[    1.773727] 0xfffffe00003de000-0xfffffe00003df000           4K     ro   =
              GLB NX pte
[    1.773744] 0xfffffe00003df000-0xfffffe00003e0000           4K     RW   =
              GLB NX pte
[    1.773761] 0xfffffe00003e0000-0xfffffe00003e3000          12K     ro   =
              GLB NX pte
[    1.773777] 0xfffffe00003e3000-0xfffffe00003e8000          20K     RW   =
              GLB NX pte
[    1.773795] 0xfffffe00003e8000-0xfffffe0000409000         132K          =
                     pte
[    1.773810] 0xfffffe0000409000-0xfffffe000040a000           4K     ro   =
              GLB NX pte
[    1.773827] 0xfffffe000040a000-0xfffffe000040b000           4K     RW   =
              GLB NX pte
[    1.773843] 0xfffffe000040b000-0xfffffe000040e000          12K     ro   =
              GLB NX pte
[    1.773860] 0xfffffe000040e000-0xfffffe0000413000          20K     RW   =
              GLB NX pte
[    1.773877] 0xfffffe0000413000-0xfffffe0000434000         132K          =
                     pte
[    1.773893] 0xfffffe0000434000-0xfffffe0000435000           4K     ro   =
              GLB NX pte
[    1.773909] 0xfffffe0000435000-0xfffffe0000436000           4K     RW   =
              GLB NX pte
[    1.773926] 0xfffffe0000436000-0xfffffe0000439000          12K     ro   =
              GLB NX pte
[    1.773943] 0xfffffe0000439000-0xfffffe000043e000          20K     RW   =
              GLB NX pte
[    1.773960] 0xfffffe000043e000-0xfffffe000045f000         132K          =
                     pte
[    1.773975] 0xfffffe000045f000-0xfffffe0000460000           4K     ro   =
              GLB NX pte
[    1.773992] 0xfffffe0000460000-0xfffffe0000461000           4K     RW   =
              GLB NX pte
[    1.774009] 0xfffffe0000461000-0xfffffe0000464000          12K     ro   =
              GLB NX pte
[    1.774026] 0xfffffe0000464000-0xfffffe0000469000          20K     RW   =
              GLB NX pte
[    1.774043] 0xfffffe0000469000-0xfffffe000048a000         132K          =
                     pte
[    1.774058] 0xfffffe000048a000-0xfffffe000048b000           4K     ro   =
              GLB NX pte
[    1.774075] 0xfffffe000048b000-0xfffffe000048c000           4K     RW   =
              GLB NX pte
[    1.774092] 0xfffffe000048c000-0xfffffe000048f000          12K     ro   =
              GLB NX pte
[    1.774108] 0xfffffe000048f000-0xfffffe0000494000          20K     RW   =
              GLB NX pte
[    1.774125] 0xfffffe0000494000-0xfffffe00004b5000         132K          =
                     pte
[    1.774141] 0xfffffe00004b5000-0xfffffe00004b6000           4K     ro   =
              GLB NX pte
[    1.774158] 0xfffffe00004b6000-0xfffffe00004b7000           4K     RW   =
              GLB NX pte
[    1.774174] 0xfffffe00004b7000-0xfffffe00004ba000          12K     ro   =
              GLB NX pte
[    1.774191] 0xfffffe00004ba000-0xfffffe00004bf000          20K     RW   =
              GLB NX pte
[    1.774208] 0xfffffe00004bf000-0xfffffe00004e0000         132K          =
                     pte
[    1.774223] 0xfffffe00004e0000-0xfffffe00004e1000           4K     ro   =
              GLB NX pte
[    1.774240] 0xfffffe00004e1000-0xfffffe00004e2000           4K     RW   =
              GLB NX pte
[    1.774257] 0xfffffe00004e2000-0xfffffe00004e5000          12K     ro   =
              GLB NX pte
[    1.774274] 0xfffffe00004e5000-0xfffffe00004ea000          20K     RW   =
              GLB NX pte
[    1.774291] 0xfffffe00004ea000-0xfffffe000050b000         132K          =
                     pte
[    1.774306] 0xfffffe000050b000-0xfffffe000050c000           4K     ro   =
              GLB NX pte
[    1.774323] 0xfffffe000050c000-0xfffffe000050d000           4K     RW   =
              GLB NX pte
[    1.774340] 0xfffffe000050d000-0xfffffe0000510000          12K     ro   =
              GLB NX pte
[    1.774357] 0xfffffe0000510000-0xfffffe0000515000          20K     RW   =
              GLB NX pte
[    1.774374] 0xfffffe0000515000-0xfffffe0000536000         132K          =
                     pte
[    1.774389] 0xfffffe0000536000-0xfffffe0000537000           4K     ro   =
              GLB NX pte
[    1.774406] 0xfffffe0000537000-0xfffffe0000538000           4K     RW   =
              GLB NX pte
[    1.774422] 0xfffffe0000538000-0xfffffe000053b000          12K     ro   =
              GLB NX pte
[    1.774439] 0xfffffe000053b000-0xfffffe0000540000          20K     RW   =
              GLB NX pte
[    1.774456] 0xfffffe0000540000-0xfffffe0000561000         132K          =
                     pte
[    1.774472] 0xfffffe0000561000-0xfffffe0000562000           4K     ro   =
              GLB NX pte
[    1.774488] 0xfffffe0000562000-0xfffffe0000563000           4K     RW   =
              GLB NX pte
[    1.774505] 0xfffffe0000563000-0xfffffe0000566000          12K     ro   =
              GLB NX pte
[    1.774522] 0xfffffe0000566000-0xfffffe000056b000          20K     RW   =
              GLB NX pte
[    1.774539] 0xfffffe000056b000-0xfffffe000058c000         132K          =
                     pte
[    1.774554] 0xfffffe000058c000-0xfffffe000058d000           4K     ro   =
              GLB NX pte
[    1.774571] 0xfffffe000058d000-0xfffffe000058e000           4K     RW   =
              GLB NX pte
[    1.774588] 0xfffffe000058e000-0xfffffe0000591000          12K     ro   =
              GLB NX pte
[    1.774605] 0xfffffe0000591000-0xfffffe0000596000          20K     RW   =
              GLB NX pte
[    1.774622] 0xfffffe0000596000-0xfffffe00005b7000         132K          =
                     pte
[    1.774637] 0xfffffe00005b7000-0xfffffe00005b8000           4K     ro   =
              GLB NX pte
[    1.774654] 0xfffffe00005b8000-0xfffffe00005b9000           4K     RW   =
              GLB NX pte
[    1.774671] 0xfffffe00005b9000-0xfffffe00005bc000          12K     ro   =
              GLB NX pte
[    1.774687] 0xfffffe00005bc000-0xfffffe00005c1000          20K     RW   =
              GLB NX pte
[    1.774711] 0xfffffe00005c1000-0xfffffe00005e2000         132K          =
                     pte
[    1.774726] 0xfffffe00005e2000-0xfffffe00005e3000           4K     ro   =
              GLB NX pte
[    1.774743] 0xfffffe00005e3000-0xfffffe00005e4000           4K     RW   =
              GLB NX pte
[    1.774760] 0xfffffe00005e4000-0xfffffe00005e7000          12K     ro   =
              GLB NX pte
[    1.774776] 0xfffffe00005e7000-0xfffffe00005ec000          20K     RW   =
              GLB NX pte
[    1.774794] 0xfffffe00005ec000-0xfffffe000060d000         132K          =
                     pte
[    1.774809] 0xfffffe000060d000-0xfffffe000060e000           4K     ro   =
              GLB NX pte
[    1.774826] 0xfffffe000060e000-0xfffffe000060f000           4K     RW   =
              GLB NX pte
[    1.774842] 0xfffffe000060f000-0xfffffe0000612000          12K     ro   =
              GLB NX pte
[    1.774859] 0xfffffe0000612000-0xfffffe0000617000          20K     RW   =
              GLB NX pte
[    1.774876] 0xfffffe0000617000-0xfffffe0000638000         132K          =
                     pte
[    1.774892] 0xfffffe0000638000-0xfffffe0000639000           4K     ro   =
              GLB NX pte
[    1.774908] 0xfffffe0000639000-0xfffffe000063a000           4K     RW   =
              GLB NX pte
[    1.774925] 0xfffffe000063a000-0xfffffe000063d000          12K     ro   =
              GLB NX pte
[    1.774942] 0xfffffe000063d000-0xfffffe0000642000          20K     RW   =
              GLB NX pte
[    1.774959] 0xfffffe0000642000-0xfffffe0000663000         132K          =
                     pte
[    1.774974] 0xfffffe0000663000-0xfffffe0000664000           4K     ro   =
              GLB NX pte
[    1.774991] 0xfffffe0000664000-0xfffffe0000665000           4K     RW   =
              GLB NX pte
[    1.775008] 0xfffffe0000665000-0xfffffe0000668000          12K     ro   =
              GLB NX pte
[    1.775025] 0xfffffe0000668000-0xfffffe000066d000          20K     RW   =
              GLB NX pte
[    1.775042] 0xfffffe000066d000-0xfffffe000068e000         132K          =
                     pte
[    1.775057] 0xfffffe000068e000-0xfffffe000068f000           4K     ro   =
              GLB NX pte
[    1.775074] 0xfffffe000068f000-0xfffffe0000690000           4K     RW   =
              GLB NX pte
[    1.775091] 0xfffffe0000690000-0xfffffe0000693000          12K     ro   =
              GLB NX pte
[    1.775107] 0xfffffe0000693000-0xfffffe0000698000          20K     RW   =
              GLB NX pte
[    1.775124] 0xfffffe0000698000-0xfffffe00006b9000         132K          =
                     pte
[    1.775140] 0xfffffe00006b9000-0xfffffe00006ba000           4K     ro   =
              GLB NX pte
[    1.775157] 0xfffffe00006ba000-0xfffffe00006bb000           4K     RW   =
              GLB NX pte
[    1.775173] 0xfffffe00006bb000-0xfffffe00006be000          12K     ro   =
              GLB NX pte
[    1.775190] 0xfffffe00006be000-0xfffffe00006c3000          20K     RW   =
              GLB NX pte
[    1.775207] 0xfffffe00006c3000-0xfffffe00006e4000         132K          =
                     pte
[    1.775223] 0xfffffe00006e4000-0xfffffe00006e5000           4K     ro   =
              GLB NX pte
[    1.775239] 0xfffffe00006e5000-0xfffffe00006e6000           4K     RW   =
              GLB NX pte
[    1.775256] 0xfffffe00006e6000-0xfffffe00006e9000          12K     ro   =
              GLB NX pte
[    1.775273] 0xfffffe00006e9000-0xfffffe00006ee000          20K     RW   =
              GLB NX pte
[    1.775290] 0xfffffe00006ee000-0xfffffe000070f000         132K          =
                     pte
[    1.775305] 0xfffffe000070f000-0xfffffe0000710000           4K     ro   =
              GLB NX pte
[    1.775322] 0xfffffe0000710000-0xfffffe0000711000           4K     RW   =
              GLB NX pte
[    1.775339] 0xfffffe0000711000-0xfffffe0000714000          12K     ro   =
              GLB NX pte
[    1.775356] 0xfffffe0000714000-0xfffffe0000719000          20K     RW   =
              GLB NX pte
[    1.775373] 0xfffffe0000719000-0xfffffe000073a000         132K          =
                     pte
[    1.775388] 0xfffffe000073a000-0xfffffe000073b000           4K     ro   =
              GLB NX pte
[    1.775405] 0xfffffe000073b000-0xfffffe000073c000           4K     RW   =
              GLB NX pte
[    1.775421] 0xfffffe000073c000-0xfffffe000073f000          12K     ro   =
              GLB NX pte
[    1.775438] 0xfffffe000073f000-0xfffffe0000744000          20K     RW   =
              GLB NX pte
[    1.775455] 0xfffffe0000744000-0xfffffe0000765000         132K          =
                     pte
[    1.775471] 0xfffffe0000765000-0xfffffe0000766000           4K     ro   =
              GLB NX pte
[    1.775487] 0xfffffe0000766000-0xfffffe0000767000           4K     RW   =
              GLB NX pte
[    1.775504] 0xfffffe0000767000-0xfffffe000076a000          12K     ro   =
              GLB NX pte
[    1.775521] 0xfffffe000076a000-0xfffffe000076f000          20K     RW   =
              GLB NX pte
[    1.775538] 0xfffffe000076f000-0xfffffe0000790000         132K          =
                     pte
[    1.775553] 0xfffffe0000790000-0xfffffe0000791000           4K     ro   =
              GLB NX pte
[    1.775570] 0xfffffe0000791000-0xfffffe0000792000           4K     RW   =
              GLB NX pte
[    1.775587] 0xfffffe0000792000-0xfffffe0000795000          12K     ro   =
              GLB NX pte
[    1.775604] 0xfffffe0000795000-0xfffffe000079a000          20K     RW   =
              GLB NX pte
[    1.775621] 0xfffffe000079a000-0xfffffe00007bb000         132K          =
                     pte
[    1.775636] 0xfffffe00007bb000-0xfffffe00007bc000           4K     ro   =
              GLB NX pte
[    1.775653] 0xfffffe00007bc000-0xfffffe00007bd000           4K     RW   =
              GLB NX pte
[    1.775670] 0xfffffe00007bd000-0xfffffe00007c0000          12K     ro   =
              GLB NX pte
[    1.775686] 0xfffffe00007c0000-0xfffffe00007c5000          20K     RW   =
              GLB NX pte
[    1.775695] 0xfffffe00007c5000-0xfffffe00007e6000         132K          =
                     pte
[    1.775710] 0xfffffe00007e6000-0xfffffe00007e7000           4K     ro   =
              GLB NX pte
[    1.775727] 0xfffffe00007e7000-0xfffffe00007e8000           4K     RW   =
              GLB NX pte
[    1.775744] 0xfffffe00007e8000-0xfffffe00007eb000          12K     ro   =
              GLB NX pte
[    1.775761] 0xfffffe00007eb000-0xfffffe00007f0000          20K     RW   =
              GLB NX pte
[    1.775778] 0xfffffe00007f0000-0xfffffe0000811000         132K          =
                     pte
[    1.775793] 0xfffffe0000811000-0xfffffe0000812000           4K     ro   =
              GLB NX pte
[    1.775810] 0xfffffe0000812000-0xfffffe0000813000           4K     RW   =
              GLB NX pte
[    1.775827] 0xfffffe0000813000-0xfffffe0000816000          12K     ro   =
              GLB NX pte
[    1.775843] 0xfffffe0000816000-0xfffffe000081b000          20K     RW   =
              GLB NX pte
[    1.775860] 0xfffffe000081b000-0xfffffe000083c000         132K          =
                     pte
[    1.775876] 0xfffffe000083c000-0xfffffe000083d000           4K     ro   =
              GLB NX pte
[    1.775892] 0xfffffe000083d000-0xfffffe000083e000           4K     RW   =
              GLB NX pte
[    1.775909] 0xfffffe000083e000-0xfffffe0000841000          12K     ro   =
              GLB NX pte
[    1.775926] 0xfffffe0000841000-0xfffffe0000846000          20K     RW   =
              GLB NX pte
[    1.775943] 0xfffffe0000846000-0xfffffe0000867000         132K          =
                     pte
[    1.775958] 0xfffffe0000867000-0xfffffe0000868000           4K     ro   =
              GLB NX pte
[    1.775975] 0xfffffe0000868000-0xfffffe0000869000           4K     RW   =
              GLB NX pte
[    1.775992] 0xfffffe0000869000-0xfffffe000086c000          12K     ro   =
              GLB NX pte
[    1.776009] 0xfffffe000086c000-0xfffffe0000871000          20K     RW   =
              GLB NX pte
[    1.776026] 0xfffffe0000871000-0xfffffe0000892000         132K          =
                     pte
[    1.776041] 0xfffffe0000892000-0xfffffe0000893000           4K     ro   =
              GLB NX pte
[    1.776058] 0xfffffe0000893000-0xfffffe0000894000           4K     RW   =
              GLB NX pte
[    1.776074] 0xfffffe0000894000-0xfffffe0000897000          12K     ro   =
              GLB NX pte
[    1.776091] 0xfffffe0000897000-0xfffffe000089c000          20K     RW   =
              GLB NX pte
[    1.776108] 0xfffffe000089c000-0xfffffe00008bd000         132K          =
                     pte
[    1.776123] 0xfffffe00008bd000-0xfffffe00008be000           4K     ro   =
              GLB NX pte
[    1.776140] 0xfffffe00008be000-0xfffffe00008bf000           4K     RW   =
              GLB NX pte
[    1.776157] 0xfffffe00008bf000-0xfffffe00008c2000          12K     ro   =
              GLB NX pte
[    1.776174] 0xfffffe00008c2000-0xfffffe00008c7000          20K     RW   =
              GLB NX pte
[    1.776191] 0xfffffe00008c7000-0xfffffe00008e8000         132K          =
                     pte
[    1.776206] 0xfffffe00008e8000-0xfffffe00008e9000           4K     ro   =
              GLB NX pte
[    1.776223] 0xfffffe00008e9000-0xfffffe00008ea000           4K     RW   =
              GLB NX pte
[    1.776240] 0xfffffe00008ea000-0xfffffe00008ed000          12K     ro   =
              GLB NX pte
[    1.776256] 0xfffffe00008ed000-0xfffffe00008f2000          20K     RW   =
              GLB NX pte
[    1.776273] 0xfffffe00008f2000-0xfffffe0000913000         132K          =
                     pte
[    1.776289] 0xfffffe0000913000-0xfffffe0000914000           4K     ro   =
              GLB NX pte
[    1.776305] 0xfffffe0000914000-0xfffffe0000915000           4K     RW   =
              GLB NX pte
[    1.776322] 0xfffffe0000915000-0xfffffe0000918000          12K     ro   =
              GLB NX pte
[    1.776339] 0xfffffe0000918000-0xfffffe000091d000          20K     RW   =
              GLB NX pte
[    1.776356] 0xfffffe000091d000-0xfffffe000093e000         132K          =
                     pte
[    1.776371] 0xfffffe000093e000-0xfffffe000093f000           4K     ro   =
              GLB NX pte
[    1.776388] 0xfffffe000093f000-0xfffffe0000940000           4K     RW   =
              GLB NX pte
[    1.776405] 0xfffffe0000940000-0xfffffe0000943000          12K     ro   =
              GLB NX pte
[    1.776422] 0xfffffe0000943000-0xfffffe0000948000          20K     RW   =
              GLB NX pte
[    1.776439] 0xfffffe0000948000-0xfffffe0000969000         132K          =
                     pte
[    1.776454] 0xfffffe0000969000-0xfffffe000096a000           4K     ro   =
              GLB NX pte
[    1.776471] 0xfffffe000096a000-0xfffffe000096b000           4K     RW   =
              GLB NX pte
[    1.776487] 0xfffffe000096b000-0xfffffe000096e000          12K     ro   =
              GLB NX pte
[    1.776504] 0xfffffe000096e000-0xfffffe0000973000          20K     RW   =
              GLB NX pte
[    1.776521] 0xfffffe0000973000-0xfffffe0000994000         132K          =
                     pte
[    1.776537] 0xfffffe0000994000-0xfffffe0000995000           4K     ro   =
              GLB NX pte
[    1.776553] 0xfffffe0000995000-0xfffffe0000996000           4K     RW   =
              GLB NX pte
[    1.776570] 0xfffffe0000996000-0xfffffe0000999000          12K     ro   =
              GLB NX pte
[    1.776587] 0xfffffe0000999000-0xfffffe000099e000          20K     RW   =
              GLB NX pte
[    1.776604] 0xfffffe000099e000-0xfffffe00009bf000         132K          =
                     pte
[    1.776619] 0xfffffe00009bf000-0xfffffe00009c0000           4K     ro   =
              GLB NX pte
[    1.776636] 0xfffffe00009c0000-0xfffffe00009c1000           4K     RW   =
              GLB NX pte
[    1.776653] 0xfffffe00009c1000-0xfffffe00009c4000          12K     ro   =
              GLB NX pte
[    1.776670] 0xfffffe00009c4000-0xfffffe00009c9000          20K     RW   =
              GLB NX pte
[    1.776695] 0xfffffe00009c9000-0xfffffe00009ea000         132K          =
                     pte
[    1.776710] 0xfffffe00009ea000-0xfffffe00009eb000           4K     ro   =
              GLB NX pte
[    1.776727] 0xfffffe00009eb000-0xfffffe00009ec000           4K     RW   =
              GLB NX pte
[    1.776744] 0xfffffe00009ec000-0xfffffe00009ef000          12K     ro   =
              GLB NX pte
[    1.776761] 0xfffffe00009ef000-0xfffffe00009f4000          20K     RW   =
              GLB NX pte
[    1.776778] 0xfffffe00009f4000-0xfffffe0000a15000         132K          =
                     pte
[    1.776793] 0xfffffe0000a15000-0xfffffe0000a16000           4K     ro   =
              GLB NX pte
[    1.776810] 0xfffffe0000a16000-0xfffffe0000a17000           4K     RW   =
              GLB NX pte
[    1.776827] 0xfffffe0000a17000-0xfffffe0000a1a000          12K     ro   =
              GLB NX pte
[    1.776843] 0xfffffe0000a1a000-0xfffffe0000a1f000          20K     RW   =
              GLB NX pte
[    1.776860] 0xfffffe0000a1f000-0xfffffe0000a40000         132K          =
                     pte
[    1.776876] 0xfffffe0000a40000-0xfffffe0000a41000           4K     ro   =
              GLB NX pte
[    1.776892] 0xfffffe0000a41000-0xfffffe0000a42000           4K     RW   =
              GLB NX pte
[    1.776909] 0xfffffe0000a42000-0xfffffe0000a45000          12K     ro   =
              GLB NX pte
[    1.776926] 0xfffffe0000a45000-0xfffffe0000a4a000          20K     RW   =
              GLB NX pte
[    1.776943] 0xfffffe0000a4a000-0xfffffe0000a6b000         132K          =
                     pte
[    1.776958] 0xfffffe0000a6b000-0xfffffe0000a6c000           4K     ro   =
              GLB NX pte
[    1.776975] 0xfffffe0000a6c000-0xfffffe0000a6d000           4K     RW   =
              GLB NX pte
[    1.776992] 0xfffffe0000a6d000-0xfffffe0000a70000          12K     ro   =
              GLB NX pte
[    1.777008] 0xfffffe0000a70000-0xfffffe0000a75000          20K     RW   =
              GLB NX pte
[    1.777026] 0xfffffe0000a75000-0xfffffe0000a96000         132K          =
                     pte
[    1.777041] 0xfffffe0000a96000-0xfffffe0000a97000           4K     ro   =
              GLB NX pte
[    1.777058] 0xfffffe0000a97000-0xfffffe0000a98000           4K     RW   =
              GLB NX pte
[    1.777074] 0xfffffe0000a98000-0xfffffe0000a9b000          12K     ro   =
              GLB NX pte
[    1.777091] 0xfffffe0000a9b000-0xfffffe0000aa0000          20K     RW   =
              GLB NX pte
[    1.777108] 0xfffffe0000aa0000-0xfffffe0000ac1000         132K          =
                     pte
[    1.777123] 0xfffffe0000ac1000-0xfffffe0000ac2000           4K     ro   =
              GLB NX pte
[    1.777140] 0xfffffe0000ac2000-0xfffffe0000ac3000           4K     RW   =
              GLB NX pte
[    1.777157] 0xfffffe0000ac3000-0xfffffe0000ac6000          12K     ro   =
              GLB NX pte
[    1.777174] 0xfffffe0000ac6000-0xfffffe0000acb000          20K     RW   =
              GLB NX pte
[    1.777191] 0xfffffe0000acb000-0xfffffe0000aec000         132K          =
                     pte
[    1.777206] 0xfffffe0000aec000-0xfffffe0000aed000           4K     ro   =
              GLB NX pte
[    1.777223] 0xfffffe0000aed000-0xfffffe0000aee000           4K     RW   =
              GLB NX pte
[    1.777239] 0xfffffe0000aee000-0xfffffe0000af1000          12K     ro   =
              GLB NX pte
[    1.777256] 0xfffffe0000af1000-0xfffffe0000af6000          20K     RW   =
              GLB NX pte
[    1.777273] 0xfffffe0000af6000-0xfffffe0000b17000         132K          =
                     pte
[    1.777289] 0xfffffe0000b17000-0xfffffe0000b18000           4K     ro   =
              GLB NX pte
[    1.777305] 0xfffffe0000b18000-0xfffffe0000b19000           4K     RW   =
              GLB NX pte
[    1.777322] 0xfffffe0000b19000-0xfffffe0000b1c000          12K     ro   =
              GLB NX pte
[    1.777339] 0xfffffe0000b1c000-0xfffffe0000b21000          20K     RW   =
              GLB NX pte
[    1.777356] 0xfffffe0000b21000-0xfffffe0000b42000         132K          =
                     pte
[    1.777371] 0xfffffe0000b42000-0xfffffe0000b43000           4K     ro   =
              GLB NX pte
[    1.777388] 0xfffffe0000b43000-0xfffffe0000b44000           4K     RW   =
              GLB NX pte
[    1.777405] 0xfffffe0000b44000-0xfffffe0000b47000          12K     ro   =
              GLB NX pte
[    1.777421] 0xfffffe0000b47000-0xfffffe0000b4c000          20K     RW   =
              GLB NX pte
[    1.777438] 0xfffffe0000b4c000-0xfffffe0000b6d000         132K          =
                     pte
[    1.777454] 0xfffffe0000b6d000-0xfffffe0000b6e000           4K     ro   =
              GLB NX pte
[    1.777471] 0xfffffe0000b6e000-0xfffffe0000b6f000           4K     RW   =
              GLB NX pte
[    1.777487] 0xfffffe0000b6f000-0xfffffe0000b72000          12K     ro   =
              GLB NX pte
[    1.777504] 0xfffffe0000b72000-0xfffffe0000b77000          20K     RW   =
              GLB NX pte
[    1.777521] 0xfffffe0000b77000-0xfffffe0000b98000         132K          =
                     pte
[    1.777536] 0xfffffe0000b98000-0xfffffe0000b99000           4K     ro   =
              GLB NX pte
[    1.777553] 0xfffffe0000b99000-0xfffffe0000b9a000           4K     RW   =
              GLB NX pte
[    1.777570] 0xfffffe0000b9a000-0xfffffe0000b9d000          12K     ro   =
              GLB NX pte
[    1.777587] 0xfffffe0000b9d000-0xfffffe0000ba2000          20K     RW   =
              GLB NX pte
[    1.777604] 0xfffffe0000ba2000-0xfffffe0000bc3000         132K          =
                     pte
[    1.777619] 0xfffffe0000bc3000-0xfffffe0000bc4000           4K     ro   =
              GLB NX pte
[    1.777636] 0xfffffe0000bc4000-0xfffffe0000bc5000           4K     RW   =
              GLB NX pte
[    1.777653] 0xfffffe0000bc5000-0xfffffe0000bc8000          12K     ro   =
              GLB NX pte
[    1.777669] 0xfffffe0000bc8000-0xfffffe0000bcd000          20K     RW   =
              GLB NX pte
[    1.777695] 0xfffffe0000bcd000-0xfffffe0000bee000         132K          =
                     pte
[    1.777710] 0xfffffe0000bee000-0xfffffe0000bef000           4K     ro   =
              GLB NX pte
[    1.777727] 0xfffffe0000bef000-0xfffffe0000bf0000           4K     RW   =
              GLB NX pte
[    1.777744] 0xfffffe0000bf0000-0xfffffe0000bf3000          12K     ro   =
              GLB NX pte
[    1.777761] 0xfffffe0000bf3000-0xfffffe0000bf8000          20K     RW   =
              GLB NX pte
[    1.777778] 0xfffffe0000bf8000-0xfffffe0000c19000         132K          =
                     pte
[    1.777793] 0xfffffe0000c19000-0xfffffe0000c1a000           4K     ro   =
              GLB NX pte
[    1.777810] 0xfffffe0000c1a000-0xfffffe0000c1b000           4K     RW   =
              GLB NX pte
[    1.777827] 0xfffffe0000c1b000-0xfffffe0000c1e000          12K     ro   =
              GLB NX pte
[    1.777844] 0xfffffe0000c1e000-0xfffffe0000c23000          20K     RW   =
              GLB NX pte
[    1.777861] 0xfffffe0000c23000-0xfffffe0000c44000         132K          =
                     pte
[    1.777876] 0xfffffe0000c44000-0xfffffe0000c45000           4K     ro   =
              GLB NX pte
[    1.777893] 0xfffffe0000c45000-0xfffffe0000c46000           4K     RW   =
              GLB NX pte
[    1.777909] 0xfffffe0000c46000-0xfffffe0000c49000          12K     ro   =
              GLB NX pte
[    1.777926] 0xfffffe0000c49000-0xfffffe0000c4e000          20K     RW   =
              GLB NX pte
[    1.777943] 0xfffffe0000c4e000-0xfffffe0000c6f000         132K          =
                     pte
[    1.777959] 0xfffffe0000c6f000-0xfffffe0000c70000           4K     ro   =
              GLB NX pte
[    1.777975] 0xfffffe0000c70000-0xfffffe0000c71000           4K     RW   =
              GLB NX pte
[    1.777992] 0xfffffe0000c71000-0xfffffe0000c74000          12K     ro   =
              GLB NX pte
[    1.778009] 0xfffffe0000c74000-0xfffffe0000c79000          20K     RW   =
              GLB NX pte
[    1.778026] 0xfffffe0000c79000-0xfffffe0000c9a000         132K          =
                     pte
[    1.778041] 0xfffffe0000c9a000-0xfffffe0000c9b000           4K     ro   =
              GLB NX pte
[    1.778058] 0xfffffe0000c9b000-0xfffffe0000c9c000           4K     RW   =
              GLB NX pte
[    1.778075] 0xfffffe0000c9c000-0xfffffe0000c9f000          12K     ro   =
              GLB NX pte
[    1.778092] 0xfffffe0000c9f000-0xfffffe0000ca4000          20K     RW   =
              GLB NX pte
[    1.778109] 0xfffffe0000ca4000-0xfffffe0000cc5000         132K          =
                     pte
[    1.778124] 0xfffffe0000cc5000-0xfffffe0000cc6000           4K     ro   =
              GLB NX pte
[    1.778141] 0xfffffe0000cc6000-0xfffffe0000cc7000           4K     RW   =
              GLB NX pte
[    1.778158] 0xfffffe0000cc7000-0xfffffe0000cca000          12K     ro   =
              GLB NX pte
[    1.778175] 0xfffffe0000cca000-0xfffffe0000ccf000          20K     RW   =
              GLB NX pte
[    1.778192] 0xfffffe0000ccf000-0xfffffe0000cf0000         132K          =
                     pte
[    1.778207] 0xfffffe0000cf0000-0xfffffe0000cf1000           4K     ro   =
              GLB NX pte
[    1.778224] 0xfffffe0000cf1000-0xfffffe0000cf2000           4K     RW   =
              GLB NX pte
[    1.778240] 0xfffffe0000cf2000-0xfffffe0000cf5000          12K     ro   =
              GLB NX pte
[    1.778257] 0xfffffe0000cf5000-0xfffffe0000cfa000          20K     RW   =
              GLB NX pte
[    1.778274] 0xfffffe0000cfa000-0xfffffe0000d1b000         132K          =
                     pte
[    1.778290] 0xfffffe0000d1b000-0xfffffe0000d1c000           4K     ro   =
              GLB NX pte
[    1.778306] 0xfffffe0000d1c000-0xfffffe0000d1d000           4K     RW   =
              GLB NX pte
[    1.778323] 0xfffffe0000d1d000-0xfffffe0000d20000          12K     ro   =
              GLB NX pte
[    1.778340] 0xfffffe0000d20000-0xfffffe0000d25000          20K     RW   =
              GLB NX pte
[    1.778357] 0xfffffe0000d25000-0xfffffe0000d46000         132K          =
                     pte
[    1.778372] 0xfffffe0000d46000-0xfffffe0000d47000           4K     ro   =
              GLB NX pte
[    1.778389] 0xfffffe0000d47000-0xfffffe0000d48000           4K     RW   =
              GLB NX pte
[    1.778406] 0xfffffe0000d48000-0xfffffe0000d4b000          12K     ro   =
              GLB NX pte
[    1.778423] 0xfffffe0000d4b000-0xfffffe0000d50000          20K     RW   =
              GLB NX pte
[    1.778440] 0xfffffe0000d50000-0xfffffe0000d71000         132K          =
                     pte
[    1.778455] 0xfffffe0000d71000-0xfffffe0000d72000           4K     ro   =
              GLB NX pte
[    1.778472] 0xfffffe0000d72000-0xfffffe0000d73000           4K     RW   =
              GLB NX pte
[    1.778489] 0xfffffe0000d73000-0xfffffe0000d76000          12K     ro   =
              GLB NX pte
[    1.778505] 0xfffffe0000d76000-0xfffffe0000d7b000          20K     RW   =
              GLB NX pte
[    1.778523] 0xfffffe0000d7b000-0xfffffe0000d9c000         132K          =
                     pte
[    1.778538] 0xfffffe0000d9c000-0xfffffe0000d9d000           4K     ro   =
              GLB NX pte
[    1.778555] 0xfffffe0000d9d000-0xfffffe0000d9e000           4K     RW   =
              GLB NX pte
[    1.778571] 0xfffffe0000d9e000-0xfffffe0000da1000          12K     ro   =
              GLB NX pte
[    1.778588] 0xfffffe0000da1000-0xfffffe0000da6000          20K     RW   =
              GLB NX pte
[    1.778605] 0xfffffe0000da6000-0xfffffe0000dc7000         132K          =
                     pte
[    1.778621] 0xfffffe0000dc7000-0xfffffe0000dc8000           4K     ro   =
              GLB NX pte
[    1.778637] 0xfffffe0000dc8000-0xfffffe0000dc9000           4K     RW   =
              GLB NX pte
[    1.778654] 0xfffffe0000dc9000-0xfffffe0000dcc000          12K     ro   =
              GLB NX pte
[    1.778671] 0xfffffe0000dcc000-0xfffffe0000dd1000          20K     RW   =
              GLB NX pte
[    1.778694] 0xfffffe0000dd1000-0xfffffe0000df2000         132K          =
                     pte
[    1.778710] 0xfffffe0000df2000-0xfffffe0000df3000           4K     ro   =
              GLB NX pte
[    1.778726] 0xfffffe0000df3000-0xfffffe0000df4000           4K     RW   =
              GLB NX pte
[    1.778743] 0xfffffe0000df4000-0xfffffe0000df7000          12K     ro   =
              GLB NX pte
[    1.778760] 0xfffffe0000df7000-0xfffffe0000dfc000          20K     RW   =
              GLB NX pte
[    1.778777] 0xfffffe0000dfc000-0xfffffe0000e1d000         132K          =
                     pte
[    1.778792] 0xfffffe0000e1d000-0xfffffe0000e1e000           4K     ro   =
              GLB NX pte
[    1.778809] 0xfffffe0000e1e000-0xfffffe0000e1f000           4K     RW   =
              GLB NX pte
[    1.778826] 0xfffffe0000e1f000-0xfffffe0000e22000          12K     ro   =
              GLB NX pte
[    1.778843] 0xfffffe0000e22000-0xfffffe0000e27000          20K     RW   =
              GLB NX pte
[    1.778860] 0xfffffe0000e27000-0xfffffe0000e48000         132K          =
                     pte
[    1.778875] 0xfffffe0000e48000-0xfffffe0000e49000           4K     ro   =
              GLB NX pte
[    1.778892] 0xfffffe0000e49000-0xfffffe0000e4a000           4K     RW   =
              GLB NX pte
[    1.778908] 0xfffffe0000e4a000-0xfffffe0000e4d000          12K     ro   =
              GLB NX pte
[    1.778925] 0xfffffe0000e4d000-0xfffffe0000e52000          20K     RW   =
              GLB NX pte
[    1.778942] 0xfffffe0000e52000-0xfffffe0000e73000         132K          =
                     pte
[    1.778958] 0xfffffe0000e73000-0xfffffe0000e74000           4K     ro   =
              GLB NX pte
[    1.778974] 0xfffffe0000e74000-0xfffffe0000e75000           4K     RW   =
              GLB NX pte
[    1.778991] 0xfffffe0000e75000-0xfffffe0000e78000          12K     ro   =
              GLB NX pte
[    1.779008] 0xfffffe0000e78000-0xfffffe0000e7d000          20K     RW   =
              GLB NX pte
[    1.779025] 0xfffffe0000e7d000-0xfffffe0000e9e000         132K          =
                     pte
[    1.779040] 0xfffffe0000e9e000-0xfffffe0000e9f000           4K     ro   =
              GLB NX pte
[    1.779057] 0xfffffe0000e9f000-0xfffffe0000ea0000           4K     RW   =
              GLB NX pte
[    1.779074] 0xfffffe0000ea0000-0xfffffe0000ea3000          12K     ro   =
              GLB NX pte
[    1.779091] 0xfffffe0000ea3000-0xfffffe0000ea8000          20K     RW   =
              GLB NX pte
[    1.779108] 0xfffffe0000ea8000-0xfffffe0000ec9000         132K          =
                     pte
[    1.779123] 0xfffffe0000ec9000-0xfffffe0000eca000           4K     ro   =
              GLB NX pte
[    1.779140] 0xfffffe0000eca000-0xfffffe0000ecb000           4K     RW   =
              GLB NX pte
[    1.779156] 0xfffffe0000ecb000-0xfffffe0000ece000          12K     ro   =
              GLB NX pte
[    1.779173] 0xfffffe0000ece000-0xfffffe0000ed3000          20K     RW   =
              GLB NX pte
[    1.779190] 0xfffffe0000ed3000-0xfffffe0000ef4000         132K          =
                     pte
[    1.779205] 0xfffffe0000ef4000-0xfffffe0000ef5000           4K     ro   =
              GLB NX pte
[    1.779222] 0xfffffe0000ef5000-0xfffffe0000ef6000           4K     RW   =
              GLB NX pte
[    1.779239] 0xfffffe0000ef6000-0xfffffe0000ef9000          12K     ro   =
              GLB NX pte
[    1.779256] 0xfffffe0000ef9000-0xfffffe0000efe000          20K     RW   =
              GLB NX pte
[    1.779273] 0xfffffe0000efe000-0xfffffe0000f1f000         132K          =
                     pte
[    1.779288] 0xfffffe0000f1f000-0xfffffe0000f20000           4K     ro   =
              GLB NX pte
[    1.779305] 0xfffffe0000f20000-0xfffffe0000f21000           4K     RW   =
              GLB NX pte
[    1.779322] 0xfffffe0000f21000-0xfffffe0000f24000          12K     ro   =
              GLB NX pte
[    1.779338] 0xfffffe0000f24000-0xfffffe0000f29000          20K     RW   =
              GLB NX pte
[    1.779355] 0xfffffe0000f29000-0xfffffe0000f4a000         132K          =
                     pte
[    1.779371] 0xfffffe0000f4a000-0xfffffe0000f4b000           4K     ro   =
              GLB NX pte
[    1.779388] 0xfffffe0000f4b000-0xfffffe0000f4c000           4K     RW   =
              GLB NX pte
[    1.779404] 0xfffffe0000f4c000-0xfffffe0000f4f000          12K     ro   =
              GLB NX pte
[    1.779421] 0xfffffe0000f4f000-0xfffffe0000f54000          20K     RW   =
              GLB NX pte
[    1.779438] 0xfffffe0000f54000-0xfffffe0000f75000         132K          =
                     pte
[    1.779453] 0xfffffe0000f75000-0xfffffe0000f76000           4K     ro   =
              GLB NX pte
[    1.779470] 0xfffffe0000f76000-0xfffffe0000f77000           4K     RW   =
              GLB NX pte
[    1.779487] 0xfffffe0000f77000-0xfffffe0000f7a000          12K     ro   =
              GLB NX pte
[    1.779504] 0xfffffe0000f7a000-0xfffffe0000f7f000          20K     RW   =
              GLB NX pte
[    1.779521] 0xfffffe0000f7f000-0xfffffe0000fa0000         132K          =
                     pte
[    1.779536] 0xfffffe0000fa0000-0xfffffe0000fa1000           4K     ro   =
              GLB NX pte
[    1.779553] 0xfffffe0000fa1000-0xfffffe0000fa2000           4K     RW   =
              GLB NX pte
[    1.779570] 0xfffffe0000fa2000-0xfffffe0000fa5000          12K     ro   =
              GLB NX pte
[    1.779586] 0xfffffe0000fa5000-0xfffffe0000faa000          20K     RW   =
              GLB NX pte
[    1.779603] 0xfffffe0000faa000-0xfffffe0000fcb000         132K          =
                     pte
[    1.779619] 0xfffffe0000fcb000-0xfffffe0000fcc000           4K     ro   =
              GLB NX pte
[    1.779636] 0xfffffe0000fcc000-0xfffffe0000fcd000           4K     RW   =
              GLB NX pte
[    1.779652] 0xfffffe0000fcd000-0xfffffe0000fd0000          12K     ro   =
              GLB NX pte
[    1.779669] 0xfffffe0000fd0000-0xfffffe0000fd5000          20K     RW   =
              GLB NX pte
[    1.779686] 0xfffffe0000fd5000-0xfffffe0000ff6000         132K          =
                     pte
[    1.779695] 0xfffffe0000ff6000-0xfffffe0000ff7000           4K     ro   =
              GLB NX pte
[    1.779711] 0xfffffe0000ff7000-0xfffffe0000ff8000           4K     RW   =
              GLB NX pte
[    1.779728] 0xfffffe0000ff8000-0xfffffe0000ffb000          12K     ro   =
              GLB NX pte
[    1.779745] 0xfffffe0000ffb000-0xfffffe0001000000          20K     RW   =
              GLB NX pte
[    1.779762] 0xfffffe0001000000-0xfffffe0001021000         132K          =
                     pte
[    1.779778] 0xfffffe0001021000-0xfffffe0001022000           4K     ro   =
              GLB NX pte
[    1.779794] 0xfffffe0001022000-0xfffffe0001023000           4K     RW   =
              GLB NX pte
[    1.779811] 0xfffffe0001023000-0xfffffe0001026000          12K     ro   =
              GLB NX pte
[    1.779828] 0xfffffe0001026000-0xfffffe000102b000          20K     RW   =
              GLB NX pte
[    1.779845] 0xfffffe000102b000-0xfffffe000104c000         132K          =
                     pte
[    1.779860] 0xfffffe000104c000-0xfffffe000104d000           4K     ro   =
              GLB NX pte
[    1.779877] 0xfffffe000104d000-0xfffffe000104e000           4K     RW   =
              GLB NX pte
[    1.779894] 0xfffffe000104e000-0xfffffe0001051000          12K     ro   =
              GLB NX pte
[    1.779911] 0xfffffe0001051000-0xfffffe0001056000          20K     RW   =
              GLB NX pte
[    1.779928] 0xfffffe0001056000-0xfffffe0001077000         132K          =
                     pte
[    1.779943] 0xfffffe0001077000-0xfffffe0001078000           4K     ro   =
              GLB NX pte
[    1.779960] 0xfffffe0001078000-0xfffffe0001079000           4K     RW   =
              GLB NX pte
[    1.779977] 0xfffffe0001079000-0xfffffe000107c000          12K     ro   =
              GLB NX pte
[    1.779994] 0xfffffe000107c000-0xfffffe0001081000          20K     RW   =
              GLB NX pte
[    1.780011] 0xfffffe0001081000-0xfffffe00010a2000         132K          =
                     pte
[    1.780026] 0xfffffe00010a2000-0xfffffe00010a3000           4K     ro   =
              GLB NX pte
[    1.780043] 0xfffffe00010a3000-0xfffffe00010a4000           4K     RW   =
              GLB NX pte
[    1.780060] 0xfffffe00010a4000-0xfffffe00010a7000          12K     ro   =
              GLB NX pte
[    1.780076] 0xfffffe00010a7000-0xfffffe00010ac000          20K     RW   =
              GLB NX pte
[    1.780094] 0xfffffe00010ac000-0xfffffe00010cd000         132K          =
                     pte
[    1.780109] 0xfffffe00010cd000-0xfffffe00010ce000           4K     ro   =
              GLB NX pte
[    1.780126] 0xfffffe00010ce000-0xfffffe00010cf000           4K     RW   =
              GLB NX pte
[    1.780142] 0xfffffe00010cf000-0xfffffe00010d2000          12K     ro   =
              GLB NX pte
[    1.780159] 0xfffffe00010d2000-0xfffffe00010d7000          20K     RW   =
              GLB NX pte
[    1.780176] 0xfffffe00010d7000-0xfffffe00010f8000         132K          =
                     pte
[    1.780192] 0xfffffe00010f8000-0xfffffe00010f9000           4K     ro   =
              GLB NX pte
[    1.780208] 0xfffffe00010f9000-0xfffffe00010fa000           4K     RW   =
              GLB NX pte
[    1.780225] 0xfffffe00010fa000-0xfffffe00010fd000          12K     ro   =
              GLB NX pte
[    1.780242] 0xfffffe00010fd000-0xfffffe0001102000          20K     RW   =
              GLB NX pte
[    1.780259] 0xfffffe0001102000-0xfffffe0001123000         132K          =
                     pte
[    1.780274] 0xfffffe0001123000-0xfffffe0001124000           4K     ro   =
              GLB NX pte
[    1.780291] 0xfffffe0001124000-0xfffffe0001125000           4K     RW   =
              GLB NX pte
[    1.780308] 0xfffffe0001125000-0xfffffe0001128000          12K     ro   =
              GLB NX pte
[    1.780325] 0xfffffe0001128000-0xfffffe000112d000          20K     RW   =
              GLB NX pte
[    1.780342] 0xfffffe000112d000-0xfffffe000114e000         132K          =
                     pte
[    1.780357] 0xfffffe000114e000-0xfffffe000114f000           4K     ro   =
              GLB NX pte
[    1.780374] 0xfffffe000114f000-0xfffffe0001150000           4K     RW   =
              GLB NX pte
[    1.780391] 0xfffffe0001150000-0xfffffe0001153000          12K     ro   =
              GLB NX pte
[    1.780408] 0xfffffe0001153000-0xfffffe0001158000          20K     RW   =
              GLB NX pte
[    1.780425] 0xfffffe0001158000-0xfffffe0001179000         132K          =
                     pte
[    1.780440] 0xfffffe0001179000-0xfffffe000117a000           4K     ro   =
              GLB NX pte
[    1.780457] 0xfffffe000117a000-0xfffffe000117b000           4K     RW   =
              GLB NX pte
[    1.780474] 0xfffffe000117b000-0xfffffe000117e000          12K     ro   =
              GLB NX pte
[    1.780490] 0xfffffe000117e000-0xfffffe0001183000          20K     RW   =
              GLB NX pte
[    1.780507] 0xfffffe0001183000-0xfffffe00011a4000         132K          =
                     pte
[    1.780523] 0xfffffe00011a4000-0xfffffe00011a5000           4K     ro   =
              GLB NX pte
[    1.780540] 0xfffffe00011a5000-0xfffffe00011a6000           4K     RW   =
              GLB NX pte
[    1.780556] 0xfffffe00011a6000-0xfffffe00011a9000          12K     ro   =
              GLB NX pte
[    1.780573] 0xfffffe00011a9000-0xfffffe00011ae000          20K     RW   =
              GLB NX pte
[    1.780590] 0xfffffe00011ae000-0xfffffe00011cf000         132K          =
                     pte
[    1.780606] 0xfffffe00011cf000-0xfffffe00011d0000           4K     ro   =
              GLB NX pte
[    1.780622] 0xfffffe00011d0000-0xfffffe00011d1000           4K     RW   =
              GLB NX pte
[    1.780639] 0xfffffe00011d1000-0xfffffe00011d4000          12K     ro   =
              GLB NX pte
[    1.780656] 0xfffffe00011d4000-0xfffffe00011d9000          20K     RW   =
              GLB NX pte
[    1.780673] 0xfffffe00011d9000-0xfffffe00011fa000         132K          =
                     pte
[    1.780695] 0xfffffe00011fa000-0xfffffe00011fb000           4K     ro   =
              GLB NX pte
[    1.780711] 0xfffffe00011fb000-0xfffffe00011fc000           4K     RW   =
              GLB NX pte
[    1.780728] 0xfffffe00011fc000-0xfffffe00011ff000          12K     ro   =
              GLB NX pte
[    1.780745] 0xfffffe00011ff000-0xfffffe0001204000          20K     RW   =
              GLB NX pte
[    1.780762] 0xfffffe0001204000-0xfffffe0001225000         132K          =
                     pte
[    1.780778] 0xfffffe0001225000-0xfffffe0001226000           4K     ro   =
              GLB NX pte
[    1.780794] 0xfffffe0001226000-0xfffffe0001227000           4K     RW   =
              GLB NX pte
[    1.780811] 0xfffffe0001227000-0xfffffe000122a000          12K     ro   =
              GLB NX pte
[    1.780828] 0xfffffe000122a000-0xfffffe000122f000          20K     RW   =
              GLB NX pte
[    1.780845] 0xfffffe000122f000-0xfffffe0001250000         132K          =
                     pte
[    1.780860] 0xfffffe0001250000-0xfffffe0001251000           4K     ro   =
              GLB NX pte
[    1.780877] 0xfffffe0001251000-0xfffffe0001252000           4K     RW   =
              GLB NX pte
[    1.780894] 0xfffffe0001252000-0xfffffe0001255000          12K     ro   =
              GLB NX pte
[    1.780910] 0xfffffe0001255000-0xfffffe000125a000          20K     RW   =
              GLB NX pte
[    1.780928] 0xfffffe000125a000-0xfffffe000127b000         132K          =
                     pte
[    1.780943] 0xfffffe000127b000-0xfffffe000127c000           4K     ro   =
              GLB NX pte
[    1.780960] 0xfffffe000127c000-0xfffffe000127d000           4K     RW   =
              GLB NX pte
[    1.780976] 0xfffffe000127d000-0xfffffe0001280000          12K     ro   =
              GLB NX pte
[    1.780993] 0xfffffe0001280000-0xfffffe0001285000          20K     RW   =
              GLB NX pte
[    1.781010] 0xfffffe0001285000-0xfffffe00012a6000         132K          =
                     pte
[    1.781026] 0xfffffe00012a6000-0xfffffe00012a7000           4K     ro   =
              GLB NX pte
[    1.781042] 0xfffffe00012a7000-0xfffffe00012a8000           4K     RW   =
              GLB NX pte
[    1.781059] 0xfffffe00012a8000-0xfffffe00012ab000          12K     ro   =
              GLB NX pte
[    1.781076] 0xfffffe00012ab000-0xfffffe00012b0000          20K     RW   =
              GLB NX pte
[    1.781093] 0xfffffe00012b0000-0xfffffe00012d1000         132K          =
                     pte
[    1.781108] 0xfffffe00012d1000-0xfffffe00012d2000           4K     ro   =
              GLB NX pte
[    1.781125] 0xfffffe00012d2000-0xfffffe00012d3000           4K     RW   =
              GLB NX pte
[    1.781142] 0xfffffe00012d3000-0xfffffe00012d6000          12K     ro   =
              GLB NX pte
[    1.781159] 0xfffffe00012d6000-0xfffffe00012db000          20K     RW   =
              GLB NX pte
[    1.781176] 0xfffffe00012db000-0xfffffe00012fc000         132K          =
                     pte
[    1.781191] 0xfffffe00012fc000-0xfffffe00012fd000           4K     ro   =
              GLB NX pte
[    1.781208] 0xfffffe00012fd000-0xfffffe00012fe000           4K     RW   =
              GLB NX pte
[    1.781224] 0xfffffe00012fe000-0xfffffe0001301000          12K     ro   =
              GLB NX pte
[    1.781241] 0xfffffe0001301000-0xfffffe0001306000          20K     RW   =
              GLB NX pte
[    1.781258] 0xfffffe0001306000-0xfffffe0001327000         132K          =
                     pte
[    1.781274] 0xfffffe0001327000-0xfffffe0001328000           4K     ro   =
              GLB NX pte
[    1.781290] 0xfffffe0001328000-0xfffffe0001329000           4K     RW   =
              GLB NX pte
[    1.781307] 0xfffffe0001329000-0xfffffe000132c000          12K     ro   =
              GLB NX pte
[    1.781324] 0xfffffe000132c000-0xfffffe0001331000          20K     RW   =
              GLB NX pte
[    1.781341] 0xfffffe0001331000-0xfffffe0001352000         132K          =
                     pte
[    1.781356] 0xfffffe0001352000-0xfffffe0001353000           4K     ro   =
              GLB NX pte
[    1.781373] 0xfffffe0001353000-0xfffffe0001354000           4K     RW   =
              GLB NX pte
[    1.781390] 0xfffffe0001354000-0xfffffe0001357000          12K     ro   =
              GLB NX pte
[    1.781407] 0xfffffe0001357000-0xfffffe000135c000          20K     RW   =
              GLB NX pte
[    1.781424] 0xfffffe000135c000-0xfffffe000137d000         132K          =
                     pte
[    1.781439] 0xfffffe000137d000-0xfffffe000137e000           4K     ro   =
              GLB NX pte
[    1.781456] 0xfffffe000137e000-0xfffffe000137f000           4K     RW   =
              GLB NX pte
[    1.781472] 0xfffffe000137f000-0xfffffe0001382000          12K     ro   =
              GLB NX pte
[    1.781489] 0xfffffe0001382000-0xfffffe0001387000          20K     RW   =
              GLB NX pte
[    1.781506] 0xfffffe0001387000-0xfffffe00013a8000         132K          =
                     pte
[    1.781522] 0xfffffe00013a8000-0xfffffe00013a9000           4K     ro   =
              GLB NX pte
[    1.781538] 0xfffffe00013a9000-0xfffffe00013aa000           4K     RW   =
              GLB NX pte
[    1.781555] 0xfffffe00013aa000-0xfffffe00013ad000          12K     ro   =
              GLB NX pte
[    1.781572] 0xfffffe00013ad000-0xfffffe00013b2000          20K     RW   =
              GLB NX pte
[    1.781589] 0xfffffe00013b2000-0xfffffe00013d3000         132K          =
                     pte
[    1.781604] 0xfffffe00013d3000-0xfffffe00013d4000           4K     ro   =
              GLB NX pte
[    1.781621] 0xfffffe00013d4000-0xfffffe00013d5000           4K     RW   =
              GLB NX pte
[    1.781638] 0xfffffe00013d5000-0xfffffe00013d8000          12K     ro   =
              GLB NX pte
[    1.781655] 0xfffffe00013d8000-0xfffffe00013dd000          20K     RW   =
              GLB NX pte
[    1.781672] 0xfffffe00013dd000-0xfffffe00013fe000         132K          =
                     pte
[    1.781695] 0xfffffe00013fe000-0xfffffe00013ff000           4K     ro   =
              GLB NX pte
[    1.781712] 0xfffffe00013ff000-0xfffffe0001400000           4K     RW   =
              GLB NX pte
[    1.781728] 0xfffffe0001400000-0xfffffe0001403000          12K     ro   =
              GLB NX pte
[    1.781745] 0xfffffe0001403000-0xfffffe0001408000          20K     RW   =
              GLB NX pte
[    1.781762] 0xfffffe0001408000-0xfffffe0001429000         132K          =
                     pte
[    1.781778] 0xfffffe0001429000-0xfffffe000142a000           4K     ro   =
              GLB NX pte
[    1.781794] 0xfffffe000142a000-0xfffffe000142b000           4K     RW   =
              GLB NX pte
[    1.781811] 0xfffffe000142b000-0xfffffe000142e000          12K     ro   =
              GLB NX pte
[    1.781828] 0xfffffe000142e000-0xfffffe0001433000          20K     RW   =
              GLB NX pte
[    1.781845] 0xfffffe0001433000-0xfffffe0001454000         132K          =
                     pte
[    1.781861] 0xfffffe0001454000-0xfffffe0001455000           4K     ro   =
              GLB NX pte
[    1.781877] 0xfffffe0001455000-0xfffffe0001456000           4K     RW   =
              GLB NX pte
[    1.781894] 0xfffffe0001456000-0xfffffe0001459000          12K     ro   =
              GLB NX pte
[    1.781911] 0xfffffe0001459000-0xfffffe000145e000          20K     RW   =
              GLB NX pte
[    1.781928] 0xfffffe000145e000-0xfffffe000147f000         132K          =
                     pte
[    1.781943] 0xfffffe000147f000-0xfffffe0001480000           4K     ro   =
              GLB NX pte
[    1.781960] 0xfffffe0001480000-0xfffffe0001481000           4K     RW   =
              GLB NX pte
[    1.781977] 0xfffffe0001481000-0xfffffe0001484000          12K     ro   =
              GLB NX pte
[    1.781994] 0xfffffe0001484000-0xfffffe0001489000          20K     RW   =
              GLB NX pte
[    1.782011] 0xfffffe0001489000-0xfffffe00014aa000         132K          =
                     pte
[    1.782026] 0xfffffe00014aa000-0xfffffe00014ab000           4K     ro   =
              GLB NX pte
[    1.782043] 0xfffffe00014ab000-0xfffffe00014ac000           4K     RW   =
              GLB NX pte
[    1.782060] 0xfffffe00014ac000-0xfffffe00014af000          12K     ro   =
              GLB NX pte
[    1.782077] 0xfffffe00014af000-0xfffffe00014b4000          20K     RW   =
              GLB NX pte
[    1.782094] 0xfffffe00014b4000-0xfffffe00014d5000         132K          =
                     pte
[    1.782109] 0xfffffe00014d5000-0xfffffe00014d6000           4K     ro   =
              GLB NX pte
[    1.782126] 0xfffffe00014d6000-0xfffffe00014d7000           4K     RW   =
              GLB NX pte
[    1.782143] 0xfffffe00014d7000-0xfffffe00014da000          12K     ro   =
              GLB NX pte
[    1.782160] 0xfffffe00014da000-0xfffffe00014df000          20K     RW   =
              GLB NX pte
[    1.782177] 0xfffffe00014df000-0xfffffe0001500000         132K          =
                     pte
[    1.782192] 0xfffffe0001500000-0xfffffe0001501000           4K     ro   =
              GLB NX pte
[    1.782209] 0xfffffe0001501000-0xfffffe0001502000           4K     RW   =
              GLB NX pte
[    1.782226] 0xfffffe0001502000-0xfffffe0001505000          12K     ro   =
              GLB NX pte
[    1.782242] 0xfffffe0001505000-0xfffffe000150a000          20K     RW   =
              GLB NX pte
[    1.782259] 0xfffffe000150a000-0xfffffe000152b000         132K          =
                     pte
[    1.782275] 0xfffffe000152b000-0xfffffe000152c000           4K     ro   =
              GLB NX pte
[    1.782292] 0xfffffe000152c000-0xfffffe000152d000           4K     RW   =
              GLB NX pte
[    1.782308] 0xfffffe000152d000-0xfffffe0001530000          12K     ro   =
              GLB NX pte
[    1.782325] 0xfffffe0001530000-0xfffffe0001535000          20K     RW   =
              GLB NX pte
[    1.782342] 0xfffffe0001535000-0xfffffe0001556000         132K          =
                     pte
[    1.782358] 0xfffffe0001556000-0xfffffe0001557000           4K     ro   =
              GLB NX pte
[    1.782374] 0xfffffe0001557000-0xfffffe0001558000           4K     RW   =
              GLB NX pte
[    1.782391] 0xfffffe0001558000-0xfffffe000155b000          12K     ro   =
              GLB NX pte
[    1.782408] 0xfffffe000155b000-0xfffffe0001560000          20K     RW   =
              GLB NX pte
[    1.782426] 0xfffffe0001560000-0xfffffe0001600000         640K          =
                     pte
[    1.782445] 0xfffffe0001600000-0xfffffe0040000000        1002M          =
                     pmd
[    1.782463] 0xfffffe0040000000-0xfffffe8000000000         511G          =
                     pud
[    1.782479] 0xfffffe8000000000-0xffffff0000000000         512G          =
                     pgd
[    1.782494] ---[ ESPfix Area ]---
[    1.782504] 0xffffff0000000000-0xffffff5c00000000         368G          =
                     pud
[    1.782519] 0xffffff5c00000000-0xffffff5c00001000           4K     ro   =
              GLB NX pte
[    1.782536] 0xffffff5c00001000-0xffffff5c00010000          60K          =
                     pte
[    1.782551] 0xffffff5c00010000-0xffffff5c00011000           4K     ro   =
              GLB NX pte
[    1.782568] 0xffffff5c00011000-0xffffff5c00020000          60K          =
                     pte
[    1.782583] 0xffffff5c00020000-0xffffff5c00021000           4K     ro   =
              GLB NX pte
[    1.782600] 0xffffff5c00021000-0xffffff5c00030000          60K          =
                     pte
[    1.782616] 0xffffff5c00030000-0xffffff5c00031000           4K     ro   =
              GLB NX pte
[    1.782633] 0xffffff5c00031000-0xffffff5c00040000          60K          =
                     pte
[    1.782648] 0xffffff5c00040000-0xffffff5c00041000           4K     ro   =
              GLB NX pte
[    1.782665] 0xffffff5c00041000-0xffffff5c00050000          60K          =
                     pte
[    1.782680] 0xffffff5c00050000-0xffffff5c00051000           4K     ro   =
              GLB NX pte
[    1.782695] 0xffffff5c00051000-0xffffff5c00060000          60K          =
                     pte
[    1.782710] 0xffffff5c00060000-0xffffff5c00061000           4K     ro   =
              GLB NX pte
[    1.782727] 0xffffff5c00061000-0xffffff5c00070000          60K          =
                     pte
[    1.782742] 0xffffff5c00070000-0xffffff5c00071000           4K     ro   =
              GLB NX pte
[    1.793051] ... 131058 entries skipped ...=20
[    1.793059] ---[ EFI Runtime Services ]---
[    1.793067] 0xffffffef00000000-0xfffffffec0000000          63G          =
                     pud
[    1.793085] 0xfffffffec0000000-0xfffffffef6000000         864M          =
                     pmd
[    1.793101] 0xfffffffef6000000-0xfffffffef6020000         128K          =
                     pte
[    1.793120] 0xfffffffef6020000-0xfffffffef6200000        1920K          =
                     pte
[    1.793136] 0xfffffffef6200000-0xfffffffef623b000         236K          =
                     pte
[    1.793154] 0xfffffffef623b000-0xfffffffef638a000        1340K          =
                     pte
[    1.793171] 0xfffffffef638a000-0xfffffffef6400000         472K     RW   =
                  x  pte
[    1.793188] 0xfffffffef6400000-0xfffffffef8e00000          42M     RW   =
      PSE         x  pmd
[    1.793208] 0xfffffffef8e00000-0xfffffffef8f61000        1412K     RW   =
                  x  pte
[    1.793226] 0xfffffffef8f61000-0xfffffffef9000000         636K          =
                     pte
[    1.793241] 0xfffffffef9000000-0xfffffffef9600000           6M          =
                     pmd
[    1.793259] 0xfffffffef9600000-0xfffffffef9710000        1088K          =
                     pte
[    1.793275] 0xfffffffef9710000-0xfffffffef9768000         352K     RW   =
                  x  pte
[    1.793293] 0xfffffffef9768000-0xfffffffef9800000         608K          =
                     pte
[    1.793308] 0xfffffffef9800000-0xfffffffefbe00000          38M          =
                     pmd
[    1.793324] 0xfffffffefbe00000-0xfffffffefbe37000         220K          =
                     pte
[    1.793343] 0xfffffffefbe37000-0xfffffffefbfc2000        1580K          =
                     pte
[    1.793358] 0xfffffffefbfc2000-0xfffffffefc000000         248K          =
                     pte
[    1.793374] 0xfffffffefc000000-0xfffffffefc400000           4M          =
                     pmd
[    1.793389] 0xfffffffefc400000-0xfffffffefc437000         220K          =
                     pte
[    1.793407] 0xfffffffefc437000-0xfffffffefc510000         868K          =
                     pte
[    1.793424] 0xfffffffefc510000-0xfffffffefc600000         960K     RW   =
                  NX pte
[    1.793441] 0xfffffffefc600000-0xfffffffefcc00000           6M     RW   =
      PSE         NX pmd
[    1.793459] 0xfffffffefcc00000-0xfffffffefccc3000         780K     RW   =
                  NX pte
[    1.793476] 0xfffffffefccc3000-0xfffffffefccc6000          12K     ro   =
                  x  pte
[    1.793493] 0xfffffffefccc6000-0xfffffffefcccb000          20K     RW   =
                  NX pte
[    1.793509] 0xfffffffefcccb000-0xfffffffefcccc000           4K     ro   =
                  x  pte
[    1.793526] 0xfffffffefcccc000-0xfffffffefccd0000          16K     RW   =
                  NX pte
[    1.793543] 0xfffffffefccd0000-0xfffffffefccd1000           4K     ro   =
                  x  pte
[    1.793560] 0xfffffffefccd1000-0xfffffffefccd5000          16K     RW   =
                  NX pte
[    1.793576] 0xfffffffefccd5000-0xfffffffefccd8000          12K     ro   =
                  x  pte
[    1.793593] 0xfffffffefccd8000-0xfffffffefccdd000          20K     RW   =
                  NX pte
[    1.793610] 0xfffffffefccdd000-0xfffffffefccdf000           8K     ro   =
                  x  pte
[    1.793626] 0xfffffffefccdf000-0xfffffffefcce4000          20K     RW   =
                  NX pte
[    1.793643] 0xfffffffefcce4000-0xfffffffefcce5000           4K     ro   =
                  x  pte
[    1.793660] 0xfffffffefcce5000-0xfffffffefcce9000          16K     RW   =
                  NX pte
[    1.793677] 0xfffffffefcce9000-0xfffffffefccea000           4K     ro   =
                  x  pte
[    1.793695] 0xfffffffefccea000-0xfffffffefccee000          16K     RW   =
                  NX pte
[    1.793711] 0xfffffffefccee000-0xfffffffefccf0000           8K     ro   =
                  x  pte
[    1.793728] 0xfffffffefccf0000-0xfffffffefccf5000          20K     RW   =
                  NX pte
[    1.793745] 0xfffffffefccf5000-0xfffffffefccf6000           4K     ro   =
                  x  pte
[    1.793762] 0xfffffffefccf6000-0xfffffffefccfa000          16K     RW   =
                  NX pte
[    1.793778] 0xfffffffefccfa000-0xfffffffefccfd000          12K     ro   =
                  x  pte
[    1.793795] 0xfffffffefccfd000-0xfffffffefcd01000          16K     RW   =
                  NX pte
[    1.793812] 0xfffffffefcd01000-0xfffffffefcd0e000          52K     ro   =
                  x  pte
[    1.793829] 0xfffffffefcd0e000-0xfffffffefcd15000          28K     RW   =
                  NX pte
[    1.793845] 0xfffffffefcd15000-0xfffffffefcd17000           8K     ro   =
                  x  pte
[    1.793862] 0xfffffffefcd17000-0xfffffffefcd1d000          24K     RW   =
                  NX pte
[    1.793879] 0xfffffffefcd1d000-0xfffffffefcd1f000           8K     ro   =
                  x  pte
[    1.793896] 0xfffffffefcd1f000-0xfffffffefcd25000          24K     RW   =
                  NX pte
[    1.793912] 0xfffffffefcd25000-0xfffffffefcd26000           4K     ro   =
                  x  pte
[    1.793929] 0xfffffffefcd26000-0xfffffffefcd2b000          20K     RW   =
                  NX pte
[    1.793946] 0xfffffffefcd2b000-0xfffffffefcd2c000           4K     ro   =
                  x  pte
[    1.793962] 0xfffffffefcd2c000-0xfffffffefcd31000          20K     RW   =
                  NX pte
[    1.793979] 0xfffffffefcd31000-0xfffffffefcd32000           4K     ro   =
                  x  pte
[    1.793996] 0xfffffffefcd32000-0xfffffffefcd37000          20K     RW   =
                  NX pte
[    1.794013] 0xfffffffefcd37000-0xfffffffefcd38000           4K     ro   =
                  x  pte
[    1.794029] 0xfffffffefcd38000-0xfffffffefcd3d000          20K     RW   =
                  NX pte
[    1.794046] 0xfffffffefcd3d000-0xfffffffefcd40000          12K     ro   =
                  x  pte
[    1.794063] 0xfffffffefcd40000-0xfffffffefcd45000          20K     RW   =
                  NX pte
[    1.794080] 0xfffffffefcd45000-0xfffffffefcd4f000          40K     ro   =
                  x  pte
[    1.794096] 0xfffffffefcd4f000-0xfffffffefcd56000          28K     RW   =
                  NX pte
[    1.794113] 0xfffffffefcd56000-0xfffffffefcd5b000          20K     ro   =
                  x  pte
[    1.794130] 0xfffffffefcd5b000-0xfffffffefcd61000          24K     RW   =
                  NX pte
[    1.794147] 0xfffffffefcd61000-0xfffffffefcd65000          16K     ro   =
                  x  pte
[    1.794163] 0xfffffffefcd65000-0xfffffffefcd6b000          24K     RW   =
                  NX pte
[    1.794181] 0xfffffffefcd6b000-0xfffffffefce00000         596K          =
                     pte
[    1.794197] 0xfffffffefce00000-0xfffffffefe000000          18M          =
                     pmd
[    1.794214] 0xfffffffefe000000-0xfffffffefe100000           1M          =
                     pte
[    1.794233] 0xfffffffefe100000-0xfffffffefe280000        1536K     RW   =
                  x  pte
[    1.794251] 0xfffffffefe280000-0xfffffffefe2f0000         448K          =
                     pte
[    1.794266] 0xfffffffefe2f0000-0xfffffffefe2f1000           4K     RW   =
                  x  pte
[    1.794285] 0xfffffffefe2f1000-0xfffffffefe400000        1084K          =
                     pte
[    1.794304] 0xfffffffefe400000-0xfffffffefe580000        1536K     RW   =
                  x  pte
[    1.794322] 0xfffffffefe580000-0xfffffffefe5f0000         448K          =
                     pte
[    1.794337] 0xfffffffefe5f0000-0xfffffffefe5f1000           4K     RW   =
                  x  pte
[    1.794354] 0xfffffffefe5f1000-0xfffffffefe600000          60K          =
                     pte
[    1.794372] 0xfffffffefe600000-0xfffffffefe780000        1536K     RW   =
                  x  pte
[    1.794390] 0xfffffffefe780000-0xfffffffefe7f0000         448K          =
                     pte
[    1.794405] 0xfffffffefe7f0000-0xfffffffefe7f1000           4K     RW   =
                  x  pte
[    1.794425] 0xfffffffefe7f1000-0xfffffffefe900000        1084K          =
                     pte
[    1.794441] 0xfffffffefe900000-0xfffffffefe980000         512K     RW   =
                  x  pte
[    1.794459] 0xfffffffefe980000-0xfffffffefe9f0000         448K          =
                     pte
[    1.794474] 0xfffffffefe9f0000-0xfffffffefe9f1000           4K     RW   =
                  x  pte
[    1.794491] 0xfffffffefe9f1000-0xfffffffefea00000          60K          =
                     pte
[    1.794508] 0xfffffffefea00000-0xfffffffefeb00000           1M     RW   =
                  x  pte
[    1.794527] 0xfffffffefeb00000-0xfffffffefec00000           1M          =
                     pte
[    1.794543] 0xfffffffefec00000-0xfffffffefec01000           4K     RW   =
                  x  pte
[    1.794559] 0xfffffffefec01000-0xfffffffefec10000          60K          =
                     pte
[    1.794575] 0xfffffffefec10000-0xfffffffefec11000           4K     RW   =
                  x  pte
[    1.794593] 0xfffffffefec11000-0xfffffffefed00000         956K          =
                     pte
[    1.794609] 0xfffffffefed00000-0xfffffffefed01000           4K     RW   =
                  x  pte
[    1.794626] 0xfffffffefed01000-0xfffffffefed40000         252K          =
                     pte
[    1.794641] 0xfffffffefed40000-0xfffffffefed45000          20K     RW   =
                  x  pte
[    1.794658] 0xfffffffefed45000-0xfffffffefed80000         236K          =
                     pte
[    1.794674] 0xfffffffefed80000-0xfffffffefed90000          64K     RW   =
                  x  pte
[    1.794695] 0xfffffffefed90000-0xfffffffefedc0000         192K          =
                     pte
[    1.794710] 0xfffffffefedc0000-0xfffffffefedc1000           4K     RW   =
                  x  pte
[    1.794727] 0xfffffffefedc1000-0xfffffffefedc2000           4K          =
                     pte
[    1.794742] 0xfffffffefedc2000-0xfffffffefedc9000          28K     RW   =
                  x  pte
[    1.794759] 0xfffffffefedc9000-0xfffffffefee00000         220K          =
                     pte
[    1.794777] 0xfffffffefee00000-0xfffffffefef00000           1M     RW   =
                  x  pte
[    1.794796] 0xfffffffefef00000-0xfffffffeff000000           1M          =
                     pte
[    1.794811] 0xfffffffeff000000-0xffffffff00000000          16M     RW   =
      PSE         x  pmd
[    1.794828] 0xffffffff00000000-0xffffffff80000000           2G          =
                     pud
[    1.794843] ---[ High Kernel Mapping ]---
[    1.794852] 0xffffffff80000000-0xffffffff8e000000         224M          =
                     pmd
[    1.794867] 0xffffffff8e000000-0xffffffff91600000          54M     RW   =
      PSE     GLB x  pmd
[    1.794887] 0xffffffff91600000-0xffffffffc0000000         746M          =
                     pmd
[    1.794902] ---[ Modules ]---
[    1.794911] 0xffffffffc0000000-0xffffffffff000000        1008M          =
                     pmd
[    1.794926] ---[ End Modules ]---
[    1.794933] 0xffffffffff000000-0xffffffffff200000           2M          =
                     pmd
[    1.794956] 0xffffffffff200000-0xffffffffff576000        3544K          =
                     pte
[    1.794971] ---[ Fixmap Area ]---
[    1.794979] 0xffffffffff576000-0xffffffffff5f7000         516K          =
                     pte
[    1.794995] 0xffffffffff5f7000-0xffffffffff5fd000          24K     RW PW=
T PCD         GLB NX pte
[    1.795012] 0xffffffffff5fd000-0xffffffffff600000          12K          =
                     pte
[    1.795027] 0xffffffffff600000-0xffffffffff601000           4K USR ro   =
              GLB NX pte
[    1.795048] 0xffffffffff601000-0xffffffffff800000        2044K          =
                     pte
[    1.795063] 0xffffffffff800000-0x0000000000000000           8M          =
                     pmd
[    1.795349] LSM: Security Framework initializing
[    1.795359] Yama: becoming mindful.
[    1.795378] SELinux:  Initializing.
[    1.802181] Dentry cache hash table entries: 4194304 (order: 13, 3355443=
2 bytes)
[    1.805480] Inode-cache hash table entries: 2097152 (order: 12, 16777216=
 bytes)
[    1.805668] Mount-cache hash table entries: 65536 (order: 7, 524288 byte=
s)
[    1.805810] Mountpoint-cache hash table entries: 65536 (order: 7, 524288=
 bytes)
[    1.806867] mce: CPU supports 23 MCE banks
[    1.806943] LVT offset 2 assigned for vector 0xf4
[    1.806962] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    1.806973] Last level dTLB entries: 4KB 1536, 2MB 1536, 4MB 768, 1GB 0
[    1.806985] Spectre V2 : Mitigation: Full AMD retpoline
[    1.806994] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB=
 on context switch
[    1.807016] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    1.807031] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl and seccomp
[    1.807440] Freeing SMP alternatives memory: 28K
[    1.809692] smpboot: CPU0: AMD EPYC 7351P 16-Core Processor (family: 0x1=
7, model: 0x1, stepping: 0x2)
[    1.809692] Performance Events: Fam17h core perfctr, AMD PMU driver.
[    1.809692] ... version:                0
[    1.809692] ... bit width:              48
[    1.809692] ... generic registers:      6
[    1.809692] ... value mask:             0000ffffffffffff
[    1.809692] ... max period:             00007fffffffffff
[    1.809692] ... fixed-purpose events:   0
[    1.809692] ... event mask:             000000000000003f
[    1.810042] rcu: Hierarchical SRCU implementation.
[    1.810886] random: crng done (trusting CPU's manufacturer)
[    1.811089] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    1.814436] smp: Bringing up secondary CPUs ...
[    1.814860] x86: Booting SMP configuration:
[    1.814879] .... node  #0, CPUs:          #1   #2   #3
[    1.819985] .... node  #1, CPUs:     #4   #5   #6   #7
[    1.826978] .... node  #2, CPUs:     #8   #9  #10  #11
[    1.833975] .... node  #3, CPUs:    #12  #13  #14  #15
[    1.840883] smp: Brought up 4 nodes, 16 CPUs
[    1.840883] smpboot: Max logical packages: 8
[    1.840883] smpboot: Total of 16 processors activated (76803.07 BogoMIPS=
)
[    1.845098] devtmpfs: initialized
[    1.845098] x86/mm: Memory block size: 128MB
[    1.853764] PM: Registering ACPI NVS region [mem 0xda4b8000-0xda50ffff] =
(360448 bytes)
[    1.857392] DMA-API: preallocated 65548 debug entries
[    1.857405] DMA-API: debugging enabled by kernel config
[    1.857417] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    1.857883] futex hash table entries: 32768 (order: 10, 4194304 bytes)
[    1.859818] pinctrl core: initialized pinctrl subsystem

[    1.860198] ************************************************************=
*
[    1.860210] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    *=
*
[    1.860221] **                                                         *=
*
[    1.860232] **  IOMMU DebugFS SUPPORT HAS BEEN ENABLED IN THIS KERNEL  *=
*
[    1.860243] **                                                         *=
*
[    1.860254] ** This means that this kernel is built to expose internal *=
*
[    1.860265] ** IOMMU data structures, which may compromise security on *=
*
[    1.860276] ** your system.                                            *=
*
[    1.860287] **                                                         *=
*
[    1.860298] ** If you see this message and you are not debugging the   *=
*
[    1.860309] ** kernel, report this immediately to your vendor!         *=
*
[    1.860320] **                                                         *=
*
[    1.860331] **     NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE NOTICE    *=
*
[    1.860342] ************************************************************=
*
[    1.860404] RTC time: 12:56:37, date: 2019-06-25
[    1.861031] NET: Registered protocol family 16
[    1.861341] audit: initializing netlink subsys (disabled)
[    1.861428] audit: type=3D2000 audit(1561467397.110:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    1.861812] cpuidle: using governor menu
[    1.861968] ACPI: bus type PCI registered
[    1.861968] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    1.862226] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000=
-0xf7ffffff] (base 0xf0000000)
[    1.862246] PCI: not using MMCONFIG
[    1.862255] PCI: Using configuration type 1 for base access
[    1.862264] PCI: Using configuration type 1 for extended access
[    1.870100] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    1.870100] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    1.871198] cryptd: max_cpu_qlen set to 1000
[    1.872049] fbcon: Taking over console
[    1.872702] ACPI: Added _OSI(Module Device)
[    1.872702] ACPI: Added _OSI(Processor Device)
[    1.872702] ACPI: Added _OSI(3.0 _SCP Extensions)
[    1.872702] ACPI: Added _OSI(Processor Aggregator Device)
[    1.872702] ACPI: Added _OSI(Linux-Dell-Video)
[    1.872702] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    1.872702] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    1.906439] ACPI: 6 ACPI AML tables successfully acquired and loaded
[    1.918355] ACPI: Interpreter enabled
[    1.918396] ACPI: (supports S0 S5)
[    1.918405] ACPI: Using IOAPIC for interrupt routing
[    1.918904] PCI: MMCONFIG for domain 0000 [bus 00-7f] at [mem 0xf0000000=
-0xf7ffffff] (base 0xf0000000)
[    1.919019] PCI: MMCONFIG at [mem 0xf0000000-0xf7ffffff] reserved in ACP=
I motherboard resources
[    1.919107] HEST: Table parsing has been initialized.
[    1.919118] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    1.920600] ACPI: Enabled 2 GPEs in block 00 to 1F
[    1.926758] ACPI: Power Resource [P0SA] (off)
[    1.926870] ACPI: Power Resource [P3SA] (off)
[    1.939506] ACPI: Power Resource [P0SA] (off)
[    1.939602] ACPI: Power Resource [P3SA] (off)
[    1.945218] ACPI: Power Resource [P0SA] (off)
[    1.945310] ACPI: Power Resource [P3SA] (off)
[    1.950923] ACPI: Power Resource [P0SA] (off)
[    1.951014] ACPI: Power Resource [P3SA] (off)
[    1.955911] ACPI: Power Resource [P0SA] (off)
[    1.956003] ACPI: Power Resource [P3SA] (off)
[    1.960904] ACPI: Power Resource [P0SA] (off)
[    1.960995] ACPI: Power Resource [P3SA] (off)
[    1.965922] ACPI: Power Resource [P0SA] (off)
[    1.966018] ACPI: Power Resource [P3SA] (off)
[    1.970945] ACPI: Power Resource [P0SA] (off)
[    1.971040] ACPI: Power Resource [P3SA] (off)
[    1.979670] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-1f])
[    1.979697] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    1.980284] acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplu=
g LTR]
[    1.980842] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    1.982000] PCI host bridge to bus 0000:00
[    1.982011] pci_bus 0000:00: root bus resource [io  0x0000-0x02ff window=
]
[    1.982023] pci_bus 0000:00: root bus resource [io  0x0300-0x03af window=
]
[    1.982035] pci_bus 0000:00: root bus resource [io  0x03e0-0x0cf7 window=
]
[    1.982047] pci_bus 0000:00: root bus resource [io  0x03b0-0x03df window=
]
[    1.982059] pci_bus 0000:00: root bus resource [io  0x0d00-0x1fff window=
]
[    1.982072] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    1.982085] pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000dfff=
f window]
[    1.982098] pci_bus 0000:00: root bus resource [mem 0xec000000-0xeffffff=
f window]
[    1.982112] pci_bus 0000:00: root bus resource [mem 0x185c8000000-0x1fff=
fffffff window]
[    1.982126] pci_bus 0000:00: root bus resource [bus 00-1f]
[    1.982161] pci 0000:00:00.0: [1022:1450] type 00 class 0x060000
[    1.982423] pci 0000:00:00.2: [1022:1451] type 00 class 0x080600
[    1.982655] pci 0000:00:01.0: [1022:1452] type 00 class 0x060000
[    1.982874] pci 0000:00:01.6: [1022:1453] type 01 class 0x060400
[    1.983534] pci 0000:00:01.6: PME# supported from D0 D3hot D3cold
[    1.983870] pci 0000:00:02.0: [1022:1452] type 00 class 0x060000
[    1.984086] pci 0000:00:03.0: [1022:1452] type 00 class 0x060000
[    1.984296] pci 0000:00:04.0: [1022:1452] type 00 class 0x060000
[    1.984509] pci 0000:00:07.0: [1022:1452] type 00 class 0x060000
[    1.984711] pci 0000:00:07.1: [1022:1454] type 01 class 0x060400
[    1.985440] pci 0000:00:07.1: enabling Extended Tags
[    1.985551] pci 0000:00:07.1: PME# supported from D0 D3hot D3cold
[    1.985836] pci 0000:00:08.0: [1022:1452] type 00 class 0x060000
[    1.986035] pci 0000:00:08.1: [1022:1454] type 01 class 0x060400
[    1.986391] pci 0000:00:08.1: enabling Extended Tags
[    1.986504] pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    1.986798] pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500
[    1.987149] pci 0000:00:14.3: [1022:790e] type 00 class 0x060100
[    1.987502] pci 0000:00:18.0: [1022:1460] type 00 class 0x060000
[    1.987686] pci 0000:00:18.1: [1022:1461] type 00 class 0x060000
[    1.987878] pci 0000:00:18.2: [1022:1462] type 00 class 0x060000
[    1.988065] pci 0000:00:18.3: [1022:1463] type 00 class 0x060000
[    1.988248] pci 0000:00:18.4: [1022:1464] type 00 class 0x060000
[    1.988431] pci 0000:00:18.5: [1022:1465] type 00 class 0x060000
[    1.988614] pci 0000:00:18.6: [1022:1466] type 00 class 0x060000
[    1.988806] pci 0000:00:18.7: [1022:1467] type 00 class 0x060000
[    1.988990] pci 0000:00:19.0: [1022:1460] type 00 class 0x060000
[    1.989177] pci 0000:00:19.1: [1022:1461] type 00 class 0x060000
[    1.989364] pci 0000:00:19.2: [1022:1462] type 00 class 0x060000
[    1.989550] pci 0000:00:19.3: [1022:1463] type 00 class 0x060000
[    1.989744] pci 0000:00:19.4: [1022:1464] type 00 class 0x060000
[    1.989929] pci 0000:00:19.5: [1022:1465] type 00 class 0x060000
[    1.990118] pci 0000:00:19.6: [1022:1466] type 00 class 0x060000
[    1.990307] pci 0000:00:19.7: [1022:1467] type 00 class 0x060000
[    1.990493] pci 0000:00:1a.0: [1022:1460] type 00 class 0x060000
[    1.990680] pci 0000:00:1a.1: [1022:1461] type 00 class 0x060000
[    1.990872] pci 0000:00:1a.2: [1022:1462] type 00 class 0x060000
[    1.991061] pci 0000:00:1a.3: [1022:1463] type 00 class 0x060000
[    1.991248] pci 0000:00:1a.4: [1022:1464] type 00 class 0x060000
[    1.991435] pci 0000:00:1a.5: [1022:1465] type 00 class 0x060000
[    1.991622] pci 0000:00:1a.6: [1022:1466] type 00 class 0x060000
[    1.991821] pci 0000:00:1a.7: [1022:1467] type 00 class 0x060000
[    1.992007] pci 0000:00:1b.0: [1022:1460] type 00 class 0x060000
[    1.992195] pci 0000:00:1b.1: [1022:1461] type 00 class 0x060000
[    1.992382] pci 0000:00:1b.2: [1022:1462] type 00 class 0x060000
[    1.992569] pci 0000:00:1b.3: [1022:1463] type 00 class 0x060000
[    1.992765] pci 0000:00:1b.4: [1022:1464] type 00 class 0x060000
[    1.992952] pci 0000:00:1b.5: [1022:1465] type 00 class 0x060000
[    1.993139] pci 0000:00:1b.6: [1022:1466] type 00 class 0x060000
[    1.993328] pci 0000:00:1b.7: [1022:1467] type 00 class 0x060000
[    1.993653] pci 0000:01:00.0: [1a03:1150] type 01 class 0x060400
[    1.993786] pci 0000:01:00.0: supports D1 D2
[    1.993788] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.996728] pci 0000:00:01.6: PCI bridge to [bus 01-02]
[    1.996743] pci 0000:00:01.6:   bridge window [io  0x1000-0x1fff]
[    1.996746] pci 0000:00:01.6:   bridge window [mem 0xec000000-0xee0fffff=
]
[    1.996790] pci_bus 0000:02: extended config space not accessible
[    1.996851] pci 0000:02:00.0: [1a03:2000] type 00 class 0x030000
[    1.996874] pci 0000:02:00.0: reg 0x10: [mem 0xec000000-0xedffffff]
[    1.996886] pci 0000:02:00.0: reg 0x14: [mem 0xee000000-0xee01ffff]
[    1.996899] pci 0000:02:00.0: reg 0x18: [io  0x1000-0x107f]
[    1.997003] pci 0000:02:00.0: supports D1 D2
[    1.997005] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    1.997146] pci 0000:01:00.0: PCI bridge to [bus 02]
[    1.997161] pci 0000:01:00.0:   bridge window [io  0x1000-0x1fff]
[    1.997166] pci 0000:01:00.0:   bridge window [mem 0xec000000-0xee0fffff=
]
[    1.997513] pci 0000:03:00.0: [1022:145a] type 00 class 0x130000
[    1.997548] pci 0000:03:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    1.997562] pci 0000:03:00.0: enabling Extended Tags
[    1.997743] pci 0000:03:00.2: [1022:1456] type 00 class 0x108000
[    1.997762] pci 0000:03:00.2: reg 0x18: [mem 0xee300000-0xee3fffff]
[    1.997773] pci 0000:03:00.2: reg 0x24: [mem 0xee400000-0xee401fff]
[    1.997782] pci 0000:03:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    1.997795] pci 0000:03:00.2: enabling Extended Tags
[    1.997972] pci 0000:03:00.3: [1022:145f] type 00 class 0x0c0330
[    1.997989] pci 0000:03:00.3: reg 0x10: [mem 0xee200000-0xee2fffff 64bit=
]
[    1.998016] pci 0000:03:00.3: Max Payload Size set to 256 (was 128, max =
256)
[    1.998030] pci 0000:03:00.3: enabling Extended Tags
[    1.998087] pci 0000:03:00.3: PME# supported from D0 D3hot D3cold
[    1.998257] pci 0000:00:07.1: PCI bridge to [bus 03]
[    1.998270] pci 0000:00:07.1:   bridge window [mem 0xee200000-0xee4fffff=
]
[    1.998601] pci 0000:04:00.0: [1022:1455] type 00 class 0x130000
[    1.998638] pci 0000:04:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    1.998651] pci 0000:04:00.0: enabling Extended Tags
[    1.998840] pci 0000:04:00.1: [1022:1468] type 00 class 0x108000
[    1.998861] pci 0000:04:00.1: reg 0x18: [mem 0xee500000-0xee5fffff]
[    1.998872] pci 0000:04:00.1: reg 0x24: [mem 0xee600000-0xee601fff]
[    1.998881] pci 0000:04:00.1: Max Payload Size set to 256 (was 128, max =
256)
[    1.998894] pci 0000:04:00.1: enabling Extended Tags
[    1.999094] pci 0000:04:00.2: [1022:7901] type 00 class 0x010601
[    1.999133] pci 0000:04:00.2: reg 0x24: [mem 0xee602000-0xee602fff]
[    1.999144] pci 0000:04:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    1.999157] pci 0000:04:00.2: enabling Extended Tags
[    1.999214] pci 0000:04:00.2: PME# supported from D3hot D3cold
[    1.999395] pci 0000:00:08.1: PCI bridge to [bus 04]
[    1.999408] pci 0000:00:08.1:   bridge window [mem 0xee500000-0xee6fffff=
]
[    1.999428] pci_bus 0000:00: on NUMA node 0
[    2.002618] ACPI: PCI Root Bridge [S0D1] (domain 0000 [bus 20-3f])
[    2.002635] acpi PNP0A08:01: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    2.003207] acpi PNP0A08:01: _OSC: platform does not support [SHPCHotplu=
g LTR]
[    2.003755] acpi PNP0A08:01: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    2.004623] PCI host bridge to bus 0000:20
[    2.004634] pci_bus 0000:20: root bus resource [mem 0xeba00000-0xebeffff=
f window]
[    2.004647] pci_bus 0000:20: root bus resource [mem 0x10b90000000-0x185c=
7ffffff window]
[    2.004662] pci_bus 0000:20: root bus resource [bus 20-3f]
[    2.004678] pci 0000:20:00.0: [1022:1450] type 00 class 0x060000
[    2.004876] pci 0000:20:00.2: [1022:1451] type 00 class 0x080600
[    2.005091] pci 0000:20:01.0: [1022:1452] type 00 class 0x060000
[    2.005285] pci 0000:20:02.0: [1022:1452] type 00 class 0x060000
[    2.005489] pci 0000:20:03.0: [1022:1452] type 00 class 0x060000
[    2.005679] pci 0000:20:04.0: [1022:1452] type 00 class 0x060000
[    2.005890] pci 0000:20:07.0: [1022:1452] type 00 class 0x060000
[    2.006071] pci 0000:20:07.1: [1022:1454] type 01 class 0x060400
[    2.006622] pci 0000:20:07.1: enabling Extended Tags
[    2.006737] pci 0000:20:07.1: PME# supported from D0 D3hot D3cold
[    2.006974] pci 0000:20:08.0: [1022:1452] type 00 class 0x060000
[    2.007157] pci 0000:20:08.1: [1022:1454] type 01 class 0x060400
[    2.007599] pci 0000:20:08.1: enabling Extended Tags
[    2.007726] pci 0000:20:08.1: PME# supported from D0 D3hot D3cold
[    2.008752] pci 0000:21:00.0: [1022:145a] type 00 class 0x130000
[    2.008791] pci 0000:21:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.008805] pci 0000:21:00.0: enabling Extended Tags
[    2.008969] pci 0000:21:00.2: [1022:1456] type 00 class 0x108000
[    2.008990] pci 0000:21:00.2: reg 0x18: [mem 0xebb00000-0xebbfffff]
[    2.009002] pci 0000:21:00.2: reg 0x24: [mem 0xebc00000-0xebc01fff]
[    2.009011] pci 0000:21:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    2.009025] pci 0000:21:00.2: enabling Extended Tags
[    2.009205] pci 0000:21:00.3: [1022:145f] type 00 class 0x0c0330
[    2.009223] pci 0000:21:00.3: reg 0x10: [mem 0xeba00000-0xebafffff 64bit=
]
[    2.009252] pci 0000:21:00.3: Max Payload Size set to 256 (was 128, max =
256)
[    2.009266] pci 0000:21:00.3: enabling Extended Tags
[    2.009325] pci 0000:21:00.3: PME# supported from D0 D3hot D3cold
[    2.009479] pci 0000:20:07.1: PCI bridge to [bus 21]
[    2.009492] pci 0000:20:07.1:   bridge window [mem 0xeba00000-0xebcfffff=
]
[    2.009834] pci 0000:22:00.0: [1022:1455] type 00 class 0x130000
[    2.009874] pci 0000:22:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.009888] pci 0000:22:00.0: enabling Extended Tags
[    2.010073] pci 0000:22:00.1: [1022:1468] type 00 class 0x108000
[    2.010095] pci 0000:22:00.1: reg 0x18: [mem 0xebd00000-0xebdfffff]
[    2.010107] pci 0000:22:00.1: reg 0x24: [mem 0xebe00000-0xebe01fff]
[    2.010117] pci 0000:22:00.1: Max Payload Size set to 256 (was 128, max =
256)
[    2.010130] pci 0000:22:00.1: enabling Extended Tags
[    2.010332] pci 0000:22:00.2: [1022:7901] type 00 class 0x010601
[    2.010374] pci 0000:22:00.2: reg 0x24: [mem 0xebe02000-0xebe02fff]
[    2.010384] pci 0000:22:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    2.010398] pci 0000:22:00.2: enabling Extended Tags
[    2.010457] pci 0000:22:00.2: PME# supported from D3hot D3cold
[    2.010639] pci 0000:20:08.1: PCI bridge to [bus 22]
[    2.010653] pci 0000:20:08.1:   bridge window [mem 0xebd00000-0xebefffff=
]
[    2.010668] pci_bus 0000:20: on NUMA node 1
[    2.011737] ACPI: PCI Root Bridge [S0D2] (domain 0000 [bus 40-5f])
[    2.011753] acpi PNP0A08:02: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    2.012309] acpi PNP0A08:02: _OSC: platform does not support [SHPCHotplu=
g LTR]
[    2.012853] acpi PNP0A08:02: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    2.013735] PCI host bridge to bus 0000:40
[    2.013746] pci_bus 0000:40: root bus resource [mem 0xeb400000-0xeb7ffff=
f window]
[    2.013760] pci_bus 0000:40: root bus resource [mem 0x82c8000000-0xfcfff=
fffff window]
[    2.013774] pci_bus 0000:40: root bus resource [bus 40-5f]
[    2.013789] pci 0000:40:00.0: [1022:1450] type 00 class 0x060000
[    2.013974] pci 0000:40:00.2: [1022:1451] type 00 class 0x080600
[    2.014188] pci 0000:40:01.0: [1022:1452] type 00 class 0x060000
[    2.014381] pci 0000:40:02.0: [1022:1452] type 00 class 0x060000
[    2.014574] pci 0000:40:03.0: [1022:1452] type 00 class 0x060000
[    2.014775] pci 0000:40:04.0: [1022:1452] type 00 class 0x060000
[    2.014973] pci 0000:40:07.0: [1022:1452] type 00 class 0x060000
[    2.015151] pci 0000:40:07.1: [1022:1454] type 01 class 0x060400
[    2.015194] pci 0000:40:07.1: enabling Extended Tags
[    2.015322] pci 0000:40:07.1: PME# supported from D0 D3hot D3cold
[    2.015560] pci 0000:40:08.0: [1022:1452] type 00 class 0x060000
[    2.015750] pci 0000:40:08.1: [1022:1454] type 01 class 0x060400
[    2.016086] pci 0000:40:08.1: enabling Extended Tags
[    2.016192] pci 0000:40:08.1: PME# supported from D0 D3hot D3cold
[    2.016629] pci 0000:41:00.0: [1022:145a] type 00 class 0x130000
[    2.016667] pci 0000:41:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.016681] pci 0000:41:00.0: enabling Extended Tags
[    2.016853] pci 0000:41:00.2: [1022:1456] type 00 class 0x108000
[    2.016874] pci 0000:41:00.2: reg 0x18: [mem 0xeb600000-0xeb6fffff]
[    2.016886] pci 0000:41:00.2: reg 0x24: [mem 0xeb700000-0xeb701fff]
[    2.016895] pci 0000:41:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    2.016908] pci 0000:41:00.2: enabling Extended Tags
[    2.017108] pci 0000:40:07.1: PCI bridge to [bus 41]
[    2.017121] pci 0000:40:07.1:   bridge window [mem 0xeb600000-0xeb7fffff=
]
[    2.017426] pci 0000:42:00.0: [1022:1455] type 00 class 0x130000
[    2.017466] pci 0000:42:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.017480] pci 0000:42:00.0: enabling Extended Tags
[    2.017661] pci 0000:42:00.1: [1022:1468] type 00 class 0x108000
[    2.017683] pci 0000:42:00.1: reg 0x18: [mem 0xeb400000-0xeb4fffff]
[    2.017705] pci 0000:42:00.1: reg 0x24: [mem 0xeb500000-0xeb501fff]
[    2.017714] pci 0000:42:00.1: Max Payload Size set to 256 (was 128, max =
256)
[    2.017728] pci 0000:42:00.1: enabling Extended Tags
[    2.017951] pci 0000:40:08.1: PCI bridge to [bus 42]
[    2.017965] pci 0000:40:08.1:   bridge window [mem 0xeb400000-0xeb5fffff=
]
[    2.017980] pci_bus 0000:40: on NUMA node 2
[    2.019048] ACPI: PCI Root Bridge [S0D3] (domain 0000 [bus 60-7f])
[    2.019064] acpi PNP0A08:03: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI]
[    2.019619] acpi PNP0A08:03: _OSC: platform does not support [SHPCHotplu=
g LTR]
[    2.020166] acpi PNP0A08:03: _OSC: OS now controls [PCIeHotplug PME AER =
PCIeCapability]
[    2.021046] PCI host bridge to bus 0000:60
[    2.021056] pci_bus 0000:60: root bus resource [io  0x2000-0x4fff window=
]
[    2.021068] pci_bus 0000:60: root bus resource [mem 0xea900000-0xeb1ffff=
f window]
[    2.021082] pci_bus 0000:60: root bus resource [mem 0x890000000-0x82c7ff=
ffff window]
[    2.021096] pci_bus 0000:60: root bus resource [bus 60-7f]
[    2.021111] pci 0000:60:00.0: [1022:1450] type 00 class 0x060000
[    2.021299] pci 0000:60:00.2: [1022:1451] type 00 class 0x080600
[    2.021513] pci 0000:60:01.0: [1022:1452] type 00 class 0x060000
[    2.021701] pci 0000:60:01.1: [1022:1453] type 01 class 0x060400
[    2.022206] pci 0000:60:01.1: PME# supported from D0 D3hot D3cold
[    2.022445] pci 0000:60:02.0: [1022:1452] type 00 class 0x060000
[    2.022639] pci 0000:60:03.0: [1022:1452] type 00 class 0x060000
[    2.022829] pci 0000:60:03.2: [1022:1453] type 01 class 0x060400
[    2.023209] pci 0000:60:03.2: PME# supported from D0 D3hot D3cold
[    2.023435] pci 0000:60:03.3: [1022:1453] type 01 class 0x060400
[    2.023573] pci 0000:60:03.3: PME# supported from D0 D3hot D3cold
[    2.023877] pci 0000:60:03.4: [1022:1453] type 01 class 0x060400
[    2.024014] pci 0000:60:03.4: PME# supported from D0 D3hot D3cold
[    2.024242] pci 0000:60:04.0: [1022:1452] type 00 class 0x060000
[    2.024869] pci 0000:60:07.0: [1022:1452] type 00 class 0x060000
[    2.025048] pci 0000:60:07.1: [1022:1454] type 01 class 0x060400
[    2.025111] pci 0000:60:07.1: enabling Extended Tags
[    2.025216] pci 0000:60:07.1: PME# supported from D0 D3hot D3cold
[    2.025450] pci 0000:60:08.0: [1022:1452] type 00 class 0x060000
[    2.025631] pci 0000:60:08.1: [1022:1454] type 01 class 0x060400
[    2.025699] pci 0000:60:08.1: enabling Extended Tags
[    2.025811] pci 0000:60:08.1: PME# supported from D0 D3hot D3cold
[    2.027196] pci 0000:61:00.0: [1022:1470] type 01 class 0x060400
[    2.027220] pci 0000:61:00.0: reg 0x10: [mem 0xeae00000-0xeae03fff]
[    2.027316] pci 0000:61:00.0: PME# supported from D0 D3hot D3cold
[    2.027483] pci 0000:60:01.1: PCI bridge to [bus 61-63]
[    2.027496] pci 0000:60:01.1:   bridge window [io  0x4000-0x4fff]
[    2.027499] pci 0000:60:01.1:   bridge window [mem 0xead00000-0xeaefffff=
]
[    2.027504] pci 0000:60:01.1:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.027572] pci 0000:62:00.0: [1022:1471] type 01 class 0x060400
[    2.027684] pci 0000:62:00.0: PME# supported from D0 D3hot D3cold
[    2.027839] pci 0000:61:00.0: PCI bridge to [bus 62-63]
[    2.027853] pci 0000:61:00.0:   bridge window [io  0x4000-0x4fff]
[    2.027857] pci 0000:61:00.0:   bridge window [mem 0xead00000-0xeadfffff=
]
[    2.027863] pci 0000:61:00.0:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.027934] pci 0000:63:00.0: [1002:6861] type 00 class 0x030000
[    2.027966] pci 0000:63:00.0: reg 0x10: [mem 0x82b0000000-0x82bfffffff 6=
4bit pref]
[    2.027980] pci 0000:63:00.0: reg 0x18: [mem 0x82c0000000-0x82c01fffff 6=
4bit pref]
[    2.027989] pci 0000:63:00.0: reg 0x20: [io  0x4000-0x40ff]
[    2.027998] pci 0000:63:00.0: reg 0x24: [mem 0xead00000-0xead7ffff]
[    2.028006] pci 0000:63:00.0: reg 0x30: [mem 0xead80000-0xead9ffff pref]
[    2.028032] pci 0000:63:00.0: BAR 0: assigned to efifb
[    2.028108] pci 0000:63:00.0: PME# supported from D1 D2 D3hot D3cold
[    2.028247] pci 0000:63:00.1: [1002:aaf8] type 00 class 0x040300
[    2.028267] pci 0000:63:00.1: reg 0x10: [mem 0xeada0000-0xeada3fff]
[    2.028365] pci 0000:63:00.1: PME# supported from D1 D2 D3hot D3cold
[    2.028516] pci 0000:62:00.0: PCI bridge to [bus 63]
[    2.028530] pci 0000:62:00.0:   bridge window [io  0x4000-0x4fff]
[    2.028533] pci 0000:62:00.0:   bridge window [mem 0xead00000-0xeadfffff=
]
[    2.028539] pci 0000:62:00.0:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.028782] pci 0000:64:00.0: [8086:1533] type 00 class 0x020000
[    2.028817] pci 0000:64:00.0: reg 0x10: [mem 0xeb100000-0xeb17ffff]
[    2.028842] pci 0000:64:00.0: reg 0x18: [io  0x3000-0x301f]
[    2.028856] pci 0000:64:00.0: reg 0x1c: [mem 0xeb180000-0xeb183fff]
[    2.028994] pci 0000:64:00.0: PME# supported from D0 D3hot D3cold
[    2.029165] pci 0000:60:03.2: PCI bridge to [bus 64]
[    2.029177] pci 0000:60:03.2:   bridge window [io  0x3000-0x3fff]
[    2.029181] pci 0000:60:03.2:   bridge window [mem 0xeb100000-0xeb1fffff=
]
[    2.029796] pci 0000:65:00.0: [144d:a808] type 00 class 0x010802
[    2.029824] pci 0000:65:00.0: reg 0x10: [mem 0xeb000000-0xeb003fff 64bit=
]
[    2.030085] pci 0000:60:03.3: PCI bridge to [bus 65]
[    2.030099] pci 0000:60:03.3:   bridge window [mem 0xeb000000-0xeb0fffff=
]
[    2.030205] pci 0000:66:00.0: [8086:1533] type 00 class 0x020000
[    2.030239] pci 0000:66:00.0: reg 0x10: [mem 0xeaf00000-0xeaf7ffff]
[    2.030264] pci 0000:66:00.0: reg 0x18: [io  0x2000-0x201f]
[    2.030278] pci 0000:66:00.0: reg 0x1c: [mem 0xeaf80000-0xeaf83fff]
[    2.030825] pci 0000:66:00.0: PME# supported from D0 D3hot D3cold
[    2.030989] pci 0000:60:03.4: PCI bridge to [bus 66]
[    2.031001] pci 0000:60:03.4:   bridge window [io  0x2000-0x2fff]
[    2.031004] pci 0000:60:03.4:   bridge window [mem 0xeaf00000-0xeaffffff=
]
[    2.031226] pci 0000:67:00.0: [1022:145a] type 00 class 0x130000
[    2.031266] pci 0000:67:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.031279] pci 0000:67:00.0: enabling Extended Tags
[    2.031442] pci 0000:67:00.2: [1022:1456] type 00 class 0x108000
[    2.031462] pci 0000:67:00.2: reg 0x18: [mem 0xeab00000-0xeabfffff]
[    2.031474] pci 0000:67:00.2: reg 0x24: [mem 0xeac00000-0xeac01fff]
[    2.031483] pci 0000:67:00.2: Max Payload Size set to 256 (was 128, max =
256)
[    2.031497] pci 0000:67:00.2: enabling Extended Tags
[    2.031704] pci 0000:60:07.1: PCI bridge to [bus 67]
[    2.031718] pci 0000:60:07.1:   bridge window [mem 0xeab00000-0xeacfffff=
]
[    2.032302] pci 0000:68:00.0: [1022:1455] type 00 class 0x130000
[    2.032343] pci 0000:68:00.0: Max Payload Size set to 256 (was 128, max =
256)
[    2.032356] pci 0000:68:00.0: enabling Extended Tags
[    2.032542] pci 0000:68:00.1: [1022:1468] type 00 class 0x108000
[    2.032563] pci 0000:68:00.1: reg 0x18: [mem 0xea900000-0xea9fffff]
[    2.032576] pci 0000:68:00.1: reg 0x24: [mem 0xeaa00000-0xeaa01fff]
[    2.032585] pci 0000:68:00.1: Max Payload Size set to 256 (was 128, max =
256)
[    2.032599] pci 0000:68:00.1: enabling Extended Tags
[    2.032835] pci 0000:60:08.1: PCI bridge to [bus 68]
[    2.032849] pci 0000:60:08.1:   bridge window [mem 0xea900000-0xeaafffff=
]
[    2.032884] pci_bus 0000:60: on NUMA node 3
[    2.033820] ACPI: PCI Interrupt Link [LNKA] (IRQs 4 5 7 10 11 14 15) *0
[    2.034002] ACPI: PCI Interrupt Link [LNKB] (IRQs 4 5 7 10 11 14 15) *0
[    2.034158] ACPI: PCI Interrupt Link [LNKC] (IRQs 4 5 7 10 11 14 15) *0
[    2.034336] ACPI: PCI Interrupt Link [LNKD] (IRQs 4 5 7 10 11 14 15) *0
[    2.034504] ACPI: PCI Interrupt Link [LNKE] (IRQs 4 5 7 10 11 14 15) *0
[    2.034645] ACPI: PCI Interrupt Link [LNKF] (IRQs 4 5 7 10 11 14 15) *0
[    2.034797] ACPI: PCI Interrupt Link [LNKG] (IRQs 4 5 7 10 11 14 15) *0
[    2.034938] ACPI: PCI Interrupt Link [LNKH] (IRQs 4 5 7 10 11 14 15) *0
[    2.036828] pci 0000:02:00.0: vgaarb: setting as boot VGA device
[    2.036828] pci 0000:02:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    2.036828] pci 0000:63:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    2.036828] pci 0000:02:00.0: vgaarb: bridge control possible
[    2.036838] pci 0000:63:00.0: vgaarb: bridge control possible
[    2.036848] pci 0000:63:00.0: vgaarb: overriding boot device
[    2.036858] vgaarb: loaded
[    2.037223] SCSI subsystem initialized
[    2.037487] libata version 3.00 loaded.
[    2.037740] ACPI: bus type USB registered
[    2.037782] usbcore: registered new interface driver usbfs
[    2.037815] usbcore: registered new interface driver hub
[    2.038134] usbcore: registered new device driver usb
[    2.038242] pps_core: LinuxPPS API ver. 1 registered
[    2.038252] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    2.038271] PTP clock support registered
[    2.038547] EDAC MC: Ver: 3.0.0
[    2.039127] Registered efivars operations
[    2.057135] PCI: Using ACPI for IRQ routing
[    2.065761] PCI: pci_cache_line_size set to 64 bytes
[    2.065935] e820: reserve RAM buffer [mem 0x3a000000-0x3bffffff]
[    2.065947] e820: reserve RAM buffer [mem 0x75db0000-0x77ffffff]
[    2.065949] e820: reserve RAM buffer [mem 0xd2afb018-0xd3ffffff]
[    2.065951] e820: reserve RAM buffer [mem 0xd2b15018-0xd3ffffff]
[    2.065953] e820: reserve RAM buffer [mem 0xd9037000-0xdbffffff]
[    2.065955] e820: reserve RAM buffer [mem 0xda4b8000-0xdbffffff]
[    2.065957] e820: reserve RAM buffer [mem 0x21f380000-0x21fffffff]
[    2.065959] e820: reserve RAM buffer [mem 0x41ff80000-0x41fffffff]
[    2.065961] e820: reserve RAM buffer [mem 0x61ff80000-0x61fffffff]
[    2.065963] e820: reserve RAM buffer [mem 0x81ff80000-0x81fffffff]
[    2.066695] NetLabel: Initializing
[    2.066695] NetLabel:  domain hash size =3D 128
[    2.066695] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    2.066695] NetLabel:  unlabeled traffic allowed by default
[    2.066967] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    2.066967] hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    2.068952] clocksource: Switched to clocksource tsc-early
[    2.122931] VFS: Disk quotas dquot_6.6.0
[    2.123048] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    2.123382] pnp: PnP ACPI init
[    2.123769] system 00:00: [mem 0xf0000000-0xf7ffffff] has been reserved
[    2.123811] system 00:00: Plug and Play ACPI device, IDs PNP0c01 (active=
)
[    2.124455] pnp 00:01: Plug and Play ACPI device, IDs PNP0b00 (active)
[    2.125105] system 00:02: [io  0x0a00-0x0a0f] has been reserved
[    2.125118] system 00:02: [io  0x0a10-0x0a1f] has been reserved
[    2.125130] system 00:02: [io  0x0a20-0x0a2f] has been reserved
[    2.125142] system 00:02: [io  0x0a30-0x0a3f] has been reserved
[    2.125153] system 00:02: [io  0x0a40-0x0a4f] has been reserved
[    2.125170] system 00:02: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    2.125747] pnp 00:03: [dma 0 disabled]
[    2.125819] pnp 00:03: Plug and Play ACPI device, IDs PNP0501 (active)
[    2.126378] pnp 00:04: [dma 0 disabled]
[    2.126446] pnp 00:04: Plug and Play ACPI device, IDs PNP0501 (active)
[    2.127159] system 00:05: [io  0x04d0-0x04d1] has been reserved
[    2.127173] system 00:05: [io  0x040b] has been reserved
[    2.127183] system 00:05: [io  0x04d6] has been reserved
[    2.127194] system 00:05: [io  0x0c00-0x0c01] has been reserved
[    2.127205] system 00:05: [io  0x0c14] has been reserved
[    2.127216] system 00:05: [io  0x0c50-0x0c51] has been reserved
[    2.127234] system 00:05: [io  0x0c52] has been reserved
[    2.127245] system 00:05: [io  0x0c6c] has been reserved
[    2.127255] system 00:05: [io  0x0c6f] has been reserved
[    2.127266] system 00:05: [io  0x0cd0-0x0cd1] has been reserved
[    2.127277] system 00:05: [io  0x0cd2-0x0cd3] has been reserved
[    2.127289] system 00:05: [io  0x0cd4-0x0cd5] has been reserved
[    2.127300] system 00:05: [io  0x0cd6-0x0cd7] has been reserved
[    2.127311] system 00:05: [io  0x0cd8-0x0cdf] has been reserved
[    2.127322] system 00:05: [io  0x0800-0x089f] has been reserved
[    2.127334] system 00:05: [io  0x0b00-0x0b0f] has been reserved
[    2.127345] system 00:05: [io  0x0b20-0x0b3f] has been reserved
[    2.127356] system 00:05: [io  0x0900-0x090f] has been reserved
[    2.127367] system 00:05: [io  0x0910-0x091f] has been reserved
[    2.127379] system 00:05: [io  0xfe00-0xfefe] has been reserved
[    2.127393] system 00:05: [mem 0xfec00000-0xfec00fff] could not be reser=
ved
[    2.127406] system 00:05: [mem 0xfec01000-0xfec01fff] has been reserved
[    2.127418] system 00:05: [mem 0xfedc0000-0xfedc0fff] has been reserved
[    2.127431] system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    2.127444] system 00:05: [mem 0xfed80000-0xfed8ffff] could not be reser=
ved
[    2.127456] system 00:05: [mem 0xfed61000-0xfed70fff] has been reserved
[    2.127469] system 00:05: [mem 0xfec10000-0xfec10fff] has been reserved
[    2.127481] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
[    2.127499] system 00:05: Plug and Play ACPI device, IDs PNP0c02 (active=
)
[    2.130418] pnp: PnP ACPI: found 6 devices
[    2.138850] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    2.138988] pci 0000:01:00.0: PCI bridge to [bus 02]
[    2.139000] pci 0000:01:00.0:   bridge window [io  0x1000-0x1fff]
[    2.139015] pci 0000:01:00.0:   bridge window [mem 0xec000000-0xee0fffff=
]
[    2.139036] pci 0000:00:01.6: PCI bridge to [bus 01-02]
[    2.139047] pci 0000:00:01.6:   bridge window [io  0x1000-0x1fff]
[    2.139060] pci 0000:00:01.6:   bridge window [mem 0xec000000-0xee0fffff=
]
[    2.139077] pci 0000:00:07.1: PCI bridge to [bus 03]
[    2.139088] pci 0000:00:07.1:   bridge window [mem 0xee200000-0xee4fffff=
]
[    2.139104] pci 0000:00:08.1: PCI bridge to [bus 04]
[    2.139115] pci 0000:00:08.1:   bridge window [mem 0xee500000-0xee6fffff=
]
[    2.139132] pci_bus 0000:00: resource 4 [io  0x0000-0x02ff window]
[    2.139134] pci_bus 0000:00: resource 5 [io  0x0300-0x03af window]
[    2.139136] pci_bus 0000:00: resource 6 [io  0x03e0-0x0cf7 window]
[    2.139138] pci_bus 0000:00: resource 7 [io  0x03b0-0x03df window]
[    2.139140] pci_bus 0000:00: resource 8 [io  0x0d00-0x1fff window]
[    2.139141] pci_bus 0000:00: resource 9 [mem 0x000a0000-0x000bffff windo=
w]
[    2.139143] pci_bus 0000:00: resource 10 [mem 0x000c0000-0x000dffff wind=
ow]
[    2.139145] pci_bus 0000:00: resource 11 [mem 0xec000000-0xefffffff wind=
ow]
[    2.139147] pci_bus 0000:00: resource 12 [mem 0x185c8000000-0x1fffffffff=
f window]
[    2.139149] pci_bus 0000:01: resource 0 [io  0x1000-0x1fff]
[    2.139150] pci_bus 0000:01: resource 1 [mem 0xec000000-0xee0fffff]
[    2.139152] pci_bus 0000:02: resource 0 [io  0x1000-0x1fff]
[    2.139154] pci_bus 0000:02: resource 1 [mem 0xec000000-0xee0fffff]
[    2.139156] pci_bus 0000:03: resource 1 [mem 0xee200000-0xee4fffff]
[    2.139158] pci_bus 0000:04: resource 1 [mem 0xee500000-0xee6fffff]
[    2.139286] pci 0000:20:07.1: PCI bridge to [bus 21]
[    2.139298] pci 0000:20:07.1:   bridge window [mem 0xeba00000-0xebcfffff=
]
[    2.139314] pci 0000:20:08.1: PCI bridge to [bus 22]
[    2.139325] pci 0000:20:08.1:   bridge window [mem 0xebd00000-0xebefffff=
]
[    2.139341] pci_bus 0000:20: resource 4 [mem 0xeba00000-0xebefffff windo=
w]
[    2.139343] pci_bus 0000:20: resource 5 [mem 0x10b90000000-0x185c7ffffff=
 window]
[    2.139345] pci_bus 0000:21: resource 1 [mem 0xeba00000-0xebcfffff]
[    2.139347] pci_bus 0000:22: resource 1 [mem 0xebd00000-0xebefffff]
[    2.139433] pci 0000:40:07.1: PCI bridge to [bus 41]
[    2.139445] pci 0000:40:07.1:   bridge window [mem 0xeb600000-0xeb7fffff=
]
[    2.139461] pci 0000:40:08.1: PCI bridge to [bus 42]
[    2.139472] pci 0000:40:08.1:   bridge window [mem 0xeb400000-0xeb5fffff=
]
[    2.139487] pci_bus 0000:40: resource 4 [mem 0xeb400000-0xeb7fffff windo=
w]
[    2.139489] pci_bus 0000:40: resource 5 [mem 0x82c8000000-0xfcffffffff w=
indow]
[    2.139491] pci_bus 0000:41: resource 1 [mem 0xeb600000-0xeb7fffff]
[    2.139493] pci_bus 0000:42: resource 1 [mem 0xeb400000-0xeb5fffff]
[    2.139613] pci 0000:62:00.0: PCI bridge to [bus 63]
[    2.139623] pci 0000:62:00.0:   bridge window [io  0x4000-0x4fff]
[    2.139637] pci 0000:62:00.0:   bridge window [mem 0xead00000-0xeadfffff=
]
[    2.139651] pci 0000:62:00.0:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.139668] pci 0000:61:00.0: PCI bridge to [bus 62-63]
[    2.139679] pci 0000:61:00.0:   bridge window [io  0x4000-0x4fff]
[    2.139693] pci 0000:61:00.0:   bridge window [mem 0xead00000-0xeadfffff=
]
[    2.139706] pci 0000:61:00.0:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.139724] pci 0000:60:01.1: PCI bridge to [bus 61-63]
[    2.139734] pci 0000:60:01.1:   bridge window [io  0x4000-0x4fff]
[    2.139747] pci 0000:60:01.1:   bridge window [mem 0xead00000-0xeaefffff=
]
[    2.139760] pci 0000:60:01.1:   bridge window [mem 0x82b0000000-0x82c01f=
ffff 64bit pref]
[    2.139776] pci 0000:60:03.2: PCI bridge to [bus 64]
[    2.139786] pci 0000:60:03.2:   bridge window [io  0x3000-0x3fff]
[    2.139799] pci 0000:60:03.2:   bridge window [mem 0xeb100000-0xeb1fffff=
]
[    2.139815] pci 0000:60:03.3: PCI bridge to [bus 65]
[    2.139826] pci 0000:60:03.3:   bridge window [mem 0xeb000000-0xeb0fffff=
]
[    2.139841] pci 0000:60:03.4: PCI bridge to [bus 66]
[    2.139851] pci 0000:60:03.4:   bridge window [io  0x2000-0x2fff]
[    2.139863] pci 0000:60:03.4:   bridge window [mem 0xeaf00000-0xeaffffff=
]
[    2.139879] pci 0000:60:07.1: PCI bridge to [bus 67]
[    2.139890] pci 0000:60:07.1:   bridge window [mem 0xeab00000-0xeacfffff=
]
[    2.139906] pci 0000:60:08.1: PCI bridge to [bus 68]
[    2.139917] pci 0000:60:08.1:   bridge window [mem 0xea900000-0xeaafffff=
]
[    2.139933] pci_bus 0000:60: resource 4 [io  0x2000-0x4fff window]
[    2.139934] pci_bus 0000:60: resource 5 [mem 0xea900000-0xeb1fffff windo=
w]
[    2.139936] pci_bus 0000:60: resource 6 [mem 0x890000000-0x82c7ffffff wi=
ndow]
[    2.139938] pci_bus 0000:61: resource 0 [io  0x4000-0x4fff]
[    2.139939] pci_bus 0000:61: resource 1 [mem 0xead00000-0xeaefffff]
[    2.139941] pci_bus 0000:61: resource 2 [mem 0x82b0000000-0x82c01fffff 6=
4bit pref]
[    2.139943] pci_bus 0000:62: resource 0 [io  0x4000-0x4fff]
[    2.139945] pci_bus 0000:62: resource 1 [mem 0xead00000-0xeadfffff]
[    2.139946] pci_bus 0000:62: resource 2 [mem 0x82b0000000-0x82c01fffff 6=
4bit pref]
[    2.139948] pci_bus 0000:63: resource 0 [io  0x4000-0x4fff]
[    2.139950] pci_bus 0000:63: resource 1 [mem 0xead00000-0xeadfffff]
[    2.139951] pci_bus 0000:63: resource 2 [mem 0x82b0000000-0x82c01fffff 6=
4bit pref]
[    2.139953] pci_bus 0000:64: resource 0 [io  0x3000-0x3fff]
[    2.139955] pci_bus 0000:64: resource 1 [mem 0xeb100000-0xeb1fffff]
[    2.139956] pci_bus 0000:65: resource 1 [mem 0xeb000000-0xeb0fffff]
[    2.139958] pci_bus 0000:66: resource 0 [io  0x2000-0x2fff]
[    2.139960] pci_bus 0000:66: resource 1 [mem 0xeaf00000-0xeaffffff]
[    2.139961] pci_bus 0000:67: resource 1 [mem 0xeab00000-0xeacfffff]
[    2.139963] pci_bus 0000:68: resource 1 [mem 0xea900000-0xeaafffff]
[    2.140207] NET: Registered protocol family 2
[    2.141296] tcp_listen_portaddr_hash hash table entries: 16384 (order: 8=
, 1441792 bytes)
[    2.141849] TCP established hash table entries: 262144 (order: 9, 209715=
2 bytes)
[    2.142732] TCP bind hash table entries: 65536 (order: 10, 5242880 bytes=
)
[    2.143804] TCP: Hash tables configured (established 262144 bind 65536)
[    2.144870] UDP hash table entries: 16384 (order: 9, 3145728 bytes)
[    2.145800] UDP-Lite hash table entries: 16384 (order: 9, 3145728 bytes)
[    2.147183] NET: Registered protocol family 1
[    2.147202] NET: Registered protocol family 44
[    2.148385] pci 0000:63:00.1: Linked as a consumer to 0000:63:00.0
[    2.148470] PCI: CLS 64 bytes, default 64
[    2.148811] Unpacking initramfs...
[    2.636573] Freeing initrd memory: 29076K
[    2.636594] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    2.636606] software IO TLB: mapped [mem 0xceaf9000-0xd2af9000] (64MB)
[    2.636804] amd_uncore: AMD NB counters detected
[    2.636904] amd_uncore: AMD LLC counters detected
[    2.642189] check: Scanning for low memory corruption every 60 seconds
[    2.642585] cryptomgr_test (122) used greatest stack depth: 14824 bytes =
left
[    2.644642] modprobe (124) used greatest stack depth: 13824 bytes left
[    2.649306] Initialise system trusted keyrings
[    2.649411] Key type blacklist registered
[    2.649691] workingset: timestamp_bits=3D36 max_order=3D23 bucket_order=
=3D0
[    2.654683] zbud: loaded
[    2.658162] Platform Keyring initialized
[    2.805408] cryptomgr_test (159) used greatest stack depth: 13760 bytes =
left
[    2.839241] alg: No test for 842 (842-generic)
[    2.840732] alg: No test for 842 (842-scomp)
[    2.847598] cryptomgr_test (175) used greatest stack depth: 13440 bytes =
left
[    2.888651] NET: Registered protocol family 38
[    2.888686] Key type asymmetric registered
[    2.888715] Asymmetric key parser 'x509' registered
[    2.888756] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 242)
[    2.889093] io scheduler mq-deadline registered
[    2.889104] io scheduler kyber registered
[    2.889279] io scheduler bfq registered
[    2.890462] atomic64_test: passed for x86-64 platform with CX8 and with =
SSE
[    2.892502] pcieport 0000:00:01.6: Signaling PME with IRQ 26
[    2.892793] aer 0000:00:01.6:pcie002: AER enabled with IRQ 26
[    2.892916] dpc 0000:00:01.6:pcie008: DPC error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 6, DL_ActiveErr+
[    2.893759] pcieport 0000:00:07.1: Signaling PME with IRQ 27
[    2.893947] aer 0000:00:07.1:pcie002: AER enabled with IRQ 27
[    2.895639] pcieport 0000:00:08.1: Signaling PME with IRQ 29
[    2.895807] aer 0000:00:08.1:pcie002: AER enabled with IRQ 29
[    2.897032] pcieport 0000:20:07.1: Signaling PME with IRQ 30
[    2.897213] aer 0000:20:07.1:pcie002: AER enabled with IRQ 30
[    2.897995] pcieport 0000:20:08.1: Signaling PME with IRQ 32
[    2.898156] aer 0000:20:08.1:pcie002: AER enabled with IRQ 32
[    2.899313] pcieport 0000:40:07.1: Signaling PME with IRQ 34
[    2.899524] aer 0000:40:07.1:pcie002: AER enabled with IRQ 34
[    2.900271] pcieport 0000:40:08.1: Signaling PME with IRQ 36
[    2.900454] aer 0000:40:08.1:pcie002: AER enabled with IRQ 36
[    2.901392] pcieport 0000:60:01.1: Signaling PME with IRQ 37
[    2.901595] aer 0000:60:01.1:pcie002: AER enabled with IRQ 37
[    2.901760] dpc 0000:60:01.1:pcie008: DPC error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 6, DL_ActiveErr+
[    2.902425] pcieport 0000:60:03.2: Signaling PME with IRQ 38
[    2.902578] aer 0000:60:03.2:pcie002: AER enabled with IRQ 38
[    2.902713] dpc 0000:60:03.2:pcie008: DPC error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 6, DL_ActiveErr+
[    2.903403] pcieport 0000:60:03.3: Signaling PME with IRQ 39
[    2.903566] aer 0000:60:03.3:pcie002: AER enabled with IRQ 39
[    2.903691] dpc 0000:60:03.3:pcie008: DPC error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 6, DL_ActiveErr+
[    2.904379] pcieport 0000:60:03.4: Signaling PME with IRQ 40
[    2.904527] aer 0000:60:03.4:pcie002: AER enabled with IRQ 40
[    2.904705] dpc 0000:60:03.4:pcie008: DPC error containment capabilities=
: Int Msg #0, RPExt+ PoisonedTLP+ SwTrigger+ RP PIO Log 6, DL_ActiveErr+
[    2.905582] pcieport 0000:60:07.1: Signaling PME with IRQ 42
[    2.905773] aer 0000:60:07.1:pcie002: AER enabled with IRQ 42
[    2.906517] pcieport 0000:60:08.1: Signaling PME with IRQ 44
[    2.906710] aer 0000:60:08.1:pcie002: AER enabled with IRQ 44
[    2.907845] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    2.907935] efifb: probing for efifb
[    2.908015] efifb: framebuffer at 0x82b0000000, using 1952k, total 1950k
[    2.908027] efifb: mode is 800x600x32, linelength=3D3328, pages=3D1
[    2.908037] efifb: scrolling: redraw
[    2.908045] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
[    2.908502] Console: switching to colour frame buffer device 100x37
[    2.909595] fb0: EFI VGA frame buffer device
[    2.910138] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input0
[    2.910212] ACPI: Power Button [PWRB]
[    2.910321] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/inpu=
t/input1
[    2.910805] ACPI: Power Button [PWRF]
[    2.911141] Monitor-Mwait will be used to enter C-1 state
[    2.916232] ERST: Error Record Serialization Table (ERST) support is ini=
tialized.
[    2.916289] pstore: Registered erst as persistent store backend
[    2.916517] GHES: APEI firmware first mode is enabled by APEI bit.
[    2.916883] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    2.937948] 00:03: ttyS0 at I/O 0x3f8 (irq =3D 4, base_baud =3D 115200) =
is a 16550A
[    2.959416] 00:04: ttyS1 at I/O 0x2f8 (irq =3D 3, base_baud =3D 115200) =
is a 16550A
[    2.964471] Non-volatile memory driver v1.3
[    2.965189] Linux agpgart interface v0.103
[    2.973884] ahci 0000:04:00.2: version 3.0
[    2.974277] ahci 0000:04:00.2: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
ff impl SATA mode
[    2.974967] ahci 0000:04:00.2: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part ems sxs=20
[    2.978546] scsi host0: ahci
[    2.979878] scsi host1: ahci
[    2.980769] scsi host2: ahci
[    2.981657] scsi host3: ahci
[    2.982644] scsi host4: ahci
[    2.983594] scsi host5: ahci
[    2.984446] scsi host6: ahci
[    2.985263] scsi host7: ahci
[    2.985974] ata1: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60210=
0 irq 49
[    2.986526] ata2: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60218=
0 irq 49
[    2.987074] ata3: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60220=
0 irq 49
[    2.987597] ata4: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60228=
0 irq 49
[    2.988117] ata5: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60230=
0 irq 49
[    2.988616] ata6: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60238=
0 irq 49
[    2.989113] ata7: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60240=
0 irq 49
[    2.989596] ata8: SATA max UDMA/133 abar m4096@0xee602000 port 0xee60248=
0 irq 49
[    2.990639] ahci 0000:22:00.2: AHCI 0001.0301 32 slots 8 ports 6 Gbps 0x=
ff impl SATA mode
[    2.991131] ahci 0000:22:00.2: flags: 64bit ncq sntf ilck pm led clo onl=
y pmp fbs pio slum part ems sxs=20
[    2.994137] scsi host8: ahci
[    2.994974] scsi host9: ahci
[    2.995764] scsi host10: ahci
[    2.996602] scsi host11: ahci
[    2.997267] scsi host12: ahci
[    2.997927] scsi host13: ahci
[    2.998535] scsi host14: ahci
[    2.999148] scsi host15: ahci
[    2.999613] ata9: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe0210=
0 irq 51
[    2.999978] ata10: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe021=
80 irq 51
[    3.000332] ata11: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe022=
00 irq 51
[    3.000670] ata12: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe022=
80 irq 51
[    3.001012] ata13: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe023=
00 irq 51
[    3.001332] ata14: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe023=
80 irq 51
[    3.001645] ata15: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe024=
00 irq 51
[    3.001944] ata16: SATA max UDMA/133 abar m4096@0xebe02000 port 0xebe024=
80 irq 51
[    3.002731] libphy: Fixed MDIO Bus: probed
[    3.003242] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    3.003532] ehci-pci: EHCI PCI platform driver
[    3.003883] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    3.004187] ohci-pci: OHCI PCI platform driver
[    3.004536] uhci_hcd: USB Universal Host Controller Interface driver
[    3.005311] xhci_hcd 0000:03:00.3: xHCI Host Controller
[    3.006013] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus =
number 1
[    3.006573] xhci_hcd 0000:03:00.3: hcc params 0x0270f665 hci version 0x1=
00 quirks 0x0000000000000410
[    3.008298] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.00
[    3.008732] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    3.009145] usb usb1: Product: xHCI Host Controller
[    3.009562] usb usb1: Manufacturer: Linux 5.0.16-300.local.fc30.x86_64 x=
hci-hcd
[    3.010010] usb usb1: SerialNumber: 0000:03:00.3
[    3.011034] hub 1-0:1.0: USB hub found
[    3.011585] hub 1-0:1.0: 2 ports detected
[    3.012573] xhci_hcd 0000:03:00.3: xHCI Host Controller
[    3.013236] xhci_hcd 0000:03:00.3: new USB bus registered, assigned bus =
number 2
[    3.013714] xhci_hcd 0000:03:00.3: Host supports USB 3.0  SuperSpeed
[    3.014248] usb usb2: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    3.014803] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.00
[    3.015280] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    3.015773] usb usb2: Product: xHCI Host Controller
[    3.016262] usb usb2: Manufacturer: Linux 5.0.16-300.local.fc30.x86_64 x=
hci-hcd
[    3.016786] usb usb2: SerialNumber: 0000:03:00.3
[    3.017746] hub 2-0:1.0: USB hub found
[    3.018355] hub 2-0:1.0: 2 ports detected
[    3.019596] xhci_hcd 0000:21:00.3: xHCI Host Controller
[    3.020295] xhci_hcd 0000:21:00.3: new USB bus registered, assigned bus =
number 3
[    3.020970] xhci_hcd 0000:21:00.3: hcc params 0x0270f665 hci version 0x1=
00 quirks 0x0000000000000410
[    3.022687] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 5.00
[    3.023304] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    3.023926] usb usb3: Product: xHCI Host Controller
[    3.024538] usb usb3: Manufacturer: Linux 5.0.16-300.local.fc30.x86_64 x=
hci-hcd
[    3.025189] usb usb3: SerialNumber: 0000:21:00.3
[    3.026118] hub 3-0:1.0: USB hub found
[    3.026789] hub 3-0:1.0: 2 ports detected
[    3.027739] xhci_hcd 0000:21:00.3: xHCI Host Controller
[    3.028494] xhci_hcd 0000:21:00.3: new USB bus registered, assigned bus =
number 4
[    3.029150] xhci_hcd 0000:21:00.3: Host supports USB 3.0  SuperSpeed
[    3.029804] usb usb4: We don't know the algorithms for LPM for this host=
, disabling LPM.
[    3.030489] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 5.00
[    3.031129] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    3.031759] usb usb4: Product: xHCI Host Controller
[    3.032363] usb usb4: Manufacturer: Linux 5.0.16-300.local.fc30.x86_64 x=
hci-hcd
[    3.032977] usb usb4: SerialNumber: 0000:21:00.3
[    3.033863] hub 4-0:1.0: USB hub found
[    3.034490] hub 4-0:1.0: 2 ports detected
[    3.035425] usbcore: registered new interface driver usbserial_generic
[    3.036071] usbserial: USB Serial support registered for generic
[    3.036735] i8042: PNP: No PS/2 controller found.
[    3.037475] mousedev: PS/2 mouse device common for all mice
[    3.038477] rtc_cmos 00:01: RTC can wake from S4
[    3.039579] rtc_cmos 00:01: registered as rtc0
[    3.040183] rtc_cmos 00:01: alarms up to one month, y3k, 114 bytes nvram=
, hpet irqs
[    3.041035] device-mapper: uevent: version 1.0.3
[    3.041822] device-mapper: ioctl: 4.39.0-ioctl (2018-04-03) initialised:=
 dm-devel@redhat.com
[    3.044003] hidraw: raw HID events driver (C) Jiri Kosina
[    3.044676] usbcore: registered new interface driver usbhid
[    3.045280] usbhid: USB HID core driver
[    3.046373] drop_monitor: Initializing network drop monitor service
[    3.048357] Initializing XFRM netlink socket
[    3.049327] NET: Registered protocol family 10
[    3.057902] Segment Routing with IPv6
[    3.058522] mip6: Mobile IPv6
[    3.059126] NET: Registered protocol family 17
[    3.059807] start plist test
[    3.061324] end plist test
[    3.063938] RAS: Correctable Errors collector initialized.
[    3.064689] microcode: CPU0: patch_level=3D0x08001227
[    3.065286] microcode: CPU1: patch_level=3D0x08001227
[    3.065849] microcode: CPU2: patch_level=3D0x08001227
[    3.066395] microcode: CPU3: patch_level=3D0x08001227
[    3.066927] microcode: CPU4: patch_level=3D0x08001227
[    3.067474] microcode: CPU5: patch_level=3D0x08001227
[    3.068021] microcode: CPU6: patch_level=3D0x08001227
[    3.068546] microcode: CPU7: patch_level=3D0x08001227
[    3.069057] microcode: CPU8: patch_level=3D0x08001227
[    3.069560] microcode: CPU9: patch_level=3D0x08001227
[    3.070142] microcode: CPU10: patch_level=3D0x08001227
[    3.070619] microcode: CPU11: patch_level=3D0x08001227
[    3.071073] microcode: CPU12: patch_level=3D0x08001227
[    3.071518] microcode: CPU13: patch_level=3D0x08001227
[    3.072042] microcode: CPU14: patch_level=3D0x08001227
[    3.072458] microcode: CPU15: patch_level=3D0x08001227
[    3.072928] microcode: Microcode Update Driver: v2.2.
[    3.072954] AVX2 version of gcm_enc/dec engaged.
[    3.073712] AES CTR mode by8 optimization enabled
[    3.124067] sched_clock: Marking stable (3119755739, 4294898)->(32879063=
92, -163855755)
[    3.125377] registered taskstats version 1
[    3.125787] Loading compiled-in X.509 certificates
[    3.155134] Loaded X.509 cert 'Fedora kernel signing key: f675c0dbcff4ef=
9db2fb2701e5165d686b079f00'
[    3.156071] zswap: loaded using pool lzo/zbud
[    3.157142] pstore: Using crash dump compression: deflate
[    3.166339] Key type big_key registered
[    3.171142] Key type encrypted registered
[    3.172877] ima: No TPM chip found, activating TPM-bypass!
[    3.173261] ima: Allocated hash algorithm: sha1
[    3.173643] No architecture policies found
[    3.175381]   Magic number: 7:43:937
[    3.175836] clockevents clockevent26: hash matches
[    3.176544] rtc_cmos 00:01: setting system clock to 2019-06-25T12:56:38 =
UTC (1561467398)
[    3.299726] ata7: SATA link down (SStatus 0 SControl 300)
[    3.300188] ata3: SATA link down (SStatus 0 SControl 300)
[    3.300609] ata4: SATA link down (SStatus 0 SControl 300)
[    3.301023] ata2: SATA link down (SStatus 0 SControl 300)
[    3.301419] ata6: SATA link down (SStatus 0 SControl 300)
[    3.301869] ata8: SATA link down (SStatus 0 SControl 300)
[    3.302257] ata5: SATA link down (SStatus 0 SControl 300)
[    3.302689] ata1: SATA link down (SStatus 0 SControl 300)
[    3.307738] ata9: SATA link down (SStatus 0 SControl 300)
[    3.308151] ata14: SATA link down (SStatus 0 SControl 300)
[    3.308562] ata12: SATA link down (SStatus 0 SControl 300)
[    3.308990] ata11: SATA link down (SStatus 0 SControl 300)
[    3.309398] ata10: SATA link down (SStatus 0 SControl 300)
[    3.309801] ata16: SATA link down (SStatus 0 SControl 300)
[    3.310197] ata13: SATA link down (SStatus 0 SControl 300)
[    3.310594] ata15: SATA link down (SStatus 0 SControl 300)
[    3.315978] Freeing unused decrypted memory: 2040K
[    3.318406] Freeing unused kernel image memory: 4876K
[    3.327662] Write protecting the kernel read-only data: 22528k
[    3.329740] Freeing unused kernel image memory: 2036K
[    3.331087] Freeing unused kernel image memory: 1756K
[    3.335744] usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    3.342248] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    3.342646] rodata_test: all tests were successful
[    3.343049] Run /init as init process
[    3.351740] usb 3-2: new high-speed USB device number 2 using xhci_hcd
[    3.419829] systemd[1]: systemd v241-8.git9ef65cb.fc30 running in system=
 mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYP=
TSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 =
-IDN +PCRE2 default-hierarchy=3Dhybrid)
[    3.433809] systemd[1]: Detected architecture x86-64.
[    3.434232] systemd[1]: Running in initial RAM disk.
[    3.450937] systemd[1]: Set hostname to <localhost.localdomain>.
[    3.468046] usb 1-1: New USB device found, idVendor=3D1458, idProduct=3D=
0610, bcdDevice=3D93.04
[    3.468534] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    3.468982] usb 1-1: Product: USB2.1 Hub
[    3.469419] usb 1-1: Manufacturer: GenesysLogic
[    3.484151] usb 3-2: New USB device found, idVendor=3D1458, idProduct=3D=
0610, bcdDevice=3D23.04
[    3.484644] usb 3-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    3.485143] usb 3-2: Product: USB2.1 Hub
[    3.485636] usb 3-2: Manufacturer: GenesysLogic
[    3.526690] hub 1-1:1.0: USB hub found
[    3.527929] hub 1-1:1.0: 4 ports detected
[    3.537996] systemd[1]: Listening on Journal Socket.
[    3.542107] hub 3-2:1.0: USB hub found
[    3.543150] hub 3-2:1.0: 2 ports detected
[    3.550108] systemd[1]: Starting Create list of required static device n=
odes for the current kernel...
[    3.552390] systemd[1]: Reached target Slices.
[    3.554332] systemd[1]: Listening on Journal Socket (/dev/log).
[    3.556168] systemd[1]: Listening on udev Kernel Socket.
[    3.557891] systemd[1]: Reached target Swap.
[    3.590244] usb 2-2: new SuperSpeed Gen 1 USB device number 2 using xhci=
_hcd
[    3.592285] fuse init (API version 7.28)
[    3.594616] jailhouse: loading out-of-tree module taints kernel.
[    3.595229] jailhouse: module verification failed: signature and/or requ=
ired key missing - tainting kernel
[    3.605919] usb 4-1: new SuperSpeed Gen 1 USB device number 2 using xhci=
_hcd
[    3.606786] usb 2-2: New USB device found, idVendor=3D1458, idProduct=3D=
0620, bcdDevice=3D93.04
[    3.607402] usb 2-2: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    3.608024] usb 2-2: Product: USB3.1 Hub
[    3.608626] usb 2-2: Manufacturer: GenesysLogic
[    3.614042] systemd-modules (431) used greatest stack depth: 13384 bytes=
 left
[    3.628767] usb 4-1: New USB device found, idVendor=3D1458, idProduct=3D=
0620, bcdDevice=3D23.04
[    3.629436] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    3.630089] usb 4-1: Product: USB3.1 Hub
[    3.630715] usb 4-1: Manufacturer: GenesysLogic
[    3.638379] hub 2-2:1.0: USB hub found
[    3.639398] hub 2-2:1.0: 4 ports detected
[    3.653990] hub 4-1:1.0: USB hub found
[    3.654892] hub 4-1:1.0: 2 ports detected
[    3.701892] tsc: Refined TSC clocksource calibration: 2399.999 MHz
[    3.702544] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x229=
8364cab5, max_idle_ns: 440795214892 ns
[    3.704002] clocksource: Switched to clocksource tsc
[    3.895734] usb 1-1.1: new full-speed USB device number 3 using xhci_hcd
[    3.999065] audit: type=3D1130 audit(1561467399.321:2): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-jour=
nald comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    4.006298] usb 1-1.1: New USB device found, idVendor=3D413c, idProduct=
=3D1002, bcdDevice=3D 2.00
[    4.006984] usb 1-1.1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    4.007637] usb 1-1.1: Product: Dell USB Keyboard Hub
[    4.008292] usb 1-1.1: Manufacturer: Dell
[    4.024530] audit: type=3D1130 audit(1561467399.346:3): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-tmpf=
iles-setup comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? a=
ddr=3D? terminal=3D? res=3Dsuccess'
[    4.044311] audit: type=3D1130 audit(1561467399.366:4): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
d comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? t=
erminal=3D? res=3Dsuccess'
[    4.074660] hub 1-1.1:1.0: USB hub found
[    4.076279] hub 1-1.1:1.0: 3 ports detected
[    4.168733] usb 1-1.2: new low-speed USB device number 4 using xhci_hcd
[    4.279548] usb 1-1.2: New USB device found, idVendor=3D046d, idProduct=
=3Dc016, bcdDevice=3D 3.40
[    4.280279] usb 1-1.2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[    4.281002] usb 1-1.2: Product: Optical USB Mouse
[    4.281728] usb 1-1.2: Manufacturer: Logitech
[    4.330424] input: Logitech Optical USB Mouse as /devices/pci0000:00/000=
0:00:07.1/0000:03:00.3/usb1/1-1/1-1.2/1-1.2:1.0/0003:046D:C016.0001/input/i=
nput2
[    4.332816] hid-generic 0003:046D:C016.0001: input,hidraw0: USB HID v1.1=
0 Mouse [Logitech Optical USB Mouse] on usb-0000:03:00.3-1.2/input0
[    4.358734] usb 1-1.1.1: new full-speed USB device number 5 using xhci_h=
cd
[    4.445156] usb 1-1.1.1: New USB device found, idVendor=3D413c, idProduc=
t=3D2002, bcdDevice=3D 2.00
[    4.445937] usb 1-1.1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[    4.446710] usb 1-1.1.1: Product: Dell USB Keyboard Hub
[    4.447470] usb 1-1.1.1: Manufacturer: Dell
[    4.506288] audit: type=3D1130 audit(1561467399.828:5): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-udev=
-trigger comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? add=
r=3D? terminal=3D? res=3Dsuccess'
[    4.526415] input: Dell Dell USB Keyboard Hub as /devices/pci0000:00/000=
0:00:07.1/0000:03:00.3/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1:1.0/0003:413C:2002.00=
02/input/input3
[    4.546296] audit: type=3D1130 audit(1561467399.868:6): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dplymouth-sta=
rt comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D? =
terminal=3D? res=3Dsuccess'
[    4.552188] dca service started, version 1.12.1
[    4.564616] nvme nvme0: pci function 0000:65:00.0
[    4.572389] igb: Intel(R) Gigabit Ethernet Network Driver - version 5.4.=
0-k
[    4.573122] igb: Copyright (c) 2007-2014 Intel Corporation.
[    4.581249] hid-generic 0003:413C:2002.0002: input,hidraw1: USB HID v1.1=
0 Keyboard [Dell Dell USB Keyboard Hub] on usb-0000:03:00.3-1.1.1/input0
[    4.586735] checking generic (82b0000000 1e8000) vs hw (ec000000 2000000=
)
[    4.590661] [drm] Using P2A bridge for configuration
[    4.591447] [drm] AST 2500 detected
[    4.592184] [drm] Analog VGA only
[    4.592911] [drm] dram MCLK=3D800 Mhz type=3D7 bus_width=3D16 size=3D020=
00000
[    4.596043] input: Dell Dell USB Keyboard Hub Consumer Control as /devic=
es/pci0000:00/0000:00:07.1/0000:03:00.3/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1:1.1/=
0003:413C:2002.0003/input/input4
[    4.599686] [TTM] Zone  kernel: Available graphics memory: 16168858 kiB
[    4.600467] [TTM] Zone   dma32: Available graphics memory: 2097152 kiB
[    4.601190] [TTM] Initializing pool allocator
[    4.601975] [TTM] Initializing DMA pool allocator
[    4.606279] pps pps0: new PPS source ptp0
[    4.606973] igb 0000:64:00.0: added PHC on eth0
[    4.607646] igb 0000:64:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    4.608328] igb 0000:64:00.0: eth0: (PCIe:2.5Gb/s:Width x1) e0:d5:5e:c7:=
0f:09
[    4.609052] igb 0000:64:00.0: eth0: PBA No: 000300-000
[    4.609731] igb 0000:64:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    4.610382] checking generic (82b0000000 1e8000) vs hw (ec000000 2000000=
)
[    4.611298] AMD-Vi: AMD IOMMUv2 driver by Joerg Roedel <jroedel@suse.de>
[    4.611978] AMD-Vi: AMD IOMMUv2 functionality not available on this syst=
em
[    4.612673] ast 0000:02:00.0: fb1: astdrmfb frame buffer device
[    4.630760] [drm] Initialized ast 0.1.0 20120228 for 0000:02:00.0 on min=
or 0
[    4.640876] pps pps1: new PPS source ptp1
[    4.641574] igb 0000:66:00.0: added PHC on eth1
[    4.641584] igb 0000:66:00.0: Intel(R) Gigabit Ethernet Network Connecti=
on
[    4.641586] igb 0000:66:00.0: eth1: (PCIe:2.5Gb/s:Width x1) e0:d5:5e:c7:=
0f:0a
[    4.641625] igb 0000:66:00.0: eth1: PBA No: 000300-000
[    4.644138] igb 0000:66:00.0: Using MSI-X interrupts. 4 rx queue(s), 4 t=
x queue(s)
[    4.647913] igb 0000:64:00.0 enp100s0: renamed from eth0
[    4.650291] input: Dell Dell USB Keyboard Hub System Control as /devices=
/pci0000:00/0000:00:07.1/0000:03:00.3/usb1/1-1/1-1.1/1-1.1.1/1-1.1.1:1.1/00=
03:413C:2002.0003/input/input5
[    4.651809] hid-generic 0003:413C:2002.0003: input,hidraw2: USB HID v1.1=
0 Device [Dell Dell USB Keyboard Hub] on usb-0000:03:00.3-1.1.1/input1
[    4.742424] igb 0000:66:00.0 enp102s0: renamed from eth1
[    4.775503] nvme nvme0: missing or invalid SUBNQN field.
[    4.776627] nvme nvme0: Shutdown timeout set to 8 seconds
[    4.811625] nvme nvme0: 32/0/0 default/read/poll queues
[    4.831169]  nvme0n1: p1 p2 p3 p4 p5
[    4.853878] [drm] amdgpu kernel modesetting enabled.
[    4.854777] Parsing CRAT table with 4 nodes
[    4.855397] Ignoring ACPI CRAT on non-APU system
[    4.856033] Virtual CRAT table created for CPU
[    4.856641] Parsing CRAT table with 4 nodes
[    4.857264] Creating topology SYSFS entries
[    4.858069] Topology: Add CPU node
[    4.858622] Finished initializing topology
[    4.859772] checking generic (82b0000000 1e8000) vs hw (82b0000000 10000=
000)
[    4.859777] fb0: switching to amdgpudrmfb from EFI VGA
[    4.860825] Console: switching to colour dummy device 80x25
[    4.862423] amdgpu 0000:63:00.0: enabling device (0006 -> 0007)
[    4.863035] [drm] initializing kernel modesetting (VEGA10 0x1002:0x6861 =
0x1002:0x0C1E 0x00).
[    4.863100] [drm] register mmio base: 0xEAD00000
[    4.863108] [drm] register mmio size: 524288
[    4.863146] [drm] add ip block number 0 <soc15_common>
[    4.863155] [drm] add ip block number 1 <gmc_v9_0>
[    4.863163] [drm] add ip block number 2 <vega10_ih>
[    4.863171] [drm] add ip block number 3 <psp>
[    4.863179] [drm] add ip block number 4 <gfx_v9_0>
[    4.863187] [drm] add ip block number 5 <sdma_v4_0>
[    4.863196] [drm] add ip block number 6 <powerplay>
[    4.863204] [drm] add ip block number 7 <dm>
[    4.863212] [drm] add ip block number 8 <uvd_v7_0>
[    4.863220] [drm] add ip block number 9 <vce_v4_0>
[    4.863674] [drm] UVD(0) is enabled in VM mode
[    4.863684] [drm] UVD(0) ENC is enabled in VM mode
[    4.863692] [drm] VCE enabled in VM mode
[    4.863886] ATOM BIOS: 113-D0510100-106
[    4.864000] [drm] vm size is 262144 GB, 4 levels, block size is 9-bit, f=
ragment size is 9-bit
[    4.864027] amdgpu 0000:63:00.0: BAR 2: releasing [mem 0x82c0000000-0x82=
c01fffff 64bit pref]
[    4.864041] amdgpu 0000:63:00.0: BAR 0: releasing [mem 0x82b0000000-0x82=
bfffffff 64bit pref]
[    4.864072] pcieport 0000:62:00.0: BAR 15: releasing [mem 0x82b0000000-0=
x82c01fffff 64bit pref]
[    4.864086] pcieport 0000:61:00.0: BAR 15: releasing [mem 0x82b0000000-0=
x82c01fffff 64bit pref]
[    4.864101] pcieport 0000:60:01.1: BAR 15: releasing [mem 0x82b0000000-0=
x82c01fffff 64bit pref]
[    4.864136] pcieport 0000:60:01.1: BAR 15: assigned [mem 0xa00000000-0xf=
ffffffff 64bit pref]
[    4.864150] pcieport 0000:61:00.0: BAR 15: assigned [mem 0xa00000000-0xf=
ffffffff 64bit pref]
[    4.864164] pcieport 0000:62:00.0: BAR 15: assigned [mem 0xa00000000-0xf=
ffffffff 64bit pref]
[    4.864180] amdgpu 0000:63:00.0: BAR 0: assigned [mem 0xc00000000-0xffff=
fffff 64bit pref]
[    4.864200] amdgpu 0000:63:00.0: BAR 2: assigned [mem 0xa00000000-0xa001=
fffff 64bit pref]
[    4.864222] pcieport 0000:60:01.1: PCI bridge to [bus 61-63]
[    4.864233] pcieport 0000:60:01.1:   bridge window [io  0x4000-0x4fff]
[    4.864245] pcieport 0000:60:01.1:   bridge window [mem 0xead00000-0xeae=
fffff]
[    4.864258] pcieport 0000:60:01.1:   bridge window [mem 0xa00000000-0xff=
fffffff 64bit pref]
[    4.864273] pcieport 0000:61:00.0: PCI bridge to [bus 62-63]
[    4.864283] pcieport 0000:61:00.0:   bridge window [io  0x4000-0x4fff]
[    4.864296] pcieport 0000:61:00.0:   bridge window [mem 0xead00000-0xead=
fffff]
[    4.864309] pcieport 0000:61:00.0:   bridge window [mem 0xa00000000-0xff=
fffffff 64bit pref]
[    4.864325] pcieport 0000:62:00.0: PCI bridge to [bus 63]
[    4.864335] pcieport 0000:62:00.0:   bridge window [io  0x4000-0x4fff]
[    4.864348] pcieport 0000:62:00.0:   bridge window [mem 0xead00000-0xead=
fffff]
[    4.864361] pcieport 0000:62:00.0:   bridge window [mem 0xa00000000-0xff=
fffffff 64bit pref]
[    4.864412] amdgpu 0000:63:00.0: VRAM: 16368M 0x000000F400000000 - 0x000=
000F7FEFFFFFF (16368M used)
[    4.864426] amdgpu 0000:63:00.0: GART: 512M 0x0000000000000000 - 0x00000=
0001FFFFFFF
[    4.864438] amdgpu 0000:63:00.0: AGP: 267419648M 0x000000F800000000 - 0x=
0000FFFFFFFFFFFF
[    4.864455] [drm] Detected VRAM RAM=3D16368M, BAR=3D16384M
[    4.864464] [drm] RAM width 2048bits HBM
[    4.864613] [drm] amdgpu: 16368M of VRAM memory ready
[    4.864626] [drm] amdgpu: 16368M of GTT memory ready.
[    4.864754] [drm] GART: num cpu pages 131072, num gpu pages 131072
[    4.864974] [drm] PCIE GART of 512M enabled (table at 0x000000F400900000=
).
[    4.869585] [drm] use_doorbell being set to: [true]
[    4.869966] [drm] use_doorbell being set to: [true]
[    4.870755] [drm] Found UVD firmware Version: 65.29 Family ID: 17
[    4.870775] [drm] PSP loading UVD firmware
[    4.871665] [drm] Found VCE firmware Version: 57.1 Binary ID: 4
[    4.871708] [drm] PSP loading VCE firmware
[    5.023120] [drm] reserve 0x400000 from 0xf400d00000 for PSP TMR SIZE
[    5.114817] [drm] Display Core initialized with v3.2.08!
[    5.149682] [drm] SADs count is: 0, don't need to read it
[    5.171646] [drm] Supports vblank timestamp caching Rev 2 (21.10.2013).
[    5.171659] [drm] Driver supports precise vblank timestamp query.
[    5.193159] [drm] UVD and UVD ENC initialized successfully.
[    5.293710] [drm] VCE initialized successfully.
[    5.297248] kfd kfd: Allocated 3969056 bytes on gart
[    5.297315] Virtual CRAT table created for GPU
[    5.297323] Parsing CRAT table with 1 nodes
[    5.297366] Creating topology SYSFS entries
[    5.298420] Topology: Add dGPU node [0x6861:0x1002]
[    5.299148] kfd kfd: added device 1002:6861
[    5.302037] [drm] fb mappable at 0xC01100000
[    5.302088] [drm] vram apper at 0xC00000000
[    5.302096] [drm] size 8294400
[    5.302101] [drm] fb depth is 24
[    5.302108] [drm]    pitch is 7680
[    5.302421] fbcon: amdgpudrmfb (fb0) is primary device
[    5.330846] Console: switching to colour frame buffer device 240x67
[    5.351931] amdgpu 0000:63:00.0: fb0: amdgpudrmfb frame buffer device
[    5.352246] amdgpu 0000:63:00.0: ring gfx uses VM inv eng 0 on hub 0
[    5.352279] amdgpu 0000:63:00.0: ring comp_1.0.0 uses VM inv eng 1 on hu=
b 0
[    5.352312] amdgpu 0000:63:00.0: ring comp_1.1.0 uses VM inv eng 4 on hu=
b 0
[    5.352345] amdgpu 0000:63:00.0: ring comp_1.2.0 uses VM inv eng 5 on hu=
b 0
[    5.352378] amdgpu 0000:63:00.0: ring comp_1.3.0 uses VM inv eng 6 on hu=
b 0
[    5.352411] amdgpu 0000:63:00.0: ring comp_1.0.1 uses VM inv eng 7 on hu=
b 0
[    5.352444] amdgpu 0000:63:00.0: ring comp_1.1.1 uses VM inv eng 8 on hu=
b 0
[    5.352476] amdgpu 0000:63:00.0: ring comp_1.2.1 uses VM inv eng 9 on hu=
b 0
[    5.352509] amdgpu 0000:63:00.0: ring comp_1.3.1 uses VM inv eng 10 on h=
ub 0
[    5.352542] amdgpu 0000:63:00.0: ring kiq_2.1.0 uses VM inv eng 11 on hu=
b 0
[    5.352575] amdgpu 0000:63:00.0: ring sdma0 uses VM inv eng 0 on hub 1
[    5.352607] amdgpu 0000:63:00.0: ring page0 uses VM inv eng 1 on hub 1
[    5.352637] amdgpu 0000:63:00.0: ring sdma1 uses VM inv eng 4 on hub 1
[    5.352668] amdgpu 0000:63:00.0: ring page1 uses VM inv eng 5 on hub 1
[    5.352716] amdgpu 0000:63:00.0: ring uvd_0 uses VM inv eng 6 on hub 1
[    5.352748] amdgpu 0000:63:00.0: ring uvd_enc_0.0 uses VM inv eng 7 on h=
ub 1
[    5.352784] amdgpu 0000:63:00.0: ring uvd_enc_0.1 uses VM inv eng 8 on h=
ub 1
[    5.352817] amdgpu 0000:63:00.0: ring vce0 uses VM inv eng 9 on hub 1
[    5.352848] amdgpu 0000:63:00.0: ring vce1 uses VM inv eng 10 on hub 1
[    5.352879] amdgpu 0000:63:00.0: ring vce2 uses VM inv eng 11 on hub 1
[    5.352998] [drm] ECC is active.
[    5.353687] [drm] Initialized amdgpu 3.27.0 20150101 for 0000:63:00.0 on=
 minor 1
[    5.391226] audit: type=3D1130 audit(1561467400.713:7): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Ddracut-initq=
ueue comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    5.423541] fsck (658) used greatest stack depth: 13224 bytes left
[    5.426556] audit: type=3D1130 audit(1561467400.748:8): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dsystemd-fsck=
-root comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
[    5.576809] SGI XFS with ACLs, security attributes, scrub, no debug enab=
led
[    5.582810] modprobe (661) used greatest stack depth: 13024 bytes left
[    5.589590] XFS (nvme0n1p5): Mounting V5 Filesystem
[    5.598343] XFS (nvme0n1p5): Ending clean mount
[    5.602583] mount (660) used greatest stack depth: 12080 bytes left
[    5.837492] audit: type=3D1130 audit(1561467401.159:9): pid=3D1 uid=3D0 =
auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dinitrd-parse=
-etc comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=3D=
? terminal=3D? res=3Dsuccess'
[    5.837501] audit: type=3D1131 audit(1561467401.159:10): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dkernel msg=3D'unit=3Dinitrd-pars=
e-etc comm=3D"systemd" exe=3D"/usr/lib/systemd/systemd" hostname=3D? addr=
=3D? terminal=3D? res=3Dsuccess'
[    6.213321] systemd-journald[434]: Received SIGTERM from PID 1 (systemd)=
.
[    6.280681] printk: systemd: 23 output lines suppressed due to ratelimit=
ing
[    6.915459] SELinux:  policy capability network_peer_controls=3D1
[    6.916757] SELinux:  policy capability open_perms=3D1
[    6.917976] SELinux:  policy capability extended_socket_class=3D1
[    6.919204] SELinux:  policy capability always_check_network=3D0
[    6.920425] SELinux:  policy capability cgroup_seclabel=3D1
[    6.921641] SELinux:  policy capability nnp_nosuid_transition=3D1
[    7.014892] kauditd_printk_skb: 20 callbacks suppressed
[    7.014893] audit: type=3D1403 audit(1561467402.337:31): auid=3D42949672=
95 ses=3D4294967295 lsm=3Dselinux res=3D1
[    7.019457] systemd[1]: Successfully loaded SELinux policy in 685.857ms.
[    7.092943] systemd[1]: Relabelled /dev, /dev/shm, /run, /sys/fs/cgroup =
in 44.263ms.
[    7.096661] systemd[1]: systemd v241-8.git9ef65cb.fc30 running in system=
 mode. (+PAM +AUDIT +SELINUX +IMA -APPARMOR +SMACK +SYSVINIT +UTMP +LIBCRYP=
TSETUP +GCRYPT +GNUTLS +ACL +XZ +LZ4 +SECCOMP +BLKID +ELFUTILS +KMOD +IDN2 =
-IDN +PCRE2 default-hierarchy=3Dhybrid)
[    7.111811] systemd[1]: Detected architecture x86-64.
[    7.115370] systemd[1]: Set hostname to <localhost.localdomain>.
[    7.225624] systemd[1]: /usr/lib/systemd/system/gssproxy.service:9: PIDF=
ile=3D references path below legacy directory /var/run/, updating /var/run/=
gssproxy.pid =E2=86=92 /run/gssproxy.pid; please update the unit file accor=
dingly.
[    7.228089] systemd[1]: /usr/lib/systemd/system/rpc-statd.service:14: PI=
DFile=3D references path below legacy directory /var/run/, updating /var/ru=
n/rpc.statd.pid =E2=86=92 /run/rpc.statd.pid; please update the unit file a=
ccordingly.
[    7.233972] systemd[1]: /usr/lib/systemd/system/nfs-blkmap.service:10: P=
IDFile=3D references path below legacy directory /var/run/, updating /var/r=
un/blkmapd.pid =E2=86=92 /run/blkmapd.pid; please update the unit file acco=
rdingly.
[    7.249139] systemd[1]: /usr/lib/systemd/system/sssd.service:11: PIDFile=
=3D references path below legacy directory /var/run/, updating /var/run/sss=
d.pid =E2=86=92 /run/sssd.pid; please update the unit file accordingly.
[    7.253158] systemd[1]: /usr/lib/systemd/system/mdmonitor.service:6: PID=
File=3D references path below legacy directory /var/run/, updating /var/run=
/mdadm/mdadm.pid =E2=86=92 /run/mdadm/mdadm.pid; please update the unit fil=
e accordingly.
[    7.260524] systemd[1]: /usr/lib/systemd/system/chronyd.service:9: PIDFi=
le=3D references path below legacy directory /var/run/, updating /var/run/c=
hrony/chronyd.pid =E2=86=92 /run/chrony/chronyd.pid; please update the unit=
 file accordingly.
[    7.353297] audit: type=3D1131 audit(1561467402.675:32): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.353998] systemd[1]: initrd-switch-root.service: Succeeded.
[    7.359202] audit: type=3D1130 audit(1561467402.681:33): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dinitrd-switch-root comm=3D"systemd" exe=3D"/usr/lib/systemd/syst=
emd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.361997] audit: type=3D1131 audit(1561467402.681:34): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dinitrd-switch-root comm=3D"systemd" exe=3D"/usr/lib/systemd/syst=
emd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.365148] audit: type=3D1130 audit(1561467402.687:35): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.365156] audit: type=3D1131 audit(1561467402.687:36): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-journald comm=3D"systemd" exe=3D"/usr/lib/systemd/system=
d" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.397608] audit: type=3D1131 audit(1561467402.719:37): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-fsck-root comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.504422] audit: type=3D1130 audit(1561467402.826:38): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-remount-fs comm=3D"systemd" exe=3D"/usr/lib/systemd/syst=
emd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.516012] audit: type=3D1130 audit(1561467402.838:39): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dkmod-static-nodes comm=3D"systemd" exe=3D"/usr/lib/systemd/syste=
md" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.523807] audit: type=3D1130 audit(1561467402.846:40): pid=3D1 uid=3D0=
 auid=3D4294967295 ses=3D4294967295 subj=3Dsystem_u:system_r:init_t:s0 msg=
=3D'unit=3Dsystemd-modules-load comm=3D"systemd" exe=3D"/usr/lib/systemd/sy=
stemd" hostname=3D? addr=3D? terminal=3D? res=3Dsuccess'
[    7.603599] XFS (nvme0n1p3): Mounting V5 Filesystem
[    7.606206] XFS (nvme0n1p4): Mounting V5 Filesystem
[    7.615623] XFS (nvme0n1p2): Mounting V5 Filesystem
[    7.619509] XFS (nvme0n1p3): Ending clean mount
[    7.630123] XFS (nvme0n1p2): Ending clean mount
[    7.636281] XFS (nvme0n1p4): Ending clean mount
[    7.670274] systemd-journald[761]: Received request to flush runtime jou=
rnal from PID 1
[    7.820232] systemd-tmpfile (828) used greatest stack depth: 12048 bytes=
 left
[    7.874782] RPC: Registered named UNIX socket transport module.
[    7.876142] RPC: Registered udp transport module.
[    7.877446] RPC: Registered tcp transport module.
[    7.878737] RPC: Registered tcp NFSv4.1 backchannel transport module.
[    7.950679] acpi_cpufreq: overriding BIOS provided _PSD data
[    8.050877] IPMI message handler: version 39.2
[    8.070326] ipmi device interface
[    8.085690] ipmi_si: IPMI System Interface driver
[    8.086839] ipmi_si dmi-ipmi-si.0: ipmi_platform: probing via SMBIOS
[    8.087909] ipmi_platform: ipmi_si: SMBIOS: io 0xca2 regsize 1 spacing 1=
 irq 0
[    8.088047] ipmi_si: Adding SMBIOS-specified kcs state machine
[    8.091083] ipmi_si IPI0001:00: ipmi_platform: probing via ACPI
[    8.091137] ipmi_si IPI0001:00: ipmi_platform: [io  0x0ca2] regsize 1 sp=
acing 1 irq 0
[    8.091141] ipmi_si dmi-ipmi-si.0: Removing SMBIOS-specified kcs state m=
achine in favor of ACPI
[    8.091145] ipmi_si: Adding ACPI-specified kcs state machine
[    8.091393] ipmi_si: Trying ACPI-specified kcs state machine at i/o addr=
ess 0xca2, slave address 0x20, irq 0
[    8.182760] ccp 0000:03:00.2: enabling device (0000 -> 0002)
[    8.194213] piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, re=
vision 0
[    8.195300] piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port=
 selection
[    8.201211] ccp 0000:03:00.2: ccp enabled
[    8.203394] ccp 0000:03:00.2: psp enabled
[    8.204446] ccp 0000:03:00.2: enabled
[    8.205690] ccp 0000:04:00.1: enabling device (0000 -> 0002)
[    8.213645] ccp 0000:04:00.1: ccp enabled
[    8.215471] ccp 0000:04:00.1: enabled
[    8.217870] ccp 0000:21:00.2: enabling device (0000 -> 0002)
[    8.218439] sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    8.218842] sp5100-tco sp5100-tco: Using 0xfed80b00 for watchdog MMIO ad=
dress
[    8.218853] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[    8.227975] ccp 0000:21:00.2: ccp enabled
[    8.230003] ccp 0000:21:00.2: psp enabled
[    8.230007] ccp 0000:21:00.2: enabled
[    8.232931] ccp 0000:22:00.1: enabling device (0000 -> 0002)
[    8.246540] ipmi_si IPI0001:00: IPMI message handler: Found new BMC (man=
_id: 0x003c0a, prod_id: 0x1006, dev_id: 0x20)
[    8.253227] ccp 0000:22:00.1: ccp enabled
[    8.253230] ccp 0000:22:00.1: enabled
[    8.253921] ccp 0000:41:00.2: enabling device (0000 -> 0002)
[    8.261279] ccp 0000:41:00.2: ccp enabled
[    8.262329] ccp 0000:41:00.2: psp enabled
[    8.263335] ccp 0000:41:00.2: enabled
[    8.269844] ccp 0000:42:00.1: enabling device (0000 -> 0002)
[    8.272483] ccp 0000:42:00.1: ccp enabled
[    8.272485] ccp 0000:42:00.1: enabled
[    8.272660] ccp 0000:67:00.2: enabling device (0000 -> 0002)
[    8.274517] ccp 0000:67:00.2: ccp enabled
[    8.274543] ccp 0000:67:00.2: psp enabled
[    8.274544] ccp 0000:67:00.2: enabled
[    8.274630] ccp 0000:68:00.1: enabling device (0000 -> 0002)
[    8.276238] ccp 0000:68:00.1: ccp enabled
[    8.282889] ccp 0000:68:00.1: enabled
[    8.299853] ccp 0000:03:00.2: SEV firmware update successful
[    8.338087] ccp 0000:03:00.2: SEV API:0.17 build:11
[    8.415942] ipmi_si IPI0001:00: IPMI kcs interface initialized
[    8.424670] ipmi_ssif: IPMI SSIF Interface driver
[    8.521676] snd_hda_intel 0000:63:00.1: enabling device (0000 -> 0002)
[    8.523556] snd_hda_intel 0000:63:00.1: Handle vga_switcheroo audio clie=
nt
[    8.562927] input: HD-Audio Generic HDMI/DP,pcm=3D3 as /devices/pci0000:=
60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input6
[    8.565445] input: HD-Audio Generic HDMI/DP,pcm=3D7 as /devices/pci0000:=
60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input7
[    8.566823] input: HD-Audio Generic HDMI/DP,pcm=3D8 as /devices/pci0000:=
60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input8
[    8.569073] input: HD-Audio Generic HDMI/DP,pcm=3D9 as /devices/pci0000:=
60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input9
[    8.570829] input: HD-Audio Generic HDMI/DP,pcm=3D10 as /devices/pci0000=
:60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input10
[    8.572831] input: HD-Audio Generic HDMI/DP,pcm=3D11 as /devices/pci0000=
:60/0000:60:01.1/0000:61:00.0/0000:62:00.0/0000:63:00.1/sound/card0/input11
[    8.713165] kvm: Nested Virtualization enabled
[    8.714433] kvm: Nested Paging enabled
[    8.715348] SVM: Virtual VMLOAD VMSAVE supported
[    8.716254] SVM: Virtual GIF supported
[    8.725891] MCE: In-kernel MCE decoding enabled.
[    8.742788] EDAC amd64: Node 0: DRAM ECC enabled.
[    8.744168] EDAC amd64: F17h detected (node 0).
[    8.745152] EDAC MC: UMC0 chip selects:
[    8.745154] EDAC amd64: MC: 0:     0MB 1:     0MB
[    8.746057] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.746949] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.747873] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.749274] EDAC MC: UMC1 chip selects:
[    8.749277] EDAC amd64: MC: 0:  8191MB 1:  8191MB
[    8.750102] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.750915] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.751725] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.752522] EDAC amd64: using x8 syndromes.
[    8.753321] EDAC amd64: MCT channel count: 1
[    8.754703] EDAC MC0: Giving out device to module amd64_edac controller =
F17h: DEV 0000:00:18.3 (INTERRUPT)
[    8.755593] EDAC amd64: Node 1: DRAM ECC enabled.
[    8.756636] EDAC amd64: F17h detected (node 1).
[    8.757556] EDAC MC: UMC0 chip selects:
[    8.757558] EDAC amd64: MC: 0:  8191MB 1:  8191MB
[    8.758392] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.759221] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.760078] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.760914] EDAC MC: UMC1 chip selects:
[    8.760915] EDAC amd64: MC: 0:     0MB 1:     0MB
[    8.760916] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.760917] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.760917] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.760918] EDAC amd64: using x8 syndromes.
[    8.760919] EDAC amd64: MCT channel count: 1
[    8.761143] EDAC MC1: Giving out device to module amd64_edac controller =
F17h: DEV 0000:00:19.3 (INTERRUPT)
[    8.761156] EDAC amd64: Node 2: DRAM ECC enabled.
[    8.761157] EDAC amd64: F17h detected (node 2).
[    8.761225] EDAC MC: UMC0 chip selects:
[    8.761226] EDAC amd64: MC: 0:     0MB 1:     0MB
[    8.761227] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.761228] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.761228] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.761232] EDAC MC: UMC1 chip selects:
[    8.761233] EDAC amd64: MC: 0:  8191MB 1:  8191MB
[    8.761234] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.761235] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.761236] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.761236] EDAC amd64: using x8 syndromes.
[    8.761237] EDAC amd64: MCT channel count: 1
[    8.761559] EDAC MC2: Giving out device to module amd64_edac controller =
F17h: DEV 0000:00:1a.3 (INTERRUPT)
[    8.761566] EDAC amd64: Node 3: DRAM ECC enabled.
[    8.761567] EDAC amd64: F17h detected (node 3).
[    8.761635] EDAC MC: UMC0 chip selects:
[    8.761636] EDAC amd64: MC: 0:  8191MB 1:  8191MB
[    8.761637] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.761638] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.761639] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.761642] EDAC MC: UMC1 chip selects:
[    8.761643] EDAC amd64: MC: 0:     0MB 1:     0MB
[    8.761644] EDAC amd64: MC: 2:     0MB 3:     0MB
[    8.761645] EDAC amd64: MC: 4:     0MB 5:     0MB
[    8.761646] EDAC amd64: MC: 6:     0MB 7:     0MB
[    8.761646] EDAC amd64: using x8 syndromes.
[    8.761647] EDAC amd64: MCT channel count: 1
[    8.761961] EDAC MC3: Giving out device to module amd64_edac controller =
F17h: DEV 0000:00:1b.3 (INTERRUPT)
[    8.762238] EDAC PCI0: Giving out device to module amd64_edac controller=
 EDAC PCI controller: DEV 0000:00:18.0 (POLLED)
[    8.762252] AMD64 EDAC driver v3.5.0
[   11.866231] igb 0000:66:00.0 enp102s0: igb: enp102s0 NIC Link is Up 1000=
 Mbps Full Duplex, Flow Control: RX
[   11.973880] IPv6: ADDRCONF(NETDEV_CHANGE): enp102s0: link becomes ready
[   12.982367] systemd-udevd (925) used greatest stack depth: 11864 bytes l=
eft
[   32.774860] FS-Cache: Loaded
[   32.815276] FS-Cache: Netfs 'nfs' registered for caching
[   32.826678] Key type dns_resolver registered
[   32.968630] NFS: Registering the id_resolver key type
[   32.968729] Key type id_resolver registered
[   32.968782] Key type id_legacy registered
[   33.082282] mount.nfs (1292) used greatest stack depth: 11176 bytes left
[  218.866295] The Jailhouse is opening.
[  334.263027] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.263123] #PF error: [INSTR]
[  334.263157] PGD 0 P4D 0=20
[  334.263188] Oops: 0010 [#1] SMP NOPTI
[  334.263229] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W  OE     5.=
0.16-300.local.fc30.x86_64 #1
[  334.263315] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.263386] RIP: 0010:          (null)
[  334.263429] Code: Bad RIP value.
[  334.263462] RSP: 0018:ffff97ad93003d60 EFLAGS: 00010246
[  334.263515] RAX: 0000000000000000 RBX: ffff97ad93015f98 RCX: 00000000c00=
02001
[  334.263582] RDX: 0000000000000000 RSI: ffff97ad93003d74 RDI: 00000000c00=
02001
[  334.263649] RBP: 00000000c0002001 R08: ffff97ad93003d70 R09: ffff97ad930=
03d74
[  334.263716] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.263783] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.263851] FS:  0000000000000000(0000) GS:ffff97ad93000000(0000) knlGS:=
0000000000000000
[  334.263927] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.263981] CR2: ffffffffffffffd6 CR3: 00000002101b2000 CR4: 00000000003=
406f0
[  334.264049] Call Trace:
[  334.264076]  <IRQ>
[  334.264107]  ? mce_rdmsrl+0x33/0xa0
[  334.264146]  ? machine_check_poll+0xdb/0x200
[  334.264196]  ? mce_available+0x30/0x30
[  334.264236]  ? mce_timer_fn+0x59/0xd0
[  334.264277]  ? call_timer_fn+0xaa/0x2c0
[  334.264320]  ? mce_available+0x30/0x30
[  334.264359]  ? run_timer_softirq+0x497/0x5a0
[  334.264405]  ? sched_clock_cpu+0xc/0xc0
[  334.264452]  ? __do_softirq+0xe2/0x468
[  334.264496]  ? irq_exit+0x119/0x120
[  334.264533]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.264582]  ? apic_timer_interrupt+0xf/0x20
[  334.264624]  </IRQ>
[  334.264655]  ? cpuidle_enter_state+0xc9/0x480
[  334.264704]  ? do_idle+0x1ec/0x280
[  334.264742]  ? cpu_startup_entry+0x19/0x20
[  334.264787]  ? start_kernel+0x526/0x544
[  334.264830]  ? secondary_startup_64+0xa4/0xb0
[  334.264881] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.265381] CR2: 0000000000000000
[  334.265499] ---[ end trace 3b29a267a344a2e4 ]---
[  334.265504] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.265512] #PF error: [INSTR]
[  334.269486] PGD 0 P4D 0=20
[  334.269518] Oops: 0010 [#2] SMP NOPTI
[  334.269558] CPU: 14 PID: 0 Comm: swapper/14 Tainted: G      D W  OE     =
5.0.16-300.local.fc30.x86_64 #1
[  334.269646] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.269716] RIP: 0010:          (null)
[  334.269759] Code: Bad RIP value.
[  334.269793] RSP: 0018:ffff97b38be03d60 EFLAGS: 00010246
[  334.269845] RAX: 0000000000000000 RBX: ffff97b38be15f98 RCX: 00000000c00=
02001
[  334.269912] RDX: 0000000000000000 RSI: ffff97b38be03d74 RDI: 00000000c00=
02001
[  334.269980] RBP: 00000000c0002001 R08: ffff97b38be03d70 R09: ffff97b38be=
03d74
[  334.270047] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.272653] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.275243] FS:  0000000000000000(0000) GS:ffff97b38be00000(0000) knlGS:=
0000000000000000
[  334.277854] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.280452] CR2: ffffffffffffffd6 CR3: 000000040bf92000 CR4: 00000000003=
406e0
[  334.283075] Call Trace:
[  334.285664]  <IRQ>
[  334.288242]  ? mce_rdmsrl+0x33/0xa0
[  334.290817]  ? machine_check_poll+0xdb/0x200
[  334.293396]  ? mce_available+0x30/0x30
[  334.295973]  ? mce_timer_fn+0x59/0xd0
[  334.298523]  ? call_timer_fn+0xaa/0x2c0
[  334.301053]  ? mce_available+0x30/0x30
[  334.303535]  ? run_timer_softirq+0x497/0x5a0
[  334.306001]  ? sched_clock+0x5/0x10
[  334.308465]  ? sched_clock_cpu+0xc/0xc0
[  334.310931]  ? __do_softirq+0xe2/0x468
[  334.313364]  ? irq_exit+0x119/0x120
[  334.315749]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.318128]  ? apic_timer_interrupt+0xf/0x20
[  334.320505]  </IRQ>
[  334.322865]  ? cpuidle_enter_state+0xc9/0x480
[  334.325220]  ? cpuidle_enter_state+0xc2/0x480
[  334.327569]  ? do_idle+0x1ec/0x280
[  334.329911]  ? cpu_startup_entry+0x19/0x20
[  334.332250]  ? start_secondary+0x1b3/0x200
[  334.334595]  ? secondary_startup_64+0xa4/0xb0
[  334.336923] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.344922] CR2: 0000000000000000
[  334.347710] ---[ end trace 3b29a267a344a2e5 ]---
[  334.347713] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.347719] #PF error: [INSTR]
[  334.350468] bad: scheduling from the idle thread!
[  334.353230] PGD 0 P4D 0=20
[  334.356014] CPU: 14 PID: 0 Comm: swapper/14 Tainted: G      D W  OE     =
5.0.16-300.local.fc30.x86_64 #1
[  334.358798] Oops: 0010 [#3] SMP NOPTI
[  334.361587] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.364477] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G      D W  OE     5.=
0.16-300.local.fc30.x86_64 #1
[  334.367347] Call Trace:
[  334.370277] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.373266]  <IRQ>
[  334.376230] RIP: 0010:          (null)
[  334.379263]  dump_stack+0x85/0xc0
[  334.382261] Code: Bad RIP value.
[  334.385273]  dequeue_task_idle+0x1f/0x30
[  334.388272] RSP: 0018:ffff97ad93203d60 EFLAGS: 00010246
[  334.391282]  __schedule+0x14d/0xbe0
[  334.394287] RAX: 0000000000000000 RBX: ffff97ad93215f98 RCX: 00000000c00=
02001
[  334.394291] RDX: 0000000000000000 RSI: ffff97ad93203d74 RDI: 00000000c00=
02001
[  334.397326]  ? trace_hardirqs_on_thunk+0x1a/0x1c
[  334.400343] RBP: 00000000c0002001 R08: ffff97ad93203d70 R09: ffff97ad932=
03d74
[  334.400347] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.403303]  schedule+0x39/0x80
[  334.406103] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.406106] FS:  0000000000000000(0000) GS:ffff97ad93200000(0000) knlGS:=
0000000000000000
[  334.408785]  schedule_timeout+0x316/0x4e0
[  334.411452] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.411456] CR2: ffffffffffffffd6 CR3: 00000002101b2000 CR4: 00000000003=
406e0
[  334.414139]  ? _raw_spin_unlock_irq+0x29/0x40
[  334.416768] Call Trace:
[  334.419440]  __down_interruptible+0x9d/0x120
[  334.422141]  <IRQ>
[  334.424850]  down_interruptible+0x46/0x50
[  334.427549]  ? mce_rdmsrl+0x33/0xa0
[  334.430243]  pstore_dump+0x91/0x320
[  334.432909]  ? machine_check_poll+0xdb/0x200
[  334.435572]  ? kmsg_dump+0xd1/0x1d0
[  334.438242]  ? mce_available+0x30/0x30
[  334.440871]  kmsg_dump+0x86/0x1d0
[  334.443533]  ? mce_timer_fn+0x59/0xd0
[  334.446194]  oops_end+0x68/0xc0
[  334.448838]  ? call_timer_fn+0xaa/0x2c0
[  334.451499]  no_context+0x1bd/0x390
[  334.454124]  ? mce_available+0x30/0x30
[  334.456726]  do_page_fault+0x33/0x210
[  334.459293]  ? run_timer_softirq+0x497/0x5a0
[  334.461844]  page_fault+0x1e/0x30
[  334.464405]  ? sched_clock+0x5/0x10
[  334.466965] RIP: 0010:          (null)
[  334.469524]  ? sched_clock_cpu+0xc/0xc0
[  334.472081] Code: Bad RIP value.
[  334.474642]  ? __do_softirq+0xe2/0x468
[  334.477208] RSP: 0018:ffff97b38be03d60 EFLAGS: 00010246
[  334.479781]  ? irq_exit+0x119/0x120
[  334.482343] RAX: 0000000000000000 RBX: ffff97b38be15f98 RCX: 00000000c00=
02001
[  334.484910]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.487487] RDX: 0000000000000000 RSI: ffff97b38be03d74 RDI: 00000000c00=
02001
[  334.490059]  ? apic_timer_interrupt+0xf/0x20
[  334.492638] RBP: 00000000c0002001 R08: ffff97b38be03d70 R09: ffff97b38be=
03d74
[  334.495236]  </IRQ>
[  334.497825] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.500471]  ? cpuidle_enter_state+0xc9/0x480
[  334.503112] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.505822]  ? cpuidle_enter_state+0xc2/0x480
[  334.508534]  ? do_machine_check+0xd51/0xde0
[  334.511289]  ? do_idle+0x1ec/0x280
[  334.514031]  ? mce_rdmsrl+0x33/0xa0
[  334.516832]  ? cpu_startup_entry+0x19/0x20
[  334.519508]  ? machine_check_poll+0xdb/0x200
[  334.522100]  ? start_secondary+0x1b3/0x200
[  334.524564]  ? mce_available+0x30/0x30
[  334.526965]  ? secondary_startup_64+0xa4/0xb0
[  334.529362]  ? mce_timer_fn+0x59/0xd0
[  334.531727] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.534067]  ? call_timer_fn+0xaa/0x2c0
[  334.536400] CR2: 0000000000000000
[  334.538736]  ? mce_available+0x30/0x30
[  334.541106] ---[ end trace 3b29a267a344a2e6 ]---
[  334.541111] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.541118] #PF error: [INSTR]
[  334.541121] PGD 0 P4D 0=20
[  334.541127] Oops: 0010 [#4] SMP NOPTI
[  334.541132] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G      D W  OE     5.=
0.16-300.local.fc30.x86_64 #1
[  334.541134] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.541136] RIP: 0010:          (null)
[  334.541143] Code: Bad RIP value.
[  334.541145] RSP: 0018:ffff97ad93603d60 EFLAGS: 00010246
[  334.541148] RAX: 0000000000000000 RBX: ffff97ad93615f98 RCX: 00000000c00=
02001
[  334.541150] RDX: 0000000000000000 RSI: ffff97ad93603d74 RDI: 00000000c00=
02001
[  334.541152] RBP: 00000000c0002001 R08: ffff97ad93603d70 R09: ffff97ad936=
03d74
[  334.541153] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.541154] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.541157] FS:  0000000000000000(0000) GS:ffff97ad93600000(0000) knlGS:=
0000000000000000
[  334.541158] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.541160] CR2: ffffffffffffffd6 CR3: 00000003ea616000 CR4: 00000000003=
406e0
[  334.541162] Call Trace:
[  334.541164]  <IRQ>
[  334.541175]  ? mce_rdmsrl+0x33/0xa0
[  334.541180]  ? machine_check_poll+0xdb/0x200
[  334.541189]  ? mce_available+0x30/0x30
[  334.541193]  ? mce_timer_fn+0x59/0xd0
[  334.541198]  ? call_timer_fn+0xaa/0x2c0
[  334.541205]  ? mce_available+0x30/0x30
[  334.541207]  ? run_timer_softirq+0x497/0x5a0
[  334.541212]  ? sched_clock+0x5/0x10
[  334.541217]  ? sched_clock_cpu+0xc/0xc0
[  334.541226]  ? __do_softirq+0xe2/0x468
[  334.541234]  ? irq_exit+0x119/0x120
[  334.541238]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.541241]  ? apic_timer_interrupt+0xf/0x20
[  334.541242]  </IRQ>
[  334.541253]  ? cpuidle_enter_state+0xc9/0x480
[  334.541256]  ? cpuidle_enter_state+0xc2/0x480
[  334.541262]  ? do_idle+0x1ec/0x280
[  334.541267]  ? cpu_startup_entry+0x19/0x20
[  334.541272]  ? start_secondary+0x1b3/0x200
[  334.541277]  ? secondary_startup_64+0xa4/0xb0
[  334.541284] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.541344] CR2: 0000000000000000
[  334.541429] ---[ end trace 3b29a267a344a2e7 ]---
[  334.541433] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.541439] #PF error: [INSTR]
[  334.541442] PGD 0 P4D 0=20
[  334.541447] bad: scheduling from the idle thread!
[  334.541450] Oops: 0010 [#5] SMP NOPTI
[  334.541455] CPU: 13 PID: 0 Comm: swapper/13 Tainted: G      D W  OE     =
5.0.16-300.local.fc30.x86_64 #1
[  334.541457] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.541459] RIP: 0010:          (null)
[  334.541466] Code: Bad RIP value.
[  334.541468] RSP: 0018:ffff97b38bc03d60 EFLAGS: 00010246
[  334.541472] RAX: 0000000000000000 RBX: ffff97b38bc15f98 RCX: 00000000c00=
02001
[  334.541473] RDX: 0000000000000000 RSI: ffff97b38bc03d74 RDI: 00000000c00=
02001
[  334.541475] RBP: 00000000c0002001 R08: ffff97b38bc03d70 R09: ffff97b38bc=
03d74
[  334.541476] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.541478] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.541480] FS:  0000000000000000(0000) GS:ffff97b38bc00000(0000) knlGS:=
0000000000000000
[  334.541482] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.541483] CR2: ffffffffffffffd6 CR3: 000000060e338000 CR4: 00000000003=
406e0
[  334.541485] Call Trace:
[  334.541487]  <IRQ>
[  334.541498]  ? mce_rdmsrl+0x33/0xa0
[  334.541503]  ? machine_check_poll+0xdb/0x200
[  334.541512]  ? mce_available+0x30/0x30
[  334.541516]  ? mce_timer_fn+0x59/0xd0
[  334.541521]  ? call_timer_fn+0xaa/0x2c0
[  334.541528]  ? mce_available+0x30/0x30
[  334.541530]  ? run_timer_softirq+0x497/0x5a0
[  334.541535]  ? sched_clock+0x5/0x10
[  334.541539]  ? sched_clock_cpu+0xc/0xc0
[  334.541549]  ? __do_softirq+0xe2/0x468
[  334.541557]  ? irq_exit+0x119/0x120
[  334.541560]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.541564]  ? apic_timer_interrupt+0xf/0x20
[  334.541565]  </IRQ>
[  334.541575]  ? cpuidle_enter_state+0xc9/0x480
[  334.541579]  ? cpuidle_enter_state+0xc2/0x480
[  334.541584]  ? do_idle+0x1ec/0x280
[  334.541590]  ? cpu_startup_entry+0x19/0x20
[  334.541594]  ? start_secondary+0x1b3/0x200
[  334.541599]  ? secondary_startup_64+0xa4/0xb0
[  334.541607] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.541672] CR2: 0000000000000000
[  334.541756] ---[ end trace 3b29a267a344a2e8 ]---
[  334.541759] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.541764] #PF error: [INSTR]
[  334.541766] PGD 0 P4D 0=20
[  334.541772] Oops: 0010 [#6] SMP NOPTI
[  334.541776] CPU: 12 PID: 0 Comm: swapper/12 Tainted: G      D W  OE     =
5.0.16-300.local.fc30.x86_64 #1
[  334.541777] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.541780] RIP: 0010:          (null)
[  334.541785] Code: Bad RIP value.
[  334.541786] RSP: 0018:ffff97b38ba03d60 EFLAGS: 00010246
[  334.541788] bad: scheduling from the idle thread!
[  334.541790] RAX: 0000000000000000 RBX: ffff97b38ba15f98 RCX: 00000000c00=
02001
[  334.541792] RDX: 0000000000000000 RSI: ffff97b38ba03d74 RDI: 00000000c00=
02001
[  334.541793] RBP: 00000000c0002001 R08: ffff97b38ba03d70 R09: ffff97b38ba=
03d74
[  334.541795] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.541796] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.541799] FS:  0000000000000000(0000) GS:ffff97b38ba00000(0000) knlGS:=
0000000000000000
[  334.541801] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.541802] CR2: ffffffffffffffd6 CR3: 000000060e338000 CR4: 00000000003=
406e0
[  334.541804] Call Trace:
[  334.541806]  <IRQ>
[  334.541812]  ? mce_rdmsrl+0x33/0xa0
[  334.541817]  ? machine_check_poll+0xdb/0x200
[  334.541826]  ? mce_available+0x30/0x30
[  334.541830]  ? mce_timer_fn+0x59/0xd0
[  334.541834]  ? call_timer_fn+0xaa/0x2c0
[  334.541840]  ? mce_available+0x30/0x30
[  334.541843]  ? run_timer_softirq+0x497/0x5a0
[  334.541847]  ? sched_clock+0x5/0x10
[  334.541850]  ? sched_clock_cpu+0xc/0xc0
[  334.541857]  ? __do_softirq+0xe2/0x468
[  334.541865]  ? irq_exit+0x119/0x120
[  334.541868]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.541871]  ? apic_timer_interrupt+0xf/0x20
[  334.541873]  </IRQ>
[  334.541881]  ? cpuidle_enter_state+0xc9/0x480
[  334.541885]  ? cpuidle_enter_state+0xc2/0x480
[  334.541890]  ? do_idle+0x1ec/0x280
[  334.541896]  ? cpu_startup_entry+0x19/0x20
[  334.541899]  ? start_secondary+0x1b3/0x200
[  334.541904]  ? secondary_startup_64+0xa4/0xb0
[  334.541911] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.541971] CR2: 0000000000000000
[  334.542053] ---[ end trace 3b29a267a344a2e9 ]---
[  334.542056] BUG: unable to handle kernel NULL pointer dereference at 000=
0000000000000
[  334.542062] #PF error: [INSTR]
[  334.542065] PGD 0 P4D 0=20
[  334.542071] Oops: 0010 [#7] SMP NOPTI
[  334.542075] CPU: 15 PID: 0 Comm: swapper/15 Tainted: G      D W  OE     =
5.0.16-300.local.fc30.x86_64 #1
[  334.542076] bad: scheduling from the idle thread!
[  334.542078] Hardware name: GIGABYTE MZ01-CE1-00/MZ01-CE1-00, BIOS F02 08=
/29/2018
[  334.542081] RIP: 0010:          (null)
[  334.542086] Code: Bad RIP value.
[  334.542088] RSP: 0018:ffff97b38c003d60 EFLAGS: 00010246
[  334.542092] RAX: 0000000000000000 RBX: ffff97b38c015f98 RCX: 00000000c00=
02001
[  334.542093] RDX: 0000000000000000 RSI: ffff97b38c003d74 RDI: 00000000c00=
02001
[  334.542095] RBP: 00000000c0002001 R08: ffff97b38c003d70 R09: ffff97b38c0=
03d74
[  334.542096] R10: 0000000000000001 R11: 0000000000000001 R12: 00000000000=
00000
[  334.542097] R13: ffffffff8e047e01 R14: 0000000000000000 R15: 00000000000=
00000
[  334.542100] FS:  0000000000000000(0000) GS:ffff97b38c000000(0000) knlGS:=
0000000000000000
[  334.542102] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  334.542103] CR2: ffffffffffffffd6 CR3: 000000060e338000 CR4: 00000000003=
406e0
[  334.542105] Call Trace:
[  334.542107]  <IRQ>
[  334.542113]  ? mce_rdmsrl+0x33/0xa0
[  334.542118]  ? machine_check_poll+0xdb/0x200
[  334.542127]  ? mce_available+0x30/0x30
[  334.542131]  ? mce_timer_fn+0x59/0xd0
[  334.542135]  ? call_timer_fn+0xaa/0x2c0
[  334.542141]  ? mce_available+0x30/0x30
[  334.542144]  ? run_timer_softirq+0x497/0x5a0
[  334.542148]  ? sched_clock+0x5/0x10
[  334.542151]  ? sched_clock_cpu+0xc/0xc0
[  334.542158]  ? __do_softirq+0xe2/0x468
[  334.542165]  ? irq_exit+0x119/0x120
[  334.542169]  ? smp_apic_timer_interrupt+0xa4/0x230
[  334.542172]  ? apic_timer_interrupt+0xf/0x20
[  334.542173]  </IRQ>
[  334.542182]  ? cpuidle_enter_state+0xc9/0x480
[  334.542185]  ? cpuidle_enter_state+0xc2/0x480
[  334.542191]  ? do_idle+0x1ec/0x280
[  334.542196]  ? cpu_startup_entry+0x19/0x20
[  334.542200]  ? start_secondary+0x1b3/0x200
[  334.542204]  ? secondary_startup_64+0xa4/0xb0
[  334.542211] Modules linked in: rpcsec_gss_krb5 auth_rpcgss nfsv4 dns_res=
olver nfs lockd grace fscache amd64_edac_mod edac_mce_amd kvm_amd kvm irqby=
pass crct10dif_pclmul crc32_pclmul snd_hda_codec_hdmi joydev ghash_clmulni_=
intel snd_hda_intel snd_hda_codec snd_hda_core snd_hwdep snd_pcm snd_timer =
ipmi_ssif snd soundcore sp5100_tco i2c_piix4 ccp k10temp ipmi_si ipmi_devin=
tf ipmi_msghandler pcc_cpufreq acpi_cpufreq sunrpc vfat fat xfs libcrc32c a=
mdgpu chash amd_iommu_v2 gpu_sched ast crc32c_intel ttm igb drm_kms_helper =
nvme nvme_core dca drm i2c_algo_bit pinctrl_amd jailhouse(OE) fuse
[  334.542271] CR2: 0000000000000000
[  334.542356] ---[ end trace 3b29a267a344a2ea ]---


------=_Part_2078_1806622792.1561468871432--
