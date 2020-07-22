Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ474H4AKGQE3HR74GY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC21229A42
	for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 16:40:04 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id y21sf778079lfg.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 22 Jul 2020 07:40:04 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595428803; cv=pass;
        d=google.com; s=arc-20160816;
        b=chN4DyJ5cibHJxDsWOq2kney2Z6mOl2SvJ1R/a1H+FQ6bKY62/FhhEeiDVQDrFBeV9
         ZgU8nw4Zp6L1+S3sVrIzA9lDeNKDK0GqAe0rFAgbyG7+ga1RazB/YT88AKLZ0qGe+54d
         0DzSuXtb3d1tDIs90jYbmgZXmlkcz30wpG8qx+5ZnKtidF1tuMbRrYW2ZlHz1Ax3dLtc
         tYwSvwNdnwWL24AzUnyU5aKdHdw65iSoyxCd6p4l3mo5CSln0S2brEYleFFOHtunv8jn
         Z/UE/D0ptvvabfNHDgvUDxUlym00TE4f1SQf8rGR1HMDqDbS7VwuB+3lRZ/WQDVFjahD
         977A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=dVwEYh26nWShWuKyFxitF09IG805dOJ/H4cBr9bI64g=;
        b=BbBoo0in1e0puyFTm4UDYJZuIvri0O5esoZYb3bCmlD4Ex4rEwRQfSdW2atTVH0ka6
         VPkfe5IAqWDTqc1Is4AkFd2aPozGK1XBOWX4aiU9QT3cdbqjn09U+BMBogWijCK5fTUb
         OkgEiN95B0VpSybwWMcH0yyIWZBG4YA4gIo/RoUY/d7nNgA82A+IBnkpAONF3DVvGcH5
         GDtyhIXJ+VU4W1al7Gm6X4KLkug2KdlMVoRdTYkh4Vl4MOL5JKjPiT7o7mZsmkjgZSy7
         WhURsHSzLFW0m8fuluX2BpIys3vI3ckjVKLDZebjs6n3CGTsh00JkamW/1v+oUrxEv3z
         qWVw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dVwEYh26nWShWuKyFxitF09IG805dOJ/H4cBr9bI64g=;
        b=O6/IfY3XP0yAWQ8GUk3qcgubcFCkMt7bBtL2S8AKZ4K/9Vf/lYtdBOGfJmcSpqDE7l
         44tvNmDEhRAMUAiU+/VknHfxgIypfJ9hln+IY/5GYzuv7p6cSCCE1EomheSHLv8YHLEZ
         s8r1XNlwquWvfWqVBs8fxxMm2oQTOhuA7AkY0RZQQ49O8DQr+UxDe9bB50uqVOMPI3H2
         eJAHtImqOsRUigBsvTJVrD+XLtE/SG1oQc3sIPp9yYvmqYHgT7rPYWJEn2t13jr5QtaJ
         thj9lv68wAgSrNeaoJynBFLN6Zlq2U3ZBbqKRrpJRAIbR2FE2DOzSQQXaBMUrB42VWjd
         wdcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dVwEYh26nWShWuKyFxitF09IG805dOJ/H4cBr9bI64g=;
        b=NdNMWHUXtHKR6Jfw8ZpAbCRLqv9px5xGePtt2/fFLZJSD0i5iQsE81aZgmuhcSE9FS
         ZAfbswIb0Ejph6O9eI9FOvzzZLf/6bQdKxpOEzmgfwW9PuE3txw00BnlPGXNr2Rph+17
         2Q7tJtn/9MMofQJUe7qCd6TUJKEV+f0lTfnc/RBd5XcI95Vskw4N5HVXQbwyIJwTEVpF
         28cLHhDlYL7eslVYXKZS9mY5Ofg9iSQLzs6awzpW7HujxXCVF1esyS8ttIUnHNr0DHZy
         3hBNydu5Woogu8tlA0r/0ovrAdNlUrhOf76lHkFzkCuOf+Yk0NibCnaEp/udp0GjgAI+
         9X4Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531HpYh6vRpqxB6ouNRIi/9E2ex9NBlnMZM11U/7S5U9zw/U6xu6
	KdF55awMR8R20GZ4pNFhABA=
