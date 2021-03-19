Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB75F2GBAMGQE3NI3NVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf37.google.com (mail-qv1-xf37.google.com [IPv6:2607:f8b0:4864:20::f37])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADC2341699
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:09 +0100 (CET)
Received: by mail-qv1-xf37.google.com with SMTP id s16sf31582650qvw.3
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:30:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139008; cv=pass;
        d=google.com; s=arc-20160816;
        b=voQW8DQ09Hq0n+AB43TsK8tMh9MJ9Xr8Jx8QXH+0jGCiyeOCgrBpSh+WjYPAUdHiYD
         RZDP3OJkdUbo+N43jUStL0xRRNSONcv0P2H+sv/ozQgG6mKFiZr2BIAABWG8IEA7pLJE
         NkU6flE97tNrWWqIQsXFLgPeBWbigV9IuqD8DoWm1oKZCODyz3M8OkN+4nKrJl9vL+fS
         idc45Sgk2Qojg+CRE27UoLsp13Hn2qw9rM3q8DVRJIVcFNsLR/fqwvT/4qmnNLMO9/Xf
         R2kxhf8laGPotJGRuu9jRYAi2f4vTGB38IxHBupqnLwToPgVH7AWE42C8GXCZsJIa6Gc
         s8qg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=rMJcPU7pluUgBlMLRyZyzsROJDty5t1/vo5tCue2JZM=;
        b=Kmby2icU/9slXpy2B96T2vyoHuwwxrQyRYmKqCzKb7KqE5gsZfthzjUjZrSKWKVpCr
         l8Ca4g+3YezrL2UiA8m9jDmK8/3z66K9MYVatM5Pn7mn3eYKgFLZK0qkcRUaBOu8Na5Q
         10a4rsFHHAFRgC3MGWavr4h86C1w6WjMhZEqjxwe2Qc5rPuoVU5YYqjcaeYBECyGVwzq
         IbOjlodSn5WrxB+XnzC0GjGatkcd8sL5+WyEGlSPLbsljkylGFpYPEZhC+3t/I/yhtq0
         qcd9A1bFTgGvbRi3WyAJRaLodFT4m0h8KVsvYU5nj2PXSZckAZt9yNUUEUkReIEhUbek
         7mJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=x4F0tuHc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=rMJcPU7pluUgBlMLRyZyzsROJDty5t1/vo5tCue2JZM=;
        b=jLsGG6R31ziAYwjLhudgGH13gvcDlDCCYs4iW8uk44t36Z0gemdsc0PnNk1O8ZeooW
         d4kkVAANMsV0QOmChvK81kWBqlI/7xhjNjItfQo5NmICvC6HZJnoZZn1OJ+B2ZO4f8cf
         73Kzt4XBa0C+5Hn0YKTqRtWode/D7aIRrA05tTo6E1JmLSw8nXBjak+rF/m1j2qb81Jb
         jLMjT2M5HpmSc3gkJRdHcgOSLDzflE+nZrpSoqQ1K6x8Gd4/q2cYLHjOTSapBjnLNIaA
         YmSTUQBNSk0sjy5X3xTIdzkhPm87pVEabWCB5KaO27CRB0SnzYoW10jJGBsejBUWG2D8
         +vNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rMJcPU7pluUgBlMLRyZyzsROJDty5t1/vo5tCue2JZM=;
        b=Io44+geykMuhEJScP4NgZO1wd8WXU1tP9VU9rWt41RhaGK63TiVkz5LMMlMZqo1sIw
         THGcXJaDgKdp7kvVrxrnfl9IzDDM3VeD1X3oMmcjJf3GS1uSomX1GyqfIj+AG7XLCGBo
         0OVB0ZccvV69e4zT8J/6q5Fb9vokFV/u/lMwzxjOnkPOulA23NUwDXUkxv6A3eHoBMnM
         oyRrnvghO/usBE2/RKefPeEbtaQ2LPxTl1M4aBPWnBHPDAFYt3eLNAxk09wwQdVs9SPM
         oXR3U1PBT3Rm8JoamhbvEc/3B258wC1JV93MTEi1Z7/z/GX7k0CySf0VphUOOlmeWE+f
         C5Ug==
X-Gm-Message-State: AOAM532Fev/W8dSy19JpkkpHj34pAB3/Vr0n/n6LjLjzF3V/vx7QjYaj
	YPUAJIjYpeSOJ01rEb8wbUE=
