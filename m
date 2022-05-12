Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB3HB6KJQMGQEWA4EIEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oa1-x3e.google.com (mail-oa1-x3e.google.com [IPv6:2001:4860:4864:20::3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EBB524657
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 09:02:06 +0200 (CEST)
Received: by mail-oa1-x3e.google.com with SMTP id 586e51a60fabf-f1121e22ebsf2408226fac.19
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 00:02:06 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652338925; cv=pass;
        d=google.com; s=arc-20160816;
        b=ci4TgXACUODydJfqtTQVXgGQEb6AxKbfWkRBDeJu6lZqbSHvef9lgjI/Xhrk4K59ad
         G5atB0pXPmWQXRb2W2fb8ItrwHwCxf4oley+2Yut0IXNSxSy8dX2DFy1MsT892V5WGVW
         5nuGCgDRyj2JPqK0T8QOKbsASf3KptQe12Gx7toBbmMkRFHw4AykbfgGix1/SfRDDklx
         5gw06/+EWNJTzaRraUlblGLfxdx7t/PwVE/AcKZACWVFrHpen58l/z29mepFJdwCTZo3
         iSBo4lJEVUbgl6/8QnuQ4TkZAKWR+1v5j3/Gry9pI+g/DL06Z1tZgg2VQSFy3d/yJTye
         pjQA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=IsgpEm2wVikZvirdHUB48pYBPKUuXsUg3GQND+jyj04=;
        b=EKWJxbh4oylC5ZuHn1L42SIkZyu89K1r7t4ZrkKvl7oHUb7nFZVekmm1S4nW7bymuX
         D6Exd2yBShvZMINtqAAea6dJc9ADrJWnWoBMEJXXIW5ONFWG6vpCFskmzkk2PAGwFNPo
         nPehsXU6HdX6OYebqAo6rf8QMPlKzqG1myuAcIr1QpK0FjXZUriyVIDkPQC2pMLJhshz
         6bc7Ft61ZBP3TvkeyfoUf0+2XSRzgBCetV7gjjn+DOXD3zBbo4lEvkyxHozRHEn4pmeQ
         1TsZG91Nc6VVMXZAFhLfU9+Y3yG7HiZVSJH5BWsLRF+MSaYD3CLs6R7YE2AUgWs1oPKz
         VzEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TgRD6jbM;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IsgpEm2wVikZvirdHUB48pYBPKUuXsUg3GQND+jyj04=;
        b=sO30cmu5TyBqk9qUKu2HOdfEoRGM8AKp5jGmfHjDXmZqtkwNZd6u/wAb3N5U3XJ3rH
         4jUjkC48s3378dp/nDfGxM5dM0HvxbRQYpAdFqWiLuQiRNoMsTF/goXh2+z9qoyZwiDJ
         SUkZr69xhiL7s5SG7ha6TYVeP58fytkLLtGgA+1F+fDxAP4d+NFJriPJtRv5Cwj2X1C+
         d/Bw5OFw4wpex6Rg4Eum51T5vz0haTgaB027aYLqkMsbeUZ535jQoO0e8pyMFRxr9irH
         xjR0POxZVcdlE/tlh0c5DhDvMlyskm5yrrKXEBQbuYw/rhryhdD/nT7GjPuKytvY2VPE
         HFiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IsgpEm2wVikZvirdHUB48pYBPKUuXsUg3GQND+jyj04=;
        b=PYX9vClxIc8AB/TMguHr9xUdiZBbFCTJQM3YpH02UwPX1w5OriVCMZkOBRJrZX8qJ7
         5f8ALpoOe9ynkKiIDz/NrUcB3omk4FZZ++WU0zR6tpB0H2vIE0uFX5OWcH2G/o4SqDzg
         yvS4Az61er4QXhGMY538BOahV3dpPB8/+SE+Yb1+oHXv7jvbX5mO9ekIjav7ve1+FCad
         E2DI6bzYHgs7Qu5waA2szcwGSXrpOpGOE75OXFyuXeCBH+hnJzmllNXfYTg6XB3aIxcP
         tpS85b9UFpMJHsRI7bxZFujXGLsZzbGONHHtf3C7LJSIIWYI8xRaJww7Hxtjo6BI7lfT
         i3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IsgpEm2wVikZvirdHUB48pYBPKUuXsUg3GQND+jyj04=;
        b=6xrji9r9jiJBZtMLnLS+krP6644Q6XzgOFP9N1m43PRd2go6qAI/A+pBWQz0fUoryx
         Pb/7I0QjdSmiZUrYq+590gv9JQ/1ySI7++55SVgVQrELug1Jf8GcvZRED5REYKb7MwIe
         eyDnNY+PWYXCHUL3nohCtHSm1XIovW1U1IT9sbwM2YJOFNvYV1UzViQPBTQBDvG7SBJ2
         9Wytr2FldBEQFgby5dhru/GglsEXOZ8+iQByCWNs0/Ggh6edS3Q+GjCmdsC9T8xj06p8
         SR3B7PFfkeB2HGf1vJm4Wf/yNWDkQ1Dl+fkA+si7OnXp5n9ov+62RdOucCckwYPm2Z+O
         uhiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532S5k4V0tG3JwvTqBnZBxfWYGSQqifXaR2dF6VE7vc9mk6cbbQa
	eardUYTewHVkzyVWpFYa01Y=
X-Google-Smtp-Source: ABdhPJwCgpg5oiEG0zoOtyoMlpDhlP9uLkijMp2ooPItH/FeO4wtZwHhmFgs8wg49nB9dQW6YKWJPw==
X-Received: by 2002:a05:6871:97:b0:e6:30e3:31a7 with SMTP id u23-20020a056871009700b000e630e331a7mr4617834oaa.150.1652338924792;
        Thu, 12 May 2022 00:02:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:9a03:b0:e2:adb7:ef12 with SMTP id
 fo3-20020a0568709a0300b000e2adb7ef12ls1720367oab.10.gmail; Thu, 12 May 2022
 00:02:04 -0700 (PDT)
X-Received: by 2002:a05:6870:231b:b0:db:a2b3:cff7 with SMTP id w27-20020a056870231b00b000dba2b3cff7mr4822262oao.244.1652338923936;
        Thu, 12 May 2022 00:02:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652338923; cv=none;
        d=google.com; s=arc-20160816;
        b=o8F3kYwhF0vpFraVjDGBZhLiD/O6Y/nR7xh5kP7KBIerg1ZFLw6QKeK3Lwy+G/hA6K
         GgdAY0M0pazCakVRPqKkoq7SNHmZyrVsZcn0QvtysMZz49ap1dzGCHih+cdUdW5dCUul
         W4Ku0VPZLYACYUcpZwEQ1aKruDXzd1F5j5v4iR9IqJIftWCJDxluXb/QS7JNj1uSVL2a
         tc1lDMRU1LoCgghVYZgXyI32j0Vb3uaflqTPOh1ksePe97MMUhhKY90o6Uf6Znimb568
         n+9gXT1DMmjleOF1erB826XkXtLnB3jtCR6p4NjfqP7NKnRTIG/pYPsBl8C0WSb0HYux
         I8mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hfJ4O/JhBoWHO4wd0TDlno81klBJW1T1RqV55uUja/4=;
        b=Ghclswy8YfiW71jmYEdmR4AhhoESHRozNMqoQ4uxM3N/Uy8QM+zQMMMBUTXAD9ruBG
         98sjDEROF1YSzOOVXoCYBehqnk8g1jcNXk/R2ilLKHYUx5aJQHITtTwbKkCIwp29A805
         ouWnt18Ydi92XQf32jGnEPipkrw68ob1eQKaacV/Oqkm4RFJFbDqCYJxW9S0QO/xvXE2
         9zyzRPTM9NI7w0Xdk4N3wx2SMAgAFPrGvMVUJ8RwkgWe1lgU6/LHRt1S3qURmdmxXKtn
         y/uF11SwU4vsuen4aQQpRtrKP37VThr7F29dvo8dFG1f8iQQppkF9NQU8XjcilmNjUmb
         tAzQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=TgRD6jbM;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com. [2607:f8b0:4864:20::b33])
        by gmr-mx.google.com with ESMTPS id f21-20020a056830057500b00605794cb068si371245otc.2.2022.05.12.00.02.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 00:02:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b33 as permitted sender) client-ip=2607:f8b0:4864:20::b33;
