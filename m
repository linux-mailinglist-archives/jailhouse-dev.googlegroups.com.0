Return-Path: <jailhouse-dev+bncBDJMJPGY2MGRBCXL6TYQKGQEUGYHCUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id B3C1E15552E
	for <lists+jailhouse-dev@lfdr.de>; Fri,  7 Feb 2020 11:01:47 +0100 (CET)
Received: by mail-lj1-x238.google.com with SMTP id l14sf606264ljb.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 07 Feb 2020 02:01:47 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581069707; cv=pass;
        d=google.com; s=arc-20160816;
        b=Daq7G79N4iCYnOHrtkOKOVYDDVXZMlZ4IhxTGDAgw/knbJshArM9c2zfTHwTquq6Ff
         ocPviiAOLeqtxaU0xtVWbIzF4bugqCG1CNxLl3i530LNC/AqKlGxIDBja1Wu/pSgKfOm
         TkARcUt8NXvJeATTGerAnbyeJITmUl3MoCm89acNXAuIxd4PxPr8zaSBU/xcZjm4QOow
         Hp0Hh8gmqSp12VKd2wWDrcyA7WcxJEeht+qybQcYc9BBwgZraAc5jUKZvPuX2WZ6FARz
         HLFW/N/q9mtCnGENpzgwnu+wJ9g/8fXfze0EKbz7NbFqWDX9qMCyj17dSyJa+nqKZkas
         uuXQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:sender:dkim-signature;
        bh=CaqLBWio5iHYNIWmTgVKYO6kMbLIIgmyPvTMXSWi48M=;
        b=H9k5JQDJMKL0fF3ApNe7uGT2JIyPeWVK15Z9o7Abq8phViN+gwXywc/M+w67ZNdVhF
         klZcHWuuxhEYT7Vm64U7VUNTQPNQiDBnbBbkV27YlJz7QfUvc60g5mY12jIb5nSr0ZjH
         Bt4dCyfUWzOz/lgGeFkOeRpPWFydlxfvV5H19WScdGkZKwEo//vJN3CNJlHioNLnLVr4
         eZVpVztEGBr8JUkqnUyzpVT7tcYYVIY32Kv0bvBkbc8z9bkBenQhJaLWOlJMXk8aiG7x
         b8ntT38pyJXXhtLHYN2pmLADETSQKRAGLiZ1bdZv3Lw3ZJ/NLxYwrHqYAgjRKhuGgpS/
         8INg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CaqLBWio5iHYNIWmTgVKYO6kMbLIIgmyPvTMXSWi48M=;
        b=jPm2vVI4g5LXmIoviXkHwPKo6UjT9hof7dxAZb1LV1/417dqfmy0FLuFCL27CeJ5bl
         hcxWnWmgW6Esu9vyi4buzEEYVDnitHq3lm6fEP4mTGHjgKnJQ7AYYjFCwK1V5B7UrijU
         rQQRqjNGXgBXAolPTQ5SSvlxzGzIS+VzMWj8yosjE/ZkyCwgDmvSoMKS9RsYOcvBG7Ze
         kJD7F2KvmnAyrshiBvtdvVQIOOzuaPn1Jhgoxb5znDumUtYhqLZeGLZ94XTiWskwlJRZ
         cU7yrUxH+YSZ5rNktThV7zgTtF5nQJV63NcqWBKP6bvZ9h3Ba8TwPQu+n8z+ybOOxQLg
         H7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:cc:subject:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CaqLBWio5iHYNIWmTgVKYO6kMbLIIgmyPvTMXSWi48M=;
        b=TNN/0ROacT9uOLi076tUcyP+3BHwz4Pdm1wKTZOOlUVY/h8vhCdFvzUnHf3TsAhCC3
         6DgaiMx8Pp6exRQjSEoPRKqmv7Ys1WuEN4h+2YbAscsKzLhcuwFbYsH39Zb9qpCRMpux
         NnQoJvcd7nl0Nluuvg/cCT0mIzLfY6ecA7QrjLNNDIR26cT/FYJjynO0RWLechBEdII5
         NTzzeNogFunib60S/WmZmnVjukV4rIZKunKdHRgfr5ia9BzXN1o6xHHZOxixzeurqSEK
         QRJkJpO1KbAMWmVJYikG4Wg4d5Sbr2PVzWEJF/scJQJwGURjrOCWjvGML+VnQ6OXFHXC
         uOBA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXl/aXRCAC5seNbNYQsqrdOmmhuCrCbRNin2Rv/mB6zPm8+pTGl
	B+BSWQJ8O/c0yhZw79JbcXw=
