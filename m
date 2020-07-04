Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBW7EQL4AKGQEHQPRJWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc3e.google.com (mail-oo1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EF4214780
	for <lists+jailhouse-dev@lfdr.de>; Sat,  4 Jul 2020 18:46:21 +0200 (CEST)
Received: by mail-oo1-xc3e.google.com with SMTP id v13sf8189868oor.3
        for <lists+jailhouse-dev@lfdr.de>; Sat, 04 Jul 2020 09:46:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1593881180; cv=pass;
        d=google.com; s=arc-20160816;
        b=tLKZonuthW8EfcCGDCDVqVK+fSKfdAr5OE+c+TvHDySjFgAZ+gD7B16F8ld3sd7U7V
         OZSfBaWdND1VuSH0g5xEz2uBm6RbL3zl8lNv6FenucF2eJhauPhOGk7ygE9G9CX1JlTE
         Qq4TxcdH26B8L06UDk0QDXhNkrG3+G69A3fg9hwmZPM1QU0EOexEm69IC93daxWCj7Jd
         kYYBpe0sFgz0KvgXP2P/6hbWC3jy76FlX3Ud8hyFse22NBcS8MZcuseYahA6fLPGdOvu
         QWifDAUwguRmua+PY5apwxxUNAFyf0zkxoY68vPXoLZJF3F1YpjO40O8gY/caos6CS4F
         jn7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=WQ1UGW4MNK+tn6qO0dAsnzsuotHPBwupoEi/hzE/F7c=;
        b=R4vb1pGh8JFOhmqmnVd/UZ8IKFqciYSFKV6hgZ/f73Mq0NMcmjXfXDotPtJ2H/6K7S
         JgWEO64nvRkkLx2KxGr4V0rJcfsZBId8C/7ULd374ymiBnynEonPr8vZ00zk44Dp+2dE
         f8kKRLWWLdJ/r6oYvh6CgnmnF0SIZiWoYKdC6m3P/+hczcPFQM39dc/h6vQ9JqsRs+t7
         WbXnZtYXo6j9fCqLOsmpstBCsG9eMh/8qK67A9oxGH5OPdXn9YyN4UaN1n2NJHFvyliA
         07m5108NU7uSfjpVsMGVPkSJ8cZr1sA8kztAQi2Z3N2CN2MmtFFLmbrGO0rjgiFTqpgq
         qaPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jeYqsBLP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WQ1UGW4MNK+tn6qO0dAsnzsuotHPBwupoEi/hzE/F7c=;
        b=ZAVqxPcVJhTCIXblCwPu5Nnuk8/2SE3+kv5effp/q+RkQjMPN6JLVTQhl9rarZiJfD
         +waCTBZxZCoAeBpiV5fEgft2wRu0Bh5yN1WxkrDodKOXHluaridw1qyzBe8Nna0HFDcK
         pMptMmEFGh4BbVEgStfs8ZU8BgcWfa9rcPKhq4hH8rhI9yMupzKxjoGb/4bh5YGLGbVV
         FSXzhAm6v/n0SuNqvGmSqbEIG6hCvXH1rGajtF6jvq3oxizvTFvlQIGOSE+gy2sOhs5+
         mYgn7Kte9SctnrT2ZiovZAzx1egP+HN7PMXGb9zLUa87NWGiDhF3P7kN/W1/wK8kBU1m
         ldAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=WQ1UGW4MNK+tn6qO0dAsnzsuotHPBwupoEi/hzE/F7c=;
        b=ULNEm1yODFfaI6SxbcnGtwuWeRzaNTVO/JPPMo2DQMMeLu4kNPNq9Zo1iRTKptLeoe
         xMi9LYgvdNVJ7tOw8a+2N2XnjR58XZAsrliYAvn8nsXm9ZbA9KmsojZ49S3MO774yqiM
         E7QyHry/dYGNOH1dDixJfNNDcK0t4rlNljmcTrhmZvFzfV3W/FGrgWV+f9YysxQWj43f
         aEz+G5z4b+8h1q30T6MXxk6RJNmWVg6jakTVKMLPFgihBocvZiHgXZz/a28gTJdR0EVw
         rsSjiG9IJa9E28zigbG5cs3R7CD1cJO7wF6DFCm0vpBMpr3r3r1WdWZqfJ5ETxWuoEgx
         b9zg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530BwXnDEcR+K4WATmvD86EStYXzghdLQ8j8kp32Nb8Csg+tWTLt
	WU1wb9sgb69DpBqCboEJxEI=
X-Google-Smtp-Source: ABdhPJwRI6Tw40zmA3PO7Mjsw6Hb0FpI/MOMgnluB2ESLvjDv3NVbl2V5mde+2nUlT1LVYh7SC5MXA==
X-Received: by 2002:a4a:a404:: with SMTP id v4mr18817626ool.2.1593881179717;
        Sat, 04 Jul 2020 09:46:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a4a:55cb:: with SMTP id e194ls664683oob.6.gmail; Sat, 04 Jul
 2020 09:46:18 -0700 (PDT)
X-Received: by 2002:a4a:a603:: with SMTP id e3mr19682301oom.61.1593881178851;
        Sat, 04 Jul 2020 09:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593881178; cv=none;
        d=google.com; s=arc-20160816;
        b=dO4VCLsd+zkc6CBurWTAYSGnAKPzXeTHLHZRZAmF8Oewzq4Qr97A4yhfhHnGfm/WYk
         HTlWwAZhiCaEGPsgd7/v05SslVij+vE6rgfM4gguuFBpjaCGGa290nX6jdOE7DTnMVvc
         g3S7Q+mrT3qIEMjajGFhfWDpanvMvyfvOLNPX+X64E71hxgfRWEhfG7RGpcwZl0FtPnb
         GwNgjJDpXzLu64rXjDmXanGEav353Lc1QLaJjdr8+DR7HsEDiDmCNfrmbrMq6JBA+Xsm
         s5okwp2NDORXuwIIA2up3vTZ48dIEj8xH75OGoXUxX1hSes//LQsxywN0MjLp65ZqVc0
         CLsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=xY9bfzxbk+L/7yqFaZKug3KTAWU8qkTKD12QDWaC3Bg=;
        b=Gr72lRbi8doeYJXow1Buq0JJLgrhCXNnlmMq3XSo7Eocm9aQl8gJHLZQ9Ou6G+AURw
         kFpOzC2w99kuDoQ5eBgvHkLtEORNVumU2A0CuL7s05FnewMPR47tRJDzqxY2cmlBIW1+
         mDTPgXyHo7H4hcX8qQG32/mNdTGkkP6XOiOGA7NYpEliWU7AcmbOWQaDpwrESNNM3yND
         9+RhxSxjYNGJINWS7MC0/bombzsYfl2gvcPXAqeMjk227I3Rge9A5S1nDpAHS6i90Z1L
         3EQbVIaQvIe36ghZmBAvWX6fCNznZ266eooOWZzPIxznZYQKuRXA+vmnhXqRi6T/japD
         bQOw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jeYqsBLP;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id y66si885599oiy.5.2020.07.04.09.46.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 04 Jul 2020 09:46:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Received: from github-lowworker-ca5950c.va3-iad.github.net (github-lowworker-ca5950c.va3-iad.github.net [10.48.17.57])
	by smtp.github.com (Postfix) with ESMTP id 06979121096
	for <jailhouse-dev@googlegroups.com>; Sat,  4 Jul 2020 09:46:18 -0700 (PDT)
Date: Sat, 04 Jul 2020 09:46:17 -0700
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/ca7123-8787b5@github.com>
Subject: [siemens/jailhouse] 564f35: x86: Add proper fence before sending IPIs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jeYqsBLP;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.199 as
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 564f354155a3a21e95041c1b8fb79605356abf65
      https://github.com/siemens/jailhouse/commit/564f354155a3a21e95041c1b8fb79605356abf65
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/control.c

  Log Message:
  -----------
  x86: Add proper fence before sending IPIs

Since 2017, the Intel manual suggests to use mfence plus lfence as
barrier to make data changes visible triggering an interrupt via the
x2APIC interface. Jailhouse was so far not using any barrier
consistently in those cases, neither for internal NMI IPIs, nor for
those triggered via the ivshmem doorbell interface.

This adds the recommended mfence;lfence sequence to all IPIs triggered
via apic_send_irq or apic_send_ipi, at the risk of having more than
needed, e.g. when issuing an IPI on behalf of a guest that already used
a barrier itself. Compared to the risk of missing a cases and given the
overhead that the intercepted IPI submission comes with anyway, this is
the preferable option.

Note that this also ensures proper serialization of data writes and
kicks for the ivshmem doorbell interface on x86. Such a property is
going to be demanded by the ivshmem specification.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cb8d79bbc2caee07fbc2d9ed86af15e040a70c35
      https://github.com/siemens/jailhouse/commit/cb8d79bbc2caee07fbc2d9ed86af15e040a70c35
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c

  Log Message:
  -----------
  arm-common: Add memory barrier before ivshmem interrupt submission

This ensures that a guest will not see its data lagging behind the
signal when triggering the ivshmem doorbell. We are going to demand this
property from the ivshmem interface.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f91c57158100fa0b4586a3271dc2c27570d56be7
      https://github.com/siemens/jailhouse/commit/f91c57158100fa0b4586a3271dc2c27570d56be7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/control.h
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/arch/x86/include/asm/control.h
    M hypervisor/include/jailhouse/control.h

  Log Message:
  -----------
  arm-common: Get rid of arm_cpu_kick

Implement arch_send_event directly and switch psci to this. Makes things
more straightforward - and provides the chance to properly document
arch_send_event.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 19cf7a61caaa793bb533d38b531519e703cccf49
      https://github.com/siemens/jailhouse/commit/19cf7a61caaa793bb533d38b531519e703cccf49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/psci.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/control.h

  Log Message:
  -----------
  core, arm-common: Clarify role of spin_unlock before event submission

On ARM, the spin_unlock is sufficient to provide a memory barrier before
calling arch_send_event. On other archs, the implementation of
arch_send_event has to take care of this. Clarify this at the respective
call sites and the function documentation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d2becb4a22a7dc85cb237014796862a50f4cfc6d
      https://github.com/siemens/jailhouse/commit/d2becb4a22a7dc85cb237014796862a50f4cfc6d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm-common/ivshmem.c

  Log Message:
  -----------
  arm-common: Factor out irqchip_trigger_external_irq

This replaces the non-intuitive special case of
irqchip_set_pending(NULL, ...) with an explicit one.
The only case where irqchip_set_pending() was called like this was
arch_ivshmem_trigger_interrupt(). All others already passed in a
cpu_public pointer guaranteed to be non-NULL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 368ff6b2acb3f24ec5903db328d73f2c9d986601
      https://github.com/siemens/jailhouse/commit/368ff6b2acb3f24ec5903db328d73f2c9d986601
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-06 (Fri, 06 Mar 2020)

  Changed paths:
    M Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: ivshmem: Require that doorbell writes act as memory barriers

This avoids that the guest has to be aware of how the doorbell interrupt
is internally sent to the target CPU because to add the corresponding
memory barrier explicitly. The implementation in Jailhouse already
fulfills this new requirement.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 421fcb1f99cd1fa59a4494368550b2288cbfcd25
      https://github.com/siemens/jailhouse/commit/421fcb1f99cd1fa59a4494368550b2288cbfcd25
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-03-08 (Sun, 08 Mar 2020)

  Changed paths:
    M configs/arm64/espressobin.c

  Log Message:
  -----------
  configs: arm64: espressobin: tune comment

This is probably a c&p artefact from macchiatobin.c: Memory on the espressobin,
1G variant, ranges from 0x0 - 0x40000000, and reservation can be done via
cmdline. Adjust the comment.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 37101f166e71d712644b107c77a0a694f0959f96
      https://github.com/siemens/jailhouse/commit/37101f166e71d712644b107c77a0a694f0959f96
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Clear state table on first peer setup

So far we only reset the state of the added device of a link, not that
of to-be added ones. This could expose random state value of upcoming
peers until their cells were actually created.

Fix this by clearing the complete state table when the first peer is
initialized.

Reported-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f76b0e89ed89a64c2d22bde114e20abd0e18ce38
      https://github.com/siemens/jailhouse/commit/f76b0e89ed89a64c2d22bde114e20abd0e18ce38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Clean up variable initialization

We can use the local id variable also here.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1f16ea47d9d99f7f6fde1aad65c8ab7ed77d54ca
      https://github.com/siemens/jailhouse/commit/1f16ea47d9d99f7f6fde1aad65c8ab7ed77d54ca
  Author: Philipp Rosenberger <p.rosenberger@linutronix.de>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M Documentation/inter-cell-communication.md

  Log Message:
  -----------
  Documentation: use virtio-ivshmem-block for block backend

The example for the virtio-ivshmem-block shows virtio-ivshmem-console
not virtio-ivshmem-block as backend.

Signed-off-by: Philipp Rosenberger <p.rosenberger@linutronix.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2e4d71f66439f8f6223b129b1b8f19062a851342
      https://github.com/siemens/jailhouse/commit/2e4d71f66439f8f6223b129b1b8f19062a851342
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-10 (Tue, 10 Mar 2020)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Fix programming of to-be-masked pin

The unconditional writing of both redirection table words created an
invalid intermediate state when masking a previously unmasked pin: As
the entry was to be masked, the index in result was set to 0xffff. This
value was then programmed into the upper word while the pin was still
unmasked.

QEMU detected this invalid redirection table entry but only a message
was logged on the host terminal because QEMU does not emulate error
reporting for VT-d. If an interrupt had come in on real hardware right
at this point, we would have seen a VT-d fault. Still, no kitten would
have been harmed.

Fix this by only writing the upper half when we are unmasking the pin
(or keeping it unmasked). And the goal of bac03e4d5f54 is still achieved
this way.

Fixes: bac03e4d5f54 ("x86: ioapic: Rework and fix redir entry programming")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 01934ec692271c35527819f081de4a33005ece42
      https://github.com/siemens/jailhouse/commit/01934ec692271c35527819f081de4a33005ece42
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-08 (Wed, 08 Apr 2020)

  Changed paths:
    M configs/arm64/imx8mq-inmate-demo.c
    A configs/arm64/imx8mq-linux-demo.c
    M configs/arm64/imx8mq.c

  Log Message:
  -----------
  Cell configs for imx8mq EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
[Jan: updated copyright dates]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7fe071b70665dff0cdeaccdefb8a3e4d926e0f12
      https://github.com/siemens/jailhouse/commit/7fe071b70665dff0cdeaccdefb8a3e4d926e0f12
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-08 (Wed, 08 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mm-inmate-demo.c
    A configs/arm64/imx8mm-linux-demo.c
    A configs/arm64/imx8mm.c

  Log Message:
  -----------
  Cell configs for imx8mm EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
      https://github.com/siemens/jailhouse/commit/cfe4d650a8560a588a2bbe29ee979f5e7e9a3c9e
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mn-inmate-demo.c
    A configs/arm64/imx8mn-linux-demo.c
    A configs/arm64/imx8mn.c

  Log Message:
  -----------
  Cell configs for imx8mn EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
      https://github.com/siemens/jailhouse/commit/ccc44a81d8d8a3b56e9e22d5916cc80ca4700a28
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-10 (Fri, 10 Apr 2020)

  Changed paths:
    A configs/arm64/imx8mp-inmate-demo.c
    A configs/arm64/imx8mp-linux-demo.c
    A configs/arm64/imx8mp.c

  Log Message:
  -----------
  Cell configs for imx8mp EVK board.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
      https://github.com/siemens/jailhouse/commit/1aa19ea3076e2b4df1d39b1b9c2f0ea490f81c42
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M hypervisor/arch/x86/vcpu.c

  Log Message:
  -----------
  x86: Reformat for_each_pio_region

No functional change, just the for-statement more compact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 72ca0d21973add5f3192922b034f1aaaf2746cf2
      https://github.com/siemens/jailhouse/commit/72ca0d21973add5f3192922b034f1aaaf2746cf2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-04-12 (Sun, 12 Apr 2020)

  Changed paths:
    M inmates/demos/x86/apic-demo.c

  Log Message:
  -----------
  inmates: x86: Add LED blinking support to apic-demo

This is analogous to gic-demo on the ARM side: Grab led-reg and led-pin
from the command line and toggle the specified bit in that memory-mapped
register at the pace of the print-outs to make an LED behind it blink.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
      https://github.com/siemens/jailhouse/commit/80e81e7edcfa1648a7488ca2405ee9f1d2c1523f
  Author: Alice Guo <alice.guo@nxp.com>
  Date:   2020-04-21 (Tue, 21 Apr 2020)

  Changed paths:
    A configs/arm64/dts/inmate-imx8mm-evk.dts
    A configs/arm64/dts/inmate-imx8mn-ddr4-evk.dts
    A configs/arm64/dts/inmate-imx8mp-evk.dts
    A configs/arm64/dts/inmate-imx8mq-evk.dts

  Log Message:
  -----------
  configs: arm64: Add inmate device trees for all the i.MX8M family

These device trees are used to boot Linux kernel in the inmate cell.

Signed-off-by: Alice Guo <alice.guo@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 15169df2990fcd836f6488eae58b290a709b1d4f
      https://github.com/siemens/jailhouse/commit/15169df2990fcd836f6488eae58b290a709b1d4f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-05-30 (Sat, 30 May 2020)

  Changed paths:
    M driver/cell.c
    M driver/main.c

  Log Message:
  -----------
  driver: Account for changes in kernel 5.7

The cpu hotplug interface got reworked. Furthermore, our trick to avoid
kernel patching for EXPORT_SYMBOL purposes only is passing away with
kallsyms_lookup_name no longer being exported. Keep the infrastructure
for now for the sake of older kernels. We will remove it eventually.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b9df7b984d88f627c1973e8aaa4ef21d62117ab9
      https://github.com/siemens/jailhouse/commit/b9df7b984d88f627c1973e8aaa4ef21d62117ab9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm.c
    M configs/x86/f2a88xm-hd3.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/arm64/iommu.c
    M hypervisor/arch/arm64/smmu-v3.c
    M hypervisor/arch/arm64/ti-pvu.c
    M hypervisor/arch/x86/amd_iommu.c
    M hypervisor/arch/x86/iommu.c
    M hypervisor/arch/x86/vtd.c
    M include/jailhouse/cell-config.h
    M tools/jailhouse-cell-linux
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  configs, core, tools: Pull iommu_units out of arch-specific platform info

This is now used by x86 and ARM, so there is no need to keep the same
field in each arch-specific section of the platform_info structure.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3bbe8ec295e8fa7183c971345c499080042d4266
      https://github.com/siemens/jailhouse/commit/3bbe8ec295e8fa7183c971345c499080042d4266
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  cell-config: Rearrange paddings

Use the chance of a config revision bump to update / add padding bytes
so that 32-bit words are 32-bit aligned again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e3747ae41359a3b0ef1c0eec9c75895e30c2d555
      https://github.com/siemens/jailhouse/commit/e3747ae41359a3b0ef1c0eec9c75895e30c2d555
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-hardware-check: Clean up dead code

This became unused with 064cfe3834cb.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6fbce3c73e1a2d6df85e1496931bb7cbf6155574
      https://github.com/siemens/jailhouse/commit/6fbce3c73e1a2d6df85e1496931bb7cbf6155574
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h
    A pyjailhouse/config_parser.py
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  pyjailhouse: Factor out cell config parser

Move the cell configuration parsing classes from jailhouse-cell-linux
into a pyjailhouse module. This will allow reusing the code for the
upcoming config checker.

CellConfig must not terminate the caller anymore but rather raise a
RuntimeError if parsing fails. This can be handled properly by the
caller.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: decc4b2ff6fbcb6b2aff579e5cf0b36454132298
      https://github.com/siemens/jailhouse/commit/decc4b2ff6fbcb6b2aff579e5cf0b36454132298
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-01 (Mon, 01 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Translate struct.error into RuntimeError

The enables error reporting at an appropriate abstraction level.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 68401c86c58700c207069a9c423c2a0ed5bb7126
      https://github.com/siemens/jailhouse/commit/68401c86c58700c207069a9c423c2a0ed5bb7126
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add SystemConfig

Add parsing of system configurations. This is so far only processing
essential fields needed to validate the structure, extract the
hypervisor memory and access the root cell data.

The root cell is parsed via CellConfig. As the embedded cell contains no
signature and revision, CellConfig needs to be made aware of this mode.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7b384de640f64a259086b900d4693b63558cde75
      https://github.com/siemens/jailhouse/commit/7b384de640f64a259086b900d4693b63558cde75
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Convert memory region flags into ExtendedEnum

This will allow printing them by name. JAILHOUSE_MEM also inherited from
int so that arithmetic operations continue to work. Ordering matters so
that string conversion is provided by ExtendedEnum, and we will only
fall back to int for integer representation.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 76b4537408f5864961d422e02fd0c52f94d3be91
      https://github.com/siemens/jailhouse/commit/76b4537408f5864961d422e02fd0c52f94d3be91
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add pretty-printing of MemRegion

Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 818fd975706850a640ef20bee12a5d386ec63c29
      https://github.com/siemens/jailhouse/commit/818fd975706850a640ef20bee12a5d386ec63c29
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Add MemRegion overlap helpers

Add helpers that check if two regions overlap in the physical or virtual
address space. Will be used by config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
      https://github.com/siemens/jailhouse/commit/79df6c32d6fbdc649b3a781128ebcbd3ff6b3d79
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/Makefile
    M tools/jailhouse-completion.bash
    A tools/jailhouse-config-check
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Add jailhouse configuration checker

This lays the ground for offline configuration checking. The checker is
mounted as "jailhouse config check", accepting the binary root cell and,
optionally, any number of non-root cells.

So far, only one check is implemented: Finding overlaps of memory
regions within a cell. But already this reveal a number of pending
issues in our in-tree configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4f16acaa71dcee9087610921e7dab69fc9dc7ef6
      https://github.com/siemens/jailhouse/commit/4f16acaa71dcee9087610921e7dab69fc9dc7ef6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-check

  Log Message:
  -----------
  tools: jailhouse-config-check: Add overlap check for hypervisor memory

This checks if any region in configuration set physically overlaps with
the memory reserved for the hypervisor.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
      https://github.com/siemens/jailhouse/commit/ee7a9ef7b4ec087a36d8b1ca21d8495728bfc6c6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M tools/jailhouse-cell-linux
    M tools/jailhouse.c

  Log Message:
  -----------
  tools: Refactor and align help outputs

Make sure the short option name is printed first. Use a few more telling
metavar names. Finally, align the short help printed by the jailhouse
frontend tool with that of the tool helpers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 95392673a20aed22dd7323b4c098022a729828e3
      https://github.com/siemens/jailhouse/commit/95392673a20aed22dd7323b4c098022a729828e3
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/ultra96-inmate-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c

  Log Message:
  -----------
  configs: arm64: Align ultra96 config with qemu-arm64

This both fixes an overlap of the ivshmem region with root cell RAM
region and adds full ivshmem demo support to the three configs.
Reference was the qemu-arm64 config set.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0a2212a06dff9de94548c99979fe83b5de7cff38
      https://github.com/siemens/jailhouse/commit/0a2212a06dff9de94548c99979fe83b5de7cff38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/hikey.c

  Log Message:
  -----------
  configs: arm64: Fix hikey memory region overlap

Reported by config checker: RAM and ivshmem were overlapping.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
      https://github.com/siemens/jailhouse/commit/0156237196f6ce4f3fe808ffa0f5e1ef86cba2a6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-06-02 (Tue, 02 Jun 2020)

  Changed paths:
    M configs/arm64/imx8mn-linux-demo.c

  Log Message:
  -----------
  configs: arm64: Shrink imx8mn memory regions to required size

The last one was unused.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
      https://github.com/siemens/jailhouse/commit/4ce7658dddfd5a1682a379d5ac46657e93fe1ff0
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-06-03 (Wed, 03 Jun 2020)

  Changed paths:
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm: irqchip: fix irq_bitmap setting

There is a implication that the pin_base in the cell file
should be "32 + 128 * i" with "i >= 0". However there is no checking
for that. Pepole might choose other pin_base, such as 160, 224 and etc.

Saying the 1st irqchip pin_base is 224, the 2nd irqchip pin_base is
160. When irqchip_cell_init loop into the 2nd irqchip, it will override
the settings of the 1st irqchip, because "224 - 160" is less that
"sizeof(__u32 pin_bitmap[4])", so to make things simple, we not enforce
the pin_base must be "32 + 128 * i", and make the upper example could
work is to check whether pin_bitmap has a non-zero value.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
[Jan: removed unneeded test]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7487e55930f76b644fa88bd0283538eed4c48e41
      https://github.com/siemens/jailhouse/commit/7487e55930f76b644fa88bd0283538eed4c48e41
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: simplify signature checks

Just a slight simplification, no functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
      https://github.com/siemens/jailhouse/commit/9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: Improve code readability in template preprocessing

Move lines with similar context together and add some comments.
This commit serves also as a preparation for the following commit.

No functional change.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 91fbc4ff25965325d8a75b2b568db5bc1df38f42
      https://github.com/siemens/jailhouse/commit/91fbc4ff25965325d8a75b2b568db5bc1df38f42
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-config-create: move PCI capability collector from sysfs_parser

Fixes generation of unreferenced PCI capabilities inside cell configs
on AMD systems. They occur due to removal of the IOMMU from the PCI
devices list after its capabilities have been collected.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af4b5d431a5147b059c9e1219834931a91319379
      https://github.com/siemens/jailhouse/commit/af4b5d431a5147b059c9e1219834931a91319379
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c

  Log Message:
  -----------
  configs: x86: f2a88xm-hd3: remove unreferenced PCI capabilities

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: de9cbc0864a87d603948d0bd3cfffa47caef4c9f
      https://github.com/siemens/jailhouse/commit/de9cbc0864a87d603948d0bd3cfffa47caef4c9f
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts

  Log Message:
  -----------
  configs: dts: inmate-k3-j721e-evm: Add pinmux for main_uart1

Add a pinmux DT node for main_uart1.
Describe the pinctrl default state for main_uart1 node.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 23e86fd68dc9b79048038f90ee80838896ce0476
      https://github.com/siemens/jailhouse/commit/23e86fd68dc9b79048038f90ee80838896ce0476
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-linux-demo: Add USB mem_regions

Define the jailhouse_memory regions for the USB toplevel MMRs
This fixes the crash when inmate cell tries to
access the USB devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca62febb7da14bca08de48026c9e553697c68a4b
      https://github.com/siemens/jailhouse/commit/ca62febb7da14bca08de48026c9e553697c68a4b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-linux-demo: Remove unsupported device partitioning

In kernel 5.4, support for following is not available:
* D5520 decoder
* GPU virtualization
* DSS display virtualization
Remove these from cell config

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8419b7fb9b35574e68a072cf6844d950747f32ba
      https://github.com/siemens/jailhouse/commit/8419b7fb9b35574e68a072cf6844d950747f32ba
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  include: cell-config: Add new macros for 64K aigned BAR

When working with a kernel using 64k page sizes, the BARs
used for enumerating the IVSHMEM PCIe device should be
aligned with 64k page size.

Add new macros which describe 64k aligned BAR sizes.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 990669e951f91ed08b1d29f5d80b021d3d9c0569
      https://github.com/siemens/jailhouse/commit/990669e951f91ed08b1d29f5d80b021d3d9c0569
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M driver/pci.c

  Log Message:
  -----------
  driver: pci: Use page size to set the aperture size

PCIe host controller is added by jailhouse kernel module via
an overlay. The aperture size is currently set to 2 pages
assuming 4kb page size.

Update to use the PAGE_SIZE macro so as to work with kernels
where page size is configured for 64kb.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9791e638153c36aaab002e51424de6f3123c654a
      https://github.com/siemens/jailhouse/commit/9791e638153c36aaab002e51424de6f3123c654a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts

  Log Message:
  -----------
  configs: dts: inmate-k3-j721e: Increase range for PCIe aperture

Increase the aperture size in the IVSHMEM PCIe virtual
controller to with the 64k sized BARs.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 64eb491715d6fc838cfd97213c53e979af3d2fbb
      https://github.com/siemens/jailhouse/commit/64eb491715d6fc838cfd97213c53e979af3d2fbb
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Add IVSHMEM demo device

Add a new IVSHMEM PCIe virtual device for a 2 peer
IVSHMEM demo communication.
 (0 = root cell, 1 = baremetal / linux-demo)
Also add the corresponding memory regions for state and output
aligned at 64k boundary.

Update the bdf numbers for consistency across all platforms.
Assign domain = 4 since the platform already has 4 physical
controllers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 120cf7cb17a97f8dac3a860bc54173ff15d46471
      https://github.com/siemens/jailhouse/commit/120cf7cb17a97f8dac3a860bc54173ff15d46471
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-inmate-demo: Add ivshmem capability

Add a virtual PCI device with IVSHMEM type (id = 1)
Create IVSHMEM regions for 2 peer communication
Enable the vpci_irq for doorbell interrupt

This allows to run the ivshmem-demo baremetal inmate
inside this cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2b5f3862cd84f2f25346ae6be28eef72b7d88c0
      https://github.com/siemens/jailhouse/commit/a2b5f3862cd84f2f25346ae6be28eef72b7d88c0
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Map memory regions with correct sizes

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfs.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: be209599f8b8ec2fa63b16aabca693cba5975112
      https://github.com/siemens/jailhouse/commit/be209599f8b8ec2fa63b16aabca693cba5975112
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Adjust selection of interrupt target

Number of peers available on a platform is different.
Ideally, any peer should be able to communicate with
any other peer. By default, all demos send interrupt to
the next peer in a ring fashion.

Add support for passing a command line parameter to specify
exact peer to send interrupt to. Furthermore, avoid using a
hard-coded max-peers value for the default target selection.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix register access, print max-peers, massage commit log]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e7bb27a71d1ec6d2f68e29d354bb70acccd5c8bb
      https://github.com/siemens/jailhouse/commit/e7bb27a71d1ec6d2f68e29d354bb70acccd5c8bb
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M inmates/demos/ivshmem-demo.c

  Log Message:
  -----------
  inmates: ivshmem-demo: Parse target from cmdline

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix ARM targets by avoiding division]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8787b55d3694134077c7ab924c270de5d6fd60f2
      https://github.com/siemens/jailhouse/commit/8787b55d3694134077c7ab924c270de5d6fd60f2
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Fix memory overlaps

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/ca7123a5c58d...8787b55d3694

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/ca7123-8787b5%40github.com.
