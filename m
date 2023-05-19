Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBRV5T6RQMGQEVKV7LJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id EEEF070A0B2
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:39 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id 5b1f17b1804b1-3f426ffdbc6sf21523455e9.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528839; cv=pass;
        d=google.com; s=arc-20160816;
        b=V88JCkafQiQiwiqNGZIEziKaOKfpbV1FhnjmLJzLWARQ3WCOQ3q4G6tBYQNp1e9ZU0
         C2xhlQGKtpMb/NJqojnoBKfxKvEOsy3ZEjCVevNow2lJTratD/lKLvuMhiMwogEDF60d
         PjuVLMN4ih8zyzs3KBWjBu5jHvmcuKBREImv4gaa5Yqh7F6Y4WgD59T7IDZCNVJxfAOj
         1mzaiSvhtrGe6+N3xdjrGS+7OP5VvARm/LWERUbOcOJNIjPOVpHpfSrKTMFb1IY9kTq7
         n+BaXbFbN81jQ5Ca4nWLmo6kcMM9nCYjX5icQvYrxA86XIncen22DsUkjhkyNhspePBa
         o8Hw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:sender
         :dkim-signature;
        bh=L0HykSD5H9biSIJiUmUImk7alGWftjqf/MCBP4htzJI=;
        b=CloJPIlYzH1GskyX51HsUiogtj2DHsdWy8S6PMzJbmE7kZd9oYkEMixVjAVAj9ouJ9
         2/Ql8Aqeap3cASSeBeU7NSLPC2ONdFshfWHnlQEmFpmXY1DBRGMF6VE7+YkhdYBVwKvR
         hWmBEdK1ccY/hWyqmgwE3PCszKwrfFNZmWhC7f5oDmJZoN4jauYZmYlITgJg/eCk3BAu
         nwBpeXWZ4CSuGTpoFZP+w5W6+7WXfrVE65N2Ndj8oDLtNB80TMiPc/5UtZRMqLpOMBV1
         qAWf2gfAR2QLgPuceLWqJ/rSE0RDLzk3cHYMPelSqjKkOQnoWZbBgsUXb3qoYk2QZoci
         X+tw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528839; x=1687120839;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:mime-version:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L0HykSD5H9biSIJiUmUImk7alGWftjqf/MCBP4htzJI=;
        b=Y70NnAkK4/tXHClg8WnnSmAjs4Gg3GvZ5vdMgcKu9b3gEhkvZ48aQgZn4gCCU1HxHa
         KVy6iom/foACJtW8FD1JU5rxzOhNkOBsf1JWqKs3pA4/2ccnNRPFIqhiZiZjiJEX+Jua
         8ZgWQAsnOd8CnkcS/oAjnsoeC588uKYV2VSfKcLQDbAXUAwq98bOnWjniofe8ky2gO5F
         zQLjUFz7K5/VhyovTYRT9uoFzs4gMzj0xL5l0em3bCUHiymcIG/PK7wgOpDmlA59n5yr
         ijBGAgpQKeaD9D0TSh0uCO/Ty+QhcwLb2nram2mZlr8JcBhwVLn6mOd0gnA8pofz/3gH
         a5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528839; x=1687120839;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-beenthere:x-gm-message-state:sender:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L0HykSD5H9biSIJiUmUImk7alGWftjqf/MCBP4htzJI=;
        b=ahYQATzQbUGLUMD7L9hArLFNGqmQ65Ic2OfVIIOLAAIs5F2570Znvf1CDvX6+8nAtv
         SkRx+55s+0ZkD2MM5vSczCfkd4MzwEF28JR1SWkkYve5HsbfiwRSaDZxITNUUVM1FwSG
         LO/VMDbooSRbl3XwT6RXO68/SRunZsWDklnJ8/DtB3MzpUzp2PQOKscZ/I71tfaLP3Ud
         H3fOCU+Ry0XLx0iqb7B49gvpj58OxuwSS+mrwNIIuNJu9BLyg91wJL6CzPgwFf7yAZdP
         X1s9FntdroXnwPKU8LOA2qOw+NJSnAwyLyH8T73KDTHb9q66zy0otmqJMYQsz0FVGHSz
         ThNQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDzUlPU3oZnnfzwhpwq2jhUiruPhSaD6kf28Y1/qmc+SH5Tv21cb
	/3fMJ61uUDiPUQGOHRgADCs=
