Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBXE753VAKGQEEU63ICY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc3e.google.com (mail-yw1-xc3e.google.com [IPv6:2607:f8b0:4864:20::c3e])
	by mail.lfdr.de (Postfix) with ESMTPS id A3EE195729
	for <lists+jailhouse-dev@lfdr.de>; Tue, 20 Aug 2019 08:14:53 +0200 (CEST)
Received: by mail-yw1-xc3e.google.com with SMTP id l22sf5081532ywa.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 23:14:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566281692; cv=pass;
        d=google.com; s=arc-20160816;
        b=mpkxaHajRs/+snW9K598RrivQPiPLLTayHRDh+p2JdpkTCe2Zaq/Z9qmbyuY9+MF8M
         3juKAtj6gzHkQtv8DxxJlP+wgyFUrmzXvMXjyuZIYT3T4NjNmsa3+l7ODIynobLmH3v9
         kA7mczgi4WurQKBENR1vn+lgSoUhrLax0CIMKJEy90J7cXzkPuBMJdIkGJl0cBlozmod
         5ZoCfZKuf3AGytkgq7dFRYHh9jvFvkZkAy2tjnQGes7ILmnETxvfTLn/nBtpdxyfqfBa
         9NKgbHAAlstCnEuaCOBob6O9kL0aC0DK9yZ7sKyxcjCzjigfqme408E92lcy+FmEuVgL
         HAAg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=YYajiG8o53UXLHI8dxeorakFJ1Rl8GlJO9tIOSNIxXQ=;
        b=xEoiJ2HOHBpejBO3qK1c3JEq4wVVCt3tYgtdTUEeIz5WO7rWsQ84/S9vMlRy342gaR
         ojXE9+B8FIKTZ3Oodm6L1gbpN0tXD5utIW1ZpMbPvOJVbClwa3TEa60IXncWQyyjGuK2
         5z8kmwzMppXNPTJAXxl6YVkkJB83ytNFpMkIfAIk0uyJfhPbRzePIn3ufxdGbYO3XEIV
         gNfat754kaPxreLJDHcmx/C5tQiGk79Vg1OWkrcHKSiZXZB+Z2D1iR0Ih7+8kP/Kk93G
         tcQKvJSax8W8cWDFo7sSNNYK+Mc1wKiXP60mrz/BobAz8XZOycUBS/+dcgu4QXzCy8WM
         d5GA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m1scdHnZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=YYajiG8o53UXLHI8dxeorakFJ1Rl8GlJO9tIOSNIxXQ=;
        b=razc+Mw/6MOVl2hlHBPJ5oFkZxbA4DaMLSfedMJTmAjg+eDWVfzH3jZUf+JvO/FFmz
         Y+oxzTFdfm6XgW2jyz0MxKOH9Db55Zp9XEDTk5PxhfkuK4s86r08JWMWv14Ed673pCpv
         sa3NA7RC8Cr0vqlFp119QE/zkiyVujanX6ps6oGusZtggUS4xqPAL1yHXKGeFLMkLfaO
         c+JUAHe4HEswHs91hrZE1X6NOf0v8+2p+0S7GNY0gD0pfYaEFa3LX/l2uRFfncN6ZX50
         APGGMExYyyKMJJNZetVYIVSIwj7eDjYWKhUMcvlzlaolmTLa4uPleW/EFpr8n7leEz9H
         iyRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=YYajiG8o53UXLHI8dxeorakFJ1Rl8GlJO9tIOSNIxXQ=;
        b=bIvXm05vtxBMlkqXLgLkJq6Gu7AcN+UhiOxs7OP+hwoFhelMwLmz3I1bWYv0BGYaDl
         sJKGlBGC4w2CwBCCS6H3r3mkPl6CyvllFQOWlka3VYGmOnUkPBaySWktEZQvis5H+2af
         e/cWu5l3B5TdT+OM3FjHVK3mwRwe2by8Aplf+ug1UaUbBz0WRbKgfn8MpucFAOhdd728
         K8+BgKPvU6rV8B4BlRNUvt+vfC/nQtdYxbyOOEyXCgJQlGGydTt7ACTlixsOr8gJJEoe
         9HLPo7ObO2tk8uSkkoR0P0zVHBvBBn45e6yXv8q4FIxDGHx8L9IZF//bxkJdqaze2ILw
         FWjg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXGPttYMHotOfbYqyYCCGC6hl66ho+VkadTRxTh8VXRE/rDWiT1
	EuPlSMUdylSv0PYDVHoMyUE=
