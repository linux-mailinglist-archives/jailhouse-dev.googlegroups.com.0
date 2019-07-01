Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTWU5DUAKGQEBPMKRJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F8C5C082
	for <lists+jailhouse-dev@lfdr.de>; Mon,  1 Jul 2019 17:44:15 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id e20sf2878492ljk.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 01 Jul 2019 08:44:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561995854; cv=pass;
        d=google.com; s=arc-20160816;
        b=mSVdLuYjpaxacym0O1bSYDmdqfdlnzuhUmXZzOKDvHn63gR34KE1LU9/TAqO9/++v2
         gfXPZSxHB5nhXWyZdHppbEGiFNfCrICkrVkCUlK1ndewleujDAibagtX6VQNXIeumfQx
         XWwImsB5w8bQ73UnpBJ7nAn0Z3c963oypdS/7WxnjbeSgLuMccQuI2HPHOBJ6RWnj3yw
         JK4b9by5F4nbXWY3AEYMWnwm+qOmfEuzQzsxZc//Zb9xrKabxe9KgxMvsxmkOIAcmXjm
         oMJVYT05/sdRo2KfjXOs1Ec8attMIcuOYMjsJvXEKM3/vWpRx7CCOVQkVJL0QbqNVX+I
         PnbQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=D9HVMfnCeqH2uCFIxeZIAi77DafBCfsn/2SzDSe0sJw=;
        b=rZDQZUJ8x08tCfnZhlPGSexXHgJc0XTdlhwNM8bJur2bw8mM5NN9nfV7aVAMjRdqBA
         uEA5b+sFmpRo0Uc8HSGJE51vieFhzlhK2aXZlatGD9DDDBWctGd4FKD2Ytra3lQMHDDd
         20hN10LMdMnlk/ZVcGEX+bkHjSfNOVnRXpBIBZrDoMfvKvrP35LVVfexoGqccumPAzYr
         QzZYfdjROCr7ZS8AuaXnMac8RMhbBRZCGrTyOmU/bt+FZ1z05Fu1EfN8mu79wYS6yVuD
         FRuEXf0LKjzZ1+8DSHmBJ4gzK8DaxyeJx5vV9bhHJjHsjMH8LHieSB9Ih9rgBnmLTNIQ
         Y9Ow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D9HVMfnCeqH2uCFIxeZIAi77DafBCfsn/2SzDSe0sJw=;
        b=BaoVLECPZ0h2zAZLSto3I0wxNoOjbWobVWohvDdDtbLbzjPPqKLA6dR7Csd1v2KMwb
         Apr5y0dhIMltal/VU1cWd237gA4JhlkrdEzzsPCZ6ypTDmyk9Vjm2VzWnEQ7yEI1axUT
         gknaP0Q6Uy/c1UvCge/M1XS/jHvu7mNZLrdZ1zkefMLIoiSY8kVKh+CakJXyI+7h+cFd
         Kc0z/W4M5eVBGOmwOXyzYs1DH/TT8ILVUrpS3PNhQTe/8h8kfAG6LLrKlHWIszrjJ/A/
         JpLISgAi1OgGalCHrYcWxBhyobGlIcr7jsKQLDgD+J2EGERMPlGv8NNKsqaLi8SGAMIx
         KFzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=D9HVMfnCeqH2uCFIxeZIAi77DafBCfsn/2SzDSe0sJw=;
        b=N9OowvznRzaTJ03l1Wg2kCPFwB/ushenodMOfHdcipTgfsiVjySDfhLWy7LA4Ltf2K
         6gQgwoH3P2O2qAo6aFH/CJfcBVmyO2sH9mOTf26445YGDLa+8LOVH3TezsKN7ZvBopka
         EMWE+uP6GDq29GQSzPRjsnXM/GRthusQLnzoJTHMctwtSMihBqAr9k5ljLuNtgkx8tAk
         TRTmRVR8cC2TtxzbYGF6dEhXAmd+0pycvwSbwQWkEDlP7E6rdqlHM/2kZ+05Yl4nrXv8
         CUvcPdID6FatUR5dWxio0DYh9Wq12ekeIXyc3jnY6o6q5avTz+MGE1wqbpdy4g7Hm0EC
         DkCg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUhoA08lyVyuMENIKMoRO4U2GOgqSHcP5WdnhaFtLjh4qs7BzzB
	FBnx+nuefcpYP8IEI6iYPZw=
