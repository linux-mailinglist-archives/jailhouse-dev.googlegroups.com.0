Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBIPUT3UAKGQEYG44M5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0B44884A
	for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 18:04:50 +0200 (CEST)
Received: by mail-ed1-x53b.google.com with SMTP id y24sf17055205edb.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 17 Jun 2019 09:04:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560787490; cv=pass;
        d=google.com; s=arc-20160816;
        b=n/Pg0WV3vxnNdLKnDsJg3CzOvBkYxC8DxY4D2C80azfh2RxdCsIkMTj6/nAktD5fhp
         E2eMTagFvuuXKTn1Tixlr2F4g2MLYYFSUq26X+uw8DjvPKBs24DIrfQHWauLYmNJhB/S
         xzKjobYPLQDSbu4uJaU9wl6+WA3iisP/T7nJOJ4k87bCGHGlJpIiEN5dxbrao9EXQH97
         pka1mpq4vMJgJ+HnNHq/Mkf5fX7aYhtKK3cwDyPYiO/9VE/gWdzRf5vuEJNyUEGT78np
         014b8H22mjhdQmYt+HysNexptO+kkmdc0Ev272q/A/w5lyqqO4sOQ/00RH5XaVNZn6s9
         VRIg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=gCf+Xj4ORg6mGA9ZnWf/uQ/yriGJL3WZl0HJZ4qFNgM=;
        b=egNW19YjGtXYsaLb7SB/elAFzjy2jQ6C1fAh1i/YQtAzIv21FUkU9iJNeKQVkk12QY
         L7sitJWFHWMdj8Qva1exfhxMKi+m9XQvt1/5Bhb1jALiJnzade0mesR1HokbHIy/l7ne
         6Y6Jwoi+ZNQk/iPe9S9x3kNs6l0ISs6YC6wBkvvkpXNHP8NvwrWa0wLuHvjwwPG5v+HY
         UueJHKfP5JUfXfILL8ERV1T+zas1DJJ8VNy1fpN5fwK8G2fIZa/822XNLEx9GdkJW1Fu
         63V4Mzlj1aXuvFeDqw7RqGJYukRwb2Tmd8xIeRBtQfGzeISqKrn5r/4ItT7yiYvLmVpv
         TiIQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=gCf+Xj4ORg6mGA9ZnWf/uQ/yriGJL3WZl0HJZ4qFNgM=;
        b=KOPnR8fJ8cfaCOhwrwR/Dtr5L3nfJvFCqrM/YmP6lzfkwMe9MfoTPK/OfafxKGzMyJ
         y3ivh3n7DcAS/VS/wrppECE/QZ2byQjrIiFDuGSW/v3MJ3EPXSqa78F2KSvOvtJRt81M
         ifmfDBtVbkvU0PRMvq0MhCyTPOmSLiWmgFO1q31v26rxK3G8JKhYUbcijozPgCvosHJL
         2DOrd1+fBFykImKtXuizCedAL19lOEAjj/VSgrhjBg0kj/3ZGEYFrI4YUUZiMWzd3l//
         i8p5/qIFS9UCjIb/ktEeJHbPY2caSN4U7sjWZjDRvrcDYAnSUzpyPcJtv39YUaofQ7/4
         WGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=gCf+Xj4ORg6mGA9ZnWf/uQ/yriGJL3WZl0HJZ4qFNgM=;
        b=cEecdEGfkT0aGkrupgp48owFJh0Jl549Vn7byunWRl8Y7NW+nT73XhyLLP3ywhUU9q
         KhuUxfMNewV/+ukAtikouTW3vDusn6NNCJH+8dGpVR/Z3Tum6X2BX7TOdWSWk2gcCSu2
         szd3g6UPkMuqUTr2t3C8AGLh6tNKxcmuvPG1GFkFNMTSRyPhhgA2BL7pIhUHD1ZOLafO
         B8FvHMtKVWWhU6a0QnkkaNG8VjEfMRUEu1K9vbN8HASN0taNuIPPW+Z3j4o5JHALMTrn
         Vw4Z9LgpjZhL85k+FDwYDqRia0TlGNLW4Q7CVcQCwtWFwIJalv4q2JsL66nGb45dSo1R
         e++g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXKLOvkEf7ShUSsxFxg1zrMjM/Hp5mw3QFCpi/8RkE6qrYiMmXr
	i20YpO0aCxgw7SV1M+wVnHU=
