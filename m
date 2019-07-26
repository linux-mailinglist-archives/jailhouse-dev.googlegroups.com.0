Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBG7Q5TUQKGQEPCHSN5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3f.google.com (mail-yw1-xc3f.google.com [IPv6:2607:f8b0:4864:20::c3f])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0587701F
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:27:56 +0200 (CEST)
Received: by mail-yw1-xc3f.google.com with SMTP id d18sf39819991ywb.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:27:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564162076; cv=pass;
        d=google.com; s=arc-20160816;
        b=khW4Tu3DOLcE0N934h3LsuKMvISx0VkiBaxNw8BIoo4qYvGsEwFfNCk+ht9FMmVlWI
         uIM3yCU6LggzdcKRh9s1pHLO06rWyAUEAd4i1VMfQKIn53xZsjuiYN58hSqhqZbK1sxE
         Msm2bsLMDSCQDwOft3suHT+oTUd+aaYyhmJvQfkaM0bCPYdjJhcAjAhvPJDsuM04aGjg
         ai92ekQJmeZj8mW1DzldAj9sjFYalupUsjsF0MBdtHymtxteBtKtLpfS6Qq3JrGb9KUB
         wXr/gmYh0abCtkFHbWXDjyWlPifflfpL6ory8ZJJ5QeEK/dOwHiqe+cpg6XSmG/nlfUQ
         8YFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=9lRoPTCt1Avpx9B4Z4R4WVUYiOaXuWjC0fSdNL3ljdk=;
        b=F3ZKYY24EUUqrPqi9omXV25XsVqJc5LYXjwhZOAnt4GdKUktopVutdLRNoHKtJMTt7
         lBuQw5s/psojHX4etANLy3Dp1hiqPUsJaJobV32V0x4mt/BrgPj0XROtaF1EqNSEmOAR
         Cr5FWpBlsyjhoVeWZNpRrRS42+o7FvTkBjZTU9rBwpbvBxiTJ8ZgzFBb4YPH0VrGh33f
         R1mk2KpKqhqL1HSR4k2RdnNOwveq6wPrrHMpA5xS29W4XcQwJLMVkwrGMQTsf1pGOv3i
         54pS+Dj9H5O5rp0hrDenX1nmKtQIrOAIdjb3yoM/sNI5navMxyVaMaBX4Bg4LGF7cslB
         zjlg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jMJBd6XL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9lRoPTCt1Avpx9B4Z4R4WVUYiOaXuWjC0fSdNL3ljdk=;
        b=DHnQOWfC13ehnqijA7HDwRexIWBXNYq0IMEaSCY3TCEXF/Tv+aXOEzA3Nmd8p1mO8y
         /Jva02IvcFk9IW5u7Qdj6JtLvDed/iTW2y601McgOLrVhshOJiCHWkJEBxeITdIBaZOX
         1w6scD6Mjfmrehlpl8xf+Suqdo0IAPDG6qmgcUuANNW9rw6jyOdUTeBa6cEUGEHST9nX
         HRvvAUg7UqQI1odILQmTpgqxHeMvgOC2egyxU7MWCLYR/D9hzUHlfxA4jLoQjVM9knBL
         +4wN9KuiDHS5vbsVHBJ/4LUedDIocUS6lP5LQVPY4YUnqwpk2ZQFNc8id2KPJmYbqEqj
         whTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=9lRoPTCt1Avpx9B4Z4R4WVUYiOaXuWjC0fSdNL3ljdk=;
        b=a/z8DtnUkcudK0l3won5K3cc1+VeCMVvEPImhfeI53BrH4ZX6V3IJZbVu219K4Q1tM
         XmSRXYHAedibBXUkKKkqDk3XuBPvudV+ElKb8ov9xpoUJTCXGyY26+Hng0ZFe+tskQQk
         KYsmD+0atH84l4NnXcqgsoSsd9TWcb1Yn09nxZogxBk+mU/4+l5Qq6eaoySa2+2agLTZ
         sfE9552Upr5fZSPMPdqBlVSSjygLGX8937CxC7puzF4QOWxU2CEq+5s9j+hToAddCTJD
         w+aG4aEB56NX1y4MO2zgsq7dPDLAFHJLsjSgZTRuGh80xvyOLAU0RvHDdLGrlVlS4VZR
         Kn6w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWee4FsyZZ2PN5UcZTHE5DPwmqg9H7PX1axKMNZINbsIYcJL5zN
	kl/Ov5EOm12wtPLojqCvz58=
X-Google-Smtp-Source: APXvYqwne3vrMEHugpqUTspSGJL0vukx9NpTsHVFwoe+QwoR81tu1IW7bOSKlKXF3vd6hcOxhSX+AQ==
X-Received: by 2002:a81:840f:: with SMTP id u15mr56591610ywf.505.1564162075886;
        Fri, 26 Jul 2019 10:27:55 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0d:f3c2:: with SMTP id c185ls7329007ywf.7.gmail; Fri, 26
 Jul 2019 10:27:55 -0700 (PDT)