Received: by mail-yb1-xb33.google.com with SMTP id s30so8054048ybi.8
        for <jailhouse-dev@googlegroups.com>; Thu, 12 May 2022 00:02:03 -0700 (PDT)
X-Received: by 2002:a05:6902:1407:b0:64a:ecc7:aa2 with SMTP id
 z7-20020a056902140700b0064aecc70aa2mr15579658ybu.645.1652338923571; Thu, 12
 May 2022 00:02:03 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com> <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
In-Reply-To: <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 May 2022 08:01:37 +0100
Message-ID: <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=TgRD6jbM;       spf=pass
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

On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 11.05.22 19:09, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>> To add further more details:
> >>>
> >>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>> for jailhouse [1].
> >>>
> >>> I added some debug prints and I see the panic is caused when entry()
> >>> function is called (in enter_hypervisor). The entry function lands into
> >>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>> instruction is causing this issue.
> >>
> >> So, already the first instruction in the loaded hypervisor binary is not
> >> executable? That would explain why we see no hypervisor output at all.
> >>
> > To clarify when the hypervisor is loaded the output will be via
> > debug_console specified in the root cell config?
> >
>
> Correct - if you reach entry() in setup.c.
>
> >> Was that memory region properly reserved from Linux (via DTB carve-out
> >> e.g.)?
> >>
> > Yes I have the below memory reserved in my dts:
> >
> >     memory@48000000 {
> >         device_type = "memory";
> >         /* first 128MB is reserved for secure area. */
> >         reg = <0x0 0x48000000 0x0 0x78000000>;
> >     };
> >
> >     reserved-memory {
> >         #address-cells = <2>;
> >         #size-cells = <2>;
> >         ranges;
> >
> >         jh_inmate@a7f00000 {
> >             status = "okay";
> >             no-map;
> >             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >         };
> >
> >         jailhouse: jailhouse@b6f00000 {
> >             status = "okay";
> >             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >             no-map;
> >         };
> >     };
> >
> > Linux does report the hole in RAM:
> >
> > root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> > 48000000-a7efffff : System RAM
> > b7f00000-bfffffff : System RAM
> >
> > And below is my root cell config related to hypervisor memory:
> >
> >         .hypervisor_memory = {
> >             .phys_start = 0xb6f00000,
> >             .size =       0x1000000,
> >         },
> >
> > Is there anything obvious I have missed above?
> >
>
> Nothing obvious to me so far.
>
> So, is this really the first instruction in
> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> Check the reported address by Linux against the disassembly of the
> hypervisor. You could also play with adding 'ret' as first instruction,
> to check if that returns without a crash.
>
I did play around with ret, below is my observation:

