Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB37IZGKAMGQELRD3L2A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73c.google.com (mail-qk1-x73c.google.com [IPv6:2607:f8b0:4864:20::73c])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B564536E27
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 21:13:53 +0200 (CEST)
Received: by mail-qk1-x73c.google.com with SMTP id c16-20020ae9e210000000b006a32c6a3830sf6094191qkc.12
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 12:13:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653765232; cv=pass;
        d=google.com; s=arc-20160816;
        b=rwleHxn/Dl+m7vvUkFSwPcNqNoWwrJybcx9PmwkBYzE5fHW7sxKPjxPcFxZ/phMhG/
         eGIgiZLgPIVab1T0RrQ/Gf3RkBd0jW+ar8ohODTWIcJbKsulChbwjtev/RKIEUAfQBg6
         rZbEKpGkti+WrIRoMFuMn10qQDB80tybyhy1LFBmuxdMKOHGBe1qXqyMP9pznEJnCZvv
         w0rxE5ejJscFB1uizs0iv3LUwRdltwJVfbMzEHLjvpR711Z6HgYvrCp0sNOEG/WdyKLJ
         Q3tpy0k5dvQM+uvXCbJmU5UntBeqmnFst6rfhFkJEoTNoesgbvvMJrqhJEefRz8c2jns
         aMaA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=0nwE65m3stSb7uT4OGUwZ24avps+eSU+aU8a/qZwAPM=;
        b=qH8FzbXi17uQEvJnDqPPAYw/i4O46qwWcCeilH3FhFTT54aGFDby7k47PHypVjFTtL
         bB/fDsape3crkVn0rRU4nVbhTPMF3ysoUHuFGEV5GIls+sHLTU1oiTuVY7OhREht9M+P
         a8EKbKxbOSPpP2eoXY/MKi5gJvmoqW1qkmn+nOAvMlbAhwxPy0HiQjpN24op23TzKQWq
         j4vRlraob0AqY1nQuoAEozxeK4Oi6jQry7zWHT9/WW1cvBLCCz0JTTOSDVDTFNdUxqjA
         jCplqPGwcFrJw/MRcIfqcIaBjj2qOUcdJuyncF+dEnvS+NOd9+XMFEvMpuEGmw7fEck8
         gdVg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=q7AAMz2T;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nwE65m3stSb7uT4OGUwZ24avps+eSU+aU8a/qZwAPM=;
        b=NB/+dflIGQTW3BVXoYEH6NgbT0w69EBcSDmmpIYibhHTx3rIMNDIhMorfekIXW3WyB
         TZKxnfftHkEz7MQYuLIEor9o/Ub+DePS0zLwdUPmIa5EjZB9xO57jcltawoIPKJO+ALp
         ltm2G78yccEoOqbopmIGXKVVeYrGxpWWKlL9qTpoFGOUP2ZuObjkWNej0DGwjzW2ghJG
         BBxPV3jwOWUkGR0kdkAJhQC5swzF+WE5Lif7um2xbLohfVhCdA3ap0isU/hHDBhzfc2S
         4+NRCxFhOxz9SxvsY44ENCvOStk+C64LMy99p9mXo/oW61RgL1WYx3TyV2mSxl2sSO0G
         1iPg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nwE65m3stSb7uT4OGUwZ24avps+eSU+aU8a/qZwAPM=;
        b=othuzqloGhAVu5CG826O8i7QjZqO8yc051djYRGKSPYUqtz4LhIU0eoxMxwwah3ebh
         HnRj0Ve8GyCFKA24K1eMVrkMgY6k25tHjLzBFBND/AuvZEXCsgQ6CRtG3sbce9Tdcev2
         PwzFGnK+VMVI32Bz0kDVs5rd3z5uAOHSCltjejzP+1YHKhahyEoMxZwHU0Frfrr8VgeL
         RjRQ3WfXXkETAMGMzHR9W0XBTZv7KiOxvARQCnaBGT+AuBRvyue13v78hrlk9xWXT3mn
         /Ds7+/uM8MzRQgOmljEAndx2QniTO8pNzcIdI84gvLPVW+RDkwm+zadziaOIn+luLV3Q
         GjGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=0nwE65m3stSb7uT4OGUwZ24avps+eSU+aU8a/qZwAPM=;
        b=VFX4StsB+uAhPvIF40gs7pxL/0Ps4jsJ/ZS4OYKAc3apzitu+ghHj/hlaN7UzfcjsA
         ePsKlD2HGNzXC6tgMVIS0+yoZyfSrARzOKY+gU6+2UkhXhR3/kL1x/t8kqhzIKaQF+fw
         6iRYd8O4r5nyYWuyXZyRmoHpjuHfWzTe/aFZ/WADmG/zTzAf1HAO8dzJBv88E3ymr+oW
         ZM1hE2hWZqxT70/vw4mUgGzSs6sgbyJvxltISROSANXpoaDuKS1GxahWRVC4P+KA1+7z
         DvIyNWOa/OTP4aaQ9eds8KXznS11fBq7hGP8UrdXV8KV4Q+e+kdFx2AVKfOgc1fXdJux
         9Ajw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532GjawrN05oRkP5aJUGz7wxcUFiGVqfOB2aGT0YL+RGLy4wYUT1
	tkhubNi5p20d5p+1CULGqk0=
