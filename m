Return-Path: <jailhouse-dev+bncBDJNTSETSIORBF4WQWEAMGQELKHVXIA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23d.google.com (mail-oi1-x23d.google.com [IPv6:2607:f8b0:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B773D8D97
	for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Jul 2021 14:18:32 +0200 (CEST)
Received: by mail-oi1-x23d.google.com with SMTP id n64-20020acabd430000b029025a4350857esf1328599oif.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 28 Jul 2021 05:18:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1627474711; cv=pass;
        d=google.com; s=arc-20160816;
        b=sn6KmP32cnKa+Sy2z98ME10R4NsR6utXuY0rqcjSTZHjZQwMW2hEGHSyRaSemdMjFi
         kkjuhh0OFU2+VfPNaSqVJapcz4NVHvQFwq/3keI8jtTS/DJLa6DNfvFiDY7CVjN7ji0g
         hCGiizm5KPHbLBu7YTjakpPX16y8M7mqkrVHMk/d34kbfY81NcOE7K7IcRap+32cXqLK
         yGibJdD1vDGHo+WHQaRpaJpR49yZpRIoBcWY8cIvKO8m7SE0nHxPHJFQg9xmUeOSfJC1
         p9G72qVxjQtRcc9BQObMPx/qy1BlWAMLTXPiJNNpGwKZZktzXsgcdWBfMWjPZzbLs0HH
         BR4Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=WTunrq/YCb9NlLE3PSt29WYLcPYeW4f4fm6nTxvRg6w=;
        b=VuEUvcfNyUnGGGdwsXXv7WiWFLNwTDCjun/z0KYtnqFnFkc1C9ZmDxXuk5aNJbFDbw
         UrbFpSWrUYmnseDnyM6VgeiGFZ96qVeaVPhrb88FE8mZ+DE/+NSS6ZaY0SjNIMf8cp6V
         C+3TnYjQHa+6f/BMljKjq/9okj1a0rEFFBvtTIhKqJb4++fhqaWFk0L3Sy2Lb+jxDgeY
         BhbYCX99E+a3IfZJ37DiWe4U31u+cO3UakzPV6KuFVcoh2/+FbtEKjxZqtRXQe7L2Z1d
         +0bDIo6AKo091RYCN8bOZ4d7N9o+c5mXdtF7iq5IA9lrpaqy9QXJq8gTCkzhC/+SxrrH
         XJ5g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="E4O/e3iM";
       spf=pass (google.com: domain of shihuahuang94@gmail.com designates 2607:f8b0:4864:20::636 as permitted sender) smtp.mailfrom=shihuahuang94@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WTunrq/YCb9NlLE3PSt29WYLcPYeW4f4fm6nTxvRg6w=;
        b=Uq1Kwy/veCKqWgNZNseoDT8IED8jNnqmlTPn86drX017DzdQlURMg6J4mJ7fw09ljQ
         FaKjTxTZxJJ2QSLfQ+Qi3AeNIZMEdy1mB50iLpB8FN8F3CA9C8gazuQV0ZaVqqHRrTMy
         4IGToCJSXbRCdjHZsYRnA16S398GHfsFos8h5Yhi/IfakrJFgYn4pWLIlrZWnw/ifv/V
         R5Su7AWmLc2DnvQ0owWQ2d1LOsZBC9vtamxwEaIhNlhPxBxn/nDDcv62Swq45eoyuUVC
         s7jk16lVebW8Y5wLT/rAkyC3giNBxsaTY53a5BFfpqJdvttWDISeTdBnMs/aKG2F/hYN
         TPZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WTunrq/YCb9NlLE3PSt29WYLcPYeW4f4fm6nTxvRg6w=;
        b=oumJyuScWItdinT+ee2ZEpGkweCY1bdG6lJAtG9sD9umqPcEunjba/ULKwvIAAToOW
         WYIJMBMMMHdbLE9z/wqt7aXzD468CmKYP4buxlpXRpZ6U/gdeZNec2rl9yQG79utsmvk
         VRlH7hp4N0Bo54XKkspvyTP5+bT1vLKFjj4Ykgotilu5WdTxih7imgpJdoalQs9qjHVC
         xLJ/HBHg2LU/6/rnJy9RobyTpyY5DNH2f0V5hYrZBT+JRL1QKpMhjaZJIfwuQ3jL/jQu
         nMbcP8nFwWu4CNLUCv5+VTt6+uG5S6c57zqp/wAzk8CCoOsg8+Vi9XD2banzyQUUqxQG
         KnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WTunrq/YCb9NlLE3PSt29WYLcPYeW4f4fm6nTxvRg6w=;
        b=Mgm2KI90dZ5JxSQPLtyyUWiZuepNsF/fvWieh3J0qg5IsCfkG754YeG5rRxqf70Eq+
         oHtm4TWUc+kYHnnOi45MhJ/we8604pXbcrJ8Nbule3XQybis/i9IqzsnoGjALLWhtjxr
         QQPM+RsgHBMxpuH0YZN+JUYIZqvuIuEsOJQuCKHyuMsTnmUYvKfLYnc0LLrKM7fsorcj
         IJnMPRIMgChzRQ6EuUlE9rnpim24nyXbxi/nOQEzzdG8vQgxeCxWpBoGwyYTTxq1hwgF
         KG19tGAU+r5YEztJKspSwayELw5Q9KPU92YGVRjoFYuRfGM172QejsRvYjuD6MkkZ7yG
         vSXQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533ACr8ebRttGLx2tx/lvOcSl9ndcfLSDiiMpTfoJuO3OOP39+/h
	zu0HB3VVazKOEd+/MBp4ve0=
X-Google-Smtp-Source: ABdhPJyO4hNMWvfJYNhVFKUG0WcEHI+OgYCcTzKdRaEDB489V7XuSm8LPBrMXgNFuiAvKD8ZhVolRw==
X-Received: by 2002:aca:c204:: with SMTP id s4mr6267578oif.49.1627474711339;
        Wed, 28 Jul 2021 05:18:31 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:641:: with SMTP id 62ls602301oig.0.gmail; Wed, 28 Jul
 2021 05:18:31 -0700 (PDT)
X-Received: by 2002:a05:6808:1523:: with SMTP id u35mr18254232oiw.132.1627474710872;
        Wed, 28 Jul 2021 05:18:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627474710; cv=none;
        d=google.com; s=arc-20160816;
        b=bAHd4AeZGJpUM99ACA/byyUaPcagDTimvLfxm16E7r0KFuMDPIxZE9t2KY8n4Uu9Dx
         005HH8oDzYznB5p0s/RAc1MPLSeav6TC2OXerSPKRCsKYoTCFZyrzstrpHGVfWJyQzVD
         jHF9whMinN3UkdS6GVH/x6V+M4ivP2Bp5CRDVyZoFQxmICOod5HAD8d/PZZfpczTeWA1
         sgq6G8GmOC1YI234yWrRIgXQI785n2mnPZ4y1RUaEI839iQ3Hcfofc88U1Sh9gSwBB29
         wGKm9I66+T+gtMkfA1IraVkSZu7kIi4CuRMuzgFe1yQv6xHWXg8rkMEDypLLO50rEf83
         aolA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OxjfgDdO4h5tPwo7w7AToUQy49rPj7f4xIyLP8fNJJk=;
        b=vGVIl2PC+YlWjBCIlpsUtWpfKmqbdiE2RaEWXAJ354ElEiwyAxfdaZZAXUQaF5Z8K1
         X53w1ktSyzkPGRrP54aW2wr1zz/S/9l7gHGh2w/Ara+JckSFeO8fQtiX66ab+dx/ouTW
         TL4JW9FVUi30DJMsWUmgq3v9AKT7fJLfqA40U3Va0+eCMsUyYZ3ZXJMsngaEXlt12CbV
         ccdW04dYubfWb1d5pPpPbHq4TESA7hd6zKGuIlxqu0zOz8bddRYOzHrSzPDUl7HfwOOd
         TwMsdzD1oUrGti3AnJKHafjAe964tbL26uWnsj2Xl7LKngef8IIA5L5lHwwAmiyUVKRS
         XHtg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="E4O/e3iM";
       spf=pass (google.com: domain of shihuahuang94@gmail.com designates 2607:f8b0:4864:20::636 as permitted sender) smtp.mailfrom=shihuahuang94@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com. [2607:f8b0:4864:20::636])
        by gmr-mx.google.com with ESMTPS id m22si520942oie.5.2021.07.28.05.18.30
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 05:18:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of shihuahuang94@gmail.com designates 2607:f8b0:4864:20::636 as permitted sender) client-ip=2607:f8b0:4864:20::636;
Received: by mail-pl1-x636.google.com with SMTP id e5so2424981pld.6
        for <jailhouse-dev@googlegroups.com>; Wed, 28 Jul 2021 05:18:30 -0700 (PDT)
