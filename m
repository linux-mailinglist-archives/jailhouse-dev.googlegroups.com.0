Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBUND7XUQKGQEVWNW37Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3e.google.com (mail-yb1-xb3e.google.com [IPv6:2607:f8b0:4864:20::b3e])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B679845
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 22:06:42 +0200 (CEST)
Received: by mail-yb1-xb3e.google.com with SMTP id x203sf19631512ybg.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Jul 2019 13:06:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564430801; cv=pass;
        d=google.com; s=arc-20160816;
        b=pbF8n8qRcROrcnHT5dgxtV2oIvRp5PtnMPst2UWZD5VAs5iahQi0eu09JiLFVprXxd
         0RRlMtfsbI3CJemmCwSGbcho+h7ZTKT6U7WkF9WldZJGdsKnP/mxvOMOOm90ev+OdRIR
         fQNMfdgZr6AYgDxUThC+BveMT6BV8f04jQSaohvCd0ODDYWK2e4mein99qVLW6qf3ekf
         oICEBV0qFioAV5+lLdZxkD6Eyd3HwIXwftVAj1CqjoXR+T1SKGfGCdXSSaAZmuB219k2
         Vifxe6s1A+RLkK+uIraM+J24dKz7tvcFViKQH1cJLW/eYTh0OC5k1uFA+XPo+4OKRTmg
         2EIw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=qQ0aTmwkTTJT8UeEgmvXz/lJ9jKvKTKhwl+EUAUkhSc=;
        b=b+7YHqqumTJtK65I6wX9JaXbfAE2qxOMtHesr9caJcyDTTcmN9LByC/rmkjDn3oEeM
         WvpApIrdWgMCia+r8zQDt1nR7a+qGunVTtEaFmF+SXLFQjr2a8dDQIPmUk5rev6WjapI
         MYKh147FalXkNlP73vYi84eCE19Dc9lpN1rnqqfHgepkWwnsSBOBMF+wSa9gtlNOA2aE
         UmhNlYicEUvegjyZiFc46XoTmzZ4yREu0cJ8wiF9lIvJS9tVBC8sS5AdP50frnqiWunT
         O74JvlGJ/euM196O/opCMvqF+DPUjgZuROg+9N363q9zybj2lO+gextZU+DAhji843q/
         B4gg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=sZpOXBnb;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=qQ0aTmwkTTJT8UeEgmvXz/lJ9jKvKTKhwl+EUAUkhSc=;
        b=s7DoDguJzrb2jX2sTu2kavDWygar83ul0qyEM9DXZH9+h4sptgZrVjQfSE2d3pzC8U
         SU98djXqYTH+Rbive6cCbTcFsZk62LBgW8OLo3lKl/KR0pvR4k6RA9BYpHRZ0Jk5T6bo
         zN87x8kCr0OEMIf+5wuLdeKJK6WSXSIQgvkml7rH55P7Y1hKvu30dQ7D0xZ7mrJn99Om
         kY2KVrzSOj6F/01/qrLFJCdcCRoklhZxkyhlvsCcCIARL8tB+Nh11gvl6tz3v34MrOq8
         UfJUNM88jTaQUw17iAuAff8znIl+Gdn49Kh/AGvkF41IWPeFmb3R2QhhLNMH1jRzzVzZ
         8dGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qQ0aTmwkTTJT8UeEgmvXz/lJ9jKvKTKhwl+EUAUkhSc=;
        b=haLmOCsziZka8U7cUyxgYktZmvWYFWEH5r1wTnjJCwzPF/SQ7IXXVtSvbPrYLFoYPr
         SqzZ9uznRFyevVmjSj2AhY/th7NuexUltE0pgZnWBR9r43B27fAH/E6Pn0c66IqHaKWH
         jxTaPrR68RMmDHqTXCqNM9aVHR+exa9hw1W4QNachDWfEpzusyLm76g+VNyxFdJFmbhh
         rRSYQb9G7z8Tlhtlo4dLYd/YObL1Fapb+zANTIEZsKnGTdf6VvIrESwyaI5QL3jmogTZ
         MwJ/L7AYbeRDAc25Zmpn6d7co/5/g732LxVOocWZ/ORDO9oF4EYbDCAyIeMqdGWffQRf
         nvSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAW90tJqoSWVXbDtVh4CvSnq732lV3Z0Cg8YukKdUS4rrQz0NVab
	z4L8tQ6ksab/RxX6OAp9gJs=
