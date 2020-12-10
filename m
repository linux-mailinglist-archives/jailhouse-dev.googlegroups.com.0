Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBMPCZD7AKGQEEWWPYCQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EDFE2D5DC2
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 15:31:15 +0100 (CET)
Received: by mail-pf1-x43b.google.com with SMTP id x21sf849918pff.14
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 06:31:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607610674; cv=pass;
        d=google.com; s=arc-20160816;
        b=RX0/ItxaCwF4TX7+jO/5deHFkcfvoZtevGL8kXKDDzd7cF0oNN1Bu3gKzPp5PRSwi+
         gV88HJFWWpAaLTyW743fy0gflm0pAhJWGsLfgyvpfhCdDsxJ/KhaLNg2EtC1SQpR5iRQ
         eY4SME7gYzXmN6V4H1ZTkPkrEO3mKAlQt47ayQ9J0NzBhGddBjWjaRGgfz5eUKqNhetM
         Lnz/2jh5RucByy35jvMft634x0pzmd2MXJ7E1Cli+U4d1AjZA4ow07GrZL5ftxPgK7OQ
         KV6ZUCzjPj0xyvyLzzxwzT3mBG2NrXm6jj9M8rvLouN1Fs80ALQTnAKPZVrXV54zZgHI
         kJLA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=7y5te1W4rxmlJlOAzQMgZ/XefH8EhRktzOdGhrXsskM=;
        b=mJYsSauzPmDoq4YFbhkHv/pHazVbZqpqihTgzcermYIywiC1/kJZCIxEQhQInbsS1S
         U7WAyQguyKs4U9sPd/LoTYLcjAdnWSArTDdneXxfBJ2nGHqaICGZw6CRhdHT6ectsi81
         ba+9jYVUSFTGZgwBmJC7+iusOJelndnZwafKULI6SF2G1+wRvoLQfdfgl0DQJbm7TYsF
         5Pmn8zXP+6EHQqueq/Iv1nYwxahhYv9fEPN3jQyV04KwzGzEqP+W/3L+VR/gSqr9ySKS
         8H+SV/VOEQxNMRdYXfD2+BN/WMSRQt74FHmrea8xi3RP4m09ghGzAkrhx+okyd41U7XP
         QHsA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TelJLcfW;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=7y5te1W4rxmlJlOAzQMgZ/XefH8EhRktzOdGhrXsskM=;
        b=OtAlM283Sw4SyTRLf4I6fkGctXLciacEMP67gwTIN0dTrTBhTxCzTYy/dvGYPFFGq+
         hmqfdT4SW1HH4WNfFvV0qRDuIZe8JQyobm2QvQ1ZmYV7gaHzd07OrYq2ZnUW5a5gRyFI
         xJJilQpLXkgOLq14c9iiWB+q3I/CCeKHyalArVQYwFDo2QLxY24kVb3mMoXLI09qSHUU
         rbD3tRjpL3BAfWPYoIpxYdbuClPSUdUkk7NzazD1QHHS6o6hFiOXyVGb4txis2Ma3sYC
         gQpXqi+CoNN7LdpzNNhp+Hin05iL7Ofc82tyJ8YLm6SHVoTEmWj9SKPjpMHs67sAcZ00
         8sCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=7y5te1W4rxmlJlOAzQMgZ/XefH8EhRktzOdGhrXsskM=;
        b=j8zV39aLxWSTGND+G2Jy2Kve3kPDfPwBJcgcYIa+u04UV7/lPn1aXOsMD5g/G9TrFt
         xfuNRsfYdPl3TAT6fZH1U6Y+pqHzOBLz7bz8XQbkK5yyR3ZoJJtYe6I8Or4FGDrsAyTx
         shoK+9OZGdR9RkXjjYxJtN96JW8rBhrbU8U+tsnpXdBq9odfdAkuQNgZ6GjPXQqvTadi
         gS2Ut2V5eQYHKEDVgsrav7zyX7Hr168IM3QX6lrb+3DOQg6nlnEB4X7hWLkcfmAAoC3A
         D4D/X3DKtNfYTwEjndokt0p8bpbukhIdtTsOGhsEESjHb4C/mnlR/lYt+rRa8JIdW75s
         FfAg==
