Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBZ6BRT3QKGQES4GRAUI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63a.google.com (mail-pl1-x63a.google.com [IPv6:2607:f8b0:4864:20::63a])
	by mail.lfdr.de (Postfix) with ESMTPS id 537D81F73E7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 12 Jun 2020 08:30:01 +0200 (CEST)
Received: by mail-pl1-x63a.google.com with SMTP id o1sf5485705plk.22
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 23:30:01 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591943400; cv=pass;
        d=google.com; s=arc-20160816;
        b=cUayK7IBMggqbvFFBkyauMC9ksoXaTVW8mIvVobcWiF2jR5m/QdUvvD6HhTwE+RSr3
         ixZ1w+CMBxIZTc6tQR0/PdrYDFLLBr/1KgTvrUIedfR2ZK/tCpccFkMFzth8etmbt2Ri
         oqzbzrX2a3Etu0sF6mVEE/18ravCVKShEmtVsRBbV2DUBnRLDk4a1kUW1Q8FWUoMxrFx
         YyZchR7dAIJEp1ETpD2LhXiSQy/c67NTyQWXaGvHAI/5/1cvd8e/7A4g+8hRoqSKdTcb
         9jNPbaOF70mJAkw1Rw0bGvl0/Sy0zza2t7iLvXPzsykHgE26OvMlOAAdgw1UJu/cgy3N
         YTXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=eFW2sAQKpvZB+twe24GUf8msOwy7m8Sj4Idm4HqiCZM=;
        b=v99CS5C2UbgIpfbIubLcm7KxKa2RL4yjEuyrF6CDtxyNzKuKQEP1b6j/69+e1lgVEm
         81sn/RBYiF6b2mtx71pSFPLJQpYU76RH2UApLvJOvF3Q6Y4EJHDhpvko7CA5busuV97h
         bgMRt9vzHcnbYyD7kwXrI0WxksNYRdhtOtvsEphKwTZNOhFx2yT4bTXmq2aXi77RZj/Y
         5M8MAYqnSi97SXfgBMQuJoAkQP5kMWvHKmz0KkRQhfS57797O5Xap5mSwV/QAoyzUkL4
         mwv8xRZKgdd3Y4QZkTGKZ1agUQ0pza7LHYorQDaHchbFM9NBt2JH4RlviPOMOc62y2nY
         DO4Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ATQq8Qau;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eFW2sAQKpvZB+twe24GUf8msOwy7m8Sj4Idm4HqiCZM=;
        b=QaVLwwmmMal50HO4oXgpJBpUhslGQF+q7AQHmQ6E1x/X4eaVVoWPAqilDBBFWrG5cn
         DDiJuHN0ZI3AWUJ4g+vW6TCiY9UZeWdfUwjT5Il5Q0eb0z6A0f2BTDiNFfFRqQxvhu4C
         TXtM+4NoFc7mjYeSRru1syaZdYR8f688yhwBxjG0t+tJOgE0692hBspzUNFLYCqkciyk
         sg6+o2m6ORKZuNgg5ETWhg/i5k6MBPEFpOrJ0YEkYrbaC9h+V+m6t/hNOOcEtWqJgQF2
         QMUg0hgRAWTMXjozQ48dBOkyQX1T/T07dyp+h6fZ6B3HE7BKc98VxVkHTjCIF7t8kz61
         ZO9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=eFW2sAQKpvZB+twe24GUf8msOwy7m8Sj4Idm4HqiCZM=;
        b=LFZEyWchjzcRaWN++MGqQQCHOjkoFMH4jseXrjY0XqiwAY3oZmkTfUVlgC9FubcAO0
         cxnctMKEt5yzfbqWltGJlzREyizgICDEvpjLhuAQUVNoTCjm0Hj3mLRnKNHvt6diSfRs
         OvAZqG2z1T0O3z33ZGpUaxOoVoweIkekna5wxtJS/HoAQoqbkkXmYpbkBQMuz/aGrkP1
         us1NpohirQ68MoHSZtzf5KM+rDCT/JFasfGVpZ4VqLLyQZMy13PeaQI+bXUNHae5+0/y
         oYmrIJyLsrB5ZYnv3Psg7vTQ9fHyGTHPr+7MST37BBIWWfJLq6vAZpjHeFtZdEQlkxux
         jj2Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532KQ1rq+Lrs788GaBm1MH3h7b5GdboRponFOlKBaeRsjEO4Njcf
	EKyFDVpMi5BZY9szy42jmkk=
