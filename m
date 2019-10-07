Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQPY5PWAKGQE54R2VEY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33b.google.com (mail-ot1-x33b.google.com [IPv6:2607:f8b0:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 90059CDDB1
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:50:11 +0200 (CEST)
Received: by mail-ot1-x33b.google.com with SMTP id x20sf5383779otk.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:50:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438210; cv=pass;
        d=google.com; s=arc-20160816;
        b=uKbjSNoZK7lpw3siTdvvJyvyI3z0ARBJd3ANp49XB0HE+ISG6FlZFZOCPCE0cZry2v
         KYD0u3JtPonEySUzovC4+t+zDsvCPEJdEkGQqb//LefTD6U0mh25TtYcDGFWLrWRogI2
         drpgrVx0rlQdEatoZIX6CxA7iYUY92z6JEnmlIjoiDVtIofHdcUvzP/Vn+uJCV4iPmHi
         hUjfxT1Y0JAy4+6W3tKV5MzSxYSYEeogodg3tRE7nXzg5vkmnlBdi04TnKYKMtRaEznd
         p0hxBBHXe3mFuqrzUN2hiwNaqzIiumYxZxajawlN6rhRz7KJm6tb265NqKVLYL7aX8F7
         0v6w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=rFeJ3kaDABzDGmk2OCyVPza7E2imCiwINpGMLWGxz24=;
        b=MBnaVQz2IE0dhFbD+fslaFFmvdMC/ivTwSWa8FNH63idlF/Syb7Qd3wuVDwgN9sB5v
         /dfup3kPJ1wHEUHTS6pqVvIFP8IaLL2L64QG1xI8W1FhX6pJWTPfgT3U1mnUSs9SvmA3
         +MoXeYi1xlxsblm1kQO8/xzQiHtPwVmHcKh1iP2u3iiQtz9I+XQXqfvGhC7uHXzy5Nwi
         Ueu8SQv2QoojRoBWIcwdIDz0O/QorlA4Rj7KR96N+T3al9dEIEx4Z2IqPRIGoMzQAvvN
         YMMXXVUzJ+BuFrli/biy9V6JqQs2paB0hZgVn59wbVodvf1YqGzsGKl1S75YPvJC1Wzr
         uoog==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=2XTA5Fct;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rFeJ3kaDABzDGmk2OCyVPza7E2imCiwINpGMLWGxz24=;
        b=r/FGdj3US/Di7yJJOdwP4uFKVlTLGPjcVzG9DG4TQys8CLjjuvT2KssC7WHO1hstUs
         gbCbh4QQiP4qObqpfqbTSdtKwcU/EbpvfZPrvUHbAIDq47xbJdXwv6OaOR+kOfyaoosx
         SgA/tpbzC1HeUodsUrgJLQolqTYG1V8H7VaOsF4yaAaKbNB14b180ER1kwMGTcbvUynF
         8MJYjjX0k9ntwa1PSZHhrY8t+BWWxhgPqnHPbx30qLtYyp6i4DWEpHVSvqipAhPv6jFZ
         J7iUOfOXKPyvv0BvQn8bP1j7eb3dEc2TrpCwB1Cw2Hd444WIJGmCFwp8j1XKXgvLtx/W
         n3wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=rFeJ3kaDABzDGmk2OCyVPza7E2imCiwINpGMLWGxz24=;
        b=QUrcl0Udgbwy2sPssbd+SQ5EzN6P/vVD44i543UR7Ii/oaVI/xdkH6833nS6mJx9aY
         lJcOQmELn0n9jyRSKV915BJKfgXRv5jScNRSmAvvMVRU/H3S0POPWhUcf+NppvsUrSc1
         o3e6Y6mv11wkWwNpbEILkJL98SvIlAMfAvqxk5ZY2qyEN/FeAIvpTj3iwnmyW8094+aS
         lZ6woLVkn9keUXY9hG/CFOcamT6q1wcykGzOXz5qVqLjulZnDn4oMlPhwzX4XhwMXvmr
         vkIpk/grQss1mA2Aj7Ayr1WGqb9ieL1vj0uelmScIWwzJcEKcfky7sU7w5MHk8/e79cv
         ey+g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVBqAIbHy4YQWmi5xZtnocbdqHob7RB1CS597j4/1HaRdpUQ/Em
	t4AqzKcFCGCMA6RVI09Zfa0=
X-Google-Smtp-Source: APXvYqzQJncIrGdhFW/Xv588GcnyduTc7EYxH/RFha5mUyAaDZgss8cU0aQQTq9cEiuXSBoq/Ezpuw==
X-Received: by 2002:a05:6830:1d73:: with SMTP id l19mr18893148oti.219.1570438210148;
        Mon, 07 Oct 2019 01:50:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6830:1441:: with SMTP id w1ls2780566otp.7.gmail; Mon, 07
 Oct 2019 01:50:09 -0700 (PDT)
X-Received: by 2002:a05:6830:16da:: with SMTP id l26mr10817285otr.339.1570438209603;
        Mon, 07 Oct 2019 01:50:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438209; cv=none;
        d=google.com; s=arc-20160816;
        b=Gj6JMWHs/QjYDJxn8yhEmT00CLr6sTo+nGaQaWLBV5vRLR+shh89w/wEta4C4l3les
         FrSPp0ELYYrQ/ianEc7T4h3NLBHTTOYDw2piGX5sqPEv6CXlsBkxQVpINMDpYAoLw9ZZ
         x48PDfI/Pl2ObdyIlcvWXzwqBP1qwYUh78oXU7JqDJ8uerHYgLbldc6+8X5akX1i1CLK
         vk6D/pTbMWMIY6Tbp2l/huCWbvl6IqDTean6hFDWYVKtZ78lUYRcrNIfITrFfX5VfkR6
         yXVzbpF6mmCaeiLam3rnnYYM3iRI7D2z4+0h3CPODuGubPN5VVrHw93pnGoOsoAEKOpD
         DN9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=TKu1EyX9KhvAMU0qGl51Y3f6u4UrtmPdD0LifVuXvsg=;
        b=QSsWZkhPwtanhCvo4K6Wd/l6AWJdm7rqFvsMgxwNVL0ArPaJzQMvZIYxKe2Mxf3ysZ
         h+gSVNKNEyQjKNj2+l0tZy/GXLWqg2Ex8jqs/2UYs6F9+3dAqntq13swDwvIRIcVcRb1
         QMFcLDY1rp7E3b+gG42bHya6EIfOajBcq+wqR6JGlIfYuFKmes/dh9XbpPp+jiiddQfD
         /3rVfvig+GZIcHg/DLc+hIrRkpz2BP30m+zoI22mKI7VPXcb+66PiKvghVupqmW1q7wW
         ulJXNS3eIm2iP4x1uTl9yVAV11nT31Ddxz7OV7aaOHJV2kOzy4NGz6Es+dyYp6HchZ2O
         FbMg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=2XTA5Fct;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-1.smtp.github.com (out-1.smtp.github.com. [192.30.252.192])
        by gmr-mx.google.com with ESMTPS id w205si560253oib.2.2019.10.07.01.50.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:50:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.192 as permitted sender) client-ip=192.30.252.192;
Date: Mon, 07 Oct 2019 01:50:09 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/421840-a53853@github.com>
Subject: [siemens/jailhouse] 3de5cb: core: ivshmem: Use own temporary vendor
 and device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=2XTA5Fct;       spf=pass
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

  Branch: refs/heads/wip/ivshmem2
  Home:   https://github.com/siemens/jailhouse
  Commit: 3de5cb01a075e4965d7317f5d6e1d880a5da45af
      https://github.com/siemens/jailhouse/commit/3de5cb01a075e4965d7317f5d6e1d880a5da45af
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 7901d08d0a4d8747abeed6b3b91b8328d4c71a93
      https://github.com/siemens/jailhouse/commit/7901d08d0a4d8747abeed6b3b91b8328d4c71a93
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: aee22897d4cb7e7fbcdcffd8bf65eee7a430c635
      https://github.com/siemens/jailhouse/commit/aee22897d4cb7e7fbcdcffd8bf65eee7a430c635
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: a9e1f8cdf8feb0280a5471ca39a54f4adccf6d4e
      https://github.com/siemens/jailhouse/commit/a9e1f8cdf8feb0280a5471ca39a54f4adccf6d4e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d21a961be1625049e28484cb0074534266953d19
      https://github.com/siemens/jailhouse/commit/d21a961be1625049e28484cb0074534266953d19
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 49e655a6a9576a9db969b616d6f074ab4cee03aa
      https://github.com/siemens/jailhouse/commit/49e655a6a9576a9db969b616d6f074ab4cee03aa
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 8b278f9017483175e94e7407430d0e8a8aadbed2
      https://github.com/siemens/jailhouse/commit/8b278f9017483175e94e7407430d0e8a8aadbed2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: a2ce3a905559ab89c43b57844d6a5482cd4cb205
      https://github.com/siemens/jailhouse/commit/a2ce3a905559ab89c43b57844d6a5482cd4cb205
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6fb7f22b522faf7e66e1fd7a7f02bc0ba29560de
      https://github.com/siemens/jailhouse/commit/6fb7f22b522faf7e66e1fd7a7f02bc0ba29560de
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: cb9fa661caf6cdaa01c307440f4410438f5116e5
      https://github.com/siemens/jailhouse/commit/cb9fa661caf6cdaa01c307440f4410438f5116e5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 6195b54ba0d1cb117ab4e900e61e631dad17de6c
      https://github.com/siemens/jailhouse/commit/6195b54ba0d1cb117ab4e900e61e631dad17de6c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 8bb52764bcc810f03089bd758296948fed006a6d
      https://github.com/siemens/jailhouse/commit/8bb52764bcc810f03089bd758296948fed006a6d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 763dc599f7936d94722c1ecb8d94617871463486
      https://github.com/siemens/jailhouse/commit/763dc599f7936d94722c1ecb8d94617871463486
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 30a221a22c9306483891069eeef39b45584dc4cb
      https://github.com/siemens/jailhouse/commit/30a221a22c9306483891069eeef39b45584dc4cb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: d200398ece0174df4a66bba8012c1b711051b9fd
      https://github.com/siemens/jailhouse/commit/d200398ece0174df4a66bba8012c1b711051b9fd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 0e723f5f243d04f6afe30c59fbfe73532f2f2843
      https://github.com/siemens/jailhouse/commit/0e723f5f243d04f6afe30c59fbfe73532f2f2843
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: a26a258d11f90b799addf521bc93b91e049743d5
      https://github.com/siemens/jailhouse/commit/a26a258d11f90b799addf521bc93b91e049743d5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: a7ad1693b995838cb96f050696e42c051a263121
      https://github.com/siemens/jailhouse/commit/a7ad1693b995838cb96f050696e42c051a263121
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 266412e2d27b941e10ea5380458982fb377957c6
      https://github.com/siemens/jailhouse/commit/266412e2d27b941e10ea5380458982fb377957c6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3940f0720a07ca1e8b5800638050ba57a971fa71
      https://github.com/siemens/jailhouse/commit/3940f0720a07ca1e8b5800638050ba57a971fa71
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9bb6e670c5eb3c25a820c26823732ee7a8b12cce
      https://github.com/siemens/jailhouse/commit/9bb6e670c5eb3c25a820c26823732ee7a8b12cce
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 4d4757f8bf7e72f108a62099594be0cb14255f35
      https://github.com/siemens/jailhouse/commit/4d4757f8bf7e72f108a62099594be0cb14255f35
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 5062c68d4593c6432eda003c6a245973377bc86f
      https://github.com/siemens/jailhouse/commit/5062c68d4593c6432eda003c6a245973377bc86f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 7b088f1f76a5f7453266bb44ecd28ea331d2cca5
      https://github.com/siemens/jailhouse/commit/7b088f1f76a5f7453266bb44ecd28ea331d2cca5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 26e67e2fa783ef6c78deda0253fb9b0d653a7807
      https://github.com/siemens/jailhouse/commit/26e67e2fa783ef6c78deda0253fb9b0d653a7807
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: b9d381010871f9056ee9eac4e6c53dc842440d70
      https://github.com/siemens/jailhouse/commit/b9d381010871f9056ee9eac4e6c53dc842440d70
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M configs/arm64/amd-seattle-linux-demo.c
    M configs/arm64/amd-seattle.c
    M configs/x86/ivshmem-demo.c
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c
    M hypervisor/arch/arm-common/include/asm/ivshmem.h
    M hypervisor/arch/arm-common/ivshmem.c
    M hypervisor/arch/x86/include/asm/ivshmem.h
    M hypervisor/arch/x86/ivshmem.c
    M hypervisor/arch/x86/vtd.c
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core, configs: ivshmem: Add support for multiple interrupt vectors

This allows to spread out state-related interrupts (always vector 0) and
other sources (e.g. RX/TX). The doorbell register accepts the desired
vector in its lower 16 bits, ignoring anything that is not supported by
the peers.

The MSI-X MMIO region is expanded to hold the maximum possible number of
vectors (currently 16). This static sizing keeps the hypervisor simple.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e67dd8de7c10ceb86b44d4b58fc7d20de40aee51
      https://github.com/siemens/jailhouse/commit/e67dd8de7c10ceb86b44d4b58fc7d20de40aee51
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: d5902b3c04b4a46f819f1863e004b1cfbff3335f
      https://github.com/siemens/jailhouse/commit/d5902b3c04b4a46f819f1863e004b1cfbff3335f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 58aeae2f60868a500a8eb14d15d090af87794bbf
      https://github.com/siemens/jailhouse/commit/58aeae2f60868a500a8eb14d15d090af87794bbf
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: dc1a07c75b3a515da2552bdb1ec47b076f2ccd97
      https://github.com/siemens/jailhouse/commit/dc1a07c75b3a515da2552bdb1ec47b076f2ccd97
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 19677f01044fb15ac0bdfab6d73c8c0502b1085c
      https://github.com/siemens/jailhouse/commit/19677f01044fb15ac0bdfab6d73c8c0502b1085c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: f7d43bd23ecb2ae438f05a725f3759c440295b8e
      https://github.com/siemens/jailhouse/commit/f7d43bd23ecb2ae438f05a725f3759c440295b8e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 4218cf5ebaa54b835446966b3e3187a99888fc2e
      https://github.com/siemens/jailhouse/commit/4218cf5ebaa54b835446966b3e3187a99888fc2e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

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


  Commit: 2c6d96659adec5e86e564bb8414d3de35b4d07ea
      https://github.com/siemens/jailhouse/commit/2c6d96659adec5e86e564bb8414d3de35b4d07ea
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-05 (Sat, 05 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a53853ee6f545490802dc8fa81a397efcc0e01df
      https://github.com/siemens/jailhouse/commit/a53853ee6f545490802dc8fa81a397efcc0e01df
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-07 (Mon, 07 Oct 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/421840a5eb16...a53853ee6f54

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/421840-a53853%40github.com.
