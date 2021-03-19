Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB75F2GBAMGQE3NI3NVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53d.google.com (mail-pg1-x53d.google.com [IPv6:2607:f8b0:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065E34169A
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:30:09 +0100 (CET)
Received: by mail-pg1-x53d.google.com with SMTP id y26sf24095146pga.10
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:30:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139008; cv=pass;
        d=google.com; s=arc-20160816;
        b=pHyRPwmHdMw+0Ncu8KoGxJR8iw/qnwqXPJhNTLPRM1D3SZzaXZnflZ90p6r8yjKJ8U
         WHZuk/EWOlkoGIWi/RmYxOJLysyM0eUeVElxB4RBI8rEsPUVqsBCyScBzY8G4vkDu4M/
         iYHaLOW47dUcXcgvjR3MkGujFb6NEK+dthh+30EL6gC3kKAZTTKWm9hF+3XkiEMLguEb
         qzCgUM+u+PKC6u0ChIx6fGkYk7xQjURMV5yAhP8GDsc14chO9h0yoSV/bpPAxvhCPWXq
         w/wgSYwMTDSiKVbmYkJB6ZTUQD8FeHhwX6Oky/b2U46RPEBl7qV0JThWLH9vbf+Y78cD
         5W7Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:subject
         :message-id:to:from:date:dkim-signature;
        bh=D5zT4F4AmTjdg7qTQAXXbkuNr69xHoE6VIENT9bI9qM=;
        b=ft/j1ze77RwowBYCCvZljFBxHfIoHPNl5UabHSZc6lsDj3hyL6q2Oabk5DppOG1a/A
         +AtB1uNPPzEFwDLAns5yTbUjieto6E/TVWX4qWdE+VEhk6xnzaZYNiL3T1yA7I+3L/wB
         ZyClqlbOxluuvZ5ljZ+oA5KUo/w+orCvMSHv5gmIesrCBp+8M/6ZE0G0B8eUP57tRD1M
         lzhSBrnsDwGkIWtsSmCETtwkBcVnSnu4Ej4vrPX6elpIMYfDcMBTbvCKpZXP3Unnbkvf
         rRXZQYWGoxZE50fZCq145Dl+YOlXgJ1y2/kHp8fkv5LUSb6MJDw1VKFDX9/Uhh6wh3xn
         5DQg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=BKL44Hm1;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=D5zT4F4AmTjdg7qTQAXXbkuNr69xHoE6VIENT9bI9qM=;
        b=dUkIPbUNO8amypVrYMyionM+53K8YeoY9jZBVVKUxFvMrWhgIOJAPJpVxVu/D/TfCN
         EUYk+QEohNagyZc5FzQ0nRYNDRYsb09T6bco4+qix2UdfBG7FNGtKZOj/Yif9RscJF4f
         4ylvhLHUTwWmAuJIsdxuXBryhVhyMm+yr4BY4q4P13GbECWGsNZrs6/VIbzdr5SLZ1S9
         U366e5iOrXQ7EC67OEmJ0Q0lKv7f6jKj5r6lXU2H9S9AMv5tmoadhjOzAfpV3X1n0Oii
         8QM5YKs+G20nTDFjgqLHJigUWxwAOBNlPncusBuXJkqcchg7dgXTU2GcC+lNcElRevmA
         3ptg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=D5zT4F4AmTjdg7qTQAXXbkuNr69xHoE6VIENT9bI9qM=;
        b=qeVZ4x8vqOfaT21nUhEzfBpWMhpVM7vJ6FAhLF7Arn5bC6W+PaRVnpqbc8+sJTpzPm
         2iZX/s9qIVWveIs1Gxl6LNLNhM6QPs2A8Jn5zVuKd2UVtGHjdGq1LzoUdyRQWf/gpvh/
         vHSLFqspGH/3j+7EIEWBl6ern4YmIgCMOS8sxmHUHMIcpi+WC/5qVxjqpgH+K2Cxpjuj
         uunQMWr9ulouAv47mQNdnkO/3E92E+eU0Ci5+xC4IodoyWD0djneOCf0s2d1z4FssvqE
         ntIJWClZ59sfY5X/MsnHATUcf4NsWLR2RUiUsm2kcqgPhzrmMn4iz0lZsKqec4WkaknP
         R6Tg==
X-Gm-Message-State: AOAM5320zzh2M8PPkajnqtLbKgP2c09jiUTMMvyLV/3zHWBe1dRXTUFj
	L7eb6WWiazlYk0R1KguOqRo=
X-Google-Smtp-Source: ABdhPJyBeQEupX2DSxsdG4CpBy45L5TPuNuStNU+lEzobW+aOYq28SzzmOcatFbsAUZfK3TF8kjwww==
X-Received: by 2002:aa7:9471:0:b029:1f2:3e6c:69e3 with SMTP id t17-20020aa794710000b02901f23e6c69e3mr7754550pfq.69.1616139007873;
        Fri, 19 Mar 2021 00:30:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:7f10:: with SMTP id a16ls2049178pfd.7.gmail; Fri, 19 Mar
 2021 00:30:07 -0700 (PDT)
X-Received: by 2002:a63:445e:: with SMTP id t30mr10629073pgk.147.1616139006932;
        Fri, 19 Mar 2021 00:30:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139006; cv=none;
        d=google.com; s=arc-20160816;
        b=nf1KDPGiwTRw38GrPYSmi83Z/J4oEHHOri2RmJt4Tk0h3Pf0Tq3SF/W8yV9ulHrhxV
         mu89X7UML5WgbuG6SI+d1L4Yl3f23vmz7dmCUrlS92osjwW5HN2BYZQG/RCpmlGg3fCz
         xcUH1Ygc6Iy89l/VZOAeiU5geCfNZQxNy0tLUbrwtjbG9Pq2xzD7deGC8aHGyImwd8Jq
         Urep1WoQbAd1/yNlZOL5zE5coGSrGlaTAVYhnkzqzmlEKUVHX9wqzRLAvUS59ZeujrQa
         I8b7ueLcp6rB1RSvtZx35kdsI9lLGpQOGAko37kv7qmPWAL6OaH+GSr0Eg5jQ/v9zUM5
         2RIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=qswWbOnjpTJUAneKBOAS3vPgv5jhn9R+kT7BVeZph7M=;
        b=HbuKF9JOP4T+NNSMWT9ICCd4N4D94ViBiBixJ2WOtYpRkMAV7stq+H/L9YPL32UuKm
         923o3W02AdVaSuYg1azDipHC2DuTvMlJpQfNpjAiZd+DRMNWXetsyOjxBTeG70+u51fO
         TM5apPutk1oumvXsvSwqd38FHnMZWZoYDGKdqIXwmJNwgRO1ykgF8jWdfh81s3JeqVNa
         crQWU0lx5wLDggLL0CCQ58DVRIsI0DqOyAVMUi8WAdYMfm+1apUQF7felA7zlc36Is/+
         iGHSLK71Y1mbZmUCivXc33jpJng46kpUHgtL7OLnyerzoxHDDrVke5Lz9UJZOuO0BmpT
         NeWw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=pf2014 header.b=BKL44Hm1;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=github.com
Received: from smtp.github.com (out-26.smtp.github.com. [192.30.252.209])
        by gmr-mx.google.com with ESMTPS id r2si292737pjd.1.2021.03.19.00.30.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Mar 2021 00:30:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.209 as permitted sender) client-ip=192.30.252.209;
Received: from github.com (hubbernetes-node-d93252b.ash1-iad.github.net [10.56.25.24])
	by smtp.github.com (Postfix) with ESMTPA id 53D045E0156
	for <jailhouse-dev@googlegroups.com>; Fri, 19 Mar 2021 00:30:06 -0700 (PDT)
Date: Fri, 19 Mar 2021 00:30:06 -0700
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/6c0978-ee0e5c@github.com>
Subject: [siemens/jailhouse] 49b3b3: arm-common: Reorder gicv2_cpu_init
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=pf2014 header.b=BKL44Hm1;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.209 as
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

  Branch: refs/heads/coverity_scan
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/6c0978-ee0e5c%40github.com.
