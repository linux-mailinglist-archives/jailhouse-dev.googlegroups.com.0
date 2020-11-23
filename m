Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBWF76D6QKGQEG3ANLYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id 6647D2C16B9
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 21:47:21 +0100 (CET)
Received: by mail-ej1-x638.google.com with SMTP id e22sf6121090ejx.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Nov 2020 12:47:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1606164441; cv=pass;
        d=google.com; s=arc-20160816;
        b=BCw8PSeIieKyb8K72E2Q+rLwAMzdjD8nuVYuKPDK8J0f41ZP8R09cmJFzNco9j/x66
         YU2Rnet467AXWthYNHV529XDEQ6z1gIEa/i8XEZy2ZS3l7fHSpUClZyFB9CT83FzOsX1
         0GWK15tjdoe4bVn94WJijq6hQPUPsZrYLppL4vskgBQYgaQaPOdW4IO3In5WX7pISasY
         oh6XwzxmbDRZKdCBbzHjWrYOd1oXsvjM9888+P2lO9H4Y0kgwhbeVYm+dLG91cSH8XI7
         ZBBdiU68RwUchKr1NG2hs5TGXzYAapr7MLRWsC3PkboV9A316mVAqAM3DnmGXz1CSCiy
         rz4w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=9ULIOcvPZKSwKAXfBTFB1P3NR4A8LSfZ/PhTF0FvSfA=;
        b=sxTeEqjt4lNCHGyFHgvz44dgJTchyMFJX2F0ZIDgsZXb9frX6l3sLbP0bLhDhR4KUl
         dfgDLrkxGdQ+1ICfAl2tD2U7kxixF/H5K7xjUvvdXOVLlxEbyDU0FNpxYROnpjm12RZF
         HrtYpJEkPJIfKKWpsOOMdHWPKM+EcLp7OV0Hf13fs+1l91sX6pUefMVlsHhHLyFlFAni
         gmwXrpBRG07TZCP80GJAQpoX3U5miLgQn624dVTsg4+QNP+1zjXzt+3KTp/OHkTouTXv
         neuZTtZo4xfW1cZQa0RQIXPARsQUChEVeBGBz0T1PrhyHZzERa2yRNuq4Oia7b7srcrx
         q9AA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=oVJ4e5ct;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9ULIOcvPZKSwKAXfBTFB1P3NR4A8LSfZ/PhTF0FvSfA=;
        b=H1zyfjEPXH7dycW9G+NZIWl22Als3k0sGooXXr+NIESVmj//0WAtD13l+Wr68+W1gQ
         ++NIfd/ryqy23doqZs7Us6kW9frsbGw8oFjvE5UKc5yVQEzNS6HisOzYGboFkBF5M0Ni
         2r/4Uv+TixT94zw30FhCymHH/5YHcenPFjNHQJHaP5QbLWPx+IvV+8eSoJueH7JdzY+x
         7VAdrlrx8kElVn31r5+Rq8uSPJpJE6iHF06pkvgDLRVgRm1CFl6BHMvO6sku58hRqbS2
         dzBiLrMhVSXyEQFdKnmgWtyMwnfzgDIx5ZK1M/NS7CF/5OsH6zItSMs3+hr6iAhDJzTB
         wHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9ULIOcvPZKSwKAXfBTFB1P3NR4A8LSfZ/PhTF0FvSfA=;
        b=intpQT04mxBfHV3eLnwbUgK/dxQazDapgiVNh1cWY4HqsFSRLYe9OB0Lp3fUFrKi48
         jUrnuy/hTHthqWFbrGcuQL0du7iaNxiPYj2PzF7SC4D3NYFAShgTXRJwlUnTEDQ8lvoW
         EVtlpn+Xj0Y0SwRhZukRgTSpzpQjIaikaX9V93DIMdN6+uGYfOAFsFCHXOP4jxH1wcnz
         oZLNWzbS3S4GlkB7lLl39D8BJfhKqsO9yAZBTZqNz1uh13RoOppTL3Y3XG0z+m/btXPk
         DYl6MIx4lVQ9zNYyftoz5NMPaUq3zxF72qXf5BLO+J/NQsJhVnD95sJQWCNCk4DdDJ4t
         OW2g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531IfGH/6+9Wb2NAC9YKLXRbj/mONcSxlsvtiv+OQHnx8v3jvDi+
	TE5on/5YUFMzDfQGoqhWTPE=
