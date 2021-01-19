Return-Path: <jailhouse-dev+bncBD4JZQXE5UFRBV7ZTKAAMGQEAULLXGA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x338.google.com (mail-wm1-x338.google.com [IPv6:2a00:1450:4864:20::338])
	by mail.lfdr.de (Postfix) with ESMTPS id CABD62FB589
	for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 12:04:55 +0100 (CET)
Received: by mail-wm1-x338.google.com with SMTP id k64sf2159015wmb.6
        for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 03:04:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611054295; cv=pass;
        d=google.com; s=arc-20160816;
        b=p0TCaccv4c8J0vonMur8KmblxXz3Ux0Lxb/H5IMZgwoZt0+kBLIO4k/SMW2bq6Q/z2
         VCx7iR4EyQ2AYb76OpNMyOrbEUCWgPtO1sSKus+gU6ofOmJcOqce6FjYCoKtgyk7nGLO
         PlAAPP83GLm4CJdH484TllxGOXMaS14btU5F/AHBBw0XluK5oIuvOJqxbvkOOO8oQelR
         l4aiaZ/28BkpaLub5JT6b0mMNy+/BYGh5TNIVQSRzenK1YBpn4RzNkjvLByr+Gi1Nf7Q
         G8YuFd8xbxzXpF0h49hhCyEpi1Q5kKyfuOYaZmxbc2JvzMUnP5z9CL2GrZCimYVeYWqW
         F5SA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=j/Xk5gXfi/JLpCtCsmw5e2P+HmIh11TRJg0CKbtCPck=;
        b=CQaTiZ+d75SOZPQ5NLftqQ8GMgOalxmOXU91fKJEQkAIqQDALpwusgsRw6PNecbipS
         HiJRBdXVbs+RWiJ3hGX6DfU34xDoN+Hm8r+Ihu0uV5XDasHPLPjrxeXn0o82xuv/Ar0N
         SMwUzR1mJuk1B3GrRh4scOodobdJkRQhWXez+dMCDSSP2fuinT2WUuVdtuaUlj1jm3BB
         h5o3zvi4zTYswqIzmXLHElJeSKNfEI8XM15KhhwaKLXVtM8D8ZESZrZwUP5S20gUltc+
         dUFFqJcKgFBnxliZ5sgcue6AXRLmoJSKVh5qc6eiJ9tnyfgTPwoQ56OzyBXX9ocgjCgs
         pxZQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=a54tgzGn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=j/Xk5gXfi/JLpCtCsmw5e2P+HmIh11TRJg0CKbtCPck=;
        b=WVP+5cpIGFoAUf4TfmsmiCUidmYa8T/9XhS9nC/45BL+0KPM6jeGMfW0Cm2h+hCV5N
         dK+VXS+PXfpJMS1MCsE8Iz6rnIHe2MDnmFi34l1YiuzfS//5oytonDzJKlkCh+DmzCxn
         0SmAkEupgIPD0+2TTUduLIQc1EgXBd48SDRAjjuXIaJuLYRTrcYHbi0IJk4PTy+94CT4
         3ADKnakMYNpizzjx9u44xIXmjfTCHPDnsv6J/4l3jG7gDb3TicJRF8ZI/lg+hO+huj+Y
         HyWTt2LHGSSRS05nHg6QaXCiKRKNZzMWX/yvVmPEdYYL9cgJAeq3Qm+SAJXPLG/70GJh
         fckQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=j/Xk5gXfi/JLpCtCsmw5e2P+HmIh11TRJg0CKbtCPck=;
        b=O1qa1OoQ+lCIgxCCKbDkcU2CMbKT1kJv9u2eXp4g0CpTqIFJzZWESoohWnQH6pMh/9
         6uGPW4I863xPB+ggUkFvMv63SEct56uv7fdCdrGc0XISnGxgLFaCljxC8fDfbsnJ9oUl
         ft8sK/2XmUtj9WLZswRHScMGuav9ajzbaQP/G1cphB7BJNJdh9Fgi0V0oK04aS4Y+tru
         VzVEEExrg9R4QCHPS0p0M8BXEvzvHwOTkRxrjw81AZXHDJzI8GpeTZh/SRYfO7nGou2l
         hHwJ6nhiBt932xA8Eyf9OenQtzVCSjKvdwKBfkPA/VE2hwH9BOd2MKPgaspvjBC1Bzg6
         voAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Obi2U8yn/IoLZDod1oFPtXsGbBnM47QEmGWVs4qzvXKVR5QHs
	5dML2SF0OZB4ZgH4WBUJwnM=
