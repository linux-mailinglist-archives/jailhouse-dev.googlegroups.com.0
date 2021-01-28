Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBLHXZKAAMGQEWXASRXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x640.google.com (mail-ej1-x640.google.com [IPv6:2a00:1450:4864:20::640])
	by mail.lfdr.de (Postfix) with ESMTPS id B4D6C307701
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 14:27:08 +0100 (CET)
Received: by mail-ej1-x640.google.com with SMTP id b18sf2158785ejz.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 28 Jan 2021 05:27:08 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611840428; cv=pass;
        d=google.com; s=arc-20160816;
        b=hGKeVan6CPZz+ouuab53FG1U6AcurSEkHwy5Y1RouStdTO1IdZmugG0pn6URoVq/o7
         nndwVZx1CBO1SNFwMdAxtO08ycBrP1A9qgbSqGkU7sW7rrb+8nf/i0PaFRy2As6HesSS
         Eh9Q6bFFey8Debj+wANkSA6Dach2hfJshUlK4lQYUAGvC7EZkEmQ4rsDyk4KKrVcwKI7
         V3eZMn+TkjGUjhMDgmpL7EZLBWu+hWPuuH2kf+g+k14nZ3KhkSUZt4RGEG0PE1rKhOpZ
         PozuBBRxeGFbCyxg5yZUl5zYG8IGpZh/zsgYKioi+9UN9UGlPB5zUbEX4NPWCFRFzSXm
         4SIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=LaSsnB6GNpRHYTF5j/fsV60Sii0DOwmunazHlOzwf2c=;
        b=I/yedZwhJE2N7i6ruu7DS3g8HUxRsecErG5lWbhAJQ5csMEzFABtjaNJY/zK4Yc92f
         rPoz4nH1Ah2M3LUkU8vciYjCoL8LqE1RpNQOrZd/IEtR6AYlPfjLdVaMQi8v3ffjXRIR
         R/BWUwDTwjiSwrRb8r2FBgMfa7RcQChS+oEX62dnLsmg/k0xsL3+nz6WTREesWRa3nb6
         eZ5QvZ+GEEkM7yu2Oq/tT6uBgJBCE8rhxeRb+53L2E2pU+iLSEcwsRPTAKtFBG4me+ke
         JS2tY6f/YP40GmCFmpqh2yazhMgC12QWtqcNPCQzY+ug/MIUqmJtW0xeFanoF8999VFj
         u9cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZy5Lzd5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LaSsnB6GNpRHYTF5j/fsV60Sii0DOwmunazHlOzwf2c=;
        b=sKBdM87S57sgmm5Wy2zOjpBLM8qYhQ3/X2gNFkkufPWJa1shmwot2Sj4SAjPhCvadR
         KBgCq4xsGuUTCNjriEEkL5W7gT+ZQPxhZBqWjEOixDgLvah4K2QMVVV2qHZgZa6NNwXS
         gikaYagaKN8mDuTw5YyiIKAgcUEN2CjH5GmmL1nQ6Fle2+R1M9g6XmV3WraqX6BfJQry
         wqQC08l20V4yenm1Vt/z/ihRIk2LucREBxFodfM2ld/s6MSzM2ZNArYadaSSCDU86hJ7
         RoNgsjk+kHbwF8KA+Bme7zoCUMmF5ZixM2ZEdyu9YzIUhSBx+2FDi4KyNPF5cU9WIBDH
         CksQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LaSsnB6GNpRHYTF5j/fsV60Sii0DOwmunazHlOzwf2c=;
        b=giA7cLCQ7yiZ4qBMzud83XzsbcgIQBhvW1eqYuBthL3MEB+Prq5uNOJK5981nXUwAZ
         pUl400am5h7JWbq6RXQM/2t843Fs/9KyYm8NRxMhtnaczFeVaUYR0uMwAodwA7v9jWZC
         L4Q0FZ4Zr6YJfyTy2etMmqhsxsPHjDQi5p/iZuCRAUNbQ4Zbj4SignnvMxr16h6NqgOU
         vKzSJrqs+esdb7TSEf59BTfCRnpZrepvfyu7J63Vw0B+I9qMEdT9xaVVuUZlR0gL2ArE
         ujDrZ4IX9cJO00m+D3S02VIYXoRnHFYcYbT7eGYh2S2C1rjrJJM13oQUfVoPNHa7a5Q1
         hoBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531d13sbZAlmeEiCd02qa9a4EahrOFJQ9usA+v9mz1rF1gzD16F8
	u6ExYNfLimAe3M8wT+bmoWk=
