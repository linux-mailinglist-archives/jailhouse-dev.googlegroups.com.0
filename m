Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGEXYH6AKGQEK3NREJI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77A294F1F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 16:54:18 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id f4sf1802767ljn.2
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 07:54:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603292058; cv=pass;
        d=google.com; s=arc-20160816;
        b=0HpW/ml6UZVh9fFntmtKHBI1GotmXzQzYalRCmx7ZazhzhPIz2oeqQKhUytTAt+Gv0
         5NyfbsxYnV4vgjL6e5+XhYILw5zcyD3zyoe9O3pWxlE1Co/t5eFOoktAgCFPWh8oJAHU
         I3hWU9eqjiMKCz7znUvPx2BUk3hL324nUx0RZOkQDNPVeWzRqLhLBkfKhq17M4eRU5vI
         3PdPEfiGq3Rb2jPpe5Z3lnGwcTTmQe61ataBFrHTapvyBYsJGUPrbWVUjjB+NEkjbu4n
         68lQGFakA03By8f7L68Oly7P2NZxGLK8EkwvuuXprExGL/XoAgtGP0vWNplsRcFwLUan
         ynBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=FrKOX3oXGPQ54jC+fQwkzsV1/ckDHd8YRwoHUx8r/zs=;
        b=lCYE69k1DbQb4ewFAYl5wb8LU5DR5ENCLYJ9537LAvxM8tJssjut9rq9xQiJvp3Jr0
         Z7KYbXjVJTr4PFl3tGDtdOpNdtBbSpnNfOMpeo/pvENBTAXB7UMfv2fuQmJ/Tb081/Mk
         wmXVFVnaObzi+DnxxK+dDJ8lc/Bc03Wp22gSvtbsh2nqLgadAMP5i0ei/Ls/L6ztHyeO
         pqaajm6Uzd9y4+thTI8m4NMNYVyVN2TG2GB6vfdg3uR2kA2wuixPlPO8sbp0sizNM1QA
         G93TrW9Nb6i5bVKrsBYv3kZQeHEGZUTmDVQSw3lrJtUGS8OpajUBLeedzY96RW1BgcrH
         XBrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ozaopMI9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=FrKOX3oXGPQ54jC+fQwkzsV1/ckDHd8YRwoHUx8r/zs=;
        b=Q5R4BeInAqIJN5LrLeS+rkvs2mrARdMs2BMT+aWHmDYYY3ig0YuesvjqCkwDss9dB7
         b2v/olr+ivPNPak+ORBt82hhI0C9CYLduGwPBqPdx6ukrXOsQWdgbXBRYZ3N6r+XhJAi
         1m1dwN0qTRPQa8sjF/0vItC7C5OSag5P0ZTAYvYWFeBSrI/EBUpkoFa3shG3egtQB08W
         ipDAgDPBgOT1jmQK8hiNhllBRoF/Uqo6F4h/LeL/Afckh+mrrSyEDkApPqxSXKcVLgTD
         Gc2LHllGce9EEUPQPazM4GXCJu41J7Wx9GhfFLeJaw5k+sBg80f3j0oRYBI8JOClUhLU
         VbMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=FrKOX3oXGPQ54jC+fQwkzsV1/ckDHd8YRwoHUx8r/zs=;
        b=Ybt4FddIx5CE5VOgSJ0CWM4MmHqVjNQohtbQkwmyM2S0G5dsc6T5/rl6G0c67jph3C
         qHOFLqbxEwssh2EFaF+Q0wz2OyybWXg/nl1Qh5fVifv5fuAd0zF+wF0O+be/zULdCmxY
         LG8Gci9SJ0aNxnIJ9HDzIs2fxFyc7qk48x+VJHi6egMuEVOsyRql96h2l5bkMqTLsmDf
         qY1h8udwpaXp5NmNN7LAsdOf82VlOI7lglk7oxQtQ6vGaS6pTjB5WQa7XuaqTkB2KhIW
         F8ogAzaV+1jYVGnS7ICbPbc9mPy+mnJDY4OvprBAbV0S55se8AHUra5JCPEsnaMGoLI5
         gHJg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531wM9gcyvVmAy4dO09EadaaQ1DqWZ0DVODMdsEJsBP8px17pWwz
	Ku+VVZ2IUvmwmMo9G/eDMT0=
X-Google-Smtp-Source: ABdhPJzgT+1zxzBPS0GEW6FmdztCIu94fV3ps7dtw28aOwnbloEWDaG8EUA2Bg5/2mzUAdxZ2Aei9g==
X-Received: by 2002:a19:3d1:: with SMTP id 200mr1529572lfd.241.1603292056534;
        Wed, 21 Oct 2020 07:54:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5e61:: with SMTP id a1ls122787lfr.2.gmail; Wed, 21 Oct
 2020 07:54:15 -0700 (PDT)