X-Google-Smtp-Source: ABdhPJxy7IoR7BUmZ9OFZ8BZJkQrw8s5Q/eIaYVXdUQhNFTK9kDlwT3lYeOpXjtqVPudF9JGVyounA==
X-Received: by 2002:adf:f684:: with SMTP id v4mr3822211wrp.387.1611054295513;
        Tue, 19 Jan 2021 03:04:55 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:bb0b:: with SMTP id l11ls7254362wmf.0.gmail; Tue, 19 Jan
 2021 03:04:54 -0800 (PST)
X-Received: by 2002:a1c:6a02:: with SMTP id f2mr3662474wmc.36.1611054294650;
        Tue, 19 Jan 2021 03:04:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611054294; cv=none;
        d=google.com; s=arc-20160816;
        b=ug4UyJUNVKGCfWl7JgHvclCuEzouLpADcUz5XAUMrjSgJqZAyOljObD4p1nrU3SWkV
         swar0St3K+jrhfj2e91Y63vZf3OBwZLZ0udHibKcUZFx/1iXgJDMLVHW7KzdqYBZeazv
         94g3WEHvHDEJd+JuMpdQiBNYMGJeO/5ESc83wex+LwJyrFJP/6JXQtespoztIS4dDPqS
         itkJoN4kDgj6SJllzGgDIRhB1eAhO/062wMQtNQWGC7Rr4CgO8BgHlN0E9CFqJcQctdA
         tV+68jtFzlxVJe/7esU5H7x/JQXN98KkKIqon8Y1wmNfGuF9PpCnrmMAOBQYfkEfRX/N
         ubfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=GuL8PkvhkDTfBPzXl7K77n+i8zemBvhxsb00w21BNbE=;
        b=IM16OF1UHHKbAagSn9mUE0+5+lWWJcVXUhXlMj7CVm/88HGAEjB8UFk2THsi40/4HR
         qVWDBnMGnomOKzhmGMMp/aza8bt7c2G2QkRe6j84sZDbj+eFtbnBHMv1K5PjYMMC1+hl
         6Dc+KxHwWHSOCsd2piBr79OF8MhnVxaOUaBPeiID7vggRFtOCm8x78PN4EO3jtRUBmGP
         CnrvHfriUVD9iAu2F7Qn8jUACu+KplHeCCiVInP+n5bCnTeD6VDa3fiEZPO/LwvZ2Erh
         tztYJLSx8eG6BJlrzAlllt/HCZN8Iha8Yv3jI4M3A52HIpZ/cZfZupnqtqpaV4q/VHuV
         8mBQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=a54tgzGn;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id u24si147394wmm.1.2021.01.19.03.04.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 03:04:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4DKm5L1qbSzxq7;
	Tue, 19 Jan 2021 12:04:54 +0100 (CET)
Received: from [172.16.2.21] (194.95.106.138) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 19 Jan
 2021 12:04:53 +0100
Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
To: Jan Kiszka <jan.kiszka@siemens.com>, Peng Fan <peng.fan@nxp.com>, Angelo
 Ruocco <angelo.ruocco.90@gmail.com>, Ralf Ramsauer
	<ralf.ramsauer@oth-regensburg.de>, "lokeshvutla@ti.com" <lokeshvutla@ti.com>,
	"nikhil.nd@ti.com" <nikhil.nd@ti.com>
CC: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice
 Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
 <3125cc07-ff98-2427-2c9c-56c94588f97c@siemens.com>
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Message-ID: <a7c570ee-7860-f1ea-60bd-3fb17c6d1751@oth-regensburg.de>
Date: Tue, 19 Jan 2021 12:04:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <3125cc07-ff98-2427-2c9c-56c94588f97c@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Originating-IP: [194.95.106.138]
X-ClientProxiedBy: E16S01.hs-regensburg.de (2001:638:a01:8013::91) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20160622 header.b=a54tgzGn;
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