X-Google-Smtp-Source: APXvYqw0lVd6Rrfv6qSdNk9xUm2jTYeFNOFGQibL0iqO70ABCULm71ENq2SLQCnSvg7xwfq8bdqSHw==
X-Received: by 2002:ac2:5212:: with SMTP id a18mr11927963lfl.50.1561995854811;
        Mon, 01 Jul 2019 08:44:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:157:: with SMTP id c23ls1189312ljd.8.gmail; Mon, 01
 Jul 2019 08:44:14 -0700 (PDT)
X-Received: by 2002:a2e:9e81:: with SMTP id f1mr13261538ljk.29.1561995854122;
        Mon, 01 Jul 2019 08:44:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561995854; cv=none;
        d=google.com; s=arc-20160816;
        b=ki5isXZXLU0HMgT6KcT3aPM5EXfe0FlPasy3Bg4w9b4emm/XdWKpyavwtFLq1bbc0J
         YdQSuYRx8RO+ZPFoQlk7/F3QtkBpeYJbCNiF0U/KHFEaQQ0bOijnQVvocW++lkek5EZ1
         1EVlLom0iweGjYA1RD81k4UzpxDVgQrwV4mI8uljPfh/TcOYeWrmeAxy424kuebi1sYC
         xzfvwXvT0TSfPWqlnHDj5VgbK1GOZsi6liaeMoF67sZQFlceJq0zeLJSzRDaX0TS+H48
         Sn/PXu6/NYYsCu0UH1LqonL2soGk6+xXKM/NlXS9Tdk1zQ82Xvb7izw3bMe5H2UXhl1O
         VNaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=t8ykrOQGhwcmpeKVbxbBH9aooUegS9ZmEf8QCVqUwss=;
        b=zGl5Fe4A8BWCgMCOMIW8JVaoZozVOmUV3VzJyiNyrVHxdov1gu0FOU4PuaPORMbC1P
         7036MMqWpX9QcquUcbz7G40Jcba2JwpT6unJ2fXzGFj5daj8i3yZIJFDf6i1TbChUQtr
         rBeuppWlecsaFvxchlrZ1ype6KrRtiqO6eb6NuKbq+VUp+go62xelRRWS1+Bd0Z3PRTp
         zSVvoEKFlFVl5YTzwLI0VcQqWx0HT9tv79QhIHou6uog4bpx1IxPHGso3b5oKTXuHdqx
         dn2SIIOnplQgK1WaRFxPjvCyt5rySNCbEAfli8FIAvBBf+lZZikUG5hWVuiGlLxA8rJP
         Yqmg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id h1si581404ljm.3.2019.07.01.08.44.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 08:44:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x61FiD0S008099
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 1 Jul 2019 17:44:13 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id x61FiCJO002924;
	Mon, 1 Jul 2019 17:44:12 +0200
Subject: Re: Having trouble setting up a shared PCI device in root cell
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <525b5e1b82474f3eaaecf83b150aa9f7@st.oth-regensburg.de>
 <bb241636-ed0b-6803-4f34-492744389445@oth-regensburg.de>
 <6417df53-38ef-d810-4e2e-9593c84aeaf8@siemens.com>
 <6a5c3bbf-ea93-775a-edaa-1dda25b08d8f@oth-regensburg.de>
 <81c3353e-88f9-5908-ef76-bbc8f28c7613@siemens.com>
 <95e7f303-c5a1-5e52-f012-2df23dcceb19@oth-regensburg.de>
 <065b2f28-c115-41eb-5f3f-8f99fdcbeb91@siemens.com>
 <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9a4b887f-a641-cacf-763b-53dbd1c229a2@siemens.com>
