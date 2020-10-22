Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBSUQY76AKGQEV6ZLOMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 1841029642F
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 19:58:35 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id y20sf437572lff.6
        for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 10:58:35 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603389514; cv=pass;
        d=google.com; s=arc-20160816;
        b=I7T6YrZaqQFTBsviwecuo9G7qqmdnhx3EIuV1h8NP5G4h8sX63Na10BIUWCDW2jehH
         qZDR6KaDJNBwGJJ4r9ZFpS+LTPSXL68nSU/i++noXSC5dGlHy1XLxnR8etBmQ9tk/rCq
         HsqY/nbV5kTjM/iN18thLkRWVhNglzdKyzlgTvRMcx3GNE05WWYjpToQ7DQFTmSaRAhQ
         i76/BUwfrr/FrghY7Qos752Phnnzy57OXMRxrinDA0XjWue3VocyUFSDX1QVRmdc87/f
         AXBIRMABv+vODzLR8i6O1G8xXnYulhI7vn/+wrIxpjmSWJqiUzgu5tdZYR492brdPGKA
         M1Dg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:message-id:date
         :subject:to:from:sender:dkim-signature;
        bh=H/zFP3jIg8gCf1O+AUmFl7R5RYbw4u4ynzjYPlWC4GE=;
        b=J20xrR23egSl6MPMzD8W/g4aGSn936k4M0vHz3RJC5bXVKHCpQdtSikXyZaN8TXI7H
         ozW6gD+wfDjGDgTRdrv6YUlwEMiHLej/TbD/Lukyrjjo5TJYtQ96E6OmamtpCXZdf5yD
         5OWslu17z8YBcm2VrS7+E7pdgYadICnUBLpha/rVgcTmlgq8uChx2tFBBHgDZiD/7R8o
         7riDF72FLzVwQif2chLPODAA99Fvm0+fetOqSt7Q68EzeLtSy4JHZJ2NDIY74L+huPT1
         Owu/acGNMZ/q55Qg2oj9Zh+zhhppaNb6P+xIUkKTJFeI9zRPXXb4ZjethHuOSQCL21r2
         HuHQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1dCdh5JR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=H/zFP3jIg8gCf1O+AUmFl7R5RYbw4u4ynzjYPlWC4GE=;
        b=WX7xuAC8uFPryFW3IhxBBErLuc5+dcnw9cWEm0vYKUxuLmFDucsPduSSqvL7DqLmcN
         cglRFJo0PSK9JT4MsjbWA9kPSLCG4d6vreRzfFw7HB7fkzGDllMoZniZy0cweIv5xset
         dQbTtyTJAJSoRM2Z35qrDqm/odIjSj9UmCjT5aLVDFCdChMmgWGyObMoXeoFBS1gYS9R
         riZ0LbJHqV2s+rneiHvQ2ShudkK2J/zh+jARyr8CQiDXHuYBIyShUI15lZnbTUpF40YN
         nv3SyO0kNYIZFblxh3hhvRqDkgIPVsUaSDGgEEGpD+ekgdrfWWZFoTcgIrv4DmCECwHR
         OMQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=H/zFP3jIg8gCf1O+AUmFl7R5RYbw4u4ynzjYPlWC4GE=;
        b=fPzizcKlWLwPz853UhBIH+H8da88CnTN8bnlZ/iUfI/OukE2dDmtilrBKl+jT/9unT
         EfAi8P9ujDF5irWRisHC0vBOH7qXyUQfekMChAjVGsP3p2GswiB0bc9B/tjR5ai2jWaG
         MMP1My5cH/TDuN/+KspumnubwnK/KuFVCcK/aS6on5hSK/OyOnu3PINVfOMz/yggX4hO
         YRTVOIsksL/l5GJ+Tey8CkLeLR7srbZpEruye/ta9P1bJ7twwLiC1N/anHGbhfJHwJkc
         t6hxDOhsAtJKj7GaDkDGtgX/NOJdIovQ2PvBk45BY0HxfLBZIf7nm2kVxfcIaQLrTppU
         511w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530Ak6Swb9WzWYAYDQchPYWq9RTrHEycl9MJ4Z9BCOyBjuzux6F9
	lxtrQpe+gLOMCmgoLprjDGs=
