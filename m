Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBYENZ2KAMGQE6VIP5OI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43d.google.com (mail-pf1-x43d.google.com [IPv6:2607:f8b0:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id 35939537165
	for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 16:44:50 +0200 (CEST)
Received: by mail-pf1-x43d.google.com with SMTP id m21-20020aa78a15000000b005182fda1b15sf4216283pfa.21
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 May 2022 07:44:50 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653835488; cv=pass;
        d=google.com; s=arc-20160816;
        b=iX+tN7vVPKFxS2qvccwCcyMe+r7N8J/Xz6IMiYPY2Kagag9O1IJsMVucDLuP5m5kYa
         TUGWQVKMeXWQk1YG3WVCJG7BKwkm8I1JkXV8HKPCBvgAYOX49Y273qxo3ZF+zYv8GEO0
         5KnIoOuxfOt0gwJdhJ1j+NDtcMR1f8Ss3i4uvry6k3SU+RpWTuVnxlkIOf2HG/nCOHyb
         jhRnlK8oxEbGCl473KR/fUEvWsYBvJTTLnF1OBie1DSjo5dUvR8Llsf3UwGnUc3tdGqu
         DbTDE8QunfUUdg9+jTOhdRh8LnFYh2UgsMWm1h8H0txTFgwAZ7sQZStrUShHIBEaLmp3
         FmXw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=nA4ao5uszVmV/PwchP1ISrTDhAs7wSJx98djn4TuKeA=;
        b=P+PC7iuAb3egkm55cW0j6A1q95TYyv0qISBogS0NZt/+0C1DG+xN7/H8PxP/NMhgNb
         NyN78alBJ2q9FZ+D/Nyekx4yWz431h064Zc4Tu6kIsDis5YlupOXCmdQLX+Ax9bpHkp8
         QCJQDghyL6sy3cyixstGz30/mo47dldmwpo3j3WaBYvRMdGUP4UZVd5Af8OLOHSEpxIc
         QnHD8qdpSCvdnYFmPTUOLgnXaE7Tds2MqG01eGmSwJMzrSRdEOFAHvc4855Y452VqDk9
         JlkF9GzuHZfOJ6SDAN/zTiW6lvM9F7BcUKmOth4Gh/z9YjcC/qWj9jc2cHFcmSPmYJHU
         TNSA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=b36AiQsR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nA4ao5uszVmV/PwchP1ISrTDhAs7wSJx98djn4TuKeA=;
        b=UDVzwkadFo7/t/Ag35LL8G18tGGrd/ZNU5BuZWK+tjepAU/aCQopNidUTpUy77dm6T
         reOTEsqsGFHHmNH2KIp/sNs3SnvnufLWgAo3JfiM1OUou7OAhxIADqb2WLZ3h49XnBgh
         Y7WRZSYrFQ0epodVFQY6iAsenkVE9L564fXCBDjNFExCfynDhYSGoIq3l4yTUj7nywLz
         8ObD3nAfYLGm41fveKRi1OnKrp2KEG5AkseDrosrqjcN9vBKpvhbI+QhWFpN8JnprQ04
         iIK9nWhd9nidQsimSDfQAIL64mSYx9TgNU7xhHTbzC5QHAutmdCCbeCQXdV4YG2JdZBS
         zjjA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nA4ao5uszVmV/PwchP1ISrTDhAs7wSJx98djn4TuKeA=;
        b=COCPRiecixvD8EekQPdhERuyoCDm5bxC6RyLHKxcNcLQU4KjazPzRWPVDnfj0WTqWg
         i7t5WvDE8YW+me083qaPW4kQ0gvxZp8dOPOHNq2Wn4Qv4f7TfL7VBQX4dkcJE9gsDD7u
         Vuzl2DNZnivX+iRSn3wpAiRkmxKEUxGByFtXBvNm3YhRYTYmwo0QSc1vmMTgK7BmX2Ys
         uiESubzz71DJCnnZ5X14NC1n8/ZNm1o9TxZ2tf1FlpyiUFrWuAFZ52SFGOSC+sHuTf2g
         iZfZBOZ1Ke2o+2qHwyQVDJiBFjSBs4EVqxwPEMzK4XMb3fHMSJcaR7VMIDn0RZfllG9+
         thRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nA4ao5uszVmV/PwchP1ISrTDhAs7wSJx98djn4TuKeA=;
        b=XE0DaHBHjdh5JxsQZWXsNH5/pPwpRDZBa6RyhaoF11TIf0PLEXQVSFJN+shZ+YB3ZE
         i190nfyMqvKkorcSR5MRXfxeSF3U8qW9Xum11Il5s9BM0sLiO/TMT5XKXUGmOwC2pAxm
         mgEsotQ6HtRCs1bTQuwXFMy547LAXHlZTDdoinWa6m5L3g+6tKwy91jLMfuIUUsydq7G
         2CNHAIb2dk1359LePW8cqFNXs5hGf9O6X+ZM2mI05SW14PDQ7huVXeFO0Fzx4ruaQZl2
         9BsTIj5r/9TtRuPYHtHAepDoX+zMM+2Ge7IL052ALNEaQQuGA/RA4+rToSJrOzOqi/ek
         zi/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531zhLCwo4EP+NS+YxHR3LXfasv53XKEmf4qwktOUKkP5rXqVB51
	Wn5R0/GGJtphuIf+XtvQPf0=
X-Google-Smtp-Source: ABdhPJxdIt4nTMNiMcitHNBIkk7C5l/vA5PNzYSP8lrOqsmSA5kwWEvJuVMMnd6XH8p6vcgGwfbkqg==
X-Received: by 2002:a05:6a00:a01:b0:51b:51d8:3c2a with SMTP id p1-20020a056a000a0100b0051b51d83c2amr594612pfh.68.1653835488598;
        Sun, 29 May 2022 07:44:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:de04:b0:1e0:5cbc:73a5 with SMTP id
 m4-20020a17090ade0400b001e05cbc73a5ls11261084pjv.2.canary-gmail; Sun, 29 May
 2022 07:44:47 -0700 (PDT)
X-Received: by 2002:a17:903:1111:b0:15f:7f0:bbf3 with SMTP id n17-20020a170903111100b0015f07f0bbf3mr51954576plh.12.1653835487566;
        Sun, 29 May 2022 07:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653835487; cv=none;
        d=google.com; s=arc-20160816;
        b=zP2oaGDPe7AFQuC9iYTG83f50cHTVAvjBl0f2JhMry2xcrLq/F/H3DMZcLe1oFSowa
         xD6LtWrJTNMEjK6NK8nn33ffHXeixssitTHgYM6q+L8Ui5NSCWs+3S9++xG/J9FeZGTW
         d38C9V5QZDaPsLBR55jto/2ETbtzQGoL7Qtl3IaKdjLcX6Wtv4UhyRQm6QH8KHcVnlaL
         Rz7VZ0Kq41gTRqjyuI26caK5kxlw2ZhkaHDyCRj+BUGLwQK2F1aUEvIKG+NyurSwSCKc
         4WLn1ip7LzjhqAIGxjrrmGBC2mDbV4iRssMnHTIpXnC/YtK6/MVyevrOWtxE8MkzVyJk
         qF9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CjqcRae147xLRsR5Xyx8vv/j7dz5WyLeaonRhEiWHAw=;
        b=SWO9QaiNZBTN4JudRw6bnfZH8tK3W71cqNLnFK7m9l7ka8JfC0zUbYcOAq+D4r/pVa
         uy/FEXBZ3ms7aQD7G8nzc3/l7ytI3YMvnnwGmnXKD/kwmaP+XE4M20ddx2B5c5In8c2o
         k/uk+MmPenro/3I1jk/Zb/nhuDva/0/GV67vlCvSy/NT6kWDmDAfwMdw1nagigHPCPCD
         wDxPbctkdte+b6C4eRxuhiJXhKFrUxZtW63hhSVRlmKfmciyjJ7oHCkrimwIuX01ijdb
         rJFb9fnf6i1kzFi+e1Ssk1Du4Y+U5VWD1ovK2C89WBV4/96R3TvQ1Ffy4uRHsQY9WoXU
         QaAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=b36AiQsR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com. [2607:f8b0:4864:20::b33])
        by gmr-mx.google.com with ESMTPS id x23-20020a056a000bd700b0050d44c10b11si368854pfu.3.2022.05.29.07.44.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 May 2022 07:44:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) client-ip=2607:f8b0:4864:20::b33;
