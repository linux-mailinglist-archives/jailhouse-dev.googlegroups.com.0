Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBJP43T4AKGQEVYVEQKI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53d.google.com (mail-ed1-x53d.google.com [IPv6:2a00:1450:4864:20::53d])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B86C2288E8
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 21:12:38 +0200 (CEST)
Received: by mail-ed1-x53d.google.com with SMTP id u59sf9914936edc.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Jul 2020 12:12:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595358758; cv=pass;
        d=google.com; s=arc-20160816;
        b=o+lCYhyuJM/r1xrkiDKOFI65ib9SBEF9EuNBdMYJqC8qm4Wz8B73qfzvcLvh1ZuoLS
         ByCJls4omZfStT04Wf20Aq8GtiahYGEJsW03YUFdCTiEYLZOfFWDZLTx8PXxcD8ixsxv
         EN7JDRMp/FKph+jG1pt4e2FxP3OSJ3HPwbZidDzq7+HbaznAOkIbMonuxv618MfrCWqD
         4f3xv4bJPuMW8C9bXfvXl1g2E+TfZbCy7XlTzwM4Jy0jC7mJkCl2obizbdy4kUNZmq4v
         +SHxsQuoF5CBpkOEyinceV6Kt95rhNOKWwV83cK1KXxB4kmgdYOpbs1HDHkscSRY2NxN
         9hYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=NEvaI2S+qgFU9jyTQmBIB7qQs7VzE3X2ZzDeaExNDYc=;
        b=vfu466Lt3vNPfhhzLqr1uzlewoghRnMvhD521O7g5k4sE6AY5sJlVmMz+TlajFPBIU
         iTGwF+uVHliK8sDfzLysDuXx2prUbYty0bKYtCcW7NqCHNQ2KCfFNUaPJa2YKnGu9cPj
         aDUDoJR7n41oP++mmrnLs1YUkDUUmU6PH89Ikg8CkUtxQpeifa3jd55mCNFZN3GqJQ6B
         TMwJVLlBUhANU4j2rX18Fi4AgFMAfGxI559N+cZG8rbprGfH3Y67iRqZBhcofUp8I12z
         6LUpV78nS1WHq7Uykr80Azo6gsHV2jW+lYxuV39eyobmF5M50aIzmYJXulBJq7hmyQa+
         x/Lg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nQBdy6iC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=NEvaI2S+qgFU9jyTQmBIB7qQs7VzE3X2ZzDeaExNDYc=;
        b=COQHS5qaAZ6zaLhvQpmzbGbrCEWiz57XHOm6TWyNkHR+XYSux97g8auF8JG/pvUASm
         BttHPYV16mi6lm6spoU6Ti2kK2ZPWaSHhA12JceSE8ym9u4beIvQlA3KKVIq+ZuPZDTg
         7dgd+KQ2c8Exjk/+VUs+sDaI5Kno8nkgTUZRDybYjJIfH/D6SmaQAu8ba+RHvdF7We1c
         BKFMP8COrBCCAnUmr5CQBoIcr2J1Iq6Vg1KtIw5XEMdRw04n6/nKrBEtvTvu6eEEaC2j
         ZGKDOQvHnoNbnTpdvn1VIk2SyXJGapJntQWsFBKKWmatroiF8/M2LN5oU9jRKqwZsWCC
         igpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=NEvaI2S+qgFU9jyTQmBIB7qQs7VzE3X2ZzDeaExNDYc=;
        b=KlS/8mm/XTZm8VKlzKQN9lbmU01if+j6qT2/2AVMx0QsikZvVCVTm6wH6gbevLkuWf
         gxBCBBpWJMFIr9tGNLaDUwWwvZNtZ3NAJ4RZRmWt3hMBSRKlaoa/Fp3ukIirIlZgrIqN
         90c1KX/Vvt0oP16sCSHg3NtFUUm0eroYdpRzsE767ESYHAbaSdcdcWYngZfd0ILz7+My
         UHLBclumhXnP7smpBB5i8EwljnK2Gi/hGEtEKnQ/GTSG8sPmHkbzohuMSJ8AUdHodXhT
         Pnb9x97yh6muPaL0PORlhsQCou6TBg7GpZnR4NhWtDPnc9m9bl5quXxe3EBlarJYYgqR
         Eegw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nSUx0/RFSQMqRsboV2W77rOfWs9H2+yiPVHhPyZFRba5Baa/A
	9acc0WirijBOcdEt8FIB/7c=
