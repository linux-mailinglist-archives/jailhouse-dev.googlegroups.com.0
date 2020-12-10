Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBCPHZD7AKGQEDTEHT6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0202D5E1D
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 15:41:14 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id f15sf3397722ljm.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Dec 2020 06:41:14 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607611273; cv=pass;
        d=google.com; s=arc-20160816;
        b=QVoUaaEISJRWiae2ezKeH+LbiLmQNDjiG9/9/bGzuFqW7AIszsxC84eikR4vMwDCST
         6aaemLdcMNVpzOzUVNkvh+hxrPW7gkRzAgNfZrbe14oe9hau73bIJj25VI3HVvOGGVS5
         9rloRvP+QMXfKRE0hpFxzJ+4/rmDGqCzadVw6PBTkgEzqgrBceTddSCdLFkyXYY+eDEl
         Ddoff/L3hMmzQjgLZDr/Up/snxpA6X8BCyfv837F7na8CyRq+Y7gGb2930FKOViZUyeC
         8uiKzixvYEnyYYto/eKFQgreTUeVdTdcPjFDWHlxOLSWM1XMKf52FGPlxdiUvuaOoVq2
         xSYQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:references
         :cc:to:subject:sender:dkim-signature;
        bh=nkduZnwqVRqYSU03kntjHSMl/tTtGdzz+tPxEHiVnDw=;
        b=vB8NiQz0xBRn9JUA7jDser+PPLsbw4H3yAwPerd/DEGXxThS5LmugMfGUWj/JuWTy9
         Sw7Nl7vq502Mkza5MP0/LQAFrMAUTf7rZWyzCRsW97z8GxFztsfEgI01KYzzfSbp70q8
         7PyLSSIqYzdzPKh5bxChXZC3DhwFdEtac0CEJHIdFE0LiIwS3rLVfFm9Euqa6NUF5QV+
         L1tnCn69P/yaRnOPVJ+gM3u0KkSK9SPKazZVo6vds4eEvxpn0o1yOacbzIbd3wWlXyRE
         5kx6YZ6l3pv0fliy6lb2QSFYBtHzGP5Cuq7D6gc0JergcN6Y34YJfar7X//80Lcz9GvM
         v5Cw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xqADOUwI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nkduZnwqVRqYSU03kntjHSMl/tTtGdzz+tPxEHiVnDw=;
        b=RnonHcKOVBVlzPsyPq8Tne9azW3N6p1rAVaAvLWTmRPrLJ+4aCrlXRLU/JGddg7xpd
         aPnH5CImyQc8Gf9yBmyTK4WVq1FTqajaJCKOZns/2bEgC7Q8Y8M6nJjq3fLCc3POukD/
         2dC1GdI9nqrav4IaDVSKO5m2ehO0TCBOvtuNQfJD+nSrXBuGoO95TinEcXvGDVflP7hM
         5hAfsp7oVa1FiNmntx7lLS0AmHWgQU5agF7z+jaZU3cdPSBg0frcXHBkvedonDMpBq8G
         FkZEDz9GuJL3pIeUyOn9/8k1w0wt/jw/vmjnPNlx3aNNaIFX9JjbU4XXuJG97ieZX8Cq
         7H1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nkduZnwqVRqYSU03kntjHSMl/tTtGdzz+tPxEHiVnDw=;
        b=D515aaa9xhMt305EPS+I4X1xnrG4Kd6Cn3ur+/F+rZybfBjmJ2LQD3K3o4RPC79VE0
         7Xe7WtfHDmhsPC3KOJ6F9uPGeqhLlC266ucoUfXL/1SST2w4MvCSAlqer/GulIoMs5Tl
         XkUV0JmIIHCYRXRJ0mFPa11NSaP4UXpzECbUN1xoYBIWTr9rQ/Myzaq9ExPj1u2NV/nt
         hdvyYjqWnjOJ08RyLjurfTLpOIB9tV5cpnWGT0UNLrr4S2cU7dXOg4YnrDlkscSjJVTn
         iGaxUKHVumWL/B0yhD1m8Hb7OPcr8GGNfJIwVf2blwpNRIRkaO21YZy0Hxzo+Bv+0UBY
         NvDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530hZn+t/BdpBuAYBK58ucmoOp+bcY2QeWM+XqBJWtme1PylJJdR
	ChZMtwOMkQFfBTm/o5p18wU=
