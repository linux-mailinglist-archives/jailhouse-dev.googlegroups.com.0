Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBEMK7P2AKGQES36MKWQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id 886151B2388
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:02 +0200 (CEST)
Received: by mail-lf1-x139.google.com with SMTP id d5sf5605840lfb.5
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463442; cv=pass;
        d=google.com; s=arc-20160816;
        b=Fy9luRQvNOpV+n/Pcxh5/gYt4kAnC8Nw+vypf+JPBW3V0x0+neQtSXER/VEY7xUmyl
         2xMSy4epjHWqjMAAP/7Tff6DeKrxOT/mgfZ89PvJNKDUXVW6TAzxaUnGrHG6ocotN46v
         tq+yl0hvepsTctHBFGXFTAwmchttQe4VGLBgpI318J8ixDnhSRdjc/qArAi49GjBFFnv
         YP3IGT4swwliidOSnX0U1zQQK/r5b145YCt4vT39cz+if7aDCczqzSkWNHh56L5ywqLU
         +yCRvldYVvusssInNbYU/nvBlV8enXWtbH8km5+myLU2918C8wrF8IMX+1CITBa1cRnB
         DfGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cyo9LVsQWvM1q7H2ZSRE4jJzcjaREYx11gh/sYbLs3Y=;
        b=jC+hIXB/WIBVpjbqngj2QEE8XTnG3q0UNn8lhbY5KHdN/wzfeFEZkD4U9mqC8BU36C
         A5I6LoWED3zbLdg54YbiwqywDZEl1b2ynehdK+03VLjNgXzkgtiiAWU96RKfal2+q5rU
         Zf8YU9fmURMS2jxx3n0fWYPOcHtU4s91gWQNrmqlOyS66AlmUkztAr5HArNmBzu0zdUQ
         muE8vUKb4FPI6LIrBQzXpOt3lwIVvDopvwYi+x6sJ+zWhOoh5zrOEA3baRmc0ppAlKHv
         +ql8S95G41xiQf8/KfDF+ON6Z3cLdR55gfxqxfco07oDAVq2e3mdrGOSr3PCArP0GZIv
         Q0xQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=ep0891DS;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cyo9LVsQWvM1q7H2ZSRE4jJzcjaREYx11gh/sYbLs3Y=;
        b=Krg2S5uiDH3TYua5e3mS1xpaz3ll+kjKMBDcXCqCLNM3WhrYNd4bCB+juc689J4+wD
         MVu0yr2qzsi8e+yq3rE+FS/N1SkjbdqBaKYBTUI0bogkteSb19mdPsaElINJ7YRJ2oJl
         GJi0iOnUZeTih9ek+GrvZ/CL+QMpOnCGUMrbPpkYu6onrz00ZSzmOq3UlgYQ0tDSxaZT
         nIED6c/2tDSTlfL8JiDUX0WwAuSszku/0H/TcgRYa20q4rMjxHvWQyAPRhySAGdJ7R1a
         rl23KnXwwAHxd+6My1TBl2H416R1/XuO6+A8papy7L24HL1GdDT1wztBjexVgi4MMTvM
         a7Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cyo9LVsQWvM1q7H2ZSRE4jJzcjaREYx11gh/sYbLs3Y=;
        b=GYwq7qvuroe2Sn9G+BclbQ1/EqksAV5VABGkWWPcTetxBfIK+btNTgegoJXI5++GmA
         rqF4EnzB9oWh7fMlz+IJc7Zbr7HC7fBHkr2fmMI0nvZtXAOKcRllNxtzDJ+IDh2WH+Im
         ynUc8tb87tRRb0HZWMiB820fc8E/rCWapEiq70lNZnHim+QJnr1/AjjvNcli9I6uIGJn
         57tqOXtM6auWufD7Mq5S92c2KqNKiGvWdIgGYUOm2ZEcm3kubz+WECcZ/A7VrdhExqdp
         1gfNFuUQeR+K2ZlvBKdwKRsZzLgIGox6gBc43yinneLqGPTLBBSkZ9ef3xy83kfGiY3b
         R/Sg==
