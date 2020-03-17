Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBRGYYLZQKGQEQF7JPFQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id C73AF187EC8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 11:53:56 +0100 (CET)
Received: by mail-ed1-x53d.google.com with SMTP id l8sf17849397edq.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 03:53:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584442436; cv=pass;
        d=google.com; s=arc-20160816;
        b=Vf12G+R8JtW1zpll8mQpzK/DdqH/Zyk1Qf1WP901l2MJ8mjGq2EB4lsJBfnnCSDGwr
         0gkPFyrNffnI7G1gD1PrRlBC66/2kOoEoyIrVoyxVfs9sD1B50KMTpA7HRaarUEJ1qA+
         7sc3lscnP44ql0ECgjBvLJBHdg2Hx2WvAw8Kd2/Hmq/MF6G0gw/SM5Zzmb1BEo6XcgHP
         tfggrqDQ6MggfUDxzNMulg/ARpD0TLky+W8HlTftXO+VqO0Tbf7TZ5UkBq28zxxGz5ve
         EMp6gDdlCipc9HPFtFSZQtaUSLASvRLz6Nqg/JTbziQE7g4116p8BvVmd2mSFr8i2NAj
         TTZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=qOBPF3n2uKXjYYgSEJXpd2n5Dixe7SkM6sf8CYm8sng=;
        b=aVAztH5k5CpLiMchwBnyjqhO6P1/qyqSyBL6Da5/D3aLopnibRr2h0XbRP5Vng1+Ow
         maP5pxy6TMcwkDPEbfOO9HEIRsj7dV7h07EHpwj53VydjAcvuNGWOBVPz2FM/BrDu0aD
         ZPET2Y2Qc8P74WHogIeR5ZtzXrVyp8VSQ2GCXVYJJFi9quPFVKhiZeUdMqQRxyfTYaZn
         LHIO0nL1eqL1Dr0G8QbDRtk9PXHtu0KFYaPAiT13mzF1V/giuuN8EyvXciIBOyAr6n6y
         mO9qkzBOegs/MdsP8psejACKcYLsESXptGuFzfVCJnHbQWT7SYXogTi8MAbTfE2bLqvM
         Znbg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qOBPF3n2uKXjYYgSEJXpd2n5Dixe7SkM6sf8CYm8sng=;
        b=qwRX/pMv85FlTrGF6bZAZD6jp41qMHC70jkNMPmOMWpqlKS5LB1FMtf4JRbOfQ7tfI
         un/X78vA1Ykhc1gvOaE3WTv1pFmYisYOwC0Yu0F6zJboVvhvm1AxMDEtrTXdskJZPNAD
         eYRap0zb7z9NuJ75NIGtzk+XXFZRcF9LZoLx0hxJTzRjNEu191z6tYumTTcmDXpKyMjQ
         1hd6XBaR7QSKSYh+9e1tdQxjGblkk8y9XwdqhYpTUmXR4LpBIzJRnISQ7uSGYH17jXKr
         PFE+pT7WkyAocLPbvvKVKsIGVtLZEIdvt+BlWD+gVHr9qfgCYZasJWlDkBdOZdtW76QR
         tDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=qOBPF3n2uKXjYYgSEJXpd2n5Dixe7SkM6sf8CYm8sng=;
        b=Ft1W70cNpBUAwEQ/CnFjTKRWWpb8gXzQBHL/jmgWVJk0zP5I8J0FcGUwDeR3Fn6lBd
         sEyEtAH9evCGou0oM3iXotrENksMxtN2JaKH8YfFKxuflEVoyfCGw3IWdDgAMz9UvFE8
         aqpCwbhhY5UkZnQ8/nfMts/ujJB3ZVWcLZzTAOkZ/xyqh5wdskq0lSA4J3wb5nhefyHe
         SHrkZ0OY46NufF62g0SYW9ruiGggqwD17bUjysEBWR23B87so2K3zFwNUQ/gCL8m+Nj5
         lDtQZvhCpiZ97S0cDJnuGJ1OpxqOmUTnRL/CsnW0LxOXjI7Ffk4qunlXL6LveuSaUizg
         7ByA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3SGVd6tmDXjYlaijuCAOmPB6MIl4xn7OvFHFG1FhB4UUXrptXo
	C6cIUXFoR+ycIHkuRKuINBE=