X-Gm-Message-State: AOAM5328tEI7ZPbal7CdIg/xaWlVkSCh+uNuJDaR73PTejuB6dAOgi7l
	LvDx6pydwevtdHZ09yHBhaI=
X-Google-Smtp-Source: ABdhPJzrBHru6KIwzw6wYBGNR0aWb82/N5X047UL8fhUGeyUvZqraXuUzT042h7RNk327nmjSaGhIQ==
X-Received: by 2002:a65:68da:: with SMTP id k26mr6811077pgt.303.1607610674038;
        Thu, 10 Dec 2020 06:31:14 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:9b82:: with SMTP id y2ls2550861plp.5.gmail; Thu, 10
 Dec 2020 06:31:13 -0800 (PST)
X-Received: by 2002:a17:902:d385:b029:da:c6e4:5cab with SMTP id e5-20020a170902d385b02900dac6e45cabmr823885pld.7.1607610673142;
        Thu, 10 Dec 2020 06:31:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607610673; cv=none;
        d=google.com; s=arc-20160816;
        b=vq1FT7q64atdCxaoKhvt/M6Lh0Y0VvPw0XdQN7wE080c7vOvFF38m7aR6a5XsjKruL
         rRGIgB1HLp7f9BdLfhfdkOsoxGQXXqoIoWYw50MU9flNLhg4SWI1b/fLub/30s54pkbP
         6h7hauUK/E9T+5enhoJYEtRg+D1KH4KC0T6z06Ht3wM+Cg5g9lBEjl9Bso0FD739s2yg
         bv4wibxAwmbZ7W9q+Bsj83r+TeVmVVtChLSmTqnHOZJUhvgefxR8otq0kur97M/lkIkW
         XbHmpt44ywDz8N07E9q3bdFOwbVBEhUvq/BSHA0dMLBGkqfI6+PD/lMg9IdlnJ9fV2ra
         781w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=CxIPY3Z+olypszOqCkY4ujhIIxjjcwkdYfS7Rfm6kvg=;
        b=RAcg/ic4HOpJZzzrKtWwp3jnRpAvNS+YTISL400mQwrH1dLipsB7euyP+C0Ou7A4RE
         LsmL6Cx7W6ufiatKj65RPTKHjL1zEUdqDD+KfqDpDT5jY+MgIOeZ/FrUUIt41NayRSRq
         DmTr0y6NCnzPTEsTkqH/FuDAiWyd+X7ZvOX5cICH58N5Ny5fMzjloBUiORKXydWMGHQ4
         twk40llmcUaBAuiyQV/p7n/qjhRf8odtMm2Q5i8DMw29DJfo2yuqbcabgvA/60bpAYY/
         ZRUmCmSG2rLT7tiJ5ubXjyzePiY1uIip68RTOcFu8E4cn1Jhb5K1u7NX3s7wW/8kTtsu
         wiBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TelJLcfW;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id w6si451953pjr.2.2020.12.10.06.31.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Dec 2020 06:31:13 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAEVCcR085703;
	Thu, 10 Dec 2020 08:31:12 -0600
