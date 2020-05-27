Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKMKXL3AKGQED32YMSI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id 7413D1E472E
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 17:20:10 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id 3sf4387303wrs.10
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 08:20:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590592810; cv=pass;
        d=google.com; s=arc-20160816;
        b=DfQq4HOHs9rg/yL0ChNSI7KfFr/rDmHKEu7s6PHY/Iwbg40a/Th57v08tFyh/ufaac
         S4UytGNyxR+8z0Q9Zmr3HKlRSBSCvAzfz+RCeL9t+EFqjOZqnhmLSkhgE30eJ6dwSX0S
         XC1qJ4ac24PZ/KwVhd9hb1p7Bh6SSTwm8FNaJorqozIIaP6MFBBnc5uQNojknhDKTPky
         6F8vROIZX9i5Ma0noRct/oULb6tFC0dYxaKX5bFn6HBn0vVR1AyBOxnrdobbxuyiPIs9
         Q24CbkW8t5VoLI5jDEvbHb8I7UYGkKwut7jJ70RunTusTpe3eRz/EN3knnqZrvPzjm/P
         eIDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=ti1azP5DtEcwCFM3GrC6bylAryU4gyzOlIKaOYPRh3o=;
        b=wooq/ai6pgAuGzRZM+VyCrucTyZsRwo0jCMVQrdC8aYNBmuZhnaoBSMpOZiDVbEFCH
         BcSg/IhHeA3ILBg6hTZSXwiCqzyTcCvYTwJXGu8fBZ7OJNSm6kWHH9BC6ftgtms+oX99
         92VrvYX+EaLpg8fIabZ0/romVfX0g6Vb17705RuRU06NMCTE9H25o4yNJrBrdjFGB9+D
         F0mXgtj3bE2hETEx/dJ+moBP6YpAmh5A+99n+a8n/lbcyjk1lNr0Sp4gGsg9dVdWDE8h
         /kVaqiPkjRUuU/DtxYOx4HyWwDHYWSQoJJsiNQHTT0ukHngYJu+t1AqMhBjvfXZpZLpE
         x9aA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ti1azP5DtEcwCFM3GrC6bylAryU4gyzOlIKaOYPRh3o=;
        b=hMcryBufKCmqnNt45AYvyf+CPZU1tEz4wnpVENP0w5VkxwE3HxDcfZAXZTj8sdXIum
         nDIKC4qoSc++GwbsydIKAh+ECWaw0e7AHYZ0ZqKnaC6HnH6qGI416ZRm27z4t7oHux9f
         QMQa4DzcYAgRqZt9GHWtBxVKjG2Q8U6oHrX0Uf/MbBTZJ3xaS8eSMopl4OTxpWeJTNCW
         2O0J2MyUpe5tKy1MXG0xzVxRe7TYTmei7N5/8q1SlWYZIlBykK8u/n5HWUF7QghVz7M1
         W2kRn+b7c9/7BF8gV8JA7lwfrzG/GsjOY8NugCtlNu6wqg/q3lQbXFEf5VH0dj5uYXm6
         NUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=ti1azP5DtEcwCFM3GrC6bylAryU4gyzOlIKaOYPRh3o=;
        b=dmsGj9WZZwPuUeZo3XyMuGTqxJ832sZImSkezdvrJp1CtvbfnSHnIzj7H1IhJDaQ3h
         JcGBpC7i7T0Cd7+6PAv1T6HDXD1UW5VrS7EDd1o/KtbeVyZC/ScNuVFr5Sn9EZ6Lq+Qo
         UPUqZIrv0hkVTrXy14xdT3WiGsd0XpX3Sxe2CIJ1/WLX9v68f8EwwAm/ETPO2YGcqT5k
         qnK/rGSZ/MoUXUsFezxZP/a5bExVUxADobpoUtzAWoHlUffdALCfY21qP3E8biFhUO0W
         LuV4/xW3yAl54NIV6xnLrm31nASSPlI5ON3tjuEGlaVe0t0RjkOsJGJnYRVJcyQEMgOB
         1vPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533/GPvJp6kgGs5eIX/8K3PUQ8dWm6StfrHKAX/aDlPFwNPnfOoS
	dZQUlCU3NFns412StOEj33g=
X-Google-Smtp-Source: ABdhPJxqGamWe3Jy2HOtPsen0hW5OK82L4/G7UVpqcr6uH61PN7EG0HlMYxuwe7ZsDTkrL/zwwjSGw==
X-Received: by 2002:adf:f00f:: with SMTP id j15mr5618356wro.347.1590592810104;
        Wed, 27 May 2020 08:20:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:5224:: with SMTP id i4ls3852166wra.0.gmail; Wed, 27 May
 2020 08:20:09 -0700 (PDT)