X-Gm-Message-State: AGi0Pub3w2flcnHZ8CtTv8RJrmgiD5/n1E5BpXvP8koNllcS9aKMNE6p
	7+oIiJeWrZSyP3exNjKmTn0=
X-Google-Smtp-Source: APiQypLHRITrI4djQJRFEDX1LX8HnSeW6cboiLcdbZ1LxhTj1ORkvY0IcPj4BU0N8wO/rxGhC9elUA==
X-Received: by 2002:ac2:58f6:: with SMTP id v22mr13025464lfo.146.1587463442014;
        Tue, 21 Apr 2020 03:04:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:504c:: with SMTP id a12ls2155672lfm.8.gmail; Tue, 21 Apr
 2020 03:04:01 -0700 (PDT)
X-Received: by 2002:a05:6512:52c:: with SMTP id o12mr12929251lfc.217.1587463441135;
        Tue, 21 Apr 2020 03:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463441; cv=none;
        d=google.com; s=arc-20160816;
        b=PpDCveB/ab0wGxJASx9EH5wGHksGk23WsM6qp3MXEnf7ZhljGV/olcK47xIasUM7vc
         YPG3AXVcNI9B7ZrLAKv1BbV49ZfnNX5ZSawsvnAxWpOkOlNvdRUh37xaCMZ7mN4NT7UE
         N6f5s/QeetsUw2ppn+SF4Gk2k2N2t9wvwG1/IEkhFin2WLJgDnDSTz6qJXKfVYMwk0OF
         AkKsmRqVG02M08XIOgCDStvQmy3aztGfq5mKxhliC+tVNAMH7Y12mIdpJooGRJICYs6C
         rwA7X5vY2CNxZTFv0jJyHswMQg932LAO7AqXtuYR8WWSt80uz2qOf+hPu/1C/Lkl3ZCs
         sWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=YiUhF0fczMVuwKL3uKUYd1fZLuhz/yHkCcTigt6NIXg=;
        b=sai49AkWslRptLMktYvsC6/FKVG5yQT1HuITzIUb0FEdS533JM16CSsiyGfTIIYupQ
         FbXLitkJKzYk21pk7ChkcNgXFdnB0TJo2u1baS4vee/guYlY7z+1nj9gQntDFZkt9lDv
         BNOu1sSUhiPKjbBXKRKYlVXm3cNvYC3AzL+yTPGW+fWEC1IAXp6FSGQABf9owmD3WewD
         dvmikB9QOthZNaIvOPj9ZVBwKoOIvGIYfQuS0hFnmO1d04sEQeWT8Gi5WNOWx3htqeuu
         avNvN5yLK/TAsWj6yXybogNMihJJukIOsJtJeuXUPNpC6xdehfScLqYGVT3u0qGpEkrC
         SGPA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=ep0891DS;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id s22si129122ljp.0.2020.04.21.03.04.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl1-0005At-2s; Tue, 21 Apr 2020 12:03:59 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 0/9] Add cache coloring API and arm64 support
Date: Tue, 21 Apr 2020 12:03:42 +0200
Message-Id: <20200421100351.292395-1-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20190327121849.1882-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
MIME-Version: 1.0
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=ep0891DS;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
Content-Type: text/plain; charset="UTF-8"
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

This series proposes major reviews to the cache coloring support
proposed on 2019-03-27 on this list [1].

We first summarize changes and then give a bird-eye view of the new
commit structure.  Background and motivation can be found in the
previous proposal [1].

Changelog
---------

### Suggested changes

- Drop the hypercall addition, which was introduced in v1 to perform
  image load into colored memory regions, but was judged excessive [2].
  Now we create a specific temporary memory region used by the driver
  module.  This region is created and destroyed properly when loading
  and starting inmates respectively.

- Simplify color selection: no longer mem_region-wide, but cell-wide, it
  is represented by a set of ranges defined by existing jailhouse_cache
  structure, as suggested [3].  Beside repeatability of partition
  selection, the syntax is almost identical to CAT's one.


