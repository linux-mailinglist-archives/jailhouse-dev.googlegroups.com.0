Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3XT7H3AKGQEZ75DSSA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 581E61F1E79
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 19:48:31 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id l1sf7451643wrc.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 10:48:31 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591638511; cv=pass;
        d=google.com; s=arc-20160816;
        b=AyLqZnKmPVvoFMc8S97WO0inkRpArIBTwp4hu5WfKCeVCm+j2gsPk9RZSjXZQcDq0V
         e06g+y8+Pd8fhKsICc/lvcX8BeqofZ7B9DyugXIYMJ2jGhxXGia1IFns35IRBNGKd9LL
         /aMuyxwt78mUusRO80Ux1i1LdWjRHNFNUXVsBdbKttMQ9iPQDl4SO/KeTNt2SZkam6mN
         FOGi4RiUYphPG7y4+AhBGI309Hrz4R7WVaQMi6ORUov9FA5PGcPS99jN7K7kYwXZM24O
         QZb2Fm8FCE8Af4s1hxcWavzt4JtOxi0rhQ5UndONu/KDHgmU+cVLO64gVISAnqtQQ1wZ
         jeGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=GGoANcuykOeNvVyPC1uTg6plWiv3wDwrGM2Gcr4/FQ4=;
        b=x5gBXPiRsGwI8LLwqNJD1uT4z3VtITTN75yDWXxq/mquoE1CEUYtyUZstihsqtvMWo
         bL599z7o14Dmj/P0jp3ELSiG0/zrplM5bGlhjtun6CHsH/x7H5hXc7K3YXsvb70prGb1
         qao4vrr1kn7FbtDYJlyQUCm2Ff0OGqLS7pbyjFcolsgGhrbYIQZ2+tomdK7IHKeuBESB
         KI/A4gMszPNmi8vkt3BRqbskWto7dA4gaO9RRtZkGh3DUg9gy3ukfdkOxIJHb6QyUOId
         WFIFaGRj0QxxKo8ZXiEq1ErL8Tm9Y5B4mdL0MdATf8HuveTQfsBcL8I6J8/F30Rw+dl6
         0Qeg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GGoANcuykOeNvVyPC1uTg6plWiv3wDwrGM2Gcr4/FQ4=;
        b=ecF2x2U1Ra7f8+PvulX7gl34HWi08iRI2ZzF5N1j3/5Ug4Jc7EqIdiwN2VxWwoQjOA
         EGiL2Jqx4nGXTxixZfCCgS9mUBgBVIWLfS7Q48Mi7CDdMBehEuegmto3OznhtAyFsx56
         2J1F+xA0MwYNC6jJuPB72LcvyZGapa5CjFFq0U9wCe2IVobZJUKOp2T/2SSu+jqGD2H/
         rUMdPxFthbaI0+5CZ+9qTz4kjC7QwEtKKYFCM/c2C1hvaQtYaFjvhsIcUK/yP3AKhoI8
         PkT7MqML7mXVuaEhsNZKreMA1KoPTrkGrzlStu2SrvZT0YQI3Nlt0xYA1V3sIBUuDH5X
         UMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GGoANcuykOeNvVyPC1uTg6plWiv3wDwrGM2Gcr4/FQ4=;
        b=d4aT5y0rbAZ1q2fF5ASEZt3+uSqKSBNOq238teKyH4PcJPL+83dbszLld+R1torCHm
         y5C0OBajSc6/S/+67hbGWoX3qMoDSguRwimzOaMtjwxzr9sQkruzfgSi7v4xlnsYBPNw
         zGAkSTsgIjFdp1xoQLVlZF4csngUR8ulXIKfnNIaUrVCXQ/uVMkTZQdLaSV74Tvi83mZ
         vfSqhSdh6dC7SsCwY46Jkh6lLZM8tDKM/2vaL1YlIUtqAPN7deqMwfMEQv6GMY0LRhGt
         vxNzkBRaajtvLpnaUS8Aw/zVyQ03obm/BHvgU0BAwSDDsmtHhERvWl56PHb2BWIA3siE
         aBcA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530H4+EoRmOqGQRyhc0AeqsaUezXiRBo58FhSUFwCKuKo2CA6U/y
	ZNtXFwd3PJm9l/atqSelCsk=
X-Google-Smtp-Source: ABdhPJzVssASeXON2FPMZy1AF+FEYDZxREahAx881Es5QcxHnVf0TEzqhjCUflt7HT1/1STjOon6UQ==
X-Received: by 2002:adf:e588:: with SMTP id l8mr26419057wrm.255.1591638511035;
        Mon, 08 Jun 2020 10:48:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls155023wml.2.gmail; Mon, 08 Jun
 2020 10:48:30 -0700 (PDT)
