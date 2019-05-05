Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBWG3XLTAKGQEXJ526VY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3203313EAB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 11:33:13 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id g15sf1716431ljk.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 02:33:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557048792; cv=pass;
        d=google.com; s=arc-20160816;
        b=FISMwLn4iRWXHR8YFzKhOY1uN9GZaALSo4/oyzRr0MVvWMIJ2wDPjlRQQ3iTbs9P89
         6yhPBvGHcLajZRKdyXtzEs6RqfRDwQ8Z22lXlVx++b11wU2zwwpfiszrfWRtOCukqMhT
         AEymujtycbphd66l6g7R2y1AnkmcKRSkFkl79GGjUx/UmPn+JDNexsCmHgatUjpked7y
         T/H5NfFTWTL+ws6bbXPx5yiAadL+/tiRodWM7Y4zDB7VtrLYumcQNU2/3iJNCvn8z/BX
         X/w5JhnR9xoPvR0EzGo2IU832QugtkIa7gtXEdkc/t50+eY3fAGCn0ZY54hO5l9whad7
         75mg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=B7aqcvcG72LZ2ZNNntHwfFXi5eXyXKuQq/pEsn/jVWo=;
        b=J39cV4dffCgv9m1Kq5ys8nMKnFIrIzDbQbDxgMqx/N6PgLdTDjiWa3HaLeX7Y3tUv0
         58ELEvspQqxogkLEoO8RxSALk2Teiy+GPVjdZKEJcUvQlmTjDU3IJO6i5RD8/V5rwFrP
         RArlteyCepLn8aNMNdcfiF+4KEPdhMxkMh32ks54VtbwNiAi2zmksEHmcA/HLjw6DBeV
         eK24jHGvncf0nmGYqcQLk8vrVK6totEy1wrmcgLl4bANYDKPLfMdfBb0lhlNXPdN2Zps
         X3fDrrMz+IyoHkPva4QV2e0T8mC5DqVOC0Bn40C8UDYH+YpQopVNsH/Vy4NAxwYGwlNR
         dl+g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=s20150108 header.b=szqJpVIG;
       spf=pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.202 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=B7aqcvcG72LZ2ZNNntHwfFXi5eXyXKuQq/pEsn/jVWo=;
        b=YOe5MGh7OrFBUV/gt7JI2G2ut6lTSfoZBkG4Ds9TjVQ4eGZ4kpFYovYgcgfrPWh+cK
         z5Z3ZKLyxgRwC711O0Qk7h50DLRnoKtA0TAvtYQtUnTeL1ipHHqwkxE1HpPWbKLA61H5
         ArXh/mCYSLvRMogZO9jknkgsdq30hPmePpNNh2lFH4FDqm8lQq4trw0819Z1p2nxvTVK
         4TFHf6GK59ecuQul+KwRyvYhb5szy8dJy4J7J0NwiPYoI9uejY4kbxwgIn84As1mZlbx
         Ex5FuvcuLt81nS1pxgic+8aCthoV7Afj3Zy5M+A+dCQbjF/jvkx4gO0mxSWalo3ssjxi
         39xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=B7aqcvcG72LZ2ZNNntHwfFXi5eXyXKuQq/pEsn/jVWo=;
        b=PoxlR/vnel62wcj18ngmfXD2daVeyId9lR4llkkrMj4BoKEjH6pOIOUfhPWp6GE7ZX
         ADIxwcy83tMp8krVP+wmbYUpQdFwEQTgRo1A+yUdxu0h0wWaiSyjtirgOnBuCbeTus8x
         RIED3SHt2E7wMwGqKI3aA4I8xxaql9aALb1Akaim1b8MY5sBZvtMxLxyNEhz+CVXTAaY
         2UreLEkpla2Zu4cxg4NNrJZipMhVTK7ZVyst8Tq7rfOfsxRvrqFErDc/NrJ1zoVkp29R
         HQo4FCUPF55Jy12bVQsgyLlO773S6VuDmIlLMLc2TX/nB6vgDEGn6HJZbQO1kc926aSU
         5x9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWIBGqnUQgOn/LUTWRgSiaJsa6/sULK27HsfHlT0o8FAEITgBQA
	fJVzCrwHJVmDBPbHUfgHjs4=
