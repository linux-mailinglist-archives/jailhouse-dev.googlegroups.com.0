Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQFVTPUQKGQEYZJ6J3Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x43a.google.com (mail-pf1-x43a.google.com [IPv6:2607:f8b0:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 45EC6651F1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jul 2019 08:44:18 +0200 (CEST)
Received: by mail-pf1-x43a.google.com with SMTP id q14sf2900259pff.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jul 2019 23:44:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562827456; cv=pass;
        d=google.com; s=arc-20160816;
        b=eAQcGzjYsaNThEKzh+/6F50GfQXAGSVvJjBz+Ya3nBHYfgibsFTUqzv6dT8bmqT4d0
         iQwgA87r/X6eJBz8P3VpLYkdyNyFsSW7ULh3qrkt0bHGSa1Bh6cZ9ls3mmhQnWKkmeCm
         xFt6Ns/xLaI9NbW27XQdJfNOyF3k1MaFJVcPU+iUnZqZk5OEXv3Wa+h07AQ0Y5G4Bbcw
         GXG8dA0f9bpYdjaa1G23MGdweGj0EtjYbfsb3Mg5NSJe50Yh/3s5gDQRVFCM14bslDsd
         stOQxlbmgKPh6N2NGU7LynagQv8uKSy4qE7NFEXLuZQB1cqZcXyzPPlgNwk1fu74Naz3
         tEDw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=eJU0xsxFkAKkOfOIU7Nm8dllcvgexwFGOKLdDOIosdw=;
        b=o2OaoVqd71IMJxUvs2Rd5emhHlV4St12UgYTbB/Fs0Wuz3Hcih03qvUb6rp19x3Fvk
         T5ngdDKiWSHw57mIBcXGnxmbiLt13fvytialtx0uNNZsoOI84UMZvi0tVWPI0h2zt5ol
         pcNKaGb8Pb0k5aEx/o/wM+z7uXZcB4N2LAl0ESBA8ybJgTwSRrUhiybtLuwsHgjJ99fz
         QSy2dyV2+RZgekg9UfyKUKsISH2XO4UfUe//nQe1+Hakgvk6Bcl4aWxQDNHDVVJseAXi
         Wc4lF34nLRUixRMAR4EYr1wFifYVr5IUbsmstR1CtJY8pDJAzp16A2BUpxwM/GefGhRl
         RB5Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zZPwvDS2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eJU0xsxFkAKkOfOIU7Nm8dllcvgexwFGOKLdDOIosdw=;
        b=BfVyDIFJa7W2fHvWPxrFEGs6DAJUEycloRZ+mY7Eb8jYxKBhzWM+06md0SBAxLrgcV
         94GFckZyTspzJmuOiIbLt4Uewj81XpLIU24GbAXph625LdVGrmBqYXZyKldPpJufz7wB
         +0aa63vjbQJlRwYkZ2Hszh8ZKcBbc22y6/Ic9pmZeeJhyCdemlLG3IF3nWIaurNvaxgt
         D3ID6fHNc3i8EEW+hx0l+TPx1t2qwSbAtqgBxxsv+Ugoj/CyBPUwwb7nmDssWt0PifEI
         Pun03rP32xuXGlD9sbu1JWuFdPWJQToubvEdSVzWAteppYTOoVjGbJ1G8h72GtGGWrxz
         bP+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eJU0xsxFkAKkOfOIU7Nm8dllcvgexwFGOKLdDOIosdw=;
        b=H2Dh4Nh+BLYoRe1hJRizTgC9nojuRfKys+6qrR9vkLbbAo5q9vSYz6fMAT5+Vacgdb
         Q0J95tE6GiD2Z1S92bIHLjwNgjblJ0hCpzvj41CQWeuThRpxDyiWQ0D4np1R5DB87Av+
         iH4TyxsQs8UlkCdzWEU937ZLmi5XQhSQ9aScdxZFOS+1SnzovedDIDWdZhLIS45FzlL/
         Xguz5yCtVzDwZH00i8fJQTMnpTGKyPpgRhkRpiRqqFNH/zg14nl8pJyYzciZqLk1hl5f
         2AECpgOe5S/j1G2g6SxnWniBly0ba/fmfJygV5dtWPlv114tVl/m3W/csXlKoFtRAb0e
         f3vQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWZMyFkWpTKG7mSLRwuMi5NqX/T/E2Ir6miHIrhJX8M66S0T7PV
	vNuJW3+bdRJTUCQuEI+heUE=
X-Google-Smtp-Source: APXvYqxSkahhY2aXu8cKX/kSxKskkyEznndGQrRIqRWDX/bzbmkOYrssHMGV/Ska3IOY6X7l7Fy6yA==
X-Received: by 2002:a17:90a:a613:: with SMTP id c19mr3023773pjq.17.1562827456562;
        Wed, 10 Jul 2019 23:44:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:5ec4:: with SMTP id s187ls805421pfb.1.gmail; Wed, 10 Jul
 2019 23:44:15 -0700 (PDT)
X-Received: by 2002:a63:e5a:: with SMTP id 26mr2591210pgo.3.1562827455783;
        Wed, 10 Jul 2019 23:44:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562827455; cv=none;
        d=google.com; s=arc-20160816;
        b=H4EBzvvKf4AJgbrkZFzUGNhAQcpJWwKjGWVr0i3B4NwLbBio49Iu4ICnkosjRzzo2g
         CU/Wv8LqpY2ruxTs8BxVOhrZ21Oh9cEIAPbTEMbOOWPNcSN9mxmH1+R89Mdb10jqanI4
         PaLb1Z4WXWN5sycZAs5fMKFct+V7xMyE/azTK2WrjS0/hJ2iBVDDwUz87f0YRIbHDSoX
         Q6X8toASaodJgsBnOSc1mSyz0vwHGc3fHMzqNebSRY/xf6qQB1flQkywo/d5sOZgOj/v
         QcRpQAhfqboVv2jBevqhVLxC/GXhVafrdxJj2hJEuopB4V7gj1fPPY48KpleTupVV0jJ
         u4Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=G5pRboCX72mccOM/4WJx0E8j9dIfYZcSB1Z2lkH2JFw=;
        b=h8TEsTNccBND1SsyMXf3qA3rfHTBphXqhIcYo6lCKTxk80pWXJuCOi4dk+WdOiZ2We
         lM9XVLBEwEB0to6u0Knq20YST3iXrDulkWeccmJ2mcASB7y/ykCcXER3PjwLSKTG8IV2
         CYUrVHJYikfQjOo2JbezCKM0zJJC/2zU/dx7BM4GZuF/trDTG2r+RHaUh7d0P687UrS8
         u2T3v6eqvdqK83G6DGWa6CRmGDIxbJvuHyhysakDKiYS6G2XfF8n2QSBrkeKT/K00BT0
         GnILZ3AeMD4TaCqquRjCECVPvsL+rQ7rnj0i+h8vzawEYcvs0kiPuVvE4Y/7zU8C/XW5
         fLuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=zZPwvDS2;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id s60si224340pjc.2.2019.07.10.23.44.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Jul 2019 23:44:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Date: Wed, 10 Jul 2019 23:44:14 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/a17c46-ede099@github.com>
Subject: [siemens/jailhouse] 58052a: Bump version number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=zZPwvDS2;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: 58052a7a9d1f5904d72b1637282c877172ee69f6
      https://github.com/siemens/jailhouse/commit/58052a7a9d1f5904d72b1637282c877172ee69f6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-08 (Mon, 08 Jul 2019)

  Changed paths:
    M VERSION

  Log Message:
  -----------
  Bump version number

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d54cbbcc7c38e9631978756aac1f9f0b9749a80e
      https://github.com/siemens/jailhouse/commit/d54cbbcc7c38e9631978756aac1f9f0b9749a80e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-11 (Thu, 11 Jul 2019)

  Changed paths:
    M inmates/lib/alloc.c
    M inmates/lib/include/inmate_common.h

  Log Message:
  -----------
  inmates: Make heap relocatable

The initial heap needs to be within the initially mapped memory in order
to allocate page tables from it for mapping more. On x86, growing the
heap beyond the first MB is blocked by the comm region that has to be
located in lower memory in order to avoid conflicts with PCI resources.
Therefore, it is needed to relocate the heap after mapping its
additional space. Inmates should be able to do that by setting heap_pos.
So, make this pointer global.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ede099ad87d8d3144aa807cd28b95d287948ad64
      https://github.com/siemens/jailhouse/commit/ede099ad87d8d3144aa807cd28b95d287948ad64
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-11 (Thu, 11 Jul 2019)

  Changed paths:
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: qemu-x86: Fix ACPI region size

At 0x40000000, some PCI resource region starts. We accidentally
overlapped this so far which was unnoticed because ivshmem uses 64-bit
resources, and no other PCI device was placed in that region. When
changing ivshmem to 32-bit, this will become relevant, though.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/a17c46ce809e...ede099ad87d8

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/a17c46-ede099%40github.com.
For more options, visit https://groups.google.com/d/optout.
