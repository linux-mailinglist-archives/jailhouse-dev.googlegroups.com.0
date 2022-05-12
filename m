Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBAHD6OJQMGQEM35HIYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33a.google.com (mail-ot1-x33a.google.com [IPv6:2607:f8b0:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id EA676524BCC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 13:37:37 +0200 (CEST)
Received: by mail-ot1-x33a.google.com with SMTP id h38-20020a9d2f29000000b00605ee3a042dsf1487016otb.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 May 2022 04:37:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652355456; cv=pass;
        d=google.com; s=arc-20160816;
        b=mnlsUZq1ddQcLdtPNNZ9uUMR7WKPTa8C330kssNhcPhUdX/5dmjTCbWeNaMmo7cgdm
         zgoJGLOUFfhXSiHt43hv8z9Xd6SnC+Hj8Pr+VKIn4TEOrVpiYXTWWkezdAOjwz102ncD
         OTXPe4ISl1qAhReci/1kC2OvYwek3zK2DvPkX1TmzKGDrKK2J21xN1m7fkYD4PQRJab0
         4SYG3WnmEqKARKS5aAjitig69J80MoN2kGJ3Yn9fxWrpHyLqDohI2wDyK6WU5xG8RSgI
         iRTP7xWwlxuxa1JnwpzMLYiS1lgu67neka6k3R1jXvHBtUezCIEUiMswc7MCkOh+ZGQn
         8YoQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=/p66vD7ATU8aOQkIHpdLMpJQbTH+AZjAPnFr1dBT5s8=;
        b=CsOnf6YeU5vFgTwLGcNDaA3XTOQINgqVKDr6G74BNixjYFzttZde+f8240VPbdCP1p
         QMc0WVzieJIc00nvLZljxK4/nWXOLsQxPqx0XN37eIq8C2QICwByr7i/rAdfejIniSs2
         7nq957mDK/DHY8jB558a9Q/Deig/W0bniV4wfsoFJIQr9taBtLAMxdI51EkkyAjPpv+d
         ZzTYzJbM+7j3u7gEtrpw/6P7gn30db2xtAiddW3JsnhXAM+uJp+hdXiJCWe0yZ+y5tdF
         kzPvafhLumvv+8G/ZmFt2fE+L+pR5zAY7PRS24PW7mqyodoJlNSQRpZUm41el2OsN3Kb
         WUFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWqBAlDp;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/p66vD7ATU8aOQkIHpdLMpJQbTH+AZjAPnFr1dBT5s8=;
        b=mrbdfQVTuNtRv1f2rI13GNN+4UGZsdipcZ/gdE1JqbXqERRSEx5Ihy87bESlUuT52I
         cEmIAwEG0kwqqdWT8S7dk8kzn+3kMsSU5NytxME2TuhHGr3vzUtb7QmvaI2bopxt8as8
         qy8m5qhzUwMMPL/NHGQ/77TZJE5K5m6wCF/qZ3N0Q9XyMAF+mm/s9vqDQFHGGvofDljs
         9xNihq+vsqCNXvkkUfC300W7neCHUutEhFxmvk91rH6l9cNEMa0Nfi5o2rooCrhTu3+x
         6LtSQFDmTwnP1rdAVxAOaqIhkkwrvefuJ3PeMj/S/d4eQSe3mCJSi2t4dj+rnMltU4UL
         A1gA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/p66vD7ATU8aOQkIHpdLMpJQbTH+AZjAPnFr1dBT5s8=;
        b=iaikLv6z5KiYt7o93s+L4+FoaDYH2K+Rc5c5jiS716fkaoA8zLPDfJ0s/DdaBrvpqk
         Qga4Il4mYAtLtSiYzbpUN7bTZjIUz50UqX/at7ttjBAg/ceBnx5+N/EwM13HNx58wqmx
         urciMR1wjBxmt4No0v8RsL6yRgFhnr3wM53kEUBDHGJRUa8nJL4+plORTwam+BLb4bKh
         os8cb+BdyNMy08MPKgdHsWSbacVdAVGh3yl8pjde/HJYoGC6r18ZWEIaovSaJOqoiK8V
         NITT5U6qqSoPanrSGXbUsQvOU/mSPrGOq4Jv2ZDLl3jeqEXOYw5M8x7/mfJYrrmCVHaj
         SH0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/p66vD7ATU8aOQkIHpdLMpJQbTH+AZjAPnFr1dBT5s8=;
        b=RrTLlnK9PfpDR5xZzsRRJQXk6vj923Jr2YTbuXRHXmCHkw4d6RO9RlOynNtc6FV5qD
         xHewOM7vAcyZCp+WY4P68nmWcc5wyItIim+t3Mf8nsUM/b/cBAhhbXLgJiuS3tZBSCRR
         YZUQw2vcPskf+SRF02U48/AMfe4pyr1DINuxSl7u9APHKuEnY717MX6YFSWMmvntJarY
         o0WJholBeOgRHeahittc/w5QFPUCUiAZhEc3Fuw9lfKs8rUdrHslzFq5cPyfWypbdWC8
         FSttvMqBgBHUlfYwE5V09myGIKpF3tVAvce1lb781Cyxb7EdcJeJZSIdcF/gLugkUy59
         pD8Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532i+gEC1Zltv+/upfClnNUIK71whHSJeYAwSKH/MbPVAF/RLYWY
	0s00QrkrNbrEc+pjkbLJAy8=
X-Google-Smtp-Source: ABdhPJxln8jKiWecz23Ckz0wWpFjVKFTZcH3HFn8PIeXnJZc+UsuVtaqAaazB8t4U6K4Q0n9yOYbpw==
X-Received: by 2002:a05:6808:1204:b0:325:7ce2:77f6 with SMTP id a4-20020a056808120400b003257ce277f6mr4899212oil.165.1652355456632;
        Thu, 12 May 2022 04:37:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6870:b387:b0:da:ea30:ee8d with SMTP id
 w7-20020a056870b38700b000daea30ee8dls1985117oap.0.gmail; Thu, 12 May 2022
 04:37:35 -0700 (PDT)
X-Received: by 2002:a05:6870:a70a:b0:de:15e5:b938 with SMTP id g10-20020a056870a70a00b000de15e5b938mr5342307oam.166.1652355455861;
        Thu, 12 May 2022 04:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652355455; cv=none;
        d=google.com; s=arc-20160816;
        b=iPFVGCpaxSas0Wk1FcAcOVk9NUoGzwYiHOcIr4yAz9c7q8oJm+CPWnK9Yy/Rrookpc
         KByQVJyPXgMwMvIeAeutYQuZGK5jgvsagWzSeP3mia6fZY8ulP6HDjZgX2N/mF5YyF1Z
         99RTuQ+8ydqy757ZYft+BZ0VhBjF7QxoVAHYzoIaoc21mfji/8uWT5jnCWbttvFXcJPt
         UHLKBbFnfSnPF2sQ3FV2EhwcL4hmokOR7HJFCOXWeXxcTrtJ88lkW4mfkDGEprkkltoR
         2v77wm1yUsnyuUXgCD+O1tvzt6GjL91WaHue67tWS0tuMGF2nDuW1T3QzAG50ksTdhbc
         VCmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ctVvjAYPEvAR+c0Qx14OkRQrbqVGz90UhF9tc2zsEbE=;
        b=zQHiaejzJz/0yM2GwDIjX4jaRNxXkfaqGbwFkqE6HCNMhraDQMKtx9xD9VVLnUjM/M
         gOJ3c+13PknoFiTNPi2JFxiUdmDwrhpwCgxuy5RVJpOhmwV1HLIDnIXqgKt7vKxiO6iA
         5nBtlYi/LvYSmJl3xFoaAAI30wuFEWDvcwBNofV1JYOjjn07scGzPkK155fplnVFczhS
         NKUENdvxaCurFn3625a4/aW6vCMUmzyaAPfLZE5GaUQQsL20rn9lHaBjh8YrJRwDoPEV
         L9hYIYfvXvdcT3Qq85Tg099uHVxVQZIxhDPCVbpp7LkHM4qRZ7anVVKIm/Wlqol5ZIrA
         7hJw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JWqBAlDp;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com. [2607:f8b0:4864:20::1133])
        by gmr-mx.google.com with ESMTPS id x1-20020a056808144100b0032649611da3si306958oiv.2.2022.05.12.04.37.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 May 2022 04:37:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1133 as permitted sender) client-ip=2607:f8b0:4864:20::1133;
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2f83983782fso52616277b3.6
        for <jailhouse-dev@googlegroups.com>; Thu, 12 May 2022 04:37:35 -0700 (PDT)
