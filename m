Return-Path: <jailhouse-dev+bncBDLOLYFISUCRBGUK7P2AKGQE2TFOGYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F2F1B2392
	for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 12:04:11 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id 17sf5580265lfo.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 21 Apr 2020 03:04:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1587463450; cv=pass;
        d=google.com; s=arc-20160816;
        b=AQZQFUGiLpJl97UbcORTaQSgRubWeRTnsIH60L27T02fIM3lvG/5SKIPKVhj3z2zco
         E4IoLpi+H1TQlaI9pFVJ/02+gX+KL2hSeD4h9O0zn1+9IGX5p1xP5d80fxHw1ymE+SOm
         IlEDXca49TRiGtAgW6cqjcYi88zMHWRsqQxxz1xi8rwbj5IBFtSEtGTag41cQqPirnRo
         Pk9pJOJ6dA72GwQ+mbVp5ALu8uMnIInebrRdtJyHXdQoMGtQofPCUqzgYg8KccYe0wR6
         vEfQAK+CXavhAWWeGQ7EVy2Zs2JLDkQLDjcRSw8k2zkscYD8jg2EIGhR79mUKVMcjjzg
         vVVQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nrc8z/0FgZCzd/t/MqA+vS5Rv9i/EBJlujcRjmjfPBk=;
        b=Uk74p0ejTAIMj+C6QAFWh7Q/kW89tBBSwtKlsV8EvWIFjorpb1KYUCtpvfuse6f9Hj
         pfJ++p3Z94i1BodJ8SkWOz3c95dGhHSVdPt6A4NImZtPexIdcFc7iDr+eob+eGxT+CxH
         BxySWsnr23R/S5doMqYqHO3LJzBSG2/hJvzYWZmraSmYm7UASrubiU7XR/wF97sNJTt0
         CzN3+GUIvORE3gYXWlz3W7J0G1b7iGNffRtI4mF49O+bQWEWaEKyGGlSBOlvJbo5IwWC
         0RSqZUo2hieymAF86oNzakScYhjFJ3fgO+LR5pImWMdqTHUtWunaIz4KTXF1KSqmNeiL
         94Tg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=2qlbNpPO;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=nrc8z/0FgZCzd/t/MqA+vS5Rv9i/EBJlujcRjmjfPBk=;
        b=BoMsv24PD3uhqYi2RTzj8KG0Iqhrt2MZm1mT9ScSCRgVto4QYD1cQ/h9v4aqP3+9/C
         CMlB3OF/QsmRc7E0bvcAviU9YXwnSE7DyOpyw0BE2DueGIu5Cydl+Q4nd6p1kIJ0kDZp
         DDO03QycNTZ40952ruaVqE7bEj09LMekOzWRLC8JrPXyYtnl+tSRHdRh6UsNlIZE9J9B
         DKseoC/rN7XeahZAGSeUM8oETd8aI7VVXcoGGdvJAWl2Wah72s43LiuVlpMWkqlM5MN2
         hmLbkYHoVjyO1CKiOvxuIuEf/G8H30Oxn7QRTZVbM2pKBkKpgzhVA4ZX4kC8RNeI7/8M
         E6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nrc8z/0FgZCzd/t/MqA+vS5Rv9i/EBJlujcRjmjfPBk=;
        b=GNgu+o4zodb3NybXSSPUU2HaUFJcT2CkCH/M3q+5cvEjfR3n6Vf9meTGzMXjutisNm
         HMvF4Guk2XBrpmw0QoxpCT0IH50K9uVKZH20N8Ew5J85HXEy5s0/zVwTKq+nBqeUyhZQ
         Ojy0k3Lyh2HHUPVz8saD2BkjlUuKmkxUhN8wmdFjOawHFOOQCwFeKK6aHw9zijLmBVbI
         rIA1COCFiPqLkAkFWj9xFhk+lrXwshlpndFAz8BWfsUDjxiPiiMchmSFLhqgHOvrVxO9
         g/6WXteoTqyhG8LGEBCUjkmOZ9VfZ2+UPnzPfT7D+72yMZ7jFviqa7sifc3jlBtciuYz
         qDkQ==
