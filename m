Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBC6QU7ZQKGQEKNG5LMQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id B0AD41829E7
	for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Mar 2020 08:43:08 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id h17sf2968854qvc.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 12 Mar 2020 00:43:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583998987; cv=pass;
        d=google.com; s=arc-20160816;
        b=Y+dSecPnAZVcoww5Rdj7WNuWHGHNWSRc83Ek7H+sXF9TVM1G8yepMCrbaKceiSijSh
         2VSbez+sV3/Sm9Iqaurq+tZ5VDlLhPoEWZj90r0wVXGetftCbXmkjQMWB8dfrb5K12aF
         wMEIz5NhXDmq3jERrycTpp94OhSkwQRHsAUVE6nrsE3bMoIXAyox+3+c00ZSQZkuEpx4
         KN7iRK2W88qOpDTz/7L5aC1p4bv78vwWvGRkhOwGpt4IKsxqWlBzQUoltItd8aAQvYNg
         NJYr0Dg869xJZnNL2Yh8bjxeLWOS2v+OG+kEM2CVvHb8Kb369cDD8FaHUP94QmzFFtSS
         53gw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=pTu95SEEMx5w5Xa4ryCNkZcqTQZ4rXZlFHAC/7VO01k=;
        b=H4NlBj+oUarUyPJT7Gi6ElHMOnZur7sF0+RH2ZNCSMYi51nkO5YJNQNnQKHHORVLEL
         sEO1sE8mNjx49BVPoEDfoSlxRZ4n7+e8cHCfT4ZA9nQ/aqnPEeIKKlFKncepznddwdMR
         xIb2NHjnyJEpCClddCwsNgRM0FAyJxJl4gkpRGRo5bUv9nYgRtfZja7RLd8T9RMwuhZg
         Lo6zQrEaykmXY7gZkbSVzNBAfGzdiL2PUZUhZLe35BZ9efqaHQb/UaXnbPkNqma6VQ7d
         OEH4V5Za101fj4CV5/uyaFhaWaOifny8f9SBcs+v/GPlBgnHDW54Cc4Z5JfcOzRIb1/e
         c01w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="v6s/QVxF";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pTu95SEEMx5w5Xa4ryCNkZcqTQZ4rXZlFHAC/7VO01k=;
        b=f05+L2FE04hVXVPw9ReH4u0V8IIQcecqa2l5M+NGCbeXZv18migK1SPpR4FEJyt93Z
         PaLH5nZJn1T+x9c+zVSh1Ks0PZkc5+Yj6M5mpdn+p9DdooUvXsRtIlRNPSTg7+e71kG4
         nbOFrgMSEL4CUXSMC/Ht0vDQDWKDPZElm1Vjkhg1SqbGCi/Js47JQQOOfRg5zCpC0/Wv
         SPp04vECKJbwtVvRAjthoMmMYyWEoCpZ9qsHrBg5M4DAu27qYF55ianys2GKkJFQDu8Q
         rXADwltozoK2l/I/fKkg8AwhTSWiR7z4ucvQFFH8/bl/oiYYSe/HgVGgn9odaIw3XzV9
         DJeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=pTu95SEEMx5w5Xa4ryCNkZcqTQZ4rXZlFHAC/7VO01k=;
        b=byMF+ij2GXythELzp+DBThvowJTqNX0rCzMF0kZWVLkT+L7M9MLoqIioR4E5zhHLga
         WfrRku5ndGQdV+HX8rOu05tIh9itXDjncGaPxMX7OWF/DpRDlxcYUFIrNI1QmIsJQUG5
         JJIAkLtKaOocUCy1C3Xgqq5FHUZbXh0moYQ6zVeHFHKaSYSjaobvy1xqOiqUTIy0yjxF
         OK45hDXPHoNWouDgVTRNPFhkk1SGp3hF7YobnavM5wvvrEf+dI1hgKbJIl14Gowg4Nq/
         TNE6gs26HeOpRBZ3IlYynrGkh1hLRfxa8ntQ6PbcYtbvvKf9Uk5VSyPWjIbLed//krW+
         Y4eQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ2h5NtPDDGiR3zyH39uINQF1u+WrDemlpE1SP8t9QZkF1G6hPon
	FRedxWRJb9Zqwgp2o+Es/JA=
X-Google-Smtp-Source: ADFU+vuGE5HaBTS5pxGRMFg2PcQ9iI5VxpSYkQYbRovLI6FUvL5MBwqnRL3w51Z/Vpko7o+xkLNQpA==
X-Received: by 2002:a0c:e902:: with SMTP id a2mr6034006qvo.20.1583998987639;
        Thu, 12 Mar 2020 00:43:07 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:efc2:: with SMTP id a2ls1097280qvt.5.gmail; Thu, 12 Mar
 2020 00:43:07 -0700 (PDT)
