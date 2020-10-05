Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOF55T5QKGQE4EI626A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE7B283678
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 15:25:13 +0200 (CEST)
Received: by mail-lf1-x13f.google.com with SMTP id q4sf1731888lfn.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 05 Oct 2020 06:25:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601904312; cv=pass;
        d=google.com; s=arc-20160816;
        b=jmUjmpCQcLOGC6vOH7/TZC7XIo2rmSaQonZHQhDscrZag9x8Ert9UrF6ZT/5T5PLdj
         mAX7jac+v7+bc6lr933UyXdv0kIM3YnxE2LX9UegNOYgsfPwqaM+rnhOFb4QSeELO8gk
         AeN2RZPXlU7LKW0Lq6dZ/yq+oHalAKNJWu6uQcdC2YKciMew1VDJEWdHC8KckHLRnrzc
         quGIs78dSXZjXyYeckDZXxi8+sHLfVRKNa4yru/40yB5/lFhVBeLQx2WtzJARs1YXWE5
         l6Gh0YjQW3tgvZKZ1HRFY9rzRuSrOqF51nTcCQGoeSLR5Ibi84+u8jaaZI1YAZNLLiKN
         5Vew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=kiX+Ip/vIfBF5LMVV3gX2/ykom+NiouiQgOiA4Wzr+g=;
        b=rjrBMcvD/c/vDYCZIcYvn0YZOIDM4U6OIAS/LP4lqmiWpXOtZh2PyvtD0zrQDJc/5w
         w4R4BdCx/+e5Fv2NYFjhS3YGmAiIMzJeA9qWWYsjjwYhSash51HPYY1U5scz9/fLex5y
         dZup73deDn8hdTRH+NRrWFgGLe9ug/zvwjIKt2REpJiy4SokQT07TWAjEzhlncG16SlI
         gbHWH1udf1rkpGsmKZqF6/zeJzUSu/7jhqMqWg7h3KFgorouPoauwF21uTQpEbP4Q24K
         bG8flWukg5Rfd2Bej4Oh1FstYFpx1xzxHXc010QuevKN9xKQPVHNBB/BsBDprb09s7LO
         qj9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=kiX+Ip/vIfBF5LMVV3gX2/ykom+NiouiQgOiA4Wzr+g=;
        b=GX6i5LGUxsGyUjGIIYmgtWBpvxcJ50hFZzJUeCSa5TRhksH/s43mocXMdk4oopfbPN
         03h0uhGDvCrLquq2J8AqZ2IvXL0pQ4/NQksJcqWkiNk7J9QzRIhMA6LAGSWKSDiwjYhA
         du+/QkKc7prJ2YsRRibQFkRNATdPN2GzGN+Yj4s6NEVWgwXLkK3WH4NQGQ+px9a708wd
         mbshQj6efjWmLqwW0vx3KIArQBRKUwMhGoot5/0Zw7rjFSzSQ0vPUAsbAOA9S7M2d1mQ
         pGsbeO/eL95VnkPsTPlLSrqH6HuM0MVcuUDPQZoDqinruVLb9El1mwakXvH9P4mCgb5w
         K04A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=kiX+Ip/vIfBF5LMVV3gX2/ykom+NiouiQgOiA4Wzr+g=;
        b=KJ1olFRyvsb7f1Zuie+7tdwmP3EKFfLVwQLyAqpDQWoez1os6sVW5eliChRQmt0rb6
         TYSSgLH9VPfdgsmss82FR8owYyPeZM2vPM/ZdB3ZNMAS3ptR5rVIQRMzWxh7yqXZu3Ug
         qIjPT3I5mjkNP0KL5Rpop8Zsv/7jvoUEnk4phP8sBa/FiMb3/v5btxSDtQBtxDUouiz5
         YmyaVOi6KbD+1/ytLjxdLXDxZcFzuWJrQVAthHhp4HHTRN5EJHACSQJnCUWuc8qXfoHo
         Rdq1sxsaylLcLseWsYKSAQ7ubVyI9HepUB4pykYivmozBmNyqnPEe1sudN8oVWDWAAZO
         00Ig==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533wxn9XA1nw8XdqFtENnagD3izNJX/sNjiKnT2zw8D38B8QqJqG
	OB6buu+E4Ppr5V93ZKxUnlM=
X-Google-Smtp-Source: ABdhPJwNAbKJHaPdelqQvtKa7eWXxJ5J03PgM0mrm5iwpGWHk76QCvYvdVNZsDM3BXFS+CcDMIf53g==
X-Received: by 2002:a05:6512:214c:: with SMTP id s12mr6054090lfr.578.1601904312551;
        Mon, 05 Oct 2020 06:25:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls49712lff.0.gmail; Mon, 05 Oct
 2020 06:25:11 -0700 (PDT)