X-Google-Smtp-Source: ABdhPJwHbCFWUsL9fH5r01+kxOnVbIloxI4oVVHjltZGID7pYSnwpgDmpumlVEdo/twAwVQsNgTVIQ==
X-Received: by 2002:a2e:740a:: with SMTP id p10mr3373838ljc.409.1607611273830;
        Thu, 10 Dec 2020 06:41:13 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c1cd:: with SMTP id r196ls382325lff.1.gmail; Thu, 10 Dec
 2020 06:41:12 -0800 (PST)
X-Received: by 2002:ac2:514e:: with SMTP id q14mr2983490lfd.130.1607611272659;
        Thu, 10 Dec 2020 06:41:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607611272; cv=none;
        d=google.com; s=arc-20160816;
        b=ojayJx0zoomychItej5kFmAtXsn/c7TKs2HIWBidCUav3jlw/epVFWPOrloIzJ+IJ0
         rnO5XAUNUG/tZNbKF/9pfw31bFXuzeyLg3/wAarZRdXSQLPOtQYofnUTUywrQ2rpqCOt
         k5AhTucAjugg5WNaUIVAAQd4xTXo+TInsSFDZkKxXNmJEUK1Ke2H/QpgIdmNRsQlwcRa
         vRAVmnrZr8LF9mTHLsmMRDEEsdovNjRVBJZFYUwxh9FZoJxpFBATyi9whNksKOoqhUiB
         PVyOCKIeR2AGFt06HksAAFKT5RYUVtoNbvGjmRCAhEPOkgUxEebJGxAkX9HsRO+GFwiT
         Wpxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=vEVsiTaExlxZ0uwuC0f8D34PSw/ivy4lMgiFXc2pgvs=;
        b=ZtKEinl+fh/NCHg1tqnwlw2DL3D63bLlhkCLgyjD7cuxPe4zQHY5Pfyp+dLtntk1cC
         8xPjXTKonIWCOs8KNFc2eho+XfJ/x0EC9SYj33QbYMj9baLRrCiWJpOUNCaGIaccvXZ7
         Erj3DZstF1ALDYbj7vBy+CL0aLqAlNQujvKdLTaWSw7mcKNRwbn4HMDKkSlITZbHMF3r
         MS4duDDIBooDUuNIgRGFwEc3b0babP/K4WxaUd8lK5YJ05LqILQ+tGaXoWiGMbkaWHGk
         E995DcvginOaxhceVvle7u60oCTI+oTVCc2ZMlcXe4S3oWhpx8g86RLlPGH6ohCczm1I
         44Fg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=xqADOUwI;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id d3si182623ljj.4.2020.12.10.06.41.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Dec 2020 06:41:12 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CsGnM66t4zyZ9;
	Thu, 10 Dec 2020 15:41:11 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
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
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id 1ywEGMvHCxPt; Thu, 10 Dec 2020 15:41:11 +0100 (CET)
Received: from [192.168.1.23] (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CsGnL3FSzzyVh;
	Thu, 10 Dec 2020 15:41:10 +0100 (CET)
Subject: Re: [PATCH v3 1/2] arm64, configs: SMMUv2: Separate stream ID's mask
 and id
To: Nikhil Devshatwar <nikhil.nd@ti.com>, Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, Peng Fan <peng.fan@nxp.com>
References: <20201127114140.37179-1-andrea.bastoni@tum.de>
 <cfe00e93-66dd-ad37-e30d-2f4e889e4c56@siemens.com>
 <403b209e-8281-6f0b-409a-bd6dc14862c8@tum.de>
 <6c4ee376-6573-ecc7-2e50-f6a74156fd75@siemens.com>
 <540d5217-5b22-a0a5-d067-304c49e82006@tum.de>
 <9e5869e4-8f93-a0d0-7758-87ba610bd626@siemens.com>
 <20201210143109.qhonsugyef4rs6hf@NiksLab>
From: Andrea Bastoni <andrea.bastoni@tum.de>
Autocrypt: addr=andrea.bastoni@tum.de; keydata=
 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
Message-ID: <402f6798-2a08-699a-9465-0c29c77a75c8@tum.de>
Date: Thu, 10 Dec 2020 15:41:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201210143109.qhonsugyef4rs6hf@NiksLab>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=xqADOUwI;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
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

On 10/12/2020 15:31, 'Nikhil Devshatwar' via Jailhouse wrote:
> On 17:02-20201203, Jan Kiszka wrote:
>> On 03.12.20 16:23, Andrea Bastoni wrote:
>>> On 03/12/2020 14:44, Jan Kiszka wrote:
>>>> On 03.12.20 13:48, Andrea Bastoni wrote:
>>>>> On 03/12/2020 07:36, Jan Kiszka wrote:
>>>>>> On 27.11.20 12:41, Andrea Bastoni wrote:
>>>>>>> The SMMUv2 allows filtering bits when matching stream IDs before they're
>>>>>>> passed to the TCU. In this way multiple streams legally get the same
>>>>>>> translation.
>>>>>>>
>>>>>>> On boards such as the ZCU Ultrascale+, the master ID needed to identify
>>>>>>> the corresponding SMMU stream ID may be dependent on a specific AXI ID
>>>>>>> that is set by the PL (and could be IP specific).
>>>>>>>
>>>>>>> One single fixed mask to pass to the SMR to compact multiple stream IDs
>>>>>>> before they "hit" the TCU is not flexible enough. The use-case is to
>>>>>>> compact similar PL-originating masters and have the SMMU behaving the
>>>>>>> same for them (e.g., they're assigned to the same inmate). At the
>>>>>>> same time, one needs a full stream_id to assign e.g., different GEM
>>>>>>> ethernets to different inmates.
>>>>>>>
>>>>>>> Update a stream_id to support two different interpretations:
>>>>>>> - for the SMMUv2, provide an explicit mask + ID.
>>>>>>> - for the SMMUv3, keep the current single ID.
>>>>>>>
>>>>>>> This commit updates the SMMUv2 / v3 --including configuration--
>>>>>>> accordingly.
>>>>>>
>>>>>> CC'ing Nikil and Peng on their affected code.
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>>>>>> ---
>>>>>>>  configs/arm64/imx8qm-linux-demo.c       |  7 ++-
>>>>>>>  configs/arm64/imx8qm.c                  | 16 +++++--
>>>>>>>  configs/arm64/k3-j7200-evm-linux-demo.c |  2 +-
>>>>>>>  configs/arm64/k3-j7200-evm.c            |  2 +-
>>>>>>>  configs/arm64/k3-j721e-evm-linux-demo.c |  2 +-
>>>>>>>  configs/arm64/k3-j721e-evm.c            |  2 +-
>>>>>>>  configs/arm64/ultra96.c                 | 11 ++++-
>>>>>>>  configs/arm64/zynqmp-zcu102.c           | 15 +++++-
>>>>>>>  hypervisor/arch/arm64/smmu-v3.c         |  9 ++--
>>>>>>>  hypervisor/arch/arm64/smmu.c            | 64 ++++++++++++++++---------
>>>>>>>  hypervisor/arch/arm64/ti-pvu.c          | 21 ++++----
>>>>>>>  include/jailhouse/cell-config.h         | 18 ++++---
>>>>>>>  12 files changed, 114 insertions(+), 55 deletions(-)
>>>>>>>
>>>>>>> diff --git a/configs/arm64/imx8qm-linux-demo.c b/configs/arm64/imx8qm-linux-demo.c
>>>>>>> index f13ca7bc..e8e8b217 100644
>>>>>>> --- a/configs/arm64/imx8qm-linux-demo.c
>>>>>>> +++ b/configs/arm64/imx8qm-linux-demo.c
>>>>>>> @@ -19,7 +19,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[18];
>>>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[1];
>>>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.cell = {
>>>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>>>> @@ -194,6 +194,9 @@ struct {
>>>>>>>  	},
>>>>>>>  
>>>>>>>  	.stream_ids = {
>>>>>>> -		0x10,
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x7f8,
>>>>>>> +			.mmu500.id = 0x10,
>>>>>>
>>>>>> Would list id before the mask.
>>>>>>
>>>>>>> +		},
>>>>>>>  	},
>>>>>>>  };
>>>>>>> diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
>>>>>>> index d63c73cf..2ec4f4dd 100644
>>>>>>> --- a/configs/arm64/imx8qm.c
>>>>>>> +++ b/configs/arm64/imx8qm.c
>>>>>>> @@ -20,7 +20,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[15];
>>>>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[3];
>>>>>>> +	union jailhouse_stream_id stream_ids[3];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.header = {
>>>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>>>> @@ -54,7 +54,6 @@ struct {
>>>>>>>  					.type = JAILHOUSE_IOMMU_ARM_MMU500,
>>>>>>>  					.base = 0x51400000,
>>>>>>>  					.size = 0x40000,
>>>>>>> -					.arm_mmu500.sid_mask = 0x7f80,
>>>>>>>  				},
>>>>>>>  			},
>>>>>>>  
>>>>>>> @@ -209,6 +208,17 @@ struct {
>>>>>>>  	},
>>>>>>>  
>>>>>>>  	.stream_ids = {
>>>>>>> -		0x11, 0x12, 0x13,
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x7f8,
>>>>>>> +			.mmu500.id = 0x11,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x7f8,
>>>>>>> +			.mmu500.id = 0x12,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x7f8,
>>>>>>> +			.mmu500.id = 0x13,
>>>>>>> +		},
>>>>>>>  	},
>>>>>>>  };
>>>>>>> diff --git a/configs/arm64/k3-j7200-evm-linux-demo.c b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>>>> index 90a0ce4c..ace9cd3a 100644
>>>>>>> --- a/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>>>> +++ b/configs/arm64/k3-j7200-evm-linux-demo.c
>>>>>>> @@ -26,7 +26,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[19];
>>>>>>>  	struct jailhouse_irqchip irqchips[3];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[1];
>>>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.cell = {
>>>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>>>> diff --git a/configs/arm64/k3-j7200-evm.c b/configs/arm64/k3-j7200-evm.c
>>>>>>> index c3ac331d..d0c8aee3 100644
>>>>>>> --- a/configs/arm64/k3-j7200-evm.c
>>>>>>> +++ b/configs/arm64/k3-j7200-evm.c
>>>>>>> @@ -21,7 +21,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[32];
>>>>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[1];
>>>>>>> +	union jailhouse_stream_id stream_ids[1];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.header = {
>>>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> index 5b6aa82e..1b8b3c4c 100644
>>>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>> @@ -27,7 +27,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[22];
>>>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[2];
>>>>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.cell = {
>>>>>>>  		.signature = JAILHOUSE_CELL_DESC_SIGNATURE,
>>>>>>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>>>>>>> index ab13fedd..aa5b47a9 100644
>>>>>>> --- a/configs/arm64/k3-j721e-evm.c
>>>>>>> +++ b/configs/arm64/k3-j721e-evm.c
>>>>>>> @@ -22,7 +22,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[40];
>>>>>>>  	struct jailhouse_irqchip irqchips[6];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[30];
>>>>>>> +	union jailhouse_stream_id stream_ids[30];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.header = {
>>>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>>>> diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
>>>>>>> index db65ae01..19be84ae 100644
>>>>>>> --- a/configs/arm64/ultra96.c
>>>>>>> +++ b/configs/arm64/ultra96.c
>>>>>>> @@ -21,7 +21,7 @@ struct {
>>>>>>>  	struct jailhouse_memory mem_regions[11];
>>>>>>>  	struct jailhouse_irqchip irqchips[1];
>>>>>>>  	struct jailhouse_pci_device pci_devices[2];
>>>>>>> -	__u32 stream_ids[2];
>>>>>>> +	union jailhouse_stream_id stream_ids[2];
>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>  	.header = {
>>>>>>>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
>>>>>>> @@ -161,6 +161,13 @@ struct {
>>>>>>>  	},
>>>>>>>  
>>>>>>>  	.stream_ids = {
>>>>>>> -		0x870, 0x871
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x0,
>>>>>>> +			.mmu500.id = 0x870,
>>>>>>> +		},
>>>>>>> +		{
>>>>>>> +			.mmu500.mask = 0x0,
>>>>>>> +			.mmu500.id = 0x871,
>>>>>>
>>>>>> Only realizing now: That mask is an "ignore mask", right? Bits set there
>>>>>> are NOT matched against the id. That's modeled after the hardware? Is
>>>>>> this really intuitive? This one confused me at least.
>>>>>
>>>>> Yes, it is model after the hardware. Maybe "ignore_mask" or "imask" would be better?
>>>>>
>>>>
>>>> ...r invert it in SMR_GET_MASK? Not sure what is nicer. The latter has
>>>
>>> Not sure what you mean by "...r" ? "maskr"?
>>
>> "...or invert" - I somehow lost the "o".
>>
>>>
>>>> the disadvantage that you then always need to specify a non-zero mask.
>>>
>>> Not sure that inverting it in SMR_GET_MASK is very nice. The mask is 15 bits,
>>> the "consider all" would be 0x7fff (and you start wondering in the configuration
>>> why 7 and not f...)
>>>
>>> What about "mask_out"?
>>>
> 
> Is the mask only indicating how many bits of LSB are to be
> matched/ignored? If so, you can simply put the no of bits instead of the
> full mask.

Depending on the configuration the bits can be non-contiguous or they can match
non-LSB bits.

-- 
Thanks,
Andrea Bastoni

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/402f6798-2a08-699a-9465-0c29c77a75c8%40tum.de.