X-Google-Smtp-Source: ABdhPJx6p/91VstmQgjZ+Tvmbe3pkVOXugnQrO8VDlx7HY+cu3w8fxdwntPAsOquPxdiTlR/4ujv0g==
X-Received: by 2002:ad4:55f1:0:b0:461:c6ed:82bc with SMTP id bu17-20020ad455f1000000b00461c6ed82bcmr40245529qvb.30.1653765232053;
        Sat, 28 May 2022 12:13:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:4001:b0:6a3:2d5d:f77 with SMTP id
 h1-20020a05620a400100b006a32d5d0f77ls15642993qko.2.gmail; Sat, 28 May 2022
 12:13:51 -0700 (PDT)
X-Received: by 2002:a37:456:0:b0:6a3:6f0d:7fb7 with SMTP id 83-20020a370456000000b006a36f0d7fb7mr24730992qke.57.1653765231199;
        Sat, 28 May 2022 12:13:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653765231; cv=none;
        d=google.com; s=arc-20160816;
        b=ElJJIPnqa7R4N0OTgEENwZHp1pa1nBNuRmyhIX7nZZoH+Ky4FWzIxN+DLxReHLG/2I
         3rDf4/VkkKyD2ankewsawFOFETEDgA2WseQzMzOJeqJixmr4yAMaM7AFk5hm0MkAPnSP
         hx2IFgE4YKu3mUf24aUKD+gdrQY75KDjjgzHrKos09RAuyiUR5ee7N3ZkMpxLh5R8Wzr
         kUVFHmDbdrSH3aZvfQbkvcb0evh8qMhxz+nWcr6Cnfy8p3ICt6ztn5BgTrDFLXDc/v8h
         1TxFBdQ0rEO//PZPkKNiw6BvtsZzLGmv145+DF0o2jVSMMKP9iPnVcoxXyE3Q+JrfEOo
         FI1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l/cqpgpKMmOPN1o8F/pD+hpd5MXDYMl5rdBvKgyrGJI=;
        b=Tso8tVHcH/UP8oN+56lNZMnutexQuAz1P/1JJzEn+4w+D54TgISBSL3SDSwpzR96wv
         xVotxV+vnIrScBJqHKnk8Z6Kxe2hKR4/h8m8V+rv6seWl8ampj4bECuiJgV1oEE2N0fk
         JdIzRkC9dGijNAd1nSKxK8R6eWZYx2HSu0lLmYo72CLMITwkHgNW6wl1P79ujsxx//eF
         opcxV56NwenWp+cpi4YVMCybvXnExOt+kUlWVkn+f5zijezKm2Z7xUdK2MU4PBzzbGY/
         T92cYKFAPznSz/DMZ42N1xSQ7GPgEviJ8B5dOEMjJV4p0TkeqB2/ZZlHdjCVeIJPXvWp
         B7PQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=q7AAMz2T;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com. [2607:f8b0:4864:20::1132])
        by gmr-mx.google.com with ESMTPS id 1-20020a05620a078100b006a585be8750si575983qka.3.2022.05.28.12.13.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 12:13:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1132 as permitted sender) client-ip=2607:f8b0:4864:20::1132;
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-30c1c9b9b6cso11988547b3.13
        for <jailhouse-dev@googlegroups.com>; Sat, 28 May 2022 12:13:51 -0700 (PDT)
X-Received: by 2002:a0d:c101:0:b0:2ff:5824:e8a8 with SMTP id
 c1-20020a0dc101000000b002ff5824e8a8mr50277297ywd.413.1653765230767; Sat, 28
 May 2022 12:13:50 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com> <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
In-Reply-To: <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 28 May 2022 20:13:24 +0100
Message-ID: <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=q7AAMz2T;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1132 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

Hi Jan,

On Sat, May 28, 2022 at 3:41 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 28.05.22 15:22, Lad, Prabhakar wrote:
> > On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> If that should be the case, you could use the JTAG to "trace" how far
> >> you get: Add an infinite loop at some point the setup should get along,
> >> and then check with the debugger if PC points to that address and if EL2
> >> is active. With that, you could also check if the UART print-out is
> >> executed.
> >>
> > After tracing back I see it's looping infinitely somewhere in the
> > hypervisor.o file, below is the code where it repeatedly loops.
> >
> >     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
> >     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
> >     ffffc0209558:    6b00003f     cmp    w1, w0
> >     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
> >     .....
> >     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
> >
> > I haven't managed to find where exactly in the C file this is
> > happening yet. Any thoughts on what could be happening?
> >
>
> That's very likely
>
> while (entered_cpus < hypervisor_header.online_cpus)
>         cpu_relax();
>
Thanks for the pointer really appreciated.

