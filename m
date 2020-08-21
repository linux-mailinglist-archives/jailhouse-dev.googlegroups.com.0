Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJO57X4QKGQED4RA3ZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x538.google.com (mail-pg1-x538.google.com [IPv6:2607:f8b0:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123224CE3D
	for <lists+jailhouse-dev@lfdr.de>; Fri, 21 Aug 2020 08:50:15 +0200 (CEST)
Received: by mail-pg1-x538.google.com with SMTP id p2sf501670pge.20
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 23:50:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597992613; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ss03uB0Izbv7fGCgGP66m/27x/9LRchg4RvCl8w6O9fQyAhDSXpJ9O0Vl5swSuzvAt
         eXF/B4fRvndZ6qRuvO4ZFDfZrFuZ1O7aqxaaeTFrmul+MMeN2k5BxZqlbc6SdBMzz5Wn
         cT7lA5ZE5a0qJXcCq2QjLYg1jjJaZCE92grW1SfpvP+YTD0qcv3/2Eqjosv2iVrvcrjg
         67pzpdMlKTzesj/u97iPLwGQDCJVp22Q4GXJxeRz/z3g2Yz7Dw1gkVtnFtRHsDVoMZ7A
         Vp2+yxjFsQlMBDVwmWAJO7+pvva/OZRmNkmwz4de+8UFjq906xDCXd9R1X0TWAyb1SPy
         qrpg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=8gtNyp/GY88VWSJ2UaBPNvBgS8C39GSkKoVhHdaCBvs=;
        b=MDKpQYzDJEQ0DmeYkwAUc/9fbICsgbGfD3RC6el/pYyspFmuxrMKKXDXlFbDZjoa2z
         4LyJkTGVhCMKsI74yVzXm3h//9/iUSmlz9Db01e5YwaVOASTebRmom2nzGPnzy+lDumB
         mt10LKf41aRYRUgabyM0brvVqDeXfMsx3zx2lR3k8f5y8vnUKvYvsyAQNOzAeQ3EU7s3
         f2kGdA/+Rw16VXaTP3aBgekWHNaeme9DIoLQDpYka8/U5JRby1JdHNwQZbsDHlJuWGqR
         R0f/P8kSuvwBTvJTVcHsp/81GGij7sAGbXl+v7rPOSL/v+R1JEHTJg7sJBnLR/GPdepW
         twNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kZGNzfu5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8gtNyp/GY88VWSJ2UaBPNvBgS8C39GSkKoVhHdaCBvs=;
        b=TVXKQaTh6brzEUSjx/AJ9Jm/e6tYpzmG2ColdXL+9YemBE9AAymtSJAk2BaN/We2fc
         D7vgbVK9jNGQPKsAAamrbjf3V87l//96TlrdNd1v5XxC9Ot91fowDCh6qKGcXP0Zwdj2
         2X7j+muLhBW214+meXc0v8rySHH23owDayrntZAXX8Z+isULuH8+6Y1GDRQXimnBlYoG
         /H0bYAb3Lu+WxOMaNcX/Fa1veZ3brk+DDRL/dNMxDrvJdFuBn8NQP5yuZwC6e2W4muzw
         2nGnDGt2irC4qY3xC/TyO0jQmOC9Za2Lc0ovjmG0LUji1iYIWbrBKodfwoT++hvX2aBQ
         iCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=8gtNyp/GY88VWSJ2UaBPNvBgS8C39GSkKoVhHdaCBvs=;
        b=WClqOV4wBnJT864QpkqjSoB8ut3wdSGQu8fdDL1jVeWhGUenk35OI5WszL/UjS48rl
         1bjd4h+Dotc7z8N/Rh633APJJILOvDCwXYzQj+osqNMsRJ93yFI4oXi2oWfZjAPpa1nb
         mAzYH9t9ZkM8w9MnCNdUO+4IivIuBG1Vd5YcN8xQk7av8gIiOEoZMOTJA61Koszjb8SE
         2oNVErgepPc1cII7WOyCLKc48O/QjafV+ZMivuZqcgGwjcqVhJRM9rRRvbxYLvYRKplY
         NgJKpQ0QhxY6qE34MJ4KrwMBSkIj1R2UJvVIE4ydAqIdhdrGFhrHM+4Tj+tBUNCAKEqi
         yplw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530qXL61/IOxDpLh0dHBlQ0D3+72g8mNASaNt3h2XNQA8DIpU1mM
	mviq6nFnv+ltbHx51yWY614=
X-Google-Smtp-Source: ABdhPJwhb95CaoX/P70lZfpLhzrQ1//NxHIOZeHiP4NKQTY5GwNSyTBTpHY37RQhYSaP/NsLc46WHg==
X-Received: by 2002:a65:480a:: with SMTP id h10mr1312267pgs.304.1597992613382;
        Thu, 20 Aug 2020 23:50:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b602:: with SMTP id b2ls606140pls.11.gmail; Thu, 20
 Aug 2020 23:50:12 -0700 (PDT)
X-Received: by 2002:a17:90a:d34b:: with SMTP id i11mr1279617pjx.125.1597992612754;
        Thu, 20 Aug 2020 23:50:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597992612; cv=none;
        d=google.com; s=arc-20160816;
        b=qHvUhTqU50kx3j+IiVU3nPi4xxYYOBDYrICuzqnR8Awkhx0nxysRbVT/NoIpFWnPXX
         xBXAP12T7rBXRQoq3sJ07KRFFWseFPJN1+SKR7sHHJ9KchP1g6IO/y3ErINxiguBhBhe
         fFPfmbIjJybfsH2KcOGRJI9Adw9TJAh4QxfiMMcOrW9nBif1im0gbA9FjBKEBTDU4laK
         eCiauEsE0rZfhS0q/TflCULAsmpH7mvF5TQKQzDAQOidnySD7sxKX9SkcIEu/QiKynoA
         2E7HxHxEEU7Pq9dNUK1f9FmzNX0WAA/TNNaio85uzwUJQqMwm4VEV29dGia083ownq0E
         Xs/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=e2+ciAK3MDROMA5BVhiZq9xEW+fP+O3veQrmZ7mex7Y=;
        b=cttcjjx9TjxlESW+wRDV0pjkz22FhO2OxecdjE8YnzT9jEGVaX7vlPbDvrEkH9E6dJ
         7nHAHxRjA6k7GbyHAVS+OPwCcPbvXsmIf8YLR2K4HNTW8nTdgZFTC3nuACbQsxtU0hi7
         xq85C3qSTKR/UQnD0ZqwyNK2EBkDxihuBBaAy9nGlq6PDDfDEk8rW2PgLbMUVijJMk0f
         /ZWnYJXOMTa6yZogyzH92xKoYRw3ubkLMgejNdisJCEGBv3M9eqOB28/xNNEN14oleeJ
         Hn2BKMvWadMuYzhHBjy0hXO6Sp9mv9B65sEFN7ye/pL8TvVfDsyNQDnVk3ezRMOOdt9c
         +CkA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kZGNzfu5;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id q137si65253pfc.4.2020.08.20.23.50.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Aug 2020 23:50:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-fa7043e.ash1-iad.github.net (github-lowworker-fa7043e.ash1-iad.github.net [10.56.109.45])
	by smtp.github.com (Postfix) with ESMTP id EE28EE1E94
	for <jailhouse-dev@googlegroups.com>; Thu, 20 Aug 2020 23:50:11 -0700 (PDT)
Date: Thu, 20 Aug 2020 23:50:11 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/ce1098-2f0c87@github.com>
Subject: [siemens/jailhouse] 5bd098: arm: irqchip/gic: Ensure we have an ISB
 between ac...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kZGNzfu5;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
 permitted sender) smtp.mailfrom=noreply@github.com;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=github.com
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
  Commit: 5bd098db2e9f591fb5620be4a06b1686e736de50
      https://github.com/siemens/jailhouse/commit/5bd098db2e9f591fb5620be4a06b1686e736de50
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm: irqchip/gic: Ensure we have an ISB between ack and ->handle_irq

The whole commit message is from Linux Kernel:
commit <39a06b67c2c1>("irqchip/gic: Ensure we have an ISB between ack and ->handle_irq")

Devices that expose their interrupt status registers via system
registers (e.g. Statistical profiling, CPU PMU, DynamIQ PMU, arch timer,
vgic (although unused by Linux), ...) rely on a context synchronising
operation on the CPU to ensure that the updated status register is
visible to the CPU when handling the interrupt. This usually happens as
a result of taking the IRQ exception in the first place, but there are
two race scenarios where this isn't the case.

For example, let's say we have two peripherals (X and Y), where Y uses a
system register for its interrupt status.

Case 1:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. Y then raises its interrupt line, but the update to its system
   register is not yet visible to the CPU
3. The GIC decides to expose Y's interrupt number first in the Ack
   register
4. The CPU runs the IRQ handler for Y, but the status register is stale

Case 2:
1. CPU takes an IRQ exception as a result of X raising an interrupt
2. CPU reads the interrupt number for X from the Ack register and runs
   its IRQ handler
3. Y raises its interrupt line and the Ack register is updated, but
   again, the update to its system register is not yet visible to the
   CPU.
4. Since the GIC drivers poll the Ack register, we read Y's interrupt
   number and run its handler without a context synchronisation
   operation, therefore seeing the stale register value.

In either case, we run the risk of missing an IRQ. This patch solves the
problem by ensuring that we execute an ISB in the GIC drivers prior
to invoking the interrupt handler. This is already the case for GICv3
and EOIMode 1 (the usual case for the host).

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 59c13520ca5e7e235d1dc93674e92b23ec89fb4d
      https://github.com/siemens/jailhouse/commit/59c13520ca5e7e235d1dc93674e92b23ec89fb4d
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/Makefile

  Log Message:
  -----------
  arm64: Do not use FPU registers in jailhouse

Some compilers default use hardfloat to generate instructions,
so it will use some FPU/NEON registers to do some optimization.

However some inmates might use FPU/NEON registers do some
calculation such as vector/audio and etc. So we need to disable
jailhouse use these registers. Use `-march=armv8-a+nofp` for this.

Reported-by: Michal Hanak <michal.hanak@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ac290aab988018282f333c6182e271a9fc1e3738
      https://github.com/siemens/jailhouse/commit/ac290aab988018282f333c6182e271a9fc1e3738
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/control.c
    M hypervisor/arch/arm64/include/asm/sysregs.h

  Log Message:
  -----------
  arm64: allow accessing simd/floating-point registers in inmate

Set bit 30 of FPEXC32_EL2 to enables access to the Advanced SIMD and
floating-point functionality from all Exception levels.

Set CPACR_EL1.FPEN to not trap accessing to SIMD or floating point
registers.

Reported-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Jan: replaced CPACR_EL1_FPEN(3) with CPACR_EL1_FPEN_ALL]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d557c02606ba1f38bb803935da6bffab9cc986ef
      https://github.com/siemens/jailhouse/commit/d557c02606ba1f38bb803935da6bffab9cc986ef
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm/Makefile

  Log Message:
  -----------
  arm: pass -march=armv7ve to KBUILD_AFLAGS

Some toolchains might not have this flag default set, so when compiling,
there will be error that "dsb not supported" in cache.S.

So pass the flag to force toolchain use v7.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2f0c8774eef8abec46daf7c98ac0057df514c739
      https://github.com/siemens/jailhouse/commit/2f0c8774eef8abec46daf7c98ac0057df514c739
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-21 (Fri, 21 Aug 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: Makefile: add -march=armv7ve

Add -march=armv7ve to avoid build error
that ".virt extension not supported".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ce10986e6637...2f0c8774eef8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/ce1098-2f0c87%40github.com.