X-Google-Smtp-Source: APXvYqxVrpdBgiJNijmdS2KpskDkZlF5+Hc7slZRN4xfRL/FflehflR9Wnf6JOVyNtFjd3PI79H1MQ==
X-Received: by 2002:a17:906:5255:: with SMTP id y21mr22325986ejm.253.1560787489978;
        Mon, 17 Jun 2019 09:04:49 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:158e:: with SMTP id k14ls3570137ejd.2.gmail; Mon, 17
 Jun 2019 09:04:49 -0700 (PDT)
X-Received: by 2002:a17:906:1385:: with SMTP id f5mr19503762ejc.137.1560787489031;
        Mon, 17 Jun 2019 09:04:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560787489; cv=none;
        d=google.com; s=arc-20160816;
        b=fhtS34NIC++ywiCytxLUGUK/jMc6Z+B3ngli6X5ReTpSWH2YW7MsVbZNCFUsQ2nxcT
         CtIJY8taCY4LKa0x7bgFXWJrG/hWBZIR7L5UAFbtgRpY4HH8Y5axmx7okK1d0atKmqIO
         MaNdbUWM9319NEImBL2zir470dii35SSWwloaRnNUZpYRJhnhjecJK/AtEHcftSaY/Kl
         ENH3fguqSiz9bxNTMP8NXQVK83kF3lTmCS4cFjDfLawlMmWrDng6v3sXyt4+LuO+ZBXy
         uRiM0XTllyjChA7rGGv4iIZ0UPUVlAh8Gd8vg1O/oJTAEt1PjD09cT3x1fkNSvaESRJB
         Mskw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Ri6Au9EFoOQTJaqf18fhoslaefgi4dLkaq1QONRY/do=;
        b=Bj2OydYByfQ7vm463x5AEU18F9+24GVtkz4WFQa5FAgrtVemyuYAiZNZDLG1kJFDSC
         D5l3XjXCd+qp4Q02pcdaGFolv3JF1dYJa/dw0PsA6JPR1/87EXbbQ3qLxo7Az3n8wc9t
         ovOq+56ekPEiTn9Bsm0AfblNmKBrPjGmjn9o1WgL53aNP9x4bhJfP1eC73N0PDZS7VCE
         xaKmgTH+YzaUoHSLnvo9BY68VY4bZ8sp8jLlFN2VIHqeiSHA9h0Z4ND/yEQ+36ga9Q/C
         7/zoYi0m/h1n8yM/Td7Konba2NfrH5+wIAwSvldn/Y+6/ExtVQuA3swNsXN9jmDx+gjh
         n6lA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id e8si468808ejk.1.2019.06.17.09.04.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Jun 2019 09:04:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x5HG4mY3009153
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 17 Jun 2019 18:04:48 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5HG4mnX006952;
	Mon, 17 Jun 2019 18:04:48 +0200
Subject: Re: Finalizing 0.11
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Andrej Utz <andrej.utz@st.oth-regensburg.de>
References: <9a1a19fe-57c5-a5d2-f5a3-547e07bbcf8b@siemens.com>
 <e7496701-fcd6-8c8b-ee43-84245c782943@oth-regensburg.de>
 <dd35885b-522f-3291-0c53-297e2d2d980d@siemens.com>
 <464227aa-f75a-9823-772c-de19242e8576@oth-regensburg.de>
 <159a6d4d-cde4-cd0d-48cb-20be69fca730@siemens.com>
 <cac410c5-4a74-b77b-508c-210f69b14498@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f04f3f96-921b-67c4-2e64-1939d4f04339@siemens.com>
