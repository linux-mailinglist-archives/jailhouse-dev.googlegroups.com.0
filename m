Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB5HR57TAKGQE6HXYE7Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3a.google.com (mail-io1-xd3a.google.com [IPv6:2607:f8b0:4864:20::d3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E871EF5C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 13:33:10 +0200 (CEST)
Received: by mail-io1-xd3a.google.com with SMTP id i16sf1597446ioj.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 04:33:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557919989; cv=pass;
        d=google.com; s=arc-20160816;
        b=JEKl946DhAC6qpuTGi7SQxvmaKu5+z2z5BsfaQdVu8gHK8rFMkZqgJSWENKJ1Dq9TD
         1JpzV2UVFFdDszjmGFG1vR1D/CoyiebBLnewwvDJXuKkcFcGW+8Kk/B7uoRsrZgs4otx
         ljbQCVjK3Gg8Xw6vcNfE9jw1kknTnDlSQEArCAw351HUindr+7sgQWPqv0Gj2ghd8L1F
         DbqhkAkqCDzydMAAlfTrtmdneiH08KZyTVpk2UJC+zqgjsDTsuLrXrxvw90kq7OfFvPV
         /ZNugqvPRIGc6BxsyVd6EXtpu9eVt1hJKG+LrQ6kpcOrH3PGpfoO/35R8yVXtK8HF0vh
         FhWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=OiNOW7znJgKVv9CmZHfl8tLNNGfesdelnwMAHjIvgbE=;
        b=utF/OwDUIk5A1hAEVY5JREqFAnqvJK3TzLExlnct1/3bGe7tlUPhiUD4hMA5OCA6xv
         WW7DXChPrDJHuBdNQIkcq2xu4QsAp5FpnM3sRf9tEWIL3OvE60H+5I25ds/9Taq5pYk8
         lbsa4eoAM+5QMfDEyM5CJJ9jpW0rEQHPvkOQ0L3ICG76uj3TOtnqAH3xAwJXr948WoaS
         Y/byeHymhEO52W9hfH0doaFyhOuKpJ4i2IuOrdvJT5dUrzSVvF4JzdZv46bSl2UdzbvD
         F9ek//D/6GDY8boAh/GC1O3E3nsZs1FQmKYOqetMBtSbUc/4xuTfo7VxUwYVxKKSUIrV
         RmqA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pX+Kv8uZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OiNOW7znJgKVv9CmZHfl8tLNNGfesdelnwMAHjIvgbE=;
        b=VQHpzRDNh7BAm5e9gRgNBQpX/vT4o48EL57JIyNSheOvW9mrUwzIzzrj5Eyj6cgOix
         cYRrfJu/wqkyLvo5HwFDHFJCc8GBXEfMu1rWC7Cj0BWm5+a6F0Pgxdx8xcLpgk0dj7cV
         dENJpDbCFwJrL9BlJYL3aa+e+324O8uPayyeE4ADig/KqpVq7MVtJ9Vj0DRLvw73VUbn
         NRAF5/nMkIdhvRHUNK/iQjatMcjjBov16zzqMBuVc0nDVxbhpwd+UewPL7Ak74zRJBHH
         PzdN7X9z9cC6EllBlFSGJhRWpDt9Co5dHESVejKM2/rt/EB+5So6w5hY230Ag/TGDGzi
         i8Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=OiNOW7znJgKVv9CmZHfl8tLNNGfesdelnwMAHjIvgbE=;
        b=aOiGDHkmAdtFXGQqwmiEdltJRpSVGOWmm3dqgzwXc+oXYRuzbVu0e8le1zuIjiCDaz
         Grnrj0ZJsOU+6B4ycFyEPy0GnXlYuyVkfeHqcUC+gM0qKZ5Hc3B4gXmhaislXg3zajB9
         9SCBPkZu/VFWSFuL/jCkM1eVi/BhGmUw5BgrzYp4GZ0+cF8PYH5kzboxOuYXzy59fjdM
         G61SCn3gyKmZIqZ5Ph19exw7eAYwLaD8KkTg7Y3b11q33DkD2ofIlq0PaZjAqXZCYpiS
         pJiALn173fopqE3eGgPaWNFmsRgz/wQ582mLuxzFHt8QIzMfoBqPVvlR+DgU6l71A5X5
         8j7Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVyVlSMcaHsCJHl986HOLBrURqVqOs7e3mX2jF6J8Mo0l/BTdwO
	cxMeePGansmSbseMoIS8jVM=
X-Google-Smtp-Source: APXvYqzrLw2xkRwg2i6He7czOrrO8hEMXWCeMNZVA3+QjEIczilnZMrokpz9hs3p+Xl7FTx+Y9rOnw==
X-Received: by 2002:a6b:ce0e:: with SMTP id p14mr3253769iob.279.1557919988780;
        Wed, 15 May 2019 04:33:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a24:7d4d:: with SMTP id b74ls638216itc.4.gmail; Wed, 15 May
 2019 04:33:08 -0700 (PDT)
X-Received: by 2002:a24:304b:: with SMTP id q72mr8271572itq.48.1557919988204;
        Wed, 15 May 2019 04:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557919988; cv=none;
        d=google.com; s=arc-20160816;
        b=h7Hi0CY4GrtVP5RLoXxHNZrB/gDyWR8M4+I73Uskk2p/85OysshRPYaQNn9/CNE1te
         KCW/JDIqbAjDpmV22/nl/JSZqFHB1tZPCCGh7urf3oQG60GD9gsbCnry0li24P/9fMB0
         dnDkptu3J8ARr//fz7wjmQB0GxGs+NotsAsEg3wAw6POiUlNpjWHXVJEqypSwgUxj/hU
         lqISIz430Bwt7t1PakDoZ4OemQMH9gmcgGkrIfzabJW+unwDF4DA6Hx4jTYqy3uL9eZO
         sMccsdKX1WyM4Z2Y7Au7VCWfJ4tQ2/eIGvss5NKZ2Y1jzdaV1l1LHXczTHFwHlqp0laS
         T1Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=/4pHAUmc6Hqdny8KQcVrrunaYIvhIxTV7a3+5bCRkfQ=;
        b=awaMiSgw/WOosE4YJTolANj6tCeWs448PpOR4sDnQfaLOriIXkhj/ZvEK9j8Zuxr9y
         J8GdvquAJqbb8/fwh4WEWFM6VYVOJgWC1BgvA452lmES7o7skGMaPQeJ8JXpDYQr/W+8
         GAe9sM8rmHpZ7BamGpSSd12gXBlstBACwkykIij4EvixgklKqnXtpy1uaBs78AsYTvPb
         fh8hBcoS/gvYoUMBGFpaIAbv1O9PANKCKY9PHFhopYOn4cwWXRp/+qBi1bvcOmA5rTvK
         Oz1kip4G/Tp60UVOl3Ma6XTSeyUVq3jHzDUqJmMDoMp9QkGQrn6CeXfvnxRhVGbasSEv
         iGFw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=pX+Kv8uZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id h19si920992ith.2.2019.05.15.04.33.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 04:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Wed, 15 May 2019 04:33:07 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/d235bd-f27a6e@github.com>
Subject: [siemens/jailhouse] b94228: inmates: Fix RIP-relative test
 mmio-access
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=pX+Kv8uZ;       spf=pass
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

  Branch: refs/heads/master

  Home:   https://github.com/siemens/jailhouse

  Commit: b94228ca3ac8b41f4389221f1c31dc4d6092c83f

      https://github.com/siemens/jailhouse/commit/b94228ca3ac8b41f4389221f1=
c31dc4d6092c83f

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-05 (Sun, 05 May 2019)



  Changed paths:

    M inmates/tests/x86/mmio-access.c



  Log Message:

  -----------

  inmates: Fix RIP-relative test mmio-access



Avoid using the cmdline as basis which can move around - as in

91332fa77903. Also makes the thing more readable.



Reported-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 9bd27afaed4f7f5d303dbe3e643e0628d4778e45

      https://github.com/siemens/jailhouse/commit/9bd27afaed4f7f5d303dbe3e6=
43e0628d4778e45

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-05 (Sun, 05 May 2019)



  Changed paths:

    M README.md



  Log Message:

  -----------

  README: Link cosmetics



- gmane's web interface is dead, propose mail-archive.com instead

- use clear-text project name with coverity



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: faedc63365e364e03d2be590e55cca564148b374

      https://github.com/siemens/jailhouse/commit/faedc63365e364e03d2be590e=
55cca564148b374

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-05 (Sun, 05 May 2019)



  Changed paths:

    M inmates/demos/x86/apic-demo.c



  Log Message:

  -----------

  inmates: apic-demo: Plug race around message evaluation



If msg_to_cell was not JAILHOUSE_MSG_SHUTDOWN_REQUEST, we took the

default path which also sent back JAILHOUSE_MSG_UNKNOWN - and cleared

msg_to_cell before that. This created a race condition with the

hypervisor trying to sent the cell a message. Due to the hlt, the race

normally didn't matter so far. It will when moving to polling-based

idle.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 2b1abe0bf2f32b8a77ae12d98019aad2650fc498

      https://github.com/siemens/jailhouse/commit/2b1abe0bf2f32b8a77ae12d98=
019aad2650fc498

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-05 (Sun, 05 May 2019)



  Changed paths:

    M inmates/demos/x86/apic-demo.c



  Log Message:

  -----------

  inmates: apic-demo: Use polling idle to avoid latency spikes



It has been observed and also confirmed by Intel that hlt can cause

wake-up delay in the order of microseconds, although no particular power

management is requested this way. That's obviously because of

unpredictable decisions of the CPU how to react on that internally.



As the apic-demo is (also) about demonstrating the minimal possible

interrupt delay, switch to polling.



Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 557fa0de3f99931f80d3abd8a9fa774f474bbcb3

      https://github.com/siemens/jailhouse/commit/557fa0de3f99931f80d3abd8a=
9fa774f474bbcb3

  Author: Jan Kiszka <jan.kiszka@siemens.com>

  Date:   2019-05-07 (Tue, 07 May 2019)



  Changed paths:

    M hypervisor/Makefile

    M hypervisor/arch/arm/Kbuild

    M inmates/Makefile

    M inmates/lib/arm/Makefile.lib



  Log Message:

  -----------

  kbuild: Set our own KBUILD_AFLAGS for hypervisor and inmates



So far we relied on the kernel for providing us with a usable

KBUILD_AFLAGS. We only filtered out the enforced asm/unified.h

inclusion. But this is wrong, and it breaks on ARM with Thumb-2 mode

enabled. We should actually define our own, stable KBUILD_AFLAGS.



Reported-by: Arvid Ros=C3=A9n <arvid@softube.com>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 0d5bf1644a276cb6b51a54b9b565e14c83a236f8

      https://github.com/siemens/jailhouse/commit/0d5bf1644a276cb6b51a54b9b=
565e14c83a236f8

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-07 (Tue, 07 May 2019)



  Changed paths:

    M hypervisor/arch/x86/test-device.c



  Log Message:

  -----------

  x86: test-device: rename comm_base to mmio_base



the name comm_base is misleading: the adress is in fact one page inside

comm_base. Guests call this page mmio_base, so let's call it mmio_base

as well.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 8b8e460bd6c9d199c2477ae4faf6e4d2562c8e88

      https://github.com/siemens/jailhouse/commit/8b8e460bd6c9d199c2477ae4f=
af6e4d2562c8e88

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-07 (Tue, 07 May 2019)



  Changed paths:

    M configs/arm/bananapi-gic-demo.c

    M configs/arm/bananapi-linux-demo.c

    M configs/arm/bananapi-uart-demo.c

    M configs/arm/bananapi.c

    M configs/arm/emtrion-rzg1e-linux-demo.c

    M configs/arm/emtrion-rzg1e-uart-demo.c

    M configs/arm/emtrion-rzg1e.c

    M configs/arm/emtrion-rzg1h-linux-demo.c

    M configs/arm/emtrion-rzg1h-uart-demo.c

    M configs/arm/emtrion-rzg1h.c

    M configs/arm/emtrion-rzg1m-linux-demo.c

    M configs/arm/emtrion-rzg1m-uart-demo.c

    M configs/arm/emtrion-rzg1m.c

    M configs/arm/jetson-tk1-demo.c

    M configs/arm/jetson-tk1-linux-demo.c

    M configs/arm/jetson-tk1.c

    M configs/arm/orangepi0-gic-demo.c

    M configs/arm/orangepi0-linux-demo.c

    M configs/arm/orangepi0.c

    M configs/arm64/amd-seattle-gic-demo.c

    M configs/arm64/amd-seattle-linux-demo.c

    M configs/arm64/amd-seattle-uart-demo.c

    M configs/arm64/amd-seattle.c

    M configs/arm64/espressobin-gic-demo.c

    M configs/arm64/espressobin-linux-demo.c

    M configs/arm64/espressobin.c

    M configs/arm64/foundation-v8-gic-demo.c

    M configs/arm64/foundation-v8-linux-demo.c

    M configs/arm64/foundation-v8-uart-demo.c

    M configs/arm64/foundation-v8.c

    M configs/arm64/hikey-gic-demo.c

    M configs/arm64/hikey-linux-demo.c

    M configs/arm64/hikey.c

    M configs/arm64/imx8mq-gic-demo.c

    M configs/arm64/imx8mq.c

    M configs/arm64/jetson-tx1-demo.c

    M configs/arm64/jetson-tx1-linux-demo.c

    M configs/arm64/jetson-tx1.c

    M configs/arm64/jetson-tx2-demo.c

    M configs/arm64/jetson-tx2.c

    M configs/arm64/k3-am654-gic-demo.c

    M configs/arm64/k3-am654-idk-linux-demo.c

    M configs/arm64/k3-am654-idk.c

    M configs/arm64/k3-am654-uart-demo.c

    M configs/arm64/macchiatobin-gic-demo.c

    M configs/arm64/macchiatobin-linux-demo.c

    M configs/arm64/macchiatobin.c

    M configs/arm64/miriac-sbc-ls1046a-gic-demo.c

    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c

    M configs/arm64/miriac-sbc-ls1046a.c

    M configs/arm64/qemu-arm64-gic-demo.c

    M configs/arm64/qemu-arm64-linux-demo.c

    M configs/arm64/qemu-arm64.c

    M configs/arm64/ultra96-gic-demo.c

    M configs/arm64/ultra96-linux-demo.c

    M configs/arm64/ultra96.c

    M configs/arm64/zynqmp-zcu102-gic-demo.c

    M configs/arm64/zynqmp-zcu102-linux-demo-2.c

    M configs/arm64/zynqmp-zcu102-linux-demo.c

    M configs/arm64/zynqmp-zcu102.c

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

    M hypervisor/include/jailhouse/utils.h

    M include/jailhouse/cell-config.h

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  configs: define ARRAY_SIZE in cell-config.h



instead of defining this useful macro in every single config file.



There's only one quirk: ARRAY_SIZE is defined for hypervisor code in util.h=
,

which we can't include in cell-config.h, as it's GPL-only. So we have to

duplicate the definitions, which might lead to redefinitions of the macro.

Hence, surround the macro by guards.



Also remove the macro from the root cell template.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 7fa3f90dabab0fd194e15eb9c2131b0176ea6002

      https://github.com/siemens/jailhouse/commit/7fa3f90dabab0fd194e15eb9c=
2131b0176ea6002

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-07 (Tue, 07 May 2019)



  Changed paths:

    M Documentation/debug-output.md



  Log Message:

  -----------

  Documentation: debug-output: fix typo



Shoud obviously be 8250.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: fe7ec7cf9340cdc616bba017676f7a8092528a54

      https://github.com/siemens/jailhouse/commit/fe7ec7cf9340cdc616bba0176=
76f7a8092528a54

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-08 (Wed, 08 May 2019)



  Changed paths:

    M Documentation/hypervisor-configuration.md

    M hypervisor/arch/x86/test-device.c

    M inmates/tests/x86/mmio-access.c



  Log Message:

  -----------

  Documentation: x86: test-device: document the test-device



There was no documentation so far. Let's mention it in

hypervisor-configuration.md, and add some comments to the code.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 740b64fedf47a7a45d0850ea6e3b016e7a9d2cff

      https://github.com/siemens/jailhouse/commit/740b64fedf47a7a45d0850ea6=
e3b016e7a9d2cff

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M inmates/lib/x86/Makefile

    R inmates/lib/x86/hypercall.c

    M inmates/lib/x86/include/inmate.h

    M inmates/lib/x86/setup.c



  Log Message:

  -----------

  inmates: x86: AMD: use the correct vmmcall instruction



I silently broke AMD inmates a while ago.



In 4d6eb915ca78, I removed the call of hypercall_init() without

reintroducing it at the right location again. No one noticed so far, as

the bug (crash of the cell due to a wrong instruction) only happens on

AMD machines only if they use the virtual debugging console.



Instead of calling hypercall_init() somewhere inside printk, let's move

it to setup.c, as we now have a arch_init_early() routine, which is the

right place for these kind of initialisations.



Also remove X86_FEATURE_VMX, it was never used.



Fixes: 4d6eb915ca78e ("inmates: x86: Use virtual console as additional cons=
ole")

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: also remove hypercall_init from inmate.h]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 809701153eb754a62891f580ae1d0ae5ca3932c5

      https://github.com/siemens/jailhouse/commit/809701153eb754a62891f580a=
e1d0ae5ca3932c5

  Author: Hakk=C4=B1 Kurumahmut <kurumahmut@gmail.com>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M pyjailhouse/sysfs_parser.py



  Log Message:

  -----------

  Scripts: Fix for Parsing DMAR Region under Reserved Section



While kernel command parameters are intel_iommu=3Don  intremap=3Don at

some machines, cat /proc/iomem shows DMAR region under reserved section.

This patch must be done for config creation to complete because of

generating DMAR region not found error although it exist. If this patch is

not apply, an error is throw by "config create" command whether

intel_iommu On or Off because "reserved" regions are currently excluded fro=
m

the generated config although DMAR region exists. Thus, DMAR under reserved

section must be parsed by parser.



Signed-off-by: Hakk=C4=B1 Kurumahmut <kurumahmut@gmail.com>

[Jan: adjust style according to pep8]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 710d89499782657538b4e270ad1175ff799dd65b

      https://github.com/siemens/jailhouse/commit/710d89499782657538b4e270a=
d1175ff799dd65b

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M configs/x86/e1000-demo.c

    M configs/x86/f2a88xm-hd3.c

    M configs/x86/imb-a180.c

    M configs/x86/linux-x86-demo.c

    M configs/x86/pci-demo.c

    M configs/x86/qemu-x86.c

    M include/jailhouse/cell-config.h

    A include/jailhouse/pci_defs.h



  Log Message:

  -----------

  pci, configs: unmystify magic constants



Some sugar for the guidance of the reader. Use speaking name instead of

hard-coded constants.



This patch was supported by:

$ git grep -l "\.id =3D 0x1"  | xargs sed -i 's/id =3D 0x1,/id =3D PCI_CAP_=
ID_PM,/'

$ git grep -l "\.id =3D 0x3"  | xargs sed -i 's/id =3D 0x3,/id =3D PCI_CAP_=
ID_VPD,/'

$ git grep -l "\.id =3D 0x5"  | xargs sed -i 's/id =3D 0x5,/id =3D PCI_CAP_=
ID_MSI,/'

$ git grep -l "\.id =3D 0x8"  | xargs sed -i 's/id =3D 0x8,/id =3D PCI_CAP_=
ID_HT,/'

$ git grep -l "\.id =3D 0x9"  | xargs sed -i 's/id =3D 0x9,/id =3D PCI_CAP_=
ID_VNDR,/'

$ git grep -l "\.id =3D 0xa"  | xargs sed -i 's/id =3D 0xa,/id =3D PCI_CAP_=
ID_DBG,/'

$ git grep -l "\.id =3D 0xd"  | xargs sed -i 's/id =3D 0xd,/id =3D PCI_CAP_=
ID_SSVID,/'

$ git grep -l "\.id =3D 0xf"  | xargs sed -i 's/id =3D 0xf,/id =3D PCI_CAP_=
ID_SECDEV,/'

$ git grep -l "\.id =3D 0x10" | xargs sed -i 's/id =3D 0x10,/id =3D PCI_CAP=
_ID_EXP,/'

$ git grep -l "\.id =3D 0x11" | xargs sed -i 's/id =3D 0x11,/id =3D PCI_CAP=
_ID_MSIX,/'

$ git grep -l "\.id =3D 0x12" | xargs sed -i 's/id =3D 0x12,/id =3D PCI_CAP=
_ID_SATA,/'

$ git grep -l "\.id =3D 0x13" | xargs sed -i 's/id =3D 0x13,/id =3D PCI_CAP=
_ID_AF,/'



Extended cap ids were manually replaced.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 822fd81f998248d2ef7b3147662fe9000f48871b

      https://github.com/siemens/jailhouse/commit/822fd81f998248d2ef7b31476=
62fe9000f48871b

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M include/jailhouse/pci_defs.h



  Log Message:

  -----------

  pci, config: add more magic extended caps constants



We will need them later, as the config generator might generate them.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: c6be9c5fb5867fd7b88e099a8dfdc2141ab8efae

      https://github.com/siemens/jailhouse/commit/c6be9c5fb5867fd7b88e099a8=
dfdc2141ab8efae

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M pyjailhouse/sysfs_parser.py



  Log Message:

  -----------

  pyjailhouse: sysfs_parser: rearrange ext PCI cap evaluation logic



Make it easier to read for now and required for upcoming changes.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: b71a700caf21ab59cb44333a043327175f15fd44

      https://github.com/siemens/jailhouse/commit/b71a700caf21ab59cb44333a0=
43327175f15fd44

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    A pyjailhouse/extendedenum.py



  Log Message:

  -----------

  pyjailhouse: implement a helper class ExtendedEnum



Pythons Enums have the restriction that they only allow instances of a

with qualified known values. Unknown values are not supported.



In case of PCI capabilities, there might be IDs that do not have

speaking names. In this case, we should use the raw representation.



This helper class provides similar features to Python's enums, but is

specialised for generating C definiton-like things.



For very easy usage in code, I want this 'Enum'-like type to be directly

accessible via attributes. This is generally no problem, but we need to mak=
e a

tiny rain dance in order to support both, python2 and python3. The

with_metaclass decorator can be removed once Python 2 is EOL or we decide t=
o

only support Python3.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: eee55f900948e5fe0c840ccfe2036444dd45bf7f

      https://github.com/siemens/jailhouse/commit/eee55f900948e5fe0c840ccfe=
2036444dd45bf7f

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M .gitignore

    M Kbuild

    M Makefile

    M pyjailhouse/sysfs_parser.py

    A scripts/gen_pci_defs.sh

    M tools/root-cell-config.c.tmpl



  Log Message:

  -----------

  pyjailhouse: let the generator produce speaking names for PCI caps



Definitions on C-side are in place, so let the generator produce those

definitions.



Therefore, we autogenerate pyjailhouse/pci_defs.py.



The generator will extract PCI_CAP_IDs with grep & sed, fill the template a=
nd

print the generated python file. The Makefile will redirect the output to t=
he

final destination.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

[Jan: moved pci_defs.py generation, refactored extended caps ID string]

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: 51858cbf72c96c11c9b7f0b0d247904d4561840f

      https://github.com/siemens/jailhouse/commit/51858cbf72c96c11c9b7f0b0d=
247904d4561840f

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M hypervisor/include/jailhouse/pci.h

    M hypervisor/ivshmem.c

    M hypervisor/pci.c



  Log Message:

  -----------

  pci: use new PCI_CAP_ID_ definitions from pci_defs.h



pci.h also defined two IDs for MSI and MSIX. Replace usages of these

definitions with the one defined in pci_defs.h.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





  Commit: f27a6ec96016ce84551be1c8dea1cd132a724935

      https://github.com/siemens/jailhouse/commit/f27a6ec96016ce84551be1c8d=
ea1cd132a724935

  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

  Date:   2019-05-12 (Sun, 12 May 2019)



  Changed paths:

    M inmates/lib/x86/header-32.S

    M inmates/lib/x86/header.S

    A inmates/lib/x86/include/asm/regs.h



  Log Message:

  -----------

  inmates: x86: consolidate register definitions



More duplicate register definitions are upcoming, consolidate them

first.



No functional change.



Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>





Compare: https://github.com/siemens/jailhouse/compare/d235bde2a473...f27a6e=
c96016

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/master/d235bd-f27a6e%40gith=
ub.com.
For more options, visit https://groups.google.com/d/optout.