X-Google-Smtp-Source: ADFU+vt0i+WnO7S2ibILLsOUZwsPdmDL8tz4yIW08HTV7iQvehNaumyaP0d7PnZWUGpghxrjAeXfHA==
X-Received: by 2002:a17:906:5ac8:: with SMTP id x8mr1375430ejs.214.1584442436448;
        Tue, 17 Mar 2020 03:53:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:c794:: with SMTP id cw20ls3483901ejb.4.gmail; Tue,
 17 Mar 2020 03:53:55 -0700 (PDT)
X-Received: by 2002:a17:906:82cd:: with SMTP id a13mr3672703ejy.70.1584442435694;
        Tue, 17 Mar 2020 03:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584442435; cv=none;
        d=google.com; s=arc-20160816;
        b=gx7ZE6CAC5miAXZZw3SdQYNS7hj7WGOpi2J4S6WRYEGigyqxJA5rzMKS+qoxNvplhN
         Ty4vCbu9qnibpLVS6F9tgipZ8TvdjXjzVpDhBckQ1EXnVZOsagxrF1HFXKLNkBLtmfbs
         WuvmIS4rDi32pL7sAhl4WCYQVjtO7TPkwqNer0YimmbHtr/DRMnNmGF6E6n72McYui1Y
         FiqcuviOBxjt5Fk3AhKT0IpDk2GNksFJS/mKV4iOJ6XHOan3K5ojIPVHjWy4GNGSC56w
         nOt+Da0lCuk2s1hkaawoDUVI/OO4v6zuzm9gth+8pGswFKMQN6keq+csg/wGsiqju+y1
         oKZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=DTMQ2iqxF7cjvZjgsFd7K0XXpIE/1dVSDF/srr2D8IE=;
        b=h10goedRlRE3It0obgNmbtOxhaEQ2ydy2BANCnURU2cvlvk9A/72U3qhE+/TPv3JUf
         5nITCUPGs304OdyXvEvXUu1NASPEI3kXDSZD6c5PpY3ONCQifw0OaIKSb9ynYoNkNNfY
         Xyrn1DA1qYgKuchqNl6gxS08noK+2+CRydokTJlafo6H+HpuZMIrMHAO7BOu9V8qcic6
         cIuztMYyFDa1X1fRa0UdOfvY0NvcXye4+l61USOyBLBWZ+2llijUYco1Ls4IrHfQOsIu
         LuogK9ck8yXLXAHyJZ5BKjsGdU44fJLbpGynSPzBXChHih6SYnuGnbJiEweor+2mfKKD
         UDnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id cw13si149304edb.2.2020.03.17.03.53.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 02HArsw8015297
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Mar 2020 11:53:54 +0100
Received: from [167.87.42.164] ([167.87.42.164])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02HArpj5028502;
	Tue, 17 Mar 2020 11:53:52 +0100
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: Angelo Ruocco <angelo.ruocco.90@gmail.com>, Peng Fan <peng.fan@nxp.com>
Cc: Marco Solieri <marco.solieri@unimore.it>,
        Luca Miccio <206497@studenti.unimore.it>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
        Alice Guo <alice.guo@nxp.com>
References: <20200305093950.848-1-peng.fan@nxp.com>
 <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
 <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
 <CADiTV-0DiAqxF0RvQ4xSfTOO-4hkRUyC-BiS5omDr1Y+P3ZEHA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <81f9a1c9-a4c2-ff0c-f387-90c959da9313@siemens.com>
Date: Tue, 17 Mar 2020 11:53:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CADiTV-0DiAqxF0RvQ4xSfTOO-4hkRUyC-BiS5omDr1Y+P3ZEHA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