X-Received: by 2002:aa7:978c:0:b029:32a:403e:88cc with SMTP id
 o12-20020aa7978c0000b029032a403e88ccmr28288248pfp.7.1627474710163; Wed, 28
 Jul 2021 05:18:30 -0700 (PDT)
MIME-Version: 1.0
References: <e52ea42b-f7ac-4f70-b23f-717c5d530dc5n@googlegroups.com>
 <3372d9be-7223-0713-50bd-8db705d4f0e5@siemens.com> <6f3f0b24-cfee-4c08-86c4-8a0cc9183a2fn@googlegroups.com>
 <2d2c72b6-cae0-e210-8db2-630b33180335@siemens.com> <CAPKBGcn=m5f_3RGzhZ+=BF9_-v-SAN8y=xOCk5Zf8RgEm7Jz_Q@mail.gmail.com>
In-Reply-To: <CAPKBGcn=m5f_3RGzhZ+=BF9_-v-SAN8y=xOCk5Zf8RgEm7Jz_Q@mail.gmail.com>
From: Huang Shihua <shihuahuang94@gmail.com>
Date: Wed, 28 Jul 2021 14:18:19 +0200
Message-ID: <CAPKBGc==ELN+6Ws==mH=tCc=NqrJfSxvrEF3ey56VwWFsmS_3w@mail.gmail.com>
Subject: Re: Ivshmem-demo: root cell failed to receive interrupts
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Huang Shihua <shihua.huang@prodrive-technologies.com>, 
	Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: multipart/alternative; boundary="000000000000faf44d05c82dfb4e"
