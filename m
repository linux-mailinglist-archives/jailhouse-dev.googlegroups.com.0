Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBCUM3L4AKGQE5ZMCB7I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1038.google.com (mail-pj1-x1038.google.com [IPv6:2607:f8b0:4864:20::1038])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C9B227897
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 08:07:08 +0200 (CEST)
Received: by mail-pj1-x1038.google.com with SMTP id 8sf1475115pjk.5
        for <lists+jailhouse-dev@lfdr.de>; Mon, 20 Jul 2020 23:07:08 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595311627; cv=pass;
        d=google.com; s=arc-20160816;
        b=eq4n2H70QthGE2XOvC0Ik4LBdo+h9fJVxJ/RwmtFi3kEinDQpediBPUSvkbDu8mj7R
         stZSZ5ZtQ8n5jCI9ZRiehSeV74PsnkcQ8IDYTIJzk5nG2mWsPA9rgObjyB8LfrrYqMUL
         9goPIFyh0yYbDwGv3En5GYaCk+hfU8LlsYCat6NCOzBmiooJ8ZIEesFVU+64J7kdAOf2
         Yz1PWZeo6RpTOoVEofpNS/JXNvgAulLiNZzGnPNNaOcPJ2w5OuYFAWGzYcfM4WKYlw92
         XpkLJOHOxJHWj3/JvGuw1nQBeGld+xFzibNIoCmyHeEXcu5hJau40KHzSdPAsxdumnQL
         pdew==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=Y0wORi9JqdMoe9pNObiB+MSp/WnagMhu7197YBG9+8E=;
        b=oRZQWz8Fx4KrbkROMiKm9QhYmNLjJmXj8Lq8VGc0Npa4f/+Q8y5OqFk5gqDuUWrQqt
         H7O3uQW6pH75lk0J1U2fA1vFiXRkWyTyD2nMFonSCcuezBf7qQ07w9hX2yzZFHlFgU+O
         mHIEaxbJ10dxiQNwhmhmNIiElCQ5eaz0JBO2COTOlgYy5XHXkY+7rEaMHWt3v0dGsIIi
         jWQn180/uI/sZylKpeggsrD81FEPBB6vr6pRZU0XD1HeE/flucD/3ZaI1dDgSyQ+7Pjp
         oL27Ux4m0ceJ+zLb2a1myoyNbwnK3P6R+CO1+Lf+/Oyvuw7ZGT/xNJCs2zb2Yk/Snpzc
         Ifmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Lz07VUE8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Y0wORi9JqdMoe9pNObiB+MSp/WnagMhu7197YBG9+8E=;
        b=YTIn3XxXEzeEspdDH0Wu3dxmj6sgQ96LKHfCCG9Jyt2JEs5tEEibWEWFRdA+P/BB3x
         CjxUAUwZejWX5hzhZDL5KieTYaFp7Sao4prvGO+nGptBmYT2yif73ohkwZU13Dtab9os
         Joa/6oUroH4HP7jQAgm70+09d0HGlK74za0GXQC+/hd3piQCcqeWos5lXbWJAh3KqgPO
         vk93k1J3lgCsWkqAK+pXK7Uf0oeJRzPgrjwCCmUT0BBR9pC1iLvrkuDGryTu2eh6RhVK
         Qsf665YkqwRFLhGNu6Pt7vXByeO8s0PiZFukMpTJW9e+duYwC5EDJB6AabS1knA7UHOk
         /xvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y0wORi9JqdMoe9pNObiB+MSp/WnagMhu7197YBG9+8E=;
        b=fuE+q3UqwXtE+gCl0Mj9TmDgvzYJYoIbt6RMqf5oQlcUxGqir766ddoGkD802Lu22X
         UpH38Fu2ez7qUK7VvmVyT08ElDV75nxz3OGqYDB20Op0CO+3QPgPQQP3ygZRFbLE094+
         QQOQPfZ4UL9bC7NMMVkKIF9owxCbRYl/3fb06Qo4iY1F7j+L/V7LH2QZNd5ZjjlgRLqj
         R+d//qonmK2RPySp1S5QMRdKQG2BIb0XAoJgBEx/H8kvQedcf/0fMXdcuO/dwYBlRNB7
         vDgS8e3L972uzcHjwA+8iB6jrjZKJEJ6twpgUs9G6qGed5CPXxd9DbgFyQbgCu6qX9oT
         C2nQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5336RVKYMrEigaLcNx1mJwPD5/mQVM4kaG77vIAc2gOsNLGbr+Lt
	W4rqMAb+bcLy/SObOdW42YU=