### Improvements

- Confine coloring logic exclusively in the hypervisor layer.  This
  decouples it from the driver.

- Add architecture-independent hypervisor coloring support API,
  currently instantiated only for Arm v8.  This provides an easy and
  clean way to add support for Arm v7 or x86 platform.

- Introduce automatic coloring setup initialization, by hardware-probing
  the last-level cache geometry.  The user can always override the
  default in the root cell configuration.

### Minor changes

- Rebase to master.
- Drop Nvidia TX2 support, due to broken Jailhouse support for latest
  JetPack 4.3 [4,5].


Overview
--------

The coloring API for the hypervisor is first defined (1/9), then the
architecture-independent implementation for the paging sub-system is
given (2/9).  This allows the arm-common (4/9) and arm64 (7/9) specific
code to be added.

We introduce a user-configurable IPA address (3/9) where the driver can
contiguously, though colorfully, load images (6/9), thanks to the
appropriate mapping served by the hypervisor (5/9).

Examples root cell and demo configurations are provided for Xilinx
ZCU102 (8/9).

An extensive documentation details the technique and gently explains how
to use it (9/9).


Links
-----

1. https://groups.google.com/d/msg/jailhouse-dev/6Fli5XkTx_s/8_B1bXykAAAJ
2. https://groups.google.com/d/msg/jailhouse-dev/7U5jYXIXuF0/kApS9mceCQAJ
3. https://groups.google.com/d/msg/jailhouse-dev/6Fli5XkTx_s/x_xm9_owCQAJ
4. https://groups.google.com/d/msg/jailhouse-dev/Vf4Ea1bSzrc/fcf78lxLBQAJ
5. https://groups.google.com/d/msg/jailhouse-dev/MJPon1kP4jQ/h03eo4qUGQAJ

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Luca Miccio (9):
1. hypervisor: introduce a common cache coloring interface
2. hypervisor: implement paging_create/destroy_colored
3. driver: introduce col_load_address for colored binaries loading
4. hypervisor, arm-common: add initial support for cache coloring
5. hypervisor: introduce color_root_cell_management
6. driver: handle loading to colored regions
7. hypervisor, arm64: add cache coloring support
8. configs: add colored cell configuations for ZCU102
9. Documentation: add description and usage of cache coloring support

 Documentation/cache-coloring.md               | 278 ++++++++++++++++++
 configs/arm64/zynqmp-zcu102-inmate-demo-col.c |  79 +++++
 configs/arm64/zynqmp-zcu102-linux-demo-col.c  | 128 ++++++++
 driver/Makefile                               |   4 +
 driver/cell.c                                 |   8 +-
 driver/cell.h                                 |   3 +
 driver/main.c                                 |  15 +
 hypervisor/arch/arm-common/include/asm/cell.h |   4 +
 .../arch/arm-common/include/asm/coloring.h    |  22 ++
 hypervisor/arch/arm-common/mmu_cell.c         |  62 +++-
 hypervisor/arch/arm64/Kbuild                  |   1 +
 hypervisor/arch/arm64/coloring.c              | 232 +++++++++++++++
 hypervisor/control.c                          | 128 +++++++-
 hypervisor/include/jailhouse/coloring.h       |  96 ++++++
 hypervisor/include/jailhouse/paging.h         |  11 +
 hypervisor/paging.c                           | 155 ++++++++++
 include/jailhouse/cell-config.h               |  14 +
 17 files changed, 1221 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/cache-coloring.md
 create mode 100644 configs/arm64/zynqmp-zcu102-inmate-demo-col.c
 create mode 100644 configs/arm64/zynqmp-zcu102-linux-demo-col.c
 create mode 100644 hypervisor/arch/arm-common/include/asm/coloring.h
 create mode 100644 hypervisor/arch/arm64/coloring.c
 create mode 100644 hypervisor/include/jailhouse/coloring.h

-- 
2.25.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200421100351.292395-1-ms%40xt3.it.
