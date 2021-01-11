Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWUP6H7QKGQEPGI6YHY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 16ACD2F127B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 13:43:07 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id 25sf11063958lft.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 Jan 2021 04:43:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1610368986; cv=pass;
        d=google.com; s=arc-20160816;
        b=IfYSkZEErZgxbS3lUOiQ4/Y/hFc2vP575L7HxZEEVlYSBX/yLzs7REE4+NBcAhTOKy
         Wah2xygGeYXT4n1VsghCUeZJgQ+4Ih+DlXK7EV1D3OXoXglTJ4IdPGgOldt3UlHtC2TM
         BFBTzp3+RBlSdAa0ATKicI96L3xbEpr+NhBaR7tUvllmlfnnntjS3gVgxs1lbeU1JDvl
         Vmr5q8jM84GKF+lfWuQbt4qTmwiLVcqZyFBls4THH+azO8mieduibyWIiVd+xWTOcbyz
         2IXY58h3Mt0pmEMkH4N9QvshBldnjG/F/SxlqHlmeTHrltgBDCwxlQztHub7efZmNId8
         nL7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=SRbAMHm47uEP8Ik7pzmOs4MupOfXI9rqFSNZ3Fd36ts=;
        b=bDdGhkzi3yGdxru1cn1zdW7alFWJnqULLHx4k+fGiXtiU/tD2KpqsRiNv6Ll6uOrjP
         nKyOimubczBy4ElJhEVaHpXnLTGiTIfAqpLQtxC0ImKcVQTe4itN+CFTib2byMTtRve+
         6/RxUSAWOBprKO8UQT2s/wWgy4gbY4w+dsjNrUW1LO2vbZAZf1REf6UprgD9nexqO6au
         ueoOjNjOo26dBBDZOPHBU/ocKVULtzdXETifEsnhSDKzR6zIdUWz/6SLSJzh6WwHnBzR
         pAYOp9pq8jSiCwMMFdbsc/dw8z7cQsH1sY+JcJSKPxMxk5VIoJNBRV5zwmgS6FU6doDC
         YUFg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=k0tWNBWY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SRbAMHm47uEP8Ik7pzmOs4MupOfXI9rqFSNZ3Fd36ts=;
        b=mUCx0pGO6dCfVr2g/qBkHwiptD0tuEy+5eMpIDtUGKxybqUPvlXW/DO1Bz8xzeg4an
         IrBCKbKnUktEjH2TDR2Qy99kSqUyi4obQR9vUYERYDmASuymtVPqsczBWvnRBVjgZWKH
         mNLF3HWjBoOcS1zKqoGQfuJgN0Ffomxs1FXSPBnAqf7u+hn3FAtL1NiEaP4Xzc5JB4Uq
         uzYJP/jlMirhlCjsaCbEjWwqTHXXhglTiVLXCtP1MkozQUK8szkVGE4eKIHki3iID8xR
         7AJVAcfPZHWT7tTR+4vgOoauqrlRPdoq414kwhsJEM36Zo6MmovjAvM7FEldtzjv+gJc
         kNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SRbAMHm47uEP8Ik7pzmOs4MupOfXI9rqFSNZ3Fd36ts=;
        b=S7TMLwcW+/j+wIt+hfHXDspfcpFzv0sQSypd4t/Avg2CLtUK0TiX1rIU3UJgPvT1lT
         A+JEE3c56orIdBnW7omuAMSdOc/IQRAHVTRYRXdtWh9D5qmoxrTaMsH+XRJlilNRmi2w
         nznLkfgkByovoZD+JETlXvNShrlhtcp70gWiJRtk50o5yFPsGAYuzf4yhz5AFkkevky9
         MwdTU/rQZepv7gK+W4GhXTb5flsKTHg5MOiX+KQlU8JevOCLzbJp1nKrdfDYiYZ4VKel
         PRUyUUuX4hebOF6csSrlfY25Xtuvw0DiM9mDQRuvCRbGH92wSe5lgdmc0MvgHEvMAnSs
         VFZQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533QBaAM36K08K/7eOEYaqNa5F6HXnSVpOYPX0tbPyQW1x9u6cfk
	UFsksYulBMqobfNSfsI/N/s=