X-Gm-Message-State: AGi0PuY02Eg+UzB5+2Ws90DCGhJWNed1rTCqYCKPMs2+eSyCcKEKzSp3
	pXR4h8euGug5a2K6v1CZAkA=
X-Google-Smtp-Source: APiQypKyTTbn5/ITboaRVYytD5q6r51s05ShIzYrOa3287sBRbpvevuHg405h0bSZ9hhssNzb+Xs6A==
X-Received: by 2002:a2e:7e03:: with SMTP id z3mr12808344ljc.200.1587463450562;
        Tue, 21 Apr 2020 03:04:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:4a42:: with SMTP id x63ls2150115lfa.7.gmail; Tue, 21 Apr
 2020 03:04:09 -0700 (PDT)
X-Received: by 2002:a19:ad45:: with SMTP id s5mr13304812lfd.106.1587463449608;
        Tue, 21 Apr 2020 03:04:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587463449; cv=none;
        d=google.com; s=arc-20160816;
        b=i6S6wJK2iwVGqhP7Q171RN+ri18vfBNfGCGx6H31FgUp6R6IwnduAHf37UI9hruMuI
         uGiY1HIRUUBL7C7w5a1XjJnQj6hL00wCa1oFB6vmaqBBFblLBq48kTYcmlCMj07tX/Uh
         DdjXuGEwVV5TywePDkZISsDBQgI6B2T8oWfohmfprja+iG1Dm/KyHCfdvFwxfEDuiGei
         kLodwPzLekkYQCrtOygEh7NP4HOMh1N9pQomeSZSZ4tGxzuysDQgVKoOGmk/j65r+u+8
         jPWlLNCfcmYakLzNdSYIvce0TZuOHqzP9Uvc7sCd9RwHW+3z17iiKKsn9uy5NNcflWrn
         KiBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=AlnC4pMGGI1j4/5mUcteQSW19q3AexpOXjm0J94VPtU=;
        b=U+sDxE0MykkQDhWky2HqYY9aAM4hgt8IHoSewJkuWG/3A05+CDU+Z33ui4TUI2JPw2
         lEVfw8bgf8cln7btnj/Toa56UTZeL3sfmjdPN4Pa0OexOz2STDxeJTnv5RTm8T1k8ia4
         KYI08lxwB9kQi9KfLTi+mrEHyVGl4Z02i+dg+mX6QXw/if5A4skIY93vX78a3BP/3ufU
         4UxQk+lHRgq461q8igtsAbsE9OruIpfCa8IAC+71GHeHUTEAq2lJH9zmlShXZ8vcQq0D
         jlEX1JuKvuHN/B7WvmStvDpH7mEylbhJ0Qq4XR2DOQtnm26Ub1lONH6wQm3X+xtb0rcg
         TrTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@xt3.it header.s=201602 header.b=2qlbNpPO;
       spf=pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) smtp.mailfrom=ms@xt3.it;
       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
Received: from radon.xt3.it (radon.xt3.it. [2a01:4f8:190:4055::2])
        by gmr-mx.google.com with ESMTPS id f25si111960lfc.3.2020.04.21.03.04.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Apr 2020 03:04:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted sender) client-ip=2a01:4f8:190:4055::2;
Received: from 217-133-116-244.static.clienti.tiscali.it ([217.133.116.244] helo=localhost)
	by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.89)
	(envelope-from <ms@xt3.it>)
	id 1jQpl9-0005CU-Lu; Tue, 21 Apr 2020 12:04:08 +0200
From: "'Marco Solieri' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: jailhouse-dev@googlegroups.com
Cc: Luca Miccio <lucmiccio@gmail.com>,
	Marco Solieri <ms@xt3.it>
