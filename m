Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBD7G7CJQMGQE2A4PK3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 47950525FAB
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 12:29:38 +0200 (CEST)
Received: by mail-pg1-x53d.google.com with SMTP id f9-20020a636a09000000b003c61848e622sf4049026pgc.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 03:29:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652437777; cv=pass;
        d=google.com; s=arc-20160816;
        b=TklNvumpt8FHlBtyINdkz4AE9cMZaVA8XZ970qx5rTwMjZ1eCSKFTOxEGYs3coq7cc
         Ruy8Y/w4O88RumFc2ZQ+2AlME7zkRhZPVe29LGarmN1wyQehTEJ1+J9UghNYtPm+TR/J
         cpBDkpyR5KUqhYHV06GJy6YrI5v0DDhlXXz0h6f4CJ7nwjbEkbfHxrImHwmTrFsy/nGa
         JybuEfDa1u6nILtPLyiyqLPQPRtJmVZam+eaaC9M7SJETO2jd1oW3UYlNm+pVm3nHd/H
         jwSyf5E1H8PGcvh2irTD7rA+ijAYptcdOoB46rvzLu0e5CiYYjB2GgMfaoOCBwlPbCfq
         ub3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=COGfsicgWsVm/FEuSFKhhr4wRTRqz7wV+68TLCfXcZw=;
        b=mMYuTPZv/leXE7e/OYb20DUGx3jUpQSTqAb0KcsEBKwXQvZGPLQeT+MRZHI9TB+ECD
         zJDeK+AcNdaNY3Ux1fpzt8/wgLZK0oDPZvaq8VNBKtVmIszVk0/yR1kU828AWd7C5zny
         wfLPllqnHTpsiKECnr0fExLA5vPU7SNyl9JnX2U0G0d4LfLSHWaotCySqQaJSumqutnk
         yfqStuX9NEHy8DjPj5FuDtxHLrXMJk0VBOCWe+DrVuPcbNYk54o+emTJ+TwEUfRPYnKe
         y84G/3RY5gRd+jJZhptW0ONGH16Qu+tguj1ORZNhMJOx/bbN6JpZJ7wRZJEVRJe9rRUH
         eBNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="p/EzG29Z";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1136 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=COGfsicgWsVm/FEuSFKhhr4wRTRqz7wV+68TLCfXcZw=;
        b=jcwJzuZ3+c9Pr96nUlMYkJHesAC7rJxpIarjyD7aCZ6aRz/Yqb7YVGsBJUOM+g8bHC
         rrXwwTtXaqsXb7Q1QOe3wzIO6/wW5q0/Lc6clWAAJl8T5cPT/f7GF3w2YW+d0/ekPKPz
         M59oifTLMvg/sWSWzMd6kMMcvppFQx8PZ4WCBPa3oWqGLTj3+RiXVrmE8jtv0xTGjXjQ
         GF0TrcHNnuKomDW3vLXQitaDr491bm0YV/cbgwdGmXhBFxBYlsttLGA6q2A7zz7B+1T7
         NrXufdUooLOB6ub2N15u/Y/6y7d843TBnVQl8XgRhYIsoFWNYJpF5unOgzpJ7+iL5pUx
         BAfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=COGfsicgWsVm/FEuSFKhhr4wRTRqz7wV+68TLCfXcZw=;
        b=pBxwOlre9Sg0u8lunOAwj8X62kE7wT6O8lXAspw0sCJr+e05i/avbN+i0PJ6IQq7/6
         xxxOnfl+Xy+sxEFc/wMYP9HUluVDH2m4YtETG4btQihittSzwpYP35vrJ54tHqA16DuP
         zUqmO6An5VH/hGqHAsWMvaMgB/I3LQpOTqJXt690KWcVda9Tr0Lv/8THtn+JMw5EBs9m
         N6jQeB/XNgvX8qD3362sT8Hg5N17pf9f30EHjZmIjou86w/F0ZBxpyCWa06eMEysXnf8
         jhpljZbKVJtahpsk7OEzKeO5CaHO+2w5HCQXolgLIVQzb4N8EvGFEin/i0JVQFCR7RaG
         /FXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=COGfsicgWsVm/FEuSFKhhr4wRTRqz7wV+68TLCfXcZw=;
        b=1z9GGHTQ+TEDW8YoQsZWFWSlIFPU7QHA/JIVDU2x2s/SbH6Lj5uu40ApNAgBUYuBtA
         lJq/fGFtef1zvo2HAW1HjlYs1cub+qe74C2ZaARlb6FWkzvNEied6ON7+Z+UJlnITyYt
         WfVgJUs3v10/oIb5NtrSMkXzq94iCmjyyrkAix8qI/ic8I4cef/1gLNXuNmpZ4+Lj/pH
         bNRz2Rjkk77mg8kKQAT3HSK1NDTOp9JVtBCVObzDYxuKHILpifXZEgJjuu/iouSk9+2k
         SvBYwgzndk2xx+NlXvPSsYoov0E+hLtte32PWnqsiGHJ5cejzHxErW8+V3hkidqDuqQK
         hQYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mmTvJku2DQ3AbGnQUPkAng+939pnm5hFJYhfeVe6eJUCtmbRL
	04+NslVm18ZJ3JfkCUM6H7A=
