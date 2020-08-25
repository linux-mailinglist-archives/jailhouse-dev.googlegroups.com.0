Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBE6UST5AKGQEYPSQKRY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A93251BE8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 17:11:17 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id k32sf8050369pgm.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 08:11:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598368276; cv=pass;
        d=google.com; s=arc-20160816;
        b=j32JnYE2Zg2l77894Q5IVlD+6EZGnTItZ3/YNqndYQ7ofZyrMnNJWjTO6tEWUZPhX0
         Twbr9gDatkCIr8i/oPlR9eVyCW8wZbWRMCrBhdtXV9RsCRMI4FUy2YLMMaYF7akwg+O5
         UztRkitSgEBjz/1+EMB8xlDh0M7y58/0dJcsBVU3DS3L6mlbeWhOsofDJ7k4pYoxWpV5
         XnuVs3vMUKLFiHYt4UTVq+Di3ji2wIyFzRHuRobLCNHND3l+EZytvTbkdYwu8BZh7r4Z
         EJ5PmL5a7qiRSZmKjLYcefLJr+x5avcZ9XFr6l1MHT1QatZjKWI0OKrnImhQvCb3tTWu
         alPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=fEr5bvWCM01HROBeoDlf1RtBR+kzNaFGZqrZjL426CI=;
        b=wAB1UdqhP5N3kIWAmDVhXXCAE3Of43icwdlK5IhmdDXFBUGdfYozbM/hQCyp85jHc2
         f4Mz9l2P9+gZXY6m/D8S/vDXwCsnFeODUaeyJWMpdzYDYm3IPKSgcrRFcaYbRKuxOF6x
         BubIR33Wysb6YjAP8Wsj4Rkfqhnce+WU1tq3dX3DXlC9Ijn3BkxppTzjkuC2q+7qgTxO
         +Af372aTQgQMzOWCvzHCPAckWzinNs9CalOwnf+dGuvEJMsDNxrpjBZY3V7UH+IRZmSt
         RyY0HQZrsERvlyruHO5Nyk0K9MPtPmFwebkRiz70Doj/U7YMLPPFNCIzOYippxhtUqWW
         ljsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GgzQ6I88;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fEr5bvWCM01HROBeoDlf1RtBR+kzNaFGZqrZjL426CI=;
        b=G+3b3o5QDfMv5w8kbe+W2gdY1VowZBMOtL5dw7kQOyNggKdQ/jeQ3H+Td5o2NVmMNj
         0zDHDpBQpiKrHrgaggoS8fIZwk9/+IZiVP5cInCZI8DnokhSgrBmvBPpLukF4/61miIa
         vFtGTThlmp/gaEc0nEccpXzqSBEO+tL0NNdiH3tvBH6mvpTjMDyOXkgMtTK2lJbMwS9h
         dyArXB6AVODz9QkfJcF8wDMg50OlCBYvtBZWcqx957NzAKYduOXMabowWlpUrQ8vhPWE
         WVI/vQPDiLmPus+U+HnEYyQANVxHcYDTDrpuG0qLAlq7jp1lrEu8Ze+Sx1azQ5yI/m6F
         4T6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=fEr5bvWCM01HROBeoDlf1RtBR+kzNaFGZqrZjL426CI=;
        b=PYJfka1FGAbS41PJpKnoyLxdtY9o5sFu3nQCKuJu0fVllcT4UtuO/h9Kc4jHtulKCN
         seO60Otj+eXL1mQYPSNA1f7oaBmm7iYZuqN9zevayKnS78YXNhAfrOndidQbFjUMaD1G
         2CSDLqmq2/N6FXvI2WnUGkXZ0FuXQK+qIZtLx5nsEQkyPpgjkt8DP9dwJSkdO66sMBn7
         Vx7ztX/YV3iOH9lOUWTQ9Lwf0vkMC/klrQO/EIg3Lk4XeXoetROZVJ9KhrOBjxYRgv94
         MRvXpZD4jl6WY2jgiKkUMZBmi9tb9Kpxtw1z6IYLemnVe5uOEFMwgx6MV+uuBX5P2mEl
         Dr3A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Myh6lmmzU9aqidRUyD4IhK8HHug1FGshRu/ZJLgtICdn+qI84
	ObRP9GlZMMBZ92er14XqChc=
X-Google-Smtp-Source: ABdhPJylU17iR0luID9IBNdgYuc5+jgPDJi/R1PvgJUb4LmgP3e9RJYQsGuwBmByZjxfL1TPLD8aNg==
X-Received: by 2002:a17:90a:e388:: with SMTP id b8mr2050719pjz.154.1598368275817;
        Tue, 25 Aug 2020 08:11:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:82c5:: with SMTP id u5ls4423988plz.2.gmail; Tue, 25
 Aug 2020 08:11:15 -0700 (PDT)
