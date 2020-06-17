Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBNVSU73QKGQEXQJGD2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F3861FC940
	for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jun 2020 10:49:59 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id b14sf158781ljp.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 17 Jun 2020 01:49:59 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1592383799; cv=pass;
        d=google.com; s=arc-20160816;
        b=h6otmDi3V7twzxYSlzwUrXYw2EDf4ucBOCYHYIUl1EOm23vaHallx2ayOCpDe0E/Ic
         2xDy3j8sCmbNOHupSt4gSaVm1ME1WWAvR2s+STur15ObWSjZ79zFNKUsgw4/4ajWepk0
         QK6eSgkNHFHecK/K8VVRAp5qwZa344d7PBMktRhXGhZvAsSdjIK+HrGYyXdKii3Fshg9
         3RD8TzswLcdJtHR0C45EmZZKfnVFPuObnTqFdoCoREdXCLr/VIfXNvFUXC2bFtPn59/L
         GyxTdIp78G7NZwsleasXNRwI0m+5itlWM/DSDoq+tKoz1YsJ4VCD65L7qWIQyiskY5xa
         /SHw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=BygZ/5Ose1ImAZC4Mf1ZLObz5yJC7SbgrxujiULacA8=;
        b=tQuCgOZn9v3Idrskz/SusCJxrj1KEEIcy2bBljunjfTrH55oxze9UD+Q7SVw4SLJsY
         Uy7nqZSStDAb8xw/0o3dPqUxYoJfnzXmxwlyyQl4NdtYgvhON8wpDGn7cqCZI8gUP30t
         SDTvbdj7NA/+YjKaYhJEBliWRO7KMl5fjQIgD0MSxYVyRS4Ka3ijNtIy6pWq3i1s4cDI
         FKU0zaY0S42m37Zf6q7UnaewGAoavS+Xau7w+0WE3ftQyi+XzrX5htMM//qrYPdk5tUq
         E1f2m2UGuFdftWw2jIV9CFyAVv/SOzkBtKvaZDSuy85qPekucb76p+hrGUpYi6OkpjLw
         wxZw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BygZ/5Ose1ImAZC4Mf1ZLObz5yJC7SbgrxujiULacA8=;
        b=IR3JN6Mld9sV7496eg7/HAYULKSDoNLhGU19eQiui3QKMuTrBFk46VTcaJ1WCx8OQz
         fs4GUgyvG7Q0eBsLVIlnwobn8yvMfM8DUFvXsWQ/XZ4Mvt08qx2iE8xlFYpfS2iUmoBf
         OZFojyL8dTQMXZdGyBkmxMkAXZMgsi4kvCOLTPtxZhl8V1ytxiedgYBo0p46QXk7sn3m
         iSg/0xLieBOHDoH53cMRBGhCvwkn0g8n4S3f95jXy4iPi9Nj6roDNDYCzVJy2IaNqjwY
         jGhXbMcv2JAhJ7/Kq8nr4ScNda1aFUI5YKgglDRr+2dR8tdc76aPdegRR/uPJL0RSP4O
         SAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BygZ/5Ose1ImAZC4Mf1ZLObz5yJC7SbgrxujiULacA8=;
        b=GjJXLadcO6YlmkQYp0eMavMq5Vy/bXakZXImgW63oVazbRP/xt6NTseQMq3Qs7nDRJ
         b0sCHDWzWpZgNvHJao78O3B4bb2IMZLVkcaLXe4ciMU8qaryd9lfI3ZO6W7fS1131aoP
         q8Q29eNhnYbW61LedN3jSob27vdCldTA74hQBDHl+hdUHJX33HwPpHzOV1m/Bv9Si8F3
         ddFid3u8/TkL+pwkDhUTuAjE1Z1/skEkgt2KH5dUWt1klI7CSCNyRDJCX80kKFqqXoCg
         lA9PQw4MQw+fC3TB7TvOGSH5HYGhirRP5lmPt/MUy6TocCH7Dz/s75mXhqYDmzsdLcaO
         k3uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531PU9705wlBsE9fp9K/jZGqmd9XKWSLTsIJ11AGzIKn4kwIX/IS
	8o5NQrSLW5qITxnqeHqKF0k=
X-Google-Smtp-Source: ABdhPJxN/phzUo+2M27ymUBc9pOXCYimBHQgppTwJhATfM4FF55wydw09G/8HWspb5E2Cfz6YGV4KA==
X-Received: by 2002:a2e:9eca:: with SMTP id h10mr3611133ljk.273.1592383798946;
        Wed, 17 Jun 2020 01:49:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:be95:: with SMTP id o143ls475761lff.0.gmail; Wed, 17 Jun
 2020 01:49:57 -0700 (PDT)