> Did you configure more CPUs than there are in the system?
>
No I haven't, I've set it up as cpus = 0x3f for 6 CPUs (2xa57 +
4xa53). I don't know what was happening there when I removed the
infinite loop (which I used for break point) from entry.S that went
OK. There was also an issue with the debug uart driver which I've
fixed and able to get the prints now.

So now moving forward I am seeing "Unhandled data read"!

Looking at the address for Unhandled data read one belongs to GIC
(0xf102f00c) and the other one belongs to the debug uart (0xe6e88008).

The configuration for in the root cell is below:
       .debug_console = {
            .address = 0xe6e88000,
            .size = 0x40,
            .type = JAILHOUSE_CON_TYPE_SCIFA,
            .flags = JAILHOUSE_CON_ACCESS_MMIO |
                 JAILHOUSE_CON_REGDIST_4,
        },
        .platform_info = {
            .arm = {
                .gic_version = 2,
                .gicd_base = 0xf1010000,
                .gicc_base = 0xf1020000,
                .gich_base = 0xf1040000,
                .gicv_base = 0xf1060000,
                .maintenance_irq = 25,
            }
        },

Below is the log:
root@hihope-rzg2m:~# insmod jailhouse.ko
[   19.054972] jailhouse: loading out-of-tree module taints kernel.
root@hihope-rzg2m:~#
root@hihope-rzg2m:~#
root@hihope-rzg2m:~# jailhouse enable renesas-r8a774a1.cell
[   22.532474] entering.

Initializing Jailhouse hypervisor v0.12 (318-gcc2122a6-dirty) on CPU 5
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 53/4063, remap 0/131072
Initializing processors:
 CPU 5... OK
 CPU 1... OK
 CPU 3... OK
 CPU 0... OK
 CPU 2... OK
 CPU 4... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Page pool usage after late setup: mem 82/4063, remap 5/131072
Unhandled data read at 0xf102f00c(4)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffff8000104cc930   lr: ffff8000104cc9a4 spsr: 20000085     EL1
 sp: ffff800011323fc0  elr: ffff8000104cc930  esr: 24 1 1800007
 x0: 0000000000000000   x1: ffff80001101cb20   x2: ffff80062e813000
 x3: 0000000000000003   x4: 001ff1326ed0c676   x5: 00ffffffffffffff
 x6: 00000000108bece3   x7: 0000000000000000   x8: 0000000000000000
 x9: 0000000000000000  x10: 0000000000000000  x11: 0000000000000000
x12: 0000000000000000  x13: 0000000000000000  x14: 0000000000000000
x15: 0000000000000000  x16: 0000000000000000  x17: 0000000000000000
x18: 0000000000000000  x19: 0000000000000001  x20: ffff80001134f010
x21: ffff80001134f00c  x22: ffff80001117cc28  x23: ffff8000113dbde0
x24: ffff80001101cb38  x25: ffff800011320000  x26: ffff800011324000
x27: ffff0005c00c63c0  x28: ffff0005c00c63c0  x29: ffff800011323fc0

Parking CPU 3 (Cell: "Renesas HopeRun HiHope RZ/G2M")
Unhandled data read at 0xe6e88008(2)

FATAL: unhandled trap (exception class 0x24)
Cell state before exception:
 pc: ffff8000106341f0   lr: ffff800010632af8 spsr: 60000085     EL1
 sp: ffff80001131b420  elr: ffff8000106341f0  esr: 24 1 1410006
 x0: ffff8000113bd000   x1: ffff8000113bd008   x2: 0000000000000000
 x3: ffff800010bf9a58   x4: 0000000000000000   x5: 0000000000000064
 x6: ffff800010632a48   x7: 72646461206c6175   x8: 3030303020737365
 x9: 65636e6572656665  x10: 7472697620746120  x11: 696f70204c4c554e
x12: 726564207265746e  x13: 656c646e6168206f  x14: 206c656e72656b20
x15: ffff800011179948  x16: 0000000000000000  x17: 0000000000000000
x18: ffffffffffffffff  x19: ffff8000112da2f8  x20: ffff8000112da2f8
x21: 0000000000000000  x22: ffff8000112da2f8  x23: ffff800011292128
x24: 0000000000000000  x25: ffff8000112da2f8  x26: ffff8000112918b8
x27: 0000000000000080  x28: 0000000000000064  x29: ffff80001131b420

Parking CPU 2 (Cell: "Renesas HopeRun HiHope RZ/G2M")

Any thoughts why we are getting "Unhandled data read"?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_%3DO5w%40mail.gmail.com.
