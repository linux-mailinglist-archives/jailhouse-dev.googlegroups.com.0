Return-Path: <jailhouse-dev+bncBCP5TCG4SYBBBPEOSCPAMGQE2IBIG4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113d.google.com (mail-yw1-x113d.google.com [IPv6:2607:f8b0:4864:20::113d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4C566B15A
	for <lists+jailhouse-dev@lfdr.de>; Sun, 15 Jan 2023 15:01:34 +0100 (CET)
Received: by mail-yw1-x113d.google.com with SMTP id 00721157ae682-4bdeb1bbeafsf273290507b3.4
        for <lists+jailhouse-dev@lfdr.de>; Sun, 15 Jan 2023 06:01:34 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673791293; cv=pass;
        d=google.com; s=arc-20160816;
        b=0whUh41IzcaHuHGBSZhYwUdG+i2x+dOuBttt85EzXG+jxEX/YYKyw17OOAPIXjcPy8
         /tPodyiokx4hJK7YciW84TT8khszSa2clX0z9fvphHtc+yvf3yf8PuWGLfAVLQmh01NE
         OB+yPpb8by10WX7pH3uc59Mbek1gHYITN2AsGkXkqCBttN1tj/3PYVb+ut78inR0YfrL
         qUCTOJc1p6jwHZTpQSAKaaoL5D1F++gMXNyNU85nBmka4dv7PSLzUU3bamA8VQZDZ+5j
         KcpXlV3pOpEuw3NbXvwUaHrzLX9dEqg9YgO0DAH+ftGp7TC5HgraKsguoYZc2klI4ob4
         ht+Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:sender:dkim-signature
         :dkim-signature;
        bh=bZmOgDwiHktNVRZF8pbyHrh0QYJ+7wyUEppgx/6Q+EQ=;
        b=xN8e3a45yzschbmZPVLlcBFk1+qW0wK759ezSTLKwYTGXv9eNkY/o0c8MXAYRNSbJn
         BDzCjpPHam9Gch+wkXq69MRzbKIurdv66ndIcgxx5DHyfg5trJ2Bq8mUtsT9cMl4gmsw
         D2VUPABmY9OQmU3m6gMT6l/2ONo6wNgDZVXPM8Y892mAo1QokAqgplz4GlErO0fZ8gOT
         GSoq9ji4aZ5fZ22c1pCgERlck/3/N8KY8axqGoVMSpcQMr4x5ESgIGpnVzuTy2knOdgC
         +vr9RWFJam/4uiaMRjZlMqyX8GykynuenkAqTk+KE7xolDWNYqJviEiGdZ2agOUZH3AE
         FijA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fc5k40RX;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1135 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZmOgDwiHktNVRZF8pbyHrh0QYJ+7wyUEppgx/6Q+EQ=;
        b=F18SPdxEK3OinDQzASJA5V/zfPPjAnuZeCYD0jkTzhDSZGCbuCVcSERIUd1rhOYrog
         xxv5yn/VsKef5gQPITU4ocpl53rI2qIojfGAq/CBvF9kmSWZEMKZEiCszW2vZaT/LA3f
         tpjJDWWs6z4OClZLQCgD/NM567LTNUA9aqICpiDCdUkaKAAcFDfGa0Ke2VAyG/F8GumO
         +EAD6kex4uNAAIdaBdvz0PMmj1hexzzQbOzniJ6KRrnsCLZStwjaOXE//3VUKXmjfG0s
         V+Kx/bAK6FOsStzhx6jN1I2co3zSy7x4ZN6KhGkPm6nasBVIyIX6z1ymK7U7Njdlsfx3
         n+QQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bZmOgDwiHktNVRZF8pbyHrh0QYJ+7wyUEppgx/6Q+EQ=;
        b=moVwhR6xvmxkbzSkHwRSkUHQaLM38R8cIgIeB34z29yIkUTv7EcT0OyikNtRy8e7Dj
         HDage3DcF0QSWfRroAavMFtpppeHwQJXVDjSdKZ0LsMWCpEEQhUbc842D+ARxj1DGKcX
         3gp/37O3IA4gOgA6HHmC9zurnKeoi8SkKlSiFHKsDbsX5mrl1MtPXCF47Wc769gU62KZ
         Lc+Spl1Dr4AhD2sGnDtdAES49gTbHoITQSJU0rHIayOl22YjNi614uduKWERIVKgR+ZL
         f0MyXNwHxCdZSt+nwcllG1cJoqVR9EWOBmF+Khw5tv6OJK+9nfN42NoS//WTsr/ZSO+v
         10HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:cc:to:subject
         :message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZmOgDwiHktNVRZF8pbyHrh0QYJ+7wyUEppgx/6Q+EQ=;
        b=cUwNtUAKIDGHyt8o1hxbcdzW0t8o/1Qxp73kykqthCzIRgVcztEVJqMpPC60EjV0aS
         yEHdpmhrsQzdzMGQ8M3YFQETNV4XVW7kMuB5GjH9LRVE4h93VGOQTHEpG4Jteg6q+7dk
         SuQN7DuDDzKiL2Yzw0V7vdFp7T09SalryChHgTtJf4yyhfXsOivNJO9lnlGEslpmr6EA
         0iCLKbmQ6IDSCr0Kee9OF9irVykMRN4KEN3lPk7hBs4kgcqRzfo2bkKkGBGhgDtrcj+4
         Ioxg4PmoDq5OXyMhyaQPV2Mi6fv3/AwOkPpsdX3OGc77f/AmAkhKZ0e1HtYBU+NWD7ed
         /rWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kr/Eh2Zib1nG1/6fvpah2FC1Tv4r5ZaLYL9FaykIMIohXbyyKJw
	GgHDhoAVfrXIUGtGOf/+tFk=
X-Google-Smtp-Source: AMrXdXuztZWg1mXTBp5uU1JwdkKCwIQWD1lwjIqIOBotY93l/T0HrcZ79MtMW60kVSGuyojzhW+H0w==
X-Received: by 2002:a25:7714:0:b0:7b6:c2e5:364e with SMTP id s20-20020a257714000000b007b6c2e5364emr3178239ybc.201.1673791293258;
        Sun, 15 Jan 2023 06:01:33 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:8083:0:b0:3da:3e43:9e3c with SMTP id q125-20020a818083000000b003da3e439e3cls5183630ywf.9.-pod-prod-gmail;
 Sun, 15 Jan 2023 06:01:32 -0800 (PST)
X-Received: by 2002:a05:7500:5aa0:b0:ea:69af:fad3 with SMTP id di32-20020a0575005aa000b000ea69affad3mr4767780gab.1.1673791292055;
        Sun, 15 Jan 2023 06:01:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673791292; cv=none;
        d=google.com; s=arc-20160816;
        b=VdNUN1toUfD/P8jkiYqH15Gb5mcsKsOojqRqp4a9jDhhpMdwjXZ0nWJt5Rpm3Z3yVc
         H3ZmZW+rEyf23Vwnam1SDhWPU9sCiOxOeTbUvjjiTIV+iyTvrYY33Oa2VzSN0qZH1DS5
         VO1B28JN0GYgsrkdlEalID/QOQakBXI9+UKqHymDV4+QWDqem+JhxYVOtvjc291FFq1x
         71iSGN3Q6Vhvyxt9WNJb+/eK7CfBqXcqlKm6TKBMcK3YmEhiKb7J4U5GjvoYM2wzs8g/
         g034ZBJqJeP9XCL5yWHWJgE5R89tc4/rOx8Fu77b6TodFcdS7MH2CetFnX6rmG9tL2AK
         A5kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Sis1m4nYKqoOsf96zl0xri+mkKRJlu/ENsnjYH96JOc=;
        b=wCQ9rxiaHggGCUmKDF59QZ709lHsIc8tJWEkNjBbjRhvBHP68j4XPJ2eDxvIdTKHOl
         3u4rlKQSat3+e8q40MuyPcEKHtxO1Yy9SdPk8iWOKp2iWiDHDCu0UIqamTsnzTEga3pf
         Xu+fpeQtkGFeo3wtLOONOJ3PP6zHI0DW9a97sgSJzhGcfMcfWELka65tgcslaZnNxKqJ
         rqUD12WrC4CB5bX6PIYCkjg8AAoQFSfo76pZ3Z64O5Yjt/g+bQvjndjkbUeimMmvm9zV
         RBA8FTrI+Zx1hYv9qd1JAlLGhjI4USUhh6qdPeuQn+x4mvXq9rkZUZdnB1VIP9qfrF9y
         JqRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=fc5k40RX;
       spf=pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1135 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com. [2607:f8b0:4864:20::1135])
        by gmr-mx.google.com with ESMTPS id az31-20020a056130039f00b005e51a1a1ef1si2747433uab.2.2023.01.15.06.01.32
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:01:32 -0800 (PST)
Received-SPF: pass (google.com: domain of prabhakar.csengg@gmail.com designates 2607:f8b0:4864:20::1135 as permitted sender) client-ip=2607:f8b0:4864:20::1135;
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-4e4a6af2d99so29629037b3.4
        for <jailhouse-dev@googlegroups.com>; Sun, 15 Jan 2023 06:01:32 -0800 (PST)
X-Received: by 2002:a81:9143:0:b0:4dc:f727:bffd with SMTP id
 i64-20020a819143000000b004dcf727bffdmr1442560ywg.249.1673791291757; Sun, 15
 Jan 2023 06:01:31 -0800 (PST)
MIME-Version: 1.0
References: <20221106230523.22567-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CA+V-a8uMPfCWMPxJ90AE=dzLSiEEk61Pn4Oxicpv_Sxd9hVhHg@mail.gmail.com>
 <a9e1e756-978a-f2de-c4cd-838f1417a8fc@siemens.com> <CA+V-a8u7x=JW1XE8xAcj_uH4EBw81mS8Lk3t6ZKf+ScgeiyO5w@mail.gmail.com>
 <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com>
In-Reply-To: <c81bdfb1-055a-071f-8838-66b35173241b@siemens.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 15 Jan 2023 14:01:05 +0000
Message-ID: <CA+V-a8vGTk42JrrN6_5N21i_mcUgsuzVc+v0wT1VQUaqmjcrEA@mail.gmail.com>
Subject: Re: [PATCH RESEND 0/3] Add support for Renesas RZ/G2M
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: jailhouse-dev@googlegroups.com, 
	Chris Paterson <chris.paterson2@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
X-Original-Sender: prabhakar.csengg@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=fc5k40RX;       spf=pass
 (google.com: domain of prabhakar.csengg@gmail.com designates
 2607:f8b0:4864:20::1135 as permitted sender) smtp.mailfrom=prabhakar.csengg@gmail.com;
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

On Wed, Jan 4, 2023 at 9:26 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
>
> On 02.01.23 21:55, Lad, Prabhakar wrote:
> > Hi Jan,
> >
> > On Mon, Jan 2, 2023 at 6:50 AM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >>
> >> Hi Prabhakar,
> >>
> >> On 29.11.22 15:29, Lad, Prabhakar wrote:
> >>> Hi Jan,
> >>>
> >>> On Sun, Nov 6, 2022 at 11:05 PM Lad Prabhakar
> >>> <prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> >>>>
> >>>> Hi All,
> >>>>
> >>>> This patch series adds support for Renesas RZ/G2M SoC [0] (root cell
> >>>> config) and adds demo cell config for HopeRun HiHope RZ/G2M platform [1].
> >>>>
> >>>> Changes apply on top of next branch [2] and the kernel used for testing is
> >>>> 5.10 (-cip) based on BSP-3.0.0 [3] release from Renesas.
> >>>>
> >>>> No changes from previous version sent to ML, just rebased on the next branch.
> >>>>
> >>>> [0] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-ultra-high-performance-microprocessors-arm-cortex-a57-and-arm-cortex-a53-cpus-3d-graphics-and-4k
> >>>> [1] https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzg2m-hihope-rzg2m-reference-board#overview
> >>>> [2] https://github.com/siemens/jailhouse/tree/next (9391d30a)
> >>>> [3] https://github.com/renesas-rz/meta-renesas/tree/BSP-3.0.0
> >>>>
> >>>> Cheers,
> >>>> Prabhakar
> >>>>
> >>>> Lad Prabhakar (3):
> >>>>   renesas: Add SCIF support
> >>>>   configs: arm64: Add root cell config for Renesas RZ/G2M SoC
> >>>>   configs: arm64: Add demo cell config for Renesas RZ/G2M
> >>>>
> >>>>  Documentation/debug-output.md                 |    1 +
> >>>>  configs/arm64/dts/inmate-r8a774a1-hihope.dts  |  228 ++++
> >>>>  configs/arm64/renesas-r8a774a1-linux-demo.c   |  114 ++
> >>>>  configs/arm64/renesas-r8a774a1.c              | 1134 +++++++++++++++++
> >>>>  hypervisor/arch/arm-common/Kbuild             |    2 +-
> >>>>  hypervisor/arch/arm-common/dbg-write.c        |    2 +
> >>>>  hypervisor/arch/arm-common/include/asm/uart.h |    2 +-
> >>>>  hypervisor/arch/arm-common/uart-scif.c        |   44 +
> >>>>  include/jailhouse/console.h                   |    1 +
> >>>>  inmates/lib/arm-common/Makefile.lib           |    2 +-
> >>>>  inmates/lib/arm-common/uart-scif.c            |   65 +
> >>>>  inmates/lib/arm-common/uart.c                 |    2 +
> >>>>  12 files changed, 1594 insertions(+), 3 deletions(-)
> >>>>  create mode 100644 configs/arm64/dts/inmate-r8a774a1-hihope.dts
> >>>>  create mode 100644 configs/arm64/renesas-r8a774a1-linux-demo.c
> >>>>  create mode 100644 configs/arm64/renesas-r8a774a1.c
> >>>>  create mode 100644 hypervisor/arch/arm-common/uart-scif.c
> >>>>  create mode 100644 inmates/lib/arm-common/uart-scif.c
> >>>>
> >>> Gentle ping.
> >>>
> >>
> >> Sorry for letting you wait /that/ long:
> >>
> >> Patches look good except that they are missing ivshmem support and an
> >> inmate-demo cell. You should have a demo and a networking ivshmem device
> >> in the root and the linux cell, the inmate demo needs just the demo
> >> device. Check out other boards for the required pattern, e.g. the rpi4.
> >>
> > OK, I will get this in. Can you please point me to any docs on testing
> > networking ivshmem device if any.
> >
>
> Once both cells are configured, you can assigned IPs to both network
> devices, ping them or do ssh from the root cell to the non-root one. See
> jailhouse-images for a pre-integration of such a setup, e.g. that of
> qemu-arm64. I've just pushed a new version that builds here into the
> 'next' branch (still needs more work).
>
I had couple of question,
1: For the pci_mmconfig_base should this PA? (If PA what range should
be ideally selected and should this be reserved in the root cell?)
2: How do we calculate vpci_irq_base?
3: When do we need to configure the stream_ids?
4: For the IVSHMEM 00:00.0 (demo) the PA range should this be reserved
in the root cell?
5: And similarly for IVSHMEM (networking) the PA range should this be
reserved in the root cell?

Cheers,
Prabhakar

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CA%2BV-a8vGTk42JrrN6_5N21i_mcUgsuzVc%2Bv0wT1VQUaqmjcrEA%40mail.gmail.com.