X-Google-Smtp-Source: ACHHUZ5Gk09WkGUQfAYMuQrWN+KneIw6AiscjHaUiUnNr9kSpa2Q4n5VFy1SQlZwjN5TBFr+eoCs7A==
X-Received: by 2002:a1c:6a18:0:b0:3f4:2aae:790b with SMTP id f24-20020a1c6a18000000b003f42aae790bmr527950wmc.7.1684528839152;
        Fri, 19 May 2023 13:40:39 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:5c1:b0:307:29a7:637c with SMTP id
 bh1-20020a05600005c100b0030729a7637cls1338424wrb.1.-pod-prod-05-eu; Fri, 19
 May 2023 13:40:37 -0700 (PDT)
X-Received: by 2002:a5d:51d1:0:b0:2f8:2d4:74ef with SMTP id n17-20020a5d51d1000000b002f802d474efmr2311214wrv.43.1684528837316;
        Fri, 19 May 2023 13:40:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528837; cv=none;
        d=google.com; s=arc-20160816;
        b=TUU92uJihKnEcjpwq8xao57uBD4oB1r+wnbGnqcatG/ygrV2Yskl6xTO/rB5/m1wQX
         S8EFbVgEqailqLDaJdF5eGRQmCXRXpCfk9tecBsbbi73dx44Q4MiC5f+c/wgMcQQs2Tv
         yoHvPCGzEoO8MPa+v4bT5YqSa4gkqpQ/qmjmtpzNCMB+VRj3ynsyIWHi8B8ttSdPpkVQ
         VJf7RzXKg7GpeXWuEA2x4ZPn8DM3XC9vJ/RYXDyK7GvIuV3H6E8Bjsc9kle8EIzpPqc9
         1ISJxRSrp+WnM7L41SQbNxk78GpafZJ7IfiNTrZW1VZxrneoyf5fakyHw968G1T3EZNv
         pBmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=Jx2UKCN3rzx6ADNJA/o1UdhFwVyKmYHAfjgnjI99mv0=;
        b=YOzriswiPfTvQHjAzxncP3C+a2xN8hF5nbCotG9ZMmRbD2rRRY47YYVMabZo7axWtY
         b/f5tnBpRouJWDHpJNFi4mu/kINPpeGI/Qm6qfdPI3W+wpRn4qpWny+V+b4QeIugjys7
         YKonWaRKd9k0tchzmwwoFiggnDKzdcDi7JPGnP4tvj3OlAMY/xiwB2McPslLJwKi6z8x
         /gxTCguPcFupieskd7QyVrxVRNnFZtpA5Ttm9uJiGBi0POkoMTSS7HxQjIIHc3EAQtJM
         DOsMKs0Oudpae7truN35iz5TLSulj9B4X4Z80msn7lZOagEhsTVJEV9O0DGiv2ryHNvF
         iG4w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id bo2-20020a056000068200b003062fa1b7a0si707wrb.2.2023.05.19.13.40.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdH5Lsdzxpk;
	Fri, 19 May 2023 22:40:35 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 00/73] RISC-V support for Jailhouse