X-Received: by 2002:ac2:4a6c:: with SMTP id q12mr1546970lfp.12.1603292055405;
        Wed, 21 Oct 2020 07:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603292055; cv=none;
        d=google.com; s=arc-20160816;
        b=u5yb4peJjQDx60gicKH/FSvdb0NOMJpccRwOiR1TPtE3VoADpgu3xIktqSlx0M9jmR
         Bt2oGluHAMP7xpeyCs0TJRd6xi8IFeJNovQ+EGRhAqlgVWoEs5cUvWOm1dq8vcr4Lwoh
         PzEJD0vxbdREF6rqu4iem3QDT5jRid05ocutyvoYTDKR6DUKoSUlKSOFZUc//6N2tzAx
         2oZvOGjsM6L43MumZUErCRu0r3BXZHXpDhsYu+Zl6WbQ1nu88o/xKxbiHmBrcEwJKcS2
         esYbHKS86taQE+Wf19KV4OqslcCGFdUJexZOnv6xf0gxnVC4ev7f+UB6Jm8MTil1k4+C
         /y5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:dkim-signature;
        bh=+0zIyFNuGScUAjfB/kMS7TwnZ6IrpYs96PFmPTJwqBU=;
        b=L4nQvpigeRHVy07+zz43ugYEcZ+LxWiSPbOVtfzMZPXxDDdR46qGr+N579a5VQj4zw
         3zFrzIz35gZN5qnRPIHv/tvMSOZfTxKc+8xCGQa5eXuISxVWhFuuvaO+CExN0zLhXeGq
         M6f2S1y88xa4E6uGNv3qzdXXaWp37Ple99cxdOyIJc4Mov/QPnK8M0vILLZ+L9Y65+AG
         P/ys2OwcWyanjCoQA/9fXS4UQNg4SMl0MgEdzFajFrZjzOoduwblCXqF2BhvNkHNxcoD
         NTwFz+Xm0eXwFxomNoIRDI9SYaM6WW24YCmXyGhvC6/CDpAa40Ec7gx+tXoMW4GB8tgH
         pQjA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=ozaopMI9;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id i16si83834ljj.3.2020.10.21.07.54.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 21 Oct 2020 07:54:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CGYRT6VBWzyWr
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_SPF=0.001, LRZ_TO_SHORT=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id ne6-GURzMaOp for <jailhouse-dev@googlegroups.com>;
	Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
Received: from kabal.tum.de (unknown [IPv6:2001:4ca0:2fff:11::2aa])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CGYRT2C0RzyRN
	for <jailhouse-dev@googlegroups.com>; Wed, 21 Oct 2020 16:54:13 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 00/26] Extend hypervisor compile warning set (and fix warnings)
Date: Wed, 21 Oct 2020 16:53:38 +0200
Message-Id: <20201021145404.100463-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=ozaopMI9;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
Content-Type: text/plain; charset="UTF-8"
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

As part of a project I was experimenting with compiler warning options
that partial covers coding standard rules from e.g., MISRA 2012. An
example is Wconversion, and the narrower sign-conversion, sign-compare,
pointer-arch, cast-qual. E.g., Wconversion covers MISRA 2012 10.3 (and
parially 10.4, 10.1).

Before enabling those, I've enabled some other warnings to filter out
definition/declaration "issues" that would clutter the compilation
otherwise. Specifically (Patch 0001), I've added: -Wextra -Wundef
-Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated

The warnings were not too many (most of them related to
unused-parameters), but there were some interesting ones e.g.:

hypervisor: provide dedicated declaration for __page_pool and __text_start in globals.h
hypervisor: introduce uptr_t (depending on the wordsize) and define size_t accordingly
hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID


The patch series fixes the warnings generated by "-Wextra -Wundef
-Wnested-externs -Wshadow -Wredundant-decls -Wdeprecated", and two small
bugs:

x86: bitops: only x86_64 is supported, avoid picking the wrong default suffix
arm64: smmu: fix double negative

Up to "0024 x86: bitops: only x86_64 is supported, avoid picking the
wrong default suffix", the series is the same for both master and next.

These two

arm64: smmu: Wsign-compare: make iterator uint
arm64: smmu: fix double negative

are only next related.

I've compile-checked x86, arm, arm64, and tested arm64 (ZCU102), but I don't
have a suitable arm / x86 physical targets and I'm still figuring out
a crash I have on qemu-x86 (can reproduce with plain jailhouse-image
qemu image).

I don't know if there's interest in extending the compiler flags with
warnings about code structure, but since the code compiles cleanly with
the patches, I thought about sharing them.

Additional info:
gcc (Debian 10.2.0-13) 10.2.0

JFTR:
Wcast-qual generates 276 warnings on arm64 (but they looks ~ the same,
it could be feasible fixing them) Wconversion + Wpointer-arith are a
worse beast (~ 1400 occurrences), and the "int" return convention in
Linux doesn't make it easy to cleanly fix them.


