Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBB2EJZWOQMGQEFUTPT3Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x138.google.com (mail-il1-x138.google.com [IPv6:2607:f8b0:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id E272565B749
	for <lists+jailhouse-dev@lfdr.de>; Mon,  2 Jan 2023 21:56:10 +0100 (CET)
Received: by mail-il1-x138.google.com with SMTP id l3-20020a056e021aa300b00304be32e9e5sf18391568ilv.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 02 Jan 2023 12:56:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1672692969; cv=pass;
        d=google.com; s=arc-20160816;
        b=HRtIL3egCl6/oucUocBozx7v+2oCCOLDnG7atox4QldYY2QfLHMEl6Jkq73cCytzpK
         NEAILHMCJ2wG6YSuJKUcKGnbahNdM3Rg/NvRLcSqMyNpgmTANHczgtfwXRjGFI8eKzvJ
         FPG8DgCSo1b29yR0bTzlPSIc+GNBfDjOVO6FXiohOwbBZ2R0O0JtoImb5YmHUPVfUYwv
         4OnncDLWKPBJFiqbeZEkIYehDpv3JhpkPZxXZkx8Q09Efo+WyVf+rPbihM4nQwAiFp9h
         1mEGAOkFTLHM9mksESnBe2I+7wESwgIyg+2SBkL5claF2yfgevZrKwZmzaXoE3wueYyk
         IBzQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=++bSx4eXnMtW50bbPPR3+a/G8qqtpR7Vs+WPUypme3s=;
        b=Cx13qeVey59W5mZGNZWcAisfe+A3KfNdiLuq0Dho6pFf02q6PLpnCAxmo8/POdaP1b
         Zlyu7Q/TDgPKyNjxfZrZklxCLZ1qWB5cl84rgQs0fwQzHj4PxGCamHkzHof9suwNSoI7
         FSSyGMonMRKuMQtkeRykxAkqb5ClRWQ0Wbos1KzYKG8A194FpZNKmtSdIEXf985bDpF8
         DSuXBjKhUXyyX+aSE71ihs/9WRyJXrJ0lii9OfgXRWyyglBcmBz0YvyfLh/D0fD/mBhS
         mI8dAw0+HihJFjKtWzs6uqNDOevkIH8nUqb96GvPJL7+wVIu+EVS9j6M+d0zwDQxcQrh
         t75Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhVmkfmU;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++bSx4eXnMtW50bbPPR3+a/G8qqtpR7Vs+WPUypme3s=;
        b=VDpIFqycrUy1cyYb69ojWOIxxQqsLbgZLZ4lQjNGnwR+1jtfOPyW1ntBrZoxxYeetE
         4SdGHZyW3JGJEVz5l/9h117SE32nmrf0QGbctbbHiAD9Q7i/1m6H1/MS5FPmv0xuyJP2
         Sx3I8lVCUpOL3dHWV4oNsZr0n0y8u1teWatUO7EvbQEVMGMWDXtr6CK2cm9CwS9bh0U2
         BJzO2V7K7rbNpbQrh6ZaPFwfMj7IP6qF6/4VyYDGHJqEMdche1n4QePEzFFwm9GHmgXc
         LLH6Xxa12W8E/lrGzIuUDLI8VIy1XZz8RWivZEkSaG67tEeRnoImMThcqoJwYwRSkcSR
         Tx6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++bSx4eXnMtW50bbPPR3+a/G8qqtpR7Vs+WPUypme3s=;
        b=iHai4aT5J2Do5MzR/t1hHrZ74WJX50qcdaE3HolICpSO3wKSiCy1jlJ+ELRp05sk29
         zNXgjexb6qk9cQ4lX8cQU3vPtwfyZjJWLDTVSyhxHsTcbBlxOvQxbX56Z5wwd32jxC8L
         ILcz9b/39cjulMfUdOckdKXArBVOr9xvjIPPgnouIBfKiI2ypmohU/xlXrhisoXfKXGo
         02gQXdEwZRbGiRoCiNu+X7PKjrArLEph2kMLnG/8Bg095oEn2NB+jyQwbkpKLGsalrxg
         794fBAf2F6OuKy0TlD8yHsCxZP8ciLHvYPZ06Sk8EYMtLk239QUklalBv1HHTo7IqpDi
         M+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++bSx4eXnMtW50bbPPR3+a/G8qqtpR7Vs+WPUypme3s=;
        b=du3Pl5EwpAM9l39k+Z7O0MGfUyRY/eu79YuOgpzibbzETyTvlw+9AWweNIybphWyfI
         GJAxVsbfdjszrjzP5Kn3cPzEn63XQG9Z5xrx1zz0Fc47HhulcSbDRZ+Pt5C+PWFCoWXz
         dcLKsLUjoBuyWXwR3I4pzXMCeyoyWWoyDuxKmjZnQrqVaYWqojukwsMysa6Udi0xwDr5
         IxGSMl5dtIJGut+ihkREjFT427c/OrlVyFCGc0FkLKY7uPtwbV8XWihRAesUIAyuwHWT
         i6dS440lg8/Ge8rhG8+RP2ZwlJAlVTyj/u3lR3KPls/ZNf8MMFId5zy5/8k+tJbvUIFX
         8FsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpnOFAF0nDza5iBeL6hvZZ9QVznyXYX9VtSgDuuCKJ1L9HRxt2Z
	e7pDSysO57B35pRf7gUNV1U=
X-Google-Smtp-Source: AMrXdXvToINgfwCugFU4vD7UjP8cip2gqRNZPhOlNygh52PUzFs51Tud6mdb1KeC2qCOOpevugHE5Q==
X-Received: by 2002:a05:6e02:d0f:b0:30c:5346:961d with SMTP id g15-20020a056e020d0f00b0030c5346961dmr262583ilj.78.1672692969369;
        Mon, 02 Jan 2023 12:56:09 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6e02:d45:b0:30c:3e04:ab2 with SMTP id
 h5-20020a056e020d4500b0030c3e040ab2ls1040131ilj.9.-pod-prod-gmail; Mon, 02
 Jan 2023 12:56:08 -0800 (PST)
X-Received: by 2002:a05:6e02:103:b0:30b:e570:57d8 with SMTP id t3-20020a056e02010300b0030be57057d8mr31643618ilm.8.1672692968256;
        Mon, 02 Jan 2023 12:56:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672692968; cv=none;
        d=google.com; s=arc-20160816;
        b=eFqq17AH8ZMqQupznwCtoLrJYpFmx+okox3u7K4KD1rL6sfYYdNZa8pCblvdX+8B2E
         eK3vHPJYIdt54VaLjHGGSJRhgnYdCRrYQT7+Jn5J6yj5OYygkm90rhhgCM+q27UUmEp1
         dEXBsWUVBuxSglklwW9VBnYgeujcyUeuCJPNJOhsLiNP6AvEQDg8WPSbHoqonVYUXZBI
         Who2XC2INqo1eGyld9bltLjHVI9ngjUGhXR8exoqLQimuKK+vvILom9dfgsz1SnbVZFM
         4gExQ3HhIqFZs4g/d5L2BvivBFh8uqsydkM1mh9hzo5ofWo/F6mkxOCpK5/8iyt06J67
         ql0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=db06Fi+sMoVtjMTei+RlP/vr3SLaYbFV429haAgfPWI=;
        b=BjTa88bP76ZrQmo1PfXWNacUJXskpqsLJh5cTYs0aVw6yrwCXpyzE77xIvjTU5VOwV
         K6ZJoJsvihjuy0kRpwyuRpUOmZ00ExEryegz/7jOlBHHdUZH3A5g7PygFGRuoYvajdE0
         d49KfHvFEFrO2nbxCwvp7JbMeDRxsYZG9mF9MK/3E43kWs4sMwnA4yr77Ynjc7ZpghOq
         QJQbklobWxV5gJ/z98GorilFKpzo0g2YSWxeFPpHMQKqQjc1eXugIAwHb4v1FS5ZO450
         g4uHFzAvFxZRxkupLCEBSaxUpoEQSTjfgCu5o4I5Yyb1WHIayVtanjz0QkPWMHtHQ80G
         XnKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=qhVmkfmU;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com. [2607:f8b0:4864:20::b30])
        by gmr-mx.google.com with ESMTPS id g7-20020a92c7c7000000b00302bbaab7fcsi2886858ilk.4.2023.01.02.12.56.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Jan 2023 12:56:08 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::b30 as permitted sender) client-ip=2607:f8b0:4864:20::b30;
