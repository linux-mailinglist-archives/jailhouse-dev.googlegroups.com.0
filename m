Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUWRYHYAKGQE7APKKYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9431301C1
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jan 2020 11:28:36 +0100 (CET)
Received: by mail-qt1-x83d.google.com with SMTP id g21sf3381332qtq.18
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jan 2020 02:28:36 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578133715; cv=pass;
        d=google.com; s=arc-20160816;
        b=BbCdP3SwWcb/xjfpM7GZUeIBP0Hmzb0s23s4JBBLuXl0BfXIGbtdeARLfySEIEkfn0
         8it8uq2c1cRjnPsiDbkB5oA/aduWubmGFJK8ZE9LXWtw7FRFmDZbSbcwVT5+nIgIiUi6
         4cIXdbln+FbiK1m3/W8RdsYdxtopQR9xQDUyju27SjIJFjy8MmCvjdKvb4qi36ozqyoF
         q1cQnTTjX2dTR84uFCZATUtnnoNuIsEtdaoG/nZBbOyEyCZPVinV1F9qF+qxAF/oaLTB
         kYqkQbQOvC02vSMsbW4lOqhKDCeNmCw/lQWN2Fsm3ndfQSN1r8MU0wN0PmN/gh6Hfb10
         q5Ow==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vrSy4LE56xVZB1ex54+WrzdSQklkUtZqESyim1nZeBM=;
        b=gnFNnFzcIbcuI/PE/3KfMCPieY1DGJIERfRIOCXxohkDzw279XdAt8z/KuiPJ24dW/
         AobZVJEeKrj3XoDjvZ3DzTh/PSqiQrHeqMhp9QV6LTl83yvhgdFIb1nmt/KxfqvSGVgL
         zhowSNx4pAYLno0eZXNJyjfOIed5Z3zZfexlg2XRE09L9ceB4dVDUlVdGRczYJQWtB8R
         pX+Qj6ywcTMD+gsaL+Far68b/SwNHRfIPJqAdKhFUZNIGuEcoUgX1Cko9hbHgtsH0kho
         Wi4CdLRjRmeqQXcOMdM9uobZawDl/bvCpT1O2OBu+8PLN0WlWD+MU2k26nwVR6GjHBZs
         aUyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=K3WOLjHA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vrSy4LE56xVZB1ex54+WrzdSQklkUtZqESyim1nZeBM=;
        b=UNc28kUP506ZWiGwQ5ajk2auEKED2K/91p07STut1pdpgQovL0GBjPPjHE0v4Wmg5V
         0zvASXhnfzLoq7gyccti3EY0T89coGx8m+w74oN60YWoG8KXJKkwFrAA00SiELdtpWoh
         +DD+3kU6TgmxfnK4KgKzW4LPQgsOi5092RkqbmrIo6xMwgWBXouhhtnWIzqLbYzm1ZwM
         P7VrgNmzdNMgVSUAfsJ6/r1I1nnFx7EIa2roXarnmq+YnnVuzd2l+tNkWymirY1IAV8e
         7Jrq8tCnf9clmhxd1r1yoHeo4buPnYYPRJpO/kX7JSaVId8EAechXiFzv2Z2qXHFLgzy
         zcyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vrSy4LE56xVZB1ex54+WrzdSQklkUtZqESyim1nZeBM=;
        b=cDkktzmcDP4uO0xSVBL74UWBpAA6x+b0Tl8Zrfr7VGazoK10BZ0DRafUGAns8T0a0K
         hAEdu/K2g/vhfwvwCfvyv1lbDLeV7W2j3ezp+3QoXqPT6Vx2PGzAjxwR3zE5dQdAnj6y
         PkP4EfcDw5ZhdlRKXzLECZjjzsN/EguKIjyi2DauaTf1rYjISrson9+kx4yR6zGyGC6/
         Nl+6RCuYA0OqW3MxLgIEojq8j4UMX7AuZ2whZC5rvk/R96X8r8PSv2XMeVBaFdspoDfB
         yt99INMHE2MHyB5Einr94+36H1ZL+7oHk/CtRBfTynw0PSuKHViJXMtpOkA0agiGZ9Fo
         m+uA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXD71mVW53RbTXcLqCtXgX9Jp9U6+8cfJNl4ybW8iZHlWfOI1MZ
	HXzr7UlK2rn7FZNOKx4F5JE=
