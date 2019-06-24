Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBNWQYHUAKGQEWFHH4BY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x240.google.com (mail-oi1-x240.google.com [IPv6:2607:f8b0:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCB5501E2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 08:05:44 +0200 (CEST)
Received: by mail-oi1-x240.google.com with SMTP id b124sf4901512oii.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 23 Jun 2019 23:05:44 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561356343; cv=pass;
        d=google.com; s=arc-20160816;
        b=Do2UpGzF7YC9/qviTaAjXJWmqudFKnc9RLxZE+zHSUa8MU0TvcVK1jjbEeMuoxPOMg
         l6+zXrA16MhgjZTILV6BelsZWXirChUh94DN4la6LXGVbxcMbSG+2jevQisYEjwM6ojM
         7zf7hjqmOkP65JsYtMiqnGUbw9GvJqxd/dj7YlpHSRZlh2yf25xOyxO00AwqCrmppVGe
         c4jF3z/0FO6jMx3iMn+mas4sXePzvnZI1ug8W/kKFyjVZ7kWHbjCEEiDUTrszhU5Ha2n
         LciKzZR5vWWLZLO5vttezCf0NSel/ifDamEL0GG4nRa71zoECbesNto7W93bTfnM1u0L
         WVZQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=c0p22IJIL8JBJLduPZo14YAgCEJdb+jsQrbXUOGZ2ys=;
        b=iqcXL2ml8Qjec/2MVcMQSBVsNzD11msTqRIYt295x3mogifsn0fOA2sW3jaaClFY9k
         BP3YeGI5U8DkjFp1shVtZlipjVCxCS3LZuqEGy43wkmDu9IUfe6EoB3r+S7BVWFACZcO
         voZM4zay1Bt8pEi5TljSttRVkeUZOa0TZOvjxPpa8/jFCx4KiGPGh5VUi9ONXLkcS+eK
         Rj+bckna0SC3V/8U7mttGgW0v6rF3w+KCKmmQshBM7saCqR8QURli5djv5C6u4ZBA+Dc
         zstQvs8TwjMxSFI9s2bNkL6PaS33Naxu6+HKcQDot0fhsDPiiHgFAQXDPha4BYFOvsKu
         jbOg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VYYGMmp7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=c0p22IJIL8JBJLduPZo14YAgCEJdb+jsQrbXUOGZ2ys=;
        b=ATrocwiJNXsi/ayS33Ir0VGr4caUcTQFuIZZwUFD8rXsRFbOSZ4MFHybRu/Bssrukf
         3plOmUuEy9heI8aWawGABgevvB4heio941vL5bQ2cJ+eE16Lb5xBmdEVLZYcS3EvTe2d
         FGSM8PxsW/HFOwcg/VagNSkTsvWZ1x7OWx8pOrwA++ied9ZMsYIhlz92RlhxITugEk15
         3AmAx6z6qnCcufpkEDiuMxWXPTq1/0eRzdXHsR2RFDIdGsHmJl1dy6sRqlX4A0oqNpEH
         h+M5wNtrPU40fiDqxFgvC5zBP/r3S3uTyKcvdc6qWu3iuo92C3jTK/xFkkIVPLIrzX7g
         FrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=c0p22IJIL8JBJLduPZo14YAgCEJdb+jsQrbXUOGZ2ys=;
        b=ZTSPjQavIzyKeXkFBzN3y2887/yj/LjytlO/VLh2p0JGcVJVDcyYN0/bisB1aZ6YHj
         jM9ffr/3e66ydusYZKgzUUQHx3lrtJwOw95wLeyKXbUEtjTP7AVnq7SRl7460evBOAd9
         r38UrXBMMWC8vGYkouNFmYppIPIlxT3YS999OERgwsVPh9dtVvSr4gRF3nqwY1vawkAL
         vQzwhVIbjHx/mqOG0ER5D8Gg7uToK4k3LQNFKrnVRviWhkHdDP/wDG9oamJcNEvJUMZ9
         kCvtH+xKfVWFBKEWoo4XxcUpk7Zj77OnLSjsSFOTjTxIbXg2B0uE2Tdjp1A2IlFAhmSR
         EUAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXOjDLJviVrd5GMWEBuQCkDIFa5D7J4DPxGjvX4gGdQS/lp/tD/
	08E5SVme880i68ncVar8RnU=
X-Google-Smtp-Source: APXvYqySiXre+uAweZt6HaoFVSN0Z1Oks1agZP1bPS3U254V56gT/yLqa/Jb59xt33zJtq4rpMmd+w==
X-Received: by 2002:aca:dd04:: with SMTP id u4mr9438841oig.152.1561356343245;
        Sun, 23 Jun 2019 23:05:43 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a9d:4804:: with SMTP id c4ls853952otf.10.gmail; Sun, 23 Jun
 2019 23:05:42 -0700 (PDT)
X-Received: by 2002:a9d:739a:: with SMTP id j26mr54919943otk.104.1561356342648;
        Sun, 23 Jun 2019 23:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561356342; cv=none;
        d=google.com; s=arc-20160816;
        b=nrHRjNNTCinOK/v+xBgEXMrqlnSzDg/o+tjLm2895ILKNpJKeBijtd1/0249ocpHFN
         t0JP7xvfDqLGhZf4e8xJVcuBvrkP8IXmrW804uFGfFP784tZTW41FXImAkDb9h/24ggD
         u23SswK84QL4QcpJezwHCLGI5j/ObitJOtXuGhIkVoUcYkoRv+jLVY3q8NdvkdcvAlVN
         FTSU6xMRf4rEcBfxSbXEHBtI3mTO6kIalptuTJtylt4NtxWbZrCwsqDt9SnQzup3tWUj
         lEoB9s9kt37JnCQtt4N8SRQQ5q4VS8X02EEY6dMH5UNGk5FXevQQXhDzmP/8pOAqG17k
         UMMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=sLt79tj8/phfehM82qsLhTRPj7eX7F7zZC3Elo8Ip4Q=;
        b=pfoNe0Jgn/pDaWHN2U7H9sZiXfhwh795Te+8UGLCiih7vfC9X6PDDLBJk16eQ9a67O
         I/4hZTc2FuljZ+6PBse1c8zue71BBVngtte68Gcw9jKP73ydwNk4WMl24O4rb80HvT8x
         xhKpOImJO9bssonYXkJ7HUkXxqD8jEtzoGBXpW6PRFiWNVC8QNmlH56fMnXJqpkgY9pG
         gbjhCWc/Qy9Kebiazab0kERnzgmQmVU6z5v1vUCrF7AzBRUIcGxGFRhs5SrVN1ssJr2G
         s6/cFDO0cfF9GPV3fVBLa7Smn8Ef7AVS5wjnRaTxxRQ5rgYkHJkRuzJkLplVShcLCLO/
         xVIg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=VYYGMmp7;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id n12si559833otl.5.2019.06.23.23.05.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 23 Jun 2019 23:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Sun, 23 Jun 2019 23:05:42 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/dd6efa-0ecdd0@github.com>
Subject: [siemens/jailhouse] ac81ed: core, tools: Add msi_maskable flag to
 jailhouse_pc...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=VYYGMmp7;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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
  Commit: ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143
      https://github.com/siemens/jailhouse/commit/ac81edf1aa7ed9f58e4ee5a5e1dca8ea00762143
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M include/jailhouse/cell-config.h
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  core, tools: Add msi_maskable flag to jailhouse_pci_device

Will be needed to avoid injecting interrupts from masked vectors.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 243a7537af27a963c00e936462b705dcde7cb970
      https://github.com/siemens/jailhouse/commit/243a7537af27a963c00e936462b705dcde7cb970
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M hypervisor/arch/x86/pci.c

  Log Message:
  -----------
  x86: pci: Do not inject masked MSI vectors on handover

Recent Linux versions initialize MSI with a placeholder vector,
MANAGED_IRQ_SHUTDOWN_VECTOR, but keep them masked. As we ignored the
mask so far, we injected this vector on handover. That caused and
spurious interrupt warning and, worse, blocking of vectors with equal or
lower priority because Linux does not ack unused vectors anymore (an
issue of its own).

We can avoid the issue by evaluating the mask state, if any, prior to
injection.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db
      https://github.com/siemens/jailhouse/commit/0ecdd03e1fbff6388ea6ad6ad2f29f06f2fc29db
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-06-24 (Mon, 24 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/pci.c
    M hypervisor/arch/x86/pci.c
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/pci.c

  Log Message:
  -----------
  core: Rename arch_pci_suppress_msi to arch_pci_set_suppress_msi

As this function both enables and disables the suppression, add a "set"
to its name. Also align the parameter name.

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/dd6efa9840fb...0ecdd03e1fbf

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/dd6efa-0ecdd0%40github.com.
For more options, visit https://groups.google.com/d/optout.