X-Google-Smtp-Source: APXvYqxGyVh/4s/kGQdF6E8Lyyrc/RfC29BW4XBnnw6nEXz7Ccv4t8kv9VuW/9mgbdC01ijiOmHUeQ==
X-Received: by 2002:a0d:c5c6:: with SMTP id h189mr18488348ywd.274.1566281692583;
        Mon, 19 Aug 2019 23:14:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:bfc4:: with SMTP id q4ls2963794ybm.4.gmail; Mon, 19 Aug
 2019 23:14:51 -0700 (PDT)
X-Received: by 2002:a25:340c:: with SMTP id b12mr19535019yba.190.1566281691948;
        Mon, 19 Aug 2019 23:14:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566281691; cv=none;
        d=google.com; s=arc-20160816;
        b=ZBYCZI8RaX9ExTwUfeOVRa4wgTx57h7aq6ZzoyBQLvnRdnQJTf0ACQILUFFZSetJZ/
         6VcoJ925ZLk2aseeDtS4SQIc/O6S59AbcSOynqG5w5CDb9pX9eF9t1fWV5sp8Pseh6HH
         r9pK1FiwZYN+OoxnHK3fvjDZG+FWqgKIQysQJNrAxiYB04KKDg1rLH3FCAIC5G2Va9ac
         D1urO4+5WZZCg/DiNQ/0wLPLzGEcUaxb0U8/uj7/CPCQUwZB8+3g3Nf3m4QFh30WpZ9M
         uImtvUOkITolLBUzAEDDLHhvQdyg5eLVNg8WBHDw+T5oBfKVAazaoV8rXHt6pa4sE+F7
         5B8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=omrHNPdYtk19JKzKFG3HL59UjDmPGEdMapFp4QQkheI=;
        b=ChT8/j9aPmDibFxF1sv1mhKh/lSLCPy+zVqcsFSE7Wqy6tSm+j4eTMN3K2QubwlAot
         gFjUTKh372clWcXMKVVzLrsa/BVj5qhmkqR2RFwPCsQWKHkqyvxlFZF2Lk6ygh6V6Yri
         yEoDTfSrAPK3jGlkK9r20jzlSuNHnz62raLP/2beu5aGDws+ARP6jFZ5irCOjKhbQNQK
         tvoKbN2gqvgsJQQPi7RPwD/fSNgWbYkov2/rP8qn1RyEBvbZgxTy4E7VrD+c9O+ue2QV
         yBgHPXut1DEjjyrJS/rW2beD56bWIK8yyhQI4SwNMC0viFP2uVwwb8y/+bLJTBt6vwCo
         PdbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=m1scdHnZ;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-21.smtp.github.com (out-21.smtp.github.com. [192.30.252.204])
        by gmr-mx.google.com with ESMTPS id c76si658134ybf.3.2019.08.19.23.14.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 23:14:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.204 as permitted sender) client-ip=192.30.252.204;
Date: Mon, 19 Aug 2019 23:14:51 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/7c49bb-5c90e8@github.com>
Subject: [siemens/jailhouse] 2c3ccb: core: ivshmem: Use own temporary vendor
 and device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=m1scdHnZ;       spf=pass
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: 2c3ccb9dc08f45fe12ae4cfa1b8dd135c666a0d7
      https://github.com/siemens/jailhouse/commit/2c3ccb9dc08f45fe12ae4cfa1b8dd135c666a0d7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use own temporary vendor and device ID

