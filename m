Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHVH3L5AKGQE6WT67MI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa37.google.com (mail-vk1-xa37.google.com [IPv6:2607:f8b0:4864:20::a37])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A72260566
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Sep 2020 22:10:07 +0200 (CEST)
Received: by mail-vk1-xa37.google.com with SMTP id l24sf3752588vkk.2
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Sep 2020 13:10:07 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599509406; cv=pass;
        d=google.com; s=arc-20160816;
        b=HinbnYEnjmrWlxe6Gu6HZSWvDs8EUxscGKjNKy487WjpspR5I17IBkUcbg/yeqWdoj
         hxN4XNGWuywsy5R1DsrxRBRa542DVNpQUxFTV2WJ5vUPeT5qo18HzObYXqfr96/VRizS
         SOrjcnT1phU6+yYzJykOFflLqihJiv4M2OnH/7G7wZn9jivHh3f6mZYBPhQaYIhCi/zM
         ADX20ndlY4guSXF/oF4IorKjgLLGrnVlz/RRtK4vEECzLfvS13Q+WuhSGHTw4SzmWa+i
         3DiFQQrIcsN55lNcX4/SgqDVgDjxb3FWIVok6dNh3sZPgBN3NJ98Z3Cc/wx07bH1nLXY
         Q8bA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Tzqopu+4C8cKKgkZOu5VdaCkBFRztqLFWTxsF17PjT8=;
        b=c3eSMAYIEwV7342x6JCGslIBg5xFJDh0Mtfj2+eyFg8JOjsHSjXI5OkdR1xXQH6WQ6
         mzWEIX7OG0l4qiBVi8Dl8NOYVTW2vAaXGaB64v3AD4Y0MKL3GbC5KZFYWhN/6+lpLzEl
         3prMR+nLCAlM7kK6yAmR+9G+cjR6evidOkFyxPU66auoeZV/svH3ZA83ioN9NuC3rvQ1
         szj+XevYNX4TQQ5BA9WazW8XNAMYG9cuCgMHERRd72kLRoP8s9SPCQQu6SGSnaXYd1u2
         RKJ+WT7ErnjQr9z3Ih5kH6dU5E1fmuEhc76nm/ISmghwMILaKg21SrkWoC774ejkimI+
         yHEA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jkxB0WKX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Tzqopu+4C8cKKgkZOu5VdaCkBFRztqLFWTxsF17PjT8=;
        b=QP+hbV59CaGEu3ZoJf/Se4aHTqnE02Jf4EmVeOoqC15BPr8d+LfOzy55fuLk9W0OnO
         1c3Shx+ryKmnTEsprRcWCv1IK+y+vFEBOoDr+LtErM3MRj9bHI56EddP2GbwUKLtjmx8
         9jHGwT72dd/JbXQRlW/lStKeFzF8Ks/f+ySmPRQJN7Eon8qnJIf9U6DdFj9sYFiV5G7y
         BqieXVJM02oTzKmnV+eC8Xb+8R1EQM89wxi+tlrFtD9+RGdpf+NSOdfgwUBv4ZiLmK55
         QVav490lq3VMw+e0D5v+NhnmSVa2dgYGHtaYUmYatxRJvCUm05xTt5ZP0/pLVmAT4cFf
         mVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Tzqopu+4C8cKKgkZOu5VdaCkBFRztqLFWTxsF17PjT8=;
        b=ONUuQMJhP4UtoXe7v2vKra5kBNuBySrMw8JvKKV2Pp875V0xKL7vDwST++puBBgNGx
         qhJamQ3vnjDRHaC25a+SjbAvuxIASua+50hbjQXLNUPA62nlL/nEfPy96zq1z2o3o8AY
         z0jjr1RuvKzQ37zKsrV/NbJlWmsMdMWOrUFOEGh5O04bkD/4G+2B4/eiPD3r8qHfdMq7
         uQ0x+3sPUHynYkM74gBTru5R8W3LzLRlca7M+95ZHSMMT3wRO22KuRatSr4lNtH5IrcX
         U7m2WvJbbGqFIeaVgUOHMmWk74Zfu7WD741qFl4yEgKccrFrviHOq4FI5Fhe0IJEvIET
         HfbA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UJlqTQ543WIyJgOTGXuD6JHSKHnbdFfInqH2Jd1+aJBzx2wUw
	8HiBO8D72g/Y5mgz04OLaT0=
