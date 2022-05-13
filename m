Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB2US7CJQMGQEGYOC64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id DB6A1525C59
	for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 09:31:57 +0200 (CEST)
Received: by mail-pl1-x63d.google.com with SMTP id c4-20020a170902c2c400b0015f16fb4a54sf3968600pla.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 13 May 2022 00:31:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1652427115; cv=pass;
        d=google.com; s=arc-20160816;
        b=T8Bt0m/RBbeW0ck0cqoqS8GbYYH9Ygs8ResEz+XDJaD4k0W6iXs+0+Tf+gl5OyHh+0
         AtvwN1/8JR7YNtt+P4h8NRLnDOpvUNY9lJGvTElrE/z7RsJbq+abjqa47XPIH/MRLFmb
         dkyG8OsGyBDZJ+dgtqlooF0By5gLX/SGMuB0HZP8WRiLpBtEzzfBF/bCFfIdi8AgByTr
         hG6nryIi0q9aDgRks0H/yLWbxsMdD08yEB/657/XatOlo0O2fAMTvBqPd0w+1oTsP1Vv
         Qy06qTzt2PFc07cLlvAn6kyoziwWrFhstYjNuOmjje99NLqFcqpzRFKP3pZboEz3+bm/
         NF4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=pnkKraM2s5gsv+PnKxDUtebEULmEO/1DyPPpeKTAxtk=;
        b=YKdZRebttoM7baZYsXeN4+18jxWgIu7PCh8BeOVmeZSQFU8e4SsveDAch0mtTDeVcO
         +rqcUnfRQIvbk8uTtdvB/0s23+/COYBHl3tslyDt3PNFVMPtVeNg1Va1YzQuhjIxvj8P
         OGE8+frcT1ocsTAwlbE2jdHES217cgtMc2aMGjLCwcMMsyILV5I/kzMEOCHIjhkswFFs
         Q2skKNjxnxn+4MA5h2Yai5dWJ5aR67ZjU06lYR1bbBsSgrgNBBIATNXGYQhCkG+EXGgq
         adIUjgmquIxjD3mFiBjpwLe2c8Yd+/TtQNLH8YlUJ8k9XMhn/RXzFLqq6cwyk90PAHbP
         HUJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=leW7HMdE;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:references:in-reply-to:from:date:message-id
         :subject:to:cc:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pnkKraM2s5gsv+PnKxDUtebEULmEO/1DyPPpeKTAxtk=;
        b=nRP5K4KB3DZtJXASkszIOpdeWBMVdAw/Ct5hTZ/INPIWz3dwbuD6dmHbGMmvWAzuwb
         E+pbpddcWuMfOOIR9Y4O3Rh4JkKrAhAg6Sr/paYJjBJiZZYxOghyyra57FSQmo98wVM2
         VPmtdw14mw6cW4nmxiTD2lr/cs7EfIng0nzWSu6N+Gc8Og0kcWyghCIjzeNAa3zTUpZY
         y0Nx754HYuECo3az5v03WcwPDjji9ztF/OSug1oGa9kE4wJRuytjEMyvI2hTp48R2yFL
         CjsN0GZfiKwpItqbBcLJVTjUaoFCm22HJNdkz3PzYs3cQgk4IVnzuDdq4H+t5E8ZMNRz
         Hu7w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pnkKraM2s5gsv+PnKxDUtebEULmEO/1DyPPpeKTAxtk=;
        b=bDNZ4pT3w/dear6uS+MTFf/sxwjjI27DdNTKFISj7ZjZ4el5IWT3GdRg+YkZSyVtCy
         VxKaSZ1zxSHBM3to80evfwAxjwXekaV/OIl0MexS2vudJ2212l7PDlKCeIIJJ83Hwo73
         twnDl+ub8YfUVR0bnKUIpBH14UnQA1kg5sJ+MD/KrAq6MQRz1p3zUUzXeL1QH9Gjzvt7
         qOe45nYNzV0Qh3tE6ZM8WzpivgFpFaZ5AcjFTbsJS9rLp2Ocz3+2kLaSPNsgsy2zphOK
         MTPsI06JpBuqBxBLCnqCAbtlzsNFQVva8YM9hAvWW1VG37a614Vl2pXZc3tjkFpL5WdJ
         U07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:references:in-reply-to:from
         :date:message-id:subject:to:cc:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pnkKraM2s5gsv+PnKxDUtebEULmEO/1DyPPpeKTAxtk=;
        b=15fBwOfHWHSvRcY/+UPK1Zd07v9yLV17U8AIzlHXbnNkbCcGwM80IutYqay4yTipn1
         4ef4DUxiNoqmLqkt4CkS+s/jWrklfnhn8GyzrnhNqvqZSwC/WWTiGvlO8NqipMU6X3A9
         XigVTuyfdQ9OQqLJNn80H6fPTZ18L04P0M7DO95lktUpS8JOYwhL8w02zrOVdjSVZkoN
         tRM3G/ftVycKKPUEKsrJbuonKzXDnocq/GKbl+tMY/93owC9vezMYshCmE6P7umCfA7/
         zO/d0FsIVVcd3CeK1jg349d9vG14PKJI28TrGOvMVbQw2Z8s+MsX5MXWx9ScjJJFfarp
         ameA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532u5/avpWpwDWqlkF0giOVeL3iVYB4xVxLJMqSk3BCdNjG7SkkM
	szqfBohyZO+WFG4ACrzM7FY=