X-Google-Smtp-Source: ABdhPJzzWCCVmHHKQ2rXGsFxovsFkwFORoxZKxNydGg3VhuxCQ5sOnlofS8Q5G+ONYR6ZGj4CDAGAA==
X-Received: by 2002:a62:bd14:0:b0:50d:4bec:ff78 with SMTP id a20-20020a62bd14000000b0050d4becff78mr4025205pff.71.1652437776826;
        Fri, 13 May 2022 03:29:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:f17:b0:1d9:36f4:f39e with SMTP id
 23-20020a17090a0f1700b001d936f4f39els153899pjy.2.experimental-gmail; Fri, 13
 May 2022 03:29:35 -0700 (PDT)
X-Received: by 2002:a17:903:248:b0:155:e8c6:8770 with SMTP id j8-20020a170903024800b00155e8c68770mr3759171plh.129.1652437775023;
        Fri, 13 May 2022 03:29:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652437775; cv=none;
        d=google.com; s=arc-20160816;
        b=hsO/IpfotNv6B/K7PtcUQYJh74Oxv4KxZPoqVTax8ATyIA1sAfmLjATkn/x6mvp0iD
         q5XAuveqhs/cKLCQ+ddA1PLOygpoOHlalQ5eoElC1RWJZiQNQED8Nh9y5/DAllC75/rt
         tWunACNYuMAP+bjJEYT1hGJ4l06ZDUcJUjNisOYkF+ieZp3JuuwLxwkB4/x8nSvXqIS2
         GUEJGbcIJVBI8xNAH4H2zSUTg986cT6opyiSXZ7s6vpkkS2/XuJIA5Om+TRKc/RNwRER
         X2AySBBDx0BTiyTghhOGhEOyCLI27xoSt2OiTwrp1reVjxUSJEqq5oCiUmz2rTXj3t4P
         8NFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2hiTqbL4teL+MkgvOR7KSOJgzV9KT9gwnjTLiMrd1QY=;
        b=nhFekrFOR7R6/J6uwIAcEeA51VhfS6PtEnOWPXe9pjGZzlfupmkqELpCrOZmYQjcR9
         JR3y1xzBjq/zvwbsdfIx+JgfuVwNWct9yi7BHri4GxfhfHOM/7V67uCIqhneIe7TCiU4
         eHizjp+70CiyRFNt4XD2O5YTCy4/x2xl0zairdOR3r8IXPdd0ious8kmF4mMsp8iceOq
         +rUfF1En1+ZU2gTsVuNIsDL1Osae6TblgePQ1RmotXreDcIb3v0SKaBBVcWaaLONoCVc
         gYpF5hLHXdF9DM4M6yPr71ONir0E8Ndz+qtP8sxNHTTqeY679y+sQwhRlhSQiNHA4pZs
         0S3A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="p/EzG29Z";
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1136 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com. [2607:f8b0:4864:20::1136])
        by gmr-mx.google.com with ESMTPS id h21-20020a170902f7d500b0014f3d55ede2si168717plw.2.2022.05.13.03.29.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 03:29:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1136 as permitted sender) client-ip=2607:f8b0:4864:20::1136;
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2f83983782fso85553547b3.6
        for <jailhouse-dev@googlegroups.com>; Fri, 13 May 2022 03:29:34 -0700 (PDT)