Subject: [PATCH v2 9/9] Documentation: add description and usage of cache coloring support
Date: Tue, 21 Apr 2020 12:03:51 +0200
Message-Id: <20200421100351.292395-10-ms@xt3.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200421100351.292395-1-ms@xt3.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: ms@xt3.it
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@xt3.it header.s=201602 header.b=2qlbNpPO;       spf=pass
 (google.com: domain of ms@xt3.it designates 2a01:4f8:190:4055::2 as permitted
 sender) smtp.mailfrom=ms@xt3.it;       dmarc=pass (p=REJECT sp=NONE dis=NONE) header.from=xt3.it
X-Original-From: Marco Solieri <ms@xt3.it>
Reply-To: Marco Solieri <ms@xt3.it>
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
---
 Documentation/cache-coloring.md | 278 ++++++++++++++++++++++++++++++++
 1 file changed, 278 insertions(+)
 create mode 100644 Documentation/cache-coloring.md

diff --git a/Documentation/cache-coloring.md b/Documentation/cache-coloring=
.md
new file mode 100644
index 00000000..09aa2e17
--- /dev/null
+++ b/Documentation/cache-coloring.md
@@ -0,0 +1,278 @@
+Cache Coloring Support
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+Introduction
+------------
+
+### Cache partitioning and coloring
+
+#### Motivation
+
+Cache hierarchies of modern multi-core CPUs typically have first levels
+dedicated
+to each core (hence using multiple cache units), while the last level cach=
e
+(LLC) is shared among all of them. Such configuration implies that memory
+operations on one core, e.g., running one Jailhouse inmate, are able to ge=
nerate
+timing *interference* on another core, e.g., hosting another inmate. More
+specifically, data cached by the latter core can be evicted by cache store
+operations performed by the former. In practice, this means that the memor=
y
+latency experienced by one core depends on the other cores (in-)activity.
+
+The obvious solution is to provide hardware mechanisms allowing either: a
+fine-grained control with cache lock-down, as offered on the previous v7
+generation of Arm architectures; or a coarse-grained control with LLC
+partitioning among different cores, as featured on the "Cache Allocation
+Technology" of the high-end segment of recent Intel architecture and suppo=
rted
+by the Jailhouse hypervisor.
+
+#### Cache coloring
+
+Cache coloring is a *software technique* that permits LLC partitioning,
+therefore eliminating mutual core interference, and thus guaranteeing high=
er and
+more predictable performances for memory accesses. A given memory space in
+central memory is partioned into subsets called colors, so that addresses =
in
+different colors are necessarily cached in different LLC lines. On Arm
+architectures, colors are easily defined by the following circular stridin=
g.
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
+Cache coloring suffices to define separate domains that are guaranteed to =
be
+*free from interference* with respect to the mutual evictions, but it does=
 not
+protect from minor interference effects still present on LLC shared
+subcomponents (almost negligible), nor from the major source of contention
+present in central memory.
+
+It is also worth remarking that cache coloring also partitions the central
+memory availability accordingly to the color allocation--assigning, for
+instance, half of the LLC size is possible if and only if half of the DRAM=
 space
+is assigned, too.
+
+
+### Cache coloring in Jailhouse
+
+The *cache coloring support in Jailhouse* allows partitioning the cache by
+simply partitioning the colors available on the specific platform, whose n=
umber
+may vary depending on the specific cache implementation. More detail about=
 color