X-Received: by 2002:a17:90b:124e:: with SMTP id gx14mr2036335pjb.225.1598368274993;
        Tue, 25 Aug 2020 08:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598368274; cv=none;
        d=google.com; s=arc-20160816;
        b=JbKhonhxx9CeHIYK9xoYZQqyZIaVuqk9eyY1/yMillNQi8Vt9pa/zsIK6kgW0PXFqg
         rGfQDdoyQBGfrgzo5P15gayfazLh5POpBGa/GF9dgOn04NDQK3p0vdgnuJbuIP9Shns7
         s85zxrAUflTNJlEKg6y8s4zDtZlKLqt/pU+vRmh305WKvxRT6Atf2WmwDqlJEzQ9Efb+
         FMK9M/4HgFsxC37azGxN1LN9ZH3E+yv1Ibbw3IqWhUJZ5Y6du35e0kXINqb9AhOgvqvC
         luMAeTycyVRx6sKSa+tzggNSwvQEB3meoUq0QCQQHn0OPaSfbBZ5cX6UOuRgYUd9RD6K
         xZzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=hiiUQf4IRaI55omHKcf8BiPWGUZCEAUZYLmDSqR/weA=;
        b=g5/WPIMiwVgnAkvQ7FsJTcBVI59aeldhTza5Ka8keTt66K4SQNEalbhC0iA5wg0KpV
         vYV/jpz/LkhOuXUQa1XG9d2J93hVZp3RrITlJ8Jk5Pq3Ek+aDo+WWuQ5xtjxYdXbXHf0
         KR/VFZ395U8mK3Q8dPsaXqyD2PKK7hNaXG0E+EEOzWPPdJXF62cs3hz+bKrjdVclMKU8
         /Z6gC3wpXevaPhhA7sWzRPuzGuOa7YwuKmCX3AmN0OnnV17eOWu/EK9zApwtc/Ttk5lD
         z+1onNAiQhBqtZjNkCti/aicd0gPdunW49T9YpCFem+qMm1dcmSSfv8qLCdv/ucdxwVm
         UrEg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=GgzQ6I88;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id n4si551820pgt.3.2020.08.25.08.11.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Aug 2020 08:11:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-f1f7af9.ash1-iad.github.net (github-lowworker-f1f7af9.ash1-iad.github.net [10.56.111.13])
	by smtp.github.com (Postfix) with ESMTP id 36DB1900756
	for <jailhouse-dev@googlegroups.com>; Tue, 25 Aug 2020 08:11:14 -0700 (PDT)
Date: Tue, 25 Aug 2020 08:11:14 -0700
From: Peng Fan <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/9b4efc-6d7eed@github.com>
Subject: [siemens/jailhouse] 42b1f5: imx8: add lpuart support
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=GgzQ6I88;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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

  Branch: refs/heads/master
  Home:   https://github.com/siemens/jailhouse
  Commit: 42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
      https://github.com/siemens/jailhouse/commit/42b1f5a55e4e4c3ccce3eb915bc9c8c82c394860
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-12 (Wed, 12 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm-common/dbg-write.c
    M hypervisor/arch/arm-common/include/asm/uart.h
    A hypervisor/arch/arm-common/uart-imx-lpuart.c
    M include/jailhouse/console.h
    M inmates/lib/arm-common/Makefile.lib
    A inmates/lib/arm-common/uart-imx-lpuart.c
    M inmates/lib/arm-common/uart.c

  Log Message:
  -----------
  imx8: add lpuart support

On i.MX8/8X family, there is only LPUART. So introduce lpuart support.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 723bbf3842387bd826bf21fa35782102352ce1f1
      https://github.com/siemens/jailhouse/commit/723bbf3842387bd826bf21fa35782102352ce1f1
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm/control.c
    M hypervisor/arch/arm64/control.c
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/sysregs.h
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  arm64: support inmate cell in AArch32 mode

An AArch64 hypervisor can host both AArch32 and AArch64 virtual machines
at the same time. If the inmate cell wants to run in AArch32 mode, the
assigned cpu must change to AArch32. Because AArch64 hypervisor and
AArch64 root cell are used, when the AArch32 inmate cell is destroyed,
cpu owned by inmate cell will be reassigned to AArch64 root cell, switch
the cpu back to AArch64.

The following is a summary of some of the points when supporting inmate
cell in AArch32 mode:
Define a macro "JAILHOUSE_CELL_AARCH32" to indicate AArch32 execution
state. Add this macro to flags of struct jailhouse_cell_desc, and you can
use it to indicate whether a cell is AArch32.

Add "bool aarch32" as second parameter to arm_cpu_reset(), and can use
it to pass execution state. If aarch32 equals true, switch to AArch32.

When an exception occurs, the processor must execute handler code which
corresponds to the exception. When the exception is being taken at a
lower Exception level, the execution state of the next lower level
(AArch64 or AArch32) will be used. Fill exception handling functions for
Lower EL using AArch32 in hypervisor/arch/arm64/entry.S.

Configure the registers related to changing execution state. If a cell
is AArch32, SPSR_EL2.M[4] will be set to 0b1 which means AArch32
execution state, SPSR_EL2.M[3:0] will be set to 0b0011 which means
Supervisor, and HCR_EL2.RW will be set to 0b0 which means lower levels
are all AArch32. If a cell is AArch64, make sure HCR_EL2.RW is 0 and the
other registers are configured according to the previous code.

After Linux operating system boots up, execute the following commands to
use AArch32 virtual machine on the i.MX8DXL:
./jailhouse enable imx8dxl.cell
./jailhouse cell create imx8dxl-gic-demo-aarch32.cell
./jailhouse cell load 1 gic-demo.bin (32-bit)
./jailhouse cell start 1

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: style fixes]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a9ff2e14ea6a6fb03e460cdfabbe21ad86020776
      https://github.com/siemens/jailhouse/commit/a9ff2e14ea6a6fb03e460cdfabbe21ad86020776
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic-v3: Add support for accessing GICR_TYPER high word separately