Received: by mail-yb1-xb33.google.com with SMTP id v106so8344911ybi.0
        for <jailhouse-dev@googlegroups.com>; Sun, 29 May 2022 07:44:47 -0700 (PDT)
X-Received: by 2002:a25:4bc4:0:b0:655:b2db:484 with SMTP id
 y187-20020a254bc4000000b00655b2db0484mr19313589yba.431.1653835486791; Sun, 29
 May 2022 07:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com>
 <5172e723-49ce-a870-2066-d22f44115da3@siemens.com> <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
 <dd337a1c-d678-7c7b-d371-f8bd2b019c28@web.de> <CA+V-a8uMOW2PopUbMhaOmCs-RZWqzOJcC3zXOToF2pWSs_=O5w@mail.gmail.com>
 <1a407933-180e-48fa-760c-1c90e159eb2f@web.de> <CA+V-a8sFJc+uFp+n6G+fUFNX1u6oDwbG4Ge=+2yrhoh8FQ-UfQ@mail.gmail.com>
 <69a0ae1d-1ee9-e99b-f190-d534ce86c227@web.de>
In-Reply-To: <69a0ae1d-1ee9-e99b-f190-d534ce86c227@web.de>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 29 May 2022 15:44:20 +0100
Message-ID: <CA+V-a8vhKb7ic998w275ajCjXSC0QmsnutAkDK-csJmP9DYzrg@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@web.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=b36AiQsR;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Sun, May 29, 2022 at 2:39 PM Jan Kiszka <jan.kiszka@web.de> wrote:
>
> On 29.05.22 12:53, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Sun, May 29, 2022 at 9:35 AM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>
> >> On 28.05.22 21:13, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Sat, May 28, 2022 at 3:41 PM Jan Kiszka <jan.kiszka@web.de> wrote:
> >>>>
> >>>> On 28.05.22 15:22, Lad, Prabhakar wrote:
> >>>>> On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> If that should be the case, you could use the JTAG to "trace" how far
> >>>>>> you get: Add an infinite loop at some point the setup should get along,
> >>>>>> and then check with the debugger if PC points to that address and if EL2
> >>>>>> is active. With that, you could also check if the UART print-out is
> >>>>>> executed.
> >>>>>>
> >>>>> After tracing back I see it's looping infinitely somewhere in the
> >>>>> hypervisor.o file, below is the code where it repeatedly loops.
> >>>>>
> >>>>>     ffffc0209550:    b9400680     ldr    w0, [x20, #4]
> >>>>>     ffffc0209554:    b9403481     ldr    w1, [x4, #52]
> >>>>>     ffffc0209558:    6b00003f     cmp    w1, w0
> >>>>>     ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
> >>>>>     .....
> >>>>>     ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
> >>>>>
> >>>>> I haven't managed to find where exactly in the C file this is
> >>>>> happening yet. Any thoughts on what could be happening?
> >>>>>
> >>>>
> >>>> That's very likely
> >>>>
> >>>> while (entered_cpus < hypervisor_header.online_cpus)
> >>>>         cpu_relax();
> >>>>
> >>> Thanks for the pointer really appreciated.
> >>>
> >>>> Did you configure more CPUs than there are in the system?
> >>>>
> >>> No I haven't, I've set it up as cpus = 0x3f for 6 CPUs (2xa57 +
> >>> 4xa53). I don't know what was happening there when I removed the
> >>> infinite loop (which I used for break point) from entry.S that went
> >>> OK. There was also an issue with the debug uart driver which I've
> >>> fixed and able to get the prints now.
> >>>
> >>> So now moving forward I am seeing "Unhandled data read"!
> >>>
> >>> Looking at the address for Unhandled data read one belongs to GIC
> >>> (0xf102f00c) and the other one belongs to the debug uart (0xe6e88008).
> >>
> >> Regarding GICC access: Try setting gicc_base to 0xf102f000 in the root
> >> cell config.
> >>
> > Setting gicc_base to 0xf102f000 has solved the issue, I no longer get
> > unhandled data reads now.
> >
> >> Regarding the UART: Do you pass that address through to the root cell as
> >> well? It's generally fine to allow both hypervisor and one cell to
> >> access the UART in parallel. Otherwise, disable UART usage by the root
> >> cell prior to enabling Jailhouse.
> >>
> > No, I don't pass the UART address to the root cell as part of
> > mem_regions. I just have it as part of the header config as below:
> >
> >         .debug_console = {
> >             .address = 0xe6e88000,
> >             .size = 0x40,
> >             .type = JAILHOUSE_CON_TYPE_SCIFA,
> >             .flags = JAILHOUSE_CON_ACCESS_MMIO |
> >                  JAILHOUSE_CON_REGDIST_4,
> >         },
> >
> > By disabling the UART usage by the root cell did you mean to use
> > JAILHOUSE_CON_TYPE_NONE? I tried adding JAILHOUSE_CON_TYPE_NONE but I
>
> No, I meant
>
>  - stop using the UART as kernel console
>  - stop running a getty on the UART (the latter happens automatically
>    with systemd when doing the former)
>
Right, I'll give that a shot, by disabling after logging into (using
systemd) and then ssh the board to run the jailhouse enable command.

> > don't get anything on the console after enabling the root cell. I even
> > tried removing the entire debug_console{} from the root cell config
> > but still I don't see any output on console.
> >
> > If I update the size to 0x1000 as below and also include it as part of
> > mem_regions, I get to a state where I see the message "The Jailhouse
> > is opening" but the console seems to be frozen.
>
> Sorry, I missed one bit in the gic configuration pattern on some arm64
> targets (scan configs/arm64): you also need to set gicv_base to
> 0xf106f000, then it will work (crossing fingers...).
>
Thanks, after updating gicv_base to 0xf106f000 I get an "forbidden
access" error, looking at the address it belongs to ethernet
"e6800304" and this is configured in the memory regions

        /* AVB */ {
            .phys_start = 0xe6800000,
            .virt_start = 0xe6800000,
            .size = 0x800,
            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                JAILHOUSE_MEM_IO,
        },


root@hihope-rzg2m:~# ./hyp.sh
Reading configuration set:
  Root cell:     Renesas HopeRun HiHope RZ/G2M (renesas-r8a774a1.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing resource interceptions for architecture arm64: None
root@hihope-rzg2m:~#
root@hihope-rzg2m:~#
root@hihope-rzg2m:~# jailhouse enable renesas-r8a774a1.cell
[   26.483603] entering.

Initializing Jailhouse hypervisor v0.12 (318-gcc2122a6-dirty) on CPU 1
Code location: 0x0000ffffc0200800
Page pool usage after early setup: mem 53/4063, remap 0/131072
Initializing processors:
 CPU 1... OK
 CPU 3... OK
 CPU 4... OK
 CPU 0... OK
 CPU 2... OK
 CPU 5... OK
Initializing unit: irqchip
Initializing unit: ARM SMMU v3
Initializing unit: ARM SMMU
Initializing unit: PVU IOMMU
Initializing unit: PCI
Page pool usage after late setup: mem 83/4063, remap 5/131072
:ctivFATAL: Inval[i d   M2M6I.O5 3r3e3a6d3,]  aedxdirtets.s
  e6800304, size: 4

FATAL: forbidden access (exception class 0x24)
Cell state before exception:
 pc: ffff8000107862e4   lr: ffff8000107864e4 spsr: 60000085     EL1
 sp: ffff800011dcae20  elr: ffff8000107862e4  esr: 24 1 1800006
 x0: ffff8000113ed304   x1: 00000000000002c0   x2: 30e3720f2aa97500
 x3: 000000000000003f   x4: 0000000000000002   x5: 00000000b7905800
 x6: ffff000077905906   x7: 2c00000016000000   x8: 0050147b02070001
 x9: 4e4f4f3300000000  x10: e70b6a912c4534e6  x11: 0050b18400e5e36c
x12: 0050c09b8291345d  x13: 09000000f1423a46  x14: 1a01100002000000
x15: 2c00000016000000  x16: 0000000000000002  x17: 0000000000000000
x18: 0000000000000000  x19: 0000000000000001  x20: 0000000000000000
x21: ffff0005c118a840  x22: ffff0005c118ab48  x23: ffff0005c29c84fe
x24: ffff0005c118a000  x25: 0000000000000106  x26: ffff8000113fd048
x27: ffff0005c2be5cc8  x28: ffff0005c118a000  x29: ffff800011dcae20

Parking CPU 3 (Cell: "Renesas HopeRun HiHope RZ/G2M")
[   26.577661] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[   26.622512] Unable to handle kernel NULL pointer dereference at
virtual address 0000000000000000
[   26.622521] Mem abort info:
[   26.622525]   ESR = 0x86000004
[   26.622531]   EC = 0x21: IABT (current EL), IL = 32 bits
[   26.622535]   SET = 0, FnV = 0
[   26.622539]   EA = 0, S1PTW = 0
[   26.622547] user pgtable: 4k pages, 48-bit VAs, pgdp=00000006009da000
[   26.622551] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[   26.622569] Internal error: Oops: 86000004 [#1] PREEMPT SMP
[   26.622574] Modules linked in: jailhouse(O)
[   26.622595] CPU: 3 PID: 247 Comm: systemd-journal Tainted: G
   O      5.10.31+ #34
[   26.622600] Hardware name: HopeRun HiHope RZ/G2M with sub board (DT)
[   26.622609] pstate: 60000085 (nZCv daIf -PAN -UAO -TCO BTYPE=--)
[   26.622623] pc : 0x0
[   26.622642] lr : ravb_start_xmit+0x40c/0x680
[   26.622646] sp : ffff800011dcae20
[   26.622650] x29: ffff800011dcae20 x28: ffff0005c118a000
[   26.622660] x27: ffff0005c2be5cc8 x26: ffff8000113fd048
[   26.622670] x25: 0000000000000106 x24: ffff0005c118a000
[   26.622681] x23: ffff0005c29c84fe x22: ffff0005c118ab48
[   26.622690] x21: ffff0005c118a840 x20: 0000000000000000
[   26.622699] x19: 0000000000000001 x18: 0000000000000000
[   26.622709] x17: 0000000000000000 x16: 0000000000000002
[   26.622718] x15: 2c00000016000000 x14: 1a01100002000000
[   26.622728] x13: 09000000f1423a46 x12: 0050c09b8291345d
[   26.622737] x11: 0050b18400e5e36c x10: e70b6a912c4534e6
[   26.622747] x9 : 4e4f4f3300000000 x8 : 0050147b02070001
[   26.622757] x7 : 2c00000016000000 x6 : ffff000077905906
[   26.622766] x5 : 00000000b7905800 x4 : 0000000000000002
[   26.622775] x3 : 000000000000003f x2 : 30e3720f2aa97500
[   26.622784] x1 : 00000000000002c0 x0 : ffff8000113ed304
[   26.622795] Call trace:
[   26.622802]  0x0
[   26.622814]  dev_hard_start_xmit+0xe8/0x188
[   26.622826]  sch_direct_xmit+0x12c/0x318
[   26.622834]  __qdisc_run+0x11c/0x5b8
[   26.622841]  __dev_queue_xmit+0x1e0/0x700
[   26.622847]  dev_queue_xmit+0x14/0x20
[   26.622860]  ip_finish_output2+0x260/0x5d0
[   26.622868]  __ip_finish_output+0x194/0x238
[   26.622876]  ip_output+0x104/0x1b0
[   26.622883]  ip_local_out+0x48/0x60
[   26.622891]  __ip_queue_xmit+0x124/0x398
[   26.622899]  ip_queue_xmit+0x14/0x20
[   26.622907]  __tcp_transmit_skb+0x4e8/0xb38
[   26.622913]  tcp_write_xmit+0x228/0x1090
[   26.622919]  __tcp_push_pending_frames+0x3c/0xd0
[   26.622928]  tcp_push+0xd8/0x180
[   26.622935]  tcp_sendmsg_locked+0x998/0xc10
[   26.622942]  tcp_sendmsg+0x38/0x60
[   26.622953]  inet_sendmsg+0x44/0x70
[   26.622964]  sock_sendmsg+0x1c/0x38
[   26.622977]  xprt_sock_sendmsg+0xf8/0x300
[   26.622987]  xs_tcp_send_request+0xbc/0x1d8
[   26.622994]  xprt_transmit+0xac/0x2e8
[   26.623001]  call_transmit+0x98/0xb0
[   26.623009]  __rpc_execute+0x80/0x390
[   26.623015]  rpc_execute+0x8c/0xb0
[   26.623023]  rpc_run_task+0x170/0x1d8
[   26.623035]  nfs4_call_sync_custom+0x14/0x40
[   26.623041]  nfs4_do_call_sync+0x68/0x90
[   26.623050]  _nfs4_proc_getattr+0xd0/0x100
[   26.623061]  nfs4_proc_getattr+0x70/0xb8
[   26.623072]  __nfs_revalidate_inode+0x148/0x288
[   26.623081]  nfs_revalidate_mapping+0x218/0x280
[   26.623089]  nfs_get_link+0x28/0x170
[   26.623101]  step_into+0x538/0x690
[   26.623108]  walk_component+0x70/0x1d0
[   26.623114]  link_path_walk.part.48+0x294/0x3b8
[   26.623120]  path_parentat+0x48/0xb0
[   26.623126]  filename_parentat+0x94/0x170
[   26.623132]  filename_create+0x4c/0x178
[   26.623138]  do_mkdirat+0x68/0x118
[   26.623144]  __arm64_sys_mkdirat+0x20/0x30
[   26.623157]  el0_svc_common.constprop.3+0x68/0x170
[   26.623165]  do_el0_svc+0x24/0x90
[   26.623173]  el0_svc+0x14/0x20
[   26.623179]  el0_sync_handler+0x90/0xb8
[   26.623187]  el0_sync+0x158/0x180
[   26.623203] Code: bad PC value
[   26.623225] ---[ end trace 87851f23e735f09b ]---
[   26.623232] Kernel panic - not syncing: Oops: Fatal exception in interrupt
[   26.623240] SMP: stopping secondary CPUs
[   26.623372] Kernel Offset: disabled
[   26.623380] CPU features: 0x0040022,21002004
[   26.623384] Memory Limit: none
[   27.001277] ---[ end Kernel panic - not syncing: Oops: Fatal
exception in interrupt ]---

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vhKb7ic998w275ajCjXSC0QmsnutAkDK-csJmP9DYzrg%40mail.gmail.com.
