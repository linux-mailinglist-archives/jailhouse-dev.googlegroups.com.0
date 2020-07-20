Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNEZ3D4AKGQECRIN34I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43c.google.com (mail-wr1-x43c.google.com [IPv6:2a00:1450:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DDD22705B
	for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:29:25 +0200 (CEST)
Received: by mail-wr1-x43c.google.com with SMTP id i12sf12411140wrx.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 14:29:25 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595280564; cv=pass;
        d=google.com; s=arc-20160816;
        b=Lp6AXGn++EHLZf5/gmmYi1FuKjTkVNKGuZFpzHeDlA6P+bMdQ1dHSh9RwAaYmpzuVS
         +UJXk1BKKwEq0YeW4jqog+gb4ZlTCxOCq65qlLb2atqGPY2hcVIbTlsl4hS7LgVV/pZW
         INr3rjRJkeQRJaXNUVRzhlwi6ytI8vcsWM5q4Di/iGPLKV3tfsg3wckPLzXiD3Ije2er
         DHwERf24AiT3xdfEqLVrQNVAuB3Yu0tCQFCygJ2g+amtsnOhtdX3NGJ3jeaoiYQvuP/h
         oqKThRXTri3ZodGR5VVMUt15uIrp5Zfw0+z8vq/jwXv2+yogq4J4haUx0HFuvHInN4KP
         33ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=LOJVi1RBj5YQsF3gz1BPjihhtCXkTNYNJeJqOnoFwQI=;
        b=xecI89osrOu0IZiHr7FUEUGiwfd6OrreYedr4Z5Wothe20+r1/SwZg2dLK1OjTLv6T
         RaGLEICHJiHJlAy5q+s5YFj9EKbAbe6EOUDP6Z9AUb+RaMn00P46Wfnw0ygs8HwVC+UN
         2MnsxHQpQw+2D8rzgnO6KWP4N8MjJFbytPdUAhUlmzvpq+MSjGhTaBqU0/xj7US9j+MG
         40V0ZrFOPP3I69JmMwwj9DzNKUE4cxPdoLtaRDakvJtpgy2D0eZxIk07NGyuP6l9ifZo
         giiNOATi+4IDolpqdszeo1YR0xZq+vdKCg09WP7HfImhMFcKDFsTATTIg08jHEv9JepA
         Vamw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=LOJVi1RBj5YQsF3gz1BPjihhtCXkTNYNJeJqOnoFwQI=;
        b=gA78AD5noyBTVoEqo3wqG8YBk8xe+NJ3xfVYA+Ni3FimaZ84K1m5O2G9+nLMMThFul
         xwyviy/e+rWV3YLlapeTJ4FxCKwl5U/4seBHSdya82sMJEJLWANp/E6VXX2EjwjLAavn
         mA8F7bdUG6M957YVe6g6A2srg3lu9vFvpelDyIrNAQ6jFrYGuaenGsc1OZGW5O4ygjUB
         wkoM805RH61zmhhdEtAdvUmUjaTonvydimgux0Cjwa+HQSqYAm5GLgjVxUpV6O3ckAST
         GHgjdbekkA6nk3gUOSxzcMGzY1Kd9eEX3neeBnqq3dgZ9+ErPpXa5CWe7NHJ1FILpgQ6
         biyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=LOJVi1RBj5YQsF3gz1BPjihhtCXkTNYNJeJqOnoFwQI=;
        b=X9WlHb+VYa7ITNZBhFBSxYJ8qIGvZBhdrokIXuyvy2WKc0cpAtMJGoi2bs961eQA6H
         A9092bX1OQIociR/1Xy3kY94UX5LvCGP2gyyBi6B4iFroDlFcL1q7i7cRRSvPRuSnJt/
         JXD0GlssIgNIjmWjIcxfXlvHiOHYVywuFCAE+qQsoSYI4UhkcC1TE9lTDaKvvEe8fz9e
         S22MRQb+hS+3WAEshbHt2fCcQ/ENjuqwzg4CJzdPp+JtybHp46irQCO19b0QM3tl1A3b
         gb7MTgbxfkrSZTfKc8Bzgahh3eT31hrpaZPNOyBAPedeAJHqCnE1JGYImmjkuwgajCft
         vHHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530KxhMLCz9xnNb02kvXyRTfZ8r3CfFVpsRHBWpeXXdzTa5Yk6bA
	JSkS7kWk21grkB4/4p+gYzU=
X-Google-Smtp-Source: ABdhPJzH9e8zfhv+zwpTO60ayMQhlUSF9aLostbAEvALxTsfczDdDJifPihWRWA6uU3gUHNgKSLyLQ==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr7030238wrs.410.1595280564715;
        Mon, 20 Jul 2020 14:29:24 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:a587:: with SMTP id o129ls143317wme.2.canary-gmail; Mon,
 20 Jul 2020 14:29:24 -0700 (PDT)
X-Received: by 2002:a1c:1d46:: with SMTP id d67mr1157135wmd.152.1595280564053;
        Mon, 20 Jul 2020 14:29:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595280564; cv=none;
        d=google.com; s=arc-20160816;
        b=MyldPvWw1/qLpAXJpE8DhFV++toJuAhkECL+aKIZahJ5/8O4UtWILFXcT2d+E/OZPR
         raqkGDBteM2jxKCqw+KzIXhNrLuZuCzvZSWyirIQkYTivOCD6ituXt1kAGZbQZPtrFNs
         tD0Q9+plnMaAM2Z0PPNHLAC/oTsmNbN7soGhtvM/LWyf7eGBKkX8Ratr+IGCaTWLzXIo
         /WSTUY32h1/1PrKP7ueFQ7KeTCzJpPImZWW4HCwI9oEy4EUKFxyDfyk9tZ1R2ZPenPI8
         mJRoo+qxgsp1P+eRvKLsAdtISX18ReAmkhCgxVZEgxNT6Pz/02tbLCOwo/sAX1VrRZJ8
         LxOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=aCH9x2s/WEU/VO+bQtZ/O+VcVXqWg5dEv7UwN7bSFmc=;
        b=UPi3wONcnBy1t26uLAxHTQPfmkBQ9144uxi+EaPBjjq01KuyaZKSxR6AvRaWLZXVan
         AM5GHvfXiaoptVYpXrFo+4k395v8GJhGywTZetLqcmruVRGCBfU2CIwpv0aLtbAEfuWW
         U0lt9HTbP90ZENztUVf4ExKSCdee/8X+xqJxpL+CZ6zwtTOxaS+C/GUgWGXarEAO59MQ
         KeqBn1Y52kbPvzoOswuzt1w69hx1WHdIyHGbzw3yffBA3ff39n5WKdIvdyT5CKLtr28B
         wfzUCFlT5F8NSiu8w8Jfzcm8YJIeYcZJDuRuVCI5IYK3fy0sN1CrTzfF1rQ64ofJxZvZ
         aUtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o85si24339wme.1.2020.07.20.14.29.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 14:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 06KLTMTs000452
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jul 2020 23:29:22 +0200
Received: from [167.87.88.27] ([167.87.88.27])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06KLTLBn027649;
	Mon, 20 Jul 2020 23:29:21 +0200
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
 <7fff9e0f-e13f-b41a-36c9-228e9883fa7b@siemens.com>
 <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
 <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
 <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <615c92ff-593f-ad69-ea87-1ad439d211e2@siemens.com>
Date: Mon, 20 Jul 2020 23:29:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200720162639.jsc4o5a7nzinaxwn@carbon.xt3.it>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 20.07.20 18:26, 'Marco Solieri' via Jailhouse wrote:
> On Wed, Jun 17, 2020 at 10:49:55AM +0200, Jan Kiszka wrote:
>> On 15.06.20 10:11, Marco Solieri wrote:
>>> On Wed, May 27, 2020 at 05:20:05PM +0200, Jan Kiszka wrote:
>>>> On 26.05.20 15:24, Marco Solieri wrote:
>>>>> On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
>>>>>> On 22.04.20 10:51, Jan Kiszka wrote:
>>>>>>> On 22.04.20 09:22, Marco Solieri wrote:
>>>>>>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka 
>>>>>>>> wrote:
>>>>>>>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>>>>>>>> Predictability of memory access latency is severely
>>>>>>>>>> menaced by the multi-core architectures where the
>>>>>>>>>> last level of cache (LLC) is shared, jeopardizing
>>>>>>>>>> applicability of many Arm platform in real-time
>>>>>>>>>> critical and mixed-criticality scenarios. Support
>>>>>>>>>> for cache coloring is introduced, a transparent
>>>>>>>>>> software technique allowing partitioning the LLC to
>>>>>>>>>> avoid mutual interference between inmates. [...]
>>>>>>>>> 
>>>>>>>>> Thanks for updating this! I will refresh my caches on
>>>>>>>>> the topic and provide feedback soon (I already have
>>>>>>>>> some questions and remarks but I'd like to 
>>>>>>>>> double-check them).
>>>>>>>> 
>>>>>>>> Looking forward to hear from you.
>>>>>>>> 
>>>>>> 
>>>>>> Done with the deeper review. Overall, the series looks 
>>>>>> fairly good. I see just two bigger open issues:
>>>>>> 
>>>>>> - inmate loading interface - more architectural 
>>>>>> independence
>>>>>> 
>>>>>> But I think those should be solvable.
>>>>> 
>>>>> The major point you raise is that the impact on the 
>>>>> hypervisor code size should be minimised -- the inmate 
>>>>> loading interface.  We took a while to consider and weigh the
>>>>> various alternative designs.
>>>>> 
>>>>> First of all, let us consider the optimal solution in this 
>>>>> sense.  That would be placing the whole colouring logic 
>>>>> outside the hypervisor, in the Linux driver, or in the 
>>>>> userspace tools.  No matter how implemented, this solution 
>>>>> would require, sooner or later, to pass to the hypervisor a 
>>>>> list of memory regions, one per each memory segment to be 
>>>>> mapped. Now, such list would grow unacceptably quickly, 
>>>>> wasting a lot of memory to store it.  Take for instance a 
>>>>> Linux inmate, and suppose 128 MiB to be its memory 
>>>>> reservation requirement.  Now, assume that each consecutive 
>>>>> fragment is the shortest possible, i.e. page of 4 KiB.  This 
>>>>> means we need 32 Ki elements, each sizing 16 B, which is 512
>>>>> KiB in total.
>>>>> 
>>>>> This brings us to a design conclusion.  The mere colouring 
>>>>> logic -- i.e. the algorithm which conceptually expands the 
>>>>> colour selection within a memory area into the lengthy list 
>>>>> of contiguously-mapped segment (next_col) -- must be placed 
>>>>> together with the mapping function (paging_create).
>>>>> 
>>>>> We believe we can leave everything else outside the 
>>>>> hypervisor without much effort.  We can move in the driver: -
>>>>> the cache probe function (get_llc_waysize) - the 
>>>>> initialisation routines (coloring_paging_init and 
>>>>> coloring_cell_init).
>>>>> 
>>>>> We believe this is the best compromise.
>>>>> 
>>>>> In this case, a minor issue is also worth to be discussed. 
>>>>> The cell load function requires an IPA-contiguous mapping for
>>>>> the memcpy to be efficient.  This in turn requires such 
>>>>> mapping to be performed by the driver (we don't want to add 
>>>>> an hypercall, right? ;-)), thus including a second copy of 
>>>>> the colouring logic (next_col).  It would be nice, perhaps, 
>>>>> to have a 'common' section where to place code shared
>>>>> between hypervisor and the driver.
>>>> 
>>>> Thanks for the explanations. My current feeling is that I need
>>>>  to look closer into the implementation so that I can argue
>>>> here on eye level. Will try to schedule that soon and come back
>>>> to you!
>>> 
>>> Any news about it?  We have time available to follow up for the 
>>> next month or so.
>> 
>> Not yet. Started to look into it but got distracted again. As it is
>> more complex than I thought, I need to find some hours of 
>> continuous work on that. Should be doable before July, though.
> 
> We are designing some extensions to the cache colouring feature, 
> namely the root-cell dynamic coloring and SMMU support.  Willing to 
> implement it in the next months, it would be quite valuable for us to
> have some feedback and agreements about this initial series.
> 

Sorry, I'm juggling tasks, and I had to drop and pick up this one 
multiple times:

I've hacked up striped copying into cell memory into the driver, also
factoring out a tiny helper (header) to calculate the virtual-to-colored 
offset into a region. Should be reusable for mapping as well. However, 
this work is not yet tested. Let me see what I can do tomorrow morning 
so that I can at least share this and you can possibly pick something up.

Regarding dynamic coloring, I can only repeat what I stated before,
multiple times: I'm extremely pessimistic that you can turn on or
reconfigure an IOMMU while you may have transactions in flight that are
affected by that change. How to collect the pieces when you do not know
if a transaction finished and which address it hit, the one before or
after the change? That is exactly the scenario when trying to move a
root cell from uncolored to colored memory. IOW: You may implement this
but you cannot make it robust.

A more promising path is pre-linux Jailhouse boot, maybe even without
root cells after that at all (needed anyway for shrinking the runtime
code further).

More important to me would be coloring of the runtime paths of the
hypervisor. Here the question is if the simplistic approach taken e.g.
by Xen to just assign a single color-set to the hypervisor, shared by
all cells, is enough. Or do we rather want per-cell coloring of the
hypervisor, using the color of the cell it is serving= The latter is
more complex, I know, but definitely more partitioning friendly (read:
deterministic). Before deciding which way to take, it would be good to
have some numbers.

> 
>> One feedback I can already provide: Any kind of runtime validation
>>  of the colored config like color_root_cell_management has to be 
>> moved into jailhouse-config-check.
> 
> Good idea.  We will look into the script soon (hasn't it been
> merged, yet, is it?).
> 

It's in master. And that reminds me that I still need to review some 
related series...

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/615c92ff-593f-ad69-ea87-1ad439d211e2%40siemens.com.