X-Google-Smtp-Source: ABdhPJzJGNqGKzLwpcqbV6feowbuS7c4l3MBVouOVFPamjk7zYX5e1VUAmLbeO4dLQVACygIiZ2cMw==
X-Received: by 2002:aa7:8d47:0:b0:4f6:a7f9:1ead with SMTP id s7-20020aa78d47000000b004f6a7f91eadmr3413990pfe.42.1652427115198;
        Fri, 13 May 2022 00:31:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6a00:1892:b0:50d:e422:6921 with SMTP id
 x18-20020a056a00189200b0050de4226921ls3531139pfh.0.gmail; Fri, 13 May 2022
 00:31:54 -0700 (PDT)
X-Received: by 2002:aa7:848a:0:b0:510:44da:223d with SMTP id u10-20020aa7848a000000b0051044da223dmr3212426pfn.66.1652427113984;
        Fri, 13 May 2022 00:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652427113; cv=none;
        d=google.com; s=arc-20160816;
        b=OlQcqybovXA95hypulgDMqSYVmxi4ctvsuPG3m/PJhPDBssr0i7kQd5FCfoNUdghnb
         VFSLuSPFP+TNU0mPZg26x5TkrkZvYDJglL4NtvNAjFNlfJ81ysHi1DqxwfZw9uiiZer2
         6rX/P/5XvrNEv3BIkKa4dXZYjUUT4mmlkuSBbXTuuZdy5Jd9hIlkd2HnoOB8NTBbi3rM
         GETnxTDAbKfCxRhnqie1wt2muilzusOtWLggIJcMo4WZi7VXlACo5CWBW0Fv/YQNaKen
         UR0HSWYyXzLaCP+fDMg6MLRElmd9cr5IHMbeJ2kDM3eB/b5GivjOkERtfA5wLT7fqDdd
         KubA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9ANYQ2skIxgIpOef2VckV3rWgC0x7p9YTTMt2niF+Hg=;
        b=M4+6EFEi+x9LwQme93WzSCxKh3mb/cR0nvphz48BSanRUOv6Pgush8cgx2hEslijdF
         y3q378WiWONzxxmMgPjTGZgT8Svg0IZKdyvfUIevJmiL3rAZiPxz4SjHd+X2jJSt12qj
         HPvSvmbn6AH2xLgf7Z4TsiQagDT8pIMNnS0JHlTIh4Z5L8c1z6mJnr1T5ddidY1fcCAY
         CloUIhTenbTRN3VYElYFKSt1OuG7jPWt3PAUplU5nqPEHJiQKVHd36EnBTr3ukyyOwhY
         b+oL1QZ6+hGynQKBkf6lNz76Z7UYzSB2qwn3N6V0rup8ifiBQF9OeL6xLnoLedXP7jBO
         H1OA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=leW7HMdE;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com. [2607:f8b0:4864:20::b32])
        by gmr-mx.google.com with ESMTPS id 3-20020a170902c20300b0015eb393d68esi139489pll.0.2022.05.13.00.31.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 00:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b32 as permitted sender) client-ip=2607:f8b0:4864:20::b32;
Received: by mail-yb1-xb32.google.com with SMTP id x74so1203255ybe.4
        for <jailhouse-dev@googlegroups.com>; Fri, 13 May 2022 00:31:53 -0700 (PDT)
X-Received: by 2002:a5b:246:0:b0:619:5651:3907 with SMTP id
 g6-20020a5b0246000000b0061956513907mr3558341ybp.190.1652427113184; Fri, 13
 May 2022 00:31:53 -0700 (PDT)