Date: Fri, 19 May 2023 22:39:20 +0200
Message-Id: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIIII, Probability=9%, Report='
 EU_TLD 0.1, MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODY_SIZE_10000_PLUS 0, BODY_SIZE_25K_PLUS 0, CTE_8BIT 0, CT_TEXT_PLAIN_UTF8_CAPS 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_FUR_HEADER 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_URI_IN_BODY 0, __CT 0, __CTE 0, __CT_TEXT_PLAIN 0, __FRAUD_MONEY_CURRENCY 0, __FRAUD_MONEY_CURRENCY_DOLLAR 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __FROM_DOMAIN_NOT_IN_BODY 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_X_MAILER 0, __HIGHBIT_ASCII_MIX 0, __HTTPS_URI 0, __INVOICE_MULTILINGUAL 0, __MIME_BOUND_CHARSET 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __MULTIPLE_URI_TEXT 0, __NO_HTML_TAG_RAW 0, __PHISH_SPEAR_SUBJ_TEAM 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
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

this is the first non-RFC series for RISC-V support in Jailhouse. The serie=
s
was initially developed by Konrad Schwarz at SIEMENS in context of the SELE=
NE
project [0], and later extended by Stefan an me (see Contributors below) at=
 OTH
Regensburg.

The series relies on wip/new-cpu-config (by Jan, included), and can also
be found here:
   https://github.com/lfd/jailhouse/tree/ralf/riscv/V15

We need some patches on top of Linux that can be found here:
   https://github.com/lfd/linux/tree/ralf/riscv-jailhouse/V21

This tree branches from Anup Patel's riscv_aia_v3 tree that adds the not ye=
t
integrated AIA support for Linux (support for APLIC and IMSIC), and comes w=
ith
our standard Jailhouse patches on top.

To test this series in Qemu, see instructions in [1].

Changes since RFC v2:
  - Full support for APLIC, including AIA/IMSIC
  - With APLIC AIA/IMSIC, we achieve zero traps under most conditions!
    (besides level-triggered wired IRQs)
  - Add support for Zicboz extension
  - Update configs; Upstream qemu changed some memory layouts
  - minor fixes and typos

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

What is missing and should be discussed:
  - Prioritisation of vIRQs: they always have lowest prio.
      vIRQ support is only suppported for testing / demonstration at the
      moment. Full virtualisation of the PLIC comes at a high cost, as
      priorities of the vIRQs need to be respectes as well. As this level o=
f
      virtualisation is contrary to the concepts of Jailhouse, I deliberate=
ly
      did not implement prioritisation of vIRQs.

Contributors:
  - Konrad Schwarz, Siemens (base support, first draft)
  - Ralf Ramsauer, OTH (exception handling, control flow, reworked PLIC
    support, APLIC support)
  - Stefan Huber, OTH (inmate support, APLIC support)
  - Jan Kiszka, Siemes (wip/new-cpu-config)

  Ralf

[0] https://www.selene-project.eu/
[1]

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

Jan Kiszka (20):
  core: Add internal event check before hypervisor activation
  core: Skip arch_flush_cell_vcpu_caches during setup
  x86: Do not kick targets of vcpu cache flushes
  core: Clarify invocation context of arch_flush_cell_vcpu_caches
  core: Convert config_commit into a unit callback
  arm64: Update unit link order comment and save a line
  arm, arm64: Make GICv3 arm64-only
  x86: Rename CPU_ID_INVALID to APIC_INVALID_CPU
  core: Beautify for_each_cpu helper
  core: Use statically sized cpu sets
  core: Move cell_init() of root cell from init_early to init_late
  core: Change CPU configuration to an array of structures
  driver: Convert to new CPU configuration format
  core: Convert to new CPU configuration format
  tools: Convert to new CPU configuration format
  configs: x86: Convert to new CPU configuration format
  configs: arm: Convert to new CPU configuration format
  configs: arm64: Convert to new CPU configuration format
  core: Optimize parsing of large CPU sets
  RISC-V cornerstone

Konrad Schwarz (1):
  core: riscv: implement paging structures