X-Google-Smtp-Source: ABdhPJz312DvFlPLm7aAtpjZXOgtycX8T2ls8nfdM+xT17XSNey8AaBjOnYBVCg4uPcnKnPhBpQrng==
X-Received: by 2002:a65:6704:: with SMTP id u4mr9734723pgf.125.1591943400020;
        Thu, 11 Jun 2020 23:30:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:6845:: with SMTP id f5ls1711699pln.8.gmail; Thu, 11
 Jun 2020 23:29:59 -0700 (PDT)
X-Received: by 2002:a17:90b:949:: with SMTP id dw9mr11950017pjb.101.1591943399307;
        Thu, 11 Jun 2020 23:29:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591943399; cv=none;
        d=google.com; s=arc-20160816;
        b=jyJo2gMNpOnWDCO28inH2uDQRk86erXXnnmuz+PtoygcAXzqvt0AHqFquQbHaBt6J/
         QILSbcjydfSEqOqgrVKVClWo3KVtyWARDcgn/bJjUtt23ECEDKsnIbbUEiFNgdgYmIsO
         eVtExGvZWAn9hfYDPiC979tcNEj+iUVMy7e+DYft1re/rvWDnvrG2bsTbJhKB0xRqpMz
         6FfIZNThSxJ5FSB63v+0PHh8DjtDqzBFQNWCeMs+OKbqPLfDqS7wC/9OUei/tvmrrLnC
         eGcYNISdmV9uVNUhfoOEg/q0I8OeNKKB63jtX1PfvNUfwh7H7tka2ezVC7UsA+3+hMRi
         /V9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ZUnoe7LisTBuIk3jQU0y5oVBSeJ7GgOs6SqAcqYQM40=;
        b=iXGiTc9/tQCRh/vBHwFpwDrzOzN3q31ERfI367JMkjZWZYbDp/LpBHU7KahJqgOaYh
         6uAzoC3doiY01EFt9PMdTkis/AsChyk3mOpFzkoHtd8wWrgeNel1C3N/aQQmxbQ8hrt9
         0a/JW14cuwJRHL1gbXa37WO6SxBO78SUY0oNm0cV+uGg3ngVSeYP5LqMGNhnBD3yITkk
         uw2fFU8oilhUk37E7EP8C+zlXxSaVC0sEgSupstUk+OTzbG4Lzpa+YCgw1jkNuFIQ270
         OqlB0z17+OzOintHigiOmj3ibZBVSWvTbNU35w/c/n0rH7lWnYjpRNwNYMNKRwfpDatT
         HybA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=ATQq8Qau;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-2.smtp.github.com (out-2.smtp.github.com. [192.30.252.193])
        by gmr-mx.google.com with ESMTPS id t23si402040plr.4.2020.06.11.23.29.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 23:29:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.193 as permitted sender) client-ip=192.30.252.193;
Received: from github-lowworker-1b8c660.ash1-iad.github.net (github-lowworker-1b8c660.ash1-iad.github.net [10.56.18.59])
	by smtp.github.com (Postfix) with ESMTP id A56161C0721
	for <jailhouse-dev@googlegroups.com>; Thu, 11 Jun 2020 23:29:58 -0700 (PDT)
Date: Thu, 11 Jun 2020 23:29:58 -0700
From: Nikhil Devshatwar <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/next/af4b5d-870771@github.com>
Subject: [siemens/jailhouse] de9cbc: configs: dts: inmate-k3-j721e-evm: Add
 pinmux for ...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=ATQq8Qau;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.193 as
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
  Commit: de9cbc0864a87d603948d0bd3cfffa47caef4c9f
      https://github.com/siemens/jailhouse/commit/de9cbc0864a87d603948d0bd3cfffa47caef4c9f
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts

  Log Message:
  -----------
  configs: dts: inmate-k3-j721e-evm: Add pinmux for main_uart1

Add a pinmux DT node for main_uart1.
Describe the pinctrl default state for main_uart1 node.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 23e86fd68dc9b79048038f90ee80838896ce0476
      https://github.com/siemens/jailhouse/commit/23e86fd68dc9b79048038f90ee80838896ce0476
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-linux-demo: Add USB mem_regions

Define the jailhouse_memory regions for the USB toplevel MMRs
This fixes the crash when inmate cell tries to
access the USB devices.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ca62febb7da14bca08de48026c9e553697c68a4b
      https://github.com/siemens/jailhouse/commit/ca62febb7da14bca08de48026c9e553697c68a4b
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-linux-demo: Remove unsupported device partitioning

In kernel 5.4, support for following is not available:
* D5520 decoder
* GPU virtualization
* DSS display virtualization
Remove these from cell config

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8419b7fb9b35574e68a072cf6844d950747f32ba
      https://github.com/siemens/jailhouse/commit/8419b7fb9b35574e68a072cf6844d950747f32ba
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  include: cell-config: Add new macros for 64K aigned BAR