X-Google-Smtp-Source: ABdhPJyOMBvIk6LVyKTYvuRlgv6ArnbJe5BsqmjEqy7l5BLdVkgWbb3TBAO2drAa2jHBw0NSd/Xniw==
X-Received: by 2002:a17:902:8498:: with SMTP id c24mr21240107plo.332.1595311626918;
        Mon, 20 Jul 2020 23:07:06 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:684d:: with SMTP id q13ls2542304pgt.2.gmail; Mon, 20 Jul
 2020 23:07:05 -0700 (PDT)
X-Received: by 2002:a63:515a:: with SMTP id r26mr22883568pgl.204.1595311625674;
        Mon, 20 Jul 2020 23:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595311625; cv=none;
        d=google.com; s=arc-20160816;
        b=FjlNfGdMEqM/V18FmG1TXtrZRVrjSoMKrOqbCOuZir2+9AWB8dlUwYjXCHlo7BhZQK
         1MatuiHzGn96axoc+uhfTd+hFYjIaopkjky3KcA0qFf/kLYa0NvWuuDdPOYeR5oc+Wfg
         ltQ6aors9fm6bFb1l/SbRTT3JCchTThSnI83cX2WxghIQC5+LgaL2Wqfi1c1Rv8zZeBm
         lWOhBisrVSopKBdAhZxEM3HaKNVPtA+ayPIXZPQsgibleqdhlnDsfk80cRsQv4XFRjud
         puJ7khQhrUJgIoZvuA2J79pvHCEx4LcYD0KB2gqkIEXtsDsjpHowUVHc4QK5YxKZ7jX1
         M93w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=ZMd9dLq411y7lo5Sa+f3DotwAollsGiQLxoi7flPf5U=;
        b=sgtteSqVh+w7NWd7mUsyChuC1EqrKi58SIi1g1+v0N2AUJGF+htjsf83z1GjpS20fr
         qwZfIQxCaFVFlp7SGGm1FbIPcOZK42jknvUCjEOjbAR5xEAaMMv5yeERCiq9zU78r0XK
         Mu+VKzK15x3B98yQbCKsELr77tWYLUFH07kkvvb+zHoCTPn4W61Wzjf+BcslkiSdbp08
         826aGP6R+9Me1xx/PIEydqRXCVx0JqSdZ0cQzJhi+NzR5W8yB57PANLyR9EAy5MDUn9m
         98Q35/zXFrJpeS7R1Rh0bwujJXlt87E/Ity1/Dld8SgpVw/k4fPSWHUuHzVNl6HxVQjX
         fVnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=Lz07VUE8;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-25.smtp.github.com (out-25.smtp.github.com. [192.30.252.208])
        by gmr-mx.google.com with ESMTPS id 10si102687pfp.0.2020.07.20.23.07.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2020 23:07:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.208 as permitted sender) client-ip=192.30.252.208;
Received: from github-lowworker-b19c547.va3-iad.github.net (github-lowworker-b19c547.va3-iad.github.net [10.48.17.66])
	by smtp.github.com (Postfix) with ESMTP id F13FB28281D
	for <jailhouse-dev@googlegroups.com>; Mon, 20 Jul 2020 23:07:04 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:07:04 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/master/4ce765-9b4efc@github.com>
Subject: [siemens/jailhouse] 7487e5: pyjailhouse: config_parser: simplify
 signature checks
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=Lz07VUE8;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.208 as
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
  Commit: 7487e55930f76b644fa88bd0283538eed4c48e41
      https://github.com/siemens/jailhouse/commit/7487e55930f76b644fa88bd0283538eed4c48e41
  Author: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: simplify signature checks

Just a slight simplification, no functional change.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
      https://github.com/siemens/jailhouse/commit/9f0aa69fba6df236baa4c6b2a90c7e2a92be8162
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M tools/jailhouse-config-create

  Log Message:
  -----------
  tools: jailhouse-config-create: Improve code readability in template preprocessing

Move lines with similar context together and add some comments.
This commit serves also as a preparation for the following commit.

No functional change.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 91fbc4ff25965325d8a75b2b568db5bc1df38f42
      https://github.com/siemens/jailhouse/commit/91fbc4ff25965325d8a75b2b568db5bc1df38f42
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M pyjailhouse/sysfs_parser.py
    M tools/jailhouse-config-create
    M tools/jailhouse-hardware-check

  Log Message:
  -----------
  tools: jailhouse-config-create: move PCI capability collector from sysfs_parser