We deviated too much from the original ivshmem, and we will even more.
Until it's clear where the result will find its home, and in which form,
use an apparently free vendor ID that encodes "JH", and also assign this
ID to the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c1efb7be855539aa7480f9188a14e365d260b40d
      https://github.com/siemens/jailhouse/commit/c1efb7be855539aa7480f9188a14e365d260b40d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M scripts/header_check

  Log Message:
  -----------
  core: Restrict asm/ivshmem.h to inclusion by jailhouse/ivshmem.h

The asm header will gain a dependency on the generic one and, thus,
should no longer be considered for direct inclusion. Adjust the header
check accordingly.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6291b4a5d393f5a7c1a267b77c7256ea3336a6b5
      https://github.com/siemens/jailhouse/commit/6291b4a5d393f5a7c1a267b77c7256ea3336a6b5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Derive MMIO register region size from cell config

The BAR mask encodes the size of a PCI device resource. Use this to
allow a target-dependent setting via the cell configuration so that
alignment to the cell's page size become feasible. This will enable the
cell OS to map the MMIO region as a whole into user space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9bc427df1969e62700e402a523fc630937eb5267
      https://github.com/siemens/jailhouse/commit/9bc427df1969e62700e402a523fc630937eb5267
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 07f187fdf38444b34ca9d9d1fe57976dfd395b80
      https://github.com/siemens/jailhouse/commit/07f187fdf38444b34ca9d9d1fe57976dfd395b80
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Convert MMIO register region to 4K and 32-bit

Page-alignment is required so that the cell OS can map the region as a
whole to its user space. If a cell may use larger minimal page sizes,
the mask for BAR 0 has to be adjusted accordingly. For now we assume all
are on 4K.

While at it, reduce the MMIO region to 32-bit which saves one BAR.
64-bit was needlessly wasteful.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e782ca14e856a038ba8b293b10ed310597355d4c
      https://github.com/siemens/jailhouse/commit/e782ca14e856a038ba8b293b10ed310597355d4c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Move MSI-X region into 32-bit BAR1

Compact the BAR usage and also reduce the MSI-X region to 32-bit again -
there is no need for 64-bit.

As both the MMIO register and the MSI-X region are now 32-bit, convert
their internal representation in ivshmem_endpoint to an u32 array.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7727d55f1b1a5977cd2234a5a8b3bd08b5b90e7a
      https://github.com/siemens/jailhouse/commit/7727d55f1b1a5977cd2234a5a8b3bd08b5b90e7a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Move shared memory parameters into vendor specific capability

This gives us more flexibility in extending the parameters we expose via
the config space. The capability is already layed out to leave holes for
upcoming extensions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f47d12eadd399094fbea28953825c81550fb5d68
      https://github.com/siemens/jailhouse/commit/f47d12eadd399094fbea28953825c81550fb5d68
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 487fc057128db52b15d003786fc0293dfcab9878
      https://github.com/siemens/jailhouse/commit/487fc057128db52b15d003786fc0293dfcab9878
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f6e46e350dfa1fa890150699838ecf9d4c8753af
      https://github.com/siemens/jailhouse/commit/f6e46e350dfa1fa890150699838ecf9d4c8753af
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fb78196e8b068621d0020ce26bc83daae1d4d9d0
      https://github.com/siemens/jailhouse/commit/fb78196e8b068621d0020ce26bc83daae1d4d9d0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add FEATURES register

This register makes features of the ivshmem device discoverable for the
guest. So far, only bit 0 is defined and always set in the Jailhouse
implementation. It signals that all peers find the shared memory region
at the same guest physical address.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a9e7bde4751f6240ecd044fdb37270f35e482018
      https://github.com/siemens/jailhouse/commit/a9e7bde4751f6240ecd044fdb37270f35e482018
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add field for shmem device ID

