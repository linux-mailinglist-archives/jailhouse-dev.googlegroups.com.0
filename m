Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBPODSXTAKGQE64WSI7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd40.google.com (mail-io1-xd40.google.com [IPv6:2607:f8b0:4864:20::d40])
	by mail.lfdr.de (Postfix) with ESMTPS id 58447B5AE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 10:18:07 +0200 (CEST)
Received: by mail-io1-xd40.google.com with SMTP id e126sf6376138ioa.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 28 Apr 2019 01:18:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1556439486; cv=pass;
        d=google.com; s=arc-20160816;
        b=P5GftPMWpFRNqG3mYtnO/efQ17HBlVMikAwxbCvydwSeJP8BhzJ1fq4/l7TEjAa9uN
         MkuwgZk4be/AYLHWuV8Rpw0xmpuJch+hourqPUK3zWJIZt6mqUvIE/3OGhUNGcQDkNe/
         Bf+ga6oYVmuoXQIHmR1Gn0ZA+YmPocq9ttPWF1yk01y+VGsoqvqTR9MSXjo0Vzw56LIs
         MdV9SGoe++JfC5iM1fCB9ViVKVcuKlasIb6ysRW7w3FkJtzf6ik1R7uM1BOXgsO3P2xZ
         ZeJjbE+ljm7BvX8i6oaT/iAS7zwMKLCuTpqDJYNI7MVHN1nPw8JQxaQq7kP2baU1jK0t
         H9Ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=S1AMuofZ8BrkX1VwPsqndU4EOCvpD5hY7iXsMJmJz1s=;
        b=IWgr2f3uRFTumY9U2wRbELY31XYCO1CbUVRAfq+yEqSDYR49GjxDPKtK7+h4uJGrzL
         spusUbkhP+2WGwAOUVV7wYEBqv1Y6NXR3L/2AWAsoWVLequCluTM1jfgZe8+4k1EJ8Ht
         LNH0QWDMeGGWaHfigXyt6ZS+/5lI5opHtMc22o5fD98DX3j/ZORilON1to7tonpYcUpw
         JDUpzBLte1qd3c9RIdjO1bGd+R0ZwxZW1+gJhlCZn9SQOG2bAqG9oB/C200bk5owbOHc
         sCunYL2r5slMr0Ueom5C2qbV/0gZsZedmPvphOApNQWmf4pUTJ4dvs+kNLWOtoHSgdac
         qYuA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hoHpgfQ9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=S1AMuofZ8BrkX1VwPsqndU4EOCvpD5hY7iXsMJmJz1s=;
        b=mBx1FRBfLJRuxDEx8JEtT+B2mQ8SCv7Yup2ZNnev0WYXzIezFC25h7ZONeARFYIpQd
         qA63z3zXL3+oiKkFdsk9Fi6Jn+hRodJaB251ZyzyuJlVNvSs+L/fv3w912qNRY3KVFII
         0q+CE4ya8FVONvBIzYMDN/8V96ieXcH+R/8Y5FscEkBVkZH2zdaLs962qTO3zYtFngsZ
         jCTsPBdoJji6FYYweuXe/bV+731CMnSXR23BIYlVeYoU0ht5c07abyf0RbB1TciQB9O/
         1g1JnqThbynwg62gIkfFOlPMtR272uYuIxAswtg2tCniigGH4XlsOwibPXP9+z71tVPs
         6TtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=S1AMuofZ8BrkX1VwPsqndU4EOCvpD5hY7iXsMJmJz1s=;
        b=E4+kXTx3S8534f2tv67XAnFz2g5kTjiHexNDhhXYRvEbu6m8EXaXo0RK8B5PaFkJo+
         xQMwxC6mnhvnd3hRTcMfDyqhKUNEVxcYGjRl1vbMZmSc5a5HEbeHs9TqZgIFmTOP+3YO
         Kn5YHoS5rp6d6nyyugaAXi9i7jSkUWAoIpk31p8lhCrkT/nCYjXjxKgq3F3LLgeW2R+X
         pD/k5xElaRfb1I0lDgGLV9H2qQ5HhaVR7jtqsz9d8dqK8vodmUZuc7rCoE4q1nwtT4hh
         u/cENdNvFzroq8D9sXbfEmg9Q0qTZ3f8JtMS7vi2Qw8YP72E/jF6egnBqBucHPKr+PkL
         zHmg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXbTIP3LHpxfy8lnaB/bLTg/TDFGs6XiJpVi6j874ptGMVm0MPZ
	8CdmN/YA+stnW8TyGCn8+rg=
