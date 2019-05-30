Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHMAX3TQKGQE4HGXNVI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43b.google.com (mail-pf1-x43b.google.com [IPv6:2607:f8b0:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3EF2F7B1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 09:02:55 +0200 (CEST)
Received: by mail-pf1-x43b.google.com with SMTP id 5sf3929017pff.11
        for <lists+jailhouse-dev@lfdr.de>; Thu, 30 May 2019 00:02:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1559199773; cv=pass;
        d=google.com; s=arc-20160816;
        b=cZ49wUzYVSQ1sNqpxK5Gw68s9mkdYs7ijHx47ihw2kQCRCXzRz56keHUP9qgQ+JIfE
         YVFxP5A6w8uVPsovMdV3P4ThMcYTOd823z4CngCxg17h/iapjaJ9N1D7ly7HHiFCOPLI
         Od/ynjJfwR8rTjGXJ3s8fVOrJpY5kz4ldPFpoKFzgffAU+AH14OZWwOH7wQjlsmhDbHk
         tMupfxiFH0dnjNozApVJKVDM7jN2AJEVJa2k4pONsy6np+xueQoz9Tk3TR2ts4uZi0Dw
         VGOO2zysrVemNvPXM6l9lGON3f91bWuqn2ca5LuU8BGLQqjIDfT2zB9igts2/ZYX2Pyi
         orVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=hpwz8vdLmo1vehv19Is0KYwvxDlqEDpFrZJSoTo7CVs=;
        b=R7RGwSQql0B66luKUStwjHDZu8JcaY2jLUaBZSlKOGEtvi/I2B75UdIXeL08kRzHFa
         TcQheQ9VETA670TlPKQSEdddmYjhKycnLqzhUgFI7iLhHxL2yeFp0XuL/mjHYGxO8ze+
         BIBthk4kK+BTFcWXKL8BSw7hNvJlpI5lPSygQIQ1TgwYxt6/Nk3pcf9gXjsByKQw+m5l
         3Uvps+OjSdeBCUOruQlGieDlCq+RAyo1Z4SrRO1Dd1zFWAepAGCWJnnx0pbmT/F6v3BE
         DkS1MTVIY1aU9sZ65eeBAV8eIah/pRrtTCC2/ax2Gk1Bu+2lExZq2L/WRJPkiFQYWKTh
         bX1w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=L00dpPCH;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=hpwz8vdLmo1vehv19Is0KYwvxDlqEDpFrZJSoTo7CVs=;
        b=g1CDW6tXWDoOLDOxbsp9FrsCEnM6zBhIpBjj5v55fyejsMk5N/Y1RiC5WxkVWUyBrr
         KnxXCYFQCFDgg2G/hyOCwTkHAw5I3BJ43t1aH4iD+sDi3fKteSU+evKYlDVfC/Mmg2nn
         V7FbMTEAcOZ/byH6Hs3+f7pgkXHLyBfFytWvb4dZxeNvKIqD65GX+JlL35zf+xaH6bBN
         ait8loiNowqiydbMVcVowlMy0AybCgqM6GKtCG6oDdl8glKIqGfchcDqfzjy/3KpklwE
         SDd0HhyRyyPLBJe7f6WFyPHPMS8ahjMV1kLTvUSQ1JU9DbR9VMyAqPKW33oucT6KGhxm
         R54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hpwz8vdLmo1vehv19Is0KYwvxDlqEDpFrZJSoTo7CVs=;
        b=cN0JhyuGyThQa/up9D/JkWN99tJv09e1ZIxctYhXGV9YZ05TCQ2z0YvxLnUQawy6UU
         j/+ctEvr/o9WM8b1V3BkYgmsYfCJBboqH72oK5eV8LAkRDP92+z0WcOfy+bGpsyDrmgC
         XsVBgVhZaH+23SYsSY11sSSUVX9j4d1we/fKmdh46LRnDO/mAlsLFD5FA9vPv5+f0NeN
         s3dzSrLCrWLp8pZCaXKIEHFi87XZp+hwSB1LteJRZ8MdfQoqWqut4WSPISK4xaDJSOj/
         r9sT24OcDUNzKSc0WAfU333LPQAncDemQgJP2/CeBuruY+Rvlt9usJ57SLP5jyQ7L1Pl
         DZtQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVu5yHS/zsAn0Cckj7eYzclFZqF7uY1AVp4PGE2u3eEEFTfrbOB
	tiQHY2CIsEx9lyciXO7Occc=
X-Google-Smtp-Source: APXvYqwfB9WYNZmjVnAMhgADvOZwMTwUkYnxI8gc1XTekI/zbyf7GreszFgMJPQv5tOv9+oBZuyUvg==
X-Received: by 2002:a62:ae19:: with SMTP id q25mr2219684pff.35.1559199773393;
        Thu, 30 May 2019 00:02:53 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:344:: with SMTP id 65ls1301472pfd.3.gmail; Thu, 30 May
 2019 00:02:52 -0700 (PDT)
X-Received: by 2002:a62:ed09:: with SMTP id u9mr2243894pfh.23.1559199772883;
        Thu, 30 May 2019 00:02:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559199772; cv=none;
        d=google.com; s=arc-20160816;
        b=fHBvJHtCIBQYmdioTn5/2Jq2XvQzOMNvsFD2iK7mlnDpMW5dBd0KcARbPWgs3VlUdc
         4eVFLev3Ts14vaj4zuJG6dzP+X+EQXfooUPZ94U+dcAlxVyt9pTUKG1jWr2i/RivD0fj
         tHCp3SptcU1HfsNTQO7AqE3d9JHxJNRq5bDdjlqefyzVPzWlrlzQsaLIK4X+iNSiounc
         DysXvrlwqlkkCGng66tYmcCG1Vy6TX6unEnFLNpOq4FiyDQ7/3SHPEYOXNtsZQAObhkr
         bQBK7iiuUmYaN4T9gA9Z1NYMUzRfBtr8MbcOidChd6MRGZ3OxfcEVG4I4C4vxT6Cq87M
         pb3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=H2aG4MkpC78YjzY+Wt9esG9vS+LUlcTPRVEMtTQayX0=;
        b=Sat5ObbgE8aHn55MwCgLSYRaF/35Tkc5fMxrSQdBiyLQtbPaw9PVe2g9LUXEA+fKKm
         Cp8zeF+t691gOKJxZJEceTCXGzunUvEJvKxC/1wEw2yKWlg3VbCP3RylyIA+iERmc3VZ
         qkhb+amJARPmLgCo2Z/BAJ3II/wr3pVphF1DaZjd3JUnQwbOEgOqlvnKDGN90yBDGcTN
         v08BCkGMkyMd6u8qoYVlO11aQFbBip/wLBqKbJ6nWQ0yWwaBcg+NYBp//GYw60ZTzH5F
         m70xgo7bJZBxm4KjXepji9RnQiGzn8SlQoRzOjNyy3FNRAPu6rIXoMvwOLefvHIk9+Ac
         1Vnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=L00dpPCH;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-3.smtp.github.com (out-3.smtp.github.com. [192.30.252.194])
        by gmr-mx.google.com with ESMTPS id b11si114646pls.1.2019.05.30.00.02.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 00:02:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.194 as permitted sender) client-ip=192.30.252.194;
Date: Thu, 30 May 2019 00:02:51 -0700
From: Yasser Shalabi <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/f27a6e-0c3e5e@github.com>
Subject: [siemens/jailhouse] 2c86f3: configs: x86: Make Comm Region writable
 in all con...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=L00dpPCH;       spf=pass
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

  Branch: refs/heads/coverity_scan
  Home:   https://github.com/siemens/jailhouse
  Commit: 2c86f31e947394b14aa23f1ac5b2672b1e0a8044
      https://github.com/siemens/jailhouse/commit/2c86f31e947394b14aa23f1ac5b2672b1e0a8044
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M configs/x86/e1000-demo.c
    M configs/x86/ioapic-demo.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/pci-demo.c
    M configs/x86/smp-demo.c
    M configs/x86/tiny-demo.c

  Log Message:
  -----------
  configs: x86: Make Comm Region writable in all configs

Since we report startup or runtime failures this way, we need this
permission even when not actively participating in the message exchange
protocol.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
      https://github.com/siemens/jailhouse/commit/cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/include/inmate.h
    M inmates/lib/x86/int.c
    M inmates/lib/x86/setup.c

  Log Message:
  -----------
  inmates: x86: Register IDT during setup

This will allow to share it between interrupt and exception handling,
both being optional.

MAX_INTERRUPT_VECTORS is introduced as public API, defining how many
interrupts can be registered at most via int_set_handler().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bc75ae95de6346013d320dc85708aa737457de84
      https://github.com/siemens/jailhouse/commit/bc75ae95de6346013d320dc85708aa737457de84
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Refactor interrupt handler

This removes one call level by directly dispatching the target handler
from the assembly entry and also doing the EOI from there - micro
optimization.

Also limit the supported interrupt range to 32..63 so that exception
handling can be established for the first 32 vectors. This effectively
removes the possibility to set an NMI handler, but those are not
supported by Jailhouse so far anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d51321d5ed55d50057666d0af7c5ce1cc89d6621
      https://github.com/siemens/jailhouse/commit/d51321d5ed55d50057666d0af7c5ce1cc89d6621
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-15 (Wed, 15 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/int.c

  Log Message:
  -----------
  inmates: x86: Add 32-bit interrupt support

Fill in the missing pieces to enable interrupt handling also in 32-bit
inmates.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b8fce168415c69ddcd210d7b5c862c07e59b3c91
      https://github.com/siemens/jailhouse/commit/b8fce168415c69ddcd210d7b5c862c07e59b3c91
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-05-23 (Thu, 23 May 2019)

  Changed paths:
    M inmates/lib/x86/Makefile
    A inmates/lib/x86/excp.c
    M inmates/lib/x86/include/inmate.h

  Log Message:
  -----------
  inmates: x86: Catch and report exceptions

Add basic reporting of exceptions that are triggered by an inmate so
that we stop translating all of them into hypervisor-caught triple
faults. Reporting is optional and need to be enabled explicitly by an
inmate via excp_reporting_init().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0c3e5eb67e17102d501942d00df7c5b6166a4a60
      https://github.com/siemens/jailhouse/commit/0c3e5eb67e17102d501942d00df7c5b6166a4a60
  Author: Yasser Shalabi <yassershalabi@gmail.com>
  Date:   2019-05-23 (Thu, 23 May 2019)

  Changed paths:
    M hypervisor/arch/x86/include/asm/processor.h

  Log Message:
  -----------
  x86: Update CR4 reserved bits to include Intel Protection Keys Extension

Without this users running on recent Intel processors will not be able to
use jailhouse.

It is safe to allow guests to enabl this feature as it does not affects
the host.

Signed-off-by: Yasser Shalabi <yassershalabi@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/f27a6ec96016...0c3e5eb67e17

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/f27a6e-0c3e5e%40github.com.
For more options, visit https://groups.google.com/d/optout.