X-Received: by 2002:a19:c187:: with SMTP id r129mr3972023lff.129.1592383797911;
        Wed, 17 Jun 2020 01:49:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592383797; cv=none;
        d=google.com; s=arc-20160816;
        b=dPgZRIq5by0v6I6QqHzydcLLLSiCRpkA4NT084dlfRpE9+dZQe03xm7yctMsOdzkoq
         ZjR4t7MDR1RaSCm/MzJf42+hjltNFTTKenq7Lwv40D/gptmSFl4i0s93CGzCDfXQas5u
         srJImSGg/9ho/wSlB2NRm1qUy0XASp9Wk0IwWxFvhYS8Bb7JKGN9zELHmQ8BnFJT7jnL
         h2N4gqABX+AqlofsYcDXilnneJj9StoNkVgKveFVXp1qWkStTv/oJUGy1Rl70Bp596xL
         cGcERNrp0UGkyB1nN/e0IuK4djd+SshejEh9AcF1l58FXWJAQpl7tX/vCU5dFQfDtgWt
         DDZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=EOkhImptXXvbB9xK+JDbqiz4HerGvFik0EjN6HTOFXA=;
        b=q1fYGUKvF8KQNQ8tqxqItVulOApI2wEkofr1/tYTVjnGKWIAsDAd7SRgYdOlwZeBRc
         KjJKMQcDAZv5zOXYyzV5SRKILEjWi7TFqxvCmoQiXEL+Gd6XVfbqcNbSL4U46UfOLZkj
         Q3PYsr270sra3Us6xG7DA5gIFjbU+JSERoWbyQAmohnQO8Uan+2F0RRsMGtcOyQQxTEK
         b3kJ26FxQIyJVjVsuA2S52wHquhcQyJNXtd+8lcAgfI/i+S7xMaDAP0MRokrI4OntERo
         Ni0pbUcZJPHCzzL7fY0P2lI/PVUqTnug3SNhfwf272ppkjgI3jPujTZFVig/fb9kMGRb
         7iKw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id j19si588749lfe.2.2020.06.17.01.49.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jun 2020 01:49:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 05H8nuLu008021
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Jun 2020 10:49:56 +0200
Received: from [167.87.243.20] ([167.87.243.20])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05H8ntAl014258;
	Wed, 17 Jun 2020 10:49:56 +0200
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
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <dad08183-081d-6c31-5be6-305c39a9900a@siemens.com>
Date: Wed, 17 Jun 2020 10:49:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200615081139.agyjjsccbwnsux43@carbon.xt3.it>
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

On 15.06.20 10:11, Marco Solieri wrote:
> On Wed, May 27, 2020 at 05:20:05PM +0200, Jan Kiszka wrote:
>> On 26.05.20 15:24, Marco Solieri wrote:
>>> On Mon, May 04, 2020 at 08:54:32PM +0200, Jan Kiszka wrote:
>>>> On 22.04.20 10:51, Jan Kiszka wrote:
>>>>> On 22.04.20 09:22, Marco Solieri wrote:
>>>>>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>>>>>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>>>>>> Predictability of memory access latency is severely menaced by the
>>>>>>>> multi-core architectures where the last level of cache (LLC) is
>>>>>>>> shared, jeopardizing applicability of many Arm platform in real-time
>>>>>>>> critical and mixed-criticality scenarios. Support for cache coloring
>>>>>>>> is introduced, a transparent software technique allowing
>>>>>>>> partitioning the LLC to avoid mutual interference between inmates.
>>>>>>>> [...]
>>>>>>>
>>>>>>> Thanks for updating this! I will refresh my caches on the topic and
>>>>>>> provide feedback soon (I already have some questions and remarks but
>>>>>>> I'd like to double-check them).
>>>>>>
>>>>>> Looking forward to hear from you.
>>>>>>
>>>>
>>>> Done with the deeper review. Overall, the series looks fairly good. I see
>>>> just two bigger open issues:
>>>>
>>>>  - inmate loading interface
>>>>  - more architectural independence
>>>>
>>>> But I think those should be solvable.
>>>
>>> The major point you raise is that the impact on the hypervisor code size
>>> should be minimised -- the inmate loading interface.  We took a while to
>>> consider and weigh the various alternative designs.
>>>
>>> First of all, let us consider the optimal solution in this sense.  That
>>> would be placing the whole colouring logic outside the hypervisor, in
>>> the Linux driver, or in the userspace tools.  No matter how implemented,
>>> this solution would require, sooner or later, to pass to the hypervisor
>>> a list of memory regions, one per each memory segment to be mapped.
>>> Now, such list would grow unacceptably quickly, wasting a lot of memory
>>> to store it.  Take for instance a Linux inmate, and suppose 128 MiB to
>>> be its memory reservation requirement.  Now, assume that each
>>> consecutive fragment is the shortest possible, i.e. page of 4 KiB.  This
>>> means we need 32 Ki elements, each sizing 16 B, which is 512 KiB in
>>> total.
>>>
>>> This brings us to a design conclusion.  The mere colouring logic -- i.e.
>>> the algorithm which conceptually expands the colour selection within a
>>> memory area into the lengthy list of contiguously-mapped segment
>>> (next_col) -- must be placed together with the mapping function
>>> (paging_create).
>>>
>>> We believe we can leave everything else outside the hypervisor without
>>> much effort.  We can move in the driver:
>>> - the cache probe function (get_llc_waysize)
>>> - the initialisation routines (coloring_paging_init and
>>>   coloring_cell_init).
>>>
>>> We believe this is the best compromise.
>>>
>>> In this case, a minor issue is also worth to be discussed.  The cell
>>> load function requires an IPA-contiguous mapping for the memcpy to be
>>> efficient.  This in turn requires such mapping to be performed by the
>>> driver (we don't want to add an hypercall, right? ;-)), thus including a
>>> second copy of the colouring logic (next_col).  It would be nice,
>>> perhaps, to have a 'common' section where to place code shared between
>>> hypervisor and the driver.
>>
>> Thanks for the explanations. My current feeling is that I need to look
>> closer into the implementation so that I can argue here on eye level.
>> Will try to schedule that soon and come back to you!
> 
> Any news about it?  We have time available to follow up for the next
> month or so.

Not yet. Started to look into it but got distracted again. As it is more
complex than I thought, I need to find some hours of continuous work on
that. Should be doable before July, though.

One feedback I can already provide: Any kind of runtime validation of
the colored config like color_root_cell_management has to be moved into
jailhouse-config-check.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dad08183-081d-6c31-5be6-305c39a9900a%40siemens.com.
