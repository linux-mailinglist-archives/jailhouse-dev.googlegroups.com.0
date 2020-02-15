Return-Path: <jailhouse-dev+bncBC76BKUBWEKRB4WGT7ZAKGQEJOLQUEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc38.google.com (mail-yw1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id 612A615FE60
	for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 13:26:28 +0100 (CET)
Received: by mail-yw1-xc38.google.com with SMTP id j9sf8796948ywg.14
        for <lists+jailhouse-dev@lfdr.de>; Sat, 15 Feb 2020 04:26:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1581769587; cv=pass;
        d=google.com; s=arc-20160816;
        b=PYiVUYyuoKeRM6TCeHhW9Xt1PKqbZh43L5vLdnqseBh2ZghcFJhvtLoNxcs+4ikgeh
         zEpryXBHKQpq3cdwWiuTSq55Thz1IWLhrdpyTolH3qd6W0gT95JCUnizWILSBgPTbU80
         qzwtIZpSuW5ApADCuZiLNElZawWcL7wPUTWj4ZZqocQ7XKru4faTAF2tF3C/TA/l2cAl
         PJG9of/SP5AteJ5g2GwYbrKEn+KkTEbilPRLCuiyCLCz5wj5Dlmix88ahJRFH33Cb8Xh
         SL2FR6waVW1pJA1byZVcVkAcS9tAFX43a/bBn1dwAoS/EcCobZwaT60efVrJ54TklWgv
         gwqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=brwez99tkjqFdtoLH1jHHJm758NJTgc/KEwcLsVYD7w=;
        b=vGKtOlPYMm+WJ9dwY5PD45OU7QTPE5Z+qrVZsv+xmZw5tfRolMQHCAlKvUugremGkM
         ptCdVQHS9oOzk/V/AjOnOEnYtpDW7l/5NjFey9+wRZA6G7Em7a7GhIrJtR2IRPU+kfme
         863RpzyaOP3eZaAjFgXEriuj1FE9OXSk6s7Y2twPG2Yxh4dy4ooZwgu5Vs8nZNw0ktrq
         0troSrMlMtIT/vrJsmCscO+IjbNJ9/1Vuc80SVagXzYUbvvlpnkdyLZSQTC8tmLoJrMF
         i0IujNQeQtKGXvEbyKneksuwBkYkLpYSDGR6K64SmzJr5SjwBEDGa/JIns9orGwr42Ja
         3vLg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ub5dRSkU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=brwez99tkjqFdtoLH1jHHJm758NJTgc/KEwcLsVYD7w=;
        b=ZTPN+FEEZ5IFHOlp+jx1qB6HZg1jLOtT4f4/TWQtsZ6z31uaWRfgUHFQsdyGsT56hd
         JaSTLF6gu7T4pM+5e93XYZpXl2X9qYdyidDyzDq5JMXKwXgSc6BxeA41l9rVKdsD/RTx
         ibiQ50RpqeAG5I0EwlYY3EmsGjnBU1rCNahzb7WWZmqt8MkZSW4lBc4wUxOQW4R0W48W
         8QmBICfoA+KQOmqjGsNm4aNu+osml5NEs4dDI9uDu8OJY75rzpPs+oyxAXfSK66KkyYs
         52U6sIOMmoyDIw3UqLjAp543z1wJ1dBqksOyWIKlmUC3WaOlNaV0DZZg4WTSCH+v/Cxo
         Y0ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=brwez99tkjqFdtoLH1jHHJm758NJTgc/KEwcLsVYD7w=;
        b=KDQXS4k84554Kip1WJUw8JpqDWOrVPD5fuJ90ypfsy1Q/fUzV24aRw+OT2NEL31xNu
         jvRNz8983by6RhKIUr0Tzbl+/+ZZaOHZuVbJ/QCsJXCdhi2zvQKXyR9qSegXobGKm+Ir
         3pvJqBYikiwzCPjF3k9nsIBjyHUQel0cqnICKfmWE0dWK8CVzmNPiUr//VbKdhVXYah/
         gpGYx5MGAd0n/dolDTnv0YBBAFX2tKjGFmhSCSLc/bzJJKUjgGoVqO+/BEqgaVMPXtcR
         JXm5vGv7YjQhmeLEqeXdF1ApZTpaGggRqqWJLq6x+jMpzMEXu6llW1zt4xu1Udm0glt2
         xWwA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWFKEPkIfynE+aFdN0YRMzq5BFO9c6o0/x3mZeLLr6GSm8paaLY
	vZxfp1NVomOWbgLMbl+4hJQ=
X-Google-Smtp-Source: APXvYqzKdblDGawZlmkjTFTQ2gipbScVFSWI7Thf0qMb2fzJ5J129AkO0nDUNnXsHgcWXuLIkgZyNg==
X-Received: by 2002:a0d:dd83:: with SMTP id g125mr6789681ywe.396.1581769587137;
        Sat, 15 Feb 2020 04:26:27 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2f88:: with SMTP id v130ls1120980ybv.2.gmail; Sat, 15
 Feb 2020 04:26:26 -0800 (PST)
X-Received: by 2002:a5b:b10:: with SMTP id z16mr7068372ybp.318.1581769586483;
        Sat, 15 Feb 2020 04:26:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581769586; cv=none;
        d=google.com; s=arc-20160816;
        b=cle3Gp0Fq8mOLjPo2yba8Q1azwG7kArumENBpPgndc5O4gZyNg1OkeY9JrmFRGw+5o
         ayL07yTFMA2EntR10J4prdMM5hcDzlKaOi7/rB05Yft7Uf7R4QikoQVCvq04BTumxFBk
         FGCMJjKpTv3FpBTkMBxMxxjsED2G7neCjeIGatPws1r0YsTibqGVvEB823aJlJ53tg2Z
         xogxx+IzNhS/uyjPOZmFmLCTC19Cg3akosc47mk6PIaKzGSGKZz0SU4G7muCUIZEJqtB
         kRZsnjvBbA3bI5FCUkoV7YY639nfI9lUgocoSI9om4g/3qFrUQ0LoiVFN4GwoeAGxMU0
         AYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=sTa6C0mPEz9FzZsaiyszsEDyai43dJljOEvAmWXwMfs=;
        b=QpFqwiUX5sDFHXaypfkzWW8cPTBEWvDNGEoO6tvI3z7Kjkk/USDWv1lEZgax9YGadZ
         0mfFAYJ81u512UxicU195Icx5APc2NM5H7Y9en8geDsVnqB1mTEZUkB4TUXdZ9E0JCt/
         gbLQtJKsNPQy9TB3DokzIlnZScyc6zz45r4sOnup7a4L9Si3AuEKxbpeKjasTk93LVjv
         wLNcuscLUCZhxqv2AXfURFp9mTDqhubTh9tddY3NnFavsbU39Iz1/n91pOez4xCLFKNz
         vx2yNvfC3sgofKIgzceTtzH61aSpInK63RvvWZ6B1ckcDs8DIjH90+Qzk2F3dHBJinIw
         BCQQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Ub5dRSkU;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id t82si381300ywb.2.2020.02.15.04.26.26
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Feb 2020 04:26:26 -0800 (PST)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Sat, 15 Feb 2020 04:26:26 -0800
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/coverity_scan/3814e3-a519da@github.com>
Subject: [siemens/jailhouse] 213747: configs: arm64: Fix comments in
 qemu-arm64
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Ub5dRSkU;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.192 as
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
  Commit: 2137473830c3788f3fbca9f1e782b2dcd7c358d5
      https://github.com/siemens/jailhouse/commit/2137473830c3788f3fbca9f1e782b2dcd7c358d5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-01-30 (Thu, 30 Jan 2020)

  Changed paths:
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: arm64: Fix comments in qemu-arm64

The device tree remark was copy&pasted, we use mem= for QEMU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 92db71f257fabd3c08fa4b99498fa61a41ea831d
      https://github.com/siemens/jailhouse/commit/92db71f257fabd3c08fa4b99498fa61a41ea831d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-04 (Tue, 04 Feb 2020)

  Changed paths:
    M VERSION

  Log Message:
  -----------
  Bump version number

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7e538dd94667a1426c4a694f8bd9c6071ac41b88
      https://github.com/siemens/jailhouse/commit/7e538dd94667a1426c4a694f8bd9c6071ac41b88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-05 (Wed, 05 Feb 2020)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c

  Log Message:
  -----------
  configs: arm/arm64: Fix vPCI IRQ assignment of Linux configs

By moving the ivshmem devices for virtual network one slot up, we also
changed their IRQs. Adjust the irqchip configs accordingly.

Fixes: 68b8ff84ae8d ("configs/arm/bananapi-linux-demo.c")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a35bb08187d4aa03f5cd5d26355bf0155c6563a0
      https://github.com/siemens/jailhouse/commit/a35bb08187d4aa03f5cd5d26355bf0155c6563a0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Account for constant name changes in 5.6

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eb101d0d853c8546d701aac4ccab3c251877a4d1
      https://github.com/siemens/jailhouse/commit/eb101d0d853c8546d701aac4ccab3c251877a4d1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/sysfs.c

  Log Message:
  -----------
  driver: Do not WARN if a cell CPU is missing in the root cell

This error will be reported by jailhouse_cmd_cell_create via -EBUSY and
is no reason to create a kernel warning.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8700228123cb881477c571a125bb4b79560d9166
      https://github.com/siemens/jailhouse/commit/8700228123cb881477c571a125bb4b79560d9166
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/pine64-plus.c

  Log Message:
  -----------
  configs/arm64: Add support for pine64-plus board

Add config for Pine64+ board.
https://www.pine64.org/devices/single-board-computers/pine-a64/

Allwinner A64(Quad core A53) + 2GB RAM

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 783f206e0b49f121a043429a8e0dff73baa5f8b3
      https://github.com/siemens/jailhouse/commit/783f206e0b49f121a043429a8e0dff73baa5f8b3
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/pine64-plus-inmate-demo.c

  Log Message:
  -----------
  configs/arm64: Add inmate demo for pine64-plus board

GIC demo and ivshmem-demo are validated.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5dbdcbc720c94f79913b1c1b966f87d314d333b5
      https://github.com/siemens/jailhouse/commit/5dbdcbc720c94f79913b1c1b966f87d314d333b5
  Author: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    A configs/arm64/dts/inmate-pine64-plus.dts
    A configs/arm64/pine64-plus-linux-demo.c

  Log Message:
  -----------
  configs/arm64: Add Linux demo for pine64-plus

Add Linux demo with 2 CPUs and 128M RAM for Pine64+.

Signed-off-by: Vijai Kumar K <vijaikumar.kanagarajan@gmail.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 23f82ce47f923fc6cba5696513fc5cba86dc89db
      https://github.com/siemens/jailhouse/commit/23f82ce47f923fc6cba5696513fc5cba86dc89db
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-13 (Thu, 13 Feb 2020)

  Changed paths:
    M driver/main.c

  Log Message:
  -----------
  driver: Leave a comment while on_each_cpu(wait=true) does not work

Easy to forget when looking at the code again.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad
      https://github.com/siemens/jailhouse/commit/7d6ea66fdd1c818882e00a3b8434d3d0bbe0b9ad
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M driver/cell.c

  Log Message:
  -----------
  driver: Remove unneeded masking of cpus_assigned

Since 366766542b3d, Jailhouse will refuse to start if not all configured
CPUs are online. In that, the driver will not use cpus_assigned anyway.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b5d8439116e8615e5b0498391f3ecb27407a1505
      https://github.com/siemens/jailhouse/commit/b5d8439116e8615e5b0498391f3ecb27407a1505
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/arm/include/asm/paging.h
    M hypervisor/arch/arm64/entry.S
    M hypervisor/arch/arm64/include/asm/paging.h
    M hypervisor/arch/x86/include/asm/paging.h
    M hypervisor/arch/x86/include/asm/vmx.h
    M hypervisor/hypervisor.lds.S
    M hypervisor/include/jailhouse/paging.h

  Log Message:
  -----------
  core: Share identical PAGE defines via jailhouse/paging.h

PAGE_SIZE, PAGE_MASK and PAGE_OFFS_MASK can all be derived from
arch-specific PAGE_SHIFT. So move those three into the generic
header. We just need to replace a few asm/paging.h includes with the
generic one, and we need move the asm include down in jailhouse/paging.h
because ARM needs PAGE_MASK in a static inline function.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb099cc16bdc03fc20a0b7f41bb88d998f63745b
      https://github.com/siemens/jailhouse/commit/fb099cc16bdc03fc20a0b7f41bb88d998f63745b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M Documentation/Doxyfile
    M hypervisor/arch/arm-common/irqchip.c
    M hypervisor/arch/arm/include/asm/spinlock.h
    M hypervisor/arch/arm/mmu_hyp.c
    M hypervisor/arch/arm64/include/asm/spinlock.h
    M hypervisor/arch/x86/include/asm/spinlock.h
    M hypervisor/arch/x86/pci.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/control.c
    M hypervisor/printk.c
    M hypervisor/setup.c

  Log Message:
  -----------
  core: Remove DEFINE_SPINLOCK abstraction

It's highly unlikely that we will meet an arch that needs a non-zero
init value for its spinlocks or has any other use case for this
abstraction. So remove it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 63c63da94657899e809416c1a56493e8ecc9507d
      https://github.com/siemens/jailhouse/commit/63c63da94657899e809416c1a56493e8ecc9507d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/include/asm/cell.h

  Log Message:
  -----------
  x86: Remove no longer needed include from asm/cell.h

This became obsolete with 018f4afa844b.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ad9547bc7a754b60207bf29b6bd9f397cbe1062e
      https://github.com/siemens/jailhouse/commit/ad9547bc7a754b60207bf29b6bd9f397cbe1062e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/include/asm/types.h

  Log Message:
  -----------
  x86: Remove ifndef from BITS_PER_LONG definition

Not needed, we only include this in bare environments.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 35064003c32d04844334b2607d30bb66aa5222cf
      https://github.com/siemens/jailhouse/commit/35064003c32d04844334b2607d30bb66aa5222cf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/iommu.c

  Log Message:
  -----------
  x86: Simplify iommu_select_fault_reporting_cpu by using first_cpu

When this logic was defined, first_cpu didn't exist yet. It's finally
time to renovate it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4da2f64396ae900b1229acbf5fd82e7c0323a36a
      https://github.com/siemens/jailhouse/commit/4da2f64396ae900b1229acbf5fd82e7c0323a36a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M hypervisor/arch/x86/apic.c
    M hypervisor/arch/x86/include/asm/apic.h

  Log Message:
  -----------
  x86: Stop exporting apic_to_cpu_id array

No longer needed since 1ff4937416fd, in fact.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca9863efd13be47d8be61ba7e2738feff370d73b
      https://github.com/siemens/jailhouse/commit/ca9863efd13be47d8be61ba7e2738feff370d73b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M ci/build-all-configs.sh
    R ci/jailhouse-config-amd-seattle.h
    R ci/jailhouse-config-banana-pi.h
    R ci/jailhouse-config-x86.h
    A ci/jailhouse-config.h

  Log Message:
  -----------
  ci: Renovate hypervisor config

Several options became obsolete, others should be tested. Add them all
into a generic jailhouse-config.h.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a519daf7568dd81add59d01440c808489d081ef9
      https://github.com/siemens/jailhouse/commit/a519daf7568dd81add59d01440c808489d081ef9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-02-15 (Sat, 15 Feb 2020)

  Changed paths:
    M Documentation/hypervisor-configuration.md

  Log Message:
  -----------
  Documentation: Remove obsolete description of CONFIG_BARE_METAL

This was removed by 006918caa2b9.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/3814e3a97798...a519daf7568d

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/coverity_scan/3814e3-a519da%40github.com.