X-Google-Smtp-Source: APXvYqwAGekoPaSVO/W/xXFJtfRGMpmGEYFUKCEac7gMauaRLMembZHVWQMGBCNm1EnPRiY7wrW1LQ==
X-Received: by 2002:a2e:7001:: with SMTP id l1mr2325963ljc.101.1557048792786;
        Sun, 05 May 2019 02:33:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5a04:: with SMTP id q4ls829051lfn.8.gmail; Sun, 05 May
 2019 02:33:12 -0700 (PDT)
X-Received: by 2002:ac2:550f:: with SMTP id j15mr2996000lfk.73.1557048792099;
        Sun, 05 May 2019 02:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557048792; cv=none;
        d=google.com; s=arc-20160816;
        b=doqDkw2TNgZA+Mx5evtqQRuvx10u8hp7VHwyw43L0YjbIKVZhwe03P0lDp/wKDOIFR
         I8EHlqICzYcm51EbgnPjsd7n1iQiJ0f3UVxTAVZ5mRJaJ9d6HNCNJQN57o5ePZDGOnWa
         xTD52sPxdpf7EYWOXXyILzo83apO8juU+KxDi++10PDlSvFLT7USDZNwx3NGdSd42bbe
         3/lUWaLMpBnioJBhwuJBo41Kz0R6IOZY4JGJ3Ki6I8XcR1bNHeYGBm7QXmdD8jiKd8ej
         /mhBIeVywH/wkYD9ZrywhPRZDxtElIhLr/yK2q1XbDTEoBzS3YPOXn7soTuFwRODfdfs
         Q7Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=vWO8XZIrDOtW0U0bVIc1gAkOqGxCCJqW1qhb75GYC10=;
        b=UkmYiHjG1uYfcXglYfKtUnZCNoKRkqvLHn8BnfdGPR/kUy2Z1rEibnoc27CdcEoYkt
         EhLW6s0oUmnVLKtyiFAF/v7hfNiDYqyAKDbGxj0STj2B/Vb1FRY95S3ZVBAbgcnxArty
         LZVV58Mh5rr6Az1pQPw7I5tbNYVzCiwFfTVv5hyYQSCwACW2buogKLb584vikSHoGCAL
         Ok4AtRTr+OirAy1ZxbLQypBMx09vOp5wS/egHhPius0ywj6MruRvZRZVLHJw6HY/2h21
         QGMxEo60NdbS5Ge+16b0yJlUMi/d71rqZkq4aWuVfs6sky+68jbBRECVd82pI+HcjQAf
         Juig==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@github.com header.s=s20150108 header.b=szqJpVIG;
       spf=pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.202 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from o11.sgmail.github.com (o11.sgmail.github.com. [167.89.101.202])
        by gmr-mx.google.com with ESMTPS id b2si228503lfj.2.2019.05.05.02.33.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 02:33:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com designates 167.89.101.202 as permitted sender) client-ip=167.89.101.202;
Received: by filter0116p1iad2.sendgrid.net with SMTP id filter0116p1iad2-30807-5CCEADD6-11
        2019-05-05 09:33:10.40708967 +0000 UTC m=+819972.494803611
Received: from github-lowworker-0c86143.cp1-iad.github.net (unknown [140.82.115.66])
	by ismtpd0050p1mdw1.sendgrid.net (SG) with ESMTP id oy5dXQboQ3WM-2uQPMZmIw
	for <jailhouse-dev@googlegroups.com>; Sun, 05 May 2019 09:33:10.259 +0000 (UTC)
Received: from github.com (localhost [127.0.0.1])
	by github-lowworker-0c86143.cp1-iad.github.net (Postfix) with ESMTP id 1D0A1240799
	for <jailhouse-dev@googlegroups.com>; Sun,  5 May 2019 02:33:10 -0700 (PDT)