X-Google-Smtp-Source: APXvYqzy8ryBD0sjt7JOUAKIU6uuyKNBOZn5GVNZKG4dOqVCHliho6ZewUttsESHLyv6tJsZGBMz/A==
X-Received: by 2002:a81:7893:: with SMTP id t141mr64059470ywc.424.1564430801367;
        Mon, 29 Jul 2019 13:06:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a81:4f0a:: with SMTP id d10ls10006954ywb.13.gmail; Mon, 29
 Jul 2019 13:06:40 -0700 (PDT)
X-Received: by 2002:a81:9b83:: with SMTP id s125mr70964634ywg.249.1564430800777;
        Mon, 29 Jul 2019 13:06:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564430800; cv=none;
        d=google.com; s=arc-20160816;
        b=wZqbR8cgjKxQwjxljshYQ7AiUmWWePiK2tdZwwpXChrvliaMMU6sl8jxa0DG/zetNb
         hE1nlT0CALKHcsdbdBgg64PGj7Yjvy1QvcUrXknDlUZg/T7LemIzz6PpOxH0T14YqAOm
         qSnObV5Ciiq/4noMUTWlJrgbOblZE4CXbVC0z235sZvhY4lEybQRm65qYx6HpndvuOCp
         CZBLG7kI/Frac/UzKgy9bdTPQPxXbnpGnBiEXzx0evs/YFmtnNXo1IXFQvIPk2Umzz9U
         LK1W7HCZOZ3pkZ76M/GL1t0bgC92CIRpqohz0/k6bgVuTpHrbqNtyPhWP/yMIfr8fv5H
         uvTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=gBuhPjewEESnoUNWAV8vwwGEvtsPpwgS1lULSXYKacM=;
        b=OvIQJgJemY6KmMksuTc4izz05+seY6klOjJckY3SSydjWoszpepkP4T4P+0JAhR5IC
         6ySMEdvHFOkcXVa/d5ysYuGyGv+BrlzANKdSVJDbpLXiG6BUXXFlE4YNeMDZdXVld3nq
         r5KXQKGPRvpW+68Non9iqdRPxIX4Qqp120CbQcFELUQN6Vyjsl6jFbbPDP4dJQM1RrIK
         ybPie1wsduoTccb4+D7EM+u/aVH2c8X/3VzODu6NuT6UGFmwcz8L41iTImy+z6eavOf0
         URYs9d7IvBJPJ6UI293mwAMc4YZL5APHXtwWsjdtyBMfFF/ULFGaNEDgriCzndPmzPEF
         sZoA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=sZpOXBnb;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-4.smtp.github.com (out-4.smtp.github.com. [192.30.252.195])
        by gmr-mx.google.com with ESMTPS id j15si2672212ywa.3.2019.07.29.13.06.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 13:06:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.195 as permitted sender) client-ip=192.30.252.195;
Date: Mon, 29 Jul 2019 13:06:40 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/a17c46-dee9b4@github.com>
Subject: [siemens/jailhouse] 58052a: Bump version number
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=sZpOXBnb;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.195 as
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

  Commit: 58052a7a9d1f5904d72b1637282c877172ee69f6

      https://github.com/siemens/jailhouse/commit/58052a7a9d1f5904d72b16372=
82c877172ee69f6

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-08 (Mon, 08 Jul 2019)



  Changed paths:

    M VERSION



  Log Message:

  -----------

  Bump version number



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: d54cbbcc7c38e9631978756aac1f9f0b9749a80e

      https://github.com/siemens/jailhouse/commit/d54cbbcc7c38e9631978756aa=