X-Google-Smtp-Source: ABdhPJw7YeMSG0LVhXAiXtSU8vKnAzAiQLuYJClUS7xW+LrznE2JYDALwRJQop8WPdW9YGoYZpeVQg==
X-Received: by 2002:a05:6102:1045:: with SMTP id h5mr13950031vsq.42.1599509406642;
        Mon, 07 Sep 2020 13:10:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:db19:: with SMTP id z25ls224270vsj.0.gmail; Mon, 07 Sep
 2020 13:10:06 -0700 (PDT)
X-Received: by 2002:a05:6102:525:: with SMTP id m5mr5219312vsa.37.1599509405932;
        Mon, 07 Sep 2020 13:10:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599509405; cv=none;
        d=google.com; s=arc-20160816;
        b=c5IjX7muAnAWjKiCdo2XIbB1o2sD5y7/Nj7Sfj8jQ52ufDDQXiZqbaLZ2rwaO9jcsa
         3zuX6dgQadY31ZJNuYjQ/mD7EkPSFZhPG/C/YQPZ8qFVLobV8ZMTqpPcjsnsCGYCNtxr
         iI2ZPwtUSnXURI9SQoY8+X5Qp64839H1AR7oiaHa9HpzN+qZNPPZs6FlZpjyWv2hKU8U
         LZaKGAoHWByXUeDw0HUTCypi+LAjLXv6ts1nrkcwevImbjBUEebqxaxLAGc0paKTaKSw
         RT48kVWf3wZ/P0kCU7yCwBvWhYjermI+JLXAfq05Tqr2xv7uX/Y2M3NO6IkcD2LWtwIF
         oCHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=UipwCC2V3fjcXjpf4VzSyd16bbBdfyzIYDQqueORP+0=;
        b=tU01JKg5fi/S1Y+2jmvzTQmAzVEb6Yq0zDvZpqlVvdNH2/Wpov+JmTGLkhdWs60F/S
         PFnvXD8NxPoiqUkKMxaII5c005/vh2mIWmAyqruKwFvmTrQzDsBATOaQp+99fDgu403k
         cebhsfRuIUYGsvLwgl+MD8i1ft3KV/dcl3a1LT+IatfvM/dRFWEbI94G2W2x/ZDvbGx7
         0GjEe3Aukslk6PGKvCt2fU164dc7hd9RvikPEOzOxEUWM63DNz2AbN+mXLJqna+eXQ/d
         1+f2YPdpIh47SLridvkq/mfv6YYlk1A4SsI1a3fhuFL+po6CvWitd0/rF5tagu1XTgEI
         uQuw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jkxB0WKX;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-10.smtp.github.com (out-10.smtp.github.com. [192.30.254.193])
        by gmr-mx.google.com with ESMTPS id s9si386933uar.0.2020.09.07.13.10.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Sep 2020 13:10:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.193 as permitted sender) client-ip=192.30.254.193;
Received: from github-lowworker-3a0df0f.ac4-iad.github.net (github-lowworker-3a0df0f.ac4-iad.github.net [10.52.25.92])
	by smtp.github.com (Postfix) with ESMTP id 01546580CF8
	for <jailhouse-dev@googlegroups.com>; Mon,  7 Sep 2020 13:10:05 -0700 (PDT)
