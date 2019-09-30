Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBRWPY3WAKGQEIICFR5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-io1-xd3b.google.com (mail-io1-xd3b.google.com [IPv6:2607:f8b0:4864:20::d3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 77EC8C1BDF
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Sep 2019 08:59:20 +0200 (CEST)
Received: by mail-io1-xd3b.google.com with SMTP id e14sf28327672iot.16
        for <lists+jailhouse-dev@lfdr.de>; Sun, 29 Sep 2019 23:59:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1569826759; cv=pass;
        d=google.com; s=arc-20160816;
        b=rUpG91duLdeXgYlA08dzV6xRgvDieaKLVjMuqFmCxf0vaFuaEmC4loT+gSi/UUXFLh
         ND5d36VmYUWkugcZ1WeeD1IlQhlajJFc9imQ2ScRJA1Hj3DWroVEPkIJrjlVGsHQdvn+
         y2E75SKp+p6B29qFJ+GU1WKD0D2v/d6q9zUvr0r40S7LOJfpj6J125Yd3RWNsOzINndt
         n6JtuyzxLPCuxBee0KumaX6G/X/qkELhJdoiInhQ5sPIf2+FpYk3BvBf0mSoJlBTIVNN
         lWEScW/U6jLabn10cV44KTmP3hDgVbV0i/esXTu7QzhsNU7D6n0rHGBmIN73KB48GSA0
         4hlA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=tcGQG3w1OJfKOwWR14DOL0DFJmmXaJ/Vee2JJ9E96u4=;
        b=dkDyq3dMkOgMAn4bscNpX+ddi53b9erXqDN+/ySpyIZqbVPLTIum72fn11uarbAbW2
         jmQD5C8pwtBFl/RJCKvQ4iodD8RnFAqyOgYzjfshjwqTxcNm7sJqs6+6vc4bf0BuCAAQ
         osXnJOllvkqzZj2o5ihtV/FNMxOdMhv8GMd9W+CAilzk4LIJiMSEhWxUAD5g2awe+aID
         Xpb1a/xOXFX02SLHvG9kKNNrdbAz/onUCmiOFnPekUj7nrapdYqXJbnx7j0bbfI67hFr
         pLiQlFFd4kY5quF0sP6/wttVQqVQiemEvOcuwsaOohRZ1Riv8Sis7dWqq1De2AtETjEp
         sbzA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tcGQG3w1OJfKOwWR14DOL0DFJmmXaJ/Vee2JJ9E96u4=;
        b=cwnIrUX24eJArtLUZDTrpIfyIo7PBI/hxot2UJIWCRhIns+FQ88RLjtzKZF0fhZ9Q3
         sYQyfelUs+zk0J7wySRyVsQbqTMJSyYVpIZqAHmorO/RwwnO1/5NfaLFgRojGDH2scSB
         07eWhIDRek7rS3ZpHCHIt54ZhsBnBbKR3D5udHctKr6YotISVxrqVH4vwe/FXSCBaKj2
         7VoyseLIAUrZPkUw6xoU9jKtttMKhafu62vCmjxHZm+RJeOC5u0pqRCQaILiGrqD7s9g
         4cmfe1SRSL35W53i5en0eMbnOEBtk9BPAF8C+KN5DbTu4r5Mz4sdl6MSQWbki3pCYnul
         Ac2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tcGQG3w1OJfKOwWR14DOL0DFJmmXaJ/Vee2JJ9E96u4=;
        b=XcFfg2X5y8p5+POodog17GXntdSD6kWuIlJ8sJL9VrPfFwXtwfMPkPjwzZ+jOPzVqL
         u/bRMZmCQBQ01bvIIuYzv2nVdIOHLfdPn9kDwriNRPCzl8oQORfg7F7RPhwDG4xmMYfI
         VM5ZzxkFbN/o1tpYYQr3+LUP8jn6Z5L+uG27c6URg3df9juEkon7Ppuo2IUa4K/YazZa
         J1i42UWg39YP7F7iQNzJJ7Oa/28ep5RBousDXah3lImJUjY64OcQ8MCELgVd8W7o8GnE
         yiNv3dZJX2oYgoiz1lfs7ydYxbvq8Q3sQ6Js2qOKSf/BljvEf6jUN5ps43K3i7eiOa3N
         /Z/w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUxX8Zww5I/mG2E5ndbdL7clpgu24Hhdr+L/E6DJu14S6DyCrjc
	zllXmMbVKSCyAew+ZpihKas=
X-Google-Smtp-Source: APXvYqw5gcl+eZ302h9t+nAsvyPTz0GEltWo9HWUd7FDhmJh7FTrfjs5HdswhSRai6th3csSlKmnGA==
X-Received: by 2002:a5e:9e09:: with SMTP id i9mr18748533ioq.24.1569826759334;
        Sun, 29 Sep 2019 23:59:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:8943:: with SMTP id b3ls2209927iot.10.gmail; Sun, 29 Sep
 2019 23:59:18 -0700 (PDT)
X-Received: by 2002:a5e:c814:: with SMTP id y20mr9820950iol.88.1569826758511;
        Sun, 29 Sep 2019 23:59:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569826758; cv=none;
        d=google.com; s=arc-20160816;
        b=yhtgX/DBhro1ub3UeAp5AY/AbKX55Nz1B0veooo0Ued1c7xWh+tAOzIMrbO+KjgJNo
         HMxW4lom+fjmow32uPZZrPvmuAcuN6pAhUsFJM9Ubk9JxBCMH5VhIoZT7vooe3Y33P6o
         Tb7eN5X0lIhpxbfDEgAZIVqR3ae7t1bYxT9KKJym+Vm7LYthoJH3MmLkGan58CiVWLKV
         QAXj8dfIxjvBS4oCRUteBawW7B47T6b7Yp1t1zMjypwe0mEQdjNfKU0zSYCGYACtdDo9
         45dD4473ubtGWrMsWC9lWbENUN+o0tigngxh7JGEK3agbSSN8xFC+Hh9nSoFTOt0odJw
         UudQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date;
        bh=zHrdUlHXeUkrMJfLxLgYFurr//8eOyehpSOdAJZBkOw=;
        b=ZdJwhIGoypZbWbJM66WWyvIcbff+eItOWTLbgLKnqhba4nq+cJzk/5N4c9iYANXMZA
         zHIapYrWl8SHMhdBpEvOpP79Ma3WtDiJQl9DEqK7thqPUhgR7zeZ9zBUljdQoWvvS80I
         D6JXf4q5AspddGmEgx5rOZJZwteFwCgpB29otQ+WZTWeSrP1Gh1gVk31lQT8YpTQaSwM
         Hm62PKnBz9vJnIIYOCRpeqXF4zWIbuuUMjP+tTkRkkMqgSHPGbVJNiXh4CfkUdmgLEx/
         awfXA2NWughfRpYD+ZGkTu3FI3EGBc3W5k0KYOHLro2yMqExqqMkaeJG1LQDPa+/FLlD
         lOCQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-20.smtp.github.com (out-20.smtp.github.com. [192.30.252.203])
        by gmr-mx.google.com with ESMTPS id x3si613398iom.2.2019.09.29.23.59.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 29 Sep 2019 23:59:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.203 as permitted sender) client-ip=192.30.252.203;
Received: from github-lowworker-cd7bc13.ac4-iad.github.net (github-lowworker-cd7bc13.ac4-iad.github.net [10.52.25.102])
	by smtp.github.com (Postfix) with ESMTP id 0AE778C108F
	for <jailhouse-dev@googlegroups.com>; Sun, 29 Sep 2019 23:59:18 -0700 (PDT)
Date: Sun, 29 Sep 2019 23:59:17 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/5c90e8-597461@github.com>
Subject: [siemens/jailhouse] 12eb7c: core: ivshmem: Use own temporary vendor
 and device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.203 as
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
  Commit: 12eb7c992954f29d11c2ec7d265aee9d784dcf20
      https://github.com/siemens/jailhouse/commit/12eb7c992954f29d11c2ec7d265aee9d784dcf20
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 03ac961b2cb419a1d68ad921a4688f00c72a3d05
      https://github.com/siemens/jailhouse/commit/03ac961b2cb419a1d68ad921a4688f00c72a3d05
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: af1e93d1fae8cff5937dddcc6bb16766e1082c8f
      https://github.com/siemens/jailhouse/commit/af1e93d1fae8cff5937dddcc6bb16766e1082c8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 6729499d53fd6761f9204c3148d9214f2d3973ea
      https://github.com/siemens/jailhouse/commit/6729499d53fd6761f9204c3148d9214f2d3973ea
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: bbe91748e034e0386e969c9c83b7a62a37b2cc60
      https://github.com/siemens/jailhouse/commit/bbe91748e034e0386e969c9c83b7a62a37b2cc60
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 0ba279a190afc006c35b1f538476441b1e6145d2
      https://github.com/siemens/jailhouse/commit/0ba279a190afc006c35b1f538476441b1e6145d2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 045f9ac64b45f270604c58160c9ba6b39abccec0
      https://github.com/siemens/jailhouse/commit/045f9ac64b45f270604c58160c9ba6b39abccec0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 407c6fb44854c29a8084d41b23948ac485910650
      https://github.com/siemens/jailhouse/commit/407c6fb44854c29a8084d41b23948ac485910650
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8ffe2b3519814561acf39ec25101cef5213c0d88
      https://github.com/siemens/jailhouse/commit/8ffe2b3519814561acf39ec25101cef5213c0d88
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 62971c7f7bba9de868924b60d7d8d725ddb82f09
      https://github.com/siemens/jailhouse/commit/62971c7f7bba9de868924b60d7d8d725ddb82f09
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ba9e373c0302aec5b7bbb1cb089f851ccb8949b2
      https://github.com/siemens/jailhouse/commit/ba9e373c0302aec5b7bbb1cb089f851ccb8949b2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: e5a8ebc27ce5dc5d08ccf25f10502ea03f02f199
      https://github.com/siemens/jailhouse/commit/e5a8ebc27ce5dc5d08ccf25f10502ea03f02f199
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: ecf57357efcf810c86c2e5799a705f36e14e4722
      https://github.com/siemens/jailhouse/commit/ecf57357efcf810c86c2e5799a705f36e14e4722
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: eb2dce72deb55d080d33117410735a9b7af9ec16
      https://github.com/siemens/jailhouse/commit/eb2dce72deb55d080d33117410735a9b7af9ec16
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 4a58c0bd530348cc8631d6089c5fb4298cbd3d15
      https://github.com/siemens/jailhouse/commit/4a58c0bd530348cc8631d6089c5fb4298cbd3d15
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: fa9d081c2c27544c143662552911e8ae8b3a56b7
      https://github.com/siemens/jailhouse/commit/fa9d081c2c27544c143662552911e8ae8b3a56b7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 52b96282912a64da0112290a784fadcefe391e61
      https://github.com/siemens/jailhouse/commit/52b96282912a64da0112290a784fadcefe391e61
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: ca1c8a02287cc2029afa733603e09920b5ef2122
      https://github.com/siemens/jailhouse/commit/ca1c8a02287cc2029afa733603e09920b5ef2122
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: d2f034624c86a7ae64cc888920963305cc7ec70e
      https://github.com/siemens/jailhouse/commit/d2f034624c86a7ae64cc888920963305cc7ec70e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9aa09a8e0859e2218fb416ec666bd7ddf7c076a0
      https://github.com/siemens/jailhouse/commit/9aa09a8e0859e2218fb416ec666bd7ddf7c076a0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 191c7a2d411d7e6beb7590ac7e5c7a446f6ae1ba
      https://github.com/siemens/jailhouse/commit/191c7a2d411d7e6beb7590ac7e5c7a446f6ae1ba
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ef93f506e3705378e0066e757374a6c7049b2537
      https://github.com/siemens/jailhouse/commit/ef93f506e3705378e0066e757374a6c7049b2537
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: c4b3993713ac1de0fe82b5a66027aebf6d404766
      https://github.com/siemens/jailhouse/commit/c4b3993713ac1de0fe82b5a66027aebf6d404766
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 5b2166c3dbc6136b5e61e0e65b2b82f8f1612bb7
      https://github.com/siemens/jailhouse/commit/5b2166c3dbc6136b5e61e0e65b2b82f8f1612bb7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 87df315b62f92f273daf41f6e9b96ecbef4cd54f
      https://github.com/siemens/jailhouse/commit/87df315b62f92f273daf41f6e9b96ecbef4cd54f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 88ea261c6a3e66a0e63ee90ea638cb07f59ed770
      https://github.com/siemens/jailhouse/commit/88ea261c6a3e66a0e63ee90ea638cb07f59ed770
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: b181840454f1a246285e4fa54b688d01e9ef0782
      https://github.com/siemens/jailhouse/commit/b181840454f1a246285e4fa54b688d01e9ef0782
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: a5ce85aa5fb17d78acc88f72281ecb03ea2c2e6a
      https://github.com/siemens/jailhouse/commit/a5ce85aa5fb17d78acc88f72281ecb03ea2c2e6a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 52a1f217f6d965b43abb05d497b9adfdbb8f4af9
      https://github.com/siemens/jailhouse/commit/52a1f217f6d965b43abb05d497b9adfdbb8f4af9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 7ea12302036ba49a2ccf24aa992c20e5ef2fef11
      https://github.com/siemens/jailhouse/commit/7ea12302036ba49a2ccf24aa992c20e5ef2fef11
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 0ef2056a0eafb7abb47a0a00ee1da75028f0f5de
      https://github.com/siemens/jailhouse/commit/0ef2056a0eafb7abb47a0a00ee1da75028f0f5de
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: c88f0830816f63339bd9bf70fcbc243de6aef838
      https://github.com/siemens/jailhouse/commit/c88f0830816f63339bd9bf70fcbc243de6aef838
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: 89cd4c91dbf97bb2e4d62ea86eb56640c5265db0
      https://github.com/siemens/jailhouse/commit/89cd4c91dbf97bb2e4d62ea86eb56640c5265db0
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

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


  Commit: d6985ed463f1e7bdce449ea59b712aa20a5db072
      https://github.com/siemens/jailhouse/commit/d6985ed463f1e7bdce449ea59b712aa20a5db072
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-27 (Fri, 27 Sep 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5974616ff2e0368c1618589df6673fcdad32211c
      https://github.com/siemens/jailhouse/commit/5974616ff2e0368c1618589df6673fcdad32211c
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-09-30 (Mon, 30 Sep 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/5c90e8460986...5974616ff2e0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/5c90e8-597461%40github.com.