Date: Mon, 17 Jun 2019 18:04:47 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <cac410c5-4a74-b77b-508c-210f69b14498@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 17.06.19 16:14, Ralf Ramsauer wrote:
> Hi Jan,
> 
> On 6/17/19 12:47 PM, Jan Kiszka wrote:
>> On 17.06.19 12:18, Ralf Ramsauer wrote:
>>>
>>>
>>> On 6/17/19 12:15 PM, Jan Kiszka wrote:
>>>> On 17.06.19 12:11, Ralf Ramsauer wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 6/17/19 9:49 AM, Jan Kiszka wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> by the end of this week, I'd like to tag a new release. If you have
>>>>>> anything pending that should be included, make sure to post it soon. My
>>>>>> integration queue is empty, so also let me know if I missed something.
>>>>>
>>>>> Andrej still has two patches in his queue, but they're not necessarily
>>>>> required for v0.11.
>>>>>
>>>>> There's still the MSR bitmap issue on AMD64. Valentine didn't respond
>>>>> yet, I'll have a look at that soon, it's an open issue that should be
>>>>> fixed.
>>>>
>>>> Let me look into that.
>>>
>>> Ok. (Maybe that could also be the issue why apic-demo shows implausible
>>> timings on amd64)
>>>
>>
>> Followed up on that thread. Should be quickly resolvable.
>>
>>>>
>>>>>
>>>>> Other than that, I'm in the meanwhile pretty sure that there's something
>>>>> odd with VT-d, but I can't yet tell what it is exactly.
>>>>
>>>> Do you need me to write an instrumentation patch?
>>>
>>> Maybe. Let me try some other things I wanted to test last week.
>>> Otherwise I'll return to you.
>>>
>>
>> FWIW, please try this nevertheless:
>>
>> diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
>> index 1cae0dcb..110184fa 100644
>> --- a/hypervisor/arch/x86/vtd.c
>> +++ b/hypervisor/arch/x86/vtd.c
>> @@ -567,6 +567,7 @@ static void vtd_update_irte(unsigned int index, union vtd_irte content)
>>   	void *reg_base = dmar_reg_base;
>>   	unsigned int n;
>>   
>> +printk("%s: index %d, present %d, content %016llx %016llx\n", __func__, index, content.field.p, content.raw[0], content.raw[1]);
>>   	if (content.field.p) {
>>   		/*
>>   		 * Write upper half first to preserve non-presence.
>> @@ -824,6 +825,7 @@ int iommu_map_interrupt(struct cell *cell, u16 device_id, unsigned int vector,
>>   	union vtd_irte irte;
>>   	int base_index;
>>   
>> +printk("%s: device %04x, vector %d, irq_msg %016llx\n", __func__, device_id, vector, *(u64 *)&irq_msg);
>>   	base_index = vtd_find_int_remap_region(device_id);
>>   	if (base_index < 0)
>>   		return base_index;
> 
> Please find the hypervisor log and the sysconfig attached. Just for
> completeness, some other useful stuff is attached, including the output
> of jailhouse config collect.
> 
> One remark to the Jailhouse output in console.txt:
> 
> Everything looks unsuspicious until we add PCI device b3:00.0 that needs
> to reserve 97(!) interrupts.

Well, that's likely what this thing could potentially use, based on its MSI-X 
vector limit (unless we have a bug in reading that from the hardware -> config 
generator).

> 
> This is the point where instrumentation starts to output:
> 
> iommu_map_interrupt: device 0400, vector 3, irq_msg 0001080000002822
> vtd_update_irte: index 109, present 0, content 0000000000000100
> 0000000000000400
> 
> The hypervisor stucks for a moment when printing those lines. In sum, it
> takes a few seconds for Jailhouse to enable.
> 
> b3:00.0 is a megaraid/megasas standard raid controller, 04:00.0 and
> 04:00.1 (0x400, 0x401) are the Broadcom network devices that we loose.
> 

Let's pick the first:

VT-d fault event reported by IOMMU 3:
  Source Identifier (bus:dev.func): 04:00.1
  Fault Reason: 0x22 Fault Info: 1f000000000 Type 0

Interestingly, we program not a single present IRTE for that device. So the next 
thing to check is why that is the case, e.g. what happens between

iommu_map_interrupt: device 0401, vector 0, irq_msg 0001004000002822

and

vtd_update_irte: index 123, present 0, content 0000000000000100 0000000000000401

>>
>> Should list the IRTE entries that are written or invalidated. When
>> matching their number and device ID against the fault later on, we may
>> see clearer. If not, we may need to go up further in the call chain, to
>> the callers of iommu_map_interrupt.
> 
> After Jailhouse is enabled, and after the VT-d faults occur, we receive
> a couple of those lines
> 
> vtd_update_irte: index 16, present 1, content 000100100022010d
> 000000000004f0f8
> iommu_map_interrupt: device f0f8, vector 16, irq_msg 0001001000006822
> 
> on every key press of the serial line.

There is probably some mask/unmask going on that we see when it hits the 
virtualized registers.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/f04f3f96-921b-67c4-2e64-1939d4f04339%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
