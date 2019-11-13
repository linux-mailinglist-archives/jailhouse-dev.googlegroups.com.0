Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBGMEV7XAKGQE4GWFVTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43c.google.com (mail-pf1-x43c.google.com [IPv6:2607:f8b0:4864:20::43c])
	by mail.lfdr.de (Postfix) with ESMTPS id F2138FAC2D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Nov 2019 09:43:07 +0100 (CET)
Received: by mail-pf1-x43c.google.com with SMTP id z2sf293397pfg.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 13 Nov 2019 00:43:07 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1573634586; cv=pass;
        d=google.com; s=arc-20160816;
        b=aGf33fSIifCZTJs7jnctRjqZ/puvmUBEmfKyRXdJb48kEiHjtr7JdZLrmSgXPhAQfE
         z9+4X09nIDrw13PdQxX1xNFbUKJmwJ/iFpFiXVoPdKMbp6vdlXBMPumIMJLtjC+HOhxf
         EVq5H/ocLLbSAo9jcsLd1Qi9c+RxtCTQ/v/MCc1u5SChc7BSm7PwfjYO7lyRfSxD/WLg
         LL396jZELdBwFTPjnAO3jnffyorus3OP2YmESQNvTxIlnhvyNs8/i9iLaxF422mzBuc/
         TGd7zjgeLbBLmdnkqNdcsRtM1p1zwWfBQMRNuOb9RiTfjK+HODDUKCWkTMoo0+vIu3dO
         6/iA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=GljQDftdEd5JeRR3Dt0BK67a71uaQQrT6t8tIy9c59Y=;
        b=pxLLQ49uus0GWthuyDJ9SkhepotlfWYOX+4kKUdQ7UeExLNuW5tP+z6Q/9ksSJ6Wee
         FCBp0yWM+UMN4/eHFqAFR/ENfO22SuU9Jlcpz0E0uXcUyVus4nprEVaMy855ioNijxTu
         ODvwPYqh0DCRLHx+FN3EJ++rBN0MsmpxIHf498Mlg54P4MHyxcHpZhjhEyZvfygbb2fz
         Y+y79OuSuz2MyoxaX3CCzkXTJxjNhQ5XLn4fxUXbuudvGtNMuLaXi+jUAd9j3QsjxUhU
         eIQk3YQWs9lzpC6vvsSwdrQIzKtQO6wybmGS2VSeZkmRS7AgaJ/wknENvYXSrJnjSFlR
         rTpQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nvmzQ1V6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GljQDftdEd5JeRR3Dt0BK67a71uaQQrT6t8tIy9c59Y=;
        b=eqMa/s0P5wSPVrW/Xh9YkADiWaV5H69TkjhATCSnFriJBFeRzlxl59oPmMXLleHulo
         oUaj7KwMegRkZrDLhJsFWE5hT1nGLnOAEK7tKzq0UaDloHvbUiLbAAt2MJlipR9ZUkCX
         ZR+6QLRNB6R0gI3ktXsB8kpnOAmphx6Cccdv0aO81S5J2rcChbDECKcH26cs/W+6MKF/
         A0eI+oiaQ0UPT8bYx7nzarWXDnq1lp12luj1nBOT3SnS9vwdyGvWscbs9CN/iJI4H6+S
         lDFVqMWicgLhYW3VJailAxvSC1/PbyrLZWnR9J3MmuOycTFBOKvXxXd3HLq+wFC3SNb5
         o16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GljQDftdEd5JeRR3Dt0BK67a71uaQQrT6t8tIy9c59Y=;
        b=UEyAUFSdAfDwm5JGXovOTgepOUJl84D0JQA2a9phfwJX4SE+NIDawq/7ON8MtdZijJ
         4uuPWDiv6t0DYt0W3a2GlSRdiyXNkxkN5qTs0+BmmK4tXVTTuS8NddG79iFpt9t1AeXN
         HX2XLVBdk0XiRpjWCnKQgnGQxrU6i28fJjVrxw+0DikXr1KPmEahw+etL7RyIdOfxqjQ
         98IGWVjzLbZD5p74gbhBWX52unWtags8eWbTINDs2iJrcNT5IWpfKeHx/LpTGrjw2vsj
         a3cuTR9Ppi2s4VkEbIKb4polzaCTya2WRLWx5TX2ke7ViCm3KmwJHPVNyUZL5jnrh4et
         +amA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtXRnJdnp2DAv4hB1QI8sdZWc9asVTgIFrLha+MsycEjQkqDOm
	9jqOYN0QvLwhaHtxCEirx6Y=
