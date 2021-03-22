Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBKHH4OBAMGQEPHAHLAA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE77345026
	for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 20:44:41 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id v9sf48893ljc.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 22 Mar 2021 12:44:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616442280; cv=pass;
        d=google.com; s=arc-20160816;
        b=gS0O/PtPws3YPqBvwiU2imvrTGaSYIfVhq3e1q9DgEFT6vc2BdrPZrkCIbyIJ2qdXf
         pRuZsgivdtMhNry+pHc7nHaZZd3dMj3A7W5I6mfSW9bDGeyzG5JP/5lfAutK6p0y0lCh
         OeXvdm/SVVMg4aXRYS9mTdVZtiwpQRwcHe0DeK/+QHaQca2WxgeD4jPl5azvtu/hSWp6
         UjVFqHDsOI4jmN/XpBtxWDnS40VaMH4InEevEy0Y9DogOH7K9dXjqcaVEsktbyGHd3NL
         q4uY/6yYJJukV3vAWfOgGVNglL2Dk+fTUbviqg8dzPDUKeFcXN8u+UgPgRduS5Cw+o2E
         UT2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=4uPfoPYjlsoFTW+iCmNxmSZqYsrYogJufy/DXVPQJo0=;
        b=DJrnlb3WU11DmTyZ5YDUVr9ltkEWi03GdXwteZNMBUwmSyKMtUhpVwvQX6wrzyTV3r
         gGSaupLdES4gHrR09rUGmJ9MRXphVWk9y09v5QcxQ+2PJhfMOuRsNO2KIr4hL8I3rQ1B
         LGreaNCYUAM6J3DkBtZC3TXPUtvWNC5QOzJZGQdyYxG594JG4NwZBszkjVlSvHLUlobA
         u2dz1eBawIZdIXKiUlWQF/zHFN2CdU/W1nf/35lrESdccnCMbRU7Gy44P4EsOe6lKo5p
         11pC+4VNNqC0NLN2vFSrmUodw9g84vy51Jl3/9GcljYxQWUx8B4ymwwxun6Wx7nGJqii
         xjmg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CJnKdWP8;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4uPfoPYjlsoFTW+iCmNxmSZqYsrYogJufy/DXVPQJo0=;
        b=fsfMtN9WS8NaBaZL06BPBRYIntt+LYxd95XzFVI21WnofMPmO24tWi2fYRHXEAWnX/
         OQFd2Rbh337PyeTY6wkzm0jdW/tSMTuRIETr3HPB4LrSAiL3V1+yOBkqwuTPRwfBwdKq
         2OzSMLapICnCU6OwwuwbO9TqcnGZLXTK0LIlqdbv2AI+uyfl24hIjftoJbH5tZu/Oxgg
         R2HIaYhktggA0Endx3zcVkPYWec1C/lJ24C61iVLPIZcmKb5pzVXhFG4W8FzYNZ3bbSs
         2X01vkKJPymd/ZeVloYE5iCrim7bWlhrkvtOR7opNWQZvlepbNIQTqG2sIKxo0dr796p
         /n7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4uPfoPYjlsoFTW+iCmNxmSZqYsrYogJufy/DXVPQJo0=;
        b=rJv0TvZbBgI7VG8pso9KWStZSAoPCZnYlnLLt8CV29MqFzW+m3Rra7HJ5bpxfU5TyI
         v49acT8ruV6pXGD3kZn6HHBnQUifDEtpgggzDv5gxcvXAuFMHClwazseS+095IPrHQLk
         N/ajvABDkU8AgOA74XLXaudL0zCJvwuAOxkJFzD4M5b7gu3aiFW+cmlnK3TAZOpaBV2T
         tA3KTOunoPQid/UpwQPt0KfpX00Hys6WUGzUsxsMj64clWP/T7S+tZjGCw36BsbZ8rPU
         n/j1E1+epie+AfJN7jtHjVV4dsafORO/WJSgeggatys3M9t8oA4FqzsFChQeVwo8v0Z0
         2KwQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533uNzz9nW8ZNvFXwzIvmpaYHp8tEkipMGyBkbN2MR7v5agpD+vO
	zxKTeT1mlmr74YSfs4ZNbw0=
