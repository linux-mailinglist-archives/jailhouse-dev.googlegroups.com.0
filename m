Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB7XC37TAKGQE5BC3TCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83d.google.com (mail-qt1-x83d.google.com [IPv6:2607:f8b0:4864:20::83d])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07E1ABA8
	for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 12:12:16 +0200 (CEST)
Received: by mail-qt1-x83d.google.com with SMTP id z7sf11409941qtb.9
        for <lists+jailhouse-dev@lfdr.de>; Sun, 12 May 2019 03:12:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557655935; cv=pass;
        d=google.com; s=arc-20160816;
        b=GDgLlJPt+NOmtZVG0BUunPD38Dr4UlejRX+GPLpa83ZgOfbnFmDRvXekLJJz5krQbU
         w6gMp49MP4a6rEmHNSrUgTgKDmsdSKmIJQnVwa0APAJ0HFh0teZcWDosqajrW/USm7I9
         hmFMZZvBCBHggBzilNMs3nNiD2uERrTnP80NypGs7rOiIYJn5Qzz9VsE6P+9UM7mOa5M
         NvIFf7Y/Bg/4aysN1a10JJeAfwFwVZh5SyD30tQ5iLMpccLgrJdXv7tFGEvw9IfKY12T
         y/M5FdXdmWhqe3CcEoEldrM1TAl54MGAqvpOV6tF97VERVc5fi9XGQ2BnpjQO+cPoCTQ
         NkSQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :mime-version:subject:message-id:to:from:date:sender:dkim-signature;
        bh=W8/eYyN45IhIUFlauwC2DKKZGp1OJI+qQoaLdh/SiBc=;
        b=EYe2S4zTqa/GAiPzhbPZuuGxgwWKTCVMBnegMhXM4hsRULnfWWeSGuraw/Q9fnjnWM
         619V7bF1m8lJTnicpD1XUPYcBFjycbpibtJQbuRBpn7O0C68LlcSMjjxTH6rVBqGgGNi
         F8+F0MBiF+qqH9WBrBoXtnIefaMKyucswT3xhFGEA5H9NDDcD92NkF5YxZo/8SjkgJo4
         BRPnYtB0ApADVuJZxkvqIE4vSKcltPxUBN6+Rsf7WMrTjIgPtX1qekWOMOE8rrSokSl4
         Qyr2NrvdN4gAz67SNG0VTDueziWolsJkf3X8vjlmerFCCEEB/U3H1Nm5Rmjm1OhrPcKB
         FQbQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LIViWPg3;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=W8/eYyN45IhIUFlauwC2DKKZGp1OJI+qQoaLdh/SiBc=;
        b=ZT4vvwKrnLzqu0TgtGFojDidAd+Op+D6sC84NY6IPWHUKdmvmmKu3hsJYgwdZBBg6N
         Icwe9mbAT+v7aKGLtmshfvNjvHcmw3sphpdVrZmZwtucbl4srAMUEa+D6ZbsjkQt+47r
         KvvezXk6MJKQyzLR35UVZlsUH14pTMmTaHjkOwhIke87IPnwjnosqr/gk5mhkiM1zUOi
         +yUqUQPRJ/BasmtvIPBJxwWJ0OXhlrwxvnDRqOpa8O2xmFuA+E6ncfTMiOxeVFQuUXoR
         i0WfxrZTbjx2+mc3aIZwYDcTbaWTw2HHDNyZw5brQIK2NT+u2A1Q0sQ78bhRgxg3nhDd
         /msg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=W8/eYyN45IhIUFlauwC2DKKZGp1OJI+qQoaLdh/SiBc=;
        b=lScZbdAeBZnwKx5J69NL9z+WOFJzY/brKYrS61wfCSgj7nPRUZzGZSHu7YLH7CnsnU
         jEbacceEIb2H3MV9Gq34QbD4OjRv3m9kInFs41kl3UuLD1wHJSSqA9sAZmOfwLqsrJut
         OzBT4vW8/TMYdMzFsXzgfjxNkly942hUOwYi9Y7/3LuXGDYvCYB28JDSzBrg6JvFFe6y
         saaryaBiB9+lG1mrr4USyg/W62r/+4T92sbcxjpo/kmt9qYSvx2fmq9CdwoxcKUctbp9
         H4vIAs8+n7uhBkbBkbTPp6BIVLjNZ6lb6Js3JLRc0Gu8I3sV7WsKaZWqfJufqo3cnDb7
         yHBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2M+87fe2JcjEZM4hV5ftSUvhwY0idbNXT/xYMzWsT6U6cyzu/
	zjppM7yGCk/UBAKnQSFEy44=