X-Google-Smtp-Source: ABdhPJxPhGwS78qvJWAUDie1UG6ZZaeBsUdmuz8X04S49B5108OoGPgU573muEEmb1OPF84qXqxVyQ==
X-Received: by 2002:a17:906:c78b:: with SMTP id cw11mr11181523ejb.448.1611840428410;
        Thu, 28 Jan 2021 05:27:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:5245:: with SMTP id y5ls2795111ejm.7.gmail; Thu, 28
 Jan 2021 05:27:07 -0800 (PST)
X-Received: by 2002:a17:906:9381:: with SMTP id l1mr11612737ejx.433.1611840427488;
        Thu, 28 Jan 2021 05:27:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611840427; cv=none;
        d=google.com; s=arc-20160816;
        b=PUJZDuEjR6+0Ir3S8uSpeb36rjVRwSZj6xXhGA2R7v6guqjwBeyK06TgR4/uyOP5rK
         eZ6h/Iur+NIUuuzbVd3pcU83MtAcGs6qVR02Ao8qcbRza9/C/3wyBzzAv6AsNfFJ9m7v
         IZmzpA1RAczYisUIg5hk0Uvn+Ab6SPixYGP4MbtwyCBpYVa2bR3TODsi5K7Ylnn8jBIO
         atK3gPrs5uS+DXlcw3RgZVB9uZqOJ+loV88epy529Spjw8DXe8ViqZRq58xfEk+oFKVg
         A1NxjuvOczwtnG0+YPXUzIKEe7pOt9Qwi4hdIerxwUl3LSsHrGXQF7+Aa1HFcAf6W4Pv
         5jHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=1Iw79e1QNJSVSPH2yx+oLkuQc4kfQfYNG1JIhgYQhnw=;
        b=YTo1O89APDfAed73ecagu06D3KUTqnu5TTc5Fn0+R7BOPWJglZE5VzYQZ73QF1IwW4
         SyKt6JLRNpyzRabQY7WbCUrTofMop68mDkb3kDo2eaL5mZltoFFb8Wolgqhqo/e6ZYSy
         XbQho77F3ffe9v231SWs5ESkkiWIs6ry+ZYaMjupE/FeoIGaNCH/kB0axRCqBboCQCDD
         R1OZAKYCHW0jkiLc6kjiPvpnkKPVoQLOAeREU+jD59IGPYEnx8SRPjTw/1mGo3SId38c
         IGiZyh9UDXkzu3lEZMzowwPVWcWdpQB/v93YYWAsy2cvaniX8IKV/kg/XAAPXSf857MZ
         WaLg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZy5Lzd5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id k20si329587edx.3.2021.01.28.05.27.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jan 2021 05:27:07 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4DRLqH04JMzxxP;
	Thu, 28 Jan 2021 14:27:07 +0100 (CET)
Received: from [192.168.179.73] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Thu, 28 Jan
 2021 14:27:06 +0100
Subject: Re: [EXT] RE: MMIO APEI issues
To: Bram Hooimeijer <bram.hooimeijer@prodrive-technologies.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <AS8PR02MB6663AEA8ADC5EE631F76496BB6BB0@AS8PR02MB6663.eurprd02.prod.outlook.com>
 <3570d529-ff10-da30-9b23-384a8b30cfe1@oth-regensburg.de>
 <AS8PR02MB66636F44464F9BEC17A8AAFEB6BA9@AS8PR02MB6663.eurprd02.prod.outlook.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <2b5b52c8-58c1-7368-52f5-9f62385516cf@oth-regensburg.de>
Date: Thu, 28 Jan 2021 14:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <AS8PR02MB66636F44464F9BEC17A8AAFEB6BA9@AS8PR02MB6663.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=rZy5Lzd5;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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



On 28/01/2021 14:15, Bram Hooimeijer wrote:
>> Hi Bram,
>>
>> On 27/01/2021 11:46, Bram Hooimeijer wrote:
>>> Dear Jailhouse community,
>>>
>>> Currently I am experiencing issues with the MMIO virtualization in
>> Jailhouse, which interacts with the BIOS. I am hoping any of you can shed
>> some light on the issue:
>>>
>>> Jailhouse reports the following after running for some while:
>>>> FATAL: unable to get MMIO instruction
>>
>> Where does RIP point to?
> 
> I don't know how to derive this exactly. The issue arrives from root-cell linux, so the RIP is not in the cell binary or in jailhouse. 
> 
>>
>>>
>>> The region listed has previously reported illegal MMIO accesses. These
>> have been resolved by adding the region to the system config. This requires
>> all sub-64 access widths, as the region is apparently byte accessed. The BIOS
>> vendor has indicated that this region implements APEI according to the ACPI
>> specification.
>>
>> Could you please try the following region:
>> {
>> 		.phys_start = 0x86dff000,
>> 		.virt_start = 0x86dff000,
>> 		.size =       0x0b700000,
>> 		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>> 			 JAILHOUSE_MEM_EXECUTE |
>> JAILHOUSE_MEM_DMA },
>>
>> the size 0x0b700000 will make the page aligned, and the hypervisor doesn't
>> need to trap. In that case, JH_MEM_IO_{8,16,32,64} is not required.
> 
> This seems to solve the issue for now.

