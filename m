Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4VDZH4QKGQE74YU53I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C272417F3
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 10:08:18 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id t3sf5272023wrr.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Aug 2020 01:08:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597133298; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZfJ+bHGrfuVzeNGxjBR8lyYezV8xzdMSeQRlUOrjdmfcKAGxsldaKwnyQF26wz/6Fk
         eWk9xe1WZCws8R783IDjx+dabbuZr3V8iE61REn0gUFe5p3uG2aa7CJP+ck5hjJJiM0J
         o9DoowDxzrmV1yhOFhM77dPdtVQpemI8wO6KQ0fXQq2mq5BCJCH5VNXxx61hi8lYqh9a
         GJKCePpxNRSMRy0UtBok+XEvh/QdPRG8nRMacAalAHn43FDRkLGvbs9wTo2j+h8KesHk
         gpx+aNFinkk30cQGv72Gp0cjpHDwUfQcGtOWIehZXLF2vYZ5JqGt6v8UlxJ3uZ2oueTR
         aUTQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=sG71hv1cgc6EjrIAPfxfba7ao75r2AtUi/zOySYOaHs=;
        b=EjD+n/3SFd+jNMV1Q1Q3tZ3Ix7l+V3pOKTjM1JnhSYDAOby4iejXMI76uOlGKzh1vM
         CdvU6WK8rPhXn57vgJCGFoCR8PrQ5iHQs45XSui9tb/yyfMJUbSjlxDZwORyB2eC5OnQ
         YH1hk3wr492jTE1qxQN1iUyU28SCtmuKb3c22x8fsp2SB7TaWVLyq02gRjvs1CPaLYv/
         otszLSYryTvdgmtEJUa5o7syZP27jOhnao73+1jcfUTJCGUzIHaGBi+/0lAiWy39oh58
         QHHmlT3uWoBc9yY9+YroAzpGordYxQJSHJPrOTdqpEsMEMACyEkXs+iSVGcOfcWKHJSz
         aOTA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=sG71hv1cgc6EjrIAPfxfba7ao75r2AtUi/zOySYOaHs=;
        b=OdDk98cDTb+Sp+1OpEBosJpeDo/3OCb0Wl+aakomN6gEw5JfCybpsBZlxYF3vv0ksI
         t7IFZnckfvkvmQCkh8jUISroWdgvKy4q/dHydas0svThQII9eY5xCBNcSioNddHT7cVk
         aJb+9YZuC6uYhlT7QpnLZeg0StVjzqlbeNZXEP2NT6pHIfvibL0eB6DxZpRKeiPZBbW6
         iFl1vKN5cBFR+s+Wzr7sBR3+CR1gqqm8X06OM1we1ySt8YeKZFW0InZfmytDbElAsLTk
         We1mG0pOZuy2PdZzYJoOnMk/hvV4Rq/y4YNYsomO7ZfUn8zUUKfMTeW5tWBdzilVIVhI
         7fRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=sG71hv1cgc6EjrIAPfxfba7ao75r2AtUi/zOySYOaHs=;
        b=fuV7s3YpOXvm5By2ElRnKYhCQQ+OQNdNqR2msZEWbAc+icoDzKBFAfPZaWfWFzhcWJ
         ym4fLnQfnH09IsUark65E3BL26lM9ICgts5TRHUAErucDk3Y0f1MoBY9hTFosyH3eLHI
         DecHD6qqoEw7QqyZ2gOWZzVCr7sKxhCPAEp5GqK0wNxYwLxNGtckfzZub6L/pFwAiGGQ
         6MXN5xGQNjIWuOJuU89Cz5QdVktE8T1iUortS9WOv6Hj5WhCMKSjtHwa6G3Tvb0JB/Ng
         UtfL/eCgwGnTMD+R/Zbii4g7C1k1Ua7JeHNC3sWMj/CCa/D7B2QMPu+88Q7kghFrUNkU
         vKjA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530sOI5EmOnloTBjM3Lpsnjd4sN2qSfYwwp4cKW3+IcJXpZwh0vW
	Wa+tsFwgwI7vJKssfzc7cpg=
X-Google-Smtp-Source: ABdhPJz/5jNByI4Fe7oNeVvG67RaAMPTs46ldNWtklNJC7tMiAVGfw/uLwTZdmhdZ1lA2FesiyTNzg==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr5396832wrm.301.1597133298318;
        Tue, 11 Aug 2020 01:08:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:804f:: with SMTP id b76ls571625wmd.2.gmail; Tue, 11 Aug
 2020 01:08:17 -0700 (PDT)