X-Google-Smtp-Source: ABdhPJzBvi/PnEWpZ7vXzB4VvOZD2BsYd/cHNENGdwsh6xEtjcunFI7kNF4cNEDiqb2U8GLZiXi8XA==
X-Received: by 2002:a05:620a:1477:: with SMTP id j23mr7806300qkl.416.1616139007883;
        Fri, 19 Mar 2021 00:30:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:7508:: with SMTP id u8ls1845776qtq.0.gmail; Fri, 19 Mar
 2021 00:30:07 -0700 (PDT)
X-Received: by 2002:ac8:4b52:: with SMTP id e18mr6760938qts.45.1616139007370;
        Fri, 19 Mar 2021 00:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139007; cv=none;
        d=google.com; s=arc-20160816;
        b=TVk6RvNXGytw79U5nnHLszB2+NFdTJslBrHWgE9n0zuhhUnO/Gbq66kE3l+61YS2bQ
         I5cSvad8fJl6Upn/6s4RMj0/k6L2EmP8TZhJzPUnKUcNcb5I7JvzjvhOn4B6XjFRDg2G
         BsUIs59r/rkoQYDk4+TIPw+lGjm//wvYsRfki6y+3oMmDbITooGQ6krixjJ+pfdVtmdp
         QQjQBWKR+xyKYXns2zC5Zw8oa4mClp9hLY81uBcgwPek+CSKObJ2WhJ/SQkZ+fk/fN9d
         +ZrVzjxkn6zxQysTmcxC0navPZhhtpQF1qYHMGWh50/p6EvojC1DtGQ7CAOqzpQVKrXM
         bX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=QF8RmyJwXE2Ufqgzl6frzU80mr3ASKbDGnxsH7i/ITI=;
        b=wS5F8rgcIhmdgomF8OzwJM7E8C1bc2BmVDUEjnQPRmTAYqKzhyZlY8XN8xc/QZ6G72
         hSJ0KHopUaLq4qlkcI7g11C/MJnQUSUMb9h4CC5RYQ2XXPUNUlVU/Sc+MlA8aAz2kdy9
         6tJqILosi3TEBjOAQOTTejQKChJEBlCF/uDIdvfesIBQWLsnZZ6m9EwViImeSVqwdyfY
         iIL416SAvYECSsIJHpT9MxLXLROrubNwY7f4CQ7rbN4Lc80Mm+U0Bmzt0hLBgZ35qxjg
         ZyNcSKsilI7+xzxqDOQlUQv7E8dALqSlcmsE4AOyxiIuC/LHb8JUVEfDGRc6iXWAkyYQ
         WREQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=x4F0tuHc;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-17.smtp.github.com. [192.30.252.200])
        by gmr-mx.google.com with ESMTPS id a15si26858qtn.4.2021.03.19.00.30.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 00:30:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.200 as permitted sender) client-ip=192.30.252.200;
Received: from github.com (hubbernetes-node-5c6d91e.va3-iad.github.net [10.48.118.76])
	by smtp.github.com (Postfix) with ESMTPA id 286C85C059A
	for <jailhouse-dev@googlegroups.com>; Fri, 19 Mar 2021 00:30:07 -0700 (PDT)
Date: Fri, 19 Mar 2021 00:30:07 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/6c0978-ee0e5c@github.com>
Subject: [siemens/jailhouse] 49b3b3: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=x4F0tuHc;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.200 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass
 (p=REJECT sp=REJECT dis=NONE) header.from=github.com
X-Original-From: Jan Kiszka <noreply@github.com>
Reply-To: Jan Kiszka <noreply@github.com>
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

  Branch: refs/heads/next
  Home:   https://github.com/siemens/jailhouse
  Commit: 49b3b33c1338a59fd333c69fffbff813990f8042
      https://github.com/siemens/jailhouse/commit/49b3b33c1338a59fd333c69fffbff813990f8042
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c

  Log Message:
  -----------
  arm-common: Reorder gicv2_cpu_init

This pulls CPU ID validation and gicv2_target_cpu_map setup to the
beginning of gicv2_cpu_init so that we can fail early if needed, before
any changes to the hardware configuration are made. This will also help
when introducing SDEI-based management interrupts.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 68e592b1f315172b707e41ec3c6ac1ca86419771
      https://github.com/siemens/jailhouse/commit/68e592b1f315172b707e41ec3c6ac1ca86419771
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/smccc.c
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Expand return type of smc helpers to long

This allows to evaluate all 64 bits on arm64. Will be needed for SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
      https://github.com/siemens/jailhouse/commit/839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm64/include/asm/smc.h

  Log Message:
  -----------
  arm/arm64: Add further smc helpers

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
      https://github.com/siemens/jailhouse/commit/275e855a0b75c03c9162c6a3bb4fe7414bf7e37e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Reorder arch_cpu_init