X-Received: by 2002:a81:b651:0:b0:2ef:6d8c:a6f4 with SMTP id
 h17-20020a81b651000000b002ef6d8ca6f4mr4931108ywk.222.1652437774103; Fri, 13
 May 2022 03:29:34 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <a866cda9-fa1c-3033-3cc9-b0762b0ae6b5@siemens.com> <CA+V-a8uh_mJNrN8R8cHb+MwTG1=DPyjy3kEOwfozRdOL+jz3zw@mail.gmail.com>
 <e0aaf1b9-700d-ba22-270d-049ac10be44c@siemens.com>
In-Reply-To: <e0aaf1b9-700d-ba22-270d-049ac10be44c@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 May 2022 11:29:07 +0100
Message-ID: <CA+V-a8umio3A9LsmdwB-x3W+JH1wOiwXJkH-FXdFBDLvbH=zUw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b="p/EzG29Z";       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1136 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Fri, May 13, 2022 at 9:52 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 13.05.22 09:31, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 12, 2022 at 6:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 12.05.22 13:37, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 12.05.22 13:06, Lad, Prabhakar wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
> >>>>>>> Hi Jan,
> >>>>>>>
> >>>>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>
> >>>>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
> >>>>>>>>> Hi Jan,
> >>>>>>>>>
> >>>>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>>>
> >>>>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>>>>>>>>>> To add further more details:
> >>>>>>>>>>>
> >>>>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>>>>>>>>>> for jailhouse [1].
> >>>>>>>>>>>
> >>>>>>>>>>> I added some debug prints and I see the panic is caused when entry()
> >>>>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
> >>>>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>>>>>>>>>> instruction is causing this issue.
> >>>>>>>>>>
> >>>>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
> >>>>>>>>>> executable? That would explain why we see no hypervisor output at all.
> >>>>>>>>>>
> >>>>>>>>> To clarify when the hypervisor is loaded the output will be via
> >>>>>>>>> debug_console specified in the root cell config?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Correct - if you reach entry() in setup.c.
> >>>>>>>>
> >>>>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
> >>>>>>>>>> e.g.)?
> >>>>>>>>>>
> >>>>>>>>> Yes I have the below memory reserved in my dts:
> >>>>>>>>>
> >>>>>>>>>     memory@48000000 {
> >>>>>>>>>         device_type = "memory";
> >>>>>>>>>         /* first 128MB is reserved for secure area. */
> >>>>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
> >>>>>>>>>     };
> >>>>>>>>>
> >>>>>>>>>     reserved-memory {
> >>>>>>>>>         #address-cells = <2>;
> >>>>>>>>>         #size-cells = <2>;
> >>>>>>>>>         ranges;
> >>>>>>>>>
> >>>>>>>>>         jh_inmate@a7f00000 {
> >>>>>>>>>             status = "okay";
> >>>>>>>>>             no-map;
> >>>>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >>>>>>>>>         };
> >>>>>>>>>
> >>>>>>>>>         jailhouse: jailhouse@b6f00000 {
> >>>>>>>>>             status = "okay";
> >>>>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >>>>>>>>>             no-map;
> >>>>>>>>>         };
> >>>>>>>>>     };
> >>>>>>>>>
> >>>>>>>>> Linux does report the hole in RAM:
> >>>>>>>>>
> >>>>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> >>>>>>>>> 48000000-a7efffff : System RAM
> >>>>>>>>> b7f00000-bfffffff : System RAM
> >>>>>>>>>
> >>>>>>>>> And below is my root cell config related to hypervisor memory:
> >>>>>>>>>
> >>>>>>>>>         .hypervisor_memory = {
> >>>>>>>>>             .phys_start = 0xb6f00000,
> >>>>>>>>>             .size =       0x1000000,
> >>>>>>>>>         },
> >>>>>>>>>
> >>>>>>>>> Is there anything obvious I have missed above?
> >>>>>>>>>
> >>>>>>>>
> >>>>>>>> Nothing obvious to me so far.
> >>>>>>>>
> >>>>>>>> So, is this really the first instruction in
> >>>>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> >>>>>>>> Check the reported address by Linux against the disassembly of the
> >>>>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
> >>>>>>>> to check if that returns without a crash.
> >>>>>>>>
> >>>>>>> I did play around with ret, below is my observation:
> >>>>>>>
> >>>>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> >>>>>>> returned without a crash. Adding a ret at line 99 [1] ie after
> >>>>>>> arm_dcaches_flush it never returned.
> >>>>>>>
> >>>>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> >>>>>>> first statement in arm_dcaches_flush and was able to see the panic!
> >>>>>>
> >>>>>> Which Jailhouse revision are you building? Already disassembled
> >>>>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
> >>>>>> have here for next:
> >>>>>>
> >>>>> I'm using the next branch too.
> >>>>>
> >>>>>> 0000ffffc0203efc <arm_dcaches_flush>:
> >>>>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
> >>>>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
> >>>>>>     ...
> >>>>>>
> >>>>>> 0000ffffc0204800 <arch_entry>:
> >>>>>>     ffffc0204800:       aa0003f0        mov     x16, x0
> >>>>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
> >>>>>>     ...
> >>>>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
> >>>>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
> >>>>>>
> >>>>>> You could check if there is such a relative call in your case as well.
> >>>>> yes it does exist, below is the snippet:
> >>>>>
> >>>>> 0000ffffc0204000 <arch_entry>:
> >>>>>     ffffc0204000:    aa0003f0     mov    x16, x0
> >>>>>     ffffc0204004:    aa1e03f1     mov    x17, x30
> >>>>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
> >>>>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
> >>>>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
> >>>>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
> >>>>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
> >>>>>     ffffc020401c:    d2880003     mov    x3, #0x4000
> >>>>>  // #16384
> >>>>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
> >>>>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
> >>>>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
> >>>>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
> >>>>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
> >>>>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
> >>>>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
> >>>>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
> >>>>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
> >>>>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
> >>>>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
> >>>>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
> >>>>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
> >>>>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
> >>>>>     ffffc0204058:    f100025f     cmp    x18, #0x0
> >>>>>     ffffc020405c:    54000041     b.ne    ffffc0204064
> >>>>> <arch_entry+0x64>  // b.any
> >>>>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
> >>>>>     ffffc0204064:    d4000002     hvc    #0x0
> >>>>>     ffffc0204068:    d4000002     hvc    #0x0
> >>>>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
> >>>>>
> >>>>>> Then you could check, before jumping into arch_entry from the
> >>>>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
> >>>>>> as expected. But maybe already the building injects an issue here.
> >>>>>>
> >>>>> Any pointers on how I could do that?
> >>>>>
> >>>>
> >>>> arm_dcaches_flush is loaded at arch_entry (header->entry +
> >>>> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
> >>>> what is in your hypervisor.o (likely also d53b0024).
> >>>>
> >>>> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
> >>>> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
> >>>> see if that code, specifically dcache_line_size, causes trouble outside
> >>>> of Jailhouse as well, maybe as inline assembly in the driver module.
> >>>>
> >>>
> >>> With the below ret added, I get "JAILHOUSE_ENABLE: Success"
> >>>
> >>> diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> >>> index a9cabf7f..4e98b292 100644
> >>> --- a/hypervisor/arch/arm64/entry.S
> >>> +++ b/hypervisor/arch/arm64/entry.S
> >>> @@ -96,6 +96,7 @@ arch_entry:
> >>>          */
> >>>         ldr     x1, [x0, #HEADER_CORE_SIZE]
> >>>         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> >>> +       ret
> >>>         bl      arm_dcaches_flush
> >>>
> >>>         /* install bootstrap_vectors */
> >>>
> >>> Now when I undo the above and do the below, Im seeing a panic:
> >>>
> >>> diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> >>> index 39dad4af..ce29b8e8 100644
> >>> --- a/hypervisor/arch/arm64/caches.S
> >>> +++ b/hypervisor/arch/arm64/caches.S
> >>> @@ -40,6 +40,7 @@
> >>>   */
> >>>         .global arm_dcaches_flush
> >>>  arm_dcaches_flush:
> >>> +       ret
> >>>         dcache_line_size x3, x4
> >>>         add     x1, x0, x1
> >>>         sub     x4, x3, #1
> >>>
> >>> Issue is seen even without dcache_line_size being called. Does that
> >>> mean we are not landing in arm_dcaches_flush?
> >>
> >> Likely. I've never seen such an effect.
> >>
> >> If you look the reported fault address, when making it relative
> >> (subtract hypervisor_mem), is that arm_dcaches_flush (relative to
> >> arch_entry)?
> >>
> > Could you please elaborate on it more. I moved the cache.S code in
> > entry.S  file but still seeing the same issue.
>
>
> $ aarch64-linux-gnu-objdump -x hypervisor/hypervisor.o | \
>   grep "arch_entry\|arm_dcaches_flush"
> 0000ffffc0203efc g       .text  0000000000000000 arm_dcaches_flush
> 0000ffffc0204800 g       .text  0000000000000000 arch_entry
>
> -> delta of 0x904 here
>
> diff --git a/driver/main.c b/driver/main.c
> index 64e2b9a4..cb197d77 100644
> --- a/driver/main.c
> +++ b/driver/main.c
> @@ -246,6 +246,8 @@ static void enter_hypervisor(void *info)
>
>         entry = header->entry + (unsigned long) hypervisor_mem;
>
> +       printk("obcode @arm_dcaches_flush: %08x\n", *(u32 *)(entry - 0x904));
> +
>         if (cpu < header->max_cpus)
>                 /* either returns 0 or the same error code across all CPUs */
>                 err = entry(cpu);
>
>
> Untested, though.
>
Thanks for the pointer,

$aarch64-linux-gnu-objdump -x hypervisor/hypervisor.o |   grep
"arch_entry\|arm_dcaches_flush"
0000ffffc0203f64 g       .text    0000000000000000 arm_dcaches_flush
0000ffffc0204800 g       .text    0000000000000000 arch_entry

I get a difference of 0x89c, so I added the below code:
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..8684816a 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -246,6 +246,8 @@ static void enter_hypervisor(void *info)

        entry = header->entry + (unsigned long) hypervisor_mem;

+       printk("obcode @arm_dcaches_flush: %08x\n", *(u32 *)(entry - 0x89c));

This results in:

[   18.077167] jailhouse: loading out-of-tree module taints kernel.
Reading configuration set:
  Root cell:     Renesas RZ/V2L SMARC (renesas-r9a07g054l2.cell)
Overlapping memory regions inside cell: None
Overlapping memory regions with hypervisor: None
Missing resource interceptions for architecture arm64: None
[   19.035199] obcode @arm_dcaches_flush: d53b0024
[   19.035203] obcode @arm_dcaches_flush: d53b0024
[   19.035233] ------------[ cut here ]------------
[   19.039748] ------------[ cut here ]------------
[   19.044245] kernel BUG at arch/arm64/kernel/traps.c:407!
[   19.048835] kernel BUG at arch/arm64/kernel/traps.c:407!
[   19.053427] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[   19.069449] Modules linked in: jailhouse(O)
[   19.073625] CPU: 1 PID: 143 Comm: rngd Tainted: G           O
5.10.112-cip6+ #13
[   19.081419] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[   19.087918] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=--)
[   19.093908] pc : do_undefinstr+0x26c/0x320
[   19.097985] lr : do_undefinstr+0x1cc/0x320
[   19.102060] sp : ffff8000118d3cf0
[   19.105357] x29: ffff8000118d3cf0 x28: ffff00000ad5b800
[   19.110648] x27: 0000000000000000 x26: ffff8000118d4000
[   19.115938] x25: ffff8000118d0000 x24: 0000000000000000
[   19.121228] x23: 0000000020400085 x22: ffff800013004864
[   19.126521] x21: ffff8000118d3ed0 x20: ffff8000118d3d80
[   19.131812] x19: ffff800011107000 x18: 0000000000000001
[   19.137103] x17: ffff800008c11828 x16: 0000000000000001
[   19.142393] x15: ffff800013004864 x14: 000000001004b800
[   19.147684] x13: 0000ffffc0200000 x12: 00000000b6f00000
[   19.152974] x11: ffff0000f6d00000 x10: ffff8000118d3ed0
[   19.158265] x9 : ffff8000118d3ed0 x8 : 3062333564203a68
[   19.163556] x7 : 0000000000000000 x6 : ffff8000118d3d48
[   19.168847] x5 : 00000000d5300000 x4 : ffff800011635410
[   19.174137] x3 : 00000000d4000000 x2 : 0000000000000000
[   19.179428] x1 : ffff00000ad5b800 x0 : 0000000020400085
[   19.184720] Call trace:
[   19.187157]  do_undefinstr+0x26c/0x320
[   19.190894]  el1_undef+0x30/0x50
[   19.194108]  el1_sync_handler+0xc4/0xe0
[   19.197927]  el1_sync+0x84/0x140
[   19.201141]  0xffff800013004864
[   19.204272]  flush_smp_call_function_queue+0xf8/0x268
[   19.209302]  generic_smp_call_function_single_interrupt+0x14/0x20
[   19.215370]  ipi_handler+0x8c/0x158
[   19.218846]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
[   19.223963]  generic_handle_irq+0x30/0x48
[   19.227957]  __handle_domain_irq+0x60/0xb8
[   19.232037]  gic_handle_irq+0x58/0x128
[   19.235769]  el0_irq_naked+0x4c/0x54
[   19.239332] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210000)
[   19.245407] ---[ end trace e90110789d0a42e7 ]---
[   19.250004] Kernel panic - not syncing: Oops - BUG: Fatal exception
in interrupt
[   19.257368] SMP: stopping secondary CPUs
[   20.345055] SMP: failed to stop secondary CPUs 0-1
[   20.349824] Kernel Offset: disabled
[   20.353295] CPU features: 0x0040026,2a00a238
[   20.357545] Memory Limit: none
[   20.360587] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
exception in interrupt ]---