X-Original-Sender: ShihuaHuang94@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20161025 header.b="E4O/e3iM";       spf=pass
 (google.com: domain of shihuahuang94@gmail.com designates 2607:f8b0:4864:20::636
 as permitted sender) smtp.mailfrom=shihuahuang94@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000faf44d05c82dfb4e
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 28, 2021 at 2:10 PM Huang Shihua <shihuahuang94@gmail.com>
wrote:

>
>
> On Mon, Jul 26, 2021 at 8:08 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
>> On 26.07.21 19:14, Huang Shihua wrote:
>> >
>> >
>> > On Wednesday, 21 July 2021 at 17:50:53 UTC+2 j.kiszka...@gmail.com
>> wrote:
>> >
>> >     On 13.07.21 18:09, Huang Shihua wrote:
>> >     > HI,
>> >     >
>> >     > Currently, I'm trying to run the ivshmem-demo to establish
>> >     communication
>> >     > between Linux root cell and one non-root cell. Configuration files
>> >     are
>> >     > attached.
>> >     >
>> >     > Two cases were tested:
>> >     >
>> >     > 1. Let the non-root cell load the ivshmem-demo and then target at
>> >     > itself (target=1). _All interrupts can be sent and received
>> >     correctly_.
>> >     > 2. Let the root cell and the non-root cell send interrupts to each
>> >     > other. I.e., root cell runs /./tools/demos/ivshmem-demo -t 1,
>> /while
>> >     > the non-root cell load /inmates/demos/x86/ivshmem-demo.bin -s
>> >     > "target=0" -a 0x1000 /and then run. The result turned out to be,
>> >     > * the non-root cell got the interrupts from the root cell,
>> >     > * _while the root cell did not receive any interrupt._
>> >     >
>> >     > As Jan mentioned
>> >     >
>> >     in
>> https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ
>> >     <
>> https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ>,
>> >
>> >     > tuning the iommu index should do the trick.
>> >     > However, unfortunately, it did not work for me :c
>> >     >
>> >     > There are 8 iommu units on the hardware, I tuned the iommu index
>> >     in the
>> >
>> >     Wow, 8 units...
>> >
>> >     > root cell configuration from 0 to 7. The same behavior, no
>> interrupts
>> >     > were received by the root cell, remains when tuning the index from
>> >     0 to
>> >     > 6. When the iommu is set to 7, the kernel crashed immediately when
>> >     the
>> >     > demo was started on the non-root cell.
>> >     >
>> >     > Any idea regarding why the root cell always failed to receive
>> >     interrupts?
>> >
>> >     This may require in-detail debugging. For that, you would have to
>> >     instrument the hypervisor along its virtual IRQ injection path. That
>> >     starts in ivshmem_trigger_interrupt() (hypervisor/ivshmem.c). The
>> >     sending side will call it on writing the doorbell registers. Check
>> >     along
>> >     this call path if conditions to actually send the IRQ are not met.
>> >
>> >     If all are met, the hypervisor sends an IPI to a target cell CPU
>> (will
>> >     be directly delivered to the guest) that should cause the normal IRQ
>> >     processing there. But usually, we do not get so far in such cases.
>> >
>> >     Another function of interest here is arch_ivshmem_update_msix() when
>> >     called for the root cell while it defines where ivshmem IRQs should
>> go
>> >     to. Possibly, Jailhouse decides that the programming Linux issued is
>> >     not
>> >     valid and therefore leaves the irq_cache that
>> >     arch_ivshmem_trigger_interrupt() uses invalid. You can also check
>> that
>> >     via instrumentations (printk).
>> >
>> >
>> > Indeed, when .iommu is assigned as 0,1,..6,  irq_cache is invalid. I
>> suspect
>> > the reason is that their correpsonding VT-d interrupt remappting table
>> > entries
>> > are not for ivshmem devices, i.e., unmatched device ID.
>> > When .iommu is tuned to 7, irq_cache becomes valid.
>> >
>>
>> OK, then we know what needs to be set. I will have to check eventually
>> if we can read out that information also from sysfs so that this
>> guessing can end.
>>
>> > (BTW, as I mentioned before, the kernel crashed immediately when the
>> > demo was started on the non-root cell. _One missing detail here is_, on
>> the
>> > root-cell side,  ./tools/demos/ivshmem-demo is running/has run, i.e.,
>> > init_control has been set to 1. If ./tools/demos/ivshmem-demo has not
>> been
>> > run on the root cell yet, then starting the demo on the non-root cell
>> > will not
>> > kill the kernel.)
>>
>> Now we need to understand the crash. The root cell kernel oopses, right?
>> Any logs from that?
>>
>
> Activating hypervisor
> CAT: Using COS 0 with bitmask 000007ff for cell ivshmem-demo
> Adding virtual PCI device 00:0e.0 to cell "ivshmem-demo"
> Shared memory connection established, peer cells:
>  "RootCell"
> Created cell "ivshmem-demo"
> Page pool usage after cell creation: mem 938/3534, remap 65603/131072
> Cell "ivshmem-demo" can be loaded
> CPU 1 received SIPI, vector 100
> Started cell "ivshmem-demo"
> IVSHMEM: Found device at 00:0e.0
> IVSHMEM: bar0 is at 0x00000000ff000000
> IVSHMEM: bar1 is at 0x00000000ff001000
> IVSHMEM: ID is 1
> IVSHMEM: max. peers is 3
> IVSHMEM: state table is at 0x000000003f0f0000
> IVSHMEM: R/W section is at 0x000000003f0f1000
> IVSHMEM: input sections start at 0x000000003f0fa000
> IVSHMEM: output section is at 0x000000003f0fc000
> IVSHMEM: initialized device
> state[0] = 0
> state[1] = 2
> state[2] = 0
> rw[0] = -1347440721
> rw[1] = 0
> rw[2] = -1347440721
> in@0x0000 = -1347440721
> in@0x2000 = 0
> in@0x4000 = -1347440721
>
> IVSHMEM: sending IRQ 2 to peer 2
>
> IVSHMEM: sending IRQ 2 to peer 2
> <---------- ./tools/demos/ivshmem-demo -t 1 (root cell)
> IVSHMEM: got interrupt 0 (#1)
> state[0] = 0
> state[1] = 2
> state[2] = 3
> rw[0] = -1347440721
> rw[1] = 0
> rw[2] = 0
> in@0x0000 = -1347440721
> in@0x2000 = 0
> in@0x4000 = 0
>
> IVSHMEM: sending IRQ 2 to peer 2
> FATAL: Unhandled VM-Exit, reason 26
> qualification 0
> vectoring info: 0 interrupt info: 0
> RIP: 0xffffffff8d05f6ae RSP: 0xffffafa9c0003fc0 FLAGS: 2
> RAX: 0x00000000007626f0 RBX: 0x0000000000000000 RCX: 0x000000007ffefbff
> RDX: 0x00000000bfebfbff RSI: 0xffffafa9c0003fc8 RDI: 0xffffafa9c0003fc4
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: a09b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x0000001fbd80a004 CR4: 0x00000000007626f0
> EFER: 0x0000000000000d01
> Parking CPU 0 (Cell: "RootCell")
>
> IVSHMEM: sending IRQ 2 to peer 2
> Ignoring NMI IPI to CPU 0
> Ignoring NMI IPI to CPU 2
> Ignoring NMI IPI to CPU 3
> Ignoring NMI IPI to CPU 5
> Ignoring NMI IPI to CPU 6
> Ignoring NMI IPI to CPU 7
> Ignoring NMI IPI to CPU 8
> Ignoring NMI IPI to CPU 9
> Ignoring NMI IPI to CPU 10
> Ignoring NMI IPI to CPU 11
> Ignoring NMI IPI to CPU 12
> Ignoring NMI IPI to CPU 13
> Ignoring NMI IPI to CPU 14
> Ignoring NMI IPI to CPU 15
>
> IVSHMEM: sending IRQ 2 to peer 2
>
>
>>
>> And what do yo mean with init_control?
>>
>
> oops, typo, should be int_control...
> the int_control of struct ivshm_regs in ivshmem-demo/c
> struct ivshm_regs {
>          uint32_t id;
>          uint32_t max_peer;
>          uint32_t int_control;
>          .....
> }
> *so when root cell mimo_write 1 to regs->int_control while non-root cell
> has been running, then the kernel crashes.*
>
>>
>> >
>> > To avoid the kernel crashing situation, I only ran the demo on the
>> > non-root cell. With .iommu being set validly, I will expect at least
>> > seeing the
>> > interrupt count increases,  when grep ivshmem /proc/interrupts.
>> > But nope, _still no interrupts received on the root cell_.
>> >
>>
>> If there is no driver registered on the root side or not opened (by the
>> demo app), then the interrupt reception is disabled. We need to debug
>> the "hot" case.
>>
>
> Right, after diving into the source code, I did see that as when
> ive->int_ctrl_reg=0,
> no interrupt will be triggered, i.e., arch_ivshmem_trigger_interrupt is
> skipped.
>
> I have a question regarding the code below.
> static void ivshmem_trigger_interrupt(struct ivshmem_endpoint *ive,
>      unsigned int vector)
> {
>
> /*
> * Hold the IRQ lock while sending the interrupt so that ivshmem_exit
> * and ivshmem_register_mmio can synchronize on the completion of the
> * delivery.
> */
> spin_lock(&ive->irq_lock);
>
>
> if (ive->int_ctrl_reg & IVSHMEM_INT_ENABLE) {
>
> if (ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] &
>
>    IVSHMEM_CFG_ONESHOT_INT)
>
> ive->int_ctrl_reg = 0;
>
>
> arch_ivshmem_trigger_interrupt(ive, vector);
>
> }
>
>
> spin_unlock(&ive->irq_lock);
>
> }
>
> Q1: IVSHMEM_CFG_ONESHOT_INT means?
> Q2: What does meeting this condition mean,
> ive->cspace[IVSHMEM_CFG_VNDR_CAP/4] & IVSHMEM_CFG_ONESHOT_INT?
> Q3: Why trigger_interrupt when ive->int_ctrl_reg = 0?
> Q4: I tried to add "else" a line above arch_ivshmem_trigger_interrupt,
> i.e.,  arch_ivshmem_trigger_interrupt is skipped when
>

