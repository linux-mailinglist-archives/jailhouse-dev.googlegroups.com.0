Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB6HUXHZAKGQEROUEOBI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id C8584165D77
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 13:24:24 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id p2sf751416wmi.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Feb 2020 04:24:24 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1582201464; cv=pass;
        d=google.com; s=arc-20160816;
        b=tMHFB0k8RfrsEqDOvH3W5IS+OcKxPobPgsPJUNoDoVyDg3BepTctpV2jLpESHgRMeB
         crQ4qdy2O1YVeRNcswjd3Z+gJRM8r/Ba1kg5VVUUSZSgjcSRmXKyW0c0MtOnGXQSPSY3
         vITVRomfO6fuqQ9RkW2vG2WfTghVXY2Ho3nNkB4BCNw2oEY3AaAMhHZne6shGCWLudDU
         7JWmI4wwXi5b3Z1kytgq1Z1ey3IaxD0iDSAHbUAV8DKMEzFhD6mAur2VoQk+91h0jMzM
         MDOLYmq/wIrNSXs1ZVB1wDW3esdwuTwgRGPZk2/kTtdr4GlDPjo2Iug0QgSgV/QlKfCV
         alyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=ymO5QsHLbICIaAI46gPHdPfMsNd5A5dbk35+kfmb5Bw=;
        b=KrgthUHHNv+MnLeX3Xp0mz+SP1OOq5VxQPrdNZ9zgyZ2byJa2/Ell4x2+INjPMLoTh
         JuzHgeVEdCitczO06RdEnKUUxbgRSa/RmVrfnA7YXsUcEBgA3jkK6Lbd1F2fWgjtXec6
         7PdobeIGcg3JLHBZEOJp6xHzBOQnMJkFgSABbjhPKY1vz8CHqX5Tpso6aV0eI1TQKESx
         BsL/B+O3pfU7hlCdEqisYhAeKnjUQMj7wCWcgXPd73tGKG9Wb83FB8fHiTbeIZVML7D6
         EeHEop8UK9hr/GhFFVBhbPScEgXwwBf9ept7ZlB/DRXh4FzlBe1XuBNQgXz+YZGB0/LI
         Uqmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ymO5QsHLbICIaAI46gPHdPfMsNd5A5dbk35+kfmb5Bw=;
        b=Bas4QuSpcwv56c6uSkPySgf9Gwh+anj+sDB6/giQjgWj1uXN7KKTZwoI0y6NgkO/h9
         SCwbhimd0Jix4IdsBobmIRoRGulaLoF+DziyCT/uZmmIfeHuYXLtO2yGFqW/Xcl47/w3
         eFoKkYOUb+zFBaFNBRRsbtyLp3yUN/I7Cd33cC2zhDWB/sYVPVUYQmngxK66ZpuPQO8g
         QXCRseuRwfnj1R6DJuv7krvmqxAhuJ6YxDlOdbzjwhHgCxixyKogyC0ys2HQaRWpFOsz
         E2j3+T6ZZIUb9R5IH/H4oMRXBRZkQKX7Vr6C7eryqihChTaL/c6GQprnr5zK7z9+XarC
         IIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ymO5QsHLbICIaAI46gPHdPfMsNd5A5dbk35+kfmb5Bw=;
        b=APAZ9Z4qSCRweY4Fjv5fyhLBTthH7MxgLbHAdl/JPldP339N+64cnjBFszzPUPX51R
         48tMZP9+B1iPb9nIgRtd6/FWDIjzustgdfO1R2yKVugQzD89v06hNdPMpNUy2a892VbE
         gw5URMdcxHoVJHzIBKKFM5E0p4kXjS0IbRonZFcFO6DxYSliVbKIfmTwft1HsXVCtZY6
         WOvzdLaihhXNWxQ2TiHQR0xdc2n59JsDMBXUtnF9oF8W2Pz5+beSzndmK5YyDO8HgfCY
         mU9M4qOv5+0PWZB5XdU6N1mPbJrFHp54dLx/hGaMiC+v3+fSkZbLmdbhUXvGUlRAMezn
         Esdw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUutSvzIwjzva545PKJkTmEnY1goj4ytawOUXzs3TN65G3M4z2F
	ZI8Z2Ufs15vGO/n5ko+Oq04=
X-Google-Smtp-Source: APXvYqxqim3C4/1/O01EHBt8znIRWIG1jmgCLTVZN2UiLYe9r7kzYcO/AX4j08BSOE1PPERXfL7VuA==
X-Received: by 2002:a05:6000:1206:: with SMTP id e6mr14836269wrx.410.1582201464455;
        Thu, 20 Feb 2020 04:24:24 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:6385:: with SMTP id x127ls889669wmb.2.gmail; Thu, 20 Feb
 2020 04:24:23 -0800 (PST)