X-Google-Smtp-Source: ABdhPJxTROXPTiGdLPDvSbMM9EjAZF4CkmAZOaeUZDaY2rjWTvup+IUcx7iF3z+g6Ogr7xqTmn216Q==
X-Received: by 2002:a50:afa2:: with SMTP id h31mr27591815edd.303.1595358758049;
        Tue, 21 Jul 2020 12:12:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:11d1:: with SMTP id va17ls9942717ejb.0.gmail; Tue,
 21 Jul 2020 12:12:37 -0700 (PDT)
X-Received: by 2002:a17:906:d04c:: with SMTP id bo12mr27671266ejb.31.1595358757160;
        Tue, 21 Jul 2020 12:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595358757; cv=none;
        d=google.com; s=arc-20160816;
        b=cXYtCr8yRwdmrdAy+bCj2/fho5BMHlNxFEWbbBL4Ucp03H+oJm8QQ4hYNVXDG2TH3R
         YhFaleBrcKuRTv2gLkaVWkRqGahTX4NAKo23p+Puqo/6raF2ZGhVvy3urI96HsAc99Rf
         DLVRd9Px/yCs+/a1lYKupTnix+etvjKF//sKyshfGEk4Qxf0OCOtFfCPF/tuMbW2igoQ
         E2q4GogHTzhNRNfm2107gw19H8iwKTWDrdQ78VniCEpij894uq5NS48CflRr4tbAJ0Jy
         lXbR6n5QUBgB3U9hlk7G5Jf+fO+HZS5ofvMvfpTobGHvEIHl+eiKHwi1rOT8N8qeQhl1
         IfoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :date:dkim-signature;
        bh=C0bBE6wKevmHLJpwQjFBpFw2NgJazkyZU+uXGE97JsY=;
        b=tBoFyAPSxrrQ9rYxa9vz6thLfeMsJGA06LNFsdkh9l0xb2IeuYAePIzxGLeJyUPxjc
         yrSuJA6S8cdmB5gNm7EzFpQ+3o7+TzGDh8D5vVEBIfUNE9dXDh1vEPWcDeD8673ypMjk
         AsDXzLDN7vgSlebRQn/7aEgnr/5/KbilUrgB3bOv7OZbgupHXVDytL4rQUz2bLLVB5bG
         iR96z1ZaO/DVPlxtQAXh7W6IApoRfNQ7aEn62ooMK3gsghaf31eeWJPcCl+7FjMCuJyT
         IlQ6LIcom+5D/NsQZk5Z+kICd5CKZVflGXbNYL3+rYCMJcQxs1jPtDXx/kVcm8IifNnl
         2HVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b=nQBdy6iC;
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-23.smtp.github.com (out-23.smtp.github.com. [192.30.252.206])
        by gmr-mx.google.com with ESMTPS id x14si1257097edq.2.2020.07.21.12.12.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 Jul 2020 12:12:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.206 as permitted sender) client-ip=192.30.252.206;
Received: from github-lowworker-1ac52d7.ash1-iad.github.net (github-lowworker-1ac52d7.ash1-iad.github.net [10.56.25.52])
	by smtp.github.com (Postfix) with ESMTP id 3A603660D77
	for <jailhouse-dev@googlegroups.com>; Tue, 21 Jul 2020 12:12:36 -0700 (PDT)
Date: Tue, 21 Jul 2020 12:12:36 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/cache-coloring/744273-403ec7@github.com>
Subject: [siemens/jailhouse] 9459c6: hypervisor: introduce a common cache
 coloring inte...
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b=nQBdy6iC;       spf=pass
 (google.com: domain of noreply@github.com designates 192.30.252.206 as
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

  Branch: refs/heads/wip/cache-coloring
  Home:   https://github.com/siemens/jailhouse
  Commit: 9459c6054bf008062ac3492fd9b8cbc4e64b6c03
      https://github.com/siemens/jailhouse/commit/9459c6054bf008062ac3492fd9b8cbc4e64b6c03
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    A hypervisor/include/jailhouse/coloring.h
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  hypervisor: introduce a common cache coloring interface

Add fundamental primitives to implement support for cache coloring.
The latter is performed by exploiting the mapping of memories flagged as
JAILHOUSE_MEM_COLORED and defined in the inmates' configurations (no
root-cell or hypervisor itself supported yet).
The interface defines the basic functions that have to be implemented in
order to support coloring for a specific architecture.