pff.....by mistake the incomplete email was sent.....
anyway, let me continue ....

 Q4: I tried to add "else" a line above arch_ivshmem_trigger_interrupt,
i.e.,  arch_ivshmem_trigger_interrupt was skipped when
./tools/demos/ivshmem-demo -t 1 was executed on the root cell, thus no
kernel crash,
non-root can later receive interrupt #*!*0 from the root cell, and :) yeah
the root cell still receives nothing.


>> Jan
>>
>> --
>> Siemens AG, T RDA IOT
>> Corporate Competence Center Embedded Linux
>>
>> --
>> You received this message because you are subscribed to the Google Groups
>> "Jailhouse" group.
>> To unsubscribe from this group and stop receiving emails from it, send an
>> email to jailhouse-dev+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit
>> https://groups.google.com/d/msgid/jailhouse-dev/2d2c72b6-cae0-e210-8db2-630b33180335%40siemens.com
>> .
>>
>

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAPKBGc%3D%3DELN%2B6Ws%3D%3DmH%3DtCc%3DNqrJfSxvrEF3ey56VwWFsmS_3w%40mail.gmail.com.

--000000000000faf44d05c82dfb4e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jul 28, 2021 at 2:10 PM Huang=
 Shihua &lt;<a href=3D"mailto:shihuahuang94@gmail.com">shihuahuang94@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jul 26, 2021 at 8:08 PM Ja=