When compared to the objdump of cache.o it does match the value d53b0024,

$ aarch64-linux-gnu-objdump -D hypervisor/arch/arm64/caches.o

hypervisor/arch/arm64/caches.o:     file format elf64-littleaarch64


Disassembly of section .text:

0000000000000000 <arm_dcaches_flush>:
   0:    d53b0024     mrs    x4, ctr_el0
   4:    d3504c84     ubfx    x4, x4, #16, #4
   8:    d2800083     mov    x3, #0x4                       // #4
   c:    9ac42063     lsl    x3, x3, x4
  10:    8b010001     add    x1, x0, x1
  14:    d1000464     sub    x4, x3, #0x1
  18:    8a240000     bic    x0, x0, x4
  1c:    f100005f     cmp    x2, #0x0
  20:    54000061     b.ne    2c <arm_dcaches_flush+0x2c>  // b.any
  24:    d50b7a20     dc    cvac, x0
  28:    14000006     b    40 <arm_dcaches_flush+0x40>
  2c:    f100045f     cmp    x2, #0x1
  30:    54000061     b.ne    3c <arm_dcaches_flush+0x3c>  // b.any
  34:    d5087620     dc    ivac, x0
  38:    14000002     b    40 <arm_dcaches_flush+0x40>
  3c:    d50b7e20     dc    civac, x0
  40:    8b030000     add    x0, x0, x3
  44:    eb01001f     cmp    x0, x1
  48:    54fffea3     b.cc    1c <arm_dcaches_flush+0x1c>  // b.lo, b.ul, b.last
  4c:    d5033f9f     dsb    sy
  50:    d65f03c0     ret

