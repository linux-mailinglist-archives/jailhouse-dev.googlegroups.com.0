Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBTWCW72AKGQE3YUJ7YY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x439.google.com (mail-pf1-x439.google.com [IPv6:2607:f8b0:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 687951A2420
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Apr 2020 16:36:00 +0200 (CEST)
Received: by mail-pf1-x439.google.com with SMTP id o5sf5512867pfp.0
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Apr 2020 07:36:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586356559; cv=pass;
        d=google.com; s=arc-20160816;
        b=Yb+LtCO1EmM5yQjGa6aq4XvG67g19nKQxlZfieUztoUvm94nC6hmwelJFs2QT3bHv9
         oJERXrroqQ1UYRZ8Mm9Qqt5j5Z8tG3j18IDiNOTV1KAFQviM8f7E0R/PXlgopa3ZiKRJ
         IhAMbcEd8tezYAY/5kXWExn2a+BQnk0dLZ94r5vS+s+7fpqrGRgWcRi4QatYSmdDCKia
         w2dsaWszFv8JEPPF/4z7Leqy0AzkbtlsnewMRB2L0hsvCqI8jO30Xw/+/8BApqfldr3w
         6dTo55Uld4DdtDnLXX8eHZj9rYg4BY/a6VzNJms9GgneAEZ8ATbRYXgxyn5hfCJeu4er
         Yk/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=SOciPqvOhOttc2SZKv9W5lJCfjBRrViFl7zxrIDXp0U=;
        b=gfiwiMMf2r0L33iqSiaXW43/M8FhhNvJYSVxdNJZmB4tKvPZf5yVJQSZQge2+hFgi2
         Ovzx4yNmNFUpEZDVtReGETklKlQyx3PQjQ80xMdNZ3Igrs145YDJw4J4Gl41Q6XDTOLY
         koFRNLvR3R5Mow2dTV4NEre7TNNDrvL82OcgCGqu9u/liPt78jqPEgQRXZKhPbmenms1
         RRrsEoIDu8DIypr7QktCJ+L3qV+YPVUExiqlxZSm9R5oyCVd9vHHlgVtlHWM53n2gX6j
         c1Wv+PdTdQfj7lASAO/zBFrJ9RkmpvrQv2ePl01f3Zu0JMr1JqylusVGv9r7NdJzfu0b
         LIrA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mQXtvuFD;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=SOciPqvOhOttc2SZKv9W5lJCfjBRrViFl7zxrIDXp0U=;
        b=jp2xW2Q1n8Xz39q8WYVL4jyVCPVdOwFP/l2a5uz2mzXAaA9eE5C1s7YtbBNIDCFsT+
         XrEOjdtjG2Egf5VVIzSjrVVvdmNduU4xdX0sqxOCE7h/RV1VBWMbxJyokarP+pswJFDO
         8pqNWgulUAxMOufDCagLYRUpvJqo3tq8M2hfn8MdWItAJGTEabZagZ7pZRZhZ+lUN95G
         ecYoIlmE7cER+ikXJQmuH1pu7RHfb7MtSE2jfWSfV/i/WaG8sgC9C0H+d9jCURz/Ebop
         r4ecaFlA5YZ3KPrGJSSuxMfcjNblxfGjGjKSbglZIR8iutAyRnR9o2d6Zw51TIDSN/6j
         +HQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=SOciPqvOhOttc2SZKv9W5lJCfjBRrViFl7zxrIDXp0U=;
        b=KUKrJvJSh1AAx80cm3cvXsJdKu6SJ5SbkZJ+PvRX9n81cyY51Tw7wAeelx3CC53J78
         fFKYgH0CRtCSHwQbLa7bidtBsEWcnz53+ZA9x1W/XKhd7Bb8gZ1KhdozepZeiH1C9asw
         K+LPbh8xniD92wiaGLvpyOXlVaNy4YuaevKkWnOsMfKrf+s/kDKV+TawJ7C0hOoGtED1
         8H3SGv3t1EuzdZirXeIYtAdX5nkMGL+YXEdIvEmZnMYdvwi923yC4vvH6xt02zj0ScQe
         Gvapxp4hTEUPlioj/N5eFxhtTe/2tZH9M6297fg5kKyPM6A66ECJoBWOIC7Mqh6lI+Qm
         K7+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuaT30ma/3cptSjxIi0wH+IUhQeyJTkwyn0hdtVjyBmVH8W9hTcY
	Eu+6ZKGO08JFw/dQirIQDFY=
X-Google-Smtp-Source: APiQypJ+qcvIRcF1/YYeZAcSOhSbCdnTpEZUkaO08J1bQPQv9WL5A2+91757M86s89OFlwuSGvJ3vg==
X-Received: by 2002:a05:6a00:d2:: with SMTP id e18mr3732259pfj.305.1586356558876;
        Wed, 08 Apr 2020 07:35:58 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:ce48:: with SMTP id y69ls144345pfg.5.gmail; Wed, 08 Apr
 2020 07:35:58 -0700 (PDT)
X-Received: by 2002:a63:a50c:: with SMTP id n12mr5243198pgf.274.1586356557151;
        Wed, 08 Apr 2020 07:35:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586356557; cv=none;
        d=google.com; s=arc-20160816;
        b=ZcsCwfomRgYKIm6SQpzJgN8RSFaOfTiSkZOFpjkip7pB6orHHPC/PVIfiCfqAn+pY4
         vFjNvrLELHBfesy1q6YBMpfCpCBENVU4gEIwowNEZ1UUY4WxZ6Cm/5TwfFEbiqH0BWPz
         XouumzlCun4MrB2ETJDmEyxIO+8UeSA1lqe5zKaF+bkCDbDugt8BDwy8c/PdMGmpfBLW
         6owCkhurokwbElAWYsIx1YnQJUTTnwk3zBVzJvL+jTq5SgLm7W6j68bzAKzHqX6PiSbz
         U30eGlHEMk9R7AOT7tLil6i5eSNSi7tbCROWseXh+B7xkEclmJouOwQlmOJzoVCaa8yR
         ldBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=sA2ZjhFsIAWtVmrYDjErwbt0rXbLIYlphh/Fu9ofsaE=;
        b=SYyejSjHLKCrhI9habCAFfhL4963xxRBf0ZkyCl4+xyp61BjoZNKjSJUsMYjNSS0wr
         TuF3a7RbDCWEt8MHJtGqOiNnJgc1x5QAGpi6+O2Fabl6Aw5QhA8hAmZhtwiebIO0AsLF
         /5Vaw/bMyMfviHg4xqYZqJ050WQWWqtT1eW0yZ4W+UpXEULRumaxaueWnQM6Do/6/QhH
         AuF7fAjZ9NRqVIy+xwATTimRQ/MLTki0dP0SziLyXfydh8seb1Mwgva0RWXtvG1KgKrD
         rWjUPr3/AQOOz6pSFeW4mp71vpuXy66x4vGUttdb1pS1XNmkbW6EPuDKQwj+mca1wz8j
         C9AQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=mQXtvuFD;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id 194si327031pgd.0.2020.04.08.07.35.57
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Apr 2020 07:35:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Date: Wed, 08 Apr 2020 07:35:56 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/ca7123-2e4d71@github.com>
Subject: [siemens/jailhouse] 564f35: x86: Add proper fence before sending IPIs
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=mQXtvuFD;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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


Compare: https://github.com/siemens/jailhouse/compare/ca7123a5c58d...2e4d71f66439

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/ca7123-2e4d71%40github.com.