This allows to set a stable ID that is independent of the cell creation
ordering. Such stability will be needed when when defining ID-dependent
unidirectional shared memory regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bb1eae02079d27519b109c2dc870f12fbbb920bb
      https://github.com/siemens/jailhouse/commit/bb1eae02079d27519b109c2dc870f12fbbb920bb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c7a7aebdf8871a960e7a8070b21c8ba17ff5c088
      https://github.com/siemens/jailhouse/commit/c7a7aebdf8871a960e7a8070b21c8ba17ff5c088
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add PCI-conforming INTx mask

Simple enough to add, and newer PCI specs demand this feature anyway:
allow to mask the INTx line via the command register.

For this purpose, factor out ivshmem_update_intx that determines the
state of the line prior to calling arch_ivshmem_update_intx. It also
skips over this call in case num_msix_vectors is non-null, offloading
this check from the arch function. Furthermore, move the calculation if
INTx is enabled and unmasked into that generic ivshmem_update_intx as
well.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 48d8e573ffda667114f94e288226142d04178894
      https://github.com/siemens/jailhouse/commit/48d8e573ffda667114f94e288226142d04178894
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4fdb13cab7162a3f110091f6665b293b93a3369b
      https://github.com/siemens/jailhouse/commit/4fdb13cab7162a3f110091f6665b293b93a3369b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c
    M hypervisor/pci.c

  Log Message:
  -----------
  core: ivshmem: Reintroduce ivshmem_update_msix

This function consolidates the check for num_msix_vectors > 0 and
ivshmem_is_msix_masked, leaving arch_ivshmem_update_msix with less work.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 393457f49fda3227157711191e5c8cb685fdfb38
      https://github.com/siemens/jailhouse/commit/393457f49fda3227157711191e5c8cb685fdfb38
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/pci.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Fold ivshmem_write_msix_control into caller

Using pci_msix_registers to model the update of the MSI-X control
register does not really simplify the code. Rather use a plain mask that
contains all modifiable bits, PCI_MSIX_CTRL_RW_MASK, and perform the
update in ivshmem_pci_cfg_write directly, analogously to the vendor
capability.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9394ec53bb163c77dbee8d1ccc46e40c9d513e41
      https://github.com/siemens/jailhouse/commit/9394ec53bb163c77dbee8d1ccc46e40c9d513e41
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d59c3d8d9c9e42bfd918aa07e394e4672a3a323d
      https://github.com/siemens/jailhouse/commit/d59c3d8d9c9e42bfd918aa07e394e4672a3a323d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6df0f89795129061f7224202bd5f5b8bd0786ec6
      https://github.com/siemens/jailhouse/commit/6df0f89795129061f7224202bd5f5b8bd0786ec6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1e173320b16d280ad54dca764c9d0845ef098468
      https://github.com/siemens/jailhouse/commit/1e173320b16d280ad54dca764c9d0845ef098468
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 2cc7775f8f641df9ecd1e74ed0b31d21e060aedc
      https://github.com/siemens/jailhouse/commit/2cc7775f8f641df9ecd1e74ed0b31d21e060aedc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core, configs: ivshmem: Add state table

Replace the register-based remote state read-back with a state table
that is located in read-only shared memory. Every peer has an entry in
this table. The entry position is based on the ID. This way, all peers
can read the other's state without causing a VM exit.

The state table is located at the beginning of the share memory region.
Its mapping size can retrieved via a register in the the vendor cap.

The cell config format for PCI devices is extended: shmem_region becomes
shmem_regions_start, pointing to two memory regions now, the read-only
state table and the read/write shared memory. The two memory regions
must be consecutive because the size of the first one is used by ivshmem
drivers to derive the offset of the second one.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 662939ed2e43eaa8e37037ec94eac2202de2cadd
      https://github.com/siemens/jailhouse/commit/662939ed2e43eaa8e37037ec94eac2202de2cadd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rework interrupt configuration and injection