Received: from DLEE106.ent.ti.com (dlee106.ent.ti.com [157.170.170.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAEVCxP045257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 10 Dec 2020 08:31:12 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 10
 Dec 2020 08:31:11 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 10 Dec 2020 08:31:11 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAEVAKC112113;
	Thu, 10 Dec 2020 08:31:11 -0600
Date: Thu, 10 Dec 2020 20:01:09 +0530
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>
CC: Andrea Bastoni <andrea.bastoni@tum.de>, <jailhouse-dev@googlegroups.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
Message-ID: <20201210143109.qhonsugyef4rs6hf@NiksLab>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
 <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
 <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
 <540d5217-5b22-a0a5-d067-304c49e82006@tum.de>
 <9e5869e4-8f93-a0d0-7758-87ba610bd626@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Disposition: inline
In-Reply-To: <9e5869e4-8f93-a0d0-7758-87ba610bd626@siemens.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=TelJLcfW;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

On 17:02-20201203, Jan Kiszka wrote:
> On 03.12.20 16:23, Andrea Bastoni wrote:
> > On 03/12/2020 14:44, Jan Kiszka wrote:
> >> On 03.12.20 13:48, Andrea Bastoni wrote:
> >>> On 03/12/2020 07:36, Jan Kiszka wrote:
> >>>> On 27.11.20 12:41, Andrea Bastoni wrote:
> >>>>> The SMMUv2 allows filtering bits when matching stream IDs before they're
> >>>>> passed to the TCU. In this way multiple streams legally get the same
> >>>>> translation.
> >>>>>
> >>>>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
> >>>>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
> >>>>> that is set by the PL (and could be IP specific).
> >>>>>
> >>>>> One single fixed mask to pass to the SMR to compact multiple stream IDs
> >>>>> before they "hit" the TCU is not flexible enough. The use-case is to
> >>>>> compact similar PL-originating masters and have the SMMU behaving the
> >>>>> same for them (e.g., they're assigned to the same inmate). At the
> >>>>> same time, one needs a full stream_id to assign e.g., different GEM
> >>>>> ethernets to different inmates.
> >>>>>
> >>>>> Update a stream_id to support two different interpretations:
> >>>>> - for the SMMUv2, provide an explicit mask + ID.
> >>>>> - for the SMMUv3, keep the current single ID.
> >>>>>
> >>>>> This commit updates the SMMUv2 / v3 --including configuration--
> >>>>> accordingly.
> >>>>
> >>>> CC'ing Nikil and Peng on their affected code.
> >>>>
> >>>>>
> >>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
> >>>>> ---
> >>>>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
> >>>>>  configs/arm64/imx8qm.c                  | 16 +++++--
> >>>>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
> >>>>>  configs/arm64/k3-j7200-evm.c            |  2 +-
> >>>>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
> >>>>>  configs/arm64/k3-j721e-evm.c            |  2 +-
> >>>>>  configs/arm64/ultra96.c                 | 11 ++++-
> >>>>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
> >>>>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
> >>>>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
> >>>>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
> >>>>>  include/jailhouse/cell-config.h         | 18 ++++---
> >>>>>  12 files changed, 114 insertions(+), 55 deletions(-)
> >>>>>
> >>>>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
> >>>>> index f13ca7bc..e8e8b217 100644
> >>>>> --- a/configs/arm64/imx8qm-linux-demo.c
> >>>>> +++ b/configs/arm64/imx8qm-linux-demo.c
> >>>>> @@ -19,7 +19,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[18];
> >>>>>  	struct jailhouse_irqchip irqchips[4];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[1];
> >>>>> +	union jailhouse_stream_id stream_ids[1];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.cell = {
> >>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> >>>>> @@ -194,6 +194,9 @@ struct {
> >>>>>  	},
> >>>>>  
> >>>>>  	.stream_ids = {
> >>>>> -		0x10,
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x7f8,
> >>>>> +			.mmu500.id = 0x10,
> >>>>
> >>>> Would list id before the mask.
> >>>>
> >>>>> +		},
> >>>>>  	},
> >>>>>  };
> >>>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
> >>>>> index d63c73cf..2ec4f4dd 100644
> >>>>> --- a/configs/arm64/imx8qm.c
> >>>>> +++ b/configs/arm64/imx8qm.c
> >>>>> @@ -20,7 +20,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[15];
> >>>>>  	struct jailhouse_irqchip irqchips[3];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[3];
> >>>>> +	union jailhouse_stream_id stream_ids[3];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.header = {
> >>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> >>>>> @@ -54,7 +54,6 @@ struct {
> >>>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
> >>>>>  					.base = 0x51400000,
> >>>>>  					.size = 0x40000,
> >>>>> -					.arm_mmu500.sid_mask = 0x7f80,
> >>>>>  				},
> >>>>>  			},
> >>>>>  
> >>>>> @@ -209,6 +208,17 @@ struct {
> >>>>>  	},
> >>>>>  
> >>>>>  	.stream_ids = {
> >>>>> -		0x11, 0x12, 0x13,
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x7f8,
> >>>>> +			.mmu500.id = 0x11,
> >>>>> +		},
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x7f8,
> >>>>> +			.mmu500.id = 0x12,
> >>>>> +		},
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x7f8,
> >>>>> +			.mmu500.id = 0x13,
> >>>>> +		},
> >>>>>  	},
> >>>>>  };
> >>>>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
> >>>>> index 90a0ce4c..ace9cd3a 100644
> >>>>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
> >>>>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
> >>>>> @@ -26,7 +26,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[19];
> >>>>>  	struct jailhouse_irqchip irqchips[3];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[1];
> >>>>> +	union jailhouse_stream_id stream_ids[1];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.cell = {
> >>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> >>>>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
> >>>>> index c3ac331d..d0c8aee3 100644
> >>>>> --- a/configs/arm64/k3-j7200-evm.c
> >>>>> +++ b/configs/arm64/k3-j7200-evm.c
> >>>>> @@ -21,7 +21,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[32];
> >>>>>  	struct jailhouse_irqchip irqchips[6];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[1];
> >>>>> +	union jailhouse_stream_id stream_ids[1];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.header = {
> >>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> >>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
> >>>>> index 5b6aa82e..1b8b3c4c 100644
> >>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
> >>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
> >>>>> @@ -27,7 +27,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[22];
> >>>>>  	struct jailhouse_irqchip irqchips[4];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[2];
> >>>>> +	union jailhouse_stream_id stream_ids[2];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.cell = {
> >>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
> >>>>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
> >>>>> index ab13fedd..aa5b47a9 100644
> >>>>> --- a/configs/arm64/k3-j721e-evm.c
> >>>>> +++ b/configs/arm64/k3-j721e-evm.c
> >>>>> @@ -22,7 +22,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[40];
> >>>>>  	struct jailhouse_irqchip irqchips[6];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[30];
> >>>>> +	union jailhouse_stream_id stream_ids[30];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.header = {
> >>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> >>>>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
> >>>>> index db65ae01..19be84ae 100644
> >>>>> --- a/configs/arm64/ultra96.c
> >>>>> +++ b/configs/arm64/ultra96.c
> >>>>> @@ -21,7 +21,7 @@ struct {
> >>>>>  	struct jailhouse_memory mem_regions[11];
> >>>>>  	struct jailhouse_irqchip irqchips[1];
> >>>>>  	struct jailhouse_pci_device pci_devices[2];
> >>>>> -	__u32 stream_ids[2];
> >>>>> +	union jailhouse_stream_id stream_ids[2];
> >>>>>  } __attribute__((packed)) config = {
> >>>>>  	.header = {
> >>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> >>>>> @@ -161,6 +161,13 @@ struct {
> >>>>>  	},
> >>>>>  
> >>>>>  	.stream_ids = {
> >>>>> -		0x870, 0x871
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x0,
> >>>>> +			.mmu500.id = 0x870,
> >>>>> +		},
> >>>>> +		{
> >>>>> +			.mmu500.mask = 0x0,
> >>>>> +			.mmu500.id = 0x871,
> >>>>
> >>>> Only realizing now: That mask is an "ignore mask", right? Bits set there
> >>>> are NOT matched against the id. That's modeled after the hardware? Is
> >>>> this really intuitive? This one confused me at least.
> >>>
> >>> Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?
> >>>
> >>
> >> ...r invert it in SMR_GET_MASK? Not sure what is nicer. The latter has
> > 
> > Not sure what you mean by "...r" ? "maskr"?
> 
> "...or invert" - I somehow lost the "o".
> 
> > 
> >> the disadvantage that you then always need to specify a non-zero mask.
> > 
> > Not sure that inverting it in SMR_GET_MASK is very nice. The mask is 15 bits,
> > the "consider all" would be 0x7fff (and you start wondering in the configuration
> > why 7 and not f...)
> > 
> > What about "mask_out"?
> > 

Is the mask only indicating how many bits of LSB are to be
matched/ignored? If so, you can simply put the no of bits instead of the
full mask.

Nikhil Devshatwar

> 
> Shorter and still clear - let's go for that.
> 
> Jan
> 
> -- 
> Siemens AG, T RDA IOT
> Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201210143109.qhonsugyef4rs6hf%40NiksLab.
