Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB47L4T4AKGQEJREL3KI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53f.google.com (mail-ed1-x53f.google.com [IPv6:2a00:1450:4864:20::53f])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A44B22A933
	for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 09:02:12 +0200 (CEST)
Received: by mail-ed1-x53f.google.com with SMTP id c25sf1471383edr.5
        for <lists+jailhouse-dev@lfdr.de>; Thu, 23 Jul 2020 00:02:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595487732; cv=pass;
        d=google.com; s=arc-20160816;
        b=kLVO7TcAlKjl+ie/gvwGiRjD2N0OR6x9XdswjNlNTkNRdWqGQBt1qNDuvbHyXG0MzH
         rqKuCoSlvpPprKlouBW5eS185R0B1TqeCKdmeMnEE2PIXaqBMEUHfKnoD8iM/1zHyDii
         HhikhMs4U5qzicJW0Dpd7MCla2kqs3RBTeiFE0wyV5/crrmA0NCJRj89qgjwR+H3M91Q
         yPeD7P4dz8lz/GYQQv80I0pDg/MoCfxDvsL7+pKHqo7fjy6gg0zmNiaTAZGIABOXXNQi
         r+rtZsnQdgnFFrxWpw3nAovcrshuErFg5A6lK6ibnw+PkTXpc7dmAFU/KYuKDfDuep8D
         S1aw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=U7InP/6BgGG91aI1XCzld2Yshp/YO6HCA8oFtR3EjC8=;
        b=xEljEuPoEu7nfuOtfwjG+/UokXlMWCobNAAcOa8W7dTN1Vs6Q2s5HJ8/nXeMP4obM/
         E/nc40dOna/czpZxWyYwhmBrq/3AIBrtuc6uHtRNn0ntu4f8HiPWzL2wGowyotcKikUl
         VTBnR/1XSf8/rQLDGxuwcsGQOO21RjrYI60/q0SWQXfDCPHsoGgJ4PdcV/S29v564v7C
         1hk2TlIt3fsOPMw1PpilpbmRA5Wnt/mVS/ZS3ZS5ZHUJDSOPv6/kKo86EviBlvzwD95i
         M+5yDB0lgWiFpycMORjJinBk7GHdz33HFcDWMvCx/1bBy+KKrIlnsDeVOZr4yr1Na3t7
         /Kww==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=U7InP/6BgGG91aI1XCzld2Yshp/YO6HCA8oFtR3EjC8=;
        b=KQ6+qVFn/qX/q9vYOOHV0pJA38TnkO8n5sXBk79y53cayUg/m6WLmZzpOVd1+vG7H/
         lqt22x22j3qtA76P6h4ubBDb21wStupd7ucy8mnx7m+cCRBZRSoGoepYLV1R8kdEpHDC
         wYjoQP4OPArCMKC2klVRaVW4Jn/WM7D0nz52aE1FvVVqFdicp/VitGSyN7YakupUW9Fm
         bdaJZxYQ0E+9upfGkVBVUzGqFXUf94V7gSYfpuprB04lNZyOIeEZff34ftJGHY75kRBm
         RMUK3znySPZMK/lW0l1uvAAC1zf9e10HX3DRwXgv9vsMCi6za5bCQ2R31guEpURDgR7O
         7Xmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=U7InP/6BgGG91aI1XCzld2Yshp/YO6HCA8oFtR3EjC8=;
        b=Hn887QI6eAW5fvnzUF7NWUwyduAm6AuLQr8P4E8HS5jYmMgq9IpEAw2RRvBU8WHY+T
         olPPdgDARjiczF73qQdHDyUqWiZbQiRwlxbYN0i/4LYm/51DO84/WQM8PCfRIO6aaJdh
         4l2s0kuG5CDsD9pMRqxQ+mXB7KuAbp/DVi1bwS3EzdX8nwaFWQPmV3C64ND6wrKvhuwR
         IEmwUrVptecQ82nY065B1ye+vbnid8p7nTFlgs6IhXVP7NzxPdZZO2Ynp2HnnvfHVYDT
         JPhqKTgm1iSa5vGQw1NeclmrNzLeKrvPFBACNhrLrw0cN3cc8H5Yt/gL1r092LXktvWG
         xzng==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nhNQ2F9nS60U+86oyAt1++79ZY8PYvjoBFopZr+KGXtub8LwC
	AjHVLZX07fPYvvYL2D+6i+g=
X-Google-Smtp-Source: ABdhPJxt07DgeNKmjllJ4fb5bEguVlPfjGJklseysld5Yh0kVSdy2DVTNVasiAzoCL5uPj8J37dG7A==
X-Received: by 2002:a17:906:b143:: with SMTP id bt3mr3245626ejb.134.1595487732049;
        Thu, 23 Jul 2020 00:02:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:db04:: with SMTP id t4ls2683782eds.3.gmail; Thu, 23 Jul
 2020 00:02:11 -0700 (PDT)