Date: Mon, 1 Jul 2019 17:44:11 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <6ecf8f54-53f3-1c72-b9a6-ce9007982975@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 01.07.19 17:11, Ralf Ramsauer wrote:
> On 7/1/19 4:04 PM, Jan Kiszka wrote:
>> On 01.07.19 15:52, Ralf Ramsauer wrote:
>>>
>>>
>>> On 7/1/19 3:09 PM, Jan Kiszka wrote:
>>>> On 01.07.19 14:59, Ralf Ramsauer wrote:
>>>>> Hi,
>>>>>
>>>>> On 6/27/19 9:06 AM, Jan Kiszka wrote:
>>>>>> On 25.06.19 19:25, Ralf Ramsauer wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> for the completeness sake: it's about ivshmem-net. The PCI device
>>>>>>> shows
>>>>>>> up in the root cell and can be discovered via lspci, but the driver
>>>>>>> fails while probing with
>>>>>>>
>>>>>>> [17061.414176] ivshmem-net 0000:00:01.0: enabling device (0000 ->
>>>>>>> 0002)
>>>>>>> [17061.420598] ivshmem-net 0000:00:01.0: invalid IVPosition -1
>>>>>>
>>>>>> The register read-out failed. Maybe a mismatch between driver and
>>>>>> Jailhouse version: Which revisions are you using on both sides?
>>>>>
>>>>> siemens/4.19-rt vs. jailhouse/next. Should match.
>>>>>
>>>>> The bar_mask was copied over from the qemu demo. Other than that, the
>>>>> only thing that changed is the bdf. We simply chose a free one on our
>>>>> system.
>>>>>
>>>>> The memory region behin ivshmem is high memory above 32-bit. I
>>>>> instrumented and checked the code, but that shouldn't be a problem.
>>>>
>>>> This is rather related to the MMIO register access. Check if reading
>>>> that ID/IVPos register actually triggers a VM exit. I suspect it
>>>> doesn't.
>>>
>>> Hmm. Correct. I guess we should end up in ivshmem_register_mmio() but we
>>> don't.
>>>
>>> For bar0, jailhouse registers MMIO 0x380000000000. This is in sync with
>>> the kernel:
>>> [ 1416.878650] pci 0000:00:01.0: BAR 0: assigned [mem
>>> 0x380000000000-0x3800000000ff 64bit]
>>>
>>> That's odd. Actually we should trap. Instrumentation of ivshmem-net
>>> below gives me:
>>>
>>> [ 2044.832898] regs location: 4080053db000
>>>
>>> Huh? Shouldn't that be 0x380000000000?
>>
>> What's "regs location"? What does "lspci -vv -s 0000:00:01.0" report?
> 
> pr_err("regs location: %llx\n", virt_to_phys(regs));

Calling virt_to_phys on ioremapped memory may not work. virt_to_phys is 
primarily (if not only) thought for calculating the address for a kernel piece 
of RAM.

> 
> Please find the output of lspci attached.
> 

That looks consistent.

Did you check that there is no accidental mapping of that virtual address so 
something else? If not, check earlier in the interception path if there is a 
VM-exit, but we just do not end up in ivshmem for it.

>>
>> Hmm 64-bit... FWIW, I'm going to remove that "feature" from future
>> ivshmem again, moving things back to 32-bit address space.
> 
> But we do have:
> 
> 380000000000-380fffffffff : PCI Bus 0000:00
> 381000000000-381fffffffff : PCI Bus 0000:16
> 382000000000-382fffffffff : PCI Bus 0000:64
> 383000000000-383fffffffff : PCI Bus 0000:b2
> 
>>
>> That said, this constellation may have triggered an issue in ivshmem or
>> even the MMIO dispatcher that wasn't visible so far.
> 
> But will moving the memory region to 32-bit address space solve the
> issue in this case?

Can't tell as we do not know the root cause yet. But you can already try to 
remove PCI_BAR_64BIT from bar[0] initialization in hypervisor/ivshmem.c and 
check what changes.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9a4b887f-a641-cacf-763b-53dbd1c229a2%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
