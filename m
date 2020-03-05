Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWEKQTZQKGQE5HKU3GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6538317A6DB
	for <lists+jailhouse-dev@lfdr.de>; Thu,  5 Mar 2020 14:57:45 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id d15sf1977278lfn.2
        for <lists+jailhouse-dev@lfdr.de>; Thu, 05 Mar 2020 05:57:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1583416665; cv=pass;
        d=google.com; s=arc-20160816;
        b=hIFzvwxrh1IOMFFtpgI//SpVI+Avzdynr/EIB3c/z8bgWMxT/cbQ/PrWBQuPJH3yNh
         BlNqyhrUBkLxIqUrIj9tueJHiG2k7hPgkTA5f7r1XduMnrZoKfNFx059MtHg1e7x4pSN
         G34egOjsmTu9RBi8JuyBFqA2GukDcZmGe0tRSBtem8u96uNLyxcq4S4s04ucVyTHju39
         3IKe4glAu/DEsQUqWnyFXYOsZBOiyzagBc+QUE8rvIo15n6XhFoVt5wDY0h7t6CACefU
         4Wmcbpxydl7SK6i8xrIBCm8mW8ggJua3w28GJepv+MEfBLg0OXCiFRX7+/9RL8qnbGET
         vgyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=RMdicyVawlu9HUbbpSyqDmBE0DYpQ6NqozfsuvBCxOg=;
        b=k8aHbI0QWMWJFWO3xc9MhIk+pkO89MMsrvsxdbHaukCdFld4SFTbWufpUy4uZbRErQ
         KNQWB+Ry+xSw0beLfii4bwgn9b7FaeLu+Zq1GprD/AiDqMHeWtl34HXBPQYHqQotT78n
         +OGj4NE0IbYcwuiLVSWWz+YJ4gymrQ02Q8Y0TMSWb/WCuY0Vzc7SbP8xAlAnJgEXq0G0
         72jGxybQ/hCnA/3m4J1QC8iC8mbxiAv9CYjp60xWDPbxjP7IXEzemP5KUVe/w0/kZ8zW
         CTR+Ku62fJBy3V1n0tbq20kNBxVHZHyQCGh3ElJcXU79SUBYGYcky6kZam91kxJTSw/D
         rpRg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=RMdicyVawlu9HUbbpSyqDmBE0DYpQ6NqozfsuvBCxOg=;
        b=n8oLMSJXV5g9IF63dzjkdtukR9dLr2/FmhoVktJrPJGq0c/vG3CWHipq1HdQyUkNRn
         ls0Xk8OCiidwC00BqwCdRgJTyjaHKyNGjdEJOZ9pwNBMFcQGWOJDVMJln0g61gtHiz0M
         P8R5t/Gqgf8FMxcPS2f03d0dM0eNjwE09FNgzUsFTK1mlwaGbs9XW03DNe+//Sm/ljHw
         VMHAfgol/ZrqOhQw0ipTSEOatRZjumf1/nIHSakTghx+a7xoCkaLXGye2SDEg6dFs/KL
         ee5LYC3KzCBexjuvLsuF4fpVhAsHuTMVJ0AJHxASLIhADD16RN6zB0mPh9kWuZGV0e0e
         cERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=RMdicyVawlu9HUbbpSyqDmBE0DYpQ6NqozfsuvBCxOg=;
        b=O1yA74sT4VVyMri5GpJjZglDoVU/GQCBaCkr5BQN8jXvNwg94ktviVVXBj00wI7qGo
         mlfFv/njaMq9KBSpANRWFTpeWbA/2PsxXIyNzNzVWj2jRg0+Hi5YXe/i8+tZdqqgpdJy
         CUIoEtpu5WR/5N4h63Ip14O4O54RBV+QF1xyZM6atYje1YdbxAJezR+Kw97Caiwi9nyg
         orrUpQNsVn6g38n552X98BO4shumJ2uojvoUwUfVxTjccYM980/eFT/luIo/+Zg2/4Tj
         5no2gqor61zhFIsMX/Z4GXrHN/YtPPMgjPb4WHZtBeypE65pP2MWmHQjzjLzqK7eXK0k
         UaRg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ1S2qc187Ys80shZv+yb1ZWfGtpT1WSupWpcA+y2iGYGSCFWM72
	/N5X48kmL6Hlb7wYyOi8i88=
X-Google-Smtp-Source: ADFU+vsKXSaqduhYAqdmXJYm3HsQxvHY41Uqo6WoN1Qz7qBiXefEuxpkk3qm2hO1FO9xiF07tZz9SQ==
X-Received: by 2002:a2e:2c18:: with SMTP id s24mr5115178ljs.275.1583416664922;
        Thu, 05 Mar 2020 05:57:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ae10:: with SMTP id f16ls80568lfc.10.gmail; Thu, 05 Mar
 2020 05:57:44 -0800 (PST)
