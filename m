Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBXHH4OBAMGQE4NAFMPY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2337D345030
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:45:33 +0100 (CET)
Received: by mail-lj1-x23c.google.com with SMTP id p4sf59099ljj.1
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:45:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442332; cv=pass;
        d=google.com; s=arc-20160816;
        b=xc3avPMERUdQl0neGNRWSQcln4liQ8cEVNmWylomv1lC1ZT+aOlRX1zSjJOlRKVa7c
         lA1amd8lJnItM2p8ByaDOF++OOaUU/aaLGPVggSz/jAeSDHhZrtdN22LidZs7yTNOBrw
         ok1UD8HMJS7tXrPCmUFSuo/WQo3zvemHRcVp9tPil1qhoO76U5Aq3VyKtr93rD1UNd+z
         JENkw7Xb6hdH3fkEf98mBDnZXHZx/5R6sqJdVqFdoxH9AYdTDOvxou9vDzOW1j5Or+Sm
         wP3tFFVg87zIm/A/Wx4sX0DR5Ys/7uOvTNqhS5vJvzOrTlpdlNzFW21HpNBBsU+3WBxx
         3XFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=h4UHjO+Bf5pl5f40f6Jq17yF9KKo2f3TM5UM9NyEcV0=;
        b=idEvJeKWaOuSJX7rZaGYuZfi8QM/SniJ2s5tWNXPq/nCcqIrpTmd4OStq4fXmRI1yk
         E/IUIQedNkqxgrA0faSdEDwkRh7lLVwDi+ABkptGsSCjRrNnnCY7ujgX6nj2p/NCzyIe
         8EipFCtbDbrbNkzdzU3NN6DRYwORlgtrh56u1TJGbqiyQXlRRZbVhBYogwaVuTwEnaHA
         Szixjc7AB4Acc6mJO9GPScExJA/xyzJ2/j+qQ+P91wN+7WMsCty85RP7FD/eDvhg7KMO
         iiK3sfHDTEiXb0L9nguFfGyK7C1JQlnsXqSUIn6wdekobgdfIEsr/76pWOJcLrt3XOWg
         Sf9Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=GyVDBHMe;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h4UHjO+Bf5pl5f40f6Jq17yF9KKo2f3TM5UM9NyEcV0=;
        b=oEUP3FgUgvguh2cnAFAvj3+WttYSRL7GNVWQrami2tQLVihe++SjkEzTSzC8bJqKmJ
         jloI0V4I0IvmMszeofm0MHIGOntXNZ1NxXZQ/SLuCzBdDOCbSoxZUrkjxkpsjK/FfVMr
         BdGz8IQrENpzOLAmujWD72/4B5RJqVOlTLBw52Evx8lyAUU8fJABTYl4XQXVWn5ErAmh
         L07xvHunj56UPVmRKpx22ByM3XerHVkQ3hRvSQN36DpD2lsVeMYIz+8+z+EozKzENJm6
         1qDqxM53ss0muMzc9axUckC80FsyT2YvNDy2BYlAVhQKC7BArqiD2806fLmhnfmjy+xg
         iJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=h4UHjO+Bf5pl5f40f6Jq17yF9KKo2f3TM5UM9NyEcV0=;
        b=TPHdBKcXwPrr6hGPVIIe1cBoohYsbUM3UT7Uq4ntb89rI4XuiSBc8uxPVayHKLB6O1
         WTqSupi1yGEwGPsLHBkMNPKXGBO8eElAXWg5GTU8IE41wSMcR+PV3KngKEf7mgumFDmd
         tSwbHL7ShL8ggx74rTy5HSvFQdJoraJiKQlyH6fCC3Br4Rk0nzQjMi85uZhLCtHb6W/u
         8ioL9DIpzK+NZvz3nizEzU7xNTuqCxO8tyq9IGwWS0guBgqyn/U4K083DwnLcKWui+It
         TLh4peBuho4D/vVYi8mDulRD3JA2M3Gy2i8LEfMubsLZATyxQ3paBwJ7y7ETxu4VUWvu
         o2xw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532xqyfMBTE+lcMGwLMB2eIHaLBPFvlp8z9F8yyyxkWITOo8GP6X
	ApXiuycQfvfuMAVH/aZclgY=