X-Google-Smtp-Source: ABdhPJxn5xIsOZU5cl12jqqvggneNYqmkh7D6GR8KheWrDh+wLlXTvDoKoNSF1RMjoFd/ioBtblpVw==
X-Received: by 2002:a2e:87ca:: with SMTP id v10mr680392ljj.96.1616442280522;
        Mon, 22 Mar 2021 12:44:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f8:: with SMTP id v24ls3533764lfo.2.gmail; Mon, 22 Mar
 2021 12:44:39 -0700 (PDT)
X-Received: by 2002:ac2:57c9:: with SMTP id k9mr512501lfo.119.1616442279473;
        Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616442279; cv=none;
        d=google.com; s=arc-20160816;
        b=IszUr5EPGj9/xzVPT8c1n+DXdjljacWrrr0TOG4g7Px1ZL92eIbESq6boczpAsQY2j
         r9jF9PGdobEWUxjKn5VlgBT+9E1azYrENwVsg/wS0RDMu1s2Gsc6yUQ4tQdhQU8VcKsQ
         mtGXQJVjrHHTBQPEbWAjrI/Px8jndGLjfnSsb2z8cvbqpnYvGJklw6jPmxSba5qInKmy
         qGX9YLmQIxt2hk0kvPGmL6SY5AvdRC54tLoe4WBlbzAEP72yopcy/Bnz21ieqswb+Fq2
         pa3ZXxTZjmlxo1Y51fUn9f+En+X3VZa8q9rw4ZrOXTQy6fmepSX8A9jVf0xDZRU+oYuZ
         Kx4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=16uXCAamfUgY9p6PVl77xoA3G5pBGhJgMfFLO0bEUok=;
        b=e66FeB+19ydX9o6o5Mcp12a96ddHZVq5FKo1RJJqy3PqyGz7Xm7rpHk64oZUHIh6+j
         +BPz2AbhAZvORoh+7Pi6w4ALQatP0MqoxowErJlsdxJSB7FEdseO+ay51Nr455GQjcsU
         hFHrtIeYWDfrMMZGXJbeez4uODXk/uLIPjsoR62iVjpm6rGdBaCOf0v+74B1phj6QlLG
         Y5StiFiGHz9phEIIP0cgmPcIXpRW2WAevNgp8M7DOS3fMm2tAcr40vFrKVUUi++hzZCS
         LWf42L3xQlTKAdGwuYxgRTWmpdD3S9X8L2fxzIVEREttoJJwZNfRhbZaiRfGnPt3Zt2s
         qvNw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=CJnKdWP8;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id f7si286496lfa.0.2021.03.22.12.44.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 12:44:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4F44hP54NPzyWn;
	Mon, 22 Mar 2021 20:44:37 +0100 (CET)
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
	with LMTP id Tl1gt9eHaGkE; Mon, 22 Mar 2021 20:44:37 +0100 (CET)
Received: from kabal.lan (ip5f5ac6b3.dynamic.kabel-deutschland.de [95.90.198.179])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4F44hN5cDMzyWm;
	Mon, 22 Mar 2021 20:44:36 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Marco Solieri <ms@xt3.it>,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v2.1 6/9] Documentation: add description and usage of cache coloring support
Date: Mon, 22 Mar 2021 20:44:07 +0100
Message-Id: <20210322194411.82520-7-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322194411.82520-1-andrea.bastoni@tum.de>
References: <20210322194411.82520-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=CJnKdWP8;       spf=pass
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
 Documentation/cache-coloring.md | 177 ++++++++++++++++++++++++++++++++
 1 file changed, 177 insertions(+)
 create mode 100644 Documentation/cache-coloring.md

diff --git a/Documentation/cache-coloring.md b/Documentation/cache-coloring.md
new file mode 100644
index 00000000..0f059de8
--- /dev/null
+++ b/Documentation/cache-coloring.md
@@ -0,0 +1,177 @@
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210322194411.82520-7-andrea.bastoni%40tum.de.