Revamp data structure, updating and locking around ivshmem interrupt
injection.

The structure arch_pci_ivshmem is renamed to arch_ivshmem_irq_cache to
clarify the purpose of this. This allows to invalidate the case
generically by setting it to 0.

The remote_lock is redefined as irq_lock, now protecting cache update
and usage as well as serializing updates with injections. We do not need
a lock around ivshmem_endpoint::remote updates because the pointer will
never reference an object that is no longer existing after removal.
Instead, the update of irq_cache while holding irq_lock now acts as
barrier.

Furthermore, ensure irq_cache invalidation on device reset. Not
performing that step so far could have caused bogus interrupt delivery
between cell reset and ivshmem device re-initialization.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4577455dc800acbe8fc51530b248172bc2a24b53
      https://github.com/siemens/jailhouse/commit/4577455dc800acbe8fc51530b248172bc2a24b53
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ef503f99210abcf028457d8feb8f59febbfc360d
      https://github.com/siemens/jailhouse/commit/ef503f99210abcf028457d8feb8f59febbfc360d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Switch to ivshmem_endpoint as parameter of arch_ivshmem_update_msix

For the sake of consistency: ivshmem-internal functions should use the
ivshmem_endpoint, external ones pci_device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 29c3121b71434a9aa31f48239fb3a2b482520d8e
      https://github.com/siemens/jailhouse/commit/29c3121b71434a9aa31f48239fb3a2b482520d8e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add support for multiple interrupt vectors

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a03c5b7eb67e4a4936ffadb8b36d860f791de77f
      https://github.com/siemens/jailhouse/commit/a03c5b7eb67e4a4936ffadb8b36d860f791de77f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: Expand number of ivshmem vectors

The network devices have a use case for up to 3 (config, rx, tx). And
the user-defined ones should get the maximum supported, i.e. 16.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fd2b508981f3f4d85c5eff1f86d4144450e07d3b
      https://github.com/siemens/jailhouse/commit/fd2b508981f3f4d85c5eff1f86d4144450e07d3b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0f26e6a9c68de4f8973448e3da8140f1074c0045
      https://github.com/siemens/jailhouse/commit/0f26e6a9c68de4f8973448e3da8140f1074c0045
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add one-shot interrupt mode

Add a control flag to the vendor capability that allows to switch
interrupt delivery into a one-shot mode: If enabled, the interrupt
control register is reset after each delivery.

This feature is useful for guests that want to throttle the delivery of
ivshmem interrupts to unprivileged users. The most prominent example is
the UIO framework of Linux. It receives interrupts of UIO devices in the
kernel on behalf of the user process, disables further events and
signals the arrival to the process. That one has to re-enable interrupts
in the device. Thus, it's scheduling naturally throttles the interrupt
arrival rate. With ivshmem, this procedure requires two VM exits per
interrupts when only using the related control register. With the
one-shot mode, one exit can be avoided.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 57109d68d3e6d06c18b016eb684661f59114865c
      https://github.com/siemens/jailhouse/commit/57109d68d3e6d06c18b016eb684661f59114865c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Add unidirectional shared memory support

This adds optional peer-specific output sections to the shared memory
region. Each peer will get its own read/write section that other peers
can only read from. The benefit of such model is that senders can be
sure their messages cannot be concurrently modified by other peers while
they are creating and before they may have signed them. Having a
private section avoids having to copy in complete messages in integrity
sensitive scenarios.

These output sections are located after the common read/write section.
Their presence is signaled by non-zero value in the output section size
register.