X-Google-Smtp-Source: ABdhPJxEXUnxioXYRJYd4Lw9Aq7QNtflDN8oMFfWCAios8KgNTtE67ZcwPS6g0ZKk0QlnODvPbO+CQ==
X-Received: by 2002:a2e:2ac1:: with SMTP id q184mr1523948ljq.391.1603389514504;
        Thu, 22 Oct 2020 10:58:34 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c111:: with SMTP id r17ls1744704lff.0.gmail; Thu, 22 Oct
 2020 10:58:33 -0700 (PDT)
X-Received: by 2002:ac2:58d2:: with SMTP id u18mr1202798lfo.390.1603389513286;
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603389513; cv=none;
        d=google.com; s=arc-20160816;
        b=AjhXjVi/s6I93IFSONiK604CeKoQSNheCB7+KvNgHI//Gx+Yp9vUm74YTRHm8ipvZ7
         qg24STM3lPqMpEm2ow6FWW2p8KFMjSaXFK9AFecmk1hnkSGbFgvMcWji5LJr5jygjpvv
         /ZKUc7y7mZgC4RRcDZqPApaRhKDbSG7ehC2YDUK939XzaxHis494UsEnq6fQu7fYxyk5
         FhzIaN2mrrGrEFHPJcgmrNgPsGwHPiJt6BcHsWYhcy5difD3ufi9EFk9xwLrHBPUQE6/
         aKRoOk5BhEHcD16xlmx42Y7PZMe6RbOmnt+ia0SD4MqFDfOgm5L+KOssValpMJ3zeAXp
         yf1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:dkim-signature;
        bh=2Uu7WnwKb1/L9f7KHPFUjpl2bHp4pqqv8xFCe3LU93s=;
        b=zbOUAi2x6Hbt5xCIBJPhYa76KUpRJrM1ZetmiAdlb3WQGkioKiuEACN/prLPC4Gw8q
         whmpnNyqDfeSkB4IiOqZ4+5peaghep0oKz1nqFz04x/eJsCtOkpdvYOB2zZ5+SQibRT2
         Pd3hJPOBDy30DmDJ1pbCxvNSl9aQd45nE1OUSldh1ArmNtkJKv2KW0TiJWWAqKWJJmdA
         rarbO5IgOgtJe6+Q5E4uHEnpvD7CgrY+SUnrNuy/AeFcl5fgNscnrwZJVOC/Hfb7Ni+Q
         fIDUpRp3M7qncHaWJ7i5a/15cUd+PYa67Jzf6JAN06c8mQRAinrkRRVa46enOq60Iaaj
         vwpw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=1dCdh5JR;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id t9si46193lfe.13.2020.10.22.10.58.33
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Oct 2020 10:58:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4CHFTh2rzWzyXb
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
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
	with LMTP id WxPtZJ3eqNrb for <jailhouse-dev@googlegroups.com>;
	Thu, 22 Oct 2020 19:58:32 +0200 (CEST)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4CHFTg69RPzyVH
	for <jailhouse-dev@googlegroups.com>; Thu, 22 Oct 2020 19:58:31 +0200 (CEST)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 00/33] Extend hypervisor compile warning set (and fix warnings)
Date: Thu, 22 Oct 2020 19:57:52 +0200
Message-Id: <20201022175826.199614-1-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=1dCdh5JR;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Changes in v2:
 - Incrementally fix added warnings and disable Werror step by step.
   (This is cumbersome for Wextra since it adds multiple warnings at
    once. For Wextra I disabled Werror and then enabled it again after
    the series of fixes. The fixes are nonetheless incremental.)
 - move __page_pool into paging.h
 - Rebase on next.
 - Group patches by areas.

As part of a project I was experimenting with compiler warning options
that partially cover coding standard rules from e.g., MISRA 2012. An
example is Wconversion, and the narrower sign-conversion, sign-compare,
pointer-arch, cast-qual. E.g., Wconversion covers MISRA 2012 10.3 (and
partially 10.4, 10.1).

Before enabling those, I've enabled some other warnings to filter out
definition/declaration "issues" that would clutter the compilation
otherwise. I've added: -Wextra -Wundef -Wnested-externs -Wshadow
-Wredundant-decls -Wdeprecated

The warnings were not too many (most of them related to
unused-parameters), but there were some interesting ones e.g.:

hypervisor: move declaration of __page_pool into paging.h
hypervisor: introduce uptr_t (depending on the wordsize) and define size_t accordingly
hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID

I've compile-checked x86, arm, arm64, and tested arm64 (ZCU102).

Additional info:
gcc (Debian 10.2.0-13) 10.2.0

