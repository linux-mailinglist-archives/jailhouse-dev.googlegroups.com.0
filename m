Return-Path: <jailhouse-dev+bncBCFZVI4UTIEBBLFPZDUAKGQE6OA4JVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x238.google.com (mail-oi1-x238.google.com [IPv6:2607:f8b0:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BC1154F2A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 14:46:38 +0200 (CEST)
Received: by mail-oi1-x238.google.com with SMTP id j22sf6865634oib.7
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Jun 2019 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:in-reply-to:references:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dfq3bTk6CCxgK0GZwd3DXYQPfXHWlcN3M4+4pJMz/Rk=;
        b=P4VtFGaeKadeJZp3GGbaTEpTyeKZmZVHL8hTGyX3KCEe66oul+9aRTBNACaZsTaJLd
         ugrD49tzz1Hv/ghoEu/dI3IpLyLu1wccOQseVwKqu7nnjFb8cCtstwD7k2PNcLYSdXTE
         rm+5djkbcPwy/9UwaicMv21A64ahm2QjAdlFJnoVkay3KsEDfO1ChBvmhnW33LtlY/BD
         EdB45PBi09DYKHiHqf2wdTIzG5qG72TI/XXqDc4jadqX+1yRpDclu/Bdy0qoBsT52BWz
         CuGPtAR2u+JNZDr08StqnLXk6v0pnYm94L/Pcqks6AYwX4mkSBT0zoa9FnLa+SBIKxqn
         hC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:in-reply-to
         :references:subject:mime-version:x-original-sender:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dfq3bTk6CCxgK0GZwd3DXYQPfXHWlcN3M4+4pJMz/Rk=;
        b=Q8wKs6jnWtope7ExIDJDZSMMUVFt9iT67Z2ESOhPSsK4X1pGMxKlDDlZio+aGyt5Bf
         TbyWnI7dPhpk1bSi9j5Fws4bDtNvvZNnauic/CfE8iMm2sCJZgSx0seS1JqUrD84eJ9d
         WBzE9dxmyqjXst1TJrvYVmmHlyWzmoQGGx8GXr3oHBQ21qM7qw0CV7SeGG8Ozc1u2Tq4
         R3ajW31bLOLHYWDXVgEgZufFuagJW7FRElkE6o+EXYT0JAiR3/zgUPfayCyaSSPERENl
         h4wX6BQCCjPzABDr8jHjqyGCjqgZRw/iTCkpgK/8b2/xgQTbQvk7SvdRTWvGX1R0dE51
         gnGw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWRnqsMFqJylSzIavfujip66UozzzHmiCNEMc7nlIb5Pxe3+do9
	ewhQyEQ7ZxP6+CE3ifPPj+Y=
X-Google-Smtp-Source: APXvYqyr/wu9QmKzsBKBl5NbyYGj7FlRd6itFGMxnffDgE2oV77KoypaoBganbQHrIuuzLSUSGPSNg==
X-Received: by 2002:a9d:7a46:: with SMTP id z6mr27475572otm.2.1561466797046;
        Tue, 25 Jun 2019 05:46:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:60d7:: with SMTP id b23ls569695otk.14.gmail; Tue, 25 Jun
 2019 05:46:36 -0700 (PDT)
X-Received: by 2002:a9d:3f62:: with SMTP id m89mr18998085otc.44.1561466796370;
        Tue, 25 Jun 2019 05:46:36 -0700 (PDT)
Date: Tue, 25 Jun 2019 05:46:35 -0700 (PDT)
From: Adam Przybylski <adamprz@gmx.de>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <27b260ce-0dcd-4019-8dc5-c757500422c1@googlegroups.com>
In-Reply-To: <e0d7a082-bb03-195a-d146-4ba627a93be4@oth-regensburg.de>
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
Subject: Re: Jailhouse enable hangs on AMD EPYC 7351P
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2182_1227262276.1561466795798"
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

------=_Part_2182_1227262276.1561466795798
Content-Type: text/plain; charset="UTF-8"

Am Dienstag, 25. Juni 2019 14:14:41 UTC+2 schrieb Ralf Ramsauer:
> On 6/25/19 1:31 PM, Adam Przybylski wrote:
> > Am Dienstag, 25. Juni 2019 12:10:03 UTC+2 schrieb Ralf Ramsauer:
> >> Hi,
> >>
> >> On 6/25/19 9:38 AM, Adam Przybylski wrote:
> >>> Am Sonntag, 23. Juni 2019 18:32:37 UTC+2 schrieb Henning Schild:
> >>>> Am Fri, 21 Jun 2019 07:18:14 -0700
> >>>> schrieb Adam Przybylski:
> >>>>
> >>>>> Am Freitag, 21. Juni 2019 15:54:15 UTC+2 schrieb Henning Schild:
> >>>>>> Am Fri, 21 Jun 2019 14:51:30 +0200
> >>>>>> schrieb Ralf Ramsauer:
> >>>>>>   
> >>>>>>> Hi,
> >>>>>>>
> >>>>>>> On 6/21/19 2:22 PM, Valentine Sinitsyn wrote:  
> >>>>>>>> Hi Adam,
> >>>>>>>>
> >>>>>>>> On 21.06.2019 17:16, Adam Przybylski wrote:    
> >>>>>>>>> Dear Jailhouse Community,
> >>>>>>>>>
> >>>>>>>>> I am trying to enabled Jailhouse on the AMD EPYC 7351P 16-Core
> >>>>>>>>> Processor. Unfortunately the system hangs after I execute
> >>>>>>>>> "jailhouse enable sysconfig.cell".
> >>>>>>>>>
> >>>>>>>>> Do you have any hint how to debug and instrument this issue?
> >>>>>>>>>
> >>>>>>>>> Any kind of help is appreciated.
> >>>>>>>>>
> >>>>>>>>> Attached you can find the jailhouse logs, processor info, and
> >>>>>>>>> sysconfig.c.
> >>>>>>>>>
> >>>>>>>>> Looking forward to hear from you.    
> >>>>>>>> I'd say the following line is the culprit:
> >>>>>>>>     
> >>>>>>>>> FATAL: Invalid PIO read, port: 814 size: 1    
> >>>>>>>
> >>>>>>> Could you please attach /proc/ioports? This will tell us the
> >>>>>>> secret behind Port 814.  
> >>>>>>
> >>>>>> Not always, the driver doing that has to be so friendly to register
> >>>>>> the region.
> >>>>>>   
> >>>>>>>>
> >>>>>>>> As a quick fix, you may grant your root cell access to all I/O
> >>>>>>>> ports and see if it helps.    
> >>>>>>>
> >>>>>>> Allowing access will suppress the symptoms, yet we should
> >>>>>>> investigate its cause. Depending on the semantics of Port 819, to
> >>>>>>> allow access might have unintended side effects.
> >>>>>>>
> >>>>>>> You could also try to disassemble your kernel (objdump -d
> >>>>>>> vmlinux) and check what function hides behind the instruction
> >>>>>>> pointer at the moment of the crash 0xffffffffa4ac3114.  
> >>>>>>
> >>>>>> A look in the System.map can also answer that question. On a distro
> >>>>>> that will be ready to read somewhere in /boot/.
> >>>>>>
> >>>>>> Henning
> >>>>>>   
> >>>>>>>   Ralf
> >>>>>>>   
> >>>>>>>>
> >>>>>>>> Best,
> >>>>>>>> Valentine
> >>>>>>>>     
> >>>>>>>>>
> >>>>>>>>> Kind regards,
> >>>>>>>>> Adam Przybylski
> >>>>>>>>>    
> >>>>>>>>     
> >>>>>>>  
> >>>>>
> >>>>> Hi,
> >>>>>
> >>>>> I looked up the function which gets executed in the Kernel. It's
> >>>>> "acpi_idle_do_entry".
> >>>>
> >>>> Well now you are back to what Valentine said. Open up those ports one
> >>>> by one, until the problem goes away. The alternative is to disable the
> >>>> drivers in the root-linux. In the case of ACPI i.e. acpi=off as kernel
> >>>> parameter, but you probably do not want that.
> >>>>
> >>>> Note that whatever you allow might cause weaker isolation, in this case
> >>>> maybe real-time related.
> >>>>
> >>>> Henning
> >>>>
> >>>>> Adam
> >>>>>
> >>>
> >>> Hi,
> >>>
> >>> after allowing the access to 0x800-0x89f IO ports the issue with PIO read is solved.
> >>>
> >>> Now I am facing issues with IOMMU/RAM, NMI IPI, MSR. Please see attached log.
> >>
> >> You can again look at the system.map to find the code behind the MSR access.
> >>
> >> The rest can probably solved by consolidating some non-page aligned
> >> spreaded memory regions in your config -- could you please attach the
> >> output of jailhouse config collect? It should contain all data that is
> >> relevant for debugging.
> >>
> >> Thanks
> >>   Ralf
> >>
> >>>
> >>> Any idea how to debug this?
> >>>
> >>> Adam
> >>>
> > 
> > Hi,
> > 
> > attached the jailhouse config collect output.
> 
> Please try the attached config on next.
> 
> You can use diff to see what I changed: I consolidated some memory
> regions to one large, contiguous region. Should at least solve the MMIO
> traps and the unknown instruction error.
> 
> Remains the MSR access. What code is behind the instruction pointer?
> 
> Thanks
>   Ralf
> 
> > 
> > Adam
> >

Hi,

the attached config works fine regarding the IOMMU/RAM accesses. Thank you!

The function behind the RIP is native_read_msr_safe.

Adam

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/27b260ce-0dcd-4019-8dc5-c757500422c1%40googlegroups.com.
For more options, visit https://groups.google.com/d/optout.

------=_Part_2182_1227262276.1561466795798--