MIME-Version: 1.0
References: <2dcadf3d-1df9-497a-a530-be01a5da96e9n@googlegroups.com>
 <f0853228-55dd-465b-8db1-01f6d3f26d8fn@googlegroups.com> <d22051fb-2c80-2d88-af8c-5f1ccdb69197@siemens.com>
 <CA+V-a8sQAYXHykiGqn8DD8=cL4fv4NcszvgFgza2gE3_MCyRmQ@mail.gmail.com>
 <37be2e7c-c1f4-c5b6-f200-8d1cc48e0ee5@siemens.com> <CA+V-a8t-wvud8MF0oyAsHBSUuVQrrkqSr9RWE2tQLCoOzuQikw@mail.gmail.com>
 <fe2e7e92-8530-9913-307f-85437412fd81@siemens.com> <CA+V-a8sgPXsMmsKYwE6etP=JG8Ef83Qz4RHoWAZKeHdVHhk_Pw@mail.gmail.com>
 <5ea8c025-13f2-4754-479a-21395de9306d@siemens.com> <CA+V-a8tM_umwZ-+vt7VST1pBJF2MxmbOJSonzDDbJz_OV=GE3w@mail.gmail.com>
 <a866cda9-fa1c-3033-3cc9-b0762b0ae6b5@siemens.com>