Received: by mail-yb1-xb30.google.com with SMTP id g4so31177843ybg.7
        for <jailhouse-dev@googlegroups.com>; Mon, 02 Jan 2023 12:56:08 -0800 (PST)
X-Received: by 2002:a25:7653:0:b0:6f9:13cc:de91 with SMTP id
 r80-20020a257653000000b006f913ccde91mr4863274ybc.328.1672692967888; Mon, 02
 Jan 2023 12:56:07 -0800 (PST)
MIME-Version: 1.0
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com> <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com>
In-Reply-To: <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 2 Jan 2023 20:55:41 +0000
Message-ID: <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=qhVmkfmU;       spf=pass
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

Hi Jan,

On Mon, Jan 2, 2023 at 6:50 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> Hi Prabhakar,
>
> On 29.11.22 15:29, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
> > <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >>
> >> Hi All,
> >>
> >> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> >> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
> >>
> >> Changes apply on top of next branch [2] and the kernel used for testing is
> >> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
> >>
> >> No changes from previous version sent to ML, just rebased on the next branch.
> >>
> >> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> >> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> >> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
> >> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
> >>
> >> Cheers,
> >> Prabhakar
> >>
> >> Lad Prabhakar (3):
> >>   renesas: Add SCIF support
> >>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
> >>   configs: arm64: Add demo cell config for Renesas RZ/G2M
> >>
> >>  Documentation/debug-output.md                 |    1 +
> >>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
> >>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
> >>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
> >>  hypervisor/arch/arm-common/Kbuild             |    2 +-
> >>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
> >>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
> >>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
> >>  include/jailhouse/console.h                   |    1 +
> >>  inmates/lib/arm-common/Makefile.lib           |    2 +-
> >>  inmates/lib/arm-common/uart-scif.c            |   65 +
> >>  inmates/lib/arm-common/uart.c                 |    2 +
> >>  12 files changed, 1594 insertions(+), 3 deletions(-)
> >>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
> >>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
> >>  create mode 100644 configs/arm64/renesas-r8a774a1.c
> >>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
> >>  create mode 100644 inmates/lib/arm-common/uart-scif.c
> >>
> > Gentle ping.
> >
>
> Sorry for letting you wait /that/ long:
>
> Patches look good except that they are missing ivshmem support and an
> inmate-demo cell. You should have a demo and a networking ivshmem device
> in the root and the linux cell, the inmate demo needs just the demo
> device. Check out other boards for the required pattern, e.g. the rpi4.
>
OK, I will get this in. Can you please point me to any docs on testing
networking ivshmem device if any.

> I'm merging patch 1 already as this is independent.
>
Thank you.

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8u7x%3DJW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf%2BScgeiyO5w%40mail.gmail.com.