n Kiszka &lt;<a href=3D"mailto:jan.kiszka@siemens.com" target=3D"_blank">ja=
n.kiszka@siemens.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">On 26.07.21 19:14, Huang Shihua wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wednesday, 21 July 2021 at 17:50:53 UTC+2 <a href=3D"mailto:j.kiszk=
a...@gmail.com" target=3D"_blank">j.kiszka...@gmail.com</a> wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On 13.07.21 18:09, Huang Shihua wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; HI,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Currently, I&#39;m trying to run the ivshmem-d=
emo to establish<br>
&gt;=C2=A0 =C2=A0 =C2=A0communication<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; between Linux root cell and one non-root cell.=
 Configuration files<br>
&gt;=C2=A0 =C2=A0 =C2=A0are<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; attached.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Two cases were tested:<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 1. Let the non-root cell load the ivshmem-demo=
 and then target at<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; itself (target=3D1). _All interrupts can be se=
nt and received<br>
&gt;=C2=A0 =C2=A0 =C2=A0correctly_.<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 2. Let the root cell and the non-root cell sen=
d interrupts to each<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; other. I.e., root cell runs=C2=A0/./tools/demo=
s/ivshmem-demo -t 1, /while<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; the non-root cell load /inmates/demos/x86/ivsh=
mem-demo.bin -s<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; &quot;target=3D0&quot; -a 0x1000 /and then run=
. The result turned out to be,=C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * the non-root cell got the interrupts from th=
e root cell,<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; * _while the root cell did not receive any int=
errupt._<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; As Jan mentioned<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0in=C2=A0<a href=3D"https://groups.google.com/g/jail=
house-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ" rel=3D"noreferrer" target=3D"_blank=
">https://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ</a=
><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://groups.google.com/g/jailhous=
e-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ" rel=3D"noreferrer" target=3D"_blank">ht=
tps://groups.google.com/g/jailhouse-dev/c/GRCWFzNaHX8/m/ht8z51BOCgAJ</a>&gt=
;,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; tuning the iommu index should do the trick.<br=
>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; However, unfortunately, it did not work for me=
 :c<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; There are 8 iommu units on the hardware, I tun=