When working with a kernel using 64k page sizes, the BARs
used for enumerating the IVSHMEM PCIe device should be
aligned with 64k page size.

Add new macros which describe 64k aligned BAR sizes.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 990669e951f91ed08b1d29f5d80b021d3d9c0569
      https://github.com/siemens/jailhouse/commit/990669e951f91ed08b1d29f5d80b021d3d9c0569
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M driver/pci.c

  Log Message:
  -----------
  driver: pci: Use page size to set the aperture size

PCIe host controller is added by jailhouse kernel module via
an overlay. The aperture size is currently set to 2 pages
assuming 4kb page size.

Update to use the PAGE_SIZE macro so as to work with kernels
where page size is configured for 64kb.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9791e638153c36aaab002e51424de6f3123c654a
      https://github.com/siemens/jailhouse/commit/9791e638153c36aaab002e51424de6f3123c654a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/dts/inmate-k3-j721e-evm.dts

  Log Message:
  -----------
  configs: dts: inmate-k3-j721e: Increase range for PCIe aperture

Increase the aperture size in the IVSHMEM PCIe virtual
controller to with the 64k sized BARs.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 64eb491715d6fc838cfd97213c53e979af3d2fbb
      https://github.com/siemens/jailhouse/commit/64eb491715d6fc838cfd97213c53e979af3d2fbb
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Add IVSHMEM demo device

Add a new IVSHMEM PCIe virtual device for a 2 peer
IVSHMEM demo communication.
 (0 = root cell, 1 = baremetal / linux-demo)
Also add the corresponding memory regions for state and output
aligned at 64k boundary.

Update the bdf numbers for consistency across all platforms.
Assign domain = 4 since the platform already has 4 physical
controllers.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 120cf7cb17a97f8dac3a860bc54173ff15d46471
      https://github.com/siemens/jailhouse/commit/120cf7cb17a97f8dac3a860bc54173ff15d46471
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c

  Log Message:
  -----------
  configs: k3-j721e-evm-inmate-demo: Add ivshmem capability

Add a virtual PCI device with IVSHMEM type (id = 1)
Create IVSHMEM regions for 2 peer communication
Enable the vpci_irq for doorbell interrupt

This allows to run the ivshmem-demo baremetal inmate
inside this cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a2b5f3862cd84f2f25346ae6be28eef72b7d88c0
      https://github.com/siemens/jailhouse/commit/a2b5f3862cd84f2f25346ae6be28eef72b7d88c0
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Map memory regions with correct sizes

ivshmem protocol does not describe a fixed size for the
rw, input and output regions. For each platform, the uio
driver will populate this information in the sysfs.

Extract the size from sysfs maps entries and use it for
mapping different regions.
This will make the demo generic such that it will work on
all platforms with different sizes for ivshmem.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: be209599f8b8ec2fa63b16aabca693cba5975112
      https://github.com/siemens/jailhouse/commit/be209599f8b8ec2fa63b16aabca693cba5975112
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Adjust selection of interrupt target

Number of peers available on a platform is different.
Ideally, any peer should be able to communicate with
any other peer. By default, all demos send interrupt to
the next peer in a ring fashion.

Add support for passing a command line parameter to specify
exact peer to send interrupt to. Furthermore, avoid using a
hard-coded max-peers value for the default target selection.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
[Jan: fix register access, print max-peers, massage commit log]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b527a702b87f49dfa85a867c98fe273184b54c0f
      https://github.com/siemens/jailhouse/commit/b527a702b87f49dfa85a867c98fe273184b54c0f
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M inmates/demos/ivshmem-demo.c

  Log Message:
  -----------
  inmates: ivshmem-demo: Parse target from cmdline

Generalize the ivshmem-demo to work on different platforms
with different number of peers and ability to send interrupt
to any peer.

By default, the demo sends interrupt to next peer in a ring fashion.
Optionally, allow to specify the target peer from commandline.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8707714bd3d137859658d598c5e941a3064f3c2a
      https://github.com/siemens/jailhouse/commit/8707714bd3d137859658d598c5e941a3064f3c2a
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-06-12 (Fri, 12 Jun 2020)

  Changed paths:
    M configs/arm64/k3-j721e-evm-inmate-demo.c
    M configs/arm64/k3-j721e-evm-linux-demo.c
    M configs/arm64/k3-j721e-evm.c

  Log Message:
  -----------
  configs: k3-j721e-evm: Fix memory overlaps

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/af4b5d431a51...8707714bd3d1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/next/af4b5d-870771%40github.com.