X-Received: by 2002:adf:f907:: with SMTP id b7mr25874807wrr.203.1590592809317;
        Wed, 27 May 2020 08:20:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590592809; cv=none;
        d=google.com; s=arc-20160816;
        b=kQDTDgfp66CR/lj3BDjRKbz80zLQKdUdIhzRilRO+TM3g5Rxxbgk+1U37RK8GKk16d
         okEHkpLZo8T0zWcw0vJDQ3vqS0Xm04IrqdjK2TXA9s939nX6dfwGiuLgaNYyTmqGlOoX
         DkfUp5ARxLrCTx/VezW0OlG0SQ7gxu1EbaQAgaClgfGeCeB/CwfBzwraVyuOKMaxRpXA
         krDntYNvWeoB7huw01Lmg1PJlxoY2SD6hHEs2DNmXJ3WyatnO6wDm4Qb4+Gv4pf3ogU3
         nzW4IpwytZYW6XvYiGOE48znBHW18eY3pbLjHu8vI9KQEZCY7qB0ljGgOldXIjuJD33e
         rfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=uoUbsyl3fUQF83xzPxLnNdbix7uxAZFk4oCtmTTzsFE=;
        b=V5ORGPJvJeUwmAfU6t/kuadH4WD+h8hPdrVrhWu6KPRdtyQ1VZ777SwN1FrWw/SEzN
         Fi+OKjksQxRcpQsr5DdKwJ7hnG/ZctMcWw8P54Z677cySGuwvvkjXed3kZVQhYWnwtn5
         U+6WqKg1nOKRkTxuAa0JEhlwUkkqUgrzo/qREmMOyBsPdk7kGzS98FryLhjST6E/6jB0
         603Un7iLYlY6+A5LVWVkG5JyBMymQyV2mLvYiy8BTtLQqaz2q1iFCxHpARBrIZaVWImI
         //k5l2VA5Dx9rIMueIPPibyg61aMQJ2ji549VaLGUBvrUYSIcOlhWqe3y3Fepbutmf5I
         fodA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id f1si158244wrp.4.2020.05.27.08.20.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 08:20:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 04RFK7ZW009572
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 May 2020 17:20:07 +0200
Received: from [167.87.6.205] ([167.87.6.205])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04RFK5CS023139;
	Wed, 27 May 2020 17:20:05 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
Date: Wed, 27 May 2020 17:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"
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

On 26.05.20 15:24, Marco Solieri wrote:
> On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
>> On 22.04.20 10:51, Jan Kiszka wrote:
>>> On 22.04.20 09:22, Marco Solieri wrote:
>>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>>>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>>>> Predictability of memory access latency is severely menaced by the
>>>>>> multi-core architectures where the last level of cache (LLC) is
>>>>>> shared, jeopardizing applicability of many Arm platform in real-time
>>>>>> critical and mixed-criticality scenarios. Support for cache coloring
>>>>>> is introduced, a transparent software technique allowing
>>>>>> partitioning the LLC to avoid mutual interference between inmates.
>>>>>> [...]
>>>>>
>>>>> Thanks for updating this! I will refresh my caches on the topic and
>>>>> provide feedback soon (I already have some questions and remarks but
>>>>> I'd like to double-check them).
>>>>
>>>> Looking forward to hear from you.
>>>>
>>
>> Done with the deeper review. Overall, the series looks fairly good. I see
>> just two bigger open issues:
>>
>>  - inmate loading interface
>>  - more architectural independence
>>
>> But I think those should be solvable.
> 
> The major point you raise is that the impact on the hypervisor code size
> should be minimised -- the inmate loading interface.  We took a while to
> consider and weigh the various alternative designs.
> 
> First of all, let us consider the optimal solution in this sense.  That
> would be placing the whole colouring logic outside the hypervisor, in
> the Linux driver, or in the userspace tools.  No matter how implemented,
> this solution would require, sooner or later, to pass to the hypervisor
> a list of memory regions, one per each memory segment to be mapped.
> Now, such list would grow unacceptably quickly, wasting a lot of memory
> to store it.  Take for instance a Linux inmate, and suppose 128 MiB to
> be its memory reservation requirement.  Now, assume that each
> consecutive fragment is the shortest possible, i.e. page of 4 KiB.  This
> means we need 32 Ki elements, each sizing 16 B, which is 512 KiB in
> total.
> 
> This brings us to a design conclusion.  The mere colouring logic -- i.e.
> the algorithm which conceptually expands the colour selection within a
> memory area into the lengthy list of contiguously-mapped segment
> (next_col) -- must be placed together with the mapping function
> (paging_create).
> 
> We believe we can leave everything else outside the hypervisor without
> much effort.  We can move in the driver:
> - the cache probe function (get_llc_waysize)
> - the initialisation routines (coloring_paging_init and
>   coloring_cell_init).
> 
> We believe this is the best compromise.
> 
> In this case, a minor issue is also worth to be discussed.  The cell
> load function requires an IPA-contiguous mapping for the memcpy to be
> efficient.  This in turn requires such mapping to be performed by the
> driver (we don't want to add an hypercall, right? ;-)), thus including a
> second copy of the colouring logic (next_col).  It would be nice,
> perhaps, to have a 'common' section where to place code shared between
> hypervisor and the driver.
> 
> 
> Looking forward to hear from you.
> 
> Cheers.
> 

Thanks for the explanations. My current feeling is that I need to look
closer into the implementation so that I can argue here on eye level.
Will try to schedule that soon and come back to you!

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7fff9e0f-e13f-b41a-36c9-228e9883fa7b%40siemens.com.