Hi Angelo,

please avoid top-posting on MLs.

On 17.03.20 10:59, Angelo Ruocco wrote:
> Hi all,
> 
> This is some really interesting work, and we are planning to do some
> tests here at the HiPeRT lab in Modena on some other GICv3 boards by
> NXP.

I thought there was already a hypervisor in your lab that does not 
"depend on Linux to boot and manage its VM"? ;)

> 
> Regarding this, what is the long-term plan? Are you interested in a
> collaboration for this to have a broader support, with more features
> and be nearer to be production-ready?

This approach clearly has a future in Jailhouse upstream once details 
such as the code duplication with the inmate library and the propagation 
(or lock-down) of root-cell functionality are clarified. In fact, I 
would like to see this pattern also on x86 and upcoming RISC-V.

Jan

> 
> Thanks,
> Angelo
> 
> 2020-03-05 13:39 GMT+01:00, Peng Fan <peng.fan@nxp.com>:
>> ailhouse-dev@googlegroups.com
>>> Cc: Alice Guo <alice.guo@nxp.com>
>>> Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
>>>
>>>
>>>
>>> On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>
>>>> This patchset tested on i.MX8MN arm64 with quad A53 cores
>>>>
>>>> Patch 1 is to align jailhouse_system. Since the loader not have MMU
>>>> enabled, unaligned access will cause abort.
>>>>
>>>> Patch 2 is not that well orgnized. It does GICv3 initialization, SMP
>>>> boot up. Then kick inmate cell and root cell.
>>>> Some code are hardcoding for now.
>>>>
>>>> The boot log as below, you could see root linux and gic demo both
>>>> running:
>>>> root cell not able to manage inmate cell for now. But I think it could
>>>> be supported. intercell communication not aded currently.
>>>>
>>>>  From test log, linux root cell boot will cause large latency for
>>>> gic-demo jitter.
>>>>
>>>> It maybe good to use cache color on ARMv8, but still have issues for
>>>> root cell DMA without SMMU.
>>>>
>>>
>>> [..snip..]
>>>
>>> Nice to see this being supported...!!!
>>>
>>>> Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
>>>> [    0.127643] Detected VIPT I-cache on CPU1
>>>> [    0.127671] GICv3: CPU1: found redistributor 1 region
>>> 0:0x00000000388a0000
>>>> [    0.127700] CPU1: Booted secondary processor 0x0000000001
>>> [0x410fd034]
>>>> [    0.159684] Detected VIPT I-cache on CPU2
>>>> [    0.159700] GICv3: CPU2: found redistributor 2 region
>>> 0:0x00000000388c0000
>>>> [    0.159717] CPU2: Booted secondary processor 0x0000000002
>>> [0x410fd034]
>>>> [    0.191721] psci: failed to boot CPU3 (-1)
>>>> [    0.227974] CPU3: failed to boot: -1
>>>> [    0.231609] smp: Brought up 1 node, 3 CPUs
>>>
>>> Did not look closer but couple of questions:
>>> - I guess the above CPU is given to inmate cell.
>>
>> Yes.
>>
>> We should be able to handle
>>> this error gracefully rather than failure. Wondering how other
>>> hypervisors
>>> handle this.
>>
>> It is because dts file has 4 cpus, so it will surely fail.
>>
>> To XEN, xen will take over dtb, and runtime create a new dtb for dom0.
>>
>>> - What level of features supported when compared with type 2?
>>
>> Just a few in mind
>> Fast inmate boot.
>> Easy to support aarch32 root cell with aarch64 jailhouse
>> Decouple Linux as root cell, so not a must to take Linux as root cell.
>> Cache color would be possible for root cell
>>
>> Regards,
>> Peng.
>>
>>
>>
>>>
>>> Thanks and regards,
>>> Lokesh
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB448105AD6E53770A3BED0E5B88E20%40AM0PR04MB4481.eurprd04.prod.outlook.com.
>>

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/81f9a1c9-a4c2-ff0c-f387-90c959da9313%40siemens.com.
