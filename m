Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBHPQ5TUQKGQEZS4OGLQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63b.google.com (mail-pl1-x63b.google.com [IPv6:2607:f8b0:4864:20::63b])
	by mail.lfdr.de (Postfix) with ESMTPS id A273C77023
	for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 19:27:58 +0200 (CEST)
Received: by mail-pl1-x63b.google.com with SMTP id e95sf28804274plb.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 26 Jul 2019 10:27:58 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564162077; cv=pass;
        d=google.com; s=arc-20160816;
        b=I1kUO/Fez6z1uADLyyESMB7mYmv48ztwBQLfL4VhTxs26WNHj1kLxmQ6CP/vOzQFYQ
         +0IuoDXZJTWluKjSVKq7S4Vp7Bwd2aqVILIr25qginesizsd6VODhewf8x3oqDeygpN2
         LWtiiPrIxfDkHmqQ820EgxO85gaQXX/2npbG4gFrRdvfSERglUqVXZoFNrwvIv3IyKrC
         OoTEYm0DCc2f8yiGSJnudNgM7jYQ9e3MC313U9IRvufqH86hUHa/4rU6F4DIqjU76E0h
         gcP6EXbS6viuaPN/vr/YYN/Y504K/tuYMGwwd3ri+Nlzivhnee9KweBBu1mQ5aeJwqlp
         9Xaw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=NV/i7rDRkMd5S1YkiWK+B7JC0WFPANbVWmh22sbg4MQ=;
        b=bgeMl5Ry2+G4Up0w7LcCnypFJ3MJ0zMmEvua8tZGweBOLYf/2EEQMt80A8C+bGgQaR
         90iWEeffeOxCBZ0DmXTWr3TB29w42QF4ccX/E6ji0/Khu6wON5gDvlSs3/zDYSWCxTUy
         qPHfpEuEZrQFyCJGdSNZhk6ERbkkFACdkw3/eT4lstSawWq8ao0JvakqjVpGgPVlzpqy
         cB1xpCplAIudwFFY3GfmmCYvowXBnKsn7gyVAM4U1JU6cAYp7cl8RQbMDmxhsRFKSKy6
         JMC8BHqrA6VXl8G3HrBGM4kVCyAE7q4rjJX8xc/WrIjh9TOIp/kDG8Pml+KmB16fBA/C
         WAKA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NyA07ray;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NV/i7rDRkMd5S1YkiWK+B7JC0WFPANbVWmh22sbg4MQ=;
        b=m8kfcQtzJo8bTTX7sGVoowUNSo+TU0WltZAy3KlO0Mvl+j/pBuR9w6QXlzGOJZqSDq
         jToZLJnGIW6oiGclFbWTqu5l0zRX+fbb+YRg3wLj0SCHmZfMkho1tD6xYrnZ9dfeFPie
         UG6Pv5wVM0ATg01u6QvobB31Nta9cgqcE59yzMBN90Bxjf5OXj3HM9Eu5GkAOI8D5spH
         x0SJaR7VLoJTDI59M1oW8J8PN2Dqa2J80bwtYK6T6DYswaqPlG+3n6RiR6irzKm8aQt+
         VsFPC169jvBECS3M8pHh5w2c6vDOE7ooSwlU2gbTL31Rr7mIzajLrW2DvsaYKa5eQQ1I
         hgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NV/i7rDRkMd5S1YkiWK+B7JC0WFPANbVWmh22sbg4MQ=;
        b=tTrOsyxwN2OBJNoAvl+W3n3Nh2OI1maN0mf+CWTbuCm4OlKpUfYs8GS2+X4CIBzYRz
         FOcamMddd0QSg6BtnVB+3MK61WvsenBFZpEg+sG03rYdjia5evV2YzYGAcIwO47KqGSK
         oEhSBIk1gqVXXxmkO9B9vajeGDi4GjF1bhbB0a7jLjIKt0bNqTORVYt8KyXcq7hax1/n
         7gSRd6Pf2Dygk9pfQEy7bpQupMGC/mWV57ZS31fXDc1O7SHUIqlyxPOzceIivLHyOgQi
         qTEcnroBysp1xCMERAoS4qd4SZqUexhoSO6m56ZAuRx48K0DTVwfXJwWJ2N8pDC9T8vj
         xFVQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVipmeLpPI8OEdf4s61vjHUoilL+hJIeSQ4rXVXUlAdbDT3kciG
	7ps1KdjP7lEV35GH/saCes0=