Ralf Ramsauer (50):
  driver: RISC-V: check for availability of h-extensions
  driver: sysfs: prepare for exit accounting on RISC-V
  driver: sysfs: fix cell statistic calculation
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
  core: riscv: paging: add headers
  core: riscv: add asm-defines.c
  core: riscv: introduce traps.c
  core: riscv: Hypervisor entry code
  core: riscv: implement arch_send_event
  core: riscv: Add spinlock primitives
  Documentation: Add some documentation
  arm-common: export for_each_irqchip-macro
  core: riscv: introduce irqchip.h
  core: riscv: implement control.c
  core: forward original HV memory location
  core: riscv: implement setup.c
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
  configs: riscv: add configs for APLIC+IMSIC
  core: riscv: Migrate IMSIC files, if IMSIC is available
  core: riscv: aplic: Add IMSIC support
  core: riscv: pci: Implement MSI-handling logic
  core: riscv: control: fix parking race condition
  core: riscv: setup: Add Qemu Workaround
  core: riscv: Add support for Zicboz extension

Stefan Huber (2):
  inmates: riscv: implement tiny-demo RISC-V
  configs: riscv: Add configuration parameters for APLIC

 .gitignore                                    |   1 +
 Documentation/hypervisor-interfaces.txt       |  16 +-
 Documentation/memory-layout.txt               |  20 +-
 configs/arm/bananapi-inmate-demo.c            |  10 +-
 configs/arm/bananapi-linux-demo.c             |  10 +-
 configs/arm/bananapi.c                        |  13 +-
 configs/arm/emtrion-rzg1e-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1e-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1e.c                   |  11 +-
 configs/arm/emtrion-rzg1h-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1h-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1h.c                   |  29 +-
 configs/arm/emtrion-rzg1m-inmate-demo.c       |   8 +-
 configs/arm/emtrion-rzg1m-linux-demo.c        |   8 +-
 configs/arm/emtrion-rzg1m.c                   |  11 +-
 configs/arm/jetson-tk1-inmate-demo.c          |  10 +-
 configs/arm/jetson-tk1-linux-demo.c           |  13 +-
 configs/arm/jetson-tk1.c                      |  19 +-
 configs/arm/orangepi0-inmate-demo.c           |  10 +-
 configs/arm/orangepi0-linux-demo.c            |  13 +-
 configs/arm/orangepi0.c                       |  19 +-
 configs/arm/qemu-arm-inmate-demo.c            |  10 +-
 configs/arm/qemu-arm-linux-demo.c             |  13 +-
 configs/arm/qemu-arm.c                        |  31 +-
 configs/arm64/amd-seattle-inmate-demo.c       |   8 +-
 configs/arm64/amd-seattle-linux-demo.c        |  11 +-
 configs/arm64/amd-seattle.c                   |  29 +-
 configs/arm64/espressobin-inmate-demo.c       |  10 +-
 configs/arm64/espressobin-linux-demo.c        |  10 +-
 configs/arm64/espressobin.c                   |  13 +-
 configs/arm64/foundation-v8-inmate-demo.c     |   8 +-
 configs/arm64/foundation-v8-linux-demo.c      |  11 +-
 configs/arm64/foundation-v8.c                 |  17 +-
 configs/arm64/hikey-inmate-demo.c             |  10 +-
 configs/arm64/hikey-linux-demo.c              |  13 +-
 configs/arm64/hikey.c                         |  31 +-
 configs/arm64/imx8dxl-inmate-demo.c           |   8 +-
 configs/arm64/imx8dxl.c                       |  13 +-
 configs/arm64/imx8mm-inmate-demo.c            |   8 +-
 configs/arm64/imx8mm-linux-demo.c             |  11 +-
 configs/arm64/imx8mm.c                        |  19 +-
 configs/arm64/imx8mn-inmate-demo.c            |   8 +-
 configs/arm64/imx8mn-linux-demo.c             |  11 +-
 configs/arm64/imx8mn.c                        |  19 +-
 configs/arm64/imx8mp-inmate-demo.c            |   8 +-
 configs/arm64/imx8mp-linux-demo.c             |  11 +-
 configs/arm64/imx8mp.c                        |  19 +-
 configs/arm64/imx8mq-inmate-demo.c            |   8 +-
 configs/arm64/imx8mq-linux-demo.c             |  11 +-
 configs/arm64/imx8mq.c                        |  19 +-
 configs/arm64/imx8qm-inmate-demo.c            |   8 +-
 configs/arm64/imx8qm-linux-demo.c             |  11 +-
 configs/arm64/imx8qm.c                        |  25 +-
 configs/arm64/jetson-tx1-inmate-demo.c        |   8 +-
 configs/arm64/jetson-tx1-linux-demo.c         |  11 +-
 configs/arm64/jetson-tx1.c                    |  17 +-
 configs/arm64/jetson-tx2-inmate-demo.c        |   8 +-
 configs/arm64/jetson-tx2.c                    |  17 +-
 configs/arm64/k3-am625-sk-inmate-demo.c       |   8 +-
 configs/arm64/k3-am625-sk-linux-demo.c        |  11 +-
 configs/arm64/k3-am625-sk.c                   |  17 +-
 configs/arm64/k3-am654-idk-inmate-demo.c      |   8 +-
 configs/arm64/k3-am654-idk-linux-demo.c       |  11 +-
 configs/arm64/k3-am654-idk.c                  |  17 +-
 configs/arm64/k3-j7200-evm-inmate-demo.c      |   8 +-
 configs/arm64/k3-j7200-evm-linux-demo.c       |   8 +-
 configs/arm64/k3-j7200-evm.c                  |  11 +-
 configs/arm64/k3-j721e-evm-inmate-demo.c      |   8 +-
 configs/arm64/k3-j721e-evm-linux-demo.c       |   8 +-
 configs/arm64/k3-j721e-evm.c                  |  11 +-
 configs/arm64/ls1028a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1028a-rdb-linux-demo.c        |   8 +-
 configs/arm64/ls1028a-rdb.c                   |  13 +-
 configs/arm64/ls1043a-rdb-dpaa-linux-demo.c   |  11 +-
 configs/arm64/ls1043a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1043a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1043a-rdb.c                   |  19 +-
 configs/arm64/ls1046a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1046a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1046a-rdb.c                   |  19 +-
 configs/arm64/ls1088a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls1088a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls1088a-rdb.c                   |  29 +-
 configs/arm64/ls2088a-rdb-inmate-demo.c       |   8 +-
 configs/arm64/ls2088a-rdb-linux-demo.c        |  11 +-
 configs/arm64/ls2088a-rdb.c                   |  29 +-
 configs/arm64/macchiatobin-inmate-demo.c      |  10 +-
 configs/arm64/macchiatobin-linux-demo.c       |  13 +-
 configs/arm64/macchiatobin.c                  |  19 +-
 .../arm64/miriac-sbc-ls1046a-inmate-demo.c    |   8 +-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  11 +-
 configs/arm64/miriac-sbc-ls1046a.c            |  17 +-
 configs/arm64/pine64-plus-inmate-demo.c       |   8 +-
 configs/arm64/pine64-plus-linux-demo.c        |  11 +-
 configs/arm64/pine64-plus.c                   |  17 +-
 configs/arm64/qemu-arm64-inmate-demo.c        |  10 +-
 configs/arm64/qemu-arm64-linux-demo.c         |  13 +-
 configs/arm64/qemu-arm64-zephyr-demo.c        |  11 +-
 configs/arm64/qemu-arm64.c                    |  55 +-
 configs/arm64/renesas-r8a774a1-inmate-demo.c  |   8 +-
 configs/arm64/renesas-r8a774a1-linux-demo.c   |  17 +-
 configs/arm64/renesas-r8a774a1.c              |  23 +-
 configs/arm64/rpi4-inmate-demo.c              |  10 +-
 configs/arm64/rpi4-linux-demo.c               |  13 +-
 configs/arm64/rpi4.c                          |  19 +-
 configs/arm64/ultra96-inmate-demo.c           |  10 +-
 configs/arm64/ultra96-linux-demo.c            |  13 +-
 configs/arm64/ultra96.c                       |  19 +-
 configs/arm64/zynqmp-zcu102-inmate-demo.c     |  10 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  10 +-
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  13 +-
 configs/arm64/zynqmp-zcu102.c                 |  19 +-
 .../dts/qemu-linux-inmate-aplic-imsic.dts     | 124 +++
 configs/riscv/dts/qemu-linux-inmate-aplic.dts | 111 +++
 configs/riscv/dts/qemu-linux-inmate-plic.dts  | 112 +++
 configs/riscv/qemu-aplic-imsic-mc.c           |   5 +
 configs/riscv/qemu-aplic-imsic-uc.c           |   5 +
 configs/riscv/qemu-aplic-mc.c                 |   4 +
 configs/riscv/qemu-aplic-uc.c                 |   4 +
 configs/riscv/qemu-imsic.h                    |  46 +
 configs/riscv/qemu-inmate-demo-aplic-imsic.c  |   3 +
 configs/riscv/qemu-inmate-demo.c              |   1 +
 configs/riscv/qemu-inmate-demo.h              |  66 ++
 configs/riscv/qemu-layout.h                   |  33 +
 configs/riscv/qemu-linux-demo-aplic-imsic.c   |   4 +
 configs/riscv/qemu-linux-demo-aplic.c         |   3 +
 configs/riscv/qemu-linux-demo-plic.c          |   3 +
 configs/riscv/qemu-linux-demo.h               | 146 ++++
 configs/riscv/qemu-plic-mc.c                  |   4 +
 configs/riscv/qemu-plic-uc.c                  |   4 +
 configs/riscv/qemu.h                          | 322 +++++++
 configs/x86/apic-demo.c                       |  10 +-
 configs/x86/e1000-demo.c                      |  10 +-
 configs/x86/f2a88xm-hd3.c                     |  19 +-
 configs/x86/imb-a180.c                        |  19 +-
 configs/x86/ioapic-demo.c                     |  10 +-
 configs/x86/ivshmem-demo.c                    |  10 +-
 configs/x86/linux-x86-demo.c                  |  13 +-
 configs/x86/pci-demo.c                        |  10 +-
 configs/x86/qemu-x86.c                        |  19 +-
 configs/x86/smp-demo.c                        |  16 +-
 configs/x86/tiny-demo.c                       |  10 +-
 driver/cell.c                                 |  20 +-
 driver/main.c                                 | 106 ++-
 driver/main.h                                 |   9 +-
 driver/pci.c                                  |  33 +-
 driver/sysfs.c                                |  51 +-
 hypervisor/arch/arm-common/Kbuild             |   4 +-
 hypervisor/arch/arm-common/control.c          |  22 +-
 hypervisor/arch/arm-common/gic-v2.c           |   2 +-
 hypervisor/arch/arm-common/include/asm/gic.h  |   1 -
 .../arch/arm-common/include/asm/iommu.h       |   1 -
 .../arch/arm-common/include/asm/irqchip.h     |   2 -
 hypervisor/arch/arm-common/irqchip.c          |  13 +-
 hypervisor/arch/arm-common/lib.c              |   6 +-
 hypervisor/arch/arm-common/psci.c             |  13 +-
 hypervisor/arch/arm/include/asm/arch_gicv3.h  |  53 --
 hypervisor/arch/arm/include/asm/types.h       |   4 +-
 hypervisor/arch/arm/iommu.c                   |   4 -
 hypervisor/arch/arm/traps.c                   |  13 +-
 hypervisor/arch/arm64/Kbuild                  |   9 +-
 .../arch/{arm-common =3D> arm64}/gic-v3.c       |  48 +-
 .../arch/arm64/include/asm/arch_gicv3.h       |  30 -
 .../include/asm/gic_v3.h                      |  10 +-
 hypervisor/arch/arm64/include/asm/ti-pvu.h    |   2 -
 hypervisor/arch/arm64/include/asm/types.h     |   2 +
 hypervisor/arch/arm64/iommu.c                 |   7 -
 hypervisor/arch/arm64/paging.c                |   5 +-
 hypervisor/arch/arm64/smmu-v3.c               |   1 +
 hypervisor/arch/arm64/smmu.c                  |   7 +-
 hypervisor/arch/arm64/ti-pvu.c                |  14 +-
 hypervisor/arch/arm64/traps.c                 |   2 +-
 hypervisor/arch/riscv/Kbuild                  |  18 +
 hypervisor/arch/riscv/Makefile                |  13 +
 hypervisor/arch/riscv/aplic.c                 | 790 +++++++++++++++++
 hypervisor/arch/riscv/asm-defines.c           |  46 +
 hypervisor/arch/riscv/control.c               | 277 ++++++
 hypervisor/arch/riscv/dbg-write.c             |  33 +
 hypervisor/arch/riscv/entry.S                 | 421 +++++++++
 hypervisor/arch/riscv/exception.S             |  91 ++
 hypervisor/arch/riscv/include/asm/bitops.h    |  75 ++
 hypervisor/arch/riscv/include/asm/cell.h      |  45 +
 .../smmu.h =3D> riscv/include/asm/control.h}    |   9 +-
 hypervisor/arch/riscv/include/asm/csr64.h     | 222 +++++
 hypervisor/arch/riscv/include/asm/irqchip.h   | 119 +++
 hypervisor/arch/riscv/include/asm/ivshmem.h   |  15 +
 .../arch/riscv/include/asm/jailhouse_header.h |  32 +
 hypervisor/arch/riscv/include/asm/mmio.h      |  67 ++
 hypervisor/arch/riscv/include/asm/paging.h    | 138 +++
 .../arch/riscv/include/asm/paging_modes.h     |  18 +
 hypervisor/arch/riscv/include/asm/percpu.h    |  64 ++
 hypervisor/arch/riscv/include/asm/processor.h | 105 +++
 hypervisor/arch/riscv/include/asm/sbi.h       |  86 ++
 hypervisor/arch/riscv/include/asm/sections.h  |  14 +
 hypervisor/arch/riscv/include/asm/setup.h     |  16 +
 hypervisor/arch/riscv/include/asm/spinlock.h  |  75 ++
 hypervisor/arch/riscv/include/asm/types.h     |  15 +
 hypervisor/arch/riscv/irqchip.c               | 247 ++++++
 hypervisor/arch/riscv/ivshmem.c               |  63 ++
 hypervisor/arch/riscv/lib.c                   |  36 +
 hypervisor/arch/riscv/paging.c                | 278 ++++++
 hypervisor/arch/riscv/pci.c                   | 123 +++
 hypervisor/arch/riscv/plic.c                  | 495 +++++++++++
 hypervisor/arch/riscv/setup.c                 | 273 ++++++
 hypervisor/arch/riscv/traps.c                 | 827 ++++++++++++++++++
 hypervisor/arch/x86/amd_iommu.c               |   4 +-
 hypervisor/arch/x86/apic.c                    |  24 +-
 hypervisor/arch/x86/cat.c                     |   5 +-
 hypervisor/arch/x86/control.c                 |  26 +-
 hypervisor/arch/x86/include/asm/apic.h        |   4 +-
 hypervisor/arch/x86/include/asm/control.h     |   4 +-
 hypervisor/arch/x86/include/asm/ioapic.h      |   4 +-
 hypervisor/arch/x86/include/asm/iommu.h       |   2 -
 hypervisor/arch/x86/include/asm/types.h       |   4 +-
 hypervisor/arch/x86/ioapic.c                  |   4 +-
 hypervisor/arch/x86/iommu.c                   |   4 +-
 hypervisor/arch/x86/svm.c                     |   6 +-
 hypervisor/arch/x86/test-device.c             |   3 +-
 hypervisor/arch/x86/vmx.c                     |   4 +-
 hypervisor/arch/x86/vtd.c                     |   4 +-
 hypervisor/control.c                          | 108 +--
 hypervisor/include/jailhouse/cell.h           |   8 +-
 hypervisor/include/jailhouse/control.h        |  36 +-
 hypervisor/include/jailhouse/gen-defines.h    |   8 +-
 hypervisor/include/jailhouse/header.h         |   7 +
 hypervisor/include/jailhouse/mmio.h           |   4 +
 hypervisor/include/jailhouse/paging.h         |   2 +-
 hypervisor/include/jailhouse/pci.h            |   4 +-
 hypervisor/include/jailhouse/percpu.h         |   4 +-
 hypervisor/include/jailhouse/processor.h      |   4 +-
 hypervisor/include/jailhouse/types.h          |  14 +-
 hypervisor/include/jailhouse/unit.h           |   7 +-
 hypervisor/pci.c                              |  11 +-
 hypervisor/setup.c                            |  22 +-
 include/arch/riscv/asm/jailhouse_hypercall.h  | 113 +++
 include/arch/riscv/asm/sbi_ecall.h            |  96 ++
 include/jailhouse/cell-config.h               |  42 +-
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
 inmates/lib/riscv/uart.c                      |  47 +
 inmates/tests/riscv/Makefile                  |   0
 inmates/tools/riscv/Makefile                  |  19 +
 inmates/tools/riscv/linux-loader.c            |  25 +
 pyjailhouse/config_parser.py                  |  45 +-
 pyjailhouse/sysfs_parser.py                   |  20 +-
 scripts/include.mk                            |   3 +
 tools/jailhouse-config-check                  |   6 +
 tools/jailhouse-config-create                 |  14 +-
 tools/root-cell-config.c.tmpl                 |  15 +-
 260 files changed, 8913 insertions(+), 898 deletions(-)
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-aplic-imsic.dts
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-aplic.dts
 create mode 100644 configs/riscv/dts/qemu-linux-inmate-plic.dts
 create mode 100644 configs/riscv/qemu-aplic-imsic-mc.c
 create mode 100644 configs/riscv/qemu-aplic-imsic-uc.c
 create mode 100644 configs/riscv/qemu-aplic-mc.c
 create mode 100644 configs/riscv/qemu-aplic-uc.c
 create mode 100644 configs/riscv/qemu-imsic.h
 create mode 100644 configs/riscv/qemu-inmate-demo-aplic-imsic.c
 create mode 100644 configs/riscv/qemu-inmate-demo.c
 create mode 100644 configs/riscv/qemu-inmate-demo.h
 create mode 100644 configs/riscv/qemu-layout.h
 create mode 100644 configs/riscv/qemu-linux-demo-aplic-imsic.c
 create mode 100644 configs/riscv/qemu-linux-demo-aplic.c
 create mode 100644 configs/riscv/qemu-linux-demo-plic.c
 create mode 100644 configs/riscv/qemu-linux-demo.h
 create mode 100644 configs/riscv/qemu-plic-mc.c
 create mode 100644 configs/riscv/qemu-plic-uc.c
 create mode 100644 configs/riscv/qemu.h
 delete mode 100644 hypervisor/arch/arm/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common =3D> arm64}/gic-v3.c (95%)
 delete mode 100644 hypervisor/arch/arm64/include/asm/arch_gicv3.h
 rename hypervisor/arch/{arm-common =3D> arm64}/include/asm/gic_v3.h (94%)
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
 rename hypervisor/arch/{arm64/include/asm/smmu.h =3D> riscv/include/asm/co=
ntrol.h} (58%)
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
2.40.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20230519204033.643200-1-ralf.ramsauer%40oth-regensburg.de.
