Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJHGXKAAMGQER3NPAVY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 47E20302491
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:41 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id w4sf7241540edu.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576101; cv=pass;
        d=google.com; s=arc-20160816;
        b=mypKCpUKI3auIecc/VIoi3rOCiEbasNCmMBQH7Lr/yFzaFPP1BHdCUUObmATqBfLYf
         i3KUraKPiE7JRAjOVFwRZLFABYwh4NQf9OPSnJ5dGp6wjBpaWRbMhDXIq1scNkqceHGq
         +TucnGnnSCwwdsqQ+QC7G485fqoNaKJyfbFab5WvnEcg2NkxHlvIDczt5/Fvp/gPvHWr
         6bpDVF9B1nm9G1m1WsnJeWfE9COy5FAz9k2qtD4y9CZagKcGldzdfP/vliY2wXx59qkD
         BpDqdF7UoJbl7Q0sOHa4jCO9DAQOQIfFzsg4ShO3rFqWl0oM/x5+2C62bGmUpKzS8g6f
         L7ag==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=Kifd2ISCY/slCttns9aEMNmyxyDdFJJ2fUBC0bIcp2Q=;
        b=i8hhkLCTSzOy+vya7vNyhudBK7Aod8QA10qlWBs0pdnkq+NIJNVRpF3V/YITEOG0hs
         X4DPHnFlReaaABYkixam7mkbZS0+tOMXhYgzwnz9/k4EY4SDS4zfsdu9bLz8C1s6IxkL
         rBddhD88BRrEAjLaAKbC8pn8peIyoSyXyKaQ7z82J9lz06Jetk/kehTJWr8aUPGtP8zj
         pm6EYyIL3j5oojs+v1TjaSDnnUTacK10Y0nQisBEa19IYc+uZfHHVuWXxRlXfemruxV0
         OF5ALkGVbaL7nbl9FtjRO7PlJ3THaySuzsxdx0lCzZhvqK4qjw1cNos56uawdhpQzQN5
         YdAg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IGscdRcS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kifd2ISCY/slCttns9aEMNmyxyDdFJJ2fUBC0bIcp2Q=;
        b=crW7isfuC3tc7Nz8yhuB4Wge73iZ0qWsI3ATCG2YX+jm24PDg0ONuURUtGZtFkD8Rn
         2WdQzsjmLRHqGpIuJ6iw+WpKxsctIVIxoIz6ESekcsV66dz2kpGZpPyq5Q2n/uhut3FG
         2uKJYd4F76ZvfqrRwt9JPd1ZRodp47SYRNjQbjaOybmopFx5oqG308unn2oh7RW+0+EX
         gPrWR7+1HociCS8K9wzxAqt7DYFOZfK3JUhfKGr3S16pn8a7+390xpRwATxycqhLQXB5
         QgoTiCKsWdm6ipOyPaZZAnJroGGw83prUaBecPnlcl30xuMYc3IZRlvhiyeW8qIaCNuz
         cH9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Kifd2ISCY/slCttns9aEMNmyxyDdFJJ2fUBC0bIcp2Q=;
        b=fQjsIy6VOm0o7RZsxV1mNmua+tIsxPyc3olzzdL6kyjnSUph57h7+L+8nBlvUBPUZJ
         k85hiSP4//We8qQu/GJLVsmkzXCSpZ/FsMbIfIaBwMiyEZ908C9o+NBRBcPpxJNQIoFr
         aoFk5pgLwdobTsmAi1SHkLbUj2BL7Xib+5U8M4OXv1juP0Vjo8ymkYoeqMmezea6Bhhd
         miJORc9f25K2St2OUPGu2JyrPrgnTQdqVPiGyaoN2XxQIvi4HcveF0q3XDMvhJRDzFoj
         /8ediCzW1wbIp7w7UcTkkZMYv6FA20eMl6fr5EDRgFyb3Uxmm9hcFj9LHEn6K8M+q1BL
         pizg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533qSDovU+ZCVjTZXQgeBSY5j8MXvvK0IUb4PJ8YFYA7Wy4VWEvf
	FJAGinwOfYcuWhy3Jvs33A4=
X-Google-Smtp-Source: ABdhPJxW26ke0TIZRKd5/Kgx1V24ymL3lzFxIj82EPDoqmtmJNJbiyPATjrnQwbHymO6KchMGVHsqQ==
X-Received: by 2002:a17:906:c9d8:: with SMTP id hk24mr152096ejb.468.1611576100931;
        Mon, 25 Jan 2021 04:01:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c159:: with SMTP id r25ls16119130edp.1.gmail; Mon, 25
 Jan 2021 04:01:40 -0800 (PST)
X-Received: by 2002:a05:6402:2288:: with SMTP id cw8mr133909edb.161.1611576100228;
        Mon, 25 Jan 2021 04:01:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576100; cv=none;
        d=google.com; s=arc-20160816;
        b=ZVfDusV7fLhIRT98/oP1RLY+ElVSOcEL/ea+0E6edJIZer/waK1gTY+ne9fovbM6GP
         AA7mNnxKlMXvk20Y4I35QOY8iG7XR0fCV6oTJ2fBFVvnRZNZbAgzJn1XpeDf2v1PuRhw
         08FkYCUTSdM7jeaz2lgzkTqwFQ7SP8NhgLebrhKwjhSAVWP3EXhHBqtH8CNJHyUXvZjR
         +GqANVecelUEOBdU7Aaeh0t24AgFt4o3bjv06lRQkZzJguVviHwE7hwYngoNTy9P6KEN
         TuapW12jeP9X87IkYLVKH6f3Po/AfTndKUZhQ5Ms4GuZFjEaZFLkpPddXmpr05ptgqez
         TZmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RMmuaYSFoKqzViJlrs6A3jsXlplkyWtPJj1P15DXX5k=;
        b=e1x7m3FN2EBf183r8RTk/3txIxP1r1cNDgPB7rXvz1yAKPtCzwIr9/RYkl1t0fX9t/
         kgL5WF7Of5WfaRByXGOhqEJd7rBg/E+nUQ8GkW3uDzDK3XJ5gfrIaQUqIr2Y2qiP6+0m
         gtw1dpQtw4eAJjhZ1w1k7a0raNfipc/ZDD4ni1tclrpiIZTwPXmSPPBRqwqV9NK7AJYH
         OahWxKXCa4+3m2ME8N78xZJugUIKUFZXMl3dL6isIbJ4tPyyQYXN2EYoni1ZgbOU9RpD
         8CIACevQFzA3+Bqa6oX0+RrRYQ9QqnCEcz/C/cbL7ZxqMB/zlSq17hoRbi70RJKBbXFT
         JbRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=IGscdRcS;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [129.187.255.138])
        by gmr-mx.google.com with ESMTPS id dm8si191245edb.5.2021.01.25.04.01.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:40 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.138 as permitted sender) client-ip=129.187.255.138;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT4244j6zydg;
	Mon, 25 Jan 2021 13:01:38 +0100 (CET)
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
	with LMTP id qQhtgbTc2keI; Mon, 25 Jan 2021 13:01:38 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT4113Z5zyd8;
	Mon, 25 Jan 2021 13:01:37 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Marco Solieri <ms@xt3.it>,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 09/23] Documentation: add description and usage of cache coloring support
Date: Mon, 25 Jan 2021 13:00:30 +0100
Message-Id: <20210125120044.56794-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=IGscdRcS;       spf=pass
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
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-10-andrea.bastoni%40tum.de.