Fixes generation of unreferenced PCI capabilities inside cell configs
on AMD systems. They occur due to removal of the IOMMU from the PCI
devices list after its capabilities have been collected.

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: af4b5d431a5147b059c9e1219834931a91319379
      https://github.com/siemens/jailhouse/commit/af4b5d431a5147b059c9e1219834931a91319379
  Author: Andrej Utz <andrej.utz@st.oth-regensburg.de>
  Date:   2020-06-10 (Wed, 10 Jun 2020)

  Changed paths:
    M configs/x86/f2a88xm-hd3.c

  Log Message:
  -----------
  configs: x86: f2a88xm-hd3: remove unreferenced PCI capabilities

Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


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


  Commit: 69630e4e654f28ed3b67e7af67efef5be9182397
      https://github.com/siemens/jailhouse/commit/69630e4e654f28ed3b67e7af67efef5be9182397
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

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
[Jan: terminate on error in of uio_read_mem_size, fix return type,
      process sscanf errors, close fd]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: db3391923c0e7d58a5e628a4a30dab7cd22e9311
      https://github.com/siemens/jailhouse/commit/db3391923c0e7d58a5e628a4a30dab7cd22e9311
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

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


  Commit: 4df06eef96d44a52a25ac57d442ed4099ba8a645
      https://github.com/siemens/jailhouse/commit/4df06eef96d44a52a25ac57d442ed4099ba8a645
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

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
[Jan: fix ARM targets by avoiding division]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: e64eb56a78059862fc36fb00e1c900c2770bf178
      https://github.com/siemens/jailhouse/commit/e64eb56a78059862fc36fb00e1c900c2770bf178
  Author: Nikhil Devshatwar <nikhil.nd@ti.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

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


  Commit: b6715a3731249ec09a280b2fdbf5e4385b1e6677
      https://github.com/siemens/jailhouse/commit/b6715a3731249ec09a280b2fdbf5e4385b1e6677
  Author: Peng Fan <peng.fan@nxp.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M README.md

  Log Message:
  -----------
  README: drop the warning

Jailhouse has been chosen by Semiconductor Companies(TI, NXP)
in regular software releases. And it has also been deployed
in real products.

So let's mark jailhouse product ready,  drop the warning that
make people scared to use Jailhouse Hypervisor.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 8fbef0cfd70152968f35963201dfacba3171f877
      https://github.com/siemens/jailhouse/commit/8fbef0cfd70152968f35963201dfacba3171f877
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  pyjailhouse: config_parser: Strip trailing zeros from cell name

A cell name is either terminated by length or by null-byte. Avoid
picking up the latter into the python string.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 384720216c2fb0851039f07c79f327ba4a253367
      https://github.com/siemens/jailhouse/commit/384720216c2fb0851039f07c79f327ba4a253367
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-04 (Sat, 04 Jul 2020)

  Changed paths:
    M tools/ivshmem-demo.c

  Log Message:
  -----------
  tools: ivshmem-demo: Fix convert indention to tabs

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: ade3231483b5e5b16800f48b56e2e2c45ab67a8f
      https://github.com/siemens/jailhouse/commit/ade3231483b5e5b16800f48b56e2e2c45ab67a8f
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M configs/arm64/dts/inmate-qemu-arm64.dts
    M configs/arm64/qemu-arm64.c

  Log Message:
  -----------
  configs: qemu-arm64: Move virtual PCI host out of flash region

QEMU puts virtual flash between 0 and 0x800000. Avoid this conflict by
moving to a real free space.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 41d858e9584d59931b54a1946b7c3265b6ba1cd1
      https://github.com/siemens/jailhouse/commit/41d858e9584d59931b54a1946b7c3265b6ba1cd1
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/arch/arm-common/setup.c

  Log Message:
  -----------
  arm-common: Write VTCR only during arm_cpu_init

The value of VTCR does not change while Jailhouse is running. The
function that writes it so far, arm_paging_vcpu_init, is called on every
update of the pg_structs of a cell CPU. Writing VTCR each time as well
is harmless but unneeded.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


  Commit: 9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
      https://github.com/siemens/jailhouse/commit/9b4efcf4cb3ae36a555251ec01ba75d648c0f7a5
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/control.c
    M hypervisor/arch/arm-common/include/asm/irqchip.h
    M hypervisor/arch/arm-common/irqchip.c

  Log Message:
  -----------
  arm-common: Refactor irqchip_send_sgi interface

Pull the setup of struct sgi into irqchip_send_sgi, avoiding the
duplication of this logic at the callers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>


Compare: https://github.com/siemens/jailhouse/compare/4ce7658dddfd...9b4efcf4cb3a

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/master/4ce765-9b4efc%40github.com.