X-Received: by 2002:ac2:4c88:: with SMTP id d8mr6131660lfl.445.1601904311232;
        Mon, 05 Oct 2020 06:25:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601904311; cv=none;
        d=google.com; s=arc-20160816;
        b=kWyNAtvZjvr6vZtJ9moBonPb4dzEF7zpWX0dKJXnjx82EdElP78pgpNmqE9WJ69GAs
         JqU9BfiwRAXDghQf7T5vBr+GW7krBY0mTun5fqrTHqQktxTqYhSI4v1xbqH/swdllzEU
         sXSMuBj9qBC4E/3/ql+TvvDMUIekxnJLu9lYofdZSvEV2dDKBz6LXya9hEpS+7WhFhcm
         2XEA+ffA1kxELU05SMXcbhvhFgowp84ppyFF6Tl/iuVZ2voil46eEZviDXwsH4+4nEO5
         hyUu+22KDDCtgrOtI4bHTdvYIegCPlNUixbP5e4AFsLKPuMWPkPFYivKPNQOIip0Z/r0
         86yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=A0Mqg2wSh4pTUSfy6372odrZZMXKgzK7vBU2lnhMnqM=;
        b=crt59VDc/PPGowbNn7QaUGqG+QJqhKyxn0SmfPMUjVbTUMP9FpTU9yTARyyvFZti/9
         l9GUEc2MDJfFq7/cZ5FGtgbVN7un8YqcpLy3YfYWHE8d32jWBK97lWbSSe9U8Y+wjGce
         gyRODvw/x6zSbt2aCWcrrEBZYtvZNrUl0r7SErS0NT9E0VM5pqO36KBCiPV0lkIR4Ymp
         1jhQJEdfnrK3QTL/cW6zp50FeUEbuvCoBR8AjUJDsuT1n086arrK/+btCQHUOVzf6VG+
         zCVkrB1Yw7PeGkPIn5RLuuf8c+UZGwP0gWDKUK9Lv5dxV9UPtnKVTnN7orQOROWdandx
         nuiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j75si316974lfj.5.2020.10.05.06.25.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Oct 2020 06:25:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 095DP80P000962
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 Oct 2020 15:25:08 +0200
Received: from [167.87.39.163] ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 095DP7tf005341;
	Mon, 5 Oct 2020 15:25:07 +0200
Subject: Re: [PATCH 03/45] arm64: Simplify get_cpu_parange, add 52-bit case
To: Chase Conklin <Chase.Conklin@arm.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
 <7434305f16589d47d0248ba127edd82bf234d9e0.1601838005.git.jan.kiszka@siemens.com>
 <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3a2f9cd9-3cb6-611e-4cb2-642f8280ee86@siemens.com>
Date: Mon, 5 Oct 2020 15:25:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <AF18C444-D146-4E7F-9D8B-F1DCBD161882@arm.com>
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

On 05.10.20 15:13, Chase Conklin wrote:
> On 04.10.20 2:00, Jan Kiszka wrote:
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> Array lookup is simpler, given this input-output mapping. Cover the
>> 52-bit case as well at this chance. This also obsoletes a couple of
>> PARANGE constants.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>> hypervisor/arch/arm64/include/asm/paging.h |  5 -----
>> hypervisor/arch/arm64/paging.c             | 19 +++----------------
>> 2 files changed, 3 insertions(+), 21 deletions(-)
>>
>> diff --git a/hypervisor/arch/arm64/include/asm/paging.h b/hypervisor/arch/arm64/include/asm/paging.h
>> index 67664efa..932dbb50 100644
>> --- a/hypervisor/arch/arm64/include/asm/paging.h
>> +++ b/hypervisor/arch/arm64/include/asm/paging.h
>> @@ -101,11 +101,6 @@
>> #define SL0_L02
>> #define SL0_L11
>> #define SL0_L20
>> -#define PARANGE_32B0x0
>> -#define PARANGE_36B0x1
>> -#define PARANGE_40B0x2
>> -#define PARANGE_42B0x3
>> -#define PARANGE_44B0x4
>> #define PARANGE_48B0x5
>> #define TCR_RGN_NON_CACHEABLE0x0
>> #define TCR_RGN_WB_WA0x1
>> diff --git a/hypervisor/arch/arm64/paging.c b/hypervisor/arch/arm64/paging.c
>> index db8314a6..cccce410 100644
>> --- a/hypervisor/arch/arm64/paging.c
>> +++ b/hypervisor/arch/arm64/paging.c
>> @@ -26,6 +26,7 @@ unsigned int cpu_parange_encoded;
>>   */
>> unsigned int get_cpu_parange(void)
>> {
>> +static const unsigned int pa_bits[] = { 32, 36, 40, 42, 44, 48, 52 };
> 
> Hi Jan,
> 
> I think it's safest and easiest to treat the 52-bit case as if it were
> 48-bit.
> 
> The 52-bit case is a bit trickier than the others in that it requires a
> 64KB translation granule. With a 4KB translation granule, the maximum
> number of PA bits is 48; programming for 52-bit is treated as if it were
> 48-bit, so having this indicate that output addresses are 52-bit is a
> bit misleading.
> 
> The real problem is that we set T0SZ such that the input address size is
> the same as the output address size. When not using a 64KB translation
> granule, programming a 52-bit input address size will result in
> translation faults.

Ah, good to know. Will fix this. Also requires to cap
cpu_parange_encoded accordingly.

Thanks,
Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3a2f9cd9-3cb6-611e-4cb2-642f8280ee86%40siemens.com.