X-Google-Smtp-Source: APXvYqzl/F0mkku7CBgxwHVuYByMPxNn+ddKxSdI/peiMcCM3/MPWPTaq4qcaULcTk/l5UbieaW/ew==
X-Received: by 2002:a37:2f47:: with SMTP id v68mr74970927qkh.217.1578133715035;
        Sat, 04 Jan 2020 02:28:35 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:e017:: with SMTP id m23ls6639163qkk.16.gmail; Sat, 04
 Jan 2020 02:28:34 -0800 (PST)
X-Received: by 2002:a37:8505:: with SMTP id h5mr73897280qkd.281.1578133714617;
        Sat, 04 Jan 2020 02:28:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578133714; cv=none;
        d=google.com; s=arc-20160816;
        b=GAsGLR3IvCMKCHnMcItkzsOeC5Iex5nPQfiJARN5cJhUAThT2jw9EJ8iGSGLb7RpMM
         xijZxk4FNP2lbNb0818dOcKfy30g6q7hg/mNtkYGI2ZO/utvaGiJRD4+qijTeLWP92ej
         hpGzMuvPlqrXPXjDt60Bd2mx2fpxNCx2+BHxoRkg5ItnvSIxFewyarhF1fIQFNND5Uvh
         RPdfrDu0zMjapHZvKM9XCpqmWTGCaGOb1ecccUWUQVIz/K9aj66G+MX6RmXvl2aGluWg
         lDeS4XCsXjyMEA/AD9ZnLH0na9RXiCCMrn/CbsHxT7cBS4z1p6MF1aZ9RVc/xtNfs/gA
         HP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=CJpBo4C7tHTb1TYA7vNYdA06q1+39GTVsig3tEHk0pc=;
        b=G0Zh2Hdq4lC8LuJM9AkuoFhAzOCU6umzFfdv7C4AFQ9MYuAGtHAbsMzZpCvzPHFoHm
         vAmzYd+vTR4pYgJaO4/2HEpyZf7Ea4hd5R2MqRz4WS4Wemu6/SDFPbk8xhR8fA7YVRVp
         ZPW84TimPCQU3ug0LfWLghzh20OTG7zC+MolBjzT6p6kpAm0+r7VWv2oBXAs46P/E8Qk
         a7OdASkZDTviWqkje954AfCvujhVwo0AwnCzbcDQVA3rVEaPFAiRM/pv5qCH54g/lvS/
         FztLdFn77XkKAS26o8IJr2f2KpI2f2uxf6bSVtZC9oB2cO/FRv7m5ERZGWxDdhrSykIU
         yy6g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=K3WOLjHA;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id 134si1344341qkd.2.2020.01.04.02.28.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jan 2020 02:28:34 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Received: from github-lowworker-6349a71.ac4-iad.github.net (github-lowworker-6349a71.ac4-iad.github.net [10.52.18.20])
	by smtp.github.com (Postfix) with ESMTP id 66658C60634
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jan 2020 02:28:34 -0800 (PST)
Date: Sat, 04 Jan 2020 02:28:34 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/cd140c-463ce2@github.com>
Subject: [siemens/jailhouse] c16ed3: arm64: Document why spin_lock/unlock have
 memory b...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=K3WOLjHA;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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
  Commit: c16ed30bd64efc9d7a30745c333de9adc80b4a13
      https://github.com/siemens/jailhouse/commit/c16ed30bd64efc9d7a30745c333de9adc80b4a13
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm64/include/asm/spinlock.h

  Log Message:
  -----------
  arm64: Document why spin_lock/unlock have memory barrier semantics

