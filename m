Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJUU73YAKGQE2PYSIOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13a.google.com (mail-il1-x13a.google.com [IPv6:2607:f8b0:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id BC63B13CF7F
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 22:54:48 +0100 (CET)
Received: by mail-il1-x13a.google.com with SMTP id h87sf14346697ild.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 Jan 2020 13:54:48 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1579125287; cv=pass;
        d=google.com; s=arc-20160816;
        b=UNYfEdHS9oqApyd1yg+E2ymIk2TddTeXbKGiLO8BhbwRhlRuZVA8p0ff/HTihCfcmE
         9hfWH1MZpJ56DlLE8B4+j8AF1kksGXoIHyJSG7G1Fr/LjYYDCiw2urWq5069K/NngZNs
         gG9BS2XEnzSBwdZU2RsLN8CoCSNrjup3UAHKlc5b96TD1sATZjWdjRdWFb+IfoW/I/vQ
         Pq3zjZV/wnYt/v43HN2Efo40HU63691qlgEn6qmmT3qbzKvpUr5u583izLftE4DhljDx
         dwLw1r6OCv206fLUR71edU1BMmMDl4m4I4bEsX+ryiKZoiZXR90e2BLpewTkn3/6ps5D
         Q05A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=juqhx2x99HYxxJSEVq28TD/YDe0m99n3jLYlr3PgpKA=;
        b=ynw1duCYkk9FsGQJ4crvC3xWGfkKR4nnpLkr/OSFRzyhjHEzXNE38KWz4VaNTeFi0N
         NY/m2DMT6u4ruGSJNmQrUXPPWs8QLtmVcqBXcXaX2UUTveOSvBAZHSLI6rddWgTitKRR
         pK0o9dzJV5A0BQQTKaRKWumw1mO2tpnuJfd4wRomYFAolNhgwXYp1qSNjiW3GNAokst1
         2cxQxN6I8MjT71ASRxHi42AkgQHLDIh+Bkjh6qULKIzW1npSLtuI7GWly2zy1EtnmwGs
         nmApqC830Xrazj+ZFJ80SWN/vfVTcqsKSNWFhF/S0PvcA3fTl+Nk3sTtUmJVChZU69qO
         UdLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kocCCcK8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=juqhx2x99HYxxJSEVq28TD/YDe0m99n3jLYlr3PgpKA=;
        b=bAwOLuh/g8Z1pd8OONp1R06+PWmIKWJ4JIg+zU3gtBPKzLixRDGt0Cgt2LkcB50JcA
         OsSjPi2OJcn1xSsp/xhhx1AQW69vNtKJvlydxPhbl5J8sSlEc2s/kUslUF6+4GFPn4Sq
         QAO3p1zoN7cIh7OsT5RnpdS3Ny6Zg7mwzeOWkGuIBqbpxfjSN6mYTEcyqcvccOoE799b
         A0/r+Pmf5YgxP4NTjs7FxW7eLp2xqIX18geByzjCXVyEimRveLEOSsYE0CGMSGudeTWF
         58+n6poOI56EYK4W7SDg2jS+rPzH3haZ1U1j/t5YsCSLBO4raStL/5Izr1wiVTXuX3mI
         7QRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=juqhx2x99HYxxJSEVq28TD/YDe0m99n3jLYlr3PgpKA=;
        b=rShND59Y5IpHztP5seQ/eaMCcKMKDckCDs1CTmHUtEQMOF0D5y27zl4W/BqfTYksfE
         skdT/vk1g/kz9ZSuCKLBrsqJez6fO2qFzXuoGlIf5+withGhtFZ/YVKVrZ13S9vLRE0u
         gU2LequpVuvDBeYYiI3SZ7ezQ520W+LLZIfoThrzQRaHqaUmUTEo/BITL7FcaxooKWme
         rxs1BuhqYYKWnkV6XX9PEghuCseJ7Yhieq5DujHJnOmxSolGlco3TSlpClxF5pIWjjcO
         OGA1T3DY0f7YTZY3WM//D5Qz43kEFCS40RtBYfXsaKLgmJfRg1ADbw5ZX8AjqMchvpB3
         amAg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWcvaLXQDSI1uoRpn4IJIv3rdWtD8xysmfxS0AvSyZferZD9diE
	+c9zPovNSCdYHvoJmnWC7Wo=
X-Google-Smtp-Source: APXvYqyPdQ+LBp3DlDNovzZsI9weQLAZfpgasWu88FFiNP8k18kIHe0k6UGqvrbCIn+MWG3kgsjf+g==
X-Received: by 2002:a6b:8ecd:: with SMTP id q196mr23346631iod.136.1579125287051;
        Wed, 15 Jan 2020 13:54:47 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a6b:90f:: with SMTP id t15ls3202472ioi.15.gmail; Wed, 15 Jan
 2020 13:54:46 -0800 (PST)
X-Received: by 2002:a5d:9499:: with SMTP id v25mr22948670ioj.66.1579125286490;
        Wed, 15 Jan 2020 13:54:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579125286; cv=none;
        d=google.com; s=arc-20160816;
        b=Pye7I0+A83tdnyDmBoDJMsRdrOA8iBBc2hy1L2dg0KaMFSxGf0UBIbjIJ91FsOOK/e
         k6j75Websr15eo5eqttP7l+jJt1TONNZglsMA8MckRRharFs1GtTQT0Y3gUxC/tBCxes
         jUzFjygGVyOBSv+w5vge6BisvcSdlVM9Imj/QuAYwVJeTN8GZWEO5ua/50ACNix//Tdk
         Fn7RB5PhPiHxjj4Yv40jCTIRJ/FNrNLJInDIszePdpzZdWvHWevD5iocaUFeaMYIaRF6
         APeRGCqlaPay2R0OM673eHn71xejKu7CgROTh6GjM9Z7m9ZfGWqALs2+YjZkwWW4cHMh
         SRHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=WM6ZTEM4so5idL19u/YC9TAOLvrpSB6Jn+bF46Wj1Ig=;
        b=aMC2C/j3P+DyN/IIYBKt3VkB3qdmhUxyh/rwlI0f30raPvZtzLusYhKMVJ7BMFCsi3
         z9yWplQU8bnOCzKEMykeUWgJ5PwwMkkr0xHwfizv48v2fOMhnGUFFAJYZoFQcUxfSf2O
         v2QI16a8rfdJU8aUdrs13tkvGG5Od39yWt7+r8e1xPeNAzAfRdhWND8WQdFUqsBNhp3r
         eO9yQPwRcyxxHetGmXu6J+4PFDSCoHWUFGvdQJyNdJYFXv1mL3reM0TZ9h/TBbvqOwIm
         15wh8kBSoMyoI4ssAnO2QMBFhcCKnb2MjU9FU9iu/xk4+l7JUtmjDkh8eS97AEmOs9z4
         a1hQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=kocCCcK8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id z6si798045iof.2.2020.01.15.13.54.46
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Jan 2020 13:54:46 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Received: from github-lowworker-2300405.va3-iad.github.net (github-lowworker-2300405.va3-iad.github.net [10.48.17.39])
	by smtp.github.com (Postfix) with ESMTP id 01E8D2C33E4
	for <jailhouse-dev@googlegroups.com>; Wed, 15 Jan 2020 13:54:46 -0800 (PST)
Date: Wed, 15 Jan 2020 13:54:45 -0800
From: chacon01 <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/005fe3-cf0d15@github.com>
Subject: [siemens/jailhouse] 7cffb9: core: fix hugepage splitting in
 paging_destroy
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=kocCCcK8;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.194 as
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
  Commit: 7cffb9b7d54dd3466b320f5467bd39110b35ac61
      https://github.com/siemens/jailhouse/commit/7cffb9b7d54dd3466b320f5467bd39110b35ac61
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M hypervisor/paging.c

  Log Message:
  -----------
  core: fix hugepage splitting in paging_destroy

When unmapping pages, it is not sufficient to compare the size of the
page to the size of the region to be unmapped to know whether a
hugepage needs to be split. That approach does not split hugepages
when the region to be unmapped is larger than a hugepage but does not
cover the entire hugepage, resulting in areas outside the region to be
unmapped and leaving areas inside the region mapped.

Instead of comparing the size of the region to the size of the page,
check if the region overlaps only part of the page and split the
hugepage if it does.

Fixes: 1f7784032531 ("core: Add support for creating page tables with hugepages")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
[Jan: reduced by two local variables]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cf0d156663a49d33f9047e4b7b942a10b3fc3ba0
      https://github.com/siemens/jailhouse/commit/cf0d156663a49d33f9047e4b7b942a10b3fc3ba0
  Author: Chase Conklin <chase.conklin@arm.com>
  Date:   2020-01-15 (Wed, 15 Jan 2020)

  Changed paths:
    M hypervisor/arch/arm-common/gic-v3.c

  Log Message:
  -----------
  arm-common: gic-v3: ensure LR writes are visible

The GICv3 architecture does not guarantee that writes to the list
registers are self-synchronizing. As a result, it is possible for a
valid interrupt to be written into a list register but have the empty
list register status register report that list register as not holding
a valid interrupt. Since the empty list register status registers are
used to indicate which list registers can be used to inject an
interrupt to a cell, it is possible for a valid list register entry to
be overwritten, dropping the corresponding interrupt.

Fixes: 2ce9d14ca4e2 ("arm: GICv3 initialisation")
Signed-off-by: Chase Conklin <chase.conklin@arm.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/005fe368e11b...cf0d156663a4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/005fe3-cf0d15%40github.com.
