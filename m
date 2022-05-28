Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBI6EZCKAMGQEKRBW5RA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113c.google.com (mail-yw1-x113c.google.com [IPv6:2607:f8b0:4864:20::113c])
	by mail.lfdr.de (Postfix) with ESMTPS id 69395536D16
	for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 15:22:45 +0200 (CEST)
Received: by mail-yw1-x113c.google.com with SMTP id 00721157ae682-2f4e17a5809sf60812237b3.2
        for <lists+jailhouse-dev@lfdr.de>; Sat, 28 May 2022 06:22:45 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1653744164; cv=pass;
        d=google.com; s=arc-20160816;
        b=eJLt+YXcWJW0qSiajbs9Nb9lwDL6K/ixZpDf0fTm2j/CbHGVCRbrgnwqVX1dq/+YWn
         V13fZLk19r+09Mdwk6SCG5mxFYaGEDFMOBFKpzaYfhzMRYcVGQFRKAu9L8QTLiC22ixD
         HEKI81vdG+b7337Qg9xG83+wcjxX2opxRkD4z/ZbrHIShsri9PxN57nMAVkJ8uAUQs6n
         6B671CWObZD6JpYf3pC8hFpfauyT5gr0M+TDEc0qwed3CDpSt/my279CJJ11I4LuXxJG
         a+WEYfCs27CrC5vaszNqtNlMx2WJdTrNXFbQCxvKbncu3ouMtqIwrEEnkQ/M4+UifDZP
         q61Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=jqjy4km1lOw3/EYGUa7cnmNg98Y9yX/L/ryC6+gFlkQ=;
        b=M0QCxniTH9p/nrxqmCh+1nRajaaQ20HWl2spho0TF7TGH2BIW0TSayFaS8PxXqtGzH
         ZB7uP04bfiroQXRSOJwOBkUYWwXaRWAzD2+NSKemI//qDYoI8drsVONfuh76QIvmegqz
         J4viy2d+p8VpipViBanVZXKHoKvsMZZRWPua0olGde0cAWDS+ZWrLB31l6yv20SETWDe
         GLxkZ/z6AM0npHpY020fsdG1ZuOGf+6WhQTNJcWvrDh8EJ8Pbqxi0bC6GK0CYKv303FY
         dku46EH3G68Lv03p9LKkG9GzzRHQNDdva2iFfkqhoBIWQV8r71zx6xGJK1HcONt59/wB
         5CQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YeGA4WtR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jqjy4km1lOw3/EYGUa7cnmNg98Y9yX/L/ryC6+gFlkQ=;
        b=hPVJMM+IWGh0FzL4RLBqrMG6QtSR8lS8VtXDJTEwH+4ZwifHhZS8yy7BY3doosLl26
         Gnft2pcXA/vljEy7wyuoTwfdN1h7Q3TBhyUaf70uMfiIa+qdaxuLwjBy0lclWkjwRSgd
         XlRQxX6ScWr8M9qy0PSex+8lv41XG/xSTAXeFxFJ8b0CEVruoW01PEmJA/KsnT7c4vqU
         hJ2ZOdmSWhiYQ8PDdksjCc6Giw1OJ2Pe3C9FaTBq24KbT0Cc0Pg5L4FLCrC08sca58la
         3/1zUHI02Xq0BTh4I/zUgHc9w4V++vVYWt1ephGBnyPC1A+BlH72bcogaQw3/PZkCx8m
         NzgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jqjy4km1lOw3/EYGUa7cnmNg98Y9yX/L/ryC6+gFlkQ=;
        b=iaXYNWNQgqhdMQS17JjKvVLU/3DW0JYdXSHZrMsvGNBFZ3FsdzLmAVUby2WS+xe8Gj
         mxIunS9tLXyp1TNUJJb6wLCNHQduhEMFBI3cASNxMR4k13ABBXZGxMeqPbNDXxGEfDlI
         BygDA7OUuSqEB7CT7j+gHM0R7vEwuC+GevruW65uBYUB9UJ5gtWfPYmQLc3DGN06JEhU
         dPE8m10o5wsnFrPSDxFnaAdM4NihPcSIXbtlpYvjnJxrDt6c2pM4myTmlDmpmPAH0gAR
         UKM9tIIRd0/CAkugDeqqHIVWpC/xwW16U6FXBS/MWdHhVxgbnnIPtFd+chm4fEPteKDW
         dZdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jqjy4km1lOw3/EYGUa7cnmNg98Y9yX/L/ryC6+gFlkQ=;
        b=Hp+zPMHAq0PKaFNPB3GslPB2zywiA/nfIyfq/UwWK4CY1/D+cfziXuw2ZbNBbvifSz
         +PxPYboB4pc/GxxkpNTicwP/ylAEjFfEDCHHTQoVooX2TJDj67tYht0ex7bxQOCQsRL7
         ynZ+hSjIvXS1xhJj06lMyy04XcOFywIVh38ZAT3jUZJJMSjd3bMU4nDN3lfTPmnPMXet
         11U9bQ5XsciUVy5NWxQS4LhdahN7foiC2qLCX8ATRFUeoE2/EtROVP9X0K8eglviOXCj
         BqT/aOpLgIQ6DRL8Mnba5ZMDigMCwQDyGAk4jo5o11zsTOjmrTXqM4UEjerZmuA/YYN2
         a9JA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530eQciDRLtRZT5WaDNLkIQgdCKDxeBr3SoDyE78ndwpkpCrxjTD
	uPzxcVfWUmXBRrjUVY+69ew=
