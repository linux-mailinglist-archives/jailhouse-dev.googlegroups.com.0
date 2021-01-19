Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYWVTKAAMGQEBUP6BNA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF482FB509
	for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 10:48:18 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id s10sf155491wme.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 19 Jan 2021 01:48:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611049698; cv=pass;
        d=google.com; s=arc-20160816;
        b=Gw3yY0njFe0oypR05QxTVeVXSm+mTvggVOvWoIIULI1qDdj5o0/Y8Ajted3GtZBAQX
         nBpu46DGXIgWD5NchYOB/ahg4MqEyFTRXxJMOXhqp8fByefknmAz4HqSyiJtK/rt2rq6
         GocziNvcdlcoj+08A3bs7m30of+snLQTh1RLDWkMZ1QaFSd/n+xJBx/cx3MI9eeHQFuf
         jOjKHfPA1+WzWN0VdczZ6MJ8BOVf4IzIzFzsGgKZsoippmOQn5cSkSJU+y1hd1OBCNja
         7O0fNOIIQvt1cHDcoAEfE/eBbhUGhSHD+PNC7Vc4NFaetOiAlqUvsmLBJBRJnATaBIER
         4qXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=tHGEdpc63y48KGrxoSCG76Eofn+nu0oP5ujdfgeq4eg=;
        b=W9Nsm34pSgvPBGZAVKRTgjPjM5QXdd3C4zlvPP7wELAbU0PtheJ3eDAIN9WV/pUE0N
         oSgXNT+Or6/cB7lKAdXGoTyuowmf+cbDVKsjzrxawzkuv0VzI7H5ya1ktfuzzMQeE0BF
         xWJkDYX8NHctMD1ryrtFBrGBYYj6FlaLHdJCWYK9TxAs+CZtbPrE0XEqh7ImAHhiBZJ5
         2lq2BYwz4TWsp+LCLrVx1vcTvYc4r0kgsOYHyM1MXhRS/7NaPx2D03c1HAl2wbANFH0A
         05qv77tVoosyOG6kPZPg/fk1tSwCaTITO+zUEoa8SScLVoyHZo6NVdYACsAFSXMowCVS
         g+IQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tHGEdpc63y48KGrxoSCG76Eofn+nu0oP5ujdfgeq4eg=;
        b=ZTP8QUtDcI5bzPpd7kIehrnTp/t+7cqojDLbOS+oEyz73YcZWY38QX4Lg9nNY41BCX
         vZl9QVciEglpARgSoe47znzPO+IL95ztI1+mjN8QpWPemso0jSh5LKVDBJEQgAyi0f++
         3sBQSnVqQFz1e468qTh31VINggZl7VBgQQOl+jWCFSa5H/YYSVx6fxn42JQoApUFDYbx
         kyag+aa1v/Y4tDW2QnKT/C2JVkrRH4znFO+A4btgfh1+ttthpOkYnDmcWKHyIV5JKAo5
         cNtSJU/TThkREBaWrTyN91LGdcWZUIOmQacIO9Myk75AfcIetA9tnHnlNPcS4ObKNFYL
         oQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=tHGEdpc63y48KGrxoSCG76Eofn+nu0oP5ujdfgeq4eg=;
        b=X2hzitmWetd4Cxu4hdNoUNOgusGijoKwACJky1dfnXTWpWLFBMmm8IZfzv8EPgtL/Z
         iZ7bVbGeJtcsFCChldYlIfU0ZjYWIXolNc/o3ZP1d48y82g1xVQk91UKPr/Q1TCztmhV
         RBhURAHgYN2qzrUR/qndYQtBVezY/hgZGtZ9iMnV7auWWKeex8/YuD4zieEbVtVAP4Yf
         CzzRRyO7UDmeINBlvMbYZ9wQxAr2f9Xx9U4M+Eyzp1vHW13ElRjsIMKlVgMFXTpP5+WN
         RDzgEEAo7LMx63a05EtD+57igBlY2WSNtTBq6OKd6EZzZdxIVnhut4zc0SbZjXLGi0cG
         UdYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532ncvk+ZsY6ZWrDYH1DG+BAMtQxrDrCV2D1nmrbDpGIXbcW1QwG
	UlMTwglD0DXyU2YjmOdkogE=