X-Google-Smtp-Source: APXvYqzdYSGJnv0iuTlo9AtISDEP4RMSgUVTjBZ8Ly1lVVG/y/4NmFzVPVQsNvwnoRhQKTh+9Xj0VA==
X-Received: by 2002:ac2:4849:: with SMTP id 9mr4091219lfy.11.1581069707141;
        Fri, 07 Feb 2020 02:01:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:2247:: with SMTP id i68ls1388501lfi.5.gmail; Fri, 07 Feb
 2020 02:01:46 -0800 (PST)
X-Received: by 2002:ac2:4add:: with SMTP id m29mr4112585lfp.190.1581069706230;
        Fri, 07 Feb 2020 02:01:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581069706; cv=none;
        d=google.com; s=arc-20160816;
        b=MbY643f+oKnZFad0ieJll8XHqLyYjGzJerDQOW70f99AbDhfnJS0hZ47CVS8fnDHQh
         xg+i9PwRSewEWX5o/VXTbBLzEqD4GKwxVw4IieP0eLBIA9XwH3aKeBwmwnQAkGNam51z
         wB72sZE2fQSHh+fA1sokuLXMZjLiXYqXNNRWbO7fNaqFpzRGjZy2nbTDS6Co0nDj8eHo
         HsXZ0Y82jKnX0YCCUxAJj4nkCKzZY4h3JR054lMTL4nGq2W9VxO5s5l05aDXq5dpgA81
         xSCs6SFqPA45ghhVOlOQ2/cOmBGdBeraC3ffhwUhJC+KvNYP/2X+8+SwcPkIgwRy9WTb
         99Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=ZgCLZS1Zc7hS2QqE2qDmGBkiS/nh9DVdPADpMMvRfek=;
        b=yrPmPIyAJkJQAsjdzKbegCHCfz+Gdewmngvpv8RRL0mI/Ahzq/bY+/pm46aACrbzof
         wNXKSAtuPriKLXhPQk0AUC6Wko75pjRia6P3eJMZ7wZKdMe9XpSdEFlXz9KiZ/dq0qwR
         ipdAMSYGjXAj4UsUMrKp3A5/41xLZPUCQMKNSQHfzOMi0zDrCDFAi2h6ireDhBAE5e4C
         UfkhrPUgtV/80yYA/30QanW/dIN2hglNrrjEt5J2FlcGbcGHWoSiEInYmMo7sT+zyLca
         ECXVJmOtpNeThhlpBSO+gQ03UI5bA9L+Qq5lxeAhng8JiEREImaXnKIFV4n1CN5jgQm7
         eYHQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=henning.schild@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h8si107138ljj.3.2020.02.07.02.01.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 07 Feb 2020 02:01:46 -0800 (PST)
Received-SPF: pass (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 017A1isi029881
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Feb 2020 11:01:45 +0100
Received: from md1za8fc.ad001.siemens.net ([167.87.32.203])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 017A1iRT011018;
	Fri, 7 Feb 2020 11:01:44 +0100
Date: Fri, 7 Feb 2020 11:01:43 +0100
From: Henning Schild <henning.schild@siemens.com>
To: Michael Hinton <michael.g.hinton@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Subject: Re: Difference in execution duration between root cell and inmate
 for same code
Message-ID: <20200207110143.3f84a121@md1za8fc.ad001.siemens.net>
In-Reply-To: <96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
References: <4d8ab27d-7a1a-4601-8d61-429dd0cdd018@googlegroups.com>
	<20200120144629.201f3081@md1za8fc.ad001.siemens.net>
	<b258dc63-26a9-4eff-852a-23d72d2e3258@googlegroups.com>
	<20200123131505.1e5fdeb5@md1za8fc.ad001.siemens.net>
	<5ba8f35f-912a-4749-bf8b-781193f45ebc@googlegroups.com>
	<20200127081602.08ea3fd6@md1za8fc.ad001.siemens.net>
	<96056326-0700-4779-b1b8-3b0df7134a73@googlegroups.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: henning.schild@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of henning.schild@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=henning.schild@siemens.com;       dmarc=pass
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

Am Thu, 6 Feb 2020 11:00:29 -0800
schrieb Michael Hinton <michael.g.hinton@gmail.com>:

> Hi Henning,
> 
> On Monday, January 27, 2020 at 12:16:08 AM UTC-7, Henning Schild
> wrote:
> >
> > Ok, so we are just looking for differences between the inmate and
> > the linux as non-root cell, because the jailhouse/virtualization
> > overhead is acceptable or known. 
> >  
> I'm sorry, I was confused. That is actually not correct. I am looking
> for the difference between the inmate running my simple workload vs.
> running that same workload in the *root cell* rather than in a
> non-root Linux cell. What I am doing is activating the root cell,

In that case the baseline would really have been try a non-root Linux
first and forget all the pagetable/huge-page etc. micro-optimizations ;)

