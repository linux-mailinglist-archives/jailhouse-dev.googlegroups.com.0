Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBR66XH3AKGQEOBSC7DI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x637.google.com (mail-pl1-x637.google.com [IPv6:2607:f8b0:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA7D1E443F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 15:46:49 +0200 (CEST)
Received: by mail-pl1-x637.google.com with SMTP id x16sf18095205plr.23
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 06:46:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590587208; cv=pass;
        d=google.com; s=arc-20160816;
        b=bGj7RcSFTLCv+T/5zuKfSaeYKHGxQdrxZvTQ/5ZwKs3/YYhEMZT4q2x426LuwXR/h7
         LSlGjJUeHsisRx8gz/3Ds7RjXzF+5Zbae3/NazsoLMWCkXiY04CZtdQAe2ndF+WYQqdU
         bqbb+quc/Nl7mh04Yka8zbALV7216KUPqrs63GCBitDeqcLGjJ83q6MfMULW70Dabnch
         8MCNQ95ZJFGkaRH6jEqLfZud5eaEQy2gh/nAC/9jFF5iIR1vNYeI0CpXc2SE/MGJMYa5
         THjx+tcfa2wLHtiq5RF9aQ12bqRGC40uYNpveRp2Yt2mXQSsk8x30m1//JYh88K6pWxR
         QQZg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :cc:to:subject:dkim-signature;
        bh=uNgpRM1VKLTl2QMJoGpyjwoPjPQjmg/jb645iy/B+A4=;
        b=W9WXs1ta9ZManInD6/cWc4L1sACsuLFQEdJkvcLRPvDuVn8ji1qfEAo5ojrJeKcS6X
         rSkEGds0otekzcz2NcJuPFSXaxQmsqzZjAHw02LSIuJGaQ0oLOWMR8Mr4uJPibzkAYCe
         TnKr26NNWxXeeRLZoRhncm4+BZscp9zlc/sKB7oB89fHZnlfruTiQ4Z1ZMgneeO9sbAL
         IHfMF/YN15G4fuEHu/Tbt2EnBEQuT0wD5FvEuG99A3/6rql22PAYrGE+2nDY7nArfPI6
         4nbYyip54i9qlgX0WXpTuBLYQaYs9HFbN6OBmN0CReIMwBhbNQVV1W/EnLghezm4I0Vk
         pmfw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="yF/4DtKf";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=uNgpRM1VKLTl2QMJoGpyjwoPjPQjmg/jb645iy/B+A4=;
        b=P3sqJkT4syw5tQ2cN8oplnWEeZDxfuu+RD4tv4sj14Q1zh0RIzq2URgz+OrJx4Xdwh
         XDtww6SMBF64U02MB/rw63+p+RlHIqD40MGf60vHYfhToqBReLU9cWnwi+2NI7vSXj6H
         n7gJIgrZMk0vdoazFKrlj/Cde2O+46gil6iIUzD5CGItN8cM1L7efQjI/CkVvtLBx7jB
         wv6wU/MmdBi68PQHaWqJIOIbR2Rp+StVnUPbHd4jjOyFkh9GtZR9SJbUfcp4VvbGqYaD
         g7paNeyHBrlScOSVz5Cnn/fd6cvOs0rlr5jpTXRFDgAmwv0OpT8i5fIGAoVoVdore6Ul
         W3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uNgpRM1VKLTl2QMJoGpyjwoPjPQjmg/jb645iy/B+A4=;
        b=avxZ0thLf3EAAFAlGypzakICvFqNqHYLsB2VF+Wnz5/aILengAZTASKG6VebKKuf8p
         t3YuXRuW/UAH6l4fkPrRfX9P68ALK91mO33mtwzOFUzkPXWqiPVpwFejUJ2z0Gk3amLd
         sXNDvYvkvNG7obqfbaJGKejU1KWAY1hnj70InQT/ttiwUhMgg4/9yNocUJ0T2OzRi3Pv
         H7YEpTBwqQiKQ3czFAmG0ib5S/nqU6ERrPfkiV4BXaGLpIBQwPrvjNS3MOEU0GvPe3KI
         8jYvD+jGFaRILseMi1rVIfe78Rlrth/YmYxR20rzHyQx8PYKKVFDrqkdDBONxpMAJWKD
         fyHw==
X-Gm-Message-State: AOAM532jq93B+plsmoivqe5PNSpCIHpJL7mkq6XOaLoincUYptcJgfMy
	vdzCYkCVGAKzTjha9NEfjJ0=
X-Google-Smtp-Source: ABdhPJzzpDcF0nYsQ4w3i9bdaKvDggbCJlfOgbl8LvP0+DnKcwkcg9lGhj+qtacB5T6VvAg+m+GMkg==
X-Received: by 2002:a62:2ad2:: with SMTP id q201mr4014561pfq.323.1590587207760;
        Wed, 27 May 2020 06:46:47 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:920e:: with SMTP id o14ls5023890pfd.4.gmail; Wed, 27 May
 2020 06:46:47 -0700 (PDT)
X-Received: by 2002:a65:5285:: with SMTP id y5mr4232588pgp.271.1590587207207;
        Wed, 27 May 2020 06:46:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590587207; cv=none;
        d=google.com; s=arc-20160816;
        b=ymMUUecX7xPplxMBOaON4AWfEr3pQwgCZKqdCarjlRfriFLnOq5r0Dak9ihSKdwGeo
         yvgwg0N6lWU1wtqYjWXhCQ8PAc4N8Xy14k1Jw3bs6Eajrv7EIjVbCr55UW1rmcO7nsu9
         CYjR34BF6BEVU4vLfa+kr8Fw+k52MzlBXadBnw9dTmN84H2U789srfs0DhXpKzr4ryHY
         2U2u/Yss8wDsGj7ih9ppOlAqOLEc5LbNL4H2E5WvCrgrbT1d1gKSdcc6/ecFO5gHpphb
         dLpiPz7WdgDFnC+/xMkqpIP7eB9dn8ciK70cy3/g0Gy1ECIeXHPOdEAWNKHlvfBt2Dee
         nAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Z1jp3DMtU6an5FL7sR1fXeCke8zE9BnjBhCcyeU4DTU=;
        b=VEaxSla1882G2JuKh3Rhf6if+4GMEyRWRJD+36WUhGUzbesE8YUpyX+yyDnc5hg3lY
         9olFsNqcn7kIvKHygUDn40Q5+TrqKNzAWT4woAzIyWQ26piw6P7/pvUiqhYNRwJTGE04
         +hHyi1ehJhdruliyAwk5Tiq48P+mpLLsVYh8ORqKIc/mYREXJBJ4rhpVBEDe6YiLf+Uj
         CWVORtI01dP92GFypUlFARHLmrylEsVzlfxeO6D1AX+ho63Cf2v7of7yWSVmT6bgO7LH
         qaEtCuqmpzmceSjW2iedl0S0ybXAiDgGEmGQ+pnRaosQKepQhEYrPKX6SQDnTTLlHew5
         Bjug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="yF/4DtKf";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com. [198.47.23.248])
        by gmr-mx.google.com with ESMTPS id o9si239225plk.0.2020.05.27.06.46.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 06:46:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted sender) client-ip=198.47.23.248;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RDkkTq100842;
	Wed, 27 May 2020 08:46:46 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RDkkBI039411
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 08:46:46 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 08:46:46 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 08:46:46 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RDkh3P011319;
	Wed, 27 May 2020 08:46:44 -0500
