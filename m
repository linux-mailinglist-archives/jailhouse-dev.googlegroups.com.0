Return-Path: <jailhouse-dev+bncBCSPHTXQ2UMRBDN7YLZQKGQE5IHI53Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E286187DA4
	for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 10:59:42 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id ce13sf17713408edb.11
        for <lists+jailhouse-dev@lfdr.de>; Tue, 17 Mar 2020 02:59:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1584439182; cv=pass;
        d=google.com; s=arc-20160816;
        b=l2UHOgQvOsoMMzriXicfBUatTrsNQ7QC1QzZALZQx8eBLtDWR0Wfmm6HHaH1IRf1yJ
         SYcMPks8MTrK9PJLc2PxM0ZJUyC3Fito7j1UTmTLD+OZ0vkFtRIU55XSx4TwBiiytLuE
         iI/THnJsvT8CFPt+DMuN5SemUiJdYCcjQnxyGS6NpMawheuO/Hz4cpEZhihys1G39iXn
         vBkPPbq1kH+dzihkTyA0CZiBr7TOrVF3Ch30rcUidW2h6yAi0AgrrOxu01ODb7TAMO2n
         JNW0FNO2nKMqjuN9xvOLseG6eWHJvLr75Qs9gRiXqTptsZuK50sOvozANNphazXAo8xz
         CDKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=SPNjchxJ0yO+gdr5ZFgJ6hLHjHdSD/KON1LNbqOnecc=;
        b=apANxP/+326qH6aNKZ34K5ECtfvYN031e86RMdTWVJcaZtf7pCQ4IgoteRocmkbu/8
         XfQljNv5qMgvowENheIUwxQ5CUCVOXlrBW51SEMNjpbgyAu5MsjT5713S4pj5uyTRQXf
         VJDE2z3MHXGzEdEYGPxbnEWY8ju39GyQftmsN/YDySROzNuZc+5A7MM8uWEeHL8B2zf8
         nlWHtAErF08syyWe9C2rnJT6yYcVlDhccwoeXXTYcLweQ9S0dasT20fOwsl2ROyUdLze
         ttqlGH+v8DwCuvrbvJpudyHpNE3KrE0PPyBPnIrOBpI7dQiUX3jTibylCG0BMrJ3P0AC
         ZpwA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4oeA6xs;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:in-reply-to:references:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SPNjchxJ0yO+gdr5ZFgJ6hLHjHdSD/KON1LNbqOnecc=;
        b=ibetB9DySltXbu1VIVrHDyruAdIb1t31BuTpsRO8w6NaF33EOum6vF+gfsSyVYFw4f
         S3s/jo6BlGbe3EBaRLELDDLAIIyZiFjqNGwaDWvjpDhbt2/IGxixnDXJ1yoZF+bW9vE0
         D5lNTaWxO3NWwCHRzEDuUKmwXsinA6tV4dZ4xhCoZQB1AXEiPuWTwArjCht9EaqY2Q8C
         hoGl+JdOC8lWDeVBcdewGX6e290qsFsLc75WQHJQdVWDDNa5fG6U+MQz34pmjbukc42w
         i1PInNramYMvqAr7NL1zP7G1Y46FKhSrvXUQ4HGv3gWdpvCPUkHh51zH1FsDenBJemv7
         uCyg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SPNjchxJ0yO+gdr5ZFgJ6hLHjHdSD/KON1LNbqOnecc=;
        b=c3poaPDr5qZCpiiurOVEKugnGK/SyWbFoz3D3IalzB1tlFMyaSU9Q/r4zrzaD26aeG
         /ZK2vW6ikqEjNF8ME4Q4dohVxxppoo7d1LaY+DCwqGZSW0Co0ghai+VFmvNTJaDa5lve
         9B6IFOzp69Ku/dK7xOucMEpgdi1SjDusKF3oaxZLENWRXGVoHiFXjEQVY09SnZdJRFxQ
         yQ8x3ng+Bi094zKy4bc6Qr0F0oNvCPdmrs0qALO2hRBY0l/nYjZEhKlrKS2KuY5FhvBb
         tdstr3/eGlidZUmj5ljNjpPOcja/LhPqaiKPVAOhAPkbvjGmww4LdpGIQLCigqtYBryg
         03kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:in-reply-to:references:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SPNjchxJ0yO+gdr5ZFgJ6hLHjHdSD/KON1LNbqOnecc=;
        b=n3rgmz4isjFNeG5nIBN58VoJhsa8eUho0hV5Sfml26xN2zrXppiKmvJDRYPC4dB27E
         h1JnA4pna/rvZ2xrtvFRGZsyWX4wJcsx6Ml2nkuQ6l/pN5kQzI0ecH5Qgcx/0hiwWpuR
         jkGhv2Bv2uxU/W64XLqZbNhi4xQiGDzT0K8W3PQrTH2OeiKcC5biC7hhlx0yN3WYkS+Q
         VvdvbdfL6QnSMrsf4ENhACVABjpOzH43HQ7itOsbu3baORcw0TH/JEruNMu7KNv/pxSy
         2lApecCUEPuAO44ymZcJnSTnrwJTWWsa/IGgcwT4q1Xu4T/TgLBQrJAH6XAUJvR8KP3Q
         qfpQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2RqbOjbmWTLmFRwD5EuI/MIU10OJ3jJk5F1nzuQCdHrRXLE68o
	LCjqNlBnvFhPUZIt0Uy4w4Q=
