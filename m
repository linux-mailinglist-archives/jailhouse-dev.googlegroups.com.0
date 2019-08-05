Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB64IUHVAKGQE43TO2RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 531CB81FA5
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Aug 2019 17:00:12 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id x2sf40826504wru.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Aug 2019 08:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1565017212; cv=pass;
        d=google.com; s=arc-20160816;
        b=YW8nm9pf/v976MlAJw+7isGbzKTuTgmjBbUtjpGwFGzmCbOUyTW0WVt8cn8MQ4gVeT
         jt4XnGudmlZt43FSfTpIevTI1Q4qOIUk4Pby2gDPd5U5qQzIXqH1pVo10jPqitkpyW5N
         8kSMW0xjhGszHG06knqKCBAwXBpx37RSlsDuPmhzbKZ1/A4y7S1SaCBcKH+2Qa8xxpKI
         0spojuJtZY39U3HwLUzfodNSQQuD4rorn8lxRuGNraQ/ZVpfGPPAbKYPz+KysENb7Dh4
         I8TBXX6nUAWYzz3pDlM+Lwhl1P6WxFN1u7pxVoK1Ask3OCOnSUf91RA4jUutM06YEP1t
         iJ7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=xL5fL8hwix7BtwBdZime+5wXE27wa3vWNfvBuB7W8hA=;
        b=1CtlBkR2WbPORuOQB/8vp7OXJcOWjVRxVYtkXdAiX56/oCx9Ls0qCUeFQG+kfIQXbj
         /j+gk7IJ7TpnCCfovsj3KaNIxCiaO7Z2x4XSfbDfBSbn1H2IVccKHAR5vUoYLJrHd093
         gwQJYESYtbaptiEI8XF9uJRjBTgnCE/6/Dznc36jERDGsqV5RZDkuEXWwG9EmCr0ZTZ0
         XNzd7FpM/1t0nW29IrXMbYBQbF3Z8K7Zypc9hl09FfLY0auwZjr0kI346qtCYR9WoB84
         nOtkTcc/PQnm7C1tSC5TNs9N+NB9Ep9GFT/YjtFK9RDxw1HjMoWPi7BouUnheTrB075w
         /nKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=xL5fL8hwix7BtwBdZime+5wXE27wa3vWNfvBuB7W8hA=;
        b=Wth+mgEbAy5mi9MBfyMakRIt4VdD/1YkI8tEvF+NboBj8RFC17BcAl4wfiRwYgTFfr
         /I7f4NNicgZZoTRylkF5IqioV9hCF5cFye/0LVxzdeWvPogCWyuUhtVaWYq/dWCUmudA
         uqG8k9Xh5iKQ4oCKY3xCJPW3td2rGbGQ2rDmgkhlSdH38xE0z9KoW86Qr5ElO0cchc6+
         samIklS9mtdNrJf1YxkuRKsF/PWtqbzQ6qClwp1Ozy9nxWC/EZkFsivHNn8yA6yNLUGW
         KUiPOCmIXJt32VOZawmLu6iG6HYP7+7I6ZcszHctpw+nbsMkCKcdpnIlvNeKYuABTMsP
         7w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=xL5fL8hwix7BtwBdZime+5wXE27wa3vWNfvBuB7W8hA=;
        b=sEwGrNRtnCHCPh7XxyBQkcDk7jMgcPvg2jPzVVEoKw7ZMsV7WSFLgWSN/zJKFjsU2i
         xfeojevhBdFqNMWis+z7we74YkZSivtr2ZuPoFnsVlTadYoipBblleDX1mBDl6nnx9I+
         njO2NQEJ9p15E9UE7+wM+L4/IAtz6WlTbg7ewBT4GkKCwkE3kNJ+Clp/GK3A8MVLUIyv
         TCpDEbOYIBSt6Tg7ncC7RLuB38Ss3x3+VF9I6ksA7fQ8qrwLQ3qodl8Yl4siPyzh6ydw
         C3RVvRUY4XCe18IMWZ/CRsPy6Fo9sPF8vFUxG6iBptQmCidejY8N74h5ZxQD8dkxNMzM
         E4wA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVc6DhaQCiApfIt9eA8ZWjOS9p44SYPFVzeL98pG5AL7zZG59Hs
	XjiVogAHMsQjpBykYurkAgw=