X-Google-Smtp-Source: ABdhPJyJuhhBm51CyMbFD+6dlSYNlPTywFdNTd9NJlY1CYsca28Ypk0BH5OiXbSfjRjIelVr8cuQPQ==
X-Received: by 2002:a05:651c:217:: with SMTP id y23mr6992926ljn.247.1610368986549;
        Mon, 11 Jan 2021 04:43:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3001:: with SMTP id w1ls2921275ljw.3.gmail; Mon, 11 Jan
 2021 04:43:05 -0800 (PST)
X-Received: by 2002:a2e:a407:: with SMTP id p7mr7170883ljn.78.1610368985570;
        Mon, 11 Jan 2021 04:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610368985; cv=none;
        d=google.com; s=arc-20160816;
        b=WkJQ7b+0NESJk/o1ePjRDSgAV4sY4exVbfBXzLsPyvjVPg8SNgjrToHw9b5KZaYKj+
         nAMpquzgvfaRSJD6SWj+Yq1MZj9JsFlKV2De3al9LqKl4gGc/KY8f+iE++DW8TxCrfbL
         PQVo9D5MyeF1rMV7cpgQyDiLxVjQm2L/PROjRhSVQ2WKCvP78pUXRBVNKts4EX+NtCn2
         J2srwSmDGdJY8g6heww1gsFmfpgFNbGXezwHHJqdasfeO0NoADnaq2BchSx2T1PfliG0
         ZXmv/O4x6Mjfwhfk91+Y1yyZURY5U9wVOASWFUgIEcQELMJFNc0sITBlAuK276uTa60Z
         gaiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=JKu7Ua+FSqnSjdG9QhWjo0bZ6cCbSesd+7+HMma0mTE=;
        b=WPODupEmIJHJ9aIpr0sDZJsgdBgnS73+BXqTvsw5goXFUxAz7Q8t73HyIiIjQ5LeyN
         SHv5ui38rFNj9gdXedMbv9pwCV9tnKik2Y2cF9Mvu8Y2hqNJPNkzGF7viUhmXPJlFB34
         jDawLTI9LzmgZSu3LGK2zbSoLnaHFLqbflEPIHNX8b4NNM7TVQHa5AWgUbAqIcsJQgIY
         aEZccXN7d2kwiZg85nfN/hTn8P2A71o51OlaY0tcXv9SlGjRww/MTYUDNxV2piMynbZp
         sTbzpFWBAwp/DSL8onek2/e9V6kTD2h8Y5T5ompIQ3kr0A6rI4g5QKdGHSWj6/yLPCEz
         GjbQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=k0tWNBWY;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id c15si948889ljn.0.2021.01.11.04.43.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Jan 2021 04:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DDtfJ6dntzyVG;
	Mon, 11 Jan 2021 13:43:04 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.873
X-Spam-Level: 
X-Spam-Status: No, score=-2.873 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001,
	LRZ_ENVFROM_FROM_MATCH=0.001, LRZ_ENVFROM_TUM_S=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001, LRZ_UA_MOZ=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001, NICE_REPLY_A=-0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id WERTOvT0GukN; Mon, 11 Jan 2021 13:43:04 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DDtfH6kCMzySf;
	Mon, 11 Jan 2021 13:43:03 +0100 (CET)
Subject: Re: [PATCH 02/14] hypervisor, driver, archs: add basic empty
 infrastructure for coloring
To: Jan Kiszka <jan.kiszka@siemens.com>, jailhouse-dev@googlegroups.com
Cc: marco.solieri@unimore.it, rmancuso@bu.edu, lucmiccio@gmail.com
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
 <20201123204613.252563-3-andrea.bastoni@tum.de>
 <8eb7c1ca-ae63-3c38-baeb-ea121dc12251@siemens.com>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <0c619e2e-7194-bac0-013c-32c3eea9765f@tum.de>
Date: Mon, 11 Jan 2021 13:43:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <8eb7c1ca-ae63-3c38-baeb-ea121dc12251@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=k0tWNBWY;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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