X-Google-Smtp-Source: ABdhPJxPS5zySJhr+1EFjCc8pdDMmqm/CdtHZvKEvalvo88SXFIOBOAMYlniuLhgPQRRgYkgmwfylg==
X-Received: by 2002:a05:651c:545:: with SMTP id q5mr705478ljp.14.1616442332682;
        Mon, 22 Mar 2021 12:45:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d16:: with SMTP id d22ls3179007lfv.1.gmail; Mon,
 22 Mar 2021 12:45:31 -0700 (PDT)
X-Received: by 2002:ac2:4111:: with SMTP id b17mr526748lfi.96.1616442331722;
        Mon, 22 Mar 2021 12:45:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442331; cv=none;
        d=google.com; s=arc-20160816;
        b=lgha2Iiu/jf4HxsGX/4lHHvCwxbAHlRHH+/S97i8Zp1p0grzHkxq5zsjhXWJgLGNnN
         bFqXlZwD4NRWVfF++jVhImtr+kmC6lfsQCB1u2l4ncx/tSeCvhLVu7VAMCGQmHf9N0rI
         MOA9b6iL+QlfLUv2Lp9c3+CGssC5vVqFdrYmm7xPRyF408URw7NH7pKH/ANVziacxvgK
         8BWmDgzKNnhClmbWGjPZZsQVwif6frkD0SFKwy+oPteGPOsSfpHWLZupo/xiQ/WTcnp6
         YscIhqgxWujA5cJTaxvkA/auf2MfhDaUsR2bdg+gAK0/uEuwBj0mq+OdDVOnO23yNthC
         6sbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZIr63PDazudZn/Ln8seiz2WAZucUtAGuf6W/ROEiz3M=;
        b=YvrNPKFx95IAkpekec7UIiI1X3VtbTsAjZTsPde3JC1dgdB328scBARuoC6kLUFwre
         +qHyXjxPaX8y91HBan5NHXpwnjskddCAzq+6gt0Vju0f/1UwWHJ+yhGxCHwR2Rlun2E/
         j9PrGZc+xTDDcuG4h5G040uPtdxPX5Avtpmh+W9zNLHfrRLTc2BRSHiKhd6wuBtiCGqu
         2yht+5DiyCxaMBNRRecl+sNqJ2dOJP0o//eTWsvCQDsEssoXbmsf4AVIwLm/eah/f/6m
         9tKsztapLqofhfusWiDIDjeCspgb2od9xAqGMQS+JkKIhuG50VEgj8Aq6DGU94BdIERa
         vn0Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=GyVDBHMe;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id a66si441198lfd.7.2021.03.22.12.45.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:45:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44jR1bxdzyXW;
	Mon, 22 Mar 2021 20:45:31 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_URL_PLAIN_SINGLE=0.001] autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id hbE6du1YEDnh; Mon, 22 Mar 2021 20:45:30 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44jQ2vnbzyVB;
	Mon, 22 Mar 2021 20:45:30 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Marco Solieri <ms@xt3.it>,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.2 6/9] Documentation: add description and usage of cache coloring support
Date: Mon, 22 Mar 2021 20:45:04 +0100
Message-Id: <20210322194507.82643-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194507.82643-1-andrea.bastoni@tum.de>
References: <20210322194507.82643-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=GyVDBHMe;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

From: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <ms@xt3.it>
[Andrea: adapted to reflect the current proposal.]
Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 Documentation/cache-coloring.md | 198 ++++++++++++++++++++++++++++++++
 1 file changed, 198 insertions(+)
 create mode 100644 Documentation/cache-coloring.md