X-Google-Smtp-Source: APXvYqwT/ejLu6QWw16sl35Fq/POuiQy/51m3SUa0N473+hKSwpWdqI5TdjxPFo+sRgb2sxovdBBMw==
X-Received: by 2002:a1c:343:: with SMTP id 64mr20001956wmd.116.1565017212042;
        Mon, 05 Aug 2019 08:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c8d0:: with SMTP id f16ls116053wml.3.canary-gmail; Mon,
 05 Aug 2019 08:00:11 -0700 (PDT)
X-Received: by 2002:a1c:6c08:: with SMTP id h8mr19816454wmc.62.1565017211413;
        Mon, 05 Aug 2019 08:00:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565017211; cv=none;
        d=google.com; s=arc-20160816;
        b=iuaf6aacROKpQ2SYzVxnu7Bei/Niv4MQqasHNCd+OFnC9DHIDgKopjNZUNSTsjG9KW
         1Ia1Kj0xWM3odXoGkzv2jT77a95ydmdchFoM+euoiD//SqSsKMR6ZO64p66vBlv8zgkE
         dRMObhZ0tWEqxGC0IZ45nIA68wReddq4DM4j2FnOit32nZhaqFO+uGO9oF7IHry2oZHE
         3CfaLJE/k1UY6bk+8alYb7YzEv3j6v3vO2SN+NsoV7ALOWxBwr4MQT+tpq3nF9rcjpsZ
         FFgmUdZsN/geV7ltHT4vrjUdLMuUT9xgXKZ3n09HlxskAa8RjqM6lwftggPysHCFYW9d
         Bsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=k1YYEskLoJXO3Hg9Eh9p7f+UOWTPMkwTM8yEGocus+U=;
        b=ikUfPAy1oh3nC8EKA6N3EHInMHB+wvkW+7x8I4j8WF4aEf3bVYHGRn6T96Dfzql3ds
         23ViSirCjLZYQ37Ath1czvrlxx2uk6vBA79eSo3/7kdWevRG7y+cP7QXQZyBanRT0wVY
         9zryjNpXgqNiKOnAAn79d1UTrb5+t/ZSxl2gpxHiOjHtAgnjb4XBifvVxFgX8LsTlmAi
         rWiPR0zuLbgtDIa1r7UMfiggaiYkKDBym2DHjl2BoIQB0bWZv/NvbovrcQo5qmC3JOWC
         UKNXZFc3gylXqPpIvU1dNolZ1F617z+xYh8ukqeIcZTNbmqZ5me/n2Bjys3sArwW13E4
         ufQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id b15si467092wmg.1.2019.08.05.08.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 08:00:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x75F0AGU032508
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Aug 2019 17:00:11 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x75F0AwL019415;
	Mon, 5 Aug 2019 17:00:10 +0200
Subject: Re: [PATCH v3 1/6] iommu: x86: Generalize iommu definition
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Lokesh Vutla <lokeshvutla@ti.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Sekhar Nori <nsekhar@ti.com>, William Mills <wmills@ti.com>,
        Nikhil Devshatwar <nikhil.nd@ti.com>
References: <20190709134836.10485-1-p-yadav1@ti.com>
 <20190709134836.10485-2-p-yadav1@ti.com>
 <14f0f8cf-b23f-63b9-22c6-7abadbcfb57d@oth-regensburg.de>
 <29ff1833-f55b-d698-fbf5-49db43af711a@siemens.com>
 <e31985ab-b95f-d493-01e5-883a6c94cc31@ti.com>
 <4d6a7a70-6c8d-7a25-a674-03142e112caf@siemens.com>