X-Google-Smtp-Source: ABdhPJzNIvTiTM8YCe9kVQkPD+VVuIi8g1A+pHEklPa+reNH/pJFTOLMI+Npb8ybqDBpaQb7K+j5Iw==
X-Received: by 2002:a7b:c052:: with SMTP id u18mr3162060wmc.139.1611049698197;
        Tue, 19 Jan 2021 01:48:18 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:bb0b:: with SMTP id l11ls7116785wmf.0.gmail; Tue, 19 Jan
 2021 01:48:17 -0800 (PST)
X-Received: by 2002:a1c:790f:: with SMTP id l15mr3249309wme.188.1611049697289;
        Tue, 19 Jan 2021 01:48:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611049697; cv=none;
        d=google.com; s=arc-20160816;
        b=iiuMylnZFuf5P6p7p4LnVHjwAH/5We48auXDCWnOR1G0RFTD1J1vZyD26J2aSWm/tT
         d10xtINCTkYFEPd9sE6HceBjCTrerIqXiteyk1AN1JYpCn33NDaEycVBMAwwsTZcfqP5
         olQJb2REGLNBb/VfQzjKiNuJNi8aT6dP6mQyh5Q4zMdMWouKGII21f2nsqNrdgynTUh5
         pVtYJ80AjfQI9Ps6rmboAzcRjfpV0jZAl28LucEzNbICTNKaPGhBnVudf8tk2BWQWzRY
         HKi18+FO3zjlPcfPtYZKIWTXNpwRZ0g3aD3tDMewFlaJ+USgYraljue6iHixYqaVM4gq
         XCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cnBUa/qSoRuLF2RbEjAvut4WqAL7fQ28Wo5Ev4O55Aw=;
        b=pghVDM6lP/SND3TtHbFmYkAxxf/MEBzB2knuWaGbKNMvyti0DP4SBXzqYraiYX3Isd
         30NjxRVyCfo+XI4mdtOcJ6baH78hHjHsZ7EyXS3fIbb2f1q/mcCD99dv/CcnOx4UpdCE
         yFXXwlETYV/+1hlOm3lA3vRj0Txzzox1XqAraR+dZ6z/JX7IO/DJAF+2M7L0sH4SXyuK
         0UhR8G/LEfHne14Kblufzahr2+d9bdvXb7u1PsnaEE+1Rs6WS9thpA5q4yulhbGbw9s1
         3eWdWOEYh/jDchCiTM4UP5FIIj1ALKgTH17hYmDToCQSjbAbJK4htMfVbJJ6dJLOFenS
         bSmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id t16si157736wmi.3.2021.01.19.01.48.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 19 Jan 2021 01:48:17 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 10J9mG6C014085
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Jan 2021 10:48:16 +0100
Received: from [167.87.30.207] ([167.87.30.207])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 10J9mF1D009388;
	Tue, 19 Jan 2021 10:48:15 +0100
Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
To: Peng Fan <peng.fan@nxp.com>, Angelo Ruocco <angelo.ruocco.90@gmail.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        "lokeshvutla@ti.com" <lokeshvutla@ti.com>,
        "nikhil.nd@ti.com" <nikhil.nd@ti.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
 <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3125cc07-ff98-2427-2c9c-56c94588f97c@siemens.com>