X-Received: by 2002:a05:600c:2215:: with SMTP id z21mr488433wml.48.1591638510264;
        Mon, 08 Jun 2020 10:48:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591638510; cv=none;
        d=google.com; s=arc-20160816;
        b=Ef4RkAPYXvkQUwNHI4DTpuw1MZdb7leNrDV2cH3xeVKKeMh04KlwWH6PHNB3yWDf5M
         YDLEgrOU2GXFkGkQFGnPvmuoKW8Ns82mK2RJoALC9+6Zyu4rDCrGYNOVIok/mSwSi54R
         LZdxns2FLKQjEDWp0Hc+fBY11JXRxQOkEG011jY23DdPFY1PSX2hwSmQuOEZJNcZ6M+D
         1M9Jw28ThnGLosejLYbsnSwzuFrW97VV2J7cIvZoA3HfSfqRM33O73jGQfujKa+K3b9m
         4XA9fgH29duvKO+U3/TMhNd8ZBSoyPtYJslhtOix/P/mWkdGPSQcFRoIi6NanYfbZ/YM
         Lezg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=BOagDTp3xVBT2OzNoHG4lFZlLQZ+yNYESIzHfwWA5Jw=;
        b=UxhhgSuO9rL3dzhxvbi7sW3aYXMqSETeDxsNL1fXbPxt07jmeZaiUyzL+jh0eTVpGo
         OSF2nSOmQuFVZJkBlkzYJTHj5gD/9KAjHcjuLeTvmqAxLmPhic5sgxNcXFS3ZtibORbt
         ky1ygJBYSAwh+FfBH/9w58zC+ZnMxp4AGPSDmM4k+iuib2NHkh+wd9juqTS9aM3b57qm
         YqQeUkUf5QHSO6bdmCNA0PbG2Y131VWkTPs54NR+Jsj0JE5QjRgUZ9i+CAhv/Jb/7MoR
         DDfNx9bSyjERlparqsYGB/w2D67Op1iTGvKZ731x0SXpAvxwaJAAyfd2rdJ+BTPu9rDk
         MOfw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w126si37473wma.4.2020.06.08.10.48.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 10:48:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 058HmTB4008735
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Jun 2020 19:48:29 +0200
Received: from [139.22.35.12] ([139.22.35.12])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 058HmS7q017918;
	Mon, 8 Jun 2020 19:48:29 +0200
Subject: Re: [PATCH v2 4/9] configs: k3-j721e-evm: Add IVSHMEM demo device
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200608104255.18358-1-nikhil.nd@ti.com>
 <20200608104255.18358-5-nikhil.nd@ti.com>
 <d1f2b18a-2891-61c3-d66b-ce0c95575c09@siemens.com>
 <7c48aaa9-a5e1-4f1f-8947-a0f297d07354@siemens.com>
 <54f5799c-4dc6-b17d-7ab4-52fb5fd4ff6b@ti.com>
 <1a4a35d9-8530-d4cd-da64-578d41f95eba@siemens.com>
 <98cd82d2-61e5-a7d7-e83a-b734321f93f2@ti.com>
 <efc83a49-18e2-14b9-e581-7eef91766d80@siemens.com>
 <379ae683-4540-c868-cb99-b5017680d157@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <e6cc9d5d-c555-72fb-9e0c-2af2d7d0c0dc@siemens.com>
Date: Mon, 8 Jun 2020 19:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <379ae683-4540-c868-cb99-b5017680d157@ti.com>
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