Andrea Bastoni (26):
  hypervisor: add extra warning flags
  hypervisor: protect inclusion of string.h
  hypervisor: protect inclusion of processor.h
  arm-common: provide unsigned int PSCI_INVALID_ADDRESS
  arm-common: fix old-style defs, sign-comparison warnings
  hypervisor: provide dedicated declaration for __page_pool and
    __text_start in globals.h
  arm64: smmu-v3: avoid shadowing smmu and fix sign-comparison
  hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
  hypervisor, arm-common, arm64: keep compiler happy about unused
    parameters.
  hypervisor: mmio: fix Wsign-compare by casting index to u32.
  hypervisor: printk: Fix Wsign-compare by casting width to int. Fix
    protoype for align.
  arm64: ti-pvu: fix Wsign-compare by casting size to u64.
  x86: fix simple Wsign-compare warnings
  x86: unused parameters. Keep compiler happy.
  x86: apic: Wsign-compare change to uint and update comparison check
    accordingly
  x86: iommu: Wshadow, fault_reporting_cpu is global
  x86: cat: fix Wsign-compare
  x86: vtd: fix Wsign-compare
  hypervisor: introduce uptr_t (depending on the wordsize) and define
    size_t accordingly
  arm: Wunused-parameter: keep compiler happy
  arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned
    long as size
  hypervisor: Wsign-compare: force the "right" promotion direction
  x86: control, vcpu: force cast to prevent Wsign-compare
  x86: bitops: only x86_64 is supported, avoid picking the wrong default
    suffix
  arm64: smmu: Wsign-compare: make iterator uint
  arm64: smmu: fix double negative

 hypervisor/Makefile                           |  4 ++++
 hypervisor/arch/arm-common/gic-v2.c           | 12 ++++++-----
 hypervisor/arch/arm-common/gic-v3.c           |  9 ++++----
 .../arch/arm-common/include/asm/dcaches.h     |  2 +-
 hypervisor/arch/arm-common/include/asm/psci.h |  2 +-
 hypervisor/arch/arm-common/irqchip.c          |  4 ++--
 hypervisor/arch/arm-common/lib.c              |  2 +-
 hypervisor/arch/arm-common/paging.c           |  8 ++++---
 hypervisor/arch/arm-common/pci.c              | 13 ++++++++++++
 hypervisor/arch/arm-common/psci.c             |  4 ++--
 hypervisor/arch/arm-common/uart-imx-lpuart.c  |  1 +
 hypervisor/arch/arm-common/uart-imx.c         |  1 +
 hypervisor/arch/arm-common/uart-mvebu.c       |  1 +
 hypervisor/arch/arm-common/uart-xuartps.c     |  1 +
 hypervisor/arch/arm/control.c                 |  2 +-
 hypervisor/arch/arm/iommu.c                   |  5 +++++
 hypervisor/arch/arm/mmio.c                    |  1 +
 hypervisor/arch/arm/mmu_hyp.c                 |  4 ++--
 hypervisor/arch/arm/traps.c                   |  2 ++
 hypervisor/arch/arm64/mmio.c                  |  2 ++
 hypervisor/arch/arm64/smmu-v3.c               | 19 ++++++++++++-----
 hypervisor/arch/arm64/smmu.c                  |  5 +++--
 hypervisor/arch/arm64/ti-pvu.c                |  2 +-
 hypervisor/arch/arm64/traps.c                 |  1 +
 hypervisor/arch/x86/amd_iommu.c               | 14 +++++++++++++
 hypervisor/arch/x86/apic.c                    |  4 ++--
 hypervisor/arch/x86/cat.c                     |  3 ++-
 hypervisor/arch/x86/control.c                 |  2 +-
 hypervisor/arch/x86/include/asm/bitops.h      |  2 +-
 hypervisor/arch/x86/iommu.c                   |  2 +-
 hypervisor/arch/x86/ivshmem.c                 |  2 ++
 hypervisor/arch/x86/paging.c                  |  2 +-
 hypervisor/arch/x86/setup.c                   |  1 +
 hypervisor/arch/x86/svm.c                     |  2 +-
 hypervisor/arch/x86/vcpu.c                    |  2 +-
 hypervisor/arch/x86/vmx.c                     |  1 +
 hypervisor/arch/x86/vtd.c                     | 11 +++++-----
 hypervisor/control.c                          |  4 +++-
 hypervisor/include/jailhouse/control.h        |  5 +++--
 hypervisor/include/jailhouse/globals.h        | 21 +++++++++++++++++++
 hypervisor/include/jailhouse/percpu.h         |  3 +--
 hypervisor/include/jailhouse/processor.h      |  4 ++++
 hypervisor/include/jailhouse/string.h         | 10 +++++++--
 hypervisor/include/jailhouse/types.h          |  8 +++++++
 hypervisor/include/jailhouse/unit.h           |  2 +-
 hypervisor/lib.c                              |  6 +++---
 hypervisor/mmio.c                             |  2 +-
 hypervisor/paging.c                           |  7 +++++--
 hypervisor/pci.c                              |  8 ++++++-
 hypervisor/printk.c                           |  6 +++---
 hypervisor/setup.c                            |  7 +++----
 51 files changed, 182 insertions(+), 66 deletions(-)
 create mode 100644 hypervisor/include/jailhouse/globals.h

-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201021145404.100463-1-andrea.bastoni%40tum.de.