X-Google-Smtp-Source: APXvYqy26T7SPqdftQt58+/Y0ulH4mLf7f+mW8IzeooPGflrB6n9DgxeqEN0elgY/QVnOn4HqZAEvQ==
X-Received: by 2002:a17:90a:f491:: with SMTP id bx17mr3267670pjb.124.1573634586236;
        Wed, 13 Nov 2019 00:43:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:7c10:: with SMTP id x16ls461472pll.0.gmail; Wed, 13
 Nov 2019 00:43:05 -0800 (PST)
X-Received: by 2002:a17:902:7205:: with SMTP id ba5mr2439334plb.95.1573634585427;
        Wed, 13 Nov 2019 00:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573634585; cv=none;
        d=google.com; s=arc-20160816;
        b=Bl6n8sXk4831T5/nMKNmly/KpT0oFw1MbzizrD45LbZ4pzSqx2cSJKm2OABTcBGTAU
         W1A/hPwkea4JPrebTGMzkSgdN6drMPtcIST5LxklODwY0Xgy+TIHWzYMkyV2zBeyuw0E
         1UR4bmKBwBSAah3FoixVu5ghy3hGorte+r3UIuDtODluvzljlqS/eI3PUA5h6YKG13uf
         GTQApBEiVEqPRgolb6ys4vBxMVzEv09pVwZQVlpc3Pq9EFwFcnTzC43/h5S7O/zu84In
         0c21qCusnGFyMmZVEFrc/p7Z16pJD3g3PwPCdZ8UHOAPRi39kFYPgG4wGvisp4L1UovO
         ejUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=tCAl8intn9VwZWhk/tQoqYqxibRqNaJPMMLHa+kxJkk=;
        b=ONgrXqAYSDvBqURlCiyvB7zb39xxcAEo51FnsE4JUlDzsHsR7UxVN3h9Q9qx/sjTbB
         YJZNE10FY1QW+AB2wxYUZwNAMaCikQFPyYWFhEGGfHFFSk24ALv0ilRIlTbVNEX1oUBD
         sALockEtpzCap7oADLHOlHt12risB70oAXI3oc3poV4Ogm7HQ7PDpP84+OUJy/TUoLdB
         gWNU/ixEQbUcswzduyZOBdIfQApV+Lep2r6imEDMalcVJC8PD9yqswf/ni8ZpQ6i9hdh
         oXTMPK7DnsUEZqKAjhYPW9bszu0vDA66DCVenV4fK/K06p6PPEWjxabReINdIhclmFni
         dEEQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nvmzQ1V6;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id f17si49475pgk.3.2019.11.13.00.43.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Nov 2019 00:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Wed, 13 Nov 2019 00:43:04 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/cve-2018-12207/000000-e5d7aa@github.com>
Subject: [siemens/jailhouse] 60f980: core: paging: Refactor
 paging_create/destroy param...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=nvmzQ1V6;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.204 as
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

  Branch: refs/heads/wip/cve-2018-12207
  Home:   https://github.com/siemens/jailhouse
  Commit: 60f9803fbf64a50d997ca0cb426ccbb7a4d582ee
      https://github.com/siemens/jailhouse/commit/60f9803fbf64a50d997ca0cb426ccbb7a4d582ee
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-13 (Wed, 13 Nov 2019)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c

  Log Message:
  -----------
  core: paging: Refactor paging_create/destroy parameters

Change the coherent enum into paging_flags in order to allow adding more
in the future. Rename the flags parameter to access_flags for better
differentiation.

Use this chance to align the names and types of local vars that are
forwarded to access_flags with that parameter.

No behavioral changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e5d7aab4b55bd9f4a1bdd9ee9892823810fd20aa
      https://github.com/siemens/jailhouse/commit/e5d7aab4b55bd9f4a1bdd9ee9892823810fd20aa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-11-13 (Wed, 13 Nov 2019)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/x86/svm.c
    M hypervisor/arch/x86/vmx.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c
    M hypervisor/setup.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: Introduce JAILHOUSE_MEM_NO_HUGEPAGES memory region flag

This allows to mitigate CVE-2018-12207: On affected Intel machines, a
guest can trigger an unrecoverable machine check exception when running
a certain code pattern on an executable huge page. The suggested
mitigation pattern of Intel involved on-demand break-up of huge pages
when the guest tries to execute on them and also consolidating them into
non-executable huge pages dynamically. This pattern is not compatible
with the static and deterministic behavior of Jailhouse.

Therefore, this introduces a memory region flag to exclude huge page
mappings for a region. System configurators can use this flag for
executable regions on affected CPUs, while still allowing huge pages for
non-executable regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/60f9803fbf64%5E...e5d7aab4b55b

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/cve-2018-12207/000000-e5d7aa%40github.com.