Date: Mon, 07 Sep 2020 13:10:04 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/3e1ae5-2a6c24@github.com>
Subject: [siemens/jailhouse] 0763b9: kbuild: Avoid deprecated 'always'
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jkxB0WKX;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.193 as
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
  Commit: 0763b9728ddfe8faad80248b5bd16d9ca53cf86c
      https://github.com/siemens/jailhouse/commit/0763b9728ddfe8faad80248b5bd16d9ca53cf86c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm/Kbuild
    M hypervisor/arch/arm64/Kbuild
    M hypervisor/arch/x86/Kbuild
    M inmates/lib/arm-common/Makefile.lib
    M inmates/lib/arm/Makefile
    M inmates/lib/arm/Makefile.lib
    M inmates/lib/arm64/Makefile
    M inmates/lib/arm64/Makefile.lib
    M inmates/lib/x86/Makefile
    M inmates/lib/x86/Makefile.lib
    A scripts/always-compat.mk
    M tools/Makefile

  Log Message:
  -----------
  kbuild: Avoid deprecated 'always'

Switch to 'always-y' as suggested by 5.9.

For older kernels, we need to set 'always' to 'always-y'. This has to
happen conditionally in order to avoid warnings from 5.9 onward.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2d1af2c7d57588000a195be31048db44d4d5f41f
      https://github.com/siemens/jailhouse/commit/2d1af2c7d57588000a195be31048db44d4d5f41f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Adjust to kernel 5.8 and 5.9

Several things changed and require tuning:

 - __get_vm_area is gone, switch to __get_vm_area_caller which now
   requires another kernel patch to export it (pointless to try
   RESOLVE_EXTERNAL_SYMBOL since 5.7)

 - cr4_init_shadow was hidden from modules; set/clear VMXE directly
   instead so that the shadow is aligned to the real state; no action
   needed on AMD as EFER is carrying SVME

 - include asm/apic.h explicitly for lapic_timer_period

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bc6aba1f45d07e118d087554c63f44258cb02878
      https://github.com/siemens/jailhouse/commit/bc6aba1f45d07e118d087554c63f44258cb02878
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment

Makes it easier readable. No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2b39d02837f6a0416c02428c2a4a8d5652517ab4
      https://github.com/siemens/jailhouse/commit/2b39d02837f6a0416c02428c2a4a8d5652517ab4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions

In case they are enabled while parsing the tree. Analogously to DMAR on
Intel, except that we do not need to keep them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e49675397a549ecd3e7edf3d77416c9f09af5e06
      https://github.com/siemens/jailhouse/commit/e49675397a549ecd3e7edf3d77416c9f09af5e06
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Return true size from IORegion

Avoid having to override the size method in PortRegion and rather do the
correct calculation in IORegion already. This does not affect the
rounding in MemRegion.size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3bde7729be54cf3d4b65b30f3b12ed435b90559a
      https://github.com/siemens/jailhouse/commit/3bde7729be54cf3d4b65b30f3b12ed435b90559a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Always walk reserved regions with children

Newer kernels and/or certain platforms (seen on AMD R1505G) list a all
PCI resources and some ACPI resources behind a top-level reserved
region. Skipping it leaves the config fairly incomplete.

Also fix up a trivial flake8 reporting at this chance.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 484b3f25a1a7fe9f44f4b33a4e39447a401b679d
      https://github.com/siemens/jailhouse/commit/484b3f25a1a7fe9f44f4b33a4e39447a401b679d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram

To be reusing for merging RAM regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2a6c241634555cb92cc5dab3810322b9dc6933dc
      https://github.com/siemens/jailhouse/commit/2a6c241634555cb92cc5dab3810322b9dc6933dc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-07 (Mon, 07 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Merge adjacent RAM regions

The kernel tends to report regions that are not page-aligned but
directly adjacent. Adding them as-is into the config will make accesses
fail because the regions will end up as incompletely configured sub-page
regions. Detect such cases and merge the regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/3e1ae553f995...2a6c24163455

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/3e1ae5-2a6c24%40github.com.