X-Google-Smtp-Source: ABdhPJwjrn5IflQBrY0I7/s2WHuDNQGS1siwHx7VQD4z871Qq0Cj0h1lXRtUxKHImjkFiBvp5TX9VQ==
X-Received: by 2002:a05:6902:110a:b0:64f:4e41:5c81 with SMTP id o10-20020a056902110a00b0064f4e415c81mr41984795ybu.511.1653744164188;
        Sat, 28 May 2022 06:22:44 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:ac53:0:b0:65b:65c8:7033 with SMTP id r19-20020a25ac53000000b0065b65c87033ls2337807ybd.10.gmail;
 Sat, 28 May 2022 06:22:43 -0700 (PDT)
X-Received: by 2002:a25:168b:0:b0:64a:54ba:e88e with SMTP id 133-20020a25168b000000b0064a54bae88emr41143947ybw.17.1653744163291;
        Sat, 28 May 2022 06:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653744163; cv=none;
        d=google.com; s=arc-20160816;
        b=Im8raKQT8EAPTAIdiIEi+gfeBJ76UKNGOu32E+ptRRTzNZavO7TOMYISJ8aS5mGRwu
         3RSzKSGNsamAS5gCrhe8GUuqnxLIiFiDr/vjP7f0fScp8+mjsFKgZVDiPvUogArnCOWL
         UunApk+JaOE9N7tFRgWWgVZ1ouFoetyNxSfee2/boC7gYRWtNnfoiijeotZqnLF8cS2R
         OHp6COkUIQd7r8F0kbeMqGubOnAw3CFCEvV+ShHv472sYRpJgMRfW2iad5mAKWacDm9z
         4IyE69OR0FXEVaNr+UI53ackBeGHLc8oIXyi7bzBGQ+ZV3Y7sCfFIL2wbWQeBLLPFCCt
         H1dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a/6uCUDW5dQtbLmcVAwF00N8MqeX7+YZW/XeAzpwtuM=;
        b=xbadI0oVQPfpiormZ0jJx+QWVQ3tgAFszKb3bjMj2dYAeSMLw8JgZkrtU0ONE8qaB2
         ViOTqQDefqCb9hZ1HtBoN25AsRnuRCwi9Mv4Y8RQfbn8K1/RGpVCOoN1+78YPlzHxjwq
         hg3OH+Y7NKjeHtJwgFGSqkc1eqSWMYmaoJGAGlCpNRn180O6kS2tfJzqKuFfDrb6RgXE
         XNLz2/v2WFUncoCp8uAaX21Ws2j8dTqBqckf311fKstSUwQVnbpx7bavm/13WAeyVyxo
         k3hmS9nvnkicmFGfi3MPb+fzITjXta0sAKIhZU8wfIa96CrqbhLPy8nQz4Lb2MdtgJzC
         r33g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=YeGA4WtR;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com. [2607:f8b0:4864:20::b30])
        by gmr-mx.google.com with ESMTPS id y66-20020a25dc45000000b0065c507e98c6si26962ybe.0.2022.05.28.06.22.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 28 May 2022 06:22:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) client-ip=2607:f8b0:4864:20::b30;