c1f9f0b9749a80e

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

      https://github.com/siemens/jailhouse/commit/ede099ad87d8d3144aa807cd2=
8b95d287948ad64

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

      https://github.com/siemens/jailhouse/commit/9f233898917f8c1141132606f=
2f2c624405d8c81

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

need -march=3Darmv7ve now.



To keep older gcc prior to version 5 happy, leave the inline statements

in place. Can be removed once we require newer gcc for other reasons.



Reported-by: Vitaly Andrianov <vitalya@ti.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f6fef92ffabab0772a6da1fd15cf12887a9600fa

      https://github.com/siemens/jailhouse/commit/f6fef92ffabab0772a6da1fd1=
5cf12887a9600fa

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





  Commit: ce87a6afc1de4ffdd10fba9c92ff1c89ec7d34e4

      https://github.com/siemens/jailhouse/commit/ce87a6afc1de4ffdd10fba9c9=
2ff1c89ec7d34e4

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/arm/include/asm/bitops.h

    M hypervisor/arch/arm64/include/asm/bitops.h

    M hypervisor/arch/x86/include/asm/bitops.h



  Log Message:

  -----------

  core: bitops: fix type of clear_bit



I don't see a reason why nr should be unsigned for set_bit, but signed for

clear_bit. This probably got copy&pasted across architectures.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 92c1d1d9948fd0c50d6c5bf4259e1dc9ba0b3d4e

      https://github.com/siemens/jailhouse/commit/92c1d1d9948fd0c50d6c5bf42=
59e1dc9ba0b3d4e

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use definitions instead of constants



Those definitions are used during allocating, so let's use them during

deallocation as well.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 90f392def0720107d0f0cb17f4d026cfd1c101b2

      https://github.com/siemens/jailhouse/commit/90f392def0720107d0f0cb17f=
4d026cfd1c101b2

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: use the variable io_bitmap for both



Semantically, SVM and VMX don't differ that much in those regards. Let's us=
e

the same variable for both.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 53a55842ef7e9f3695649272b37eed8cec89c271

      https://github.com/siemens/jailhouse/commit/53a55842ef7e9f3695649272b=
37eed8cec89c271

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/vcpu.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate io_bitmap allocation



It's pretty much the same, besides the number of pages that have to be

allocated.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c416ff7427f11d51a818bdf8683a75f200f8573d

      https://github.com/siemens/jailhouse/commit/c416ff7427f11d51a818bdf86=
83a75f200f8573d

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: consolidate deallocation of IO bitmaps



Same as before - we can now do this in vcpu.c.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9ad5ca85ea350eb10dd56a1994183039f5ac13f7

      https://github.com/siemens/jailhouse/commit/9ad5ca85ea350eb10dd56a199=
4183039f5ac13f7

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: remove superfluous statement



pio_bitmap already is set to the cell's pio bitmap. No need to repeat the

assignment.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e4cfe90d48731cf30159d9fb8f9e7283756095f1

      https://github.com/siemens/jailhouse/commit/e4cfe90d48731cf30159d9fb8=
f9e7283756095f1

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/i8042.c

    M hypervisor/arch/x86/include/asm/cell.h

    M hypervisor/arch/x86/vcpu.c



  Log Message:

  -----------

  x86: simplify check if i8042 needs moderation



By adding pio_i8042_allowed boolean flag to arch cell fields.



With this, we don't need to directly access the pio_bitmap in i8042.c. This

does not only simplify (and speed up) the decision, it will also be helpful=
 in

future patches.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: e7674ea7425fc3f968c6d50a2bffb9afae861f9f

      https://github.com/siemens/jailhouse/commit/e7674ea7425fc3f968c6d50a2=
bffb9afae861f9f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-25 (Thu, 25 Jul 2019)



  Changed paths:

    M driver/main.c



  Log Message:

  -----------

  driver: Account for renaming of lapic_timer_frequency in 5.3



