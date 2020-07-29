Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTEJQX4QKGQE7ZJSF6A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A7B231C42
	for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 11:43:41 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id e12sf6473932wra.13
        for <lists+jailhouse-dev@lfdr.de>; Wed, 29 Jul 2020 02:43:40 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1596015820; cv=pass;
        d=google.com; s=arc-20160816;
        b=XRwK8HhrTsxhyz9Ac2VIRaD/TAS/1+5o9KJcs8MFHaaov4DHLDIzoeiVE0jw+Kv9nM
         TeseeUsCqx90u54N3D/w4ncE/GWPjLkyLcEJqyh+pPz0Oa9x475cVKqtmHYB7DSJ5gez
         SNNpoI3nEXGWl1lrZgL09KFHtJvv88YfIAYzDQFuNvgby7QbZQUDFFlUf4tuIaiPpSxa
         saHBBHUwPieLTgE9pIUzOwYwFGxY7JK82hw6cR2ugW+3W7Zuiiay8Xf3p1POsikZ0CC+
         jMGnfqK6F8bHHR+VDT9PcnLCZJ30M8zy/KBqgh2nqtMDx7L78LuZQNv4wKVhzdX8hkWW
         xGlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=TSXKFKe7FfOVo+SHWpJfCBq2jtOWynzjMqpTrrXENpU=;
        b=DfUfhdvzSWK3nuZyp9vrPYMuNiFywpiG2vO+Pq63gSJgsCT6S0dD8R9sVUqZoRMxSE
         /UxfEvLp/Bi/65O+r4VPNWQ7vE66m9FyOByHAjYiDfOybS9VPbLQC6CIEp05Rc1CoEl5
         xiHDl6kti+Q7fxzcGvuSRr7D5Xw+NxAJCQz8mN1JU9Td5xUDuzRYMHWpvgQJxXMxQniU
         rZAbUvn/etbFoeyTazeBmPKMgnfD5rIb9GdD6qJYaBUjQA6q3TUB+ewUZogFdeBhoaYe
         DD74vItSxknmwnSbiF2AnrfXu6pF3w+YRuGNOGBHyP4Hd7pqPQMkN4XoTNM5aqIp1M3W
         eAPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TSXKFKe7FfOVo+SHWpJfCBq2jtOWynzjMqpTrrXENpU=;
        b=Cy4SkmwcNZ6DKiSLgSJsqSJxcUYXDG6+wqoTXFJIQqYtSRIs3DELFAqwqYtYkYWOQ8
         9e9uy8gHOQRKAsKwLVJh/3ZzAdVCX5GIpdSJ8+XJlklsQfsU8TQ2zufSjm1YRsqp3J8y
         lujAPbetXhO4BQpF7awMPaeEOTPVPngHY7X2VGbj2feCZZAYIcjajAuUKSLJiYE2aT2u
         oC3DynJOc/ySwSVogIQMn6bm7ohNqz4EkLjlpCygCQSqnrh5Ct2JkBhcveJlMotLBdtm
         dx3Ku5dkt6pMBvsjFYla0TZTVzInzVp+c/dIpaCcTFs7lpdmcPpwGh1X3kKyq/Dz4ry5
         ypvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TSXKFKe7FfOVo+SHWpJfCBq2jtOWynzjMqpTrrXENpU=;
        b=dsKlEI7sB+SCEpRG0GqyRC7IdtBUwp+1b1oCnnbN1xLjoCbATXWaE/g4IL6kVGNAlL
         9gBQe+XLZ5XE/LVoouPhpPDYjfuaSXfanZanMIIysGRUV63Qy1BnkKcTsgDFUvaiHFve
         OYbPibx4gu0EHDc+VveIWgJ50ADt1kDTwwv2GmnRv6tZwgmaxmlpZWslnVgfOoZaovXn
         pcOGZePFeIKBYdq8KQkO//ZPPKfexkxoBya6xq8AG5ojpy0yZBb3dKbcTWqoUW9MjGdI
         F8xr75aaXP8vvAyfdgHjd98ds5J1nF2lKlwijv3jlYl7uCxLJIrjxI2p44j4hKRX6DDi
         LGAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532H0VypeV452SbabPS4yv0Qk/g8/Z0mVBeZ7yl5siSBObS3NmeT
	GugIy9O9jAJVkKklLy7FYE0=
X-Google-Smtp-Source: ABdhPJx6Os2L6Io1Jal+PliIVitHPnztDE5UaUgV3MAUhTQrG7KOLBlw11Iu8dTdQy5IvHwY366UBg==
X-Received: by 2002:adf:b352:: with SMTP id k18mr30154101wrd.386.1596015820768;
        Wed, 29 Jul 2020 02:43:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a3ca:: with SMTP id m10ls361896wrb.1.gmail; Wed, 29 Jul
 2020 02:43:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1203:: with SMTP id e3mr29403875wrx.324.1596015819930;
        Wed, 29 Jul 2020 02:43:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596015819; cv=none;
        d=google.com; s=arc-20160816;
        b=AdxoocTJakPluWPdguyIPeC6vPEwWAyyenLHja/ofdV6Yb28GSIdgEzkIDiZn/IOTC
         t/V9MgXvq6vxfPBptA07jUdZO5fpMRuhwBEP2QbB9N6McYciC+hkY3axLcRPMM8CN/ke
         eaBzCqEMa5ffVZER9dHF3ErAm4nik6XRWbhJt1+u8bk/iMmqNOqeug3WunQ6HJ8H23g6
         pO/hB6/8Y+0bX9gPX12n2xeM+DUOd8ByVymo7T4fwjlipL6byvqp9A3iAqNJPyeVuRun
         0+XjJdp0WxvPVCmQgfoGMmWGCMP10w1W+EG+t0QrhBsgnsRbplZD8CgCczwW4340zhGW
         wN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=b8LG5Fb22BP4sk34ebVtnxnGziPhV3gjVJp97qinT08=;
        b=Kc6nwtknQqkpVK2BXKexzIvJUMCVOkbSvBE+G97BBOFIKicFJw/lJUYrm/aCBu+kI/
         SPpr+gDI3QaiJ5N4AKSykkGCSoFruB8QtyYrk/ecTlQWW1Wve+CtZe5ideObg06NwHv4
         nUVOfZ4rYmysbbt8VUbw9aFCVPrkR6c77WB9u4qbjP9aedGJzyIScWM/8CzTFPUj/Z9n
         IjNuQyjt4ve8GqQqaPa5KTkyU0ChHHjTkdS8AIeKIJ1xn/vNhqb030OcDwXrWFqDJlNk
         7ME8Ox+ztNS+nbfsuHLP4HYdz1JCYAC8R8M9IXBmU1v/SzaKDB3ZEUq1nErJWv4GEeeA
         5ZDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id l18si103000wra.5.2020.07.29.02.43.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Jul 2020 02:43:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06T9hcGS031479
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Jul 2020 11:43:38 +0200
Received: from [167.87.13.2] ([167.87.13.2])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06T9hbqJ013215;
	Wed, 29 Jul 2020 11:43:37 +0200