X-Received: by 2002:a05:600c:214f:: with SMTP id v15mr4383581wml.110.1582201463682;
        Thu, 20 Feb 2020 04:24:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582201463; cv=none;
        d=google.com; s=arc-20160816;
        b=Wa07ZvpfqAoyzM/vRjEympVzbJ930i/vowGi54rFnm4fwquCnUhty23JiX6AP921Ni
         K23FN8GHN8RRXhNqcCMPirxsKnLdOXA82AcJ8IZ5Q1mkOGJg5eTuCLXTCM5Oq+LLB7nz
         0aeyM32YQKnibqU0CpMGX/jaKDgWoAVxjgmvlvN7pI9Z9XXmWfNnFQ+mjaGO/MOrU9Hw
         +YgY7ye1+TUgfUIC/woC6MKM/y/1BKIzzdwWZM1yhmttPBibpFnm0DhGfXzibbxc09wy
         GDFHkA8JpdO8x+LL3ZfW5I1NKrWYlBQIz1UI8Ht7rCHE31To8HforbvdjfAm/yJM4rnB
         m5rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qBBJ6OUZv3W+7M1Dxnaxo+yZUYonyURj0hoh4hdiGgI=;
        b=uDgTE6wYp/JM/bNcbhP2L32SwkFiqJrGpGU+PTAHP/+y3U0n7rb9LgjvnrlbSoiVVY
         NunsIz8fDxX8SZybd1kIn19M0H0RsQQWLDX7UkX77Xmfa+G679ftaZ1/ZzaIa3xfcX+Y
         pGf/5CFT05bxyEjfhBET5BkvuAyt1OJ8bRfxShnXKTBWslBQ1v0zzX2HWssu8o4Xb0GM
         HH+IwX2JXF8Jb5UUkt9ZGi9DsSZ667pR2mzS5ts+1qF2ZsH5y+OZktBvYlGlWhsTU2R7
         nrnlwFL5Suo5BQNAKWjP7OdsCsPxEMYX4akk2K1QtidIKZymSyybm8zlzlWvWUoDgf3F
         NpRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id i15si206027wro.2.2020.02.20.04.24.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 20 Feb 2020 04:24:23 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 01KCOMY9011743
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Feb 2020 13:24:22 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 01KCOMnq007179;
	Thu, 20 Feb 2020 13:24:22 +0100
Subject: Re: Linux non-root cell tooling
To: raymanfx@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <2b9c213c-a111-4f3f-94c5-4f89d06b5fdf@googlegroups.com>
 <eebfa055-f561-d5fb-7da6-706bb1e858ea@siemens.com>
 <439a798e-f9c3-4455-8128-e4047e5aa9e3@googlegroups.com>
 <5d6e66d7-2a25-1678-2ff1-247e861ab8d5@siemens.com>
 <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <ba1334c7-a13c-fdea-7177-53ad21c23244@siemens.com>
Date: Thu, 20 Feb 2020 13:24:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <dfe23f77-f16a-41c9-9f6e-8e67b853b66e@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 20.02.20 10:41, raymanfx@gmail.com wrote:
> Am Freitag, 14. Februar 2020 16:15:53 UTC+1 schrieb Jan Kiszka:
> 
>     Check if your non-root Linux comes with CONFIG_X86_X2APIC=y - I suspect
>     it doesn't.
> 
> 
> It didn't. Fixed that and now I can start the non-root cell. Thank you!
> 
>     You can find a working x86 inmate kernel config in
>     https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4
>     <https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4>
> 
>     (multi-purpose config, thus a bit larger than technically needed).
> 
>      >
>      > Is there a guide somewhere that documents the steps necessary for
>      > adjusting the linux-x86-demo cell config?
> 
>     Nope, unfortunately not. The mid-term plan is still to enhance the
>     config generator to build also non-root configs. Any contribution,
>     including "just" documentation, would be very welcome!
> 
> I'll prepare a pull request to update the documentation.
> 
> Although I cannot see any errors in the Jailhouse console anymore, my 
> Linux guest still appears to be stuck somewhere.
> The console output I get is:
> |
> AddingvirtualPCI device 00:0c.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0d.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0e.0to cell "linux-x86-demo"
> AddingvirtualPCI device 00:0f.0to cell "linux-x86-demo"
> Createdcell "linux-x86-demo"
> Pagepool usage after cell creation:mem 375/975,remap 16395/131072
> Cell"linux-x86-demo"can be loaded
> CPU 2received SIPI,vector 100
> CPU 3received SIPI,vector 100
> Startedcell "linux-x86-demo"
> CPU 3received SIPI,vector 9a
> |
> 
> I added the JAILHOUSE_CELL_VIRTUAL_CONSOLE_ACTIVE bit to the 
> linux-x86-demo cell flags to get kernel message output in /dev/jailhouse 
> in the root cell. Is that supposed to be working or do I need to use UART?

You are free to choose the output according to your setup. The virtual 
console is a bit limited (write-only), inefficient (one hypervisor call 
per character) and not available when the root cell dies, but it can be 
fine if there is not much to print and no UART free.

> 
> At first there was a PIO read access violation at port 87, I went to 
> check my root cell config and found the following:
> |
> /* Port I/O: 0080-008f : dma page reg */
> /* PIO_RANGE(0x80, 0x10), */
> |
> 
> So I added that exact range (0x80, 0x10) to the linux-x86-demo PIO 
> configs and the error disappeared.
> Could that be related to the cell being stuck issue?

PIO access has no "shared with root cell" mode, like memory regions (and 
there is can be dangerous): If you grant access to non-root cell, the 
root cell loses it - and may then run into own violations. I don't 
recall what triggers access to this port, might be the SERIO things, but 
it can be configured out.

Jan

> 
> To ensure it's not related to other missing guest kernel options, I will 
> build a kernel with your amd64_defconfig_5.4 
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-kernel/linux/files/amd64_defconfig_5.4> 
> and see if I get the same results.
> 
> -- 
> You received this message because you are subscribed to the Google 
> Groups "Jailhouse" group.
> To unsubscribe from this group and stop receiving emails from it, send 
> an email to jailhouse-dev+unsubscribe@googlegroups.com 
> <mailto:jailhouse-dev+unsubscribe@googlegroups.com>.
> To view this discussion on the web visit 
> https://groups.google.com/d/msgid/jailhouse-dev/dfe23f77-f16a-41c9-9f6e-8e67b853b66e%40googlegroups.com 
> <https://groups.google.com/d/msgid/jailhouse-dev/dfe23f77-f16a-41c9-9f6e-8e67b853b66e%40googlegroups.com?utm_medium=email&utm_source=footer>.

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ba1334c7-a13c-fdea-7177-53ad21c23244%40siemens.com.
