Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBVVY375AKGQEK7CMPVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ua1-x93d.google.com (mail-ua1-x93d.google.com [IPv6:2607:f8b0:4864:20::93d])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A81261D1B
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Sep 2020 21:32:39 +0200 (CEST)
Received: by mail-ua1-x93d.google.com with SMTP id r22sf24170uao.20
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Sep 2020 12:32:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599593558; cv=pass;
        d=google.com; s=arc-20160816;
        b=0VFVccze23dy+zn/9GyV9G4/vfmSRX09WylfnY+jLkkC5hoXZenIxHOxPnuqMYafKl
         NCXvE6WFCM2mp9loT8YBrLsYTOdgp77XF/tmu/mUzXax0nKrTsdrvMknr0W3WHcBlGcj
         tnURtVhATxiU0q0cR24qbtb7+k46XHuTmkLpo2HIYWnubbBNyXe0Cgspsti9KO0zICH4
         X92hiOizte7aWEobSFkVZwdLv0NbGmNbyUlozPX7Qum8qwICtpOVnaFUnSIcl4lVTdZD
         UqbUGG3XGTpKAnN4X2ChK+6Qds/o5JTw+LwAszXi5ADTJzEfDV8uGpBjhMroVN7Ei7jl
         63Jg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=vk5aTwIY1ZeeliZDcfX3zVwJN6UHwCEMrNK2sqyxxjo=;
        b=VYd8NYtkfWBEjtSFcAOlPsqfw4eF5QlFR8dvL8mSMGGTzk+7OjxwraDpbn5P1yKyhe
         UmxaG6yfYZjGhW630O2cn50C2WxHP2DAAqcl39UpmRYEJ6+nPoat98vYYh/bne1pTsQL
         vHviQoXzZkW+x+Kep3r8VLVb2iFFGOdVtZJRQhLVlayJgkKww3n6A0anPndVbn0lpZxk
         i8hp8Djxm2zz9FaaB7T1mQk30NHhyNLihR1/3hmyQ//w26HgL5a0jd35qWuF4VfsXlJe
         rFWP19u8971a8rwecP8XRMoyTdoZ4ScRh4Cz9PMQMCOsNGOiuJOKGaTuQjFuMrbc6269
         15Mg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0lu7Bchz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vk5aTwIY1ZeeliZDcfX3zVwJN6UHwCEMrNK2sqyxxjo=;
        b=K4axVpemMFB2dlDu5VJLBTBR13Bvd/KUTo/bAnk9weiCA7Ks9v02jgZP5ERdR7UjpH
         ycUrTTy22C06qz4/2+xFn2ZSkZ1lumy60wn2Jpm0jGY/QPCROv18s10sVbHihcpyads2
         pCXD1M832WyjEq97LM6ydQ05YE1XbQJqdSwn3WdKhqo8u58u1yVTVhy/+lzxZ7mWOTu5
         CQlojQDpFpUIIouuhgeKnnp5sCs+pBOInVw3Xqyj+0Mck7wo2drtoCkKyfVXSpPiDqOL
         bKPRLp8XkUbvfg0RMV2gsebpnjwEK3oTDOKHLnKM3O0QyFk09EAIemJX7HJI6DNqbTtM
         zeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=vk5aTwIY1ZeeliZDcfX3zVwJN6UHwCEMrNK2sqyxxjo=;
        b=h+NX9w1y2qZYaeqzca3RRASFNm9TK4q+5ucjT7Kt2tc63tij0bPRPwTFC/sVw8hQwu
         ArO3wlLD977niJaBe6CPBWU0DN0rq5EjEmgpPp0M5omxRAx5ZkdVCVBgEZrFWtFoPf0K
         J0o3w0j6Lr0KRexEyPQD/tvHl986ZwG0Obt3wQpDBJbbrq4XYR9k7nmouIRTPku4CusG
         8Pj3vpLmkIZlZbQewmk81D0vkgalVrjaj3M5MmPHuGy7wW38lK+r9wkzG+Ri+41XPtjk
         Ya0AKWu1NFqCxQjeFGce5xmbcjJrfHHEPZps/Dvyu03miO95ufO5IghH93uCTSnMvSR7
         N4Yg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530gN3ieNj2FffuQcJEGemFgw05NGoEYD8bCjpDOZyadwV4oWvXT
	6qJCYh3mgEtHjVJ1bLm9/Og=
X-Google-Smtp-Source: ABdhPJwLnG+0F3UKw6dfj81b0Nby5H+6MCSEDBq31+nbBqnvIXpVMmUiZDYQeEFlT6VsqqIktIS/xQ==
X-Received: by 2002:ac5:ccac:: with SMTP id p12mr397442vkm.5.1599593558342;
        Tue, 08 Sep 2020 12:32:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:874b:: with SMTP id j72ls3324vsd.9.gmail; Tue, 08 Sep
 2020 12:32:37 -0700 (PDT)