This makes it clearer why we have no explicit memory barrier in the
spin_lock/unlock implementation, in contrast to the ARMv7 version.

Based on research by Peng Fan.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 940e194f3be655cc56929c70b3f7fa61cc89abed
      https://github.com/siemens/jailhouse/commit/940e194f3be655cc56929c70b3f7fa61cc89abed
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Fix barrier usage in irqchip_set_pending / irqchip_inject_pending

We were missing memory barriers before updating the lockless ring buffer
of pending interrupts, both on producer and consumer side. At the same
time, we can remove a barrier that is already provided implicitly by
spin_unlock on ARM.

Reported-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0db943d9a2541f6a4539bd12377c778b1b6024d1
      https://github.com/siemens/jailhouse/commit/0db943d9a2541f6a4539bd12377c778b1b6024d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm/include/asm/processor.h
    M hypervisor/arch/arm64/include/asm/processor.h

  Log Message:
  -----------
  arm/arm64: Populate memory_load_barrier

This abstraction is currently used for mmio region updates. There is no
reason why it could be left empty on ARM. Linux does not do that as
well.

What Linux also does is to map a write barrier on ishst. However,
Jailhouse has no abstraction for write-only barriers, thus cannot use
this mapping for its generic memory_barrier.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f07ebffc91fdc37ba7760eac353338c759f563e4
      https://github.com/siemens/jailhouse/commit/f07ebffc91fdc37ba7760eac353338c759f563e4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/traps.h
    R hypervisor/arch/arm/include/arch/asm/traps.h
    A hypervisor/arch/arm/include/asm/traps.h
    R hypervisor/arch/arm64/include/arch/asm/traps.h
    A hypervisor/arch/arm64/include/asm/traps.h

  Log Message:
  -----------
  arm/arm64: Refactor traps.h inclusion

Rather than placing the arch-specific traps.h under at unusual place,
make use of includ_next to pull the common header from the prioritized
arch-specific one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0b095585b1c3511c1fab42b9c7bf4e018f8faeee
      https://github.com/siemens/jailhouse/commit/0b095585b1c3511c1fab42b9c7bf4e018f8faeee
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/gic.h
    M hypervisor/arch/arm-common/include/asm/iommu.h

  Log Message:
  -----------
  arm-common: Fix some stand-alone inclusion issues

Pull required headers to comply with stand-alone inclusion rule.
header_check is about to test the common headers and detected these
issues.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b5ef548cec668376ca65492dbd2dc03d9e8cc489
      https://github.com/siemens/jailhouse/commit/b5ef548cec668376ca65492dbd2dc03d9e8cc489
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M scripts/header_check

  Log Message:
  -----------
  scripts: Let header_check cover arm-common includes as well

We had a blind spot here. Just make sure we do not test common traps.h
because that one is only supposed to be included via its arch-specific
companion.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5acf71718a86682e35f23252d12f5f463bdb19dd
      https://github.com/siemens/jailhouse/commit/5acf71718a86682e35f23252d12f5f463bdb19dd
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M hypervisor/gcov.c

  Log Message:
  -----------
  tools: gcov: Fix missing symbol when compiling on newer GCC versions

Starting from GCC 7.1, __gcov_exit is a new symbol expected to be
implemented when using GCOV.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f6778139a403e55810553f50aa84b68d428ddcd
      https://github.com/siemens/jailhouse/commit/0f6778139a403e55810553f50aa84b68d428ddcd
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M tools/jailhouse-gcov-extract.c

  Log Message:
  -----------
  tools: gcov: Adjust Gcov counter count for GCC versions >= 7.0

As in linux-5.4/kernel/gcov/gcc_4_7.c.