X-Google-Smtp-Source: APXvYqzsSy7AUQ4pRZ2bzxwpM8ZUgXr60ge4VYbog8pZyZRnSbp+cGQ45fP/VXEXnB1cQUXleun1IQ==
X-Received: by 2002:a62:1ccd:: with SMTP id c196mr23592702pfc.102.1564162077411;
        Fri, 26 Jul 2019 10:27:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:75ce:: with SMTP id q197ls10526985pfc.3.gmail; Fri, 26
 Jul 2019 10:27:56 -0700 (PDT)
X-Received: by 2002:a62:e910:: with SMTP id j16mr24063268pfh.123.1564162076921;
        Fri, 26 Jul 2019 10:27:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564162076; cv=none;
        d=google.com; s=arc-20160816;
        b=z2gz9hLvlZZ7Rt+0WMyAm5PClGLmt8K1ZdhMStC5W6/GQ3Nn/Lo7wNk0tFYDe+bYgd
         ojA/3+EbKNl0JnepuT2JS/PMaUolva+t9ng3pMnif8dpCKd+BPl2j5x4navSixxvy9oJ
         aVaLWfRJMOXSypSWQBkEDnkGQUw5Y5Px8oHSYhAtiv19y+BBqUB3WXJoirqcn3pEvCw8
         FTw2I6cgXHfCZOCqfsURrJT7Lbmzz32HvTGYi8bHkC68wd0Et20QoYfJ0OoE9KIyNRxN
         PAJQs3v/vgMp1ljybksCn7+MqNXFb5wanRoaUzTOy94RzQdXgM78vx0IMPqFs1JAa9hI
         dRTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=la8cAGOCAY5GTqkaIygQLQ2vd/6NwtEcn76I6OkM7YM=;
        b=G3vzZmf8JWJhc46hqidtnKCw/wOS+3bZ+UNUZGUay/ls0elnTdlC9Xuo0dt0vFjpKS
         35bbd/Qx+DxA9V5Gxl9fQUOmzK9X1XQZk1ezIHC0fw2A7PDeCjsodWMeTbmtRcpmm3CY
         oN7O+Gj5iZHZ6vFS3+5FVXZcKle+t0Shuq8HEYF5CCuLQBDSfCAdcBStCKV5njOVSb8q
         g4DhbkcJVfEaHsrXquvLkqcpKtS0HsagQjJZCJZaLlQFEl3TrJN+eFttEXwMB5/xniug
         snZ914B3TSo9p5fBDtM0qgolYhE/7Mnb6jnF74hQ4esZVBvVHkmVuVyiuIN7QrvQXLA3
         OA7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=NyA07ray;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-5.smtp.github.com (out-5.smtp.github.com. [192.30.252.196])
        by gmr-mx.google.com with ESMTPS id l72si2134861pge.0.2019.07.26.10.27.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 26 Jul 2019 10:27:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.196 as permitted sender) client-ip=192.30.252.196;
Date: Fri, 26 Jul 2019 10:27:56 -0700
From: Ralf Ramsauer <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/e7674e-ce661a@github.com>
Subject: [siemens/jailhouse] 4f27c7: kbuild: Correctly step into driver
 directory
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=NyA07ray;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.196 as
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
  Commit: 4f27c75d40daa00e7bb10e2c7b8160c6da8d9732
      https://github.com/siemens/jailhouse/commit/4f27c75d40daa00e7bb10e2c7b8160c6da8d9732
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
      https://github.com/siemens/jailhouse/commit/91d4db70c6f9443e27475d76d965ee5e487a61e2
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
      https://github.com/siemens/jailhouse/commit/a8f1af81a9e2858c9cdc62dcd47471dc5a6e70fa
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
      https://github.com/siemens/jailhouse/commit/cb4dee3cfb262cb2a184e7c62a56f1cb812e55c4
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2019-07-26 (Fri, 26 Jul 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  cell-config: introduce pio_whitelist structure and helpers

Introduce struct jailhouse_pio_whitelist, and a macro PIO_RANGE that helps to
fill lists in config files.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 654594bc0be786ae1e495abef7b322e9024f8daa
      https://github.com/siemens/jailhouse/commit/654594bc0be786ae1e495abef7b322e9024f8daa
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
duplicate of the final io_bitmap) to a structure that whitelists a port range,
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

If no whitelist is given, all PIO access will be denied. Additionally, increase
the config file revision header.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
[Jan: renamed for_each_pio -> for_each_pio_region]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ce661a1b2ea6bc66d972a3d7850389f87d9556ce
      https://github.com/siemens/jailhouse/commit/ce661a1b2ea6bc66d972a3d7850389f87d9556ce
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


Compare: https://github.com/siemens/jailhouse/compare/e7674ea7425f...ce661a1b2ea6

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/e7674e-ce661a%40github.com.