ed the iommu index<br>
&gt;=C2=A0 =C2=A0 =C2=A0in the<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Wow, 8 units...<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; root cell configuration from 0 to 7. The same =
behavior, no interrupts<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; were received by the root cell, remains when t=
uning the index from<br>
&gt;=C2=A0 =C2=A0 =C2=A00 to<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; 6. When the iommu is set to 7, the kernel cras=
hed immediately when<br>
&gt;=C2=A0 =C2=A0 =C2=A0the<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; demo was started on the non-root cell.=C2=A0<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0&gt; Any idea regarding why the root cell always fa=
iled to receive<br>
&gt;=C2=A0 =C2=A0 =C2=A0interrupts?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This may require in-detail debugging. For that, you=
 would have to<br>
&gt;=C2=A0 =C2=A0 =C2=A0instrument the hypervisor along its virtual IRQ inj=
ection path. That<br>
&gt;=C2=A0 =C2=A0 =C2=A0starts in ivshmem_trigger_interrupt() (hypervisor/i=
vshmem.c). The<br>
&gt;=C2=A0 =C2=A0 =C2=A0sending side will call it on writing the doorbell r=
egisters. Check<br>
&gt;=C2=A0 =C2=A0 =C2=A0along<br>
&gt;=C2=A0 =C2=A0 =C2=A0this call path if conditions to actually send the I=
RQ are not met.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0If all are met, the hypervisor sends an IPI to a ta=
rget cell CPU (will<br>
&gt;=C2=A0 =C2=A0 =C2=A0be directly delivered to the guest) that should cau=
se the normal IRQ<br>
&gt;=C2=A0 =C2=A0 =C2=A0processing there. But usually, we do not get so far=
 in such cases.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Another function of interest here is arch_ivshmem_u=
pdate_msix() when<br>
&gt;=C2=A0 =C2=A0 =C2=A0called for the root cell while it defines where ivs=
hmem IRQs should go<br>
&gt;=C2=A0 =C2=A0 =C2=A0to. Possibly, Jailhouse decides that the programmin=
g Linux issued is<br>
&gt;=C2=A0 =C2=A0 =C2=A0not<br>
&gt;=C2=A0 =C2=A0 =C2=A0valid and therefore leaves the irq_cache that<br>
&gt;=C2=A0 =C2=A0 =C2=A0arch_ivshmem_trigger_interrupt() uses invalid. You =
can also check that<br>
&gt;=C2=A0 =C2=A0 =C2=A0via instrumentations (printk).=C2=A0<br>
&gt; <br>
&gt; <br>
&gt; Indeed, when .iommu is assigned as 0,1,..6,=C2=A0 irq_cache is invalid=
. I suspect<br>
&gt; the reason is that their correpsonding VT-d interrupt remappting table=
<br>
&gt; entries<br>
&gt; are not for ivshmem devices, i.e., unmatched device ID.<br>
&gt; When .iommu is tuned to 7, irq_cache becomes valid.<br>
&gt; <br>
<br>
OK, then we know what needs to be set. I will have to check eventually<br>
if we can read out that information also from sysfs so that this<br>
guessing can end.<br>
<br>
&gt; (BTW, as I mentioned before, the kernel crashed immediately when the<b=
r>
&gt; demo was started on the non-root cell. _One missing detail here is_, o=
n the=C2=A0<br>
&gt; root-cell side,=C2=A0 ./tools/demos/ivshmem-demo is running/has run, i=
.e.,=C2=A0<br>
&gt; init_control has been set to 1. If ./tools/demos/ivshmem-demo=C2=A0has=
 not been<br>
&gt; run on the root cell yet, then starting the demo on the non-root cell<=
br>
&gt; will not<br>
&gt; kill the kernel.)<br>
<br>
Now we need to understand the crash. The root cell kernel oopses, right?<br=
>
Any logs from that?<br></blockquote><div>=C2=A0</div><div>Activating hyperv=
isor<br>CAT: Using COS 0 with bitmask 000007ff for cell ivshmem-demo<br>Add=
ing virtual PCI device 00:0e.0 to cell &quot;ivshmem-demo&quot;<br>Shared m=
emory connection established, peer cells:<br>=C2=A0&quot;RootCell&quot;<br>=
Created cell &quot;ivshmem-demo&quot;<br>Page pool usage after cell creatio=
n: mem 938/3534, remap 65603/131072<br>Cell &quot;ivshmem-demo&quot; can be=
 loaded<br>CPU 1 received SIPI, vector 100<br>Started cell &quot;ivshmem-de=
