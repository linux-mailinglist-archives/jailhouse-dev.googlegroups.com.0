Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYO4UH6QKGQECFXTAJA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53b.google.com (mail-ed1-x53b.google.com [IPv6:2a00:1450:4864:20::53b])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E302AADC8
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Nov 2020 23:17:06 +0100 (CET)
Received: by mail-ed1-x53b.google.com with SMTP id b68sf1929013edf.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Nov 2020 14:17:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604873826; cv=pass;
        d=google.com; s=arc-20160816;
        b=oTtDDC8kLh6q+l70qAjd9Go3vVWLe8QqyLwzAiaOjb7zgncVjXF4DjUQJq51o6dQEg
         Wk1TOVWp8t3ONlONkOHXsXopWNViqFdNJlCDEAtYUhXWIvgGOA68a7FlByc399CgIdn0
         vw0wVvIECqeXWorO04i7bYTy1xvif3nbNv1qGjfjfVyQJoG/4jANG5NviQ7WhiUPJQf7
         UhBIuAg6ZOi4QkWT0XBqYWsQxwbPvwCN9MwCn4AI5N8vUJ4PLNxqk+u2OmqAtxxEi6lC
         s59pivb/5ILX47ZIupu6RzzqvXwWWisOOmenE7jrwdeD9A6BBR0aBZ9jfQzhFlgNiOUq
         NYTw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=oy+qy3RC82jXwYTaTv0f8qzE1Cv8gPmmFxugACjpvjs=;
        b=dXPU426dYBnTMmlQ/xcZfSKWjIL3QRjIjpSs9iCnMw3uEILxQD3hem79skr1ttZNvf
         YtHi5MQm11FYD7R7QU4877UKO0IU8cV7pEXN7XtK8nfoHsbGNukOYvqJo60ML7sCMbIE
         Z4yRe0QJRSp37EaB0Qy2YgfbHiC+FvrQe8mG1Cy1caNrcp4RigiNvTJvhc9qFHu30liV
         NHHA4ICdJ0feZOMDLu28YMJiS/b8sIgXN5vb2HXh629lVhMdLTJAay/GO8auqV6nGNDf
         9eQAlkgSZLDEQsMA1U08yTov20ocRxIHTxncShDd/LJHeD2aNAJYs0uCidYkwqsjdzu6
         +gPQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oy+qy3RC82jXwYTaTv0f8qzE1Cv8gPmmFxugACjpvjs=;
        b=qGqDVxpg5qCoOmO4hey4BzUO8bX+l6ixOnSwJb67BJrMtOBIMkJvL/ebfdwnFmaUKu
         W05UuuSXN9cIBi9EAkwgZfwe9Ojvj4eOLtrS4gCk+i8ohjX/AI88vsnjJIVkv+0Myaka
         I/NGlC6F91RulchODWPOwe96+4m5CFN42aj30IAfePdrro6KCRWQ1HGLpOuWm4djEzOa
         Zvlx5G5jZjOW6p20xPeE+EdKlr871F9JNeTnsXZCO4QVEt6Kw0WXPWD+RdWLIW3Pnzwm
         m30+cRP6+wsHXaihy5P/irjcjOCnFUBRrRAWqCEWcKPOUdZjpFYBTxwNezGP58gmxsMi
         5PsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=oy+qy3RC82jXwYTaTv0f8qzE1Cv8gPmmFxugACjpvjs=;
        b=inQPeBJ1I6H1sh+upGKb8Qv3wZ4a9CqtUMU+MPxdb1O2FWufJAJK5oOhCroJdg/b96
         857ZycZ1/wXx60I8SDLlodgnqZuFEIR4xwfGDibeuZHB9ZgBmB266mvUtPY8oKs7En5Y
         JCTX98wdRiAsAYbGblCke2urK7YE+ZJ6dX7+mx8pe4ibo5/ZdukMTc2mYf7nuOZfK57A
         ucu6VdtI4ZXcjOVChKKw2JQ9XDDrLYrsf4RvA9h8Ig5H2+eurtq07Bt7WoyC5SsLpoPY
         7uzIeIHMk2H2gsMwCBxD2fzcjxVwBrePw3/2YLuIepSkFGsLU6EGOJEEyAgJODK5oft+
         mT/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530S5XmO+oGG+/O5Wv8utDaD3FcEdHggqlROfsPBqrYA9N/7INnT
	ci8A3kK0IMBohSgnad1oiPE=