Subject: Re: [PATCH v1 5/5] configs: arm64: k3-j721e-evm: Fix failure with
 PCIe
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <kishon@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
 <20200527122358.14723-6-nikhil.nd@ti.com>
 <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <c57f24ac-80ed-92ba-ec9f-69a53908076b@ti.com>
Date: Wed, 27 May 2020 19:16:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <0134f1de-2f2c-416f-67cf-cc20494de4a9@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="yF/4DtKf";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.248 as permitted
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



On 27/05/20 7:01 pm, Jan Kiszka wrote:
> On 27.05.20 14:23, nikhil.nd@ti.com wrote:
>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>
>> PCI kernel framework requires that all the instances in the
>> device tree either specify the PCIe domain or none does.
>>
>> Currently, Jailhouse dynamic overlay describes the PCI domain
>> which causes problems because root cell DTS does not describe
>> this.
>>
>> Fix this by not specifying the domain in root cell config.
>> Also, fix the size of the PCI target region to match with the
>> correct description in TRM.
>>
> 
> Please rather patch your DTs to use the domain ID (upstream). This here
> means that you will get a new domain ID on every Jailhouse start.

+Kishon,

Can you please let me know why are we not using hard coded domains for 
PCIe device for J721e?

Regards,
Nikhil D

> 
> Jan
> 
>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>> ---
>>   configs/arm64/k3-j721e-evm.c | 5 ++---
>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
>> index 578caf02..dbf0ca7c 100644
>> --- a/configs/arm64/k3-j721e-evm.c
>> +++ b/configs/arm64/k3-j721e-evm.c
>> @@ -44,7 +44,7 @@ struct {
>>   			.pci_mmconfig_base = 0x76000000,
>>   			.pci_mmconfig_end_bus = 0,
>>   			.pci_is_virtual = 1,
>> -			.pci_domain = 3,
>> +			.pci_domain = -1,
>>   			.arm = {
>>   				.gic_version = 3,
>>   				.gicd_base = 0x01800000,
>> @@ -173,7 +173,7 @@ struct {
>>   		/* PCIe Core */ {
>>   			.phys_start = 0x0d000000,
>>   			.virt_start = 0x0d000000,
>> -			.size = 0x01000000,
>> +			.size = 0x02000000,
>>   			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>   				JAILHOUSE_MEM_IO,
>>   		},
>> @@ -398,7 +398,6 @@ struct {
>>   	.pci_devices = {
>>   		/* 0003:00:01.0 */ {
>>   			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
>> -			.domain = 3,
>>   			.bdf = 1 << 3,
>>   			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
>>   			.shmem_regions_start = 0,
>>
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c57f24ac-80ed-92ba-ec9f-69a53908076b%40ti.com.