In-Reply-To: <a866cda9-fa1c-3033-3cc9-b0762b0ae6b5@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 13 May 2022 08:31:26 +0100
Message-ID: <CA+V-a8uh_mJNrN8R8cHb+MwTG1=DPyjy3kEOwfozRdOL+jz3zw@mail.gmail.com>
Subject: Re: Kernel panic on enabling root cell
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=leW7HMdE;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::b32 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Thu, May 12, 2022 at 6:05 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 12.05.22 13:37, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Thu, May 12, 2022 at 12:16 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> On 12.05.22 13:06, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Thu, May 12, 2022 at 11:24 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>
> >>>> On 12.05.22 09:01, Lad, Prabhakar wrote:
> >>>>> Hi Jan,
> >>>>>
> >>>>> On Thu, May 12, 2022 at 6:45 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>
> >>>>>> On 11.05.22 19:09, Lad, Prabhakar wrote:
> >>>>>>> Hi Jan,
> >>>>>>>
> >>>>>>> On Wed, May 11, 2022 at 4:11 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>>>>>>>
> >>>>>>>> On 11.05.22 13:20, Prabhakar Lad wrote:
> >>>>>>>>> To add further more details:
> >>>>>>>>>
> >>>>>>>>> I am using jailhouse-enabling/5.10 Linux branch [0] with -next branch
> >>>>>>>>> for jailhouse [1].
> >>>>>>>>>
> >>>>>>>>> I added some debug prints and I see the panic is caused when entry()
> >>>>>>>>> function is called (in enter_hypervisor). The entry function lands into
> >>>>>>>>> assembly code (entry.S). I dont have a JTAG to see which exact
> >>>>>>>>> instruction is causing this issue.
> >>>>>>>>
> >>>>>>>> So, already the first instruction in the loaded hypervisor binary is not
> >>>>>>>> executable? That would explain why we see no hypervisor output at all.
> >>>>>>>>
> >>>>>>> To clarify when the hypervisor is loaded the output will be via
> >>>>>>> debug_console specified in the root cell config?
> >>>>>>>
> >>>>>>
> >>>>>> Correct - if you reach entry() in setup.c.
> >>>>>>
> >>>>>>>> Was that memory region properly reserved from Linux (via DTB carve-out
> >>>>>>>> e.g.)?
> >>>>>>>>
> >>>>>>> Yes I have the below memory reserved in my dts:
> >>>>>>>
> >>>>>>>     memory@48000000 {
> >>>>>>>         device_type = "memory";
> >>>>>>>         /* first 128MB is reserved for secure area. */
> >>>>>>>         reg = <0x0 0x48000000 0x0 0x78000000>;
> >>>>>>>     };
> >>>>>>>
> >>>>>>>     reserved-memory {
> >>>>>>>         #address-cells = <2>;
> >>>>>>>         #size-cells = <2>;
> >>>>>>>         ranges;
> >>>>>>>
> >>>>>>>         jh_inmate@a7f00000 {
> >>>>>>>             status = "okay";
> >>>>>>>             no-map;
> >>>>>>>             reg = <0x00 0xa7f00000 0x00 0xf000000>;
> >>>>>>>         };
> >>>>>>>
> >>>>>>>         jailhouse: jailhouse@b6f00000 {
> >>>>>>>             status = "okay";
> >>>>>>>             reg = <0x0 0xb6f00000 0x0 0x1000000>;
> >>>>>>>             no-map;
> >>>>>>>         };
> >>>>>>>     };
> >>>>>>>
> >>>>>>> Linux does report the hole in RAM:
> >>>>>>>
> >>>>>>> root@smarc-rzg2l:~# cat /proc/iomem  |  grep RAM
> >>>>>>> 48000000-a7efffff : System RAM
> >>>>>>> b7f00000-bfffffff : System RAM
> >>>>>>>
> >>>>>>> And below is my root cell config related to hypervisor memory:
> >>>>>>>
> >>>>>>>         .hypervisor_memory = {
> >>>>>>>             .phys_start = 0xb6f00000,
> >>>>>>>             .size =       0x1000000,
> >>>>>>>         },
> >>>>>>>
> >>>>>>> Is there anything obvious I have missed above?
> >>>>>>>
> >>>>>>
> >>>>>> Nothing obvious to me so far.
> >>>>>>
> >>>>>> So, is this really the first instruction in
> >>>>>> hypervisor/arch/arm64/entry.S, arch_entry, that triggers the undefinstr?
> >>>>>> Check the reported address by Linux against the disassembly of the
> >>>>>> hypervisor. You could also play with adding 'ret' as first instruction,
> >>>>>> to check if that returns without a crash.
> >>>>>>
> >>>>> I did play around with ret, below is my observation:
> >>>>>
> >>>>> Up until line 98 [0] just before calling arm_dcaches_flush adding ret
> >>>>> returned without a crash. Adding a ret at line 99 [1] ie after
> >>>>> arm_dcaches_flush it never returned.
> >>>>>
> >>>>> So I continued with adding ret in  arm_dcaches_flush, I added ret as a
> >>>>> first statement in arm_dcaches_flush and was able to see the panic!
> >>>>
> >>>> Which Jailhouse revision are you building? Already disassembled
> >>>> hypervisor.o around arch_entry and arm_dcaches_flush? This is what I
> >>>> have here for next:
> >>>>
> >>> I'm using the next branch too.
> >>>
> >>>> 0000ffffc0203efc <arm_dcaches_flush>:
> >>>>     ffffc0203efc:       d53b0024        mrs     x4, ctr_el0
> >>>>     ffffc0203f00:       d3504c84        ubfx    x4, x4, #16, #4
> >>>>     ...
> >>>>
> >>>> 0000ffffc0204800 <arch_entry>:
> >>>>     ffffc0204800:       aa0003f0        mov     x16, x0
> >>>>     ffffc0204804:       aa1e03f1        mov     x17, x30
> >>>>     ...
> >>>>     ffffc0204844:       d2800042        mov     x2, #0x2                        // #2
> >>>>     ffffc0204848:       97fffdad        bl      ffffc0203efc <arm_dcaches_flush>
> >>>>
> >>>> You could check if there is such a relative call in your case as well.
> >>> yes it does exist, below is the snippet:
> >>>
> >>> 0000ffffc0204000 <arch_entry>:
> >>>     ffffc0204000:    aa0003f0     mov    x16, x0
> >>>     ffffc0204004:    aa1e03f1     mov    x17, x30
> >>>     ffffc0204008:    10fdffc0     adr    x0, ffffc0200000 <hypervisor_header>
> >>>     ffffc020400c:    f9402412     ldr    x18, [x0, #72]
> >>>     ffffc0204010:    5800fd0f     ldr    x15, ffffc0205fb0 <sdei_handler+0x2c>
> >>>     ffffc0204014:    900000e1     adrp    x1, ffffc0220000 <__page_pool>
> >>>     ffffc0204018:    79406002     ldrh    w2, [x0, #48]
> >>>     ffffc020401c:    d2880003     mov    x3, #0x4000
> >>>  // #16384
> >>>     ffffc0204020:    9b030441     madd    x1, x2, x3, x1
> >>>     ffffc0204024:    f842c02e     ldur    x14, [x1, #44]
> >>>     ffffc0204028:    5800fc8d     ldr    x13, ffffc0205fb8 <sdei_handler+0x34>
> >>>     ffffc020402c:    f840c02c     ldur    x12, [x1, #12]
> >>>     ffffc0204030:    cb0d018b     sub    x11, x12, x13
> >>>     ffffc0204034:    924051c1     and    x1, x14, #0x1fffff
> >>>     ffffc0204038:    8b0101ef     add    x15, x15, x1
> >>>     ffffc020403c:    f9001c0f     str    x15, [x0, #56]
> >>>     ffffc0204040:    f9400401     ldr    x1, [x0, #8]
> >>>     ffffc0204044:    d2800042     mov    x2, #0x2                       // #2
> >>>     ffffc0204048:    97ffff6c     bl    ffffc0203df8 <arm_dcaches_flush>
> >>>     ffffc020404c:    5800fba1     ldr    x1, ffffc0205fc0 <sdei_handler+0x3c>
> >>>     ffffc0204050:    8b0b0021     add    x1, x1, x11
> >>>     ffffc0204054:    d2800000     mov    x0, #0x0                       // #0
> >>>     ffffc0204058:    f100025f     cmp    x18, #0x0
> >>>     ffffc020405c:    54000041     b.ne    ffffc0204064
> >>> <arch_entry+0x64>  // b.any
> >>>     ffffc0204060:    d2800020     mov    x0, #0x1                       // #1
> >>>     ffffc0204064:    d4000002     hvc    #0x0
> >>>     ffffc0204068:    d4000002     hvc    #0x0
> >>>     ffffc020406c:    14000000     b    ffffc020406c <arch_entry+0x6c>
> >>>
> >>>> Then you could check, before jumping into arch_entry from the
> >>>> hypervisor, that the opcode at the actual arm_dcaches_flush address is
> >>>> as expected. But maybe already the building injects an issue here.
> >>>>
> >>> Any pointers on how I could do that?
> >>>
> >>
> >> arm_dcaches_flush is loaded at arch_entry (header->entry +
> >> hypervisor_mem) - 0x208. Read the u32 at that address and check if it is
> >> what is in your hypervisor.o (likely also d53b0024).
> >>
> >> If that is the case, not the jump but that "mrs     x4, ctr_el0" may
> >> actually be the problem. Check out hypervisor/arch/arm64/caches.S and
> >> see if that code, specifically dcache_line_size, causes trouble outside
> >> of Jailhouse as well, maybe as inline assembly in the driver module.
> >>
> >
> > With the below ret added, I get "JAILHOUSE_ENABLE: Success"
> >
> > diff --git a/hypervisor/arch/arm64/entry.S b/hypervisor/arch/arm64/entry.S
> > index a9cabf7f..4e98b292 100644
> > --- a/hypervisor/arch/arm64/entry.S
> > +++ b/hypervisor/arch/arm64/entry.S
> > @@ -96,6 +96,7 @@ arch_entry:
> >          */
> >         ldr     x1, [x0, #HEADER_CORE_SIZE]
> >         mov     x2, DCACHE_CLEAN_AND_INVALIDATE_ASM
> > +       ret
> >         bl      arm_dcaches_flush
> >
> >         /* install bootstrap_vectors */
> >
> > Now when I undo the above and do the below, Im seeing a panic:
> >
> > diff --git a/hypervisor/arch/arm64/caches.S b/hypervisor/arch/arm64/caches.S
> > index 39dad4af..ce29b8e8 100644
> > --- a/hypervisor/arch/arm64/caches.S
> > +++ b/hypervisor/arch/arm64/caches.S
> > @@ -40,6 +40,7 @@
> >   */
> >         .global arm_dcaches_flush
> >  arm_dcaches_flush:
> > +       ret
> >         dcache_line_size x3, x4
> >         add     x1, x0, x1
> >         sub     x4, x3, #1
> >
> > Issue is seen even without dcache_line_size being called. Does that
> > mean we are not landing in arm_dcaches_flush?
>
> Likely. I've never seen such an effect.
>
> If you look the reported fault address, when making it relative
> (subtract hypervisor_mem), is that arm_dcaches_flush (relative to
> arch_entry)?
>
Could you please elaborate on it more. I moved the cache.S code in
entry.S  file but still seeing the same issue.

In some of the reference platforms LPAE is enabled in the u-boot. Is
that a strict requirement? Also in the requirement section it's
mentioned "Linux is started in HYP mode" does that mean Before loading
the jailhouse the Linux should be running on EL2? Also to be sure, do
we need any special configs enabled in TF-A at all?

Fyi, I am using arm64_defconfig_5.10 [0] (+ additional configs to
enable my platform) to build the Linux kernel, should these configs be
sufficient for Jailhouse?

[0] https://github.com/siemens/jailhouse-images/blob/next/recipes-kernel/linux/files/arm64_defconfig_5.10

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8uh_mJNrN8R8cHb%2BMwTG1%3DDPyjy3kEOwfozRdOL%2Bjz3zw%40mail.gmail.com.