On 11/01/2021 12:44, Jan Kiszka wrote:
> On 23.11.20 21:46, Andrea Bastoni wrote:
>> Add generic architecture API layer needed to implement coloring:
>>
>> arch_color_map_memory_region()   // cell_create
>> arch_color_unmap_memory_region() // cell_destroy
>> arch_color_remap_to_root()       // cell_load
>> arch_color_unmap_from_root()     // cell_start
>>
>> Currently only arm64 will implement the API. arm32 could be also a
>> possible target for coloring. x86 already features CAT support.
>>
>> ARM architectures also implement:
>>
>> arm_color_dcache_flush_memory_region()  // range flushing
>> arm_color_init()                        // hook for the initialization of coloring
>>
>> The architecture operations implement functionalities that consider the
>> color assigned to a memory region when performing the VA <-> PA
>> translation.
>>
>> This patch uses a reserved memory region as mapping-scratchpad to
>> perform coloring during the load operations. The mapping is removed
>> during the start operation. A later patch makes the start of the memory
>> region configurable.
>>
>> Refer to the Documentation/cache-coloring.md for an introduction of the
>> coloring isolation software techniques.
>>
>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>> ---
>>  driver/cell.c                                 | 10 +++-
>>  .../arch/arm-common/include/asm/dcaches.h     |  8 +++
>>  hypervisor/arch/arm-common/mmu_cell.c         | 52 ++++++++++------
>>  hypervisor/arch/arm/include/asm/coloring.h    | 59 +++++++++++++++++++
>>  hypervisor/arch/arm64/include/asm/coloring.h  | 59 +++++++++++++++++++
>>  hypervisor/arch/arm64/setup.c                 |  3 +
>>  hypervisor/arch/x86/include/asm/coloring.h    | 45 ++++++++++++++
>>  hypervisor/control.c                          | 56 ++++++++++++------
>>  hypervisor/include/jailhouse/control.h        |  7 +++
>>  include/jailhouse/cell-config.h               |  6 ++
>>  10 files changed, 267 insertions(+), 38 deletions(-)
>>  create mode 100644 hypervisor/arch/arm/include/asm/coloring.h
>>  create mode 100644 hypervisor/arch/arm64/include/asm/coloring.h
>>  create mode 100644 hypervisor/arch/x86/include/asm/coloring.h
>>
> 
> ...
> 
>> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
>> index 472cb4bb..e62e692b 100644
>> --- a/include/jailhouse/cell-config.h
>> +++ b/include/jailhouse/cell-config.h
>> @@ -115,6 +115,7 @@ struct jailhouse_cell_desc {
>>  #define JAILHOUSE_MEM_LOADABLE		0x0040
>>  #define JAILHOUSE_MEM_ROOTSHARED	0x0080
>>  #define JAILHOUSE_MEM_NO_HUGEPAGES	0x0100
>> +#define JAILHOUSE_MEM_COLORED		0x0200
>>  #define JAILHOUSE_MEM_IO_UNALIGNED	0x8000
>>  #define JAILHOUSE_MEM_IO_WIDTH_SHIFT	16 /* uses bits 16..19 */
>>  #define JAILHOUSE_MEM_IO_8		(1 << JAILHOUSE_MEM_IO_WIDTH_SHIFT)
>> @@ -127,8 +128,13 @@ struct jailhouse_memory {
>>  	__u64 virt_start;
>>  	__u64 size;
>>  	__u64 flags;
>> +	/* only meaningful with JAILHOUSE_MEM_COLORED */
>> +	size_t colors;
> 
> Wrong type. Needs to be one that specifies the width in bits.

Right. Since only arm64 supports coloring, I wanted to keep the compilation for
arm32 simpler. But yes, it should be changed to u64.

> This needs to be bitmask, one bit per possibly color, right? Do we need
> 64, or even 128? Or would 32 suffice in practice? In the latter case, we
> could consider shrinking flags to 32 bits.

Good point. We discussed it in the past (e.g., the version with next_colored()
and next_color() used 128 bits). But we went down to 64 bits max (1 bit per
color) because it should cover all the practical cases for the embedded market.

The expectation is that when / if there's the need to have more colors for the
embedded market, hardware solutions like MPAM will be available.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0c619e2e-7194-bac0-013c-32c3eea9765f%40tum.de.