X-Google-Smtp-Source: ABdhPJz0S6eFcP/0QmnqDA/955jkXoJJZR4rsUPI0566+c2lW3OYx3wo1VCcBf931eU2YicIf6IesA==
X-Received: by 2002:a05:6402:114b:: with SMTP id g11mr3087031edw.228.1604873826190;
        Sun, 08 Nov 2020 14:17:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls6290212edt.3.gmail; Sun, 08 Nov
 2020 14:17:05 -0800 (PST)
X-Received: by 2002:a05:6402:144b:: with SMTP id d11mr12716280edx.195.1604873825033;
        Sun, 08 Nov 2020 14:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604873825; cv=none;
        d=google.com; s=arc-20160816;
        b=URdOIUpxA66QuXfKxjeAHx4pkKD/G8Sd/MHITjt51S1gjKXN1h2axqzYmgV6z2db5X
         ET+FvNc1HgMw7RHlXOEKtt7AfYToukSi5AVX7RnpzHGq1oqcNATXqe689l7ITtJO4/yh
         +EqQhdy2VReUl8rcIrHEQxTZb0c/pWa9qZGe6ix8/Mn9+O3pqpET36O/NqYJW6etyu+Y
         wWdn1fjfZ4mJnttx61BGWWl+KEQsiuz1aWjvMDbm6IFOIlADix0+sVU3POHYhW65HrtN
         RNH3NSjV+IJ/wHBa4NaJLpCG0vx2D9eGh6ugaSeE7/Ir0e4syyZvcu1R7+RB1IMq7J5w
         X3Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=krvCRS8gZxQWM/8zmWhKpqsya5ZGMaV3EJFkbnxbtBI=;
        b=zXileTEOzTtNoKgDKVfCm8H5Pj/pY76tEw4u78ValJ5Wr/DUvsRxPnZDx/bXU3YeQm
         VkOP1dW6l1QIWZPJyNZPYgwUtZC1BzMQNIAVJJhmavDZpcPhSTxvKScwls2VGxke97eK
         HnPEqotIr1kkgi7ER6feyl/RUhon1uDiXqBLk65pWpzcuQAad+oXxyseX+drWPwaL4Tm
         AKhtq/PoRxIApoQ/QYL6QpwLyVkxSRdSy0XjFLuTmx9EejGtHMxruFM9anB5OpgRWIkv
         sf29rzIrTnEX8Kmkb6GzlocfRDSqYkN/NC+BEAtPbu7xIglz2T8lPKXkANFvK8mQlyXq
         auSg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id a11si183189edq.1.2020.11.08.14.17.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 14:17:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0A8MH4r7005250
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 8 Nov 2020 23:17:04 +0100
Received: from [167.87.33.169] ([167.87.33.169])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0A8MH33X012680;
	Sun, 8 Nov 2020 23:17:04 +0100
Subject: Re: [PATCH v3 00/22] Extend hypervisor compile warning set
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201028210933.138379-1-andrea.bastoni@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <46b28184-9435-f456-81ab-c368859774a4@siemens.com>
Date: Sun, 8 Nov 2020 23:17:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201028210933.138379-1-andrea.bastoni@tum.de>
Content-Type: text/plain; charset="UTF-8"
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