+availability and selection is provided in [Usage](#usage).
+
+#### Supported architectures
+
+Cache coloring is available on Arm64 architectures. In particular, extensi=
ve
+testing has been performed on v8 CPUs, namely on the A53 and A57 processor=
s
+equipping Xilinx ZCU102 and ZCU104.
+
+#### Limitations
+
+Since Jailhouse is currently lacking SMMU support, and since the colored m=
emory
+mapping must be provided to DMA devices to allow them a coherent memory vi=
ew,
+coloring for this kind of devices is not available.
+This also explain why also coloring support for the Linux root cell is not
+provided, although possible and tested with a simple hot remapping procedu=
re.
+
+### Further readings
+
+Relevance, applicability, and evaluation results of the Jailhouse cache co=
loring
+support are reported in several recent works. A non-technical perspective =
is
+given in [1] together with an overview of the ambitious HERCULES research
+project. A technical and scientific presentation is instead authored in [2=
],
+where additional experimental techniques on cache and DRAM are introduced.=
 A
+specific real-time application is extensively discussed in [3].
+
+An enjoyable, comprehensive and up-to-date survey on cache management tech=
nique
+for
+real-time systems is offered by [4].
+
+1. P. Gai, C. Scordino, M. Bertogna, M. Solieri, T. Kloda, L. Miccio. 2019=
.
+   "Handling Mixed Criticality on Modern Multi-core Systems: the HERCULES
+   Project", Embedded World Exhibition and Conference 2019.
+
+2. T. Kloda, M. Solieri, R. Mancuso, N. Capodieci, P. Valente, M. Bertogna=
.
+   2019.
+   "Deterministic Memory Hierarchy and Virtualization for Modern Multi-Cor=
e
+   Embedded Systems", 25th IEEE Real-Time and Embedded Technology and
+   Applications Symposium (RTAS'19). To appear.
+
+3. I. Sa=C3=83=C2=B1udo, P. Cortimiglia, L. Miccio, M. Solieri, P. Burgio,=
 C. di Biagio, F.
+   Felici, G. Nuzzo, M. Bertogna. 2020. "The Key Role of Memory in
+   Next-Generation Embedded Systems for Military Applications", in: Cianca=
rini
+   P., Mazzara M., Messina A., Sillitti A., Succi G. (eds) Proceedings of =
6th
+   International Conference in Software Engineering for Defence Applicatio=
ns.
+   SEDA 2018. Advances in Intelligent Systems and Computing, vol 925. Spri=
nger,
+   Cham.
+
+4. G. Gracioli, A. Alhammad, R. Mancuso, A.A. Fr=C3=83=C2=B6hlich, and R. =
Pellizzoni. 2015.
+   "A Survey on Cache Management Mechanisms for Real-Time Embedded Systems=
", ACM
+   Comput. Surv. 48, 2, Article 32 (Nov. 2015), 36 pages. DOI:10.1145/2830=
555
+
+
+
+
+Usage
+-----
+
+### Enable coloring support in Jailhouse
+
+In order to compile Jailhouse with coloring support add `CONFIG_COLORING` =
to the
+hypervisor configuration file (include/jailhouse/config.h)
+```
+#define CONFIG_COLORING 1
+```
+
+### Colors selection using indices
+
+We shall first explain how to properly choose a color assignment for a giv=
en
+software system.
+Secondly, we are going to deep into the root cell configuration, which ena=
bles
+cache coloring support for inmates.
+Lastly, we are explaining how a color selection can be assigned to a given=
 cell
+configuration.
+
+In order to choose a color assignment for a set of inmates, the first thin=
g we
+need to know is... the available color set. The number of available colors=
 can
+be either calculated[^1] or read from the handy output given by Jailhouse =
once
+we enable the hypervisor.
+
+```
+...
+Max number of avail. colors: 16
+Page pool usage after early setup: mem 39/992, remap 0/131072
+...
+```
+
+[^1]: To compute the number of available colors on the platform one can si=
mply
+  divide
+  `way_size` by `page_size`, where: `page_size` is the size of the page us=
ed
+  on the system (usually 4 KiB); `way_size` is size of a LLC way, i.e. the=
 same
+  value that has to be provided in the root cell configuration.
+  E.g., 16 colors on a platform with LLC ways sizing 64 KiB and 4 KiB page=
s.
+
+Once the number of available colors (N) is known, we select a range of col=
ors
+between 0 and N-1 and we will use the `jailhouse_cache` structure to to in=
form
+the hypervisor of our choice, as later explained in the section about
+[cells configuration](#cells-configuration).
+
+Ex:
+```
+Max. available colors 16 [0-15]
+Range_0: [0-5]
+Range_1: [8-15]
+```
+
+#### Partitioning
+
+We can choose any kind of color configuration we want but in order to have
+mutual cache protection between cells, different colors must be assigned t=
o them.
+Another point to remember is to keep colors as contiguous as possible, so =
to
+allow caches to exploit the higher performance to central memory controlle=
r.
+So using different but single ranges for each cells is the most simple way=
 to
+have mutual cache protection.\
+Ex: cell-1 has range `[0-7]` and cell-2 has range `[8-15]`.
+
+### Root Cell configuration
+
+#### Load start address
+
+Coloring support uses a special memory region to load binaries when cells =
are
+configured to use cache coloring. This mapping has the same size and color=
ing
+selection as the cell but it starts from a virtual address that is defined=
 by
+the variable `col_load_address`. This value is set to 16 GiB by default bu=
t it
+can be configured by the user depending on the platform. The value should =
be
+set to a memory space that is not used in the platform e.g., devices.
+
+For example, if we want to change this address to 32 GiB:
+```
+...
+.platform_info =3D {
+    ...
+    .col_load_address =3D 0x800000000,
+    .arm =3D {
+        .gic_version =3D 2,
+        .gicd_base =3D 0xf9010000,
+        .gicc_base =3D 0xf902f000,
+        .gich_base =3D 0xf9040000,
+...
+```
+
+#### LLC way size
+
+This field is _mandatory_ for using coloring support. It can be explicitly
+defined by the user in the Root Cell configuration or it can be leaved emp=
ty and
+the hypervisor will try to probe the value.
+The value corresponds to the way size in bytes of the Last Level Cache and
+could be calulated by dividing the LLC size by the number of way
+(the way number refers to N-way set-associativity).
+
+For example, a 16-way set associative cache sizing 1 MiB has a way size of
+64 KiB:
+```
+...
+.platform_info =3D {
+    ...
+    .llc_way_size =3D 0x10000,
+    .arm =3D {
+        .gic_version =3D 2,
+        .gicd_base =3D 0xf9010000,
+        .gicc_base =3D 0xf902f000,
+        .gich_base =3D 0xf9040000,
+...
+```
+
+### Cells configuration
+
+First of all we need to select one or more range(s) for coloring
+configuration that will be applied to **all** memory regions flagged with
+`JAILHOUSE_MEM_COLORED`. Each range is defined using the `struct jailhouse=
_cache`
+where the `.start` and `.size` values correspond respectively the start an=
d size
+of the range itself.
+```
+...
+struct jailhouse_memory mem_regions[12];
+struct jailhouse_cache cache_regions[1];
+...
+.num_memory_regions =3D ARRAY_SIZE(config.mem_regions)
+.num_cache_regions =3D ARRAY_SIZE(config.cache_regions),
+...
+.mem_regions =3D {
+        ...
+        /* Colored RAM */ {
+                .phys_start =3D 0x810000000,
+                .virt_start =3D 0x0,
+                .size =3D 0x10000,
+                .flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+                        JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
+                        JAILHOUSE_MEM_LOADABLE| JAILHOUSE_MEM_COLORED,
+        },
+        ...
+}
+...
+.cache_regions =3D {
+        {
+                .start =3D 0,
+                .size =3D 8,
+        },
+},
+...
+```
+In the example we have a platform with 16 colors available and we are sele=
cting
+the range [0-7] that goes from 0 to 7 (8 colors).
+
+#### Overlaps and colored memory sizes
+
+When using colored memory regions the rule `phys_end =3D phys_start + size=
` is no
+longer true. So the configuration must be written carefully in order to av=
oid to
+exceed the available memory in the root cell. The hypervisor performs a ch=
eck
+when a colored region is created but it's up to the configurator to fix th=
e
+issue.
+Moreover, since the above rule does not apply, it is very common to have o=
verlaps
+between colored memory regions of different cells if they are sharing colo=
rs.
--=20
2.25.1

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/20200421100351.292395-10-ms%40xt3.it.