On 1/19/21 10:48 AM, Jan Kiszka wrote:
> On 19.01.21 09:48, Peng Fan wrote:
>> All,
>>
>>> Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell Linux
>>
>>
>> I wanna restart this topic and hope we could move forward
>> to land this feature in Jailhouse mainline.
>>
>> The initial thread:
>> https://groups.google.com/g/jailhouse-dev/c/IZEFz-e2lh4
>>
>> Angelo also post a Linux-less RFC mail:
>> https://groups.google.com/g/jailhouse-dev/c/gctNUieKd8Q/m/ekSKqBa2BQAJ
>>
>> I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); China UTC + 8(17:00pm)
>> in Jan/22. If you need the other timeslot, please raise, then I try
>> to find one that make all happy.
> 
> I'm already blocked (up to 11:30 local time) on the 22nd. If we are
> looking for a morning slot in European time: 25th before 11am or 26th
> before 1pm.

22nd won't work for me, 25th or 26th would both be fine.

  Ralf

> 
> Jan
> 
>>
>> [1] https://webchat.freenode.net/#jailhouse
>>
>> Thanks,
>> Peng.
>>
>>>
>>>> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell
>>>> linux
>>>>
>>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> This patchset is to support boot jailhouse before Linux.
>>>>> The previous RFC patchset:
>>>>> https://gr
>>>>> ou
>>>>>
>>>>
>>> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
>>>> pIQAJ
>>>>>
>>>>
>>> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
>>>> 8d83dca6
>>>>>
>>>>
>>> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
>>>> 022610&am
>>>>>
>>>>
>>> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
>>>> ed=
>>>>> 0
>>>>>
>>>>> Patch 1~6 is to create an new folder libbaremetal to hold files that
>>>>> could shared between inmates and new bootloader.
>>>>>
>>>>> Patch 9 is the central part to boot jailhouse with a baremetal
>>>>> bootloader, which only support ARM64 + GIC_V3 now. It will use psci
>>>>> to power up secondary cores, do GIC_V3 dist initialization, Then
>>>>> kick inmate cell.
>>>>>
>>>>> Images/cells loading is done by U-Boot bootm command to boot a fit
>>> image.
>>>>>
>>>>> Patch 10 is to support using jailhouse userspace tool even boot
>>>>> jailhouse before linux, just do as "insmod jailhouse.ko
>>>>> early_loader=1", then it will bypass fw loading and etc, but setup
>>>> information for linux usage.
>>>>>
>>>>
>>>> I'm missing the big picture description here:
>>>>  - how is the memory structure that the boot loader needs to set up?
>>>
>>> Nothing special, just put the cells/inmates to the fit file, as 8mm.its.
>>>
>>>>  - how is the handover between loader and root linux?
>>>
>>> Nothing special, the boot args are reserved when U-Boot kick the loader, the
>>> loader will pass the args to Linux after jailhouse initialization done.
>>>
>>>>  - how are things configured?
>>>>
>>>> From a first glance at the code, it seems a lot of things are still
>>>> hard-coded, likely imx8-specific. That may mean we need to work on the
>>>> user story further.
>>>
>>> I use bootloader/include/config.h to define some addresses. Since I using Fit
>>> image, do you think it is good to parse fit image to get out the info?
>>> This will need porting code from U-Boot or write from scratch.
>>>
>>>>
>>>> Also, a qemu-arm64 target would be good.
>>>
>>> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
>>> I need to let U-Boot boot Linux, then could add the feature.
>>>
>>> Regards,
>>> Peng.
>>>
>>>>
>>>> Jan
>>>>
>>>> --
>>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
>>>> Competence Center Embedded Linux
>>>
>>> --
>>> You received this message because you are subscribed to the Google Groups
>>> "Jailhouse" group.
>>> To unsubscribe from this group and stop receiving emails from it, send an
>>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>>> To view this discussion on the web visit
>>> https://groups
>>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606FED0
>>> 1836E49F644C2E88450%2540AM5PR0402MB2756.eurprd04.prod.outlook.co
>>> m&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Caa5cbde61bf944b03f45
>>> 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
>>> 327292966107007&amp;sdata=C7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I
>>> bwqI%2BRZw%3D&amp;reserved=0.
> 
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7c570ee-7860-f1ea-60bd-3fb17c6d1751%40oth-regensburg.de.