This will allow to modify the hcr value based on the result of
arm_cpu_init when SDEI is in play.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 467e6524fd2f2f58ea11fa7966695cc9d4048bec
      https://github.com/siemens/jailhouse/commit/467e6524fd2f2f58ea11fa7966695cc9d4048bec
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Add SDEI-based management event injection support

This is the first building block for switching to management interrupts
using the Software Delegated Exception Interface (SDEI) which will allow
to pass the GICC to the guest.

In this step, the feature flag is introduced - but not yet set -, and
arch_send_event is augmented with sending the event via
SDEI_EVENT_SIGNAL, software event 0.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4d41e47391385220c796aba6728382a5a37485f0
      https://github.com/siemens/jailhouse/commit/4d41e47391385220c796aba6728382a5a37485f0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v2.c
    M hypervisor/arch/arm-common/gic-v3.c
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Pass through GIC CPU interface in SDEI mode

When SDEI is used for management interrupts, we can give the gicc
completely to the cell. This requires to skip gic-v2 and gic-v3 per-cpu
initializations and to map the physical gicc-v2 into the cell or to not
enable ICH_HCR_EN in case of gic-v3. Furthermore, injected interrupts
now have to be sent as physical SGI to the target, rather than being
queued for the virtual interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 482b64b129b5506065095d4e76165bd53ee87d9e
      https://github.com/siemens/jailhouse/commit/482b64b129b5506065095d4e76165bd53ee87d9e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm64/asm-defines.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/entry.h
    M hypervisor/arch/arm64/include/asm/percpu_fields.h
    M hypervisor/arch/arm64/setup.c
    M hypervisor/arch/arm64/traps.c

  Log Message:
  -----------
  arm64: Add SDEI-based management interrupt handling

This brings the arm64-specific bits to handle management interrupts sent
via SDEI.

The pattern for processing them is derived from NMI-based injection on
x86: The SDEI event can come asynchronously at any time while in EL2,
EL1 or EL0. To avoid having to synchronize with running EL2, translate
it into a trap that is triggered on EL1/0 reentry. We use an invalid
VTCR_EL2 value for this and set the per-cpu sdei_event flag. When EL2
finds this flag set on handling the trap, it kicks off SGI_EVENT
handling and restores VTCR_EL2.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 31b3017324624b02a6731d9a5c6194208e7b3e3e
      https://github.com/siemens/jailhouse/commit/31b3017324624b02a6731d9a5c6194208e7b3e3e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm64/setup.c

  Log Message:
  -----------
  arm64: Do not trap interrupts when using SDEI

They can (and must) be delivered directly to the cell in that mode. GIC
CPU interfaces are already passed through.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 03d07e0f703987b8437969caadc30916aa0f9cbe
      https://github.com/siemens/jailhouse/commit/03d07e0f703987b8437969caadc30916aa0f9cbe
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c

  Log Message:
  -----------
  arm-common: Improve PSCI documentation

Describe what happens around CPU_SUSPEND and use the official symbolic
return code. Also explain what is (not) returned from CPU_OFF.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f97e8528200c5800a0a2e24494b2451592e1453f
      https://github.com/siemens/jailhouse/commit/f97e8528200c5800a0a2e24494b2451592e1453f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c

  Log Message:
  -----------
  arm-common: Handle SDEI case in PSCI CPU_SUSPEND

When suspending the CPU while interrupts are passed through, we cannot
simply call wfi as EL2 is not receiving interrupts as wakeup events -
the CPU would starve.

Factor out arm_cpu_passthru_suspend to handle this case by enabling IMO
and FMO before calling wfi. That ensures that EL2 will resume, and as
interrupts are off in that mode, the events will simply be carried to
EL1 when clearing IMO/FMO before returning.

For ARM, arm_cpu_passthru_suspend remains empty as there is no SDEI.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ee0e5c42c9baf1389481c372693cd8fab0e1cb88
      https://github.com/siemens/jailhouse/commit/ee0e5c42c9baf1389481c372693cd8fab0e1cb88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2021-03-08 (Mon, 08 Mar 2021)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/smccc.h
    M hypervisor/arch/arm-common/setup.c
    M hypervisor/arch/arm-common/smccc.c

  Log Message:
  -----------
  arm-common: Detect availability of SDEI on arm64

Enhance smccc_discover() to detect if SDEI is available on all CPUs on
arm64. Fail on inconsistent availability, now returning and error code.

SDEI is practically only available on arm64 and also only implemented
there in Jailhouse. So skip the probing on 32-bit.

This activates the previously introduced SDEI paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/6c09785cb079...ee0e5c42c9ba

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/6c0978-ee0e5c%40github.com.