X-Google-Smtp-Source: APXvYqzf9xDbVETiyqBReupeYueqT4tlmd/0Xm8ztH/qMecRwVPQCMIjYEW98FXa6K+t0x3ACekjWw==
X-Received: by 2002:ac8:f71:: with SMTP id l46mr12779321qtk.321.1557655934926;
        Sun, 12 May 2019 03:12:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:88c6:: with SMTP id k189ls2910621qkd.16.gmail; Sun, 12
 May 2019 03:12:14 -0700 (PDT)
X-Received: by 2002:a37:8bc7:: with SMTP id n190mr16951061qkd.108.1557655934563;
        Sun, 12 May 2019 03:12:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557655934; cv=none;
        d=google.com; s=arc-20160816;
        b=cslJrKNkoJ2VKP28UvoHgVMHqH0OOX48STuMBNJ8jUWMVNKccGNMp7QFwuWUzFfO5C
         x4wOLQ0LkfiaLz0MTZpDu282ja58ocpU6VnmYf/mbUG6FDg5eBgok4opW+GHRkbsuHsH
         jGaviRvcD7QiRH/VRIFmhprQ2o4aQJzCrw8A/aor5O6Q6IoFd35aFdV8tgxYtpRPxkL+
         h/cPobvSYD2XLbcf9BHXYUg7fQfZex1NuFDfSu4OqfEyHLbuESsxEIBt/+rcKum8meNN
         rlqlLajVn+SkoYOWBkLHCq8hRwPhRDBfF2WI9QsHTs4hyTd/+aDh8uwB1j9I8Hxp/SBk
         ZbIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=j3KDt5ObBB6HKDj5jBOI7OXfoM8d+7fTgwQ36zJNftI=;
        b=Fsw+o4xfy0RK+4kgbdUyZLQTYWYHRdPh4xpYb2Q0Qj8wVaeROnmRZVHADEhqY3ktcM
         Qfp0i75oW4K0IARaHk0Uk2k1GfNkv3yrZtiVsk/pi2J9MZyVHsrz+z0zS+y1LdX4k6nk
         mFpV7+2CqYi5Jv8SFWyOuTHbQGYCrJkAD5eANL4Jkc0q3fcFNWSduLMz9TtMclUrvkKf
         lX2EqW3EFApHUBdz1hMY4+l1lgSSBEYC4R+2/O9YAGbOk3BnsTxl+VtyUyU8AVIe9Myd
         mzLTc/Vhd+nTNu8DzgZJ7Gu6P3JtypomQPW1EMmSAfZ01sUYXhejmGvwqxVEVj+7qU7m
         kIyA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=LIViWPg3;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-16.smtp.github.com (out-16.smtp.github.com. [192.30.254.199])
        by gmr-mx.google.com with ESMTPS id b10si965895qtg.5.2019.05.12.03.12.14
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 May 2019 03:12:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.254.199 as permitted sender) client-ip=192.30.254.199;
Date: Sun, 12 May 2019 03:12:13 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/b94228-7fa3f9@github.com>
Subject: [siemens/jailhouse] 9bd27a: README: Link cosmetics
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=LIViWPg3;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.254.199 as
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





Compare: https://github.com/siemens/jailhouse/compare/b94228ca3ac8...7fa3f9=
0dabab

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/b94228-7fa3f9=
%40github.com.
For more options, visit https://groups.google.com/d/optout.