"lapic_timer_frequency hei=C3=9Ft jetzt lapic_timer_period, sonst =C3=A4nde=
rt sich

nix."



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 4f27c75d40daa00e7bb10e2c7b8160c6da8d9732

      https://github.com/siemens/jailhouse/commit/4f27c75d40daa00e7bb10e2c7=
b8160c6da8d9732

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M Kbuild



  Log Message:

  -----------

  kbuild: Correctly step into driver directory



Descending into subdirectories with modules via subdir-y worked up to

5.3-rc1 but was never designed to do so, see

https://patchwork.kernel.org/patch/11059033. We are supposed to use

obj-m here as well.



Don't migrate the other subdirs because that causes warnings such as



cat: /data/jailhouse/hypervisor/modules.order: No such file or directory



due to missing module targets there.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 91d4db70c6f9443e27475d76d965ee5e487a61e2

      https://github.com/siemens/jailhouse/commit/91d4db70c6f9443e27475d76d=
965ee5e487a61e2

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M configs/arm64/amd-seattle-gic-demo.c

    M configs/arm64/amd-seattle-uart-demo.c

    M configs/arm64/espressobin-gic-demo.c

    M configs/arm64/foundation-v8-gic-demo.c

    M configs/arm64/foundation-v8-linux-demo.c

    M configs/arm64/foundation-v8-uart-demo.c

    M configs/arm64/hikey-gic-demo.c

    M configs/arm64/imx8mq-gic-demo.c

    M configs/arm64/k3-am654-gic-demo.c

    M configs/arm64/k3-am654-uart-demo.c

    M configs/arm64/macchiatobin-gic-demo.c

    M configs/arm64/miriac-sbc-ls1046a-gic-demo.c

    M configs/arm64/qemu-arm64-gic-demo.c

    M configs/arm64/ultra96-gic-demo.c

    M configs/arm64/zynqmp-zcu102-gic-demo.c



  Log Message:

  -----------

  configs: arm64: don't set .pio_bitmap_size



Needles to set them to zero:

  a) The compiler will do it for us

  b) ARM64 won't use it



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: a8f1af81a9e2858c9cdc62dcd47471dc5a6e70fa

      https://github.com/siemens/jailhouse/commit/a8f1af81a9e2858c9cdc62dcd=
47471dc5a6e70fa

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M hypervisor/arch/x86/include/asm/vcpu.h

    M hypervisor/arch/x86/svm.c

    M hypervisor/arch/x86/vcpu.c

    M hypervisor/arch/x86/vmx.c



  Log Message:

  -----------

  x86: drop vcpu_vendor_get_cell_io_bitmap and struct vcpu_io_bitmap



Intel and AMD are now basically the same. No more need for those level

of indirection. Consolidate it and save a lot of lines of code.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: cb4dee3cfb262cb2a184e7c62a56f1cb812e55c4

      https://github.com/siemens/jailhouse/commit/cb4dee3cfb262cb2a184e7c62=
a56f1cb812e55c4

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M include/jailhouse/cell-config.h



  Log Message:

  -----------

  cell-config: introduce pio_whitelist structure and helpers



Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps =
to

fill lists in config files.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 654594bc0be786ae1e495abef7b322e9024f8daa

      https://github.com/siemens/jailhouse/commit/654594bc0be786ae1e495abef=
7b322e9024f8daa

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M configs/x86/apic-demo.c

    M configs/x86/e1000-demo.c

    M configs/x86/f2a88xm-hd3.c

    M configs/x86/imb-a180.c

    M configs/x86/ioapic-demo.c

    M configs/x86/ivshmem-demo.c

    M configs/x86/linux-x86-demo.c

    M configs/x86/pci-demo.c

    M configs/x86/qemu-x86.c

    M configs/x86/smp-demo.c

    M configs/x86/tiny-demo.c

    M hypervisor/arch/x86/vcpu.c

    M include/jailhouse/cell-config.h

    M tools/jailhouse-hardware-check



  Log Message:

  -----------

  x86: pio: use a whitelist instead of a permission bitmap