So no problem above, any more pointers where I can give it a shot?

> >
> > In some of the reference platforms LPAE is enabled in the u-boot. Is
> > that a strict requirement? Also in the requirement section it's
>
> LPAE is 32-bit arm, your are on 64-bit, no?
>
My bad, yes I'm on 64-bit.

> > mentioned "Linux is started in HYP mode" does that mean Before loading
> > the jailhouse the Linux should be running on EL2? Also to be sure, do
> > we need any special configs enabled in TF-A at all?
>
> You need Linux to start in HYP mode so that Linux installs a stub that
> KVM (when not using Jailhouse) and Jailhouse can use to take over the
> hypervisor role. But your init crashes before arch_entry is able to
> issue the related hvc instructions.
>
Ah right, I misunderstood there.

> TF-A needs to be there in order to have PSCI. Special settings are
> usually only related to SDEI, which is optional.
>
OK, so TF-A without any changes should work.

> >
> > Fyi, I am using arm64_defconfig_5.10 [0] (+ additional configs to
> > enable my platform) to build the Linux kernel, should these configs be
> > sufficient for Jailhouse?
>
> Yes, at least for the various targets we cover with this so far.
>
Great!

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8umio3A9LsmdwB-x3W%2BJH1wOiwXJkH-FXdFBDLvbH%3DzUw%40mail.gmail.com.