Great.

> As I understand: if the region is page-aligned, access is possible without involving the hypervisor as it is known up front that this access is the cell its own region. 

Yes, {phys,virt}_start and size need to be page-aligned, then no
hypervison intervention is required.

> If the region is not page aligned, an access should involve the hypervisor to prevent access to the page outside the reserved region. 

Exactly, we call that subpaging. You need that if a single physical page
holds, e.g., two devices that need to be assigned to different cells.
The hypervisor will moderate the access, and prevent accesses outside
the cell's scope.

And what happened in your case: The hypervisor needs to decode the
instruction that caused the access. We only support decoding of the most
frequent instructions that are commonly used for MMIO access.

  Ralf

> 
> Thanks for the help! 
> Bram 
> 
>>
>> Thanks
>>   Ralf
>>
>>
>>>
>>> By adding some printk() statements to the hypervisor, I could derive where
>> the error exactly originates. Apparently the function ctx_update(&ctx, &pc,
>> 0, pg_structs) returns null. Jan, could you shed any light on what this function
>> does? Could it be that the paging structs for the APEI interface are incorrect?
>>>
>>> All snippets are listed below. The system runs Linux Kernel 5.4.73, from
>> Ubuntu 20.04 LTS, modified to remove kernel RDT support (conflicts with
>> Jailhouse). Any directions are welcome!
>>>
>>> Many thanks,
>>>
>>> Kind regards,
>>>
>>> Bram Hooimeijer
>>>
>>> Issue reported over ipmi (see attached log.txt):
>>>> FATAL: unable to get MMIO instruction
>>>> FATAL: Invalid MMIO/RAM read, addr: 0x00000000870a9998 size: 0
>>>> RIP: 0xfffffffeec8a9998 RSP: 0xffffb52400177d78 FLAGS: 10282
>>>> RAX: 0x0000000000000246 RBX: 0xffffb5240dc8fe50 RCX:
>>>> 0xffff9cef966f4000
>>>> RDX: 0xffff9cef966f4400 RSI: 0xffff9cef966f4000 RDI:
>>>> 0xfffffffeec8a9998
>>>> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
>>>> CR0: 0x0000000080050033 CR3: 0x0000002ff2842001 CR4:
>>>> 0x00000000007626f0
>>>> EFER: 0x0000000000000d01
>>>> Parking CPU 0 (Cell: "RootCell")
>>>
>>> Modification required to root cell configuration for APEI ERST region
>>> (see attached sysconfig_dual256M.c)
>>>> {
>>>> 	.phys_start = 0x86dff000,
>>>> 	.virt_start = 0x86dff000,
>>>> 	.size =       0x0b6fffff,
>>>> 	.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>>> 		JAILHOUSE_MEM_IO | JAILHOUSE_MEM_IO_UNALIGNED |
>>>> 		JAILHOUSE_MEM_ROOTSHARED | JAILHOUSE_MEM_IO_8 |
>>>> 		JAILHOUSE_MEM_IO_16 | JAILHOUSE_MEM_IO_32 |
>>>> 		JAILHOUSE_MEM_IO_64 | JAILHOUSE_MEM_EXECUTE },
>>>
>>> Point of failure (see hypervisor/arch/x86/mmio.c:108--121)
>>>> struct mmio_instruction  x86_mmio_parse(const struct
>>>> guest_paging_structures *pg_structs, bool is_write) {
>>>>           struct parse_context ctx = { .remaining = X86_MAX_INST_LEN,
>>>>                                                             .count = 1 };
>>>>           union registers *guest_regs = &this_cpu_data()->guest_regs;
>>>>           struct mmio_instruction inst = { 0 };
>>>>           u64 pc = vcpu_vendor_get_rip();
>>>>           unsigned int n, skip_len = 0;
>>>>           union opcode op[4] = { };
>>>>
>>>>           if (!ctx_update(&ctx, &pc, 0, pg_structs)){
>>>>                   printk("ctx update failed\n");
>> 		<<--- FAILS HERE.
>>>>                   goto error_noinst;
>>>>           }
>>>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/2b5b52c8-58c1-7368-52f5-9f62385516cf%40oth-regensburg.de.
