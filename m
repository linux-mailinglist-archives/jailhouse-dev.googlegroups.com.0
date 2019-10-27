Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBMFI2XWQKGQEFU4KN5I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63d.google.com (mail-pl1-x63d.google.com [IPv6:2607:f8b0:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1BE619E
	for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 09:24:18 +0100 (CET)
Received: by mail-pl1-x63d.google.com with SMTP id g11sf4091157plm.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 27 Oct 2019 01:24:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1572164656; cv=pass;
        d=google.com; s=arc-20160816;
        b=jV4mhiGeudqvLmHVnKl6bNuNH9zm3ln877+K+9aHUY5dvVX/9FSL5K4UzgfSRvuzNk
         7Yv5lkfL2YSDgm3RtJKR13RdgUnKGI0D0+GTt7cwbt8Y35XRxwsaVNbEMAgxxmWr2ZMz
         HZk/NW2h7m/Jov21+IV+BJzBLTDd4kYrbkSHxPrwIVTZVEX2rktkgiZOs2XN9gxj3bff
         q9CKYPABzt8BcGEauULHy9caeYxmXRVnsBE9zVHhL8e1Knom8VM5WSxbWScEN9MEwTAu
         k/kwv0diPdWtkxIMIL/25P+azoWiJfkDC/3qYh7sQRXOao/efZLOsFgINRnM95kCeVtk
         3afg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=+2KY6dOCqmT3yuJqBNY0TX8+Irk7rXB4p9oYggteCU0=;
        b=JT+p87Ee3SWFZ0fNWPYrDmKLKvJxB6Il60X8BdrruGpDB+mNNIOxCn1217zi2DQs3B
         0gU9ZgLcLWLrGaS2VfpP1EHd6Gq9T+UcitRmPBLsNN47pwmwK7ESeh8YJv0ZHuIiy6cu
         vJpzBUrBMLH2XURRmIKgHfOAfLK+rtaOwpQAFI52wf4Z8nbxBBsgkkUSd5LGBtDWxtfA
         YYLvXTiJrlfQ6ND9PcTJy+Rd6UTUQuFWTjTljxQzMkeABNkYIwfMRx6De68DPuZmjmFc
         NABtM/M4V99phJu1Ba+s+HoomoXEdCvQwiuuynbg9W/a8wQ29uRp/RJcClOoEinHzgLf
         B3+A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=MyXXaTqw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+2KY6dOCqmT3yuJqBNY0TX8+Irk7rXB4p9oYggteCU0=;
        b=pcWI9pYjUFDGKq/SQsb3CO2Gbj5ra6G03L1U5/e57oKiWr2OflX2q37xKrZ3AqkxVj
         6CgiAaDg2SRnZq3z/M7xrHKK8ArapgYU78L1Ou839hqzzo+r22f7rh7YkLYn8M4bdhkX
         G9JRT8wzqg+haPWiCj8IsuvPi6iopxryrMEmMFjQoKhPhjaFLoJBSKEFNBUvZ79eaSvr
         4kkS7ufNYAhIhbctsvAo25oM+xCC/kJO4oGpdIfn90ayzu336LKZgkfGmNBQtGgiI2z1
         tCnY5kgSG5NCjvWNiwzGrjY7Q+3zxEPWQWK0fozCebd8xZ2OGiMNhm01t/G66xAj/Ikh
         jTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+2KY6dOCqmT3yuJqBNY0TX8+Irk7rXB4p9oYggteCU0=;
        b=FG6r/uZYRz+oKpoBBhgFqIkHyqx+qCTUMqsekVmyy2tl/1BJqr7hO3Pm+pnZtZF6No
         JxiouD690P63kxtZFunWefAxXzjrTojXxm7hNbPLi8PXC1PknHjxpLWnLd9tDMC48HWv
         O8pI5SVEcb1D9gvm14+3+7pCtnnNpoMSoTHluCZ050THjfmvccy0XH4sosM9pkuWiEqL
         UBsuJozX9/Qgox1+bsq/8/xBYMFzAI+Xj7UdKv5y1bhsuq6aBhYLoat4ISFClAPNdSRr
         Ux6BfZ18nQWxsBbY6AUixnAlJXzE/MrjpAZym2uTNKDPKSiMKQ7f5eg71P/+A5ywi21a
         U4Ow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXRu+xjvvvANJXD9tGmqhMmv/4ht+viCV6DD+o+7d/x2gbEEwq
	DHIzM0e8VjSIAd9tJBTYw0w=
X-Google-Smtp-Source: APXvYqzs72uG3uZJ/ZbggSeGgLpeD/tjeLDyfOggN0LG4F5G5vF1L3wl3DSHp1N89As22tAMKDl/vw==
X-Received: by 2002:a63:5960:: with SMTP id j32mr573660pgm.281.1572164656503;
        Sun, 27 Oct 2019 01:24:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:f303:: with SMTP id ca3ls709527pjb.0.gmail; Sun, 27
 Oct 2019 01:24:15 -0700 (PDT)
X-Received: by 2002:a17:90b:157:: with SMTP id em23mr5758960pjb.22.1572164655764;
        Sun, 27 Oct 2019 01:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572164655; cv=none;
        d=google.com; s=arc-20160816;
        b=co9y10zUWEuYyPOjfbx1PKvorlr5uZWMAo4xl9pY80oBazD+Dd8FlUGaPzefDZyOdt
         u37voVBd6HZA8KoBbWv37DH5k/BNgvhp626GgPnwZjWZaBldufu0WCPwlXpI0heCwgtg
         yVRQ2JG+IvhtcFUpL5cIN6jLvu0KXHq1zZaMiY9bmQREzyphdXP512arBjFxW7Ale5T+
         MObx6HJ9GEXzJ8MBDZH/P5CaEpBKBx7CWvqHB4odwvMaUqhlJz8fMhJvF0BHONgWoRZF
         Qxx+c3t1sOlnLgqtLIwxMnFG02NnCL8zQSDm9TNqGbFzjPGRe2hxs/Pck7oawG7BOYYH
         8uTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=cPoJ6M3pylBKGUx0yjZE2DDecfL/Y7u+JVeg/HMivYU=;
        b=m57ocKv8eawWlXefitlT5DsvYzer63xq88p+2UQoXt9H/Q1TwORZWgvZ1Qu4OitzQv
         DUvRJOBkP+2Gd0MZFe5MrdWWXpLAp7NADjza0c6wRwseinBMrp2GaVIZAxMcDfmuWN3B
         odX2dARFxY1BY4iwxTjqmAJGrvZBvxzWF3/sVZ+yoSZXi44FEV84VUzCBmocDmGr/xv8
         8s1NcvQr+slgZy9qgGW0waj6TmbHKGUfd9fdezuSelTPPfNCiuydj45EoRG/QlyHXX/1
         5MzKrn07lEjavEUgl/hNq6Q3RngML0BonOJdvXk016yGCa5g69iyheAUp0si5fuklFJQ
         XyKg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=MyXXaTqw;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-18.smtp.github.com (out-18.smtp.github.com. [192.30.252.201])
        by gmr-mx.google.com with ESMTPS id f7si9693plt.5.2019.10.27.01.24.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 27 Oct 2019 01:24:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.201 as permitted sender) client-ip=192.30.252.201;
Received: from github-lowworker-25680bd.va3-iad.github.net (github-lowworker-25680bd.va3-iad.github.net [10.48.17.61])
	by smtp.github.com (Postfix) with ESMTP id C90996E0A01
	for <jailhouse-dev@googlegroups.com>; Sun, 27 Oct 2019 01:24:14 -0700 (PDT)
Date: Sun, 27 Oct 2019 01:24:14 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/ivshmem2/abd5e6-5b19e8@github.com>
Subject: [siemens/jailhouse] 1107b6: core: ivshmem: Use own temporary vendor
 and device ID
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=MyXXaTqw;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.201 as
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
  Commit: 1107b6e97321298af705927fbd1bb33d069b6f24
      https://github.com/siemens/jailhouse/commit/1107b6e97321298af705927fbd1bb33d069b6f24
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 6ddf0a2baf8412e5dc194c39630ef520256e91af
      https://github.com/siemens/jailhouse/commit/6ddf0a2baf8412e5dc194c39630ef520256e91af
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 09a45b16d3cbb207cef0826f5eca2b9f255030df
      https://github.com/siemens/jailhouse/commit/09a45b16d3cbb207cef0826f5eca2b9f255030df
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 019ccb20cd675a6602acf129e224ea9b60d241cb
      https://github.com/siemens/jailhouse/commit/019ccb20cd675a6602acf129e224ea9b60d241cb
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Enable unprivileged MMIO register access

Make sure that unsupported accesses to the MMIO register region do not
raise immediate panic. We should rather ignore them. This allows the
cell OS to hand out the region to unprivileged users.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: f259fdc4a628393c5d69028d2f8652a022113553
      https://github.com/siemens/jailhouse/commit/f259fdc4a628393c5d69028d2f8652a022113553
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: a35c8167494a79c5ef4f6548fd96b57e6c6dc290
      https://github.com/siemens/jailhouse/commit/a35c8167494a79c5ef4f6548fd96b57e6c6dc290
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 56e032ca89e0b63169b20fa175ec5d8f6af0ef35
      https://github.com/siemens/jailhouse/commit/56e032ca89e0b63169b20fa175ec5d8f6af0ef35
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 248fb666f21c8e933905134505ed9728ef69c088
      https://github.com/siemens/jailhouse/commit/248fb666f21c8e933905134505ed9728ef69c088
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Reorganize MMIO registers

A number of changes to the MMIO registers are upcoming. This prepares
the layout for that and renames DBELL to more telling DOORBELL.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 81315dc36e5f449832fff5490651652332133e4e
      https://github.com/siemens/jailhouse/commit/81315dc36e5f449832fff5490651652332133e4e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename IVPOS register to ID

This is a more logical name for the register as it returns a unique
identifier of the device.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 601c97bb6ca917a374f15687b6de321655efd332
      https://github.com/siemens/jailhouse/commit/601c97bb6ca917a374f15687b6de321655efd332
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Add MAX_PEERS register

This allows the guest to discover the maximum number of peers connected
via an ivshmem device. We only support 2 so far.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a06fbffc4a1e88241eada76cdfe1e13d81e8a1d6
      https://github.com/siemens/jailhouse/commit/a06fbffc4a1e88241eada76cdfe1e13d81e8a1d6
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 2f8b47fcdd2149ffddb74b52bb01fd7bf2b1612e
      https://github.com/siemens/jailhouse/commit/2f8b47fcdd2149ffddb74b52bb01fd7bf2b1612e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: fa506ca0d9538c58a800434cc4a70144efa15f40
      https://github.com/siemens/jailhouse/commit/fa506ca0d9538c58a800434cc4a70144efa15f40
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Use device ID from config

Convert the creation-order based ID assignment to the one now provided
by the cell configuration.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 62c9f8b3c8cf2848c5ed596fb03167da7b832dbc
      https://github.com/siemens/jailhouse/commit/62c9f8b3c8cf2848c5ed596fb03167da7b832dbc
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 2d8f2e848b0c273941eb214350a96c5a5fb3e56a
      https://github.com/siemens/jailhouse/commit/2d8f2e848b0c273941eb214350a96c5a5fb3e56a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Mask MSI-X vector on reset

This is demanded by the PCI spec.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 798662a8d0d44124c1aa0846b3d333f62be2136f
      https://github.com/siemens/jailhouse/commit/798662a8d0d44124c1aa0846b3d333f62be2136f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: d7ae64aa39d0c3d3198f920188ede1b10005bf40
      https://github.com/siemens/jailhouse/commit/d7ae64aa39d0c3d3198f920188ede1b10005bf40
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 89c9f86756b9f10e5c00f9769cc10fa397bb571e
      https://github.com/siemens/jailhouse/commit/89c9f86756b9f10e5c00f9769cc10fa397bb571e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Rename ivshmem_data to ivshmem_link

Represents more clearly what the structure is about: meta data
describing the link between two ivshmem endpoints.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e90673f787c26c8774364092e4f0626da797381e
      https://github.com/siemens/jailhouse/commit/e90673f787c26c8774364092e4f0626da797381e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Avoid assumption about size of ivshmem_link

It does currently fit into one page, but there is no reason to hard-code
this.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: b7ec9c9e88bbee054446b72883a508ef6f8c0474
      https://github.com/siemens/jailhouse/commit/b7ec9c9e88bbee054446b72883a508ef6f8c0474
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Introduce link pointer to ivshmem_endpoint

Will be used when looking up an interrupt target by ID.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e34e7f3df78aaaf39c67313a00f2ce9b941cda32
      https://github.com/siemens/jailhouse/commit/e34e7f3df78aaaf39c67313a00f2ce9b941cda32
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Relax peer matching rules

Only match based on BDF from no one. We will rework the number of shared
memory regions, and matching them all will an enormous effort. This
should rather be pushed eventually into an offline check.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: a8d2ccb762db410ed6a41f362a83e08a15f242e2
      https://github.com/siemens/jailhouse/commit/a8d2ccb762db410ed6a41f362a83e08a15f242e2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 2e889c6eea3f170ec67cdd3debadbe6f6033b48a
      https://github.com/siemens/jailhouse/commit/2e889c6eea3f170ec67cdd3debadbe6f6033b48a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 380a4ffd2f95e3ed58d04b62fa1b3fd09167a34d
      https://github.com/siemens/jailhouse/commit/380a4ffd2f95e3ed58d04b62fa1b3fd09167a34d
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Re-add target ID to doorbell register

Just like the original ivshmem, use the upper 16 bits of the value
written to the doorbell register. This allows both self signaling and
lays the ground for multi-peer support.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e52b567d893a21e112c7c481665f3a2dfc6badbd
      https://github.com/siemens/jailhouse/commit/e52b567d893a21e112c7c481665f3a2dfc6badbd
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: c1cb1338396e1b0298e2a98df8ba04b97fc52d69
      https://github.com/siemens/jailhouse/commit/c1cb1338396e1b0298e2a98df8ba04b97fc52d69
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: e2a71d3ba325d5627e7308d42a69608e9bac5a96
      https://github.com/siemens/jailhouse/commit/e2a71d3ba325d5627e7308d42a69608e9bac5a96
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: d00888ae7bb2c7fa83d998f2dec71d52b1e1fc9e
      https://github.com/siemens/jailhouse/commit/d00888ae7bb2c7fa83d998f2dec71d52b1e1fc9e
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h
    M hypervisor/ivshmem.c

  Log Message:
  -----------
  core: ivshmem: Expand interrupt control to device level

This will allow to introduce a one-shot mode later on.

The reworked interrupt control register starts disabled on reset.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 331b8d51f75a6ca6db8c9ffa5dd7fa33255fdaf9
      https://github.com/siemens/jailhouse/commit/331b8d51f75a6ca6db8c9ffa5dd7fa33255fdaf9
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: b550d1c45a620a3cfb408f97d215460e6d5594b1
      https://github.com/siemens/jailhouse/commit/b550d1c45a620a3cfb408f97d215460e6d5594b1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: e523bc092c670a106fe7c774ddbf4dcdeefd5514
      https://github.com/siemens/jailhouse/commit/e523bc092c670a106fe7c774ddbf4dcdeefd5514
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 9fa1bcc5fc63d8cd6bb6754eba2a775c492c01b2
      https://github.com/siemens/jailhouse/commit/9fa1bcc5fc63d8cd6bb6754eba2a775c492c01b2
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: a3bdfd5da18ccefa3a723f48c4487ab1bda92af7
      https://github.com/siemens/jailhouse/commit/a3bdfd5da18ccefa3a723f48c4487ab1bda92af7
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

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


  Commit: 184ff824d1e565d699bfd9421d22bc42049a1445
      https://github.com/siemens/jailhouse/commit/184ff824d1e565d699bfd9421d22bc42049a1445
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M hypervisor/include/jailhouse/ivshmem.h

  Log Message:
  -----------
  core: ivshmem: Reorder ivshmem_endpoint fields

Move state and ioregion to the end because they are not needed in
hot-paths.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 25a484466c3518c42f87afd700d746e10d31468a
      https://github.com/siemens/jailhouse/commit/25a484466c3518c42f87afd700d746e10d31468a
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    A Documentation/ivshmem-v2-specification.md

  Log Message:
  -----------
  Documentation: Add specification of IVSHMEM v2 device

Add a WiP specification for the new IVSHMEM version. This documents the
current state and should not be considered stable at this point.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 1e9b6fa8ddb6c16270f68f26cc7760b08afd8589
      https://github.com/siemens/jailhouse/commit/1e9b6fa8ddb6c16270f68f26cc7760b08afd8589
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  configs: Add ivshmem protocol defines for virtio to cell-config.h

This defines the protocol ID ranges for virtio backends and frontends
along with a view virtio device IDs, allowing to create such devices in
cell configs.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 3cccdb004deaa2ea32b6ed3cef569ad47da14b2b
      https://github.com/siemens/jailhouse/commit/3cccdb004deaa2ea32b6ed3cef569ad47da14b2b
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio console device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio console via ivshmem to
the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 5b19e80c85611767665f2967b22c190fefaa1550
      https://github.com/siemens/jailhouse/commit/5b19e80c85611767665f2967b22c190fefaa1550
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2019-10-27 (Sun, 27 Oct 2019)

  Changed paths:
    M configs/x86/linux-x86-demo.c
    M configs/x86/qemu-x86.c

  Log Message:
  -----------
  configs: x86: Add virtio block device between qemu-x86 and linux-x86-demo

This enables the root cell to provide a virtio block device via ivshmem
to the non-root Linux cell.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/abd5e6589de0...5b19e80c8561

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/ivshmem2/abd5e6-5b19e8%40github.com.