Define three main functions:
- coloring_paging_init: calculate which bit range in the address is useful
  for cache coloring, assuming it limited by the page size and the LLC
  way size as happens on arm;
- next_colored: calculate the next physical page address that conforms
  to a given colors selection and to the bits calculated in the previous
  function;
- coloring_cell_init: initialize cell colors assignement depending on its
  configuration;

LLC way size is required for coloring to work and it can be explicitly
defined in the root cell configuration. Add a helper function that
probes the way size from hardware if the llc_way_size is not set in the
root cell configuration.

Finally, define a function used to calculate the physical end address of
a given memory that is flagged as colored.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 4f9415aabda58f8d9b687d70bfa299809e659707
      https://github.com/siemens/jailhouse/commit/4f9415aabda58f8d9b687d70bfa299809e659707
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c

  Log Message:
  -----------
  hypervisor: implement paging_create/destroy_colored

Add functions for colored page creation and destruction and initialize
coloring on the platform.

The story of the life of a coloring page can be summarized as follows.

1. Bits in the address that are useful for defining colors are computed,
   and used for all mappings. The page size used to obtain the lower limit
   is assumed to be aligned with the `PAGE_SIZE` constant defaulting at
   4KiB, and also as the unit for the mapping operation, even when
   consecutive pages would be possible.

2. The colored regions can then mapped with a new paging function and
   destructed with the old one, because `paging_destroy*` acts on virtual
   addresses while coloring happens on the physical ones.
   Paging_create has to handle the remap to root_cell too when e.g.
   destroying cells.

3. The colored unmap function is instead used only when destroying the
   root cell mapping, since we assume that the root cell uses a 1:1 mapping
   for memory regions.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: f793a572bd9de1ee701780a627334628e49df646
      https://github.com/siemens/jailhouse/commit/f793a572bd9de1ee701780a627334628e49df646
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M driver/Makefile
    M driver/cell.h
    M driver/main.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  driver: introduce col_load_address for colored binaries loading

Currently Jailhouse loads inmate's binaries by mapping its memory region
to the root cell. When coloring is enabled this operation becomes
not trivial. To avoid logic duplication in the driver module,
use a special memory space when loading to colored regions. This
convenient memory space starts from a fixed address defined by
`col_loads_address` and will be mapped by the hypervisor using the same
size and coloring configuration as the inmate.
Since there could be platforms with different memory space layouts, the
choice of `col_loads_address` has to be done accordingly.
Allow the user to set this value in the root-cell configuration and set
the default to 16 GiB. The latter has been empirically choosen as default
value.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>


  Commit: 2467d0380cf1aa775e997219540c7ca9493c6167
      https://github.com/siemens/jailhouse/commit/2467d0380cf1aa775e997219540c7ca9493c6167
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm-common/include/asm/cell.h
    A hypervisor/arch/arm-common/include/asm/coloring.h
    M hypervisor/arch/arm-common/mmu_cell.c

  Log Message:
  -----------
  hypervisor, arm-common: add initial support for cache coloring

Use a bitmask array with fixed size for the cell's color assignment.
The largest amount of shared last-level segment cache equipping an Arm v8
cluster for the embedded segment (i.e. Cortex A5?, A7?), which contains
up to 8 cores, is 8 MiB with 16-ways associativity.
Now, assuming the coloring algorithm to be the same as we support, i.e.
smallest granularity with 4 KiB pages, we compute that up to 128 colors
available.
For this reason set the amount of colors supported to 128.

Colored regions defined by the flag JAILHOUSE_MEM_COLORED are mapped
using the "colored" version of paging_create when needed.
The colored version of paging_destroy is used only when unmapping from
the root cell since we are assuming a 1:1 mapping for it.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 2f45f3f8fc7d609e5d48b94d547b7f20f30bf01a
      https://github.com/siemens/jailhouse/commit/2f45f3f8fc7d609e5d48b94d547b7f20f30bf01a
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/control.c

  Log Message:
  -----------
  hypervisor: introduce color_root_cell_management