diff --git a/Documentation/cache-coloring.md b/Documentation/cache-coloring.md
new file mode 100644
index 00000000..408555ed
--- /dev/null
+++ b/Documentation/cache-coloring.md
@@ -0,0 +1,198 @@
+Cache Coloring Support
+======================
+
+Introduction
+------------
+
+### Cache partitioning and coloring
+
+#### Motivation
+
+Cache hierarchies of modern multi-core CPUs typically have first levels dedicated
+to each core (hence using multiple cache units), while the last level cache
+(LLC) is shared among all of them. Such configuration implies that memory
+operations on one core, e.g., running one Jailhouse inmate, are able to generate
+timing *interference* on another core, e.g., hosting another inmate. More
+specifically, data cached by the latter core can be evicted by cache store
+operations performed by the former. In practice, this means that the memory
+latency experienced by one core depends on the other cores (in-)activity.
+
+The obvious solution is to provide hardware mechanisms allowing either: a
+fine-grained control with cache lock-down, as offered on the previous v7
+generation of Arm architectures; or a coarse-grained control with LLC
+partitioning among different cores, as featured on the "Cache Allocation
+Technology" of the high-end segment of recent Intel architecture and supported
+by the Jailhouse hypervisor.
+
+#### Cache coloring
+
+Cache coloring is a *software technique* that permits LLC partitioning,
+therefore eliminating mutual core interference, and thus guaranteeing higher and
+more predictable performances for memory accesses. A given memory space in
+central memory is partitioned into subsets called colors, so that addresses in
+different colors are necessarily cached in different LLC lines. On Arm
+architectures, colors are easily defined by the following circular striding.
+
+```
+          _ _ _______________ _ _____________________ _ _
+               |     |     |     |     |     |     |
+               | c_0 | c_1 |     | c_n | c_0 | c_1 |
+          _ _ _|_____|_____|_ _ _|_____|_____|_____|_ _ _
+                  :                       :
+                  '......         ........'
+                        . color 0 .
+                . ........      ............... .
+                         :      :
+            . ...........:      :..................... .
+```
+
+Cache coloring suffices to define separate domains that are guaranteed to be
+*free from interference* with respect to the mutual evictions, but it does not
+protect from minor interference effects still present on LLC shared
+subcomponents (almost negligible), nor from the major source of contention
+present in central memory.
+
+It is also worth remarking that cache coloring also partitions the central
+memory availability accordingly to the color allocation--assigning, for
+instance, half of the LLC size is possible if and only if half of the DRAM space
+is assigned, too.
+
+
+### Cache coloring in Jailhouse
+
+The *cache coloring support in Jailhouse* allows partitioning the cache by
+simply partitioning the colors available on the specific platform, whose number
+may vary depending on the specific cache implementation. More detail about color
+availability and selection is provided in [Usage](#usage).
+
+#### Supported architectures
+
+Cache coloring is available on Arm64 architectures. In particular, extensive
+testing has been performed on v8 CPUs, namely on the A53 and A57 processors
+equipping Xilinx ZCU102 and ZCU104.
+
+### Further readings
+
+Relevance, applicability, and evaluation results of the Jailhouse cache coloring
+support are reported in several recent works. A non-technical perspective is
+given in [1] together with an overview of the ambitious HERCULES research
+project. A technical and scientific presentation is instead authored in [2],
+where additional experimental techniques on cache and DRAM are introduced.
+
+An enjoyable, comprehensive and up-to-date survey on cache management technique
+for real-time systems is offered by [3].
+
+1. P. Gai, C. Scordino, M. Bertogna, M. Solieri, T. Kloda, L. Miccio. 2019.
+   "Handling Mixed Criticality on Modern Multi-core Systems: the HERCULES
+   Project", Embedded World Exhibition and Conference 2019.
+
+2. T. Kloda, M. Solieri, R. Mancuso, N. Capodieci, P. Valente, M. Bertogna.
+   2019.
+   "Deterministic Memory Hierarchy and Virtualization for Modern Multi-Core
+   Embedded Systems", 25th IEEE Real-Time and Embedded Technology and
+   Applications Symposium (RTAS'19). To appear.
+
+3. G. Gracioli, A. Alhammad, R. Mancuso, A.A. Froehlich, and R. Pellizzoni. 2015.
+   "A Survey on Cache Management Mechanisms for Real-Time Embedded Systems", ACM
+   Comput. Surv. 48, 2, Article 32 (Nov. 2015), 36 pages. DOI:10.1145/2830555
+
+
+
+
+Usage
+-----
+
+### Colors selection
+
+In order to choose a color assignment for a set of inmates, the first thing we
+need to know is... the available color set. The number of available colors can
+be either calculated or read from the output given by Jailhouse once
+we enable the hypervisor.
+
+To compute the number of available colors on the platform one can simply
+divide
+`way_size` by `page_size`, where: `page_size` is the size of the page used
+on the system (usually 4 KiB); `way_size` is size of a LLC way, i.e. the same
+value that has to be provided in the root cell configuration.
+E.g., 16 colors on a platform with LLC ways sizing 64 KiB and 4 KiB pages.
+
+Once the number of available colors (N) is known, the range of colors to be
+associated to a memory region (see [cells configuration](#cells-configuration))
+can be specified as a bitmask where contiguous bits specify a color range.
+E.g., if 16 colors are available, a color bitmask `0xffff` corresponds to the
+full color palette i.e., the full `way_size`, while a color bitmask `0x000f`
+selects only 4 colors for the inmate.
+
+#### Partitioning
+
+We can choose any kind of color configuration we want but in order to have
+mutual cache protection between cells, different colors must be assigned to them.
+Another point to remember is to keep colors as contiguous as possible, so to
+allow caches to exploit the higher performance to central memory controller.
+
+### Root Cell configuration
+
+#### LLC way size
+
+The LLC way size can be specified as parameter `way_size` in the
+`struct jailhouse_coloring` `color` structure of `platform_info`.
+Currently, if `way_size` is not specified, the system will compute its value at
+enable-time.
+
+#### Temporary load-remapping address
+
+When inmates use cache-coloring, a temporary load address is used to facilitate
+coloring of the inmates during load-mapping via the root cell. The start address
+of this temporary region can be provided via the `root_map_offset` parameter
+in the `color` structure of `platform_info`.
+
+For example, a 16-way set associative cache sizing 1 MiB has a way size of
+64 KiB, and the the temporary load-remapping address is set to 0x0C000000000.
+```
+...
+.platform_info = {
+    ...
+    .color = {
+        /* autodetected if not specified */
+        /* .way_size = 0x10000, */
+        .root_map_offset = 0x0C000000000,
+    },
+    ...
+```
+
+### Cells configuration
+
+A colored memory region is identified with the flag `JAILHOUSE_MEM_COLORED`.
+The color bitmask specified in `.colors` identifies the colors associated with
+the region, i.e., the `colors` bitmask applies to the mappings of the
+`mem_region` entry. Different `mem_region` entries in the same cell may have
+different colors. Coloring a `mem_region` doesn't change the specified `size`.
+```
+...
+struct jailhouse_memory mem_regions[12];
+...
+.num_memory_regions = ARRAY_SIZE(config.mem_regions)
+...
+.mem_regions = {
+    ...
+    {
+            .phys_start = 0x801100000,
+            .virt_start = 0,
+            .size = 0x10000,
+            .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                    JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE |
+                    JAILHOUSE_MEM_COLORED,
+            /* Assigning 1/4 of the colors */
+            .colors=0x000f,
+    },
+    ...
+}
+...
+```
+#### Overlaps and colored memory sizes
+
+When using colored memory regions the rule `phys_end = phys_start + size` is no
+longer true. So the configuration must be written carefully in order to avoid to
+exceed the available memory in the root cell.
+Moreover, since the above rule does not apply, it is very common to have overlaps
+between colored memory regions of different cells if they are sharing colors.
-- 
2.30.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194507.82643-7-andrea.bastoni%40tum.de.
