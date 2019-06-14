Return-Path: <jailhouse-dev+bncBC76BKUBWEKRBQPVRXUAKGQE4NOO43Q@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x339.google.com (mail-ot1-x339.google.com [IPv6:2607:f8b0:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C845AD6
	for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 12:45:23 +0200 (CEST)
Received: by mail-ot1-x339.google.com with SMTP id b4sf937163otf.15
        for <lists+jailhouse-dev@lfdr.de>; Fri, 14 Jun 2019 03:45:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560509121; cv=pass;
        d=google.com; s=arc-20160816;
        b=Egm/dfL7NCwhN/kMaUZoyADp88dsVoTI8ZuNIi9r8RXXxijLfkjj5cuCJJREgH+YaZ
         PpKshMpzB2KDCkc30r51og7Mps1fmJU0iK6MK7S8I3WZR6cBHQN+4NGoFXHAZs4lFvF0
         kcJ9CxB8jEP/l5SkPTwThrO9nIJ+v6HDDFguOMV+SyJbGgI2p8+hraqT1G2ipDKF/qKy
         YbeUiTlK4SNjIthOgD3QK0jr6QVubPNYH6UbLthk4tCaifPAg+LxXWBC/Yx4hfIB85u2
         sQ4Iyl09LgK2i1hCmdZG3oAdKTMN/AmxmFNXKtqq6G87hCbST0qWzYziMPYEu7fo9Li5
         HKSg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:subject:message-id:to
         :from:date:sender:dkim-signature;
        bh=ET/qMoovU/kIJyYZwfoTGJcTvvCEe1Ui4SWkgSQIN9c=;
        b=ensWGPB7kGVWehBBv4idq2UUwvArQU+D5M5XK8ldzlfYuU13LoJDCA52/bdffo9ZTS
         XCPLyYGSjWexaXKDGEOov1MViQzRMYEpAcS/Y9B3RhhaC5VQBGsKvMXXJOIQvE4h58Zh
         VuOtw2uHcHcgA0Yuy0w/4NZp7k0CWCte8s5P6JwtodNJjwO7o961uN0lh15DSN/XjrGP
         Xziv6jA6jf46wMiKUQYcg9RVoPVGpcOQxbfojwFTseVlQ96X+hTbt3DKpK3zlcMGo4lG
         PgbRt9OuRMMGFD5NBAcOQLeJ+XfoS1Hup5iNS4h86k7GqkllB7yLw/zxGUtU9kMHdKPZ
         TuUQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="djOZINv/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ET/qMoovU/kIJyYZwfoTGJcTvvCEe1Ui4SWkgSQIN9c=;
        b=HjcuvZef7uUwrBrROlmQ5XOvtxUuqD01j/+Zxu0UfjYH8UIOgfVXE0qfkXndPGSavc
         7nPb0EIM8PHFLbxtKXPExFApdHEhOJb+GAwJ4wLvcNWc1fb1me+OZTaMT9WxayNmu5Lz
         X95aXLQlUUbZKCuXaou9UC0eGFXksoIQt+N6WVtW1uvwpoBzMuf3qKSiMa9wW83WBmfJ
         3yGK0hYjAk9gFYAplSI4/qBKhrKbcG7hyrptn6sbc9SpgP+NNSPP7vz55ChGIGypd13s
         QOmBcZ+jLs3Yb54rR2i7cu9KWwvmGf6IgyeRol4yHM5/wzUnNjCjDSJC9WNflCR55SBK
         gxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=ET/qMoovU/kIJyYZwfoTGJcTvvCEe1Ui4SWkgSQIN9c=;
        b=Sgx4P9QZI+CzIWLy08wI/HvCS5PVxYE5wfhLyVXphQVvrL6MKqLYWkmTtSYnHvfh1j
         PxgypbMuA3t4RJEKL4qXnj+QBsugRseYzIhIPNF9Hn0ynxYUNnzi5l3vDkaPRQcEmY0Z
         5nRxfXVihW+GiQ9xwjpXBoGChMv5vcW6Sn1qkdLcPTcQM8okhFO5+gz/p1xLFOwrP8Hy
         0AqDlzarOdnm0ivIPNF59Y0oLpb7zld129C2Fc8S3mds+IBXWpW6RTq7NgvF1fShYo+u
         ifeZWHVnNIS1OB8fguEciEy1dLinFqK9N39CxNCeCTGzF58mUi1qrEJ4t+MTaBFJPwb0
         DORw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXHOHGdDhXnz0w4QPweqx9aW1FgA/WuRUqZhFIMztrDPD95yg1K
	K2nCLQT4uu9LzglqlMeNc3o=
X-Google-Smtp-Source: APXvYqzCt77zhyVkUc+tUEW93Rk44Q3w8I7O0I5iQAaiIZ0biOi9L9Wut82ut/y1b2lEw9gpOJqsuw==
X-Received: by 2002:aca:cfd0:: with SMTP id f199mr1342614oig.50.1560509121492;
        Fri, 14 Jun 2019 03:45:21 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:6141:: with SMTP id v62ls1290629oib.9.gmail; Fri, 14 Jun
 2019 03:45:20 -0700 (PDT)
X-Received: by 2002:aca:c681:: with SMTP id w123mr1504400oif.32.1560509120859;
        Fri, 14 Jun 2019 03:45:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560509120; cv=none;
        d=google.com; s=arc-20160816;
        b=MSH6EcdKER0ukVS8oyVdoTbsO/VZV85I/Y4TtMmQw+Vs7AaNOEBa7VKz0h25+YCy+L
         wk66M+5ws7fsw25aHysEHjtt8xM1uphoyEE4L6CzQOsa/a5o7yYCHgMrTULwm3BoaFmN
         e8iH2m3LJfJfZrEEFFTO0TAR+7uBylPpal4Sl6uNvMECIELku4a0VSEocOMnoekSqhGX
         3Df7xVWOv8SUmKYnltjgRbxEO9hC2MO9A6FtL2iQ0Ql0cHH3aRoFSqfFrP5AArwtske/
         yvbOt69hbLzr4ngCRnR4f4AyiD8X+qjcqQoqzfBI4Mqcd31FIyMR66RSGrQWhqZzDcdI
         3FBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:subject:message-id:to:from
         :dkim-signature:date;
        bh=IB75OWDq9Nbn3rI47kYlo8dAfFWW35Jm9CCSElS5RdU=;
        b=T0xavMBuj8fk9So1g/Scwd3GNGB+6uonDZiutDdvrCjYCDbKOb7wn3GVO10/ZnGxyQ
         Dwg8/KqUL0ks8pLX8527CNdXR3nsR+sSc8Jjk1GUueMFxGYcWGNIaRuc5ytVQaXUeIRb
         SFosPi9fksXbFmaBAVbegO7GXleQo0Gk3/ZB9WPQNGpHx/3FKJw421Nt6NfutGW2POre
         BM39igCgcoeJO5hOYkBUntwlfP0PYC2rDuGgdsPNtH/3vXWy8Xg+7O9Jc5Ccltt4y5m/
         TdLDuI3X+7Ykk1aejnXL1mkXV9g+E/EDf2dXX1bMdsvRuW2QnR/dCHV1ZOZIzqBfej4e
         vnxw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass (test mode) header.i=@github.com header.s=pf2014 header.b="djOZINv/";
       spf=pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=github.com
Received: from out-7.smtp.github.com (out-7.smtp.github.com. [192.30.252.198])
        by gmr-mx.google.com with ESMTPS id r129si146178oib.4.2019.06.14.03.45.20
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Jun 2019 03:45:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of noreply@github.com designates 192.30.252.198 as permitted sender) client-ip=192.30.252.198;
Date: Fri, 14 Jun 2019 03:45:20 -0700
From: Jan Kiszka <noreply@github.com>
To: jailhouse-dev@googlegroups.com
Message-ID: <siemens/jailhouse/push/refs/heads/wip/cache-coloring/000000-ef4ac0@github.com>
Subject: [siemens/jailhouse] 914ee2: Common: introduce cache coloring
 primitives
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-GitHub-Recipient-Address: jailhouse-dev@googlegroups.com
X-Auto-Response-Suppress: All
X-Original-Sender: noreply@github.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass (test
 mode) header.i=@github.com header.s=pf2014 header.b="djOZINv/";
       spf=pass (google.com: domain of noreply@github.com designates
 192.30.252.198 as permitted sender) smtp.mailfrom=noreply@github.com;
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

  Branch: refs/heads/wip/cache-coloring
  Home:   https://github.com/siemens/jailhouse
  Commit: 914ee2709a94c44e7b407b375011545ec274d104
      https://github.com/siemens/jailhouse/commit/914ee2709a94c44e7b407b375011545ec274d104
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A include/jailhouse/coloring.h

  Log Message:
  -----------
  Common: introduce cache coloring primitives

Add fundamental primitives to implement support for cache coloring,
available both from the driver and hypervisor modules.

Define two main functions:
- calculate which bit range in an address is useful for cache coloring,
  assuming it limited by the page size and the LLC way size as happens on
  Arm;
- calculate the next physical page address that conforms to a given colors
  selection and to the bits calculated in the previous function.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
Signed-off-by: Renato Mancuso <rntmancuso@gmail.com>


  Commit: f12e23fb27e5c4971cef50b8c8927899533d3607
      https://github.com/siemens/jailhouse/commit/f12e23fb27e5c4971cef50b8c8927899533d3607
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M hypervisor/arch/arm-common/mmu_cell.c
    M hypervisor/control.c
    M hypervisor/include/jailhouse/paging.h
    M hypervisor/paging.c
    M include/jailhouse/cell-config.h

  Log Message:
  -----------
  Hypervisor: implement cache-colored paging for Arm

Add functions for colored page creation and destruction, and introduce
new memory flags to mark colored regions.

The story of the life of a coloring page can be summarized as follows.

1. Bits in the address that are useful for defining colors are computed, and
   used for all mappings. The page size used to obtain the lower limit is
   assumed to be aligned with the `PAGE_SIZE` constant defaulting at 4 KiB,
   and also as the unit for the mapping operation, even when consecutive pages
   would be possible.

2. The colored regions can then mapped with a new paging function and
   destructed with the old one, because `paging_destroy*` acts on virtual
   addresses and while coloring happens on the physical ones.

3. The colored unmap function is instead used only when destroying the root
   cell mapping, since we assume that the root cell uses a 1:1 mapping for
   memory regions.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 1b5d2ed0e427833ffd103c7283c1e3bd0b977f01
      https://github.com/siemens/jailhouse/commit/1b5d2ed0e427833ffd103c7283c1e3bd0b977f01
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M hypervisor/control.c
    M include/jailhouse/hypercall.h

  Log Message:
  -----------
  Hypervisor: add hypercall to ease loading of cache-colored images

Add a new hypercall that maps a colored memory region to the root cell so
that it can be seen as a contiguous region. This allows the usual load
function in the Jailhouse driver to be seamlessly used; it also avoid
duplicating the coloring logic by keeping it all in the hypervisor.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 865c37a86b393484ac12660c09153d4ac7cdd1a4
      https://github.com/siemens/jailhouse/commit/865c37a86b393484ac12660c09153d4ac7cdd1a4
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M driver/Makefile
    M driver/cell.c
    A driver/coloring.c
    A driver/coloring.h
    M driver/main.c

  Log Message:
  -----------
  Driver: add support for cache-colored memory configurations

Add support for colored memory region in Jailhouse driver module and
implement an automatic colored allocation system.

The hypervisor module implements the coloring logic and it can be used
by defining appropriate memory regions inside inmates configurations.
Add a new set of functions in order to create a more controlled cell
creation process if coloring is activated.

We support two types of coloring configuration:

- manual: the user must take care of all coloring problems (e.g. memory
  overlapping, real size used and so on);

- automatic: the user has to define only the colors for the region and
  the driver interface will take care of everything, assuming to assign
  portions of a unique colored memory region and showing up errors if
  needed.

N.B. The coloring interface is enabled in the Makefile only for Arm v8
     because it is the only architecture tested.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: 3b71560b4620dff81357d569d2db45630dabd9ec
      https://github.com/siemens/jailhouse/commit/3b71560b4620dff81357d569d2db45630dabd9ec
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    M tools/jailhouse-cell-linux

  Log Message:
  -----------
  Support cache-colored memory configurations when loading Linux inmate

Since cache coloring support adds a parameter (colors selection) to the
`jailhouse_memory` struct, update the script to allow Linux inmates
to be loaded.

Change the format accordingly to the modified struct and add the color
parameter also to the `MemoryRegion` class.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: ab972798ea0ecc8596ca28bd2be2601807c39546
      https://github.com/siemens/jailhouse/commit/ab972798ea0ecc8596ca28bd2be2601807c39546
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A configs/arm64/zynqmp-zcu102-col.c
    A configs/arm64/zynqmp-zcu102-demo-col.c
    A configs/arm64/zynqmp-zcu102-linux-demo-col.c

  Log Message:
  -----------
  Configs: zynqmp-zcu102: add cache-coloring examples

Add colored root cell configuration for the ZCU102 evaluation board
along with two non root-cell configurations both for a bare metal inmate
and for a Linux one. In these configurations we are using the automated
colored allocation and we are assigning to each memory regions half of
the available colors on the platform.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: d56b3a0ea14fc4d1e057a0cb8f8aebd299c3365c
      https://github.com/siemens/jailhouse/commit/d56b3a0ea14fc4d1e057a0cb8f8aebd299c3365c
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A configs/arm64/jetson-tx2-col.c
    A configs/arm64/jetson-tx2-demo-col.c

  Log Message:
  -----------
  Configs: jetson-tx2: add cache-coloring examples

Add colored root cell configuration for the NVIDIA TX2 development board
along with an example of a non root-cell configuration for a bare metal inmate.
In these configurations we are using the automated colored allocation and we
are assigning to each memory regions half of the available colors on the
platform.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


  Commit: ef4ac0fc80a68132b639440905d415194979d90d
      https://github.com/siemens/jailhouse/commit/ef4ac0fc80a68132b639440905d415194979d90d
  Author: Luca Miccio <206497@studenti.unimore.it>
  Date:   2019-06-14 (Fri, 14 Jun 2019)

  Changed paths:
    A Documentation/cache-coloring.md

  Log Message:
  -----------
  Documentation: add description and usage of cache coloring support

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>


Compare: https://github.com/siemens/jailhouse/compare/914ee2709a94%5E...ef4ac0fc80a6

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/siemens/jailhouse/push/refs/heads/wip/cache-coloring/000000-ef4ac0%40github.com.
For more options, visit https://groups.google.com/d/optout.