Date: Sun, 05 May 2019 09:33:10 +0000 (UTC)
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/29796b-b94228@github.com>
Subject: [siemens/jailhouse] 49de7b: pci: Refactor loops in
 pci_prepare_handover and pc...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-SG-EID: pPXi/rPJQPi62kCfLxCWuZgGuBKOrlmtAko8KHFyNL4g3DSINqZUCeFiwr+z338mZj1SKlrCQ6j0Le
 6l7bPNke7DTqBZKc/5mwsBvBFBOD0Cz2RKgXDF8Quh1j99MpL6jbp1GJFxFQ1uY4an4d15Ck+kxKOC
 RaBfpAhuKsF1uW87473EZXdAHwQ2dh4VFKNFuue0sPTbgMVhAVPdp40NE4Kb7nk2zjDP8X8XFusRyp
 k=
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@github.com header.s=s20150108 header.b=szqJpVIG;       spf=pass
 (google.com: domain of bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com
 designates 167.89.101.202 as permitted sender) smtp.mailfrom="bounces+848413-32fa-jailhouse-dev=googlegroups.com@sgmail.github.com";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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
  Commit: 49de7b7e47e6a997941c1f45453c249c31537a49
      https://github.com/siemens/jailhouse/commit/49de7b7e47e6a997941c1f45453c249c31537a49
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Refactor loops in pci_prepare_handover and pci_config_commit

No functional change, just reduction of indention which will also be
beneficial for upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a20e9b56245d64efd9d31ab442132bc9945517e7
      https://github.com/siemens/jailhouse/commit/a20e9b56245d64efd9d31ab442132bc9945517e7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Only call pci_suppress_msix() for root cell

It is harmless to call pci_suppress_msix(..., false) it also for
non-root cells because it just writes back the config space register
content. But it is unneeded and, thus, potentially confusing.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 699f4de9a0dd844d981a0ff869b3d725511eb54c
      https://github.com/siemens/jailhouse/commit/699f4de9a0dd844d981a0ff869b3d725511eb54c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/pci.c

  Log Message:
  -----------
  pci: Call arch_pci_suppress_msi also on re-enabling

This will allow to move the injection to the end of the suppression
phase.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 97c68dff145689d0a14b61e8ae4132bd0696917c
      https://github.com/siemens/jailhouse/commit/97c68dff145689d0a14b61e8ae4132bd0696917c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h

  Log Message:
  -----------
  pci: Move MSI vector injection to the end of suppression

This fixes a long-pending issue that actually prevented the injection
when interrupt remapping was in use in the root cell on x86: We are
unable to translate the remapping entry into a physical message before
the 2nd level page table for the root is fully populated. This happens
in init_late, thus after the suppression request. The result is that we
only read invalid messages from the redirection table and did nothing.

By moving the injection to the config-commit phase, we have that full
access to the guest memory and can build the correct message.

Fixes: b50614282cff ("core: Virtualize legacy MSI for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cbbb49ef51e6621ecb85fd0af1655ad584e30021
      https://github.com/siemens/jailhouse/commit/cbbb49ef51e6621ecb85fd0af1655ad584e30021
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Move edge interrupt injection at the end of suppression

Analogously to MSI: When interrupt remapping is enabled in Linux, we
cannot evaluate the remapping table before the config-commit phase, thus
will never inject a message when trying that earlier.

Fixes: f651754c72e3 ("x86: Virtualize IOAPIC redir table for interrupt remapping support")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d235bde2a4738b4cddb1df926a39b8a1e11c0acc
      https://github.com/siemens/jailhouse/commit/d235bde2a4738b4cddb1df926a39b8a1e11c0acc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-28 (Sun, 28 Apr 2019)

  Changed paths:
    M hypervisor/arch/x86/ioapic.c

  Log Message:
  -----------
  x86: ioapic: Simplify ioapic_mask_cell_pins

After ioapic_get_or_add_phys is called, the shadow_redir_table is
populated with the guest register content. As ioapic_mask_cell_pins is
only called after that function, we can read the mask state from the
shadow table and safe a register access.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b94228ca3ac8b41f4389221f1c31dc4d6092c83f
      https://github.com/siemens/jailhouse/commit/b94228ca3ac8b41f4389221f1c31dc4d6092c83f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-05 (Sun, 05 May 2019)

  Changed paths:
    M inmates/tests/x86/mmio-access.c

  Log Message:
  -----------
  inmates: Fix RIP-relative test mmio-access

Avoid using the cmdline as basis which can move around - as in
91332fa77903. Also makes the thing more readable.

Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/29796b562f14...b94228ca3ac8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