X-Google-Smtp-Source: ADFU+vsAzJutvMdF8BxmBh1Qjnx0gZ2NCOjU6J+Si/KGNTSgAjEHiERwOSk1B8rZJWUwavkFAIllKA==
X-Received: by 2002:a17:906:3e06:: with SMTP id k6mr3420636eji.29.1584439182247;
        Tue, 17 Mar 2020 02:59:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1599:: with SMTP id c25ls5771046edv.4.gmail; Tue,
 17 Mar 2020 02:59:41 -0700 (PDT)
X-Received: by 2002:aa7:d9d4:: with SMTP id v20mr4493107eds.140.1584439181376;
        Tue, 17 Mar 2020 02:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584439181; cv=none;
        d=google.com; s=arc-20160816;
        b=eS3hNUJb/mLsRD6nJnvNPjumPkQJEPKSGvDttngbqOnObvY1ACrWp4uqfrbbsSG8PS
         4fXd/3XaW6uTkgARdltxa51njD2B+drxgQJ4wQWizcKo+TyUzsKz9snCWX5R066LlLQ8
         nYLfquE4PYurMM0N3sglxJ8Fwnfb9dQY4mr6y+QQUkMG7dQqO4G3RbeEYfHCGqwpkrqS
         3ODoJ2AJ/iYPgeaUO5mT8lOe42um5wobD5QSEj6J8d/SsNF3V8haFdyV2huLPGW0BEfG
         xBT4lhvC/JOTLmhrpJCFpCXjYGbxrlA2R29g3jAA57YrPjI0wPCTSDpHoSVd3bjzIvSR
         /ecw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=y4iF56T2Xfde9VgDwaKroQLBIS7ZFL0/3PmhyhV5bFY=;
        b=TL0JUmvebMhmt5cE+WzVCiKBrIq/HeJy3S4fbJNFS3spNbeDNYegIQwPFSiWMs+Otr
         vf2Jd5Ij06735Q0qXlbv2ymbOE27mxYhY3nohhPsYZFV4RtP998MtkW9rz6F9dQf8Ljx
         wA+RTAh1uX6SAWiizL6gGlshHvPsQrGSAxWfCx+9doii6wlNOsSZZW8jhkNK7C7ZhV3p
         0sJL7PotfGIJQwkrp3Qdly4RlWgvodHK/Bl/6u4vxrFMTgv4DyT5bqj5jO4jLWXKHLae
         c57jO/tlSPQVCGy3tkLabJsedEEaCgururwb/SY2O80oU0hdKx3dpmwjmo8WYgC0F4CP
         T/aw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=L4oeA6xs;
       spf=pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com. [2a00:1450:4864:20::542])
        by gmr-mx.google.com with ESMTPS id dc25si118742ejb.1.2020.03.17.02.59.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 02:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of angelo.ruocco.90@gmail.com designates 2a00:1450:4864:20::542 as permitted sender) client-ip=2a00:1450:4864:20::542;
Received: by mail-ed1-x542.google.com with SMTP id h62so25511863edd.12
        for <jailhouse-dev@googlegroups.com>; Tue, 17 Mar 2020 02:59:41 -0700 (PDT)
X-Received: by 2002:a17:906:c0a:: with SMTP id s10mr3169876ejf.219.1584439181028;
 Tue, 17 Mar 2020 02:59:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:af6f:0:0:0:0 with HTTP; Tue, 17 Mar 2020 02:59:40
 -0700 (PDT)