X-Received: by 2002:a05:6402:b0d:: with SMTP id bm13mr2856270edb.301.1595487731291;
        Thu, 23 Jul 2020 00:02:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595487731; cv=none;
        d=google.com; s=arc-20160816;
        b=YdPg6LtEMJq3ULXSRmJwC4uvjCebvBsMlq0ZxGol9VB6FYW65uzvAsbCPsqDKCgTet
         xaV3YzqZaZIbqHEAgTvWQNL1pAYs6LXUvk8ZLsfdMtKwZAjfrFA8jtgQZsQzTEw9iGmJ
         O5CeEFHKwvv120hyy6WwG+pVKkumJ1ODpYkPkIt0Xf7x996UKSW5GJQgyOJM06blVSwI
         OHkdZnCWH727usReP6wmz0NMAiaJuJm6nJISHZa9QtSY6JM0Gfzr/hkGz7dku0TInMhi
         6jMRMPD9rQRpPKyvpuKcVGhu/n8BwbPZmcBXqHsJlKFCp3SO1F3x8iOYkujg9pdK1Xth
         ycnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=jszZtVFFkVhepAEOcbEK0KKKvX2r7cn3AK/XG4rIFTs=;
        b=G1qZgUpAUGx02rgJTGnPHqvsmAz2DZbzcDry1DkUl61//qpA337xq6PGFk03v/HIDq
         tocKdMhJ1Zjf7AuHFSttumlz5vTd+UAQLTWiUuqoFg7PsMQkhYjvXxup4lwcK8FbauRW
         c0z/YSx70idxDK1coNI/suAnqsLcE/Ds/aOzW3E643CDkKb3uj+GCbxIBqa/sl+9vYDY
         8YPxWlm0WETzLidjj15uOOdXV8Vj02yCNuOMLRVqDRz6bJGV0zb5918YFY6MLNzkenR8
         +5E2O9FEWTodPicO+bCJvsMlIn3+wjL3APRiNbi3/9wMyk123OnNLI296Xez+evE0qbe
         rjRA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id x14si149959edq.2.2020.07.23.00.02.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Jul 2020 00:02:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 06N72ABC031190
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 09:02:10 +0200
Received: from [139.22.112.247] ([139.22.112.247])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06N729ci005475;
	Thu, 23 Jul 2020 09:02:09 +0200
Subject: Re: [virtio-comment] [RFC] ivshmem v2: Shared memory device
 specification
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: "virtio-comment@lists.oasis-open.org"
 <virtio-comment@lists.oasis-open.org>,
        Jailhouse <jailhouse-dev@googlegroups.com>,
        qemu-devel <qemu-devel@nongnu.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
        liang yan <lyan@suse.com>
References: <f109fe5a-92eb-e5a5-bb83-ada42b3a9b61@siemens.com>
 <20200715132748.GA20677@stefanha-x1.localdomain>
 <88a33034-783a-07d2-85e0-c1a1ecd2721f@siemens.com>
 <20200723065423.GE268427@stefanha-x1.localdomain>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <10df6427-eab0-d3b8-4624-ede98ff7ef09@siemens.com>
Date: Thu, 23 Jul 2020 09:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200723065423.GE268427@stefanha-x1.localdomain>
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

On 23.07.20 08:54, Stefan Hajnoczi wrote:
> On Fri, Jul 17, 2020 at 06:15:58PM +0200, Jan Kiszka wrote:
>> On 15.07.20 15:27, Stefan Hajnoczi wrote:
>>> On Mon, May 25, 2020 at 09:58:28AM +0200, Jan Kiszka wrote:
> 
> Thanks for the responses. It would be great to update the spec with
> these clarifications.
> 
>>>> If BAR 2 is not present, the shared memory region is not relocatable
>>>> by the user. In that case, the hypervisor has to implement the Base
>>>> Address register in the vendor-specific capability.
>>>
>>> What does relocatable mean in this context?
>>
>> That the guest can decide (via BAR) where the resource should show up in the
>> physical guest address space. We do not want to support this in setups like
>> for static partitioning hypervisors, and then we use that side-channel
>> read-only configuration.
> 
> I see. I'm not sure what is vendor-specific about non-relocatable shared
> memory. I guess it could be added to the spec too?

That "vendor-specific" comes from the PCI spec which - to my 
understanding - provides us no other means to introduce registers to the 
config space that are outside of the PCI spec. I could introduce a name 
for the ivshmem vendor cap and use that name here - would that be better?

> 
> In any case, since "relocatable" hasn't been fully defined, I suggest
> making the statement more general:
> 
>    If BAR 2 is not present the hypervisor has to implement the Base
>    Address Register in the vendor-specific capability. This can be used
>    for vendor-specific shared memory functionality.
> 

Will integrate this.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/10df6427-eab0-d3b8-4624-ede98ff7ef09%40siemens.com.