X-Received: by 2002:a0d:d491:0:b0:2ef:5485:fca with SMTP id
 w139-20020a0dd491000000b002ef54850fcamr29912733ywd.16.1652355455528; Thu, 12
 May 2022 04:37:35 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
In-Reply-To: <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 12 May 2022 12:37:09 +0100
Message-ID: <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=JWqBAlDp;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1133 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 12.05.22 13:06, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 12.05.22 09:01, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>>>>>> To add further more details:
> >>>>>>>
> >>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>>>>>> for jailhouse [1].
> >>>>>>>
> >>>>>>> I added some debug prints and I see the panic is caused when entry()
> >>>>>>> function is called (in enter_hypervisor). The entry function lands into
> >>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>>>>>> instruction is causing this issue.
> >>>>>>
> >>>>>> So, already the first instruction in the loaded hypervisor binary is not
> >>>>>> executable? That would explain why we see no hypervisor output at all.
> >>>>>>
> >>>>> To clarify when the hypervisor is loaded the output will be via
> >>>>> debug_console specified in the root cell config?
> >>>>>
> >>>>
> >>>> Correct - if you reach entry() in setup.c.
> >>>>
> >>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
> >>>>>> e.g.)?
> >>>>>>
> >>>>> Yes I have the below memory reserved in my dts:
> >>>>>
> >>>>>     memory@48000000 {
> >>>>>         device_type = "memory";
> >>>>>         /* first 128MB is reserved for secure area. */
> >>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
> >>>>>     };
> >>>>>
> >>>>>     reserved-memory {
> >>>>>         #address-cells = <2>;
> >>>>>         #size-cells = <2>;
> >>>>>         ranges;
> >>>>>
> >>>>>         jh_inmate@a7f00000 {
> >>>>>             status = "okay";
> >>>>>             no-map;
> >>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >>>>>         };
> >>>>>
> >>>>>         jailhouse: jailhouse@b6f00000 {
> >>>>>             status = "okay";
> >>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >>>>>             no-map;
> >>>>>         };
> >>>>>     };
> >>>>>
> >>>>> Linux does report the hole in RAM:
> >>>>>
> >>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> >>>>> 48000000-a7efffff : System RAM
> >>>>> b7f00000-bfffffff : System RAM
> >>>>>
> >>>>> And below is my root cell config related to hypervisor memory:
> >>>>>
> >>>>>         .hypervisor_memory = {
> >>>>>             .phys_start = 0xb6f00000,
> >>>>>             .size =       0x1000000,
> >>>>>         },
> >>>>>
> >>>>> Is there anything obvious I have missed above?
> >>>>>
> >>>>
> >>>> Nothing obvious to me so far.
> >>>>
> >>>> So, is this really the first instruction in
> >>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> >>>> Check the reported address by Linux against the disassembly of the
> >>>> hypervisor. You could also play with adding 'ret' as first instruction,
> >>>> to check if that returns without a crash.
> >>>>
> >>> I did play around with ret, below is my observation:
> >>>
> >>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> >>> returned without a crash. Adding a ret at line 99 [1] ie after
> >>> arm_dcaches_flush it never returned.
> >>>
> >>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> >>> first statement in arm_dcaches_flush and was able to see the panic!
> >>
> >> Which Jailhouse revision are you building? Already disassembled
> >> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
> >> have here for next:
> >>
> > I'm using the next branch too.
> >
> >> 0000ffffc0203efc <arm_dcaches_flush>:
> >>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
> >>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
> >>     ...
> >>
> >> 0000ffffc0204800 <arch_entry>:
> >>     ffffc0204800:       aa0003f0        mov     x16, x0
> >>     ffffc0204804:       aa1e03f1        mov     x17, x30
> >>     ...
> >>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
> >>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
> >>
> >> You could check if there is such a relative call in your case as well.
> > yes it does exist, below is the snippet:
> >
> > 0000ffffc0204000 <arch_entry>:
> >     ffffc0204000:    aa0003f0     mov    x16, x0
> >     ffffc0204004:    aa1e03f1     mov    x17, x30
> >     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
> >     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
> >     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
> >     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
> >     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
> >     ffffc020401c:    d2880003     mov    x3, #0x4000
> >  // #16384
> >     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
> >     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
> >     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
> >     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
> >     ffffc0204030:    cb0d018b     sub    x11, x12, x13
> >     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
> >     ffffc0204038:    8b0101ef     add    x15, x15, x1
> >     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
> >     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
> >     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
> >     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
> >     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
> >     ffffc0204050:    8b0b0021     add    x1, x1, x11
> >     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
> >     ffffc0204058:    f100025f     cmp    x18, #0x0
> >     ffffc020405c:    54000041     b.ne    ffffc0204064
> > <arch_entry+0x64>  // b.any
> >     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
> >     ffffc0204064:    d4000002     hvc    #0x0
> >     ffffc0204068:    d4000002     hvc    #0x0
> >     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
> >
> >> Then you could check, before jumping into arch_entry from the
> >> hypervisor, that the opcode at the actual arm_dcaches_flush address is
> >> as expected. But maybe already the building injects an issue here.
> >>
> > Any pointers on how I could do that?
> >
>
> arm_dcaches_flush is loaded at arch_entry (header->entry +
> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
> what is in your hypervisor.o (likely also d53b0024).
>
> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
> see if that code, specifically dcache_line_size, causes trouble outside
> of Jailhouse as well, maybe as inline assembly in the driver module.
>

With the below ret added, I get "JAILHOUSE_ENABLE: Success"

diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
index a9cabf7f..4e98b292 100644
--- a/hypervisor/arch/arm64/entry.S
+++ b/hypervisor/arch/arm64/entry.S
@@ -96,6 +96,7 @@ arch_entry:
         */
        ldr     x1, [x0, #HEADER_CORE_SIZE]
        mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
+       ret
        bl      arm_dcaches_flush

        /* install bootstrap_vectors */

Now when I undo the above and do the below, Im seeing a panic:

diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
index 39dad4af..ce29b8e8 100644
--- a/hypervisor/arch/arm64/caches.S
+++ b/hypervisor/arch/arm64/caches.S
@@ -40,6 +40,7 @@
  */
        .global arm_dcaches_flush
 arm_dcaches_flush:
+       ret
        dcache_line_size x3, x4
        add     x1, x0, x1
        sub     x4, x3, #1

Issue is seen even without dcache_line_size being called. Does that
mean we are not landing in arm_dcaches_flush?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8tM_umwZ-%2Bvt7VST1pBJF2MxmbOJSonzDDbJz_OV%3DGE3w%40mail.gmail.com.