Received: by mail-yb1-xb30.google.com with SMTP id v26so12190775ybd.2
        for <jailhouse-dev@googlegroups.com>; Sat, 28 May 2022 06:22:43 -0700 (PDT)
X-Received: by 2002:a5b:246:0:b0:619:5651:3907 with SMTP id
 g6-20020a5b0246000000b0061956513907mr45637884ybp.190.1653744162988; Sat, 28
 May 2022 06:22:42 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <e1b5e28e-f6a7-b603-95f3-8a72f0405d7f@siemens.com> <CA+V-a8t9brsw1fu_x9ou7uHOYxhO8AjuKiLfW+1MJ6tw=A=f=A@mail.gmail.com>
 <8e895901-cd60-9696-935a-293245586a77@siemens.com> <CA+V-a8tLSnKSRVOGwHmNUs+y58QoiDazwBA9rrQ1yGXWcFLVRg@mail.gmail.com>
 <234b1a2d-ea25-e38c-5053-eea15f57b933@siemens.com> <CA+V-a8vUAEZUkbhhHEHKHzf-OhXqnfMkojP5o0nSEtgBdSbRQw@mail.gmail.com>
 <35cddc35-a563-ca93-8e29-b9ae06844030@siemens.com> <CA+V-a8uGOP49BWzY1bwprzLzhUXFjfqW6yD1c-LZN7i94mrzbQ@mail.gmail.com>
 <a87eb794-7dc1-f447-c13a-de600a48d59e@siemens.com> <CA+V-a8uBuBZb5z-HvuLF96jTtKLLKCt8nHmqKt4jtX9ninJAtw@mail.gmail.com>
 <eafaaed1-604f-569b-47f5-232b01cfcee5@siemens.com> <CA+V-a8vshtRo3Kot2xCVV=L+kySoP1XkOrc3U8tWXxLeCCb4Ow@mail.gmail.com>
 <385f8761-8d70-d0c4-f903-9adadb3c9a90@siemens.com> <CA+V-a8uGNUis=XLwewkePUTUDrJp0QBfgkaOMf=8KvPJh4pW_A@mail.gmail.com>
 <CA+V-a8uA+y-p5GmYavLpc6s1O-TJiRGSkpRHM4-dEA=XsqU_mA@mail.gmail.com> <5172e723-49ce-a870-2066-d22f44115da3@siemens.com>