But from what i read, you have your solution and going shmem with it
should work as well. Let us see ;)

Henning

> then simply running the workload in Linux with a wrapper program
> (sha3-512.c
> <https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/mgh/workloads/src/sha3-512.c>).
> Then, I activate my inmate and run the same workload, but this time
> within the inmate in a real-time wrapper application (mgh-demo.c
> <https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c>).
> Both wrapper applications now use the exact same object file,
> compiled once under the Jailhouse build system. But the results are
> still the same.
> 
> However, the input used by the program in the inmate is in a special 
> 'add-on' memory region I had to create and map manually with
> map_range().
> 
> Here is the additional memory region in my config that I named the
> 'heap' (I need it big enough to hold a 20 MiB+ data input):
> 
> /* MGH: RAM - Heap */
> {
> /* MGH: We have 36 MB of memory allocated to the inmate
> * in the root config, but are only using 1 MB for the
> * inmate's stack and program. So create an additional
> * "heap" area with the other 35 MB to allow the program
> * more memory to work with. */
> .phys_start = 0x3a700000,
> .virt_start = 0x00200000,
> // 35 MB (3a7 + 23 = 3ca)
> .size = 0x02300000,
> .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
> },
> 
> https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/configs/x86/bazooka-inmate.c#L90-L103
> 
> I am able to map that large 35 MiB memory region into my inmate, and
> it works ok:
> 
> #define MGH_HEAP_BASE 0x00200000
> #define MGH_HEAP_SIZE (35 * MB)
> ...
> /*
>  * MGH: By default, x86 inmates only map the first 2 MB of virtual
> memory, even
>  * when more memory is configured. So map configured memory pages
> behind the
>  * virtual memory address MGH_HEAP_BASE. Without this, there is
> nothing behind
>  * the virtual memory address and you'll get a page fault.
>  */
> static void expand_memory(void)
> {
> map_range((char *)MGH_HEAP_BASE, MGH_HEAP_SIZE, MAP_UNCACHED);
> 
> /* Set heap_pos to point to MGH_HEAP_BASE, instead of right after the
> * inmate's stack, so alloc() can allocate more than 1 MB. */
> heap_pos = MGH_HEAP_BASE;
> }
> 
> https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L113-L114
> https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/inmates/demos/x86/mgh-demo.c#L930-L943
> .
> 
> I have tried using both my 'heap' memory region (with 
> programmatically-generated input) as well as using input passed into
> the IVSHMEM shared memory region 
> <https://github.com/hintron/jailhouse/blob/05824b901ce714c7a61770774b862ef24caf641e/configs/x86/bazooka-inmate.c#L79-L89>, 
> with the same results.
> 
> Maybe there is something wrong with the memory paging that is making
> things a lot slower than expected, like you implied. Maybe regular
> Linux has a faster way of setting up paging/memory.
> 
> In your last response, you said this:
> 
> "For the inmate itself the pagetable is constructed by the mapping
> library. The code looks like it tries to do huge pages, make sure the
> call map_range just once with your full memory range. Aligned and
> maybe more than you actually need. Consider putting a few printfs
> into the mapping code to see which path (page-size) it goes."
> 
> Could you explain the following suggestion a bit more?: "make sure
> the call map_range just once with your full memory range." It looks
> like mgh-demo.c calls map_range twice: once in map_shmem_and_bars()
> (from your original IVSHMEM demo code, which I based this off of),
> and then in expand_memory() as shown above. Are you saying I should
> combine those into one single call?
> 
> Also, can you explain this: "Aligned and maybe more than you actually
> need. Consider putting a few printfs into the mapping code to see
> which path (page-size) it goes." I'm not sure what I should be
> looking for inside map_range(). What do you mean by "which path
> (page-size) it goes," exactly? What's the code path?
> 
> Sorry for the bother. I really need to understand why this is
> happening, because this discrepancy completely overshadows my other
> slightly-positive timing results in my research. Any help is greatly
> appreciated.
> 
> Thanks,
> Michael  
> 

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200207110143.3f84a121%40md1za8fc.ad001.siemens.net.