X-Received: by 2002:a19:4314:: with SMTP id q20mr5369025lfa.202.1583416664082;
        Thu, 05 Mar 2020 05:57:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583416664; cv=none;
        d=google.com; s=arc-20160816;
        b=JtNLHYkuqylEGBZ52Uj7W3fDIFjogLslPxQjlUV9Uicgux5jPI/6Sx2hDwg9M9FIWG
         PoTfR4DSWIk/lm9Ip/h2t4HYjVrWMmJMs/nNvxaWPHYfmWfVqWcnO0snVnMGAUoSaqpc
         rX8cBPTCMXjFM9+6gKdNFclmkL2WhWMT7ctGVY92jntdRtzgWUTMZWWtVSco2HOPGy3K
         InVm9UOLkVDnsXxTX6DZE2Ac3uOiY+DMafFY0UMl5phibRgsuvw3mSrUOd8yXDKQIgMV
         je3vTWm7E1W3q24kDAW4c9k/8CB4to3I/8MUVrQhUGkmWhKYYapiIgYAmE0DInv8DTSO
         s2hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=VYFwQwo+2UAdeE4t+6No5VwNhY4WO4pNzvoiVjCqEiA=;
        b=R8esaz+RCnPaKQHkQALRsPFMGUPxnOckkwZXFuuLKpc0lfPUt2MVimnAobOB4I9lmJ
         d3fxUbGR/TKS26qV1S0pbMN84m0Ez56g9rG7l856Oc1+wjMbUdvtdLi4kXyxIhMGlBjv
         9yDFxLdrsCpgyqO54vwwuQbn2TaW8IBNk7H/jfh/L2XztHhAMyhBD4qKkArJKUzc+5RM
         5eu5l8fvauEYZ5FNbbMxdyse5BjeFJjbtpgw2qcMnx50nJMhafcXdrTfEPMatEfA/seU
         //nw/ScyWstYP0WzgdJiymKzpx2k+rPrIfJ3HKXAM+c1ZUTjM7/+4E3f5SE/azMivCaX
         FfWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id w18si288819lji.2.2020.03.05.05.57.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Mar 2020 05:57:44 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 025DvhqJ002154
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 5 Mar 2020 14:57:43 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 025DvgGX008866;
	Thu, 5 Mar 2020 14:57:42 +0100
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: Peng Fan <peng.fan@nxp.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
Cc: Alice Guo <alice.guo@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
 <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
 <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <23878cc7-1f98-f27d-5941-801c23c22a58@siemens.com>
Date: Thu, 5 Mar 2020 14:57:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
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

On 05.03.20 13:39, Peng Fan wrote:
> ailhouse-dev@googlegroups.com
>> Cc: Alice Guo <alice.guo@nxp.com>
>> Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
>>
>>
>>
>> On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
>>> From: Peng Fan <peng.fan@nxp.com>
>>>
>>> This patchset tested on i.MX8MN arm64 with quad A53 cores
>>>
>>> Patch 1 is to align jailhouse_system. Since the loader not have MMU
>>> enabled, unaligned access will cause abort.
>>>
>>> Patch 2 is not that well orgnized. It does GICv3 initialization, SMP
>>> boot up. Then kick inmate cell and root cell.
>>> Some code are hardcoding for now.
>>>
>>> The boot log as below, you could see root linux and gic demo both running:
>>> root cell not able to manage inmate cell for now. But I think it could
>>> be supported. intercell communication not aded currently.
>>>
>>>  From test log, linux root cell boot will cause large latency for
>>> gic-demo jitter.
>>>
>>> It maybe good to use cache color on ARMv8, but still have issues for
>>> root cell DMA without SMMU.
>>>
>>
>> [..snip..]
>>
>> Nice to see this being supported...!!!
>>
>>> Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
>>> [    0.127643] Detected VIPT I-cache on CPU1
>>> [    0.127671] GICv3: CPU1: found redistributor 1 region
>> 0:0x00000000388a0000
>>> [    0.127700] CPU1: Booted secondary processor 0x0000000001
>> [0x410fd034]
>>> [    0.159684] Detected VIPT I-cache on CPU2
>>> [    0.159700] GICv3: CPU2: found redistributor 2 region
>> 0:0x00000000388c0000
>>> [    0.159717] CPU2: Booted secondary processor 0x0000000002
>> [0x410fd034]
>>> [    0.191721] psci: failed to boot CPU3 (-1)
>>> [    0.227974] CPU3: failed to boot: -1
>>> [    0.231609] smp: Brought up 1 node, 3 CPUs
>>
>> Did not look closer but couple of questions:
>> - I guess the above CPU is given to inmate cell.
> 
> Yes.
> 
> We should be able to handle
>> this error gracefully rather than failure. Wondering how other hypervisors
>> handle this.
> 
> It is because dts file has 4 cpus, so it will surely fail.
> 
> To XEN, xen will take over dtb, and runtime create a new dtb for dom0.
> 
>> - What level of features supported when compared with type 2?
> 
> Just a few in mind
> Fast inmate boot.
> Easy to support aarch32 root cell with aarch64 jailhouse
> Decouple Linux as root cell, so not a must to take Linux as root cell.
> Cache color would be possible for root cell

- get rid of people's misconception "Jailhouse is based on Linux" ;)

That said, starting from Linux will of course remain.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/23878cc7-1f98-f27d-5941-801c23c22a58%40siemens.com.