X-Google-Smtp-Source: ABdhPJyr5gOQxTfr5WNuKoeC9gTRUsjnPZ6+4bRWxWHrAjeOlSLJILw6egeVBZlJI8qv+RC/W83bVw==
X-Received: by 2002:a2e:9641:: with SMTP id z1mr15469289ljh.173.1595428803433;
        Wed, 22 Jul 2020 07:40:03 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:60e:: with SMTP id 14ls825027lfg.0.gmail; Wed, 22 Jul
 2020 07:40:02 -0700 (PDT)
X-Received: by 2002:a05:6512:358c:: with SMTP id m12mr2377931lfr.18.1595428802518;
        Wed, 22 Jul 2020 07:40:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595428802; cv=none;
        d=google.com; s=arc-20160816;
        b=QlTsMpYeneu0xnacL80WeJ3krWt7Lr806ZrKn/DJHoBlAX8cWSYmOKowRoIjmh9yLR
         VqJtfrxmc5kk9sdL4OD+09PW34B28bnIz8SwaXhN8wTzJCIIjs9Bc8UVRzrIR6EFeYlz
         5hrcFJqKPAflBmAdrKx6YJbFDdOvqDLmLqgrC4O1twc9EDplwxGnqoZwlWTBR0ASPAT1
         8PeBQJt6cuWnoGhXsg/iLOlKrwxBF9xd2t4apEPBAjvc5W5zGPIUjf5SJaBgto+qDBYb
         RD7U0ofX+zJ/WTYcgmV2iETd9mLbjbsbpcu2fYeonmy9wK0t81DG6WQ5rgU/oFzhWma3
         41uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=2Tk9+kumWWuJYvM3t0XGzVhDJ5xWPDgX0dkTG6h0gbQ=;
        b=kMAGqboOE1XwlEH1lNHL2cVYUH1hpS4b2EaNF+qKPVRe7fviE65YpipurKZrDb4619
         8nfREhsuv80CiK7NfNne86DOAjqHG6+gFupAK2XLNjunswRFosbItERhrADKDShFsOxk
         aZkR+qk+7Cm9lDYtDUzCGk5uqsU7UW7WnKCdf/dFKNz5n6g3vbbshExPRXe1FzMG4u6H
         HD2a660OikohzaCsqU9rp+UYNFsDuIJTbd+yHa7OSimY/8Pn0/DVt1UPuQ6qv/Hws07H
         zrnYE52awMqaW6YyGdSLs3FiM5TN99vU3Me1ARcwUKEIfnc0lsApa00ZfLQ23Zk345Ic
         Y3ug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id q26si1116ljg.1.2020.07.22.07.40.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 07:40:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06MEe1ie009460
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Jul 2020 16:40:01 +0200
Received: from [139.22.112.247] ([139.22.112.247])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06MEdx8K016738;
	Wed, 22 Jul 2020 16:40:00 +0200
Subject: Re: [PATCH v2 0/9] Add cache coloring API and arm64 support
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, c.scordino@huawei.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
 <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
 <20200526132429.bmhnaiug7ssblxty@carbon.xt3.it>
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
 <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
 <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <5a66e10a-6215-9c1e-241b-7cab268731c1@siemens.com>