X-Received: by 2002:a05:6214:12c1:: with SMTP id s1mr5909806qvv.150.1583998987049;
        Thu, 12 Mar 2020 00:43:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583998987; cv=none;
        d=google.com; s=arc-20160816;
        b=Kgb6U7c+xaZRQsMhHH8HnBXp0jO03JwvIkTiJ6/Z/og4l+RCppbRM8qjTQOFyGULlE
         50oPcEE2su0wXKAZM99Efu/oNG2vYkMLzxxuTlTmVJdaxw8qvPTlu8CLpWIQbxwSpqxV
         jO1Je+EnHfTiYzkI7YJ8ckmERzjmaqJ8dt7mwpmovlqy2AQ3yEnur9ARwGR7Xo3tE8+y
         PTQjhRYqas8WXNv0X8gb9eLJqHMkUit5iXOqDIBqtwo3q2Yhga/RSNwHgtHfrfUGvQBd
         822qttjWuHODPcc6yDvF90GRQ0e7npdHhIYFt8n0STIn8/r8QbnFBSiWS6Cr70chilA6
         QvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=3WfgEbdDQdaz4G2l41xAM2KqCd0uytPvjqhirOtQ1ug=;
        b=vx2UvJsFwZeV44tucOu4fMmLxe7LUoQ4j5eH38gFOLQzXX+VsdAWeKPQpb2JIo4mX9
         jaeDpUwBDdnX8cAdKrarUp4rVrTOm//VtL9RXMkmct3BgPGAv9jFI51JY5l6HUeyQCXv
         jIdhA1YgJZm8Hys0XNq9Zjcgi8aEoqe6whtDQWihzPjanDdP3xNzj/rd9cTeAmMLSFU1
         xWVnRRRmxhDwgkNDwRvzQXtcDAL3Z5Kf9iCePFMjt4ll3mOA4zhRODkQTetSoWmkXRYm
         CQdN08K1BjlHt0igAMv5ELeviI22l0Z+iaTK2bO4fjUQEJm5PozgL8u2iHotq3hLAqwv
         TYiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="v6s/QVxF";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-24.smtp.github.com (out-24.smtp.github.com. [192.30.252.207])
        by gmr-mx.google.com with ESMTPS id m18si222811qtn.5.2020.03.12.00.43.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2020 00:43:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.207 as permitted sender) client-ip=192.30.252.207;
Date: Thu, 12 Mar 2020 00:43:06 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/riscv/13ad66-4125d8@github.com>
Subject: [siemens/jailhouse] 4125d8: RISC-V cornerstone
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="v6s/QVxF";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.207 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
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

  Branch: refs/heads/wip/riscv
  Home:   https://github.com/siemens/jailhouse
  Commit: 4125d8501e7003fbf7a056f8d9e36c54193d04c7
      https://github.com/siemens/jailhouse/commit/4125d8501e7003fbf7a056f8d9e36c54193d04c7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-03-11 (Wed, 11 Mar 2020)

  Changed paths:
    A configs/riscv/qemu-riscv64.c
    M driver/main.c
    A hypervisor/arch/riscv/Kbuild
    A hypervisor/arch/riscv/Makefile
    A hypervisor/arch/riscv/asm-defines.c
    A hypervisor/arch/riscv/control.c
    A hypervisor/arch/riscv/dbg-write.c
    A hypervisor/arch/riscv/entry.S
    A hypervisor/arch/riscv/include/asm/bitops.h
    A hypervisor/arch/riscv/include/asm/cell.h
    A hypervisor/arch/riscv/include/asm/control.h
    A hypervisor/arch/riscv/include/asm/ivshmem.h
    A hypervisor/arch/riscv/include/asm/jailhouse_header.h
    A hypervisor/arch/riscv/include/asm/mmio.h
    A hypervisor/arch/riscv/include/asm/paging.h
    A hypervisor/arch/riscv/include/asm/paging_modes.h
    A hypervisor/arch/riscv/include/asm/percpu.h
    A hypervisor/arch/riscv/include/asm/processor.h
    A hypervisor/arch/riscv/include/asm/sections.h
    A hypervisor/arch/riscv/include/asm/spinlock.h
    A hypervisor/arch/riscv/include/asm/types.h
    A hypervisor/arch/riscv/ivshmem.c
    A hypervisor/arch/riscv/lib.c
    A hypervisor/arch/riscv/paging.c
    A hypervisor/arch/riscv/pci.c
    A hypervisor/arch/riscv/setup.c
    A include/arch/riscv/asm/jailhouse_hypercall.h
    A inmates/demos/riscv/Makefile
    A inmates/lib/riscv/Makefile
    A inmates/tests/riscv/Makefile
    A inmates/tools/riscv/Makefile
    M scripts/include.mk

  Log Message:
  -----------
  RISC-V cornerstone

This allows to build Jailhouse for RISC-V, using QEMU as a first target.
The assembly entry routine can be called and returns a funky error for
now. All the rest are stubs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/riscv/13ad66-4125d8%40github.com.