Message-ID: <d7aaf90c-94ff-9356-d1e7-db1ca5183a29@siemens.com>
Date: Mon, 5 Aug 2019 17:00:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <4d6a7a70-6c8d-7a25-a674-03142e112caf@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 05.08.19 16:54, Jan Kiszka wrote:
> On 05.08.19 16:35, Lokesh Vutla wrote:
>> Hi Jan,
>>
>> On 05/08/19 7:15 PM, Jan Kiszka wrote:
>>> On 05.08.19 15:25, Ralf Ramsauer wrote:
>>>> Hi,
>>>>
>>>> On 7/9/19 3:48 PM, 'Pratyush Yadav' via Jailhouse wrote:
>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>
>>>>> Right now, jailhouse only supports iommu for x86.
>>>>> Generalize the data structures to support iommus of different types
>>>>>
>>>>> Assumption is that each jailhouse_system can define iommu
>>>>> instances of different types. Extend the jailhouse_iommu
>>>>> to add type info.
>>>>>
>>>>> Update the x86 config files to reflect updated data the new type field.
>>>>>
>>>>> [p-yadav1@ti.com: Add Intel IOMMU and fix compiler errors for AMD and
>>>>> VT-D]
>>>>>
>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
>>>>> Signed-off-by: Pratyush Yadav <p-yadav1@ti.com>
>>>>> ---
>>>>> v2:
>>>>> - Undo removing iommu_count_units().
>>>>> - Remove the union from jailhouse_iommu.
>>>>> - Remove the stray blank in amd_iommu.h
>>>>> - Revert to using n instead of i in amd_iommu_init().
>>>>> - Fail in Intel and AMD when any other type of IOMMU is found.
>>>>> - Remove the accidental Intel configuration check.
>>>>> - Update cell config template and pyjailhouse
>>>>>
>>>>> Jan, please take a close look at the template and pyjailhouse update.
>>>>> I'm not sure if I missed something, or did something wrong.
>>>>>
>>>>>  configs/x86/f2a88xm-hd3.c       | 1 +
>>>>>  configs/x86/qemu-x86.c          | 1 +
>>>>>  hypervisor/arch/x86/amd_iommu.c | 9 ++++-----
>>>>>  hypervisor/arch/x86/vtd.c       | 2 ++
>>>>>  include/jailhouse/cell-config.h | 7 +++++++
>>>>>  pyjailhouse/sysfs_parser.py     | 2 ++
>>>>>  tools/root-cell-config.c.tmpl   | 1 +
>>>>>  7 files changed, 18 insertions(+), 5 deletions(-)
>>>>>
>>>>> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
>>>>> index 315d0e29..849c5756 100644
>>>>> --- a/configs/x86/f2a88xm-hd3.c
>>>>> +++ b/configs/x86/f2a88xm-hd3.c
>>>>> @@ -50,6 +50,7 @@ struct {
>>>>>  				.pm_timer_address = 0x808,
>>>>>  				.iommu_units = {
>>>>>  					{
>>>>> +						.type = JAILHOUSE_IOMMU_AMD,
>>>>>  						.base = 0xfeb80000,
>>>>>  						.size = 0x80000,
>>>>>  						.amd_bdf = 0x02,
>>>>> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
>>>>> index fdfa8915..2df2807a 100644
>>>>> --- a/configs/x86/qemu-x86.c
>>>>> +++ b/configs/x86/qemu-x86.c
>>>>> @@ -50,6 +50,7 @@ struct {
>>>>>  				.vtd_interrupt_limit = 256,
>>>>>  				.iommu_units = {
>>>>>  					{
>>>>> +						.type = JAILHOUSE_IOMMU_INTEL,
>>>>>  						.base = 0xfed90000,
>>>>>  						.size = 0x1000,
>>>>>  					},
>>>>> diff --git a/hypervisor/arch/x86/amd_iommu.c b/hypervisor/arch/x86/amd_iommu.c
>>>>> index 02712571..2fc6d033 100644
>>>>> --- a/hypervisor/arch/x86/amd_iommu.c
>>>>> +++ b/hypervisor/arch/x86/amd_iommu.c
>>>>> @@ -448,7 +448,7 @@ static void amd_iommu_init_fault_nmi(void)
>>>>>  		    &system_config->platform_info.x86.iommu_units[iommu->idx];
>>>>>  
>>>>>  		/* Disable MSI during interrupt reprogramming. */
>>>>> -		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2 , 0, 2);
>>>>> +		pci_write_config(cfg->amd_bdf, cfg->amd_msi_cap + 2, 0, 2);
>>>>>  
>>>>>  		/*
>>>>>  		 * Write new MSI capability block, re-enabling interrupts with
>>>>> @@ -782,14 +782,13 @@ static int amd_iommu_init(void)
>>>>>  
>>>>>  	iommu = &system_config->platform_info.x86.iommu_units[0];
>>>>>  	for (n = 0; iommu->base && n < iommu_count_units(); iommu++, n++) {
>>>>> +		if (iommu->type != JAILHOUSE_IOMMU_AMD)
>>>>
>>>> This is a comparison of an __u32 against an enum.
>>>>
>>>
>>> Oops, the enum is still around?! I requested to remove it but didn't check again...
>>
>>  it is fixed in v4 :) $patch is v3.
>>
> 
> Ah, ooh... Ralf, please use your time machine only for funny stuff! ;)
> 

...but Ralf's suggestion to tune the values for easier conflict detection or
resolution is still reasonable.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d7aaf90c-94ff-9356-d1e7-db1ca5183a29%40siemens.com.
