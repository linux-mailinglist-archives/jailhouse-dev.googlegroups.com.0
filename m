Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBWUGRGPQMGQEPQPY77Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63a.google.com (mail-ej1-x63a.google.com [IPv6:2a00:1450:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9672968D66F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:03 +0100 (CET)
Received: by mail-ej1-x63a.google.com with SMTP id qc18-20020a170906d8b200b0088e3a3a02b6sf10864648ejb.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772763; cv=pass;
        d=google.com; s=arc-20160816;
        b=PEKeSoKAi+fy4DcxufkTpIcfsRESAhis+/noFyDP3sr/0VKt3/wMWpMvYiEQ/apuUK
         SzCKfG1OzIZf2tGwDYvZdQIiLH1eg6P5KL627h8wEoKcxjSb9ofx111zAwrM/uJXebVZ
         MkhycaFQ/aDYv6OJNIEnQBGlfEe5JBfZl1XfOxj80e7tXR9fn0GvXYlUrZ2AkG6pHLDL
         gK8AMTCQ0d406RVlQ+iwDiMXfgi+awXAP/wnYp3Ga1PYcN8HwEMAx6qfSejaAaO5CrNv
         owDekVkQyY6KNDSHo8L32T1ktXEaWRS5IFhWtq3Ze+oaVvwINFpb5k9huKqdGk9kgp7V
         d9rg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=NgL5T3FUGa4VH797fsxNKO/zGXTT2q3HmrRDjZWTVW0=;
        b=pTDcEBYEQyQHrVNDJXYLIQ11U8XuBSlHZ4VmoWX6jlFEUcrWKSBIYxWfqnWVmf1sdS
         rJUj9qIdWVO5svCZjzdDt4yTtGCyKNwgUV0q8ka16Fl11WuhhtN1h1ZxZOOxm8A4u74H
         4+C638qnfzXb7PsDMhyNGx1gEn1SgJqIOBiSzi7R+Bc5IHoY4bH77IXbYZ9H64WwqhCT
         cm0m5LMPOTgqlYetaM2APwDTWmQKVyMg3JdqX/YAZX7NqYZQzj53D1sY7X3wXzI5o3fQ
         sSvrNT6yVEOtVHal7cJNdbcJpqnNpHrXqfhalD5M0wlzJUR+xdb0ncQ+mNuoGKlGDwD8
         Y8Cg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NgL5T3FUGa4VH797fsxNKO/zGXTT2q3HmrRDjZWTVW0=;
        b=NJ/qPO4XOBCR0EzJDXBiqTcgqh6O7xlEyswsTe2kzXOkjmrCa/Oji2xTHsIa0tvYh0
         2DURftAR2thGU2NH3gWxA/Hr4WrHOGrI+VYelxeJLKbu7phpux/ouH4yCOgkcx0g9Kjh
         kF8BQQAMtheUGeT0Znd0whLNQM7m71TsTSr8CWm4ts/XtsCzYli9rKMMjLmAXKmio9u/
         xeXMze4gGvYGogAxtExyfMFOZqzEXjd5zA8oxP5/CZ7qaV7GDQYdgI8YPXCkuL/x6LEp
         wX8WlhLIEnm4BwB6GeQkmTHoPeeUnKlu9bdN2JzX1n7EZ7ADtSDUz6HFnNpWhtS3oJB/
         Mfaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgL5T3FUGa4VH797fsxNKO/zGXTT2q3HmrRDjZWTVW0=;
        b=M+QSDkWn1XPtdy4caUdZsTEbM3RFIC95mxSn8FJyDWnWJi5XKxT5ZyPQjJxL1vh3s5
         HiA0YaimWCh6jQECiurKVuYIxufMzOJ5FcQ9kD9dQo7X808gTuuHeHEJ3vk45dtCwyHQ
         0hzl5fTr2fHLN+khoD+Xn3BDSya30RxT+7Jt4iZTT3fiRD2T/NR+SrQWQ8gj5snWdtNt
         +ha/R3+4gv95ffb9o0TI1cvPF7yfzKaVTpkaKNXWQi+/ywhqxF7WEbLJLIPWZu5T5OxS
         gfuTk56SRLgfpnZ9cl0wsGTSsoYry+t9iuJPGSQy1yOLcLg3VfJofrwQ6RO3FrkgkBk7
         0POQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVeiq6ZnSBai+0SmRHOQVZ4kXt6bn+RBQACRZkePTadE+pnFv6T
	xKlhMdq+sf7BIVTEsqfJ47U=
X-Google-Smtp-Source: AK7set+s6VD0N156p8pWk1Ps9+aY5Rh04opSIpodyUW34D32w9II3J0wnCbLmEi7JjgkPVJkzR88tA==
X-Received: by 2002:a17:906:90c1:b0:88f:9c9a:828 with SMTP id v1-20020a17090690c100b0088f9c9a0828mr718297ejw.190.1675772763114;
        Tue, 07 Feb 2023 04:26:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1755:b0:4aa:a500:fd39 with SMTP id
 v21-20020a056402175500b004aaa500fd39ls7476281edx.0.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:01 -0800 (PST)
X-Received: by 2002:a50:d482:0:b0:4aa:b2b9:b416 with SMTP id s2-20020a50d482000000b004aab2b9b416mr3308907edi.31.1675772760999;
        Tue, 07 Feb 2023 04:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772760; cv=none;
        d=google.com; s=arc-20160816;
        b=ER5ie6eG4NnzUP9tKsnkSeTKb1UhVry11fvLIlPdP8xhAPs5i9HS6jl61+rNKvxz2Z
         fwdQJmn0f1kI9nJ0g/wdv2F904WrQ+IwWl2HssFJLGkGgKUiQxNfnHCTb/8vtXiBM6hi
         M7qa1kjTv5eP1Fkyi/HYDIfP/c9eacp+DOhJz1CW5G7x8OirZDbA2l5r0qXhFpW9jFXa
         X2dlAX5adqJ4LjSORWIe/WksvngwfGcSZs7TOMrl9SJ3NoQjiw/hLyhPvZkHOQt1mxrh
         8Kf4RoacQw9xU+EgmIWaU42lerZpv7WUlbbkZY0SV6KM/tGF8bWDTwAefDasL6MeX3z6
         dkVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=r9TfXrTS3kS5oaf9tWkOsyBwZHPepxU88nc89q6w4t8=;
        b=t8Zc0KZqF2eWD762GI5Rp2Bu784EQUdt4kwQSwF1aORwo/gkZ49+BMoOMuXVrjVkVa
         hutDpdStYWEogRvr1b1Zu+OCRiphcoQDZb4Yy+Fx+1UR02gd6ybeLZGo6bKiMOurz8nf
         580WF60StMgxH/yBxcjdCDuEhMV4dDn1jiUofOhFtvClZaM26HXC2E4somD0RAoudJAx
         D3iKJpvXZ1681oDXwMdo+qDWZzeqmwiatxR85IT1HXdb+z4ov8/sev/DBloJxWY+gpoM
         OD3l2I2S9+lElRwedJxxsdHszR5+6X7shzqo8ZPJ7hVnvQ2l20wWxMPQ6wtRByt8r6hQ
         zTRw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id q14-20020a056402248e00b0046c3ce626bdsi652429eda.2.2023.02.07.04.26.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:00 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RC1ykXzxvD;
	Tue,  7 Feb 2023 13:25:59 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 00/47] RISC-V support for Jailhouse
Date: Tue,  7 Feb 2023 13:24:56 +0100
Message-Id: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 EU_TLD 0.1, MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __FROM_DOMAIN_NOT_IN_BODY 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_ENDS_IN_SLASH 0, __URI_HAS_HYPHEN_USC 0, __URI_IN_BODY 0, __URI_NOT_IMG 0, __URI_NO_MAILTO 0, __URI_NS , __URI_WITHOUT_PATH 0, __URI_WITH_PATH 0'
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Hi,

this is the second RFC series for RISC-V support in Jailhouse. The series w=
as
initially developed by Konrad Schwarz at SIEMENS in context of the SELENE
project [0], and later extended by Stefan an me (see Contributors below)
at the OTH Regensburg.

The series applies on top of wip/new-cpu-config (by Jan), and can also be f=
ound
here:
   https://github.com/lfd/jailhouse/tree/ralf/riscv/V13

We need some patches on top of Linux that can be found here:
   https://github.com/lfd/linux/tree/ralf/riscv-jailhouse/V18

This tree branches from Anup Patel's riscv_aia_v3 tree that adds the not ye=
t
integrated AIA support for Linux (support for APLIC and IMSIC), and comes w=
ith
our standard Jailhouse patches on top.

Besides lots of stabilisation fixes, the most interesting changes that happ=
ened
since the v1 are in the interrupt subsystem. We now have support for the AP=
LIC,
which is part of AIA (Advanced Interrupt Architecture). Still, we miss supp=
ort
for the IMSIC. Hopefully, when finally having support for the IMSIC, we wil=
l
get rid of the heavy softemulation of the APLIC. However, we lack real hard=
ware
for both, APLIC and IMSIC.

To test this series in Qemu, see instructions in [3].

Changes since RFC v1:
  - Add support for SSTC (trapless timers)
  - Besides PLIC, add support for APLIC
  - minor fixes of typos
  - fix incorrect HSM state on cell reset
  - fix incorrect specifiers in spinlocks
  - fixes for some race conditions
  - Allow trap-free guest access to cycle counter
  - stats: Add more fine-granular accounting
  - vmm deactivation: fix bugs to get in running with -O2
  - Add support for jailhouse-config-check

The series adds support for:
  - RISC-V h-extensions (RV64 only)
  - MMU support: SV39, SV48, SV57 (provided by Qemu)
  - PLIC and APLIC interrupt controller
  - Multi-Core non-root cells
  - Basic demo inmates
  - Non-Root Linux support
  - IVSHMEM (IRQs are implemented by virtualising the PLIC, sigh=E2=80=A6)

Target platforms:
  - Qemu virtual targets

Architectural limitations:
  - IRQs arrive in S-Mode, and must be reinjected to VS-Mode. This applies =
for
    IPIs, Timers, and physical IRQs at the PLIC.
  - The PLIC needs full virtualisation, as its design is uncapable for
    virtualisation. Cf.: [2].
  - IPIs are sent via SBI firmware. This requires double trapping (Jailhous=
e +
    SBI), and manual reinjection on receiver site.
  - IPIs can not be parameterised: there's only one single IPI. We have to
    differentiate between management and guest IPIs in software. Sigh=E2=80=
=A6
  - Things get hopefully better when we have IMSIC support


What is missing and should be discussed:
  - IMSIC support

  - Prioritisation of vIRQs: they always have lowest prio.
      vIRQ support is only suppported for testing / demonstration at the
      moment. Full virtualisation of the PLIC comes at a high cost, as
      priorities of the vIRQs need to be respectes as well. As this level o=
f
      virtualisation is contrary to the concepts of Jailhouse, I deliberate=
ly
      did not implement prioritisation of vIRQs.

  - There are some overlaps with arm-common/arm64; see irq handling, bitops=
.
    Should we factor those bits out?

Contributors:
  - Konrad Schwarz, Siemens (base support, first draft)
  - Ralf Ramsauer, OTH (exception handling, control flow, reworked PLIC
    support, APLIC support)
  - Stefan Huber, OTH (inmate support, APLIC support)
  - Jan Kiszka, Siemes (wip/new-cpu-config)

  Ralf

[0] https://www.selene-project.eu/
[1] https://www.gaisler.com/index.php/products/processors/noel-v
[2] https://github.com/riscv/riscv-plic-spec/blob/master/riscv-plic.adoc
[3]
$ git clone https://github.com/lfd/jailv-testbed
$ cd jailv-testbed
$ git submodule init && git submodule update

Have a riscv64-linux-gnu compiler ready, together with QEMU 7.2.0. If your
distribution doesn't have this latest version, type

$ ./do.sh qemu

inside the testbed to get a working emulator. Compile the patches Linux ker=
nel:
$ ./do.sh prepare_linux
$ ./do.sh linux

Compile Jailhouse
$ ./do.sh jailhouse

Compile buildroot (required for root and non-root cell)
$ ./do.sh prepare_buildroot
$ ./do.sh buildroot

And you're set. Test Jailhouse with:

$ ./do.sh qemu_X_Y

with X in {aplic, plic} and Y in {mc, uc} (e.g. ./do.sh aplic_qemu_mc).

aplic will start the aplic variant, plic will start the plic variant. mc wi=
ll
start with six cores, uc will boot a single-core system (makes no sense in
Jailhouse context, but great for debugging).

Buildroot will start, inside the Buildroot root-cell, type:

$ insmod jailhouse.ko
$ jh-en # This script enables jailhouse, and automatically grabs the correc=
t config

$ jh-linux # This script starts a Linux non-root cell on HART 0 and 1

Jan Kiszka (1):
  RISC-V cornerstone

Konrad Schwarz (1):
  core: riscv: implement paging structures

Ralf Ramsauer (43):
  driver: RISC-V: check for availability of h-extensions
  driver: sysfs: prepare for exit accounting on RISC-V
  core: riscv: define MMIO accessors
  core: riscv: Add CSR definitions
  core: riscv: introduce asm/bitops.h
  core: riscv: add processor.h
  core: riscv: Define percpu fields
  core: riscv: introduce global sbi_ecall.h
  core: riscv: introduce asm/sbi.h
  core: riscv: add platform information
  core: riscv: implement the hypercall interface
  core: riscv: introduce cell-specific fields
  core: riscv: add dbg-write helper
  core: riscv: implement library routines
  core: riscv: implement PCI support
  core: riscv: paging: add headers
  core: riscv: add asm-defines.c
  core: riscv: introduce traps.c
  core: riscv: Hypervisor entry code
  core: riscv: implement arch_send_event
  core: riscv: Add spinlock primitives
  Documentation: Add some documentation
  core: riscv: implement control.c
  core: forward original HV memory location
  core: riscv: implement setup.c
  arm-common: export for_each_irqchip-macro
  core: riscv: introduce irqchip.h
  core: riscv: Add irqchip abstraction layer
  core: riscv: Add PLIC implementation
  core: riscv: implement trap handlers
  inmates: riscv: add timer demo
  inmates: riscv: propagate hartid
  inmates: riscv: implement Linux Loader
  configs: riscv: qemu: add system configs
  configs: riscv: qemu: add inmate demo config
  configs: riscv: qemu: Add linux-demo
  core: riscv: add SSTC support
  core: riscv: PLIC: remove workaround
  driver: riscv: Add vPCI support
  core: riscv: implement APLIC support
  core: riscv: plic: introduce vIRQ support
  core: riscv: aplic: introduce vIRQ support
  configs: riscv: add ivshmem-net devices

Stefan Huber (2):
  inmates: riscv: implement tiny-demo RISC-V
  configs: riscv: Add configuration parameters for APLIC

 .gitignore                                    |   1 +
 Documentation/hypervisor-interfaces.txt       |  16 +-
 Documentation/memory-layout.txt               |  20 +-
 configs/riscv/dts/qemu-linux-inmate-aplic.dts | 111 +++
 configs/riscv/dts/qemu-linux-inmate-plic.dts  | 112 +++
 configs/riscv/qemu-aplic-mc.c                 |   4 +
 configs/riscv/qemu-aplic-uc.c                 |   4 +
 configs/riscv/qemu-inmate-demo.c              |  64 ++
 configs/riscv/qemu-linux-demo-aplic.c         |   3 +
 configs/riscv/qemu-linux-demo-plic.c          |   3 +
 configs/riscv/qemu-linux-demo.h               | 128 +++
 configs/riscv/qemu-plic-mc.c                  |   4 +
 configs/riscv/qemu-plic-uc.c                  |   4 +
 configs/riscv/qemu.h                          | 273 ++++++
 driver/main.c                                 |  10 +
 driver/main.h                                 |   4 +
 driver/pci.c                                  |  33 +-
 driver/sysfs.c                                |  24 +
 hypervisor/arch/arm-common/irqchip.c          |   5 -
 hypervisor/arch/riscv/Kbuild                  |  18 +
 hypervisor/arch/riscv/Makefile                |  13 +
 hypervisor/arch/riscv/aplic.c                 | 580 +++++++++++++
 hypervisor/arch/riscv/asm-defines.c           |  46 +
 hypervisor/arch/riscv/control.c               | 267 ++++++
 hypervisor/arch/riscv/dbg-write.c             |  33 +
 hypervisor/arch/riscv/entry.S                 | 421 ++++++++++
 hypervisor/arch/riscv/exception.S             |  91 ++
 hypervisor/arch/riscv/include/asm/bitops.h    |  75 ++
 hypervisor/arch/riscv/include/asm/cell.h      |  40 +
 hypervisor/arch/riscv/include/asm/control.h   |  13 +
 hypervisor/arch/riscv/include/asm/csr64.h     | 202 +++++
 hypervisor/arch/riscv/include/asm/irqchip.h   | 123 +++
 hypervisor/arch/riscv/include/asm/ivshmem.h   |  15 +
 .../arch/riscv/include/asm/jailhouse_header.h |  32 +
 hypervisor/arch/riscv/include/asm/mmio.h      |  67 ++
 hypervisor/arch/riscv/include/asm/paging.h    | 138 +++
 .../arch/riscv/include/asm/paging_modes.h     |  18 +
 hypervisor/arch/riscv/include/asm/percpu.h    |  52 ++
 hypervisor/arch/riscv/include/asm/processor.h |  79 ++
 hypervisor/arch/riscv/include/asm/sbi.h       |  86 ++
 hypervisor/arch/riscv/include/asm/sections.h  |  14 +
 hypervisor/arch/riscv/include/asm/setup.h     |  14 +
 hypervisor/arch/riscv/include/asm/spinlock.h  |  75 ++
 hypervisor/arch/riscv/include/asm/types.h     |  15 +
 hypervisor/arch/riscv/irqchip.c               | 239 ++++++
 hypervisor/arch/riscv/ivshmem.c               |  63 ++
 hypervisor/arch/riscv/lib.c                   |  36 +
 hypervisor/arch/riscv/paging.c                | 279 ++++++
 hypervisor/arch/riscv/pci.c                   |  66 ++
 hypervisor/arch/riscv/plic.c                  | 468 +++++++++++
 hypervisor/arch/riscv/setup.c                 | 182 ++++
 hypervisor/arch/riscv/traps.c                 | 793 ++++++++++++++++++
 hypervisor/include/jailhouse/control.h        |   5 +
 hypervisor/include/jailhouse/gen-defines.h    |   8 +-
 hypervisor/include/jailhouse/header.h         |   7 +
 hypervisor/include/jailhouse/mmio.h           |   4 +
 hypervisor/include/jailhouse/paging.h         |   2 +-
 include/arch/riscv/asm/jailhouse_hypercall.h  | 113 +++
 include/arch/riscv/asm/sbi_ecall.h            |  96 +++
 include/jailhouse/cell-config.h               |  15 +
 include/jailhouse/console.h                   |   1 +
 inmates/demos/riscv/Makefile                  |  20 +
 inmates/demos/riscv/timer-demo.c              |  57 ++
 inmates/demos/riscv/tiny-demo.c               |  19 +
 inmates/lib/include/inmate_common.h           |   1 +
 inmates/lib/riscv/Makefile                    |  46 +
 inmates/lib/riscv/Makefile.lib                |  64 ++
 inmates/lib/riscv/header.S                    |  76 ++
 inmates/lib/riscv/include/inmate.h            | 184 ++++
 inmates/lib/riscv/inmate.lds.S                |  77 ++
 inmates/lib/riscv/irq.c                       | 107 +++
 inmates/lib/riscv/printk.c                    |  61 ++
 inmates/lib/riscv/setup.c                     |  45 +
 inmates/lib/riscv/uart.c                      |  47 ++
 inmates/tests/riscv/Makefile                  |   0
 inmates/tools/riscv/Makefile                  |  19 +
 inmates/tools/riscv/linux-loader.c            |  25 +
 pyjailhouse/config_parser.py                  |  19 +-
 scripts/include.mk                            |   3 +
 tools/jailhouse-config-check                  |   6 +
 80 files changed, 6571 insertions(+), 32 deletions(-)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-aplic.dts
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-plic.dts
 create mode 100644 configs/riscv/qemu-aplic-mc.c
 create mode 100644 configs/riscv/qemu-aplic-uc.c
 create mode 100644 configs/riscv/qemu-inmate-demo.c
 create mode 100644 configs/riscv/qemu-linux-demo-aplic.c
 create mode 100644 configs/riscv/qemu-linux-demo-plic.c
 create mode 100644 configs/riscv/qemu-linux-demo.h
 create mode 100644 configs/riscv/qemu-plic-mc.c
 create mode 100644 configs/riscv/qemu-plic-uc.c
 create mode 100644 configs/riscv/qemu.h
 create mode 100644 hypervisor/arch/riscv/Kbuild
 create mode 100644 hypervisor/arch/riscv/Makefile
 create mode 100644 hypervisor/arch/riscv/aplic.c
 create mode 100644 hypervisor/arch/riscv/asm-defines.c
 create mode 100644 hypervisor/arch/riscv/control.c
 create mode 100644 hypervisor/arch/riscv/dbg-write.c
 create mode 100644 hypervisor/arch/riscv/entry.S
 create mode 100644 hypervisor/arch/riscv/exception.S
 create mode 100644 hypervisor/arch/riscv/include/asm/bitops.h
 create mode 100644 hypervisor/arch/riscv/include/asm/cell.h
 create mode 100644 hypervisor/arch/riscv/include/asm/control.h
 create mode 100644 hypervisor/arch/riscv/include/asm/csr64.h
 create mode 100644 hypervisor/arch/riscv/include/asm/irqchip.h
 create mode 100644 hypervisor/arch/riscv/include/asm/ivshmem.h
 create mode 100644 hypervisor/arch/riscv/include/asm/jailhouse_header.h
 create mode 100644 hypervisor/arch/riscv/include/asm/mmio.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging.h
 create mode 100644 hypervisor/arch/riscv/include/asm/paging_modes.h
 create mode 100644 hypervisor/arch/riscv/include/asm/percpu.h
 create mode 100644 hypervisor/arch/riscv/include/asm/processor.h
 create mode 100644 hypervisor/arch/riscv/include/asm/sbi.h
 create mode 100644 hypervisor/arch/riscv/include/asm/sections.h
 create mode 100644 hypervisor/arch/riscv/include/asm/setup.h
 create mode 100644 hypervisor/arch/riscv/include/asm/spinlock.h
 create mode 100644 hypervisor/arch/riscv/include/asm/types.h
 create mode 100644 hypervisor/arch/riscv/irqchip.c
 create mode 100644 hypervisor/arch/riscv/ivshmem.c
 create mode 100644 hypervisor/arch/riscv/lib.c
 create mode 100644 hypervisor/arch/riscv/paging.c
 create mode 100644 hypervisor/arch/riscv/pci.c
 create mode 100644 hypervisor/arch/riscv/plic.c
 create mode 100644 hypervisor/arch/riscv/setup.c
 create mode 100644 hypervisor/arch/riscv/traps.c
 create mode 100644 include/arch/riscv/asm/jailhouse_hypercall.h
 create mode 100644 include/arch/riscv/asm/sbi_ecall.h
 create mode 100644 inmates/demos/riscv/Makefile
 create mode 100644 inmates/demos/riscv/timer-demo.c
 create mode 100644 inmates/demos/riscv/tiny-demo.c
 create mode 100644 inmates/lib/riscv/Makefile
 create mode 100644 inmates/lib/riscv/Makefile.lib
 create mode 100644 inmates/lib/riscv/header.S
 create mode 100644 inmates/lib/riscv/include/inmate.h
 create mode 100644 inmates/lib/riscv/inmate.lds.S
 create mode 100644 inmates/lib/riscv/irq.c
 create mode 100644 inmates/lib/riscv/printk.c
 create mode 100644 inmates/lib/riscv/setup.c
 create mode 100644 inmates/lib/riscv/uart.c
 create mode 100644 inmates/tests/riscv/Makefile
 create mode 100644 inmates/tools/riscv/Makefile
 create mode 100644 inmates/tools/riscv/linux-loader.c

--=20
2.39.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230207122543.1128638-1-ralf.ramsauer%40oth-regensburg.de.