JFTR:
Wcast-qual generates 276 warnings on arm64 (but they looks ~ the same,
it could be feasible fixing them) Wconversion + Wpointer-arith are a
worse beast (~ 1400 occurrences), and the "int" return convention in
Linux doesn't make it easy to cleanly fix them.

Andrea Bastoni (33):
  hypervisor: Makefile: hook-in -Wnested-externs
  hypervisor: move declaration of __page_pool into paging.h
  hypervisor: Makefile: hook-in -Wshadow
  x86: iommu: Wshadow, fault_reporting_cpu is global
  arm64: smmu-v3: avoid shadowing smmu
  hypervisor: Makefile: hook-in -Wredundant-decls
  hypervisor: protect inclusion of string.h
  hypervisor: protect inclusion of processor.h
  hypervisor: Makefile: hook-in -Wdeprecated and -Wundef
  hypervisor: Makefile: temporarily remove Werror and hook-in Wextra
  hypervisor: introduce uptr_t (depending on the wordsize) and define
    size_t accordingly
  hypervisor, arm-common: provide an explicit uint INVALID_CPU_ID
  hypervisor: mmio: fix Wsign-compare by casting index to u32.
  hypervisor: printk: Fix Wsign-compare in align()
  hypervisor: Wsign-compare: force the "right" promotion direction
  arm-common: paging: fix old style declaration
    (-Wold-style-declaration)
  arm-common: provide unsigned int PSCI_INVALID_ADDRESS
  arm-common: gic*: use uint instead of int when needed (Wsign-compare)
  arm, arm-common: Wsign-compare: arm_dcaches_flush(): take unsigned
    long as size
  arm64: smmu-v3: use uint instead of int when needed (Wsign-compare)
  arm64: ti-pvu: fix Wsign-compare by casting size to u64.
  arm64: smmu: Wsign-compare: make iterator uint
  x86: fix simple Wsign-compare warnings
  x86: apic: Wsign-compare change to uint and update comparison check
    accordingly
  x86: cat: fix Wsign-compare
  x86: vtd: fix Wsign-compare
  x86: control, vcpu: force cast to prevent Wsign-compare
  hypervisor: -Wunused-parameter: keep compiler happy
  arm: -Wunused-parameter: keep compiler happy
  arm-common: -Wunused-parameter: keep compiler happy
  arm64: -Wunused-parameter: keep compiler happy
  x86: -Wunused-parameter: keep compiler happy
  hypervisor: Makefile: re-introduce -Werror and remove -Wno-error=*

 hypervisor/Makefile                           |  5 ++++-
 hypervisor/arch/arm-common/gic-v2.c           | 12 ++++++-----
 hypervisor/arch/arm-common/gic-v3.c           |  9 +++++----
 .../arch/arm-common/include/asm/dcaches.h     |  2 +-
 hypervisor/arch/arm-common/include/asm/psci.h |  2 +-
 hypervisor/arch/arm-common/irqchip.c          |  4 ++--
 hypervisor/arch/arm-common/lib.c              |  2 +-
 hypervisor/arch/arm-common/paging.c           |  8 +++++---
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
 hypervisor/arch/arm64/smmu-v3.c               | 20 ++++++++++++++-----
 hypervisor/arch/arm64/smmu.c                  |  3 ++-
 hypervisor/arch/arm64/ti-pvu.c                |  2 +-
 hypervisor/arch/arm64/traps.c                 |  1 +
 hypervisor/arch/x86/amd_iommu.c               | 14 +++++++++++++
 hypervisor/arch/x86/apic.c                    |  4 ++--
 hypervisor/arch/x86/cat.c                     |  3 ++-
 hypervisor/arch/x86/control.c                 |  2 +-
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
 hypervisor/include/jailhouse/paging.h         |  3 +++
 hypervisor/include/jailhouse/percpu.h         |  3 +--
 hypervisor/include/jailhouse/processor.h      |  4 ++++
 hypervisor/include/jailhouse/string.h         | 10 ++++++++--
 hypervisor/include/jailhouse/types.h          |  8 ++++++++
 hypervisor/include/jailhouse/unit.h           |  2 +-
 hypervisor/lib.c                              |  6 +++---
 hypervisor/mmio.c                             |  2 +-
 hypervisor/paging.c                           |  6 ++++--
 hypervisor/pci.c                              |  8 +++++++-
 hypervisor/printk.c                           |  6 +++---
 hypervisor/setup.c                            |  6 +++---
 50 files changed, 162 insertions(+), 64 deletions(-)

-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201022175826.199614-1-andrea.bastoni%40tum.de.