This is needed for 32-bit guests that cannot issue 64-bit accesses, thus
will trigger two separate 32-bit accesses.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: replaced subject and commit message]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f82c6c6e15c9b6d61f40fdc2bb1cf8a4ac5838f7
      https://github.com/siemens/jailhouse/commit/f82c6c6e15c9b6d61f40fdc2bb1cf8a4ac5838f7
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    M inmates/lib/arm-common/gic-v3.c
    M inmates/lib/arm/include/asm/sysregs.h
    M inmates/lib/arm64/include/asm/sysregs.h

  Log Message:
  -----------
  inmates: gic-v3: solve 32-bit incompatibility problems in gic_v3_init()

When the inmate cell is in AArch32 execution state, using mmio_read64()
to obtain the value of GICR_TYPER will cause error because mmio_read64()
generates "ldrd" instruction when compiling 32-bit gic_demo.bin, and
"ldrd" belongs to A64 assembly language which is cannot be used in
AArch32. So use mmio_read32() to read 64-bit GICR_ TYPER in twice.

In ARMv8-A, AArch64 state supports four levels of affinity. but AArch32
state can only support three levels of affinity. So use MPIDR_CPUID_MASK
to set bit[31:24] of mpidr to be 0, and ensure the correct mpidr.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: slightly improved subject]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a073bf3dcfa7d4b4d38b5438d5e504487f9231ed
      https://github.com/siemens/jailhouse/commit/a073bf3dcfa7d4b4d38b5438d5e504487f9231ed
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    A configs/arm64/imx8dxl-inmate-demo-aarch32.c
    A configs/arm64/imx8dxl-inmate-demo.c
    A configs/arm64/imx8dxl.c

  Log Message:
  -----------
  configs: arm64: imx8dxl: add cell configuration files

Add "imx8dxl-inmate-demo-aarch32.c" to support AArch32 VM on the imx8dxl
platform. Distinguish whether it is AArch32 inmate cell by the macro
JAILHOUSE_CELL_AARCH32.

Add "imx8dxl-inmate-demo.c" for AArch64 VM.

"imx8dxl.c" is used for the root cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e2750a3de4fed41932a986e720238b5f7c0f5614
      https://github.com/siemens/jailhouse/commit/e2750a3de4fed41932a986e720238b5f7c0f5614
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    M hypervisor/arch/arm64/entry.S

  Log Message:
  -----------
  arm64: mitigate Straight-line Speculation

From Linux Kernel
commit 679db70801da ("arm64: entry: Place an SB sequence following an ERET instruction")
"
Some CPUs can speculate past an ERET instruction and potentially perform
speculative accesses to memory before processing the exception return.
Since the register state is often controlled by a lower privilege level
at the point of an ERET, this could potentially be used as part of a
side-channel attack.
"

Use Speculation barrier sequences:
 - SB
 - DSB followed by ISB

Since we not have ARMv8.5 with SB extension hardware, so only
use the 2nd approach now.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5daf0d70ede0a41502594f86dd764ff756f5177b
      https://github.com/siemens/jailhouse/commit/5daf0d70ede0a41502594f86dd764ff756f5177b
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

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


  Commit: 14c8802f1d2b784e7cda14fc4a2cd649f2296fdb
      https://github.com/siemens/jailhouse/commit/14c8802f1d2b784e7cda14fc4a2cd649f2296fdb
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

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


  Commit: 84a767a682b1767b8108232ca8a4a908e14bf87e
      https://github.com/siemens/jailhouse/commit/84a767a682b1767b8108232ca8a4a908e14bf87e
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

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


  Commit: cd7090bbb4b54e4beaa454e1a824e48b57c70a8a
      https://github.com/siemens/jailhouse/commit/cd7090bbb4b54e4beaa454e1a824e48b57c70a8a
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

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


  Commit: 6d7eed9ccf149b35b0b0d9662aa2d0fb2891916f
      https://github.com/siemens/jailhouse/commit/6d7eed9ccf149b35b0b0d9662aa2d0fb2891916f
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-08-25 (Tue, 25 Aug 2020)

  Changed paths:
    M inmates/Makefile

  Log Message:
  -----------
  inmates: Makefile: add -march=armv7ve

Add -march=armv7ve to avoid build error
that ".virt extension not supported".

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/9b4efcf4cb3a...6d7eed9ccf14

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/9b4efc-6d7eed%40github.com.