X-Received: by 2002:a67:cb17:: with SMTP id b23mr458380vsl.28.1599593557692;
        Tue, 08 Sep 2020 12:32:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599593557; cv=none;
        d=google.com; s=arc-20160816;
        b=F4CI5lm6cYMgrOwHl2o80pd1rPRJqJoeGBORSBdgDlFv3a7FVTaHJeIc0Fkt+MGc4O
         psYUkV6CvhzfDhMpZBgFgSOuNl34EH4mZRShgiyibunYAqMzAQfezAFeDoHRZINvD0T9
         ceFlTAyra24sngcHTjJqI1+QdF2IcRUFUMzj90kb/WeP573dkzy9A4feoeOVxa3qHZWt
         MT8WZyU/NdIoWvrw0ak9cNhxhj+xgBxtx+7X/WWNmPw5Thx48gG83tqFYIBWTh2Ub83T
         EeUQUrAbn+M0R0fMl1aucXOYwrf/6A7et4cQbuDLe6DTabfL8T1ZEHUAwGvdGESi6CFE
         4zCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=OZk4P0ZuZ2NmYYtNHyoEulGTo0Bw48rmA8RLC+EtB20=;
        b=xBCa8U8Ln/yfcUCg2ahh9wjrzQiouH0Na82rG7SUOYW04sH8ItPJiR9QtmJ7fbA5Ol
         ErTgHlpg8zjp0G0/ve+NxJvtbXJsjl195qJkEr673Vtj42sl8ZoT9JQiNIENLUjnJkfS
         UPxEJtCVFXj25JzUqpA5QVFcIWcUqM7Pbjw8UbNhgFISwCz0IBJ2aJHWF28HEp5Ui456
         78jcVohIQB72RBqlqwMTz5hQPC8x6OkgVUTfIUHNdFEAVzw9za9BRhNQY2NFM+tQgfCR
         DPebnwbJoFlLsCi4kW/Lc6YNUqsBRcXqjAl5lbleZj8XDOfWghAIfBTqDItDZ1JLW1CQ
         1aDA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=0lu7Bchz;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-28.smtp.github.com (out-28.smtp.github.com. [192.30.252.211])
        by gmr-mx.google.com with ESMTPS id q10si17767uas.1.2020.09.08.12.32.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Sep 2020 12:32:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.211 as permitted sender) client-ip=192.30.252.211;
Received: from github-lowworker-b2150d3.ash1-iad.github.net (github-lowworker-b2150d3.ash1-iad.github.net [10.56.113.12])
	by smtp.github.com (Postfix) with ESMTP id 66DA0900D90
	for <jailhouse-dev@googlegroups.com>; Tue,  8 Sep 2020 12:32:37 -0700 (PDT)
Date: Tue, 08 Sep 2020 12:32:37 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/2a6c24-756216@github.com>
Subject: [siemens/jailhouse] 7b2876: kbuild: Avoid deprecated 'always'
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=0lu7Bchz;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.211 as
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
  Commit: 7b2876158c416ecd40e53bcc6b4c9080dc51931a
      https://github.com/siemens/jailhouse/commit/7b2876158c416ecd40e53bcc6b4c9080dc51931a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M Kbuild
    M configs/Makefile
    M hypervisor/Makefile
    M hypervisor/arch/arm-common/Kbuild
    M hypervisor/arch/arm/Kbuild
    M hypervisor/arch/arm64/Kbuild
    M hypervisor/arch/x86/Kbuild
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


  Commit: 67e4de38a3f8c37a429f68019a79a2c387d66fa4
      https://github.com/siemens/jailhouse/commit/67e4de38a3f8c37a429f68019a79a2c387d66fa4
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

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


  Commit: 5f4f0b1f3588e6059424b23854a9550d1713957f
      https://github.com/siemens/jailhouse/commit/5f4f0b1f3588e6059424b23854a9550d1713957f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Fix wording of parse_iomem_tree comment

Makes it easier readable. No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3dbdf11d94a9ac58d9dd213e95ba32781b0f021c
      https://github.com/siemens/jailhouse/commit/3dbdf11d94a9ac58d9dd213e95ba32781b0f021c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Filter out AMD IOMMU memory regions

In case they are enabled while parsing the tree. Analogously to DMAR on
Intel, except that we do not need to keep them.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2e8103b044df491e469f143479347823d556ca42
      https://github.com/siemens/jailhouse/commit/2e8103b044df491e469f143479347823d556ca42
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Return true size from IORegion

Avoid having to override the size method in PortRegion and rather do the
correct calculation in IORegion already. This does not affect the
rounding in MemRegion.size.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b57f5dc5384d8619c98a94e34898658c7db9c2cb
      https://github.com/siemens/jailhouse/commit/b57f5dc5384d8619c98a94e34898658c7db9c2cb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

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


  Commit: c242d88ba13ff143a05dba0b043eb6b891236ec5
      https://github.com/siemens/jailhouse/commit/c242d88ba13ff143a05dba0b043eb6b891236ec5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Factor out MemRegion.is_ram

To be reusing for merging RAM regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 756216b9d1e1f5b908db35c8dfb1c87d6600e053
      https://github.com/siemens/jailhouse/commit/756216b9d1e1f5b908db35c8dfb1c87d6600e053
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-09-08 (Tue, 08 Sep 2020)

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


Compare: https://github.com/siemens/jailhouse/compare/2a6c24163455...756216b9d1e1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/2a6c24-756216%40github.com.