X-Google-Smtp-Source: ABdhPJxmnfVqJWorcjW8XOql0kH/ISrMOxgP4xN54Is3CEbrLZDfl9S0RBMw+b2kCfgbakKNT8VSzA==
X-Received: by 2002:a17:907:250c:: with SMTP id y12mr1342907ejl.367.1606164441101;
        Mon, 23 Nov 2020 12:47:21 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:cc8b:: with SMTP id p11ls9149955edt.3.gmail; Mon, 23 Nov
 2020 12:47:20 -0800 (PST)
X-Received: by 2002:a50:fd8c:: with SMTP id o12mr1030199edt.22.1606164439956;
        Mon, 23 Nov 2020 12:47:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606164439; cv=none;
        d=google.com; s=arc-20160816;
        b=oHxck/+RXHzV482Cd7Y6N3Ass2VPNWUXn3S/vuixilj+8MSKxEp7Z+ffvVJn7ab426
         1EXIUS1JW3/nQATmBqzh+PR/pAtPb3ObFYs5cPgSS/sWaSVCU5Qhpfaweh+wgzYpVZHu
         8HUap2B+fYx/LiW8sUfn6ObLQbRdhti9J3MI4ZewHyeGFqirKkcqeJAxx8LcQbFNMmOm
         g7u2iMkU9zKZC6Tmcexs27mq1vd0nRb2yXOsmaKsBCR+OVa+07Mq3511Shks+3ugpN4d
         5C/KvYdzvOgJOZgC0G/FgLrMwWIAi93U2UHFLsCuuw0bt0x7jliT9wwZRVYWHG5M9IBY
         IZog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RMmuaYSFoKqzViJlrs6A3jsXlplkyWtPJj1P15DXX5k=;
        b=yEhZHGO28bHJ2+yvV0MX903prIMCdyDeqtDyeR/EDMeOA1+YIc9EaciUeF7QvZpp2E
         vp0QuhU8tkfk2gTENFJvaQKh3Mx7F0/GygcuivxqsOiQpDWMRJUQLvbdmspNEMdBqToJ
         Kya8c6HgUvQC2dftsnbFKirjO2N8RH6jptze4/38hgMkghyo9Jd/0f/ChPnyfhzNzzEv
         8KxVuZyVKPW3WZ5amUCnMFBnJGF+JE2oTtSmvXnKWXxudnV+BcNDmrmre2UrFiZSyI56
         xlUWDF1pppv7nSWzIgWe1z7CCp7tlrzy3dYolGMfjk3aJI6JgU3G81Y/81MSYXIJ1qgR
         hRqg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=oVJ4e5ct;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id a11si257865edq.1.2020.11.23.12.47.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Nov 2020 12:47:19 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4Cfzjg1dtTzyTf;
	Mon, 23 Nov 2020 21:47:19 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.876
X-Spam-Level: 
X-Spam-Status: No, score=-2.876 tagged_above=-999 required=5
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
	LRZ_TO_SHORT=0.001, LRZ_URL_PLAIN_SINGLE=0.001]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id qmzNsgVT6ZRL; Mon, 23 Nov 2020 21:47:18 +0100 (CET)
Received: from kabal.lan (ip5f5ac6d0.dynamic.kabel-deutschland.de [95.90.198.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4Cfzjf2jQPzyTk;
	Mon, 23 Nov 2020 21:47:18 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Marco Solieri <ms@xt3.it>,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 09/14] Documentation: add description and usage of cache coloring support
Date: Mon, 23 Nov 2020 21:46:08 +0100
Message-Id: <20201123204613.252563-10-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201123204613.252563-1-andrea.bastoni@tum.de>
References: <20201123204613.252563-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=oVJ4e5ct;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201123204613.252563-10-andrea.bastoni%40tum.de.