The usual life cycle of an inmate is divided in 4 phases: creation,
loading, starting and destruction. The most crucial phase for coloring
is the loading one because Jailhouse relies on Linux and its driver
module for loading binaries. In order to avoid exposing the coloring
logic outside the hypervisor, use a separate memory for loading binaries
to colored regions.
During creation and destruction phases there is no functional change:
the memory is mapped and unmapped using coloring functions as they
should since we are handling colored regions.
During loading phase a special colored mapping is created. The latter
has the same physical start and coloring logic as the cell's memory but
virtually starts at col_load_address.
This will expose a virtually contiguous memory region that will be used
by the driver to load binaries. During starting phase this special
memory is destroyed.

Add the missing CELL_CREATE state and introduce a management function
that handles the colored scenario for all the above phases.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 168b94dd6b4989d838967aeb2f936c02d2b04077
      https://github.com/siemens/jailhouse/commit/168b94dd6b4989d838967aeb2f936c02d2b04077
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M driver/cell.c

  Log Message:
  -----------
  driver: handle loading to colored regions

Do not use the memory physical address start when loading into colored
regions. Map the memory starting at col_load_address instead.
That region has been mapped by Jailhouse with the same color
configuration as the inmate and exposed as a virtually contiguous space.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 98904b5ba9e0c32b57e485cd811e977a15266cb3
      https://github.com/siemens/jailhouse/commit/98904b5ba9e0c32b57e485cd811e977a15266cb3
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    M hypervisor/arch/arm64/Kbuild
    A hypervisor/arch/arm64/coloring.c

  Log Message:
  -----------
  hypervisor, arm64: add cache coloring support

Implement all the functions needed by the coloring interface for the
arm64 architecture.
Coloring selection is retrieved by the jailhouse_cache structure(s) in
cell's configuration. Each structure defines a color range that will be
mapped to the corresponding color bitmask. The configuration is
cell-wide and will be used with all the memory regions flagged with
JAILHOUSE_MEM_COLORED.
If no color selection is provided by the user and coloring is enabled,
use all the available colors on the platform.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
Acked-by: Angelo Ruocco <angelo.ruocco.90@gmail.com>


  Commit: b7343ca1e1df197d399e1a27c157425ddc0b750a
      https://github.com/siemens/jailhouse/commit/b7343ca1e1df197d399e1a27c157425ddc0b750a
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    A configs/arm64/zynqmp-zcu102-inmate-demo-col.c
    A configs/arm64/zynqmp-zcu102-linux-demo-col.c

  Log Message:
  -----------
  configs: add colored cell configuations for ZCU102

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: f9099f71eacbf3fa3491b0ed2551a8caf4654702
      https://github.com/siemens/jailhouse/commit/f9099f71eacbf3fa3491b0ed2551a8caf4654702
  Author: Luca Miccio <lucmiccio@gmail.com>
  Date:   2020-07-10 (Fri, 10 Jul 2020)

  Changed paths:
    A Documentation/cache-coloring.md

  Log Message:
  -----------
  Documentation: add description and usage of cache coloring support

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 403ec70f3c53915ad3411b2ead5801ac5d1fa325
      https://github.com/siemens/jailhouse/commit/403ec70f3c53915ad3411b2ead5801ac5d1fa325
  Author: Jan Kiszka <jan.kiszka@siemens.com>
  Date:   2020-07-21 (Tue, 21 Jul 2020)

  Changed paths:
    M configs/arm64/qemu-arm64-linux-demo.c
    M configs/arm64/qemu-arm64.c
    M driver/cell.c
    M driver/cell.h
    M driver/main.c
    M driver/main.h
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/control.c
    M hypervisor/paging.c
    A include/jailhouse/cache-coloring.h
    M include/jailhouse/cell-config.h
    M pyjailhouse/config_parser.py

  Log Message:
  -----------
  hacks

Likely broken, definitely for qemu-arm64.


Compare: https://github.com/siemens/jailhouse/compare/7442735e0862...403ec70f3c53

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/cache-coloring/744273-403ec7%40github.com.