On 28.10.20 22:09, Andrea Bastoni wrote:
> Thanks for the previous review.
> 
> In this version, the unused-parameter is suppressed by default as soon
> as Wextra is added. The warnings that can be triggered by Wextra are
> manually listed with Wno-error. Eventually, all Wno-error are removed.
> 
> Thanks,
> Andrea
> 
> Andrea Bastoni (22):
>   hypervisor: Makefile: hook-in Wextra
>   hypervisor: add wordsize dependent size_t type
>   hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
>   hypervisor: mmio: fix Wsign-compare by casting index to u32.
>   hypervisor: printk: Fix Wsign-compare in align()
>   inmates: lib: fix align() in printk similarly to the hypervisor
>   hypervisor: Wsign-compare: force the "right" promotion direction
>   arm-common: paging: fix old style declaration
>     (-Wold-style-declaration)
>   arm-common: provide unsigned int PSCI_INVALID_ADDRESS
>   arm-common: gic*: use uint instead of int when needed (Wsign-compare)
>   arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned
>     long as size
>   arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)
>   arm64: smmu-v3: rename 'i' -> 'n', 'j' -> 's'
>   arm64: ti-pvu: fix Wsign-compare by casting size to u64.
>   arm64: smmu: Wsign-compare: make iterator uint
>   x86: fix simple Wsign-compare warnings
>   x86: apic: Wsign-compare change to uint and update comparison check
>     accordingly
>   x86: cat: fix Wsign-compare
>   x86: vtd: fix Wsign-compare
>   x86: vcpu: force cast to prevent Wsign-compare
>   x86: introduce EXCEPTION_NO_ERROR to avoid int to uint comparison on
>     error frame
>   hypervisor: Makefile: remove Wno-error from CFLAGS
> 
>  hypervisor/Makefile                           |  7 ++--
>  hypervisor/arch/arm-common/gic-v2.c           | 18 ++++-----
>  hypervisor/arch/arm-common/gic-v3.c           | 10 ++---
>  .../arch/arm-common/include/asm/dcaches.h     |  2 +-
>  hypervisor/arch/arm-common/include/asm/psci.h |  2 +-
>  hypervisor/arch/arm-common/lib.c              |  2 +-
>  hypervisor/arch/arm-common/paging.c           |  4 +-
>  hypervisor/arch/arm-common/psci.c             |  4 +-
>  hypervisor/arch/arm/mmu_hyp.c                 |  4 +-
>  hypervisor/arch/arm64/smmu-v3.c               | 39 ++++++++++---------
>  hypervisor/arch/arm64/smmu.c                  | 17 ++++----
>  hypervisor/arch/arm64/ti-pvu.c                |  2 +-
>  hypervisor/arch/x86/apic.c                    |  4 +-
>  hypervisor/arch/x86/cat.c                     |  3 +-
>  hypervisor/arch/x86/control.c                 |  2 +-
>  hypervisor/arch/x86/entry.S                   |  3 +-
>  hypervisor/arch/x86/include/asm/processor.h   |  2 +
>  hypervisor/arch/x86/paging.c                  |  2 +-
>  hypervisor/arch/x86/svm.c                     |  2 +-
>  hypervisor/arch/x86/vcpu.c                    |  2 +-
>  hypervisor/arch/x86/vtd.c                     | 11 +++---
>  hypervisor/control.c                          |  3 +-
>  hypervisor/include/jailhouse/control.h        |  5 ++-
>  hypervisor/include/jailhouse/string.h         |  5 ++-
>  hypervisor/include/jailhouse/types.h          |  6 +++
>  hypervisor/lib.c                              |  5 +--
>  hypervisor/mmio.c                             |  2 +-
>  hypervisor/pci.c                              |  3 +-
>  hypervisor/printk.c                           |  5 ++-
>  hypervisor/setup.c                            |  4 +-
>  inmates/lib/printk.c                          |  5 ++-
>  31 files changed, 102 insertions(+), 83 deletions(-)
> 

Thanks, applied with minor changes as noted.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/46b28184-9435-f456-81ab-c368859774a4%40siemens.com.