X-Received: by 2002:a81:7b02:: with SMTP id w2mr61105675ywc.436.1564162075339;
        Fri, 26 Jul 2019 10:27:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564162075; cv=none;
        d=google.com; s=arc-20160816;
        b=s5MvIjjPLHtCDtKBUbn8hDUnkGRwljB715KXiymk0klKrSGQUvgS+2+OjtMw2TvKyo
         dMAAInIJPnvlciR83NQDWUYkzkeznN22r3a3/zAlR2aLDmVYlhKb+skrFfsroa7nFOmo
         HudkqO4XOXw+ZGspygy6yptTC4L464pcgzkIixJN/tLJw+d/wH3c0ObLEXiRhL1n0c8R
         XlNnCktcs+A4J8M6O9zk16UxwTnNO0hTZdU7EooMt2iDoB/bpLshE4qCTu0oEvrQLL1c
         //D69QM5oS9X9AZo78fuKirXNR0caYd58MMT3GpGzH6RbjS3zfwHrw9TOLv/OozR+c+7
         rZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=KSGX71YcMYhFgJE4gxBGi4KcAydRBqjZTyALYhrYJL8=;
        b=YsstM9FJkCVwEX9cHuXg7N4/IvLVckDHXzlXUCvX9Cd/oPyoUc2+Ze2dUVVd4rPG/I
         ad7/MPahbSggXLeU2TUfFakV0TVKiUjpRM3Ytl+W14+d+0Z3e3Wi6Pq0rP28dfRHW1Ar
         VTT0sKv7fCHGrMQjtvrPKtXNH1o9H+Ealc27j+V7SsavqZzUSIjtLlC5nOo5CuVXJuLU
         0FfIfHWi9fQglvVZm/Gmahg0UuuyVw9eJQKpHxRsqqo5MuHMyTlOAVVoLpYcGNwgyR5Y
         rWEu6gvnzOFu9k9mm6j/jaxFiFq3zNgqAtobsWAWb+l3WUHBQh4fqjnWwaofBqcnuHYY
         F+/w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=jMJBd6XL;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-19.smtp.github.com (out-19.smtp.github.com. [192.30.252.202])
        by gmr-mx.google.com with ESMTPS id p188si2669077ywd.1.2019.07.26.10.27.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:27:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.202 as permitted sender) client-ip=192.30.252.202;
Date: Fri, 26 Jul 2019 10:27:55 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/58052a-f6fef9@github.com>
Subject: [siemens/jailhouse] d54cbb: inmates: Make heap relocatable
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=jMJBd6XL;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.202 as
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


  Commit: 9f233898917f8c1141132606f2f2c624405d8c81
      https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f2f2c624405d8c81
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-07-13 (Sat, 13 Jul 2019)

  Changed paths:
    M hypervisor/arch/arm/Makefile
    M hypervisor/arch/arm/include/asm/smc.h
    M hypervisor/arch/arm/include/asm/sysregs.h

  Log Message:
  -----------
  arm: Fix build with gcc-8

The inline .arch_extension statements are ignored by gcc-8. We rather
need -march=armv7ve now.

To keep older gcc prior to version 5 happy, leave the inline statements
in place. Can be removed once we require newer gcc for other reasons.

Reported-by: Vitaly Andrianov <vitalya@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f6fef92ffabab0772a6da1fd15cf12887a9600fa
      https://github.com/siemens/jailhouse/commit/f6fef92ffabab0772a6da1fd15cf12887a9600fa
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-16 (Tue, 16 Jul 2019)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/root-cell-config.c.tmpl

  Log Message:
  -----------
  pyjailhouse: sysfs_parser: Add more precise length of some extended caps

I often run into situations where Linux tries to write to some extended
capabilities. E.g., Linux wants to clear Advanced Error Reporting (ERR)
registers when probing for a device.

At the moment, the crash dump of the cell is hard to interprete, as it
remains unclear if the access is inside a capability, or if the device
just accesses some PCI config space (e.g., accesses beyond PCI spec). At
the moment, all extended capabilities have a fixed length of 4, which
supports the confusion. Four bytes only cover the header of the
capability.

This patch calculates the correct length of PCI caps for the
configuration file -- at least of some capabilities. For some extended
caps this is pretty easy, as they have a fixed length.
  Nevertheless, other vary in their length. In some cases, it's pretty
easy (VNDR, ACS), in other cases it's not worth it (VC, VC9) due to
their complexity.

Caps that aren't handle still result in a length of 4.

Additionally, switch to a hexadecimal representation of the length of
PCI caps in config files.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/58052a7a9d1f...f6fef92ffaba

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/58052a-f6fef9%40github.com.