In-Reply-To: <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
References: <20200305093950.848-1-peng.fan@nxp.com> <be1e8e77-522b-0238-0031-3254eea4678d@ti.com>
 <AM0PR04MB448105AD6E53770A3BED0E5B88E20@AM0PR04MB4481.eurprd04.prod.outlook.com>
From: Angelo Ruocco <angelo.ruocco.90@gmail.com>
Date: Tue, 17 Mar 2020 10:59:40 +0100
Message-ID: <CADiTV-0DiAqxF0RvQ4xSfTOO-4hkRUyC-BiS5omDr1Y+P3ZEHA@mail.gmail.com>
Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
To: Peng Fan <peng.fan@nxp.com>
Cc: Marco Solieri <marco.solieri@unimore.it>, Luca Miccio <206497@studenti.unimore.it>, 
	Lokesh Vutla <lokeshvutla@ti.com>, 
	"jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>, Alice Guo <alice.guo@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: angelo.ruocco.90@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b=L4oeA6xs;       spf=pass
 (google.com: domain of angelo.ruocco.90@gmail.com designates
 2a00:1450:4864:20::542 as permitted sender) smtp.mailfrom=angelo.ruocco.90@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi all,

This is some really interesting work, and we are planning to do some
tests here at the HiPeRT lab in Modena on some other GICv3 boards by
NXP.

Regarding this, what is the long-term plan? Are you interested in a
collaboration for this to have a broader support, with more features
and be nearer to be production-ready?

Thanks,
Angelo

2020-03-05 13:39 GMT+01:00, Peng Fan <peng.fan@nxp.com>:
> ailhouse-dev@googlegroups.com
>> Cc: Alice Guo <alice.guo@nxp.com>
>> Subject: Re: [PATCH 0/2] boot jailhouse before root cell linux
>>
>>
>>
>> On 05/03/20 3:09 PM, peng.fan@nxp.com wrote:
>> > From: Peng Fan <peng.fan@nxp.com>
>> >
>> > This patchset tested on i.MX8MN arm64 with quad A53 cores
>> >
>> > Patch 1 is to align jailhouse_system. Since the loader not have MMU
>> > enabled, unaligned access will cause abort.
>> >
>> > Patch 2 is not that well orgnized. It does GICv3 initialization, SMP
>> > boot up. Then kick inmate cell and root cell.
>> > Some code are hardcoding for now.
>> >
>> > The boot log as below, you could see root linux and gic demo both
>> > running:
>> > root cell not able to manage inmate cell for now. But I think it could
>> > be supported. intercell communication not aded currently.
>> >
>> > From test log, linux root cell boot will cause large latency for
>> > gic-demo jitter.
>> >
>> > It maybe good to use cache color on ARMv8, but still have issues for
>> > root cell DMA without SMMU.
>> >
>>
>> [..snip..]
>>
>> Nice to see this being supported...!!!
>>
>> > Timer fired, jitter:    749 ns, min:    749 ns, max:   7999 ns
>> > [    0.127643] Detected VIPT I-cache on CPU1
>> > [    0.127671] GICv3: CPU1: found redistributor 1 region
>> 0:0x00000000388a0000
>> > [    0.127700] CPU1: Booted secondary processor 0x0000000001
>> [0x410fd034]
>> > [    0.159684] Detected VIPT I-cache on CPU2
>> > [    0.159700] GICv3: CPU2: found redistributor 2 region
>> 0:0x00000000388c0000
>> > [    0.159717] CPU2: Booted secondary processor 0x0000000002
>> [0x410fd034]
>> > [    0.191721] psci: failed to boot CPU3 (-1)
>> > [    0.227974] CPU3: failed to boot: -1
>> > [    0.231609] smp: Brought up 1 node, 3 CPUs
>>
>> Did not look closer but couple of questions:
>> - I guess the above CPU is given to inmate cell.
>
> Yes.
>
> We should be able to handle
>> this error gracefully rather than failure. Wondering how other
>> hypervisors
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
>
> Regards,
> Peng.
>
>
>
>>
>> Thanks and regards,
>> Lokesh
>
> --
> You received this message because you are subscribed to the Google Groups
> "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send an
> email to jailhouse-dev+unsubscribe@googlegroups.com.
> To view this discussion on the web visit
> https://groups.google.com/d/msgid/jailhouse-dev/AM0PR04MB448105AD6E53770A3BED0E5B88E20%40AM0PR04MB4481.eurprd04.prod.outlook.com.
>


-- 
Angelo

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CADiTV-0DiAqxF0RvQ4xSfTOO-4hkRUyC-BiS5omDr1Y%2BP3ZEHA%40mail.gmail.com.