Otherwise the extract tool will access Gcov data using garbage as an
index and segfault.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
[Jan: more precise reference to kernel]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bbad2a6d9f90d6e3ee6bc97fc6b829ab30583d8f
      https://github.com/siemens/jailhouse/commit/bbad2a6d9f90d6e3ee6bc97fc6b829ab30583d8f
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    M include/jailhouse/console.h
    M inmates/lib/uart-8250.c

  Log Message:
  -----------
  inmates: uart-8250: Add MDR quirk for enabling UART

UART is disabled by default on TI platforms and must be enabled
via the MDR register.

Add a new flag in the jailhouse_console and apply the quirk
as part of uart_init for 8250 driver when this flag is present.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 86efa3d44ed9d4726d3d4ee4472a826b2e2c5e33
      https://github.com/siemens/jailhouse/commit/86efa3d44ed9d4726d3d4ee4472a826b2e2c5e33
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    A configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: arm64: Add support for k3-j721-evm board

k3-j721e-evm is the new evaluation module from Texas Instruments
which has the j721e SoC. (aka DRA829) It has a dual core
ARM Cortex-A72 CPU cores, 4GiB of RAM, 2x Display ports,
6x UART ports, 5x ethernet ports, SD and eMMC interfaces for
storage and many other connectivity, graphics, multimedia and
other accelerator devices.

J721E TRM: http://www.ti.com/lit/ug/spruil1/spruil1.pdf

Add support for the jailhouse root cell config for this board.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 60daa4be4f8dbcf9a6b38b050df14231404e3192
      https://github.com/siemens/jailhouse/commit/60daa4be4f8dbcf9a6b38b050df14231404e3192
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-23 (Mon, 23 Dec 2019)

  Changed paths:
    A configs/arm64/k3-j721e-evm-gic-demo.c
    A configs/arm64/k3-j721e-evm-uart-demo.c

  Log Message:
  -----------
  configs: arm64: Add gic and uart demos for j721-evm board

Add GIC and UART demo cell configs for j721e-evm board.
This can be used to run the standard jaiilhouse baremetal
inmate demos like gic-demo and uart-demo.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f6c4b6d9062fce637edcb13fbe49167590ec2715
      https://github.com/siemens/jailhouse/commit/f6c4b6d9062fce637edcb13fbe49167590ec2715
  Author: Nikhil Devshatwar' via Jailhouse <jailhouse-dev@googlegroups.com>
  Date:   2019-12-24 (Tue, 24 Dec 2019)

  Changed paths:
    A configs/arm64/dts/inmate-k3-j721e-evm.dts
    A configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Add Linux demo for j721-evm board

Add the linux demo cell config for j721e-evm board.
Also add the required device tree for booting Linux kernel
in the inmate cell.

This cell config acts as a reference for partitioning
devices across the 2 Linux cells.
This will be updated as support for more devices get added.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix dtb build for kernels before 5.0]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ef318efa0a1f70c755196884d8317940784f63ae
      https://github.com/siemens/jailhouse/commit/ef318efa0a1f70c755196884d8317940784f63ae
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2019-12-27 (Fri, 27 Dec 2019)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: amr64: k3-j721e-evm-linux: Fix GPIO failures

For K3-J721e devices, gpio virtualization is achieved by
replicating copies of GPIO controller.

Each cell gets a dedicated GPIO controller. However, there is
additional field in the pinctrl to select the GPIO group.

Add the mem_regions for main_gpio2 and main_gpio3
Program gpio_group in the pinctrl node for SW10 gpio_keys

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 463ce276e37eacdfe534afdf96ec6902ab6db39b
      https://github.com/siemens/jailhouse/commit/463ce276e37eacdfe534afdf96ec6902ab6db39b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-12-29 (Sun, 29 Dec 2019)

  Changed paths:
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: hardware-check: Add tests for INVPCID and XSAVES

We need the corresponding features in IA32_VMX_PROCBASED_CTLS2 when the
CPU has support for those instructions. Add the missing checks to the
script.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/cd140c5a6d85...463ce276e37e

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/cd140c-463ce2%40github.com.