mo&quot;<br>IVSHMEM: Found device at 00:0e.0<br>IVSHMEM: bar0 is at 0x00000=
000ff000000<br>IVSHMEM: bar1 is at 0x00000000ff001000<br>IVSHMEM: ID is 1<b=
r>IVSHMEM: max. peers is 3<br>IVSHMEM: state table is at 0x000000003f0f0000=
<br>IVSHMEM: R/W section is at 0x000000003f0f1000<br>IVSHMEM: input section=
s start at 0x000000003f0fa000<br>IVSHMEM: output section is at 0x000000003f=
0fc000<br>IVSHMEM: initialized device<br>state[0] =3D 0<br>state[1] =3D 2<b=
r>state[2] =3D 0<br>rw[0] =3D -1347440721<br>rw[1] =3D 0<br>rw[2] =3D -1347=
440721<br>in@0x0000 =3D -1347440721<br>in@0x2000 =3D 0<br>in@0x4000 =3D -13=
47440721<br><br>IVSHMEM: sending IRQ 2 to peer 2<br><br>IVSHMEM: sending IR=
Q 2 to peer 2<br>											&lt;---------- ./tools/demos/ivshmem-demo -t 1 =
(root cell)<br>IVSHMEM: got interrupt 0 (#1)<br>state[0] =3D 0<br>state[1] =
=3D 2<br>state[2] =3D 3<br>rw[0] =3D -1347440721<br>rw[1] =3D 0<br>rw[2] =
=3D 0<br>in@0x0000 =3D -1347440721<br>in@0x2000 =3D 0<br>in@0x4000 =3D 0<br=
><br>IVSHMEM: sending IRQ 2 to peer 2<br>FATAL: Unhandled VM-Exit, reason 2=
6<br>qualification 0<br>vectoring info: 0 interrupt info: 0<br>RIP: 0xfffff=
fff8d05f6ae RSP: 0xffffafa9c0003fc0 FLAGS: 2<br>RAX: 0x00000000007626f0 RBX=
: 0x0000000000000000 RCX: 0x000000007ffefbff<br>RDX: 0x00000000bfebfbff RSI=
: 0xffffafa9c0003fc8 RDI: 0xffffafa9c0003fc4<br>CS: 10 BASE: 0x000000000000=
0000 AR-BYTES: a09b EFER.LMA 1<br>CR0: 0x0000000080050033 CR3: 0x0000001fbd=
80a004 CR4: 0x00000000007626f0<br>EFER: 0x0000000000000d01<br>Parking CPU 0=
 (Cell: &quot;RootCell&quot;)<br><br>IVSHMEM: sending IRQ 2 to peer 2<br>Ig=
noring NMI IPI to CPU 0<br>Ignoring NMI IPI to CPU 2<br>Ignoring NMI IPI to=
 CPU 3<br>Ignoring NMI IPI to CPU 5<br>Ignoring NMI IPI to CPU 6<br>Ignorin=
g NMI IPI to CPU 7<br>Ignoring NMI IPI to CPU 8<br>Ignoring NMI IPI to CPU =
9<br>Ignoring NMI IPI to CPU 10<br>Ignoring NMI IPI to CPU 11<br>Ignoring N=
MI IPI to CPU 12<br>Ignoring NMI IPI to CPU 13<br>Ignoring NMI IPI to CPU 1=
4<br>Ignoring NMI IPI to CPU 15<br><br>IVSHMEM: sending IRQ 2 to peer 2<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
And what do yo mean with init_control?<br></blockquote><div><br></div><div>=
oops, typo, should be int_control...=C2=A0</div><div>the int_control of str=
uct ivshm_regs in ivshmem-demo/c</div><div>struct ivshm_regs {</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t id;</div><div>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0uint32_t max_peer;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0uint32_t int_control;</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0...=
..</div><div>}</div><div><u>so when root cell mimo_write 1 to regs-&gt;int_=
control while non-root cell has been running, then the kernel crashes.</u><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; To avoid the kernel crashing situation, I only ran the demo on the<br>
&gt; non-root cell. With .iommu being set validly, I will expect at least<b=
r>
&gt; seeing the<br>
&gt; interrupt count increases,=C2=A0 when=C2=A0grep ivshmem /proc/interrup=
ts.<br>
&gt; But nope, _still no interrupts received on the root cell_.<br>
&gt; <br>
<br>
If there is no driver registered on the root side or not opened (by the<br>
demo app), then the interrupt reception is disabled. We need to debug<br>
the &quot;hot&quot; case.<br></blockquote><div><br></div><div>Right, after =
diving into the source code, I did see that as when ive-&gt;int_ctrl_reg=3D=
0,</div><div>no interrupt will be triggered, i.e., arch_ivshmem_trigger_int=
errupt is skipped.</div><div><br></div><div>I have a question regarding the=
 code below.</div><div>static void ivshmem_trigger_interrupt(struct ivshmem=
_endpoint *ive,</div>				 =C2=A0 =C2=A0 =C2=A0unsigned int vector)<br>{<br>=
</div><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"=
><div class=3D"gmail_quote">	/*</div><div class=3D"gmail_quote">	 * Hold th=
e IRQ lock while sending the interrupt so that ivshmem_exit</div><div class=
=3D"gmail_quote">	 * and ivshmem_register_mmio can synchronize on the compl=
etion of the</div><div class=3D"gmail_quote">	 * delivery.</div><div class=
=3D"gmail_quote">	 */</div><div class=3D"gmail_quote">	spin_lock(&amp;ive-&=
gt;irq_lock);</div></blockquote><div class=3D"gmail_quote"><br></div><block=
quote style=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div class=
=3D"gmail_quote">	if (ive-&gt;int_ctrl_reg &amp; IVSHMEM_INT_ENABLE) {</div=
></blockquote><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padd=
ing:0px"><blockquote style=3D"margin:0px 0px 0px 40px;border:none;padding:0=
px"><div class=3D"gmail_quote">		if (ive-&gt;cspace[IVSHMEM_CFG_VNDR_CAP/4]=
 &amp;</div></blockquote></blockquote><blockquote style=3D"margin:0px 0px 0=
px 40px;border:none;padding:0px"><blockquote style=3D"margin:0px 0px 0px 40=
px;border:none;padding:0px"><blockquote style=3D"margin:0px 0px 0px 40px;bo=
rder:none;padding:0px"><div class=3D"gmail_quote">		 =C2=A0 =C2=A0IVSHMEM_C=
FG_ONESHOT_INT)</div></blockquote></blockquote></blockquote><blockquote sty=
le=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><blockquote style=3D=
"margin:0px 0px 0px 40px;border:none;padding:0px"><blockquote style=3D"marg=
in:0px 0px 0px 40px;border:none;padding:0px"><div class=3D"gmail_quote">			=
ive-&gt;int_ctrl_reg =3D 0;</div></blockquote></blockquote></blockquote><di=
v class=3D"gmail_quote"><br></div><blockquote style=3D"margin:0px 0px 0px 4=
0px;border:none;padding:0px"><blockquote style=3D"margin:0px 0px 0px 40px;b=
order:none;padding:0px"><div class=3D"gmail_quote">		arch_ivshmem_trigger_i=
nterrupt(ive, vector);</div></blockquote></blockquote><blockquote style=3D"=
margin:0px 0px 0px 40px;border:none;padding:0px"><div class=3D"gmail_quote"=
>	}</div></blockquote><div class=3D"gmail_quote"><br></div><blockquote styl=
e=3D"margin:0px 0px 0px 40px;border:none;padding:0px"><div class=3D"gmail_q=
uote">	spin_unlock(&amp;ive-&gt;irq_lock);</div></blockquote><div class=3D"=
gmail_quote">}</div><div class=3D"gmail_quote"><br></div><div class=3D"gmai=
l_quote">Q1: IVSHMEM_CFG_ONESHOT_INT means?</div><div class=3D"gmail_quote"=
>Q2: What does meeting this condition mean, ive-&gt;cspace[IVSHMEM_CFG_VNDR=
_CAP/4] &amp; IVSHMEM_CFG_ONESHOT_INT?=C2=A0</div><div class=3D"gmail_quote=
">Q3: Why trigger_interrupt when=C2=A0ive-&gt;int_ctrl_reg =3D 0?</div><div=
 class=3D"gmail_quote">Q4: I tried to add &quot;else&quot; a line above=C2=
=A0arch_ivshmem_trigger_interrupt,</div><div class=3D"gmail_quote">i.e.,=C2=
=A0

arch_ivshmem_trigger_interrupt is skipped when=C2=A0<br></div></div></block=
quote><div>=C2=A0</div><div>pff.....by mistake the incomplete email was sen=
t.....</div><div>anyway, let me continue ....</div><div><br></div><div>=C2=
=A0Q4: I tried to add &quot;else&quot; a line above=C2=A0arch_ivshmem_trigg=
er_interrupt,</div><div class=3D"gmail_quote">i.e.,=C2=A0 arch_ivshmem_trig=
ger_interrupt was skipped when ./tools/demos/ivshmem-demo -t 1 was executed=
 on the root cell, thus no kernel crash,</div><div class=3D"gmail_quote">no=
n-root can later receive interrupt #<b>!</b>0 from the root cell, and :) ye=
ah the root cell still receives nothing.</div><div class=3D"gmail_quote"><b=
r></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex=
;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">=
<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
Jan<br>
<br>
-- <br>
Siemens AG, T RDA IOT<br>
Corporate Competence Center Embedded Linux<br>
<br>
-- <br>
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br>
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev%2Bunsubscribe@googlegroups.com" tar=
get=3D"_blank">jailhouse-dev+unsubscribe@googlegroups.com</a>.<br>
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2d2c72b6-cae0-e210-8db2-630b33180335%40siemens.com=
" rel=3D"noreferrer" target=3D"_blank">https://groups.google.com/d/msgid/ja=
ilhouse-dev/2d2c72b6-cae0-e210-8db2-630b33180335%40siemens.com</a>.<br>
</blockquote></div></div>
</blockquote></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAPKBGc%3D%3DELN%2B6Ws%3D%3DmH%3DtCc%3DNqrJfSxvrEF=
3ey56VwWFsmS_3w%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">ht=
tps://groups.google.com/d/msgid/jailhouse-dev/CAPKBGc%3D%3DELN%2B6Ws%3D%3Dm=
H%3DtCc%3DNqrJfSxvrEF3ey56VwWFsmS_3w%40mail.gmail.com</a>.<br />

--000000000000faf44d05c82dfb4e--