Date: Tue, 19 Jan 2021 10:48:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760EC86B40254F8CC07A1FF88A30@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 19.01.21 09:48, Peng Fan wrote:
> All,
> 
>> Subject: RE: [PATCH 00/10] ARM64: boot jailhouse before root cell Linux
> 
> 
> I wanna restart this topic and hope we could move forward
> to land this feature in Jailhouse mainline.
> 
> The initial thread:
> https://groups.google.com/g/jailhouse-dev/c/IZEFz-e2lh4
> 
> Angelo also post a Linux-less RFC mail:
> https://groups.google.com/g/jailhouse-dev/c/gctNUieKd8Q/m/ekSKqBa2BQAJ
> 
> I propose a IRC[1] discuss in Germany UTC + 1 (10:00am); China UTC + 8(17:00pm)
> in Jan/22. If you need the other timeslot, please raise, then I try
> to find one that make all happy.

I'm already blocked (up to 11:30 local time) on the 22nd. If we are
looking for a morning slot in European time: 25th before 11am or 26th
before 1pm.

Jan

> 
> [1] https://webchat.freenode.net/#jailhouse
> 
> Thanks,
> Peng.
> 
>>
>>> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell
>>> linux
>>>
>>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> This patchset is to support boot jailhouse before Linux.
>>>> The previous RFC patchset:
>>>> https://gr
>>>> ou
>>>>
>>>
>> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
>>> pIQAJ
>>>>
>>>
>> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
>>> 8d83dca6
>>>>
>>>
>> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
>>> 022610&am
>>>>
>>>
>> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
>>> ed=
>>>> 0
>>>>
>>>> Patch 1~6 is to create an new folder libbaremetal to hold files that
>>>> could shared between inmates and new bootloader.
>>>>
>>>> Patch 9 is the central part to boot jailhouse with a baremetal
>>>> bootloader, which only support ARM64 + GIC_V3 now. It will use psci
>>>> to power up secondary cores, do GIC_V3 dist initialization, Then
>>>> kick inmate cell.
>>>>
>>>> Images/cells loading is done by U-Boot bootm command to boot a fit
>> image.
>>>>
>>>> Patch 10 is to support using jailhouse userspace tool even boot
>>>> jailhouse before linux, just do as "insmod jailhouse.ko
>>>> early_loader=1", then it will bypass fw loading and etc, but setup
>>> information for linux usage.
>>>>
>>>
>>> I'm missing the big picture description here:
>>>  - how is the memory structure that the boot loader needs to set up?
>>
>> Nothing special, just put the cells/inmates to the fit file, as 8mm.its.
>>
>>>  - how is the handover between loader and root linux?
>>
>> Nothing special, the boot args are reserved when U-Boot kick the loader, the
>> loader will pass the args to Linux after jailhouse initialization done.
>>
>>>  - how are things configured?
>>>
>>> From a first glance at the code, it seems a lot of things are still
>>> hard-coded, likely imx8-specific. That may mean we need to work on the
>>> user story further.
>>
>> I use bootloader/include/config.h to define some addresses. Since I using Fit
>> image, do you think it is good to parse fit image to get out the info?
>> This will need porting code from U-Boot or write from scratch.
>>
>>>
>>> Also, a qemu-arm64 target would be good.
>>
>> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
>> I need to let U-Boot boot Linux, then could add the feature.
>>
>> Regards,
>> Peng.
>>
>>>
>>> Jan
>>>
>>> --
>>> Siemens AG, Corporate Technology, CT RDA IOT SES-DE Corporate
>>> Competence Center Embedded Linux
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://groups
>> .google.com%2Fd%2Fmsgid%2Fjailhouse-dev%2FAM5PR0402MB275606FED0
>> 1836E49F644C2E88450%2540AM5PR0402MB2756.eurprd04.prod.outlook.co
>> m&amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Caa5cbde61bf944b03f45
>> 08d83dcbd646%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637
>> 327292966107007&amp;sdata=C7kgZJYMLzHTCwhP6cCjub7x0K0raYBc%2F3I
>> bwqI%2BRZw%3D&amp;reserved=0.


-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3125cc07-ff98-2427-2c9c-56c94588f97c%40siemens.com.