Subject: Re: jailhouse jitter?
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>
Cc: Nikhil Devshatwar <nikhil.nd@ti.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jose Martins <jose.martins@bao-project.org>
References: <DB6PR0402MB2760BE2A66C776875890B5DF886D0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <CADiTV-0qHuXt=wrGCp4RbFWcu=WGsZKB-doXOTxjMVZkRiiiCA@mail.gmail.com>
 <1d5b0ac8-0744-59ab-bb90-8133df4a1525@siemens.com>
 <d0b0c698-7ee2-97dc-7b6e-685f2f169f39@siemens.com>
 <CADiTV-1oJBD+SkAT475xD5iODeo24wqwBSFGu2JQATxqpF1W0w@mail.gmail.com>
 <b96f90ad-23bc-db73-9603-f9eb640804d0@siemens.com>
 <DB6PR0402MB2760B4463A03D7FC4EE3E4E988780@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EA5C808D0A49208E7A9788720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <640c6eb8-07ca-c354-f888-abee87ff49b6@siemens.com>
 <DB6PR0402MB27609A148CE4F1B5DC105D3088720@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <8c4f35ef-1b12-e08a-6d20-85d7c6c0fcad@siemens.com>
 <DB6PR0402MB276063FAB38B540E81ED7D3288700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <1dffaed3-aec7-2bd5-7046-88059813c63f@siemens.com>
 <DB6PR0402MB2760893A4ED60F92C6E107C088700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <1d8a1ed4-0389-cf14-7a69-e0af5dd99a13@siemens.com>
Date: Wed, 29 Jul 2020 11:43:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760893A4ED60F92C6E107C088700@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 29.07.20 11:35, Peng Fan wrote:
>> Subject: Re: jailhouse jitter?
>>
>> On 29.07.20 05:28, Peng Fan wrote:
>>>> Subject: Re: jailhouse jitter?
>>>>
>>>> On 27.07.20 08:56, Peng Fan wrote:
>>>>>> Subject: Re: jailhouse jitter?
>>>>>>
>>>>>> On 27.07.20 08:25, Peng Fan wrote:
>>>>>>> Hi Jan
>>>>>>
>>>>>> ...
>>>>>>
>>>>>>>
>>>>>>> I tested the SDEI on i.MX8MM, it shows the jitter became smaller.
>>>>>>>
>>>>>>> Without SDEI, the gic-demo jitter is 999ns+ With SDEI, the
>>>>>>> gic-demo jitter is 124ns~246ns.
>>>>>>>
>>>>>>> Indeed no more vmexits.
>>>>>>>
>>>>>>> But the max jitter, some times SDEI bigger only when program start
>>>>>>> up,
>>>>>> mostly because of CACHE WARM UP I think.
>>>>>>
>>>>>> That is one source. If you add a warm-up period, they can be
>>>>>> mitigated, though.
>>>>>>
>>>>>> The other source might be last-level cache sharing. If there are
>>>>>> cache-miss counters, maybe you can check if those increase along
>>>>>> the
>>>> peaks.
>>>>>
>>>>> Yes. When I add stress-ng in root cell, the jitter became larger sometimes.
>>>>>
>>>>
>>>> I've seen the same on the ultra96. My cache theory should be
>>>> validated, though, because I would have assumed that all of the gic
>>>> demo fits into a core-local cache.
>>>
>>> After thinking more about root cell color, when booting jailhouse before
>> Linux.
>>>
>>> We are not using 1:1 mapping anymore or we could use 1:1 mapping with
>>> many pieces of small ram area.
>>
>> I suspect Linux may not like a device tree with hundreds or thousands of
>> memory region entries.
> 
> True.
> 
>>
>>>
>>> So I think the first 1 is better, but when use kmalloc for dma usage
>>> sometimes, it will bring issues, because not 1:1 mapping, unless we
>>> let all drivers use dedicated dma area reserved and not colored.
>>
>> We will need an SMMU for colored Linux instances. That will make things
>> appear 1:1 mapped again for Linux.
> 
> But SMMU is really eating silicon die size, many platforms not have that.
> 

Well, then add proper cache partitioning in hardware. Then we can drop 
all those coloring hacks. ;)

But without SMMU (or at least some IO-MPU), you won't get a proper 
isolation, only collaborative partitioning.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1d8a1ed4-0389-cf14-7a69-e0af5dd99a13%40siemens.com.