X-Received: by 2002:a7b:c24e:: with SMTP id b14mr3086601wmj.128.1597133297587;
        Tue, 11 Aug 2020 01:08:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597133297; cv=none;
        d=google.com; s=arc-20160816;
        b=FPbq6QkWuBV2mPYhX/MI8i9RwrqpqW7PN3N1csKrLw96+A3YG4Mru2GHwoVZACY3mQ
         2vRTm9UO8ym6lnZijhH7X4LeaYdyUkpZLvnBwWIB6yspXCtw1m/kca1s+p5mCSptE3pb
         OHy9Q2P+t6BK0+nZc609GgFNpP44zIGzUNS35Dp72oJ/F2Zlhly77cUeRnLuVWfWMcDP
         vIc+H56Eb3RS7kyqf5ksMazRsKmnFfOc2MdMmcpSB01c12lZbBhNGrNIuw8PBARUIhcW
         r41RlaIC5JhNPSq+WbJ/Uu7RMpwXWOfn/wg6JD5Ve6fDjIbPUOf+mAbu3beK+e5rrlvB
         eeoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=i05Fu8llSPU0ghlCeJho478xabnpYrLZgMdgGnNxW50=;
        b=sFxwpUcntIcBBvme3vQTsfGn5YdXX9l3IyILfBYKxL6+KwazmSW4/t3bdWsn03SLfI
         PYATR0yuAEfCTHmDQERHJMp2XOXr2Ybv7ME59zPsCd6pNAq4RbfLrAbsNI8ZVamJOXap
         nT9EVhH5hg8Ktj3IvRbjL9VlKQwzV9C50GNZP4iLHHmcscYb+tON4R8fVtycrc8c59wT
         ZgtNde9uVPY1/4jQX/jiQWXWg1hI+lHarvfYYjCMtCZbITZbkv9wp0HYvv+na3bpBgCF
         NyHpFk3GwZGBf23P/Y2JExLpL7zYefegiYBUuyo5VZWDVQBpH+ufMfVbe+HIgvx1GDZw
         ZJhA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 92si544731wre.0.2020.08.11.01.08.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Aug 2020 01:08:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 07B88HLJ010229
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Aug 2020 10:08:17 +0200
Received: from [167.87.76.230] ([167.87.76.230])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07B88Fda017487;
	Tue, 11 Aug 2020 10:08:16 +0200
Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
To: Peng Fan <peng.fan@nxp.com>
Cc: "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200807030632.28259-1-peng.fan@nxp.com>
 <891d13c9-6845-ef65-36db-4327d6736361@siemens.com>
 <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7425864d-0f70-b6e4-71c9-b688d5c6565d@siemens.com>
Date: Tue, 11 Aug 2020 10:08:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <AM5PR0402MB275606FED01836E49F644C2E88450@AM5PR0402MB2756.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
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

On 11.08.20 09:54, Peng Fan wrote:
>> Subject: Re: [PATCH 00/10] ARM64: boot jailhouse before root cell linux
>>
>> On 07.08.20 05:06, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> This patchset is to support boot jailhouse before Linux.
>>> The previous RFC patchset:
>>> https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgrou
>>>
>> ps.google.com%2Fg%2Fjailhouse-dev%2Fc%2FIZEFz-e2lh4%2Fm%2FBBmGI_s
>> pIQAJ
>>>
>> &amp;data=02%7C01%7Cpeng.fan%40nxp.com%7Cfd19d34344a04a8e00690
>> 8d83dca6
>>>
>> d2b%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637327286910
>> 022610&am
>>>
>> p;sdata=LWalmGgc5itX1A9VYPlJHE8zRst1XiL2lSilgI2z%2F4U%3D&amp;reserv
>> ed=
>>> 0
>>>
>>> Patch 1~6 is to create an new folder libbaremetal to hold files that
>>> could shared between inmates and new bootloader.
>>>
>>> Patch 9 is the central part to boot jailhouse with a baremetal
>>> bootloader, which only support ARM64 + GIC_V3 now. It will use psci to
>>> power up secondary cores, do GIC_V3 dist initialization, Then kick
>>> inmate cell.
>>>
>>> Images/cells loading is done by U-Boot bootm command to boot a fit image.
>>>
>>> Patch 10 is to support using jailhouse userspace tool even boot
>>> jailhouse before linux, just do as "insmod jailhouse.ko
>>> early_loader=1", then it will bypass fw loading and etc, but setup
>> information for linux usage.
>>>
>>
>> I'm missing the big picture description here:
>>  - how is the memory structure that the boot loader needs to set up?
> 
> Nothing special, just put the cells/inmates to the fit file, as 8mm.its.
> 
>>  - how is the handover between loader and root linux?
> 
> Nothing special, the boot args are reserved when U-Boot kick the loader,
> the loader will pass the args to Linux after jailhouse initialization done.
> 
>>  - how are things configured?
>>
>> From a first glance at the code, it seems a lot of things are still hard-coded,
>> likely imx8-specific. That may mean we need to work on the user story
>> further.
> 
> I use bootloader/include/config.h to define some addresses. Since I using
> Fit image, do you think it is good to parse fit image to get out the info?
> This will need porting code from U-Boot or write from scratch.

Try porting your concept to a second target. Then you will see if it can
easily be adopted, or if the user needs to tune even more constants
across multiple files. I suspect the latter, and that should be avoided.

FIT image parsing for addresses could be a way to go, but I need to get
the full picture.

> 
>>
>> Also, a qemu-arm64 target would be good.
> 
> Per my understanding, qemu-arm64 to run jailhouse not have U-Boot.
> I need to let U-Boot boot Linux, then could add the feature.

There is configs/qemu_arm64_defconfig in U-Boot. Didn't try it, but I
would be surprised if that doesn't work.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7425864d-0f70-b6e4-71c9-b688d5c6565d%40siemens.com.