X-Google-Smtp-Source: APXvYqxS9TrrEWcTzktrRgKQXT1zy4aNillc8FafFo53xEpCwavH2wuTE4nsslio6pKAsDKEzLGr8g==
X-Received: by 2002:a05:6602:19a:: with SMTP id m26mr7057140ioo.176.1556439486059;
        Sun, 28 Apr 2019 01:18:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:140d:: with SMTP id 13ls2821250iou.3.gmail; Sun, 28 Apr
 2019 01:18:05 -0700 (PDT)
X-Received: by 2002:a6b:8b96:: with SMTP id n144mr2818055iod.156.1556439485398;
        Sun, 28 Apr 2019 01:18:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556439485; cv=none;
        d=google.com; s=arc-20160816;
        b=tUXem2jD4Ga0UOmlyMwwZ4c4PgOf6Zrt3vISep9bdCMkz4SEgvC3YTiXjHOBVbKN6Q
         gehAK185y37zyNSsX5L5bLyKQEnQxflX+c3I1fVGInTJEytD47exHh+aikX8gfWvH9M+
         hNBSntW38yRPgMfX7iMg89Hm+tCv3/xGu4Up/H16pc9AkHhEY+/puLc+GNPlpY8TQEcF
         Z5JHLJQ6rUptJhEZIV/8aEbT7SDa6Fv0ZjGsawu3aDCPA7jrgERuf0043V11mnF44XUi
         7VlPDOEoZ+yUFlcX3uOENrFJ0uVNhUnamBdv7RUfb7E3Ivtmf5/enn6bhuANCOFt73Yn
         ZIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=j0OUE7BbC3mzOIuRTNvBMoxoo4FVXWMnl8wszTQJEao=;
        b=irktCHCsC9yWApL1WPDYxeYUI6JTl0+4SK0YA/CJcl86GTTMg1rqxBQcKyZ5fuclg1
         4+2JamhCyWkCngPCtlSuv32qax2TiqyLIgrb6D4YbPOhXodN6as0OkUH3sHgqaiZdqGl
         pNV62vVpiZz9Fg7syNi/NiRV5BNcRk91cIbrwPuYtR4CC3yYYGfgEPNaRkZpz9oGZRkC
         ZBHuXj6vR11F4cBxWU++PiwqbJKfBoO3nlVBBJwzAOztZAIt49WQ0KCcuE8lsJp4unyB
         wAhaJrhswvIFaN/zGQ6DEbUvdlg9qxrxTQbMtO6evgjGX2uOE/pyLukIzirqyUfyvBt6
         nOnQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=hoHpgfQ9;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-12.smtp.github.com (out-12.smtp.github.com. [192.30.254.195])
        by gmr-mx.google.com with ESMTPS id x26si1530254iog.4.2019.04.28.01.18.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 28 Apr 2019 01:18:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.195 as permitted sender) client-ip=192.30.254.195;
Date: Sun, 28 Apr 2019 01:18:04 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/27ca52-d235bd@github.com>
Subject: [siemens/jailhouse] 29796b: ci: Work around incomplete ca-chain of
 scan.coveri...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=hoHpgfQ9;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.195 as
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
  Commit: 29796b562f14ef96cca0b0e3d495a7100c6cb2fa
      https://github.com/siemens/jailhouse/commit/29796b562f14ef96cca0b0e3d495a7100c6cb2fa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-04-26 (Fri, 26 Apr 2019)

  Changed paths:
    M .travis.yml

  Log Message:
  -----------
  ci: Work around incomplete ca-chain of scan.coverity.com

It's missing the intermediate certificate from "Entrust Certification
Authority - L1K". Download that separately and inject it into the script
download to fix curl failing on that. See also
https://travis-ci.community/t/certificate-issue-during-coverity-build/3153

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


Compare: https://github.com/siemens/jailhouse/compare/27ca523c0747...d235bde2a473

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