Whitelist-based permissions align better with the Jailhouse philosophy.



This patch switches the permission bitmap (which basically was (almost) a

duplicate of the final io_bitmap) to a structure that whitelists a port ran=
ge,

given a base port and a length.



As a side effect, this patch drastically reduces the size of config files:

8404  -> 224   apic-demo.cell

8488  -> 312   e1000-demo.cell

11450 -> 3290  f2a88xm-hd3.cell

11634 -> 3474  imb-a180.cell

8424  -> 252   ioapic-demo.cell

8480  -> 296   ivshmem-demo.cell

8788  -> 608   linux-x86-demo.cell

8488  -> 308   pci-demo.cell

9730  -> 1586  qemu-x86.cell

8392  -> 212   smp-demo.cell

8404  -> 224   tiny-demo.cell



If no whitelist is given, all PIO access will be denied. Additionally, incr=
ease

the config file revision header.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: renamed for_each_pio -> for_each_pio_region]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ce661a1b2ea6bc66d972a3d7850389f87d9556ce

      https://github.com/siemens/jailhouse/commit/ce661a1b2ea6bc66d972a3d78=
50389f87d9556ce

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-26 (Fri, 26 Jul 2019)



  Changed paths:

    M tools/jailhouse-cell-linux

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  tools: update config generator



Obvious what happens here: Align the root cell template.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 6adfa0af9d1772a9bfa5d2d3a54bb5263a3596e0

      https://github.com/siemens/jailhouse/commit/6adfa0af9d1772a9bfa5d2d3a=
54bb5263a3596e0

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-29 (Mon, 29 Jul 2019)



  Changed paths:

    M tools/jailhouse-cell-linux



  Log Message:

  -----------

  tools: jailhouse-cell-linux: Simplify calculation of setup_data



The magic constant "25" makes things hard to read. We can abandon this

constant if we let python's struct do the whole calculation.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: ded106d6e583775fb8f9fc704bdfa3181351ac95

      https://github.com/siemens/jailhouse/commit/ded106d6e583775fb8f9fc704=
bdfa3181351ac95

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-29 (Mon, 29 Jul 2019)



  Changed paths:

    M tools/jailhouse-cell-linux



  Log Message:

  -----------

  tools: jailhouse-cell-linux: Add support for pio_regions



We will need to parse pio_regions in the future.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 5c45b67ebc7dbdeb959a750d52f226fca48d37ae

      https://github.com/siemens/jailhouse/commit/5c45b67ebc7dbdeb959a750d5=
2f226fca48d37ae

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-29 (Mon, 29 Jul 2019)



  Changed paths:

    M inmates/tools/x86/linux-loader.c

    M tools/jailhouse-cell-linux



  Log Message:

  -----------

  inmates: x86: linux-loader: Enrich setup_data with flags



Reserve 32 bits in the setup_data for additional flags. Soon,

jailhouse-cell-linux will use them to indicate the availability of

platform UARTs.



We extended the features of the setup_data, but didn't change the

semantics of any other field. So increase the number of the

compatibility version.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: dee9b4544936cd5c18759c06967f0d52fe147b16

      https://github.com/siemens/jailhouse/commit/dee9b4544936cd5c18759c069=
67f0d52fe147b16

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-07-29 (Mon, 29 Jul 2019)



  Changed paths:

    M tools/jailhouse-cell-linux



  Log Message:

  -----------

  tools: jailhouse-cell-linux: fill the flags



We now have some space for additional flags. We use them to tell Linux

which platform UARTs are available. Linux can use these information to

setup only UARTs that are passed through.



Note that the PIO_RANGEs for UARTs have to be one consecutive

PIO_REGION, e.g. PIO_REGION(0x3f8, 8). Split regions, such as

{ PIO_REGION(0x3f8,4), PIO_REGION(0x3fc, 4) } won't be detected.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/a17c46ce809e...dee9b4=
544936

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/a17c46-dee9b4=
%40github.com.