Date: Wed, 22 Jul 2020 16:39:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722142016.zokufzzm63ly2oo5@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 22.07.20 16:20, Marco Solieri wrote:
> On Mon, Jul 20, 2020 at 11:29:21PM +0200, Jan Kiszka wrote:
>> Regarding dynamic coloring, I can only repeat what I stated before,
>> multiple times: I'm extremely pessimistic that you can turn on or
>> reconfigure an IOMMU while you may have transactions in flight that are
>> affected by that change. How to collect the pieces when you do not know
>> if a transaction finished and which address it hit, the one before or
>> after the change? That is exactly the scenario when trying to move a
>> root cell from uncolored to colored memory. IOW: You may implement this
>> but you cannot make it robust.
>>
>> A more promising path is pre-linux Jailhouse boot, maybe even without
>> root cells after that at all (needed anyway for shrinking the runtime
>> code further).
> 
> This time, let me try to dig a little further on this point.
> 
>  From a purely technical standpoint, having coloring implemented in the
> pre-Linux root-cell loader is of course a more proper way to implement
> the feature, by far.
> 
> On the other hand, I see two major drawbacks: one on the
> software engineering level, and one in the product management one.
> 
> - AFAIK, pre-Linux Jailhouse boot is not only highly-experimental and
>    immature, but also an inherently optional.  This means that it could
>    be dropped anytime, or that boot support could be missing for any of
>    the supported hw combinations (with ordinary Linux boot).  This would
>    therefore place coloring in a very weak spot, its solidity depending
>    on another optional feature.
> 
> - Maintaining boot support for all the hw combination one needs to have
>    cache coloring support available is costly.  (I bet you know very
>    well, Jan, given that you placed the Jailhouse project on the
>    Linux-boot design cornestone.)  It is hard to imagine board/chip
>    makers widely embracing, contributing and maintaining pre-Linux boot
>    feature for their products.  This means such a cost will fall on the
>    Jailhouse integrators who wants to use coloring.
> 

I don't disagree that we are close to having pre-linux boot ready. 
However, neither do we have a sound concept for post-boot Linux 
coloring. Morever, pre-Linux boot has the potential to further reduce 
the critical runtime code size of Jailhouse, and if that turns out to be 
true, it will become a first-class feature of Jailhouse, you can be sure.

I'm also less skeptical about its hw dependencies, at least for ARM64. 
But we need to gather that experience first.

> 
>> More important to me would be coloring of the runtime paths of the
>> hypervisor.
> 
> I agree.
> 
>> Here the question is if the simplistic approach taken e.g.  by Xen to
>> just assign a single color-set to the hypervisor, shared by all cells,
>> is enough. Or do we rather want per-cell coloring of the hypervisor,
>> using the color of the cell it is serving. The latter is more complex,
>> I know, but definitely more partitioning friendly (read:
>> deterministic). Before deciding which way to take, it would be good to
>> have some numbers.
> 
> I fail to understand the solution you propose.
> 
> - Assume we have two cells.  If we have 2 regions, instead of 3 (the 3rd
>    being for the hypervisor), then each inmate is more prone (not less!)
>    to generate cache contention on the hypervisor code/data, because it's
>    shared.
> 
> - Also, in order to have a region cacheable in multiple colors, this
>    needs to reside in multiple physical regions of memory, each mapped to
>    a different EL2-VA space, that needs somehow to be chosen at runtime,
>    depending on the core where the interrupts dispatch start executing.
> 
> - Finally, even if the solution has benefits and is implementable, one
>    may still need to have the Xen-like solution, in order to enabling
>    hosting some critical, hardware-management-related feature in the
>    hypervisor. That would be mapped in all cells, hence unprotected.
> 
> Does that make sense?  If not, could you elaborate further, please?
> 

Each cell would run an own copy of the hypervisor code in its own color. 
Cell-private data could be colored accordingly, and core-private data 
anyway. Only shared data would have a problem, and we would need to 
think about how to hand that. But that data is very rarely needed during 
runtime. Read-only data like the system config could be duplicated 
again. That would move cache coloring much closer to modern cache 
partitioning.

The problem of coloring the hypervisor separately is that one cell 
creating high vmexit load can cause higher latencies for another cell 
that needs a vmexit in a critical code path. We can avoid that for IRQs 
as we know now, but we can't for moderated MMIO or inter-VM signalling.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5a66e10a-6215-9c1e-241b-7cab268731c1%40siemens.com.