On 08.06.20 16:58, Nikhil Devshatwar wrote:
> 
> 
> On 08/06/20 8:21 pm, Jan Kiszka wrote:
>> On 08.06.20 16:35, Nikhil Devshatwar wrote:
>>> On 08/06/20 7:54 pm, Jan Kiszka wrote:
>>>> On 08.06.20 13:43, Nikhil Devshatwar wrote:
>>>>> On 08/06/20 4:51 pm, Jan Kiszka wrote:
>>>>>> On 08.06.20 13:16, Jan Kiszka wrote:
>>>>>>> On 08.06.20 12:42, nikhil.nd@ti.com wrote:
>>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>>
>>>>>>>> Add a new IVSHMEM PCIe virtual device for a 2 peer
>>>>>>>> IVSHMEM demo communication.
>>>>>>>>  (0 = root cell, 1 = baremetal / linux-demo)
>>>>>>>> Also add the corresponding memory regions for state and output
>>>>>>>> aligned at 64k boundary.
>>>>>>>>
>>>>>>>> Update the bdf numbers for consistency across all platforms.
>>>>>>>> Assign domain = 4 since the platform already has 4 physical
>>>>>>>> controllers.
>>>>>>>>
>>>>>>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>> ---
>>>>>>>>  configs/arm64/k3-j721e-evm-linux-demo.c | 52 ++++++++++++++++++++----
>>>>>>>>  configs/arm64/k3-j721e-evm.c            | 53 ++++++++++++++++++++-----
>>>>>>>>  2 files changed, 89 insertions(+), 16 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>>> index cda1614a..05517751 100644
>>>>>>>> --- a/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>>> +++ b/configs/arm64/k3-j721e-evm-linux-demo.c
>>>>>>>> @@ -24,9 +24,9 @@
>>>>>>>>  struct {
>>>>>>>>  	struct jailhouse_cell_desc cell;
>>>>>>>>  	__u64 cpus[1];
>>>>>>>> -	struct jailhouse_memory mem_regions[18];
>>>>>>>> +	struct jailhouse_memory mem_regions[22];
>>>>>>>>  	struct jailhouse_irqchip irqchips[4];
>>>>>>>> -	struct jailhouse_pci_device pci_devices[1];
>>>>>>>> +	struct jailhouse_pci_device pci_devices[2];
>>>>>>>>  	__u32 stream_ids[2];
>>>>>>>>  } __attribute__((packed)) config = {
>>>>>>>>  	.cell = {
>>>>>>>> @@ -56,8 +56,35 @@ struct {
>>>>>>>>  	},
>>>>>>>>  
>>>>>>>>  	.mem_regions = {
>>>>>>>> -		/* IVSHMEM shared memory region for 00:01.0 */
>>>>>>>> -		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
>>>>>>>> +		/* IVSHMEM shared memory regions for 00:00.0 (demo) */
>>>>>>>> +		{
>>>>>>>> +			.phys_start = 0x89fe00000,
>>>>>>>> +			.virt_start = 0x89fe00000,
>>>>>>>> +			.size = 0x10000,
>>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>>>> +		},
>>>>>>>> +		{
>>>>>>>> +			.phys_start = 0x89fe10000,
>>>>>>>> +			.virt_start = 0x89fe10000,
>>>>>>>> +			.size = 0x10000,
>>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>>>> +		},
>>>>>>>> +		{
>>>>>>>> +			.phys_start = 0x89fe20000,
>>>>>>>> +			.virt_start = 0x89fe20000,
>>>>>>>> +			.size = 0x10000,
>>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
>>>>>>>> +		},
>>>>>>>> +		{
>>>>>>>> +			.phys_start = 0x89fe30000,
>>>>>>>> +			.virt_start = 0x89fe30000,
>>>>>>>> +			.size = 0x10000,
>>>>>>>> +			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED |
>>>>>>>> +				 JAILHOUSE_MEM_WRITE ,
>>>>>>>> +		},
>>>>>>> You are missing the state table. Was this tested?
>>>>>> Ah, it's there, just 64K large due to the different page size.
>>>>>>
>>>>>>> Please derive from existing examples, using the same patterns and sizes.
>>>>>>> Reference is qemu-arm64.
>>>>>> Still, please follow the default pattern (with adjusted page size),
>>>>>> which means triangle by default, 3 peers. That may eventually become
>>>>>> part of an automated test, and then all boards should better have the
>>>>>> same pattern ready.
>>>>> j721e has only two A72 cores. So max two cells can be created.
>>>>> linux-demo and inmate-demo are mutually exclusive.
>>>> Oh, sorry, missed that completely. I was expecting a quad-core at least.
>>>>
>>>>> That's why I have given the same id to both because I can never launch
>>>>> it in parallel.
>>>>>
>>>>> Do you recommend to still give a separate id for these cells?
>>>> Nope, that's fine then.
>>>>
>>>> But now I wonder why we need to patch any of the demo code. If both do
>>>> respect the max-peers value and send to (my-id + 1) % max-peers, they
>>>> should "just work", no?
>>> Same reason as before.
>>> To be able to choose whom exactly you want to send interrupt.
>>> Triangle is only for demo, but this way, you can send interrupts to any
>>> device.
>> If there can only be two cells at the same time, root cell always in,
>> it's about root cell sending ID 1, and ID-1 cell sending root cell. Now
>> both demos encode hard that max-peers is 3. That can be fixed (i.e. read
>> the related ivshmem register), and then things will just work (TM).
> Agreed.
>> No command line switched needed. They would only be needed if you had a
>> setup with less than max-peers, but that is not the issue here.
> Yes, that's once case. Also the case of two Linux communicating with
> *each other*
> If above is not planned to be supported, I can drop the changes for
> command line parameters.
> Let me know if I should keep it or drop it.
> 

If you can make the target parameter fully optional across all demos, I
would still take it.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e6cc9d5d-c555-72fb-9e0c-2af2d7d0c0dc%40siemens.com.