In-Reply-To: <5172e723-49ce-a870-2066-d22f44115da3@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sat, 28 May 2022 14:22:16 +0100
Message-ID: <CA+V-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=YeGA4WtR;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Fri, May 27, 2022 at 6:07 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 26.05.22 17:48, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Tue, May 24, 2022 at 12:55 PM Lad, Prabhakar
> > <prabhakar.csengg@gmail.com> wrote:
> >>
> >> On Mon, May 23, 2022 at 4:13 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>
> >>> On 23.05.22 15:55, Lad, Prabhakar wrote:
> >>>> Hi Jan,
> >>>>
> >>>> On Fri, May 20, 2022 at 7:08 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>
> >>>>> On 19.05.22 15:23, Lad, Prabhakar wrote:
> >>>>>> Hi Jan,
> >>>>>>
> >>>>>> On Thu, May 19, 2022 at 12:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>
> >>>>>>> On 19.05.22 11:44, Lad, Prabhakar wrote:
> >>>>>>>> On Thu, May 19, 2022 at 6:30 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>> Forgot: that cannot work. The call of arm_dcaches_flush will overwrite
> >>>>>>>>> lr, thus the second ret will only return to where the first ret jumped
> >>>>>>>>> to - endless loop. You would have to restore lr (x30) from x17 in
> >>>>>>>>> arch_entry first:
> >>>>>>>>>
> >>>>>>>>> mov x30, x17
> >>>>>>>>> ret
> >>>>>>>>>
> >>>>>>>> That did the trick thanks!
> >>>>>>>>
> >>>>>>>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> >>>>>>>> index a9cabf7f..7b340bd1 100644
> >>>>>>>> --- a/hypervisor/arch/arm64/entry.S
> >>>>>>>> +++ b/hypervisor/arch/arm64/entry.S
> >>>>>>>> @@ -109,6 +109,8 @@ arch_entry:
> >>>>>>>>         mov     x0, #LINUX_HVC_SET_VECTORS_LEGACY
> >>>>>>>>  1:
> >>>>>>>>         hvc     #0
> >>>>>>>> +       mov x30, x17
> >>>>>>>> +       ret
> >>>>>>>>
> >>>>>>>>         hvc     #0      /* bootstrap vectors enter EL2 at el2_entry */
> >>>>>>>>         b       .       /* we don't expect to return here */
> >>>>>>>>
> >>>>>>>>
> >>>>>>>> With the above diff I do get the below:
> >>>>>>>>
> >>>>>>>> [   42.980805] jailhouse: loading out-of-tree module taints kernel.
> >>>>>>>> Reading configuration set:
> >>>>>>>>   Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
> >>>>>>>> Overlapping memory regions inside cell: None
> >>>>>>>> Overlapping memory regions with hypervisor: None
> >>>>>>>> Missing resource interceptions for architecture arm64: None
> >>>>>>>> [   46.582588] obcode @arm_dcaches_flush: d53b0024
> >>>>>>>> [   46.582616] obcode @arm_dcaches_flush: d53b0024
> >>>>>>>> [   46.611311] The Jailhouse is opening.
> >>>>>>>>
> >>>>>>>> So it looks like something to do with the debug console. This has to
> >>>>>>>> be poked in the dark or any easy way to debug?
> >>>>>>>
> >>>>>>> Well, we do not yet know what goes wrong. We do know that we can call
> >>>>>>> into the hyp take-over stub and register Jailhouse with it. We do not
> >>>>>>> know if we will then end up in Jailhouse in hyp mode and just lack
> >>>>>>> console output or if we crash on entry already.
> >>>>>>>
> >>>>>> Right agreed.
> >>>>>>
> >>>>>>> To move the uart console out of the picture: Did you already check if
> >>>>>>> the driver you select in the Jailhouse config is actually one that
> >>>>>>> should support the UART on your board? Next is to double check if poking
> >>>>>> The UART on this platform is almost identical to
> >>>>>> JAILHOUSE_CON_TYPE_SCIFA type, but with some differences which I have
> >>>>>> patched to work on this platform.
> >>>>>>
> >>>>>>> registers in the way the Jailhouse driver will do at the addresses you
> >>>>>>> configured will work: Pull the code into the kernel module or even into
> >>>>>>> a userspace application with /dev/mem raw register access and try out if
> >>>>>>> that works in a "safe" environment (without hypervisor mode).
> >>>>>>>
> >>>>>> Sure will give that a shot, any pointers on doing this from userspace?
> >>>>>>
> >>>>>
> >>>>> Something like this may help if you do that the first time:
> >>>>> https://bakhi.github.io/devmem/
> >>>>>
> >>>> Thanks for the pointer.
> >>>> I have tried reading/writing from the hypervisor location and that
> >>>> goes all OK.
> >>>
> >>> Means, you were able to generate output on the UART. Hmm, would have
> >>> been too easy.
> >>>
> >> No I meant I was able to read/write into the hypervisor memory which
> >> is reserved in DTS.
> >>
> >>>> To avoid any issue related to debug UART is there any way
> >>>> I could test this prior to enabling?
> >>>
> >>> Not without extra measures: Without JAILHOUSE_BORROW_ROOT_PT, which
> >>> applies to arm64, the driver will not map the physical UART page. That
> >>> only happens in init_bootstrap_pt which is run after jumping to EL2. So,
> >>> we the jump goes wrong, you cannot find out where you are.
> >>>
> >> I see. Just to confirm it's not the debug UART the watchdog is enabled
> >> in Linux and I see the platform reboots after 60 seconds, which is
> >> hinting we are seeing a kernel freeze.
> >>
> >> Just a fyi I tried the queues/jailhouse branch from [0] and still
> >> seeing the same issue.
> >>
> >>> Do you have the chance to get hold of some jtag to find out where the
> >>> CPUs are?
> >>>
> >
> > X0   FFFF00063F7ECD88  X16                 0  ^S+ ^Stack_________+
> > X1                  0  X17                 0
> > X2                  0  X18  FFFFFFFFFFFFFFFF
> > X3   FFFF8000112870E8  X19                80
> > X4   FFFF00063F7ECD80  X20  FFFF800011179000
> > X5   FFFF800011179A48  X21  FFFF80001130BE70
> > X6   FFFF80001101E000  X22  FFFF800010DFDED8
> > X7   FFFF800011179000  X23          86000004
> > X8   FFFF00063F7ECD80  X24  FFFF80001101CB38
> > X9                  0  X25  FFFF800011308000
> > X10          00040000  X26  FFFF80001130C000
> > X11                 0  X27  FFFF800011182A40
> > X12                 0  X28  FFFF800011182A40
> > X13  FFFFFFFFFFFE0000  X29  FFFF80001130BC40
> > X14  FFFF800011192008  X30  FFFF800010B3B464
> > X15  FFFF800011192048  PC   FFFF8000100D9F78
> > --------------------------------------------
> > CPSR     80000085   N N  I I  SS  _
> > EL1h                Z _  F _  IL  _
> > nsec                C _  A _
> >                     V _  D _
> > --------------------------------------------
> > Current ELx:           SP   FFFF80001130BC40
> >                        ELR                 0
> >                        SPSR         20000085
> > --------------------------------------------
> > EL0:                   EL1:
> > SP   FFFF800011182A40  SP   FFFF80001130BC40
> >                        ELR                 0
> >                        SPSR         20000085
> >
> > EL2:                   EL3:
> > SP   0000FF0000011000  SP           4400A500
> > ELR  FFFF8000104CC8A8  ELR  0000FFFFC02064AC
> > SPSR         20000085  SPSR         200003C9
> > --------------------------------------------
> > SPSR_ABT            0  SPSR_SVC     20000085
> > SPSR_IRQ            0  SPSR_HYP     20000085
> > SPSR_FIQ            0
> > SPSR_UND            0  ELR_HYP      104CC8A8
> >
> >
> > Above is the CPU state, when the kernel freezes. Any hints on what
> > might have happened?
>
> Can you correlate the PC value with the hypervisor disassembly? Or are
> we actually back in Linux? Current SP == EL1 SP...
>
> If that should be the case, you could use the JTAG to "trace" how far
> you get: Add an infinite loop at some point the setup should get along,
> and then check with the debugger if PC points to that address and if EL2
> is active. With that, you could also check if the UART print-out is
> executed.
>
After tracing back I see it's looping infinitely somewhere in the
hypervisor.o file, below is the code where it repeatedly loops.

    ffffc0209550:    b9400680     ldr    w0, [x20, #4]
    ffffc0209554:    b9403481     ldr    w1, [x4, #52]
    ffffc0209558:    6b00003f     cmp    w1, w0
    ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
    .....
    ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>

I haven't managed to find where exactly in the C file this is
happening yet. Any thoughts on what could be happening?


Below is the snippet of dissembled code:
=================================>>
0000ffffc02094f8 <entry>:
    ffffc02094f8:    a9b87bfd     stp    x29, x30, [sp, #-128]!
    ffffc02094fc:    910003fd     mov    x29, sp
    ffffc0209500:    a90153f3     stp    x19, x20, [sp, #16]
    ffffc0209504:    a9025bf5     stp    x21, x22, [sp, #32]
    ffffc0209508:    2a0003f6     mov    w22, w0
    ffffc020950c:    a90363f7     stp    x23, x24, [sp, #48]
    ffffc0209510:    aa0103f5     mov    x21, x1
    ffffc0209514:    a9046bf9     stp    x25, x26, [sp, #64]
    ffffc0209518:    f9002bfb     str    x27, [sp, #80]
    ffffc020951c:    b9300020     str    w0, [x1, #12288]
    ffffc0209520:    97ffffe7     bl    ffffc02094bc <spin_lock.constprop.1>
    ffffc0209524:    d5033bbf     dmb    ish
    ffffc0209528:    b0000093     adrp    x19, ffffc021a000 <init_lock>
    ffffc020952c:    91000274     add    x20, x19, #0x0
    ffffc0209530:    b9400680     ldr    w0, [x20, #4]
    ffffc0209534:    11000400     add    w0, w0, #0x1
    ffffc0209538:    b9000680     str    w0, [x20, #4]
    ffffc020953c:    79400260     ldrh    w0, [x19]
    ffffc0209540:    11000400     add    w0, w0, #0x1
    ffffc0209544:    489ffe80     stlrh    w0, [x20]
    ffffc0209548:    f0ffffb8     adrp    x24, ffffc0200000 <hypervisor_header>
    ffffc020954c:    91000304     add    x4, x24, #0x0
    ffffc0209550:    b9400680     ldr    w0, [x20, #4]
                             ==== >>
    ffffc0209554:    b9403481     ldr    w1, [x4, #52]
                             ====>> It loops here.
    ffffc0209558:    6b00003f     cmp    w1, w0
                              ====>>
    ffffc020955c:    540013a8     b.hi    ffffc02097d0 <entry+0x2d8>
// b.pmore  ====>>
    ffffc0209560:    97ffffd7     bl    ffffc02094bc <spin_lock.constprop.1>
    ffffc0209564:    b0000042     adrp    x2, ffffc0212000 <uart_hscif_ops>
    ffffc0209568:    b9419840     ldr    w0, [x2, #408]
    ffffc020956c:    3100041f     cmn    w0, #0x1

......
.....
    ffffc02097b4:    35001300     cbnz    w0, ffffc0209a14 <entry+0x51c>
    ffffc02097b8:    340012f7     cbz    w23, ffffc0209a14 <entry+0x51c>
    ffffc02097bc:    b00000b4     adrp    x20, ffffc021e000 <root_cell>
    ffffc02097c0:    52800015     mov    w21, #0x0                       // #0
    ffffc02097c4:    12800000     mov    w0, #0xffffffff                // #-1
    ffffc02097c8:    91000299     add    x25, x20, #0x0
    ffffc02097cc:    1400002a     b    ffffc0209874 <entry+0x37c>
    ffffc02097d0:    17ffff60     b    ffffc0209550 <entry+0x58>
    ffffc02097d4:    b94002e2     ldr    w2, [x23]
    ffffc02097d8:    f0000080     adrp    x0, ffffc021c000 <virtual_console>
    ffffc02097dc:    f9400400     ldr    x0, [x0, #8]
    ffffc02097e0:    34000202     cbz    w2, ffffc0209820 <entry+0x328>
    ffffc02097e4:    cb000362     sub    x2, x27, x0
    ffffc02097e8:    eb01005f     cmp    x2, x1
    ffffc02097ec:    540001a1     b.ne    ffffc0209820 <entry+0x328>  // b.any
    ffffc02097f0:    f90033a2     str    x2, [x29, #96]
    ffffc02097f4:    910183a1     add    x1, x29, #0x60
    ffffc02097f8:    91000320     add    x0, x25, #0x0
    ffffc02097fc:    97ffe681     bl    ffffc0203200 <arch_map_memory_region>
    ffffc0209800:    91000261     add    x1, x19, #0x0
    ffffc0209804:    b9000820     str    w0, [x1, #8]
    ffffc0209808:    b9400820     ldr    w0, [x1, #8]

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vxVLxV8iog0-JUH-Bd4nnCj5ELYkd_SkDDmPuKOAiJKg%40mail.gmail.com.