Up until line 98 [0] just before calling arm_dcaches_flush adding ret
returned without a crash. Adding a ret at line 99 [1] ie after
arm_dcaches_flush it never returned.

So I continued with adding ret in  arm_dcaches_flush, I added ret as a
first statement in arm_dcaches_flush and was able to see the panic!

[  225.694752] ------------[ cut here ]------------
[  225.697709] ------------[ cut here ]------------
[  225.700663] kernel BUG at arch/arm64/kernel/traps.c:407!
[  225.705253] kernel BUG at arch/arm64/kernel/traps.c:407!
[  225.709846] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
[  225.725867] Modules linked in: jailhouse(O)
[  225.730050] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G           O
  5.10.112-cip6+ #10
[  225.738105] Hardware name: Renesas SMARC EVK based on r9a07g054l2 (DT)
[  225.744606] pstate: 00400085 (nzcv daIf +PAN -UAO -TCO BTYPE=--)
[  225.750597] pc : do_undefinstr+0x26c/0x320
[  225.754677] lr : do_undefinstr+0x1cc/0x320
[  225.758753] sp : ffff800011293cf0
[  225.762052] x29: ffff800011293cf0 x28: ffff00000989c740
[  225.767344] x27: ffff00000989c740 x26: ffff800011294000
[  225.772635] x25: ffff800011290000 x24: ffff8000110fa344
[  225.777927] x23: 0000000020400085 x22: ffff800012004064
[  225.783218] x21: ffff800011293ed0 x20: ffff800011293d80
[  225.788509] x19: ffff800010e4f000 x18: 0000000000000001
[  225.793800] x17: ffff800008b01870 x16: 0000000000000001
[  225.799091] x15: ffff800012004064 x14: 000000001004b800
[  225.804382] x13: 0000ffffc0200000 x12: 00000000b6f00000
[  225.809673] x11: ffff0000f6d00000 x10: ffff800011293ed0
[  225.814963] x9 : ffff800011293ed0 x8 : ffff800011293ed0
[  225.820254] x7 : 0000000000000000 x6 : ffff800011293d48
[  225.825544] x5 : 00000000d5300000 x4 : ffff800011104f50
[  225.830835] x3 : 00000000d4000000 x2 : 0000000000000000
[  225.836125] x1 : ffff00000989c740 x0 : 0000000020400085
[  225.841417] Call trace:
[  225.843855]  do_undefinstr+0x26c/0x320
[  225.847593]  el1_undef+0x30/0x50
[  225.850808]  el1_sync_handler+0xc4/0xe0
[  225.854626]  el1_sync+0x84/0x140
[  225.857841]  0xffff800012004064
[  225.860971]  flush_smp_call_function_queue+0xf8/0x268
[  225.866002]  generic_smp_call_function_single_interrupt+0x14/0x20
[  225.872070]  ipi_handler+0x8c/0x158
[  225.875545]  handle_percpu_devid_fasteoi_ipi+0x74/0x88
[  225.880664]  generic_handle_irq+0x30/0x48
[  225.884657]  __handle_domain_irq+0x60/0xb8
[  225.888738]  gic_handle_irq+0x58/0x128
[  225.892470]  el1_irq+0xc8/0x180
[  225.895598]  arch_cpu_idle+0x18/0x28
[  225.899159]  default_idle_call+0x24/0x5c
[  225.903065]  do_idle+0x1ec/0x288
[  225.906278]  cpu_startup_entry+0x28/0x68
[  225.910184]  secondary_start_kernel+0x1c0/0x208
[  225.914700] Code: f94013b5 17fffff1 a9025bb5 f9001bb7 (d4210000)
[  225.920774] ---[ end trace 2c06dcfb273cddfd ]---
[  225.925373] Kernel panic - not syncing: Oops - BUG: Fatal exception
in interrupt
[  225.932738] SMP: stopping secondary CPUs
[  227.020425] SMP: failed to stop secondary CPUs 0-1
[  227.025194] Kernel Offset: disabled
[  227.028667] CPU features: 0x0040026,2a00a238
[  227.032915] Memory Limit: none
[  227.035958] ---[ end Kernel panic - not syncing: Oops - BUG: Fatal
exception in interrupt ]---

[0] https://github.com/siemens/jailhouse/blob/next/hypervisor/arch/arm64/entry.S#L98
[1] https://github.com/siemens/jailhouse/blob/next/hypervisor/arch/arm64/entry.S#L99


Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw%40mail.gmail.com.