Consequently, all configs need to append two memory regions per ivshmem
device. We switch all ivshmem-net users to this unidirectional model,
setting their common read/write section to zero.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0da15c1fffc0aebe885f371a97e9d73ea74be95b
      https://github.com/siemens/jailhouse/commit/0da15c1fffc0aebe885f371a97e9d73ea74be95b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/arm/bananapi-linux-demo.c
    M configs/arm/bananapi.c
    M configs/arm/emtrion-rzg1e-linux-demo.c
    M configs/arm/emtrion-rzg1e.c
    M configs/arm/emtrion-rzg1h-linux-demo.c
    M configs/arm/emtrion-rzg1h.c
    M configs/arm/emtrion-rzg1m-linux-demo.c
    M configs/arm/emtrion-rzg1m.c
    M configs/arm/jetson-tk1-linux-demo.c
    M configs/arm/jetson-tk1.c
    M configs/arm/orangepi0-linux-demo.c
    M configs/arm/orangepi0.c
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/arm64/espressobin-linux-demo.c
    M configs/arm64/espressobin.c
    M configs/arm64/hikey-linux-demo.c
    M configs/arm64/hikey.c
    M configs/arm64/jetson-tx1-linux-demo.c
    M configs/arm64/jetson-tx1.c
    M configs/arm64/k3-am654-idk-linux-demo.c
    M configs/arm64/k3-am654-idk.c
    M configs/arm64/macchiatobin-linux-demo.c
    M configs/arm64/macchiatobin.c
    M configs/arm64/miriac-sbc-ls1046a-linux-demo.c
    M configs/arm64/miriac-sbc-ls1046a.c
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M configs/arm64/ultra96-linux-demo.c
    M configs/arm64/ultra96.c
    M configs/arm64/zynqmp-zcu102-linux-demo-2.c
    M configs/arm64/zynqmp-zcu102-linux-demo.c
    M configs/arm64/zynqmp-zcu102.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core, configs: ivshmem: Add multi-peer support

So far, it seemed restricting our ivshmem implementation to 2 peers
would both simplify it significantly and fulfill the vast majority of
use cases. Both turned out to be wrong assumption.

First of all, there are users with custom protocols that like to set up
a single ivshmem device between, e.g., the root cell and multiple
non-root cells. They would currently have to create one device pair per
link. This overcomes the limitation.

At the same time, the implementation turned out to be rather simple. We
basically just need to broadcast config change interrupts and rework the
bookkeeping so that an ivshmem_link is only destroyed with the last user
disappears. The rest was already refactored to account for multiple
peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 7ca5bdd7cf72b81eabfd4bef5824d0e1e943b8dc
      https://github.com/siemens/jailhouse/commit/7ca5bdd7cf72b81eabfd4bef5824d0e1e943b8dc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add multi-peer ivshmem demo

Add the demo ivshmem device also to the linux-x86-demo and make it
3-peers (root, ivshmem-demo, linux-x86-demo). This allows to test and
demonstrate the new multi-peer feature. For that, we need to move
ivshmem-demo on the 2nd CPU.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: c8de82994c964073a5c107558ea9eb03c88d0b7e
      https://github.com/siemens/jailhouse/commit/c8de82994c964073a5c107558ea9eb03c88d0b7e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  core: ivshmem: Drop revision protocol ID

Drop the possibility to carry ivshmem protocol revision numbers in the
scarce 16-bit space of the protocol ID. Rather force users to either to
revision management inside the protocol (e.g. via shared memory) or use
a new protocol ID in case of incompatible changes - or even avoid such
incompatible changes. This frees more space that we will need when we
want to map virtio device types into this namespace.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 129134684e4bf14ef8a1b2005dc2f86df40b7e1b
      https://github.com/siemens/jailhouse/commit/129134684e4bf14ef8a1b2005dc2f86df40b7e1b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5c90e84609866c00b320ecf68e033a47bdd0c8cc
      https://github.com/siemens/jailhouse/commit/5c90e84609866c00b320ecf68e033a47bdd0c8cc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-08-17 (Sat, 17 Aug 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/7c49bb479bee...5c90e8460986

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/7c49bb-5c90e8%40github.com.
