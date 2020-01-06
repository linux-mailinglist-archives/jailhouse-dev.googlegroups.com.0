Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB36LZTYAKGQEPU2OH5A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id D93A01311F0
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:59 +0100 (CET)
Received: by mail-wm1-x33f.google.com with SMTP id c4sf2781260wmb.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:59 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313199; cv=pass;
        d=google.com; s=arc-20160816;
        b=QP4jUCTbKVsAb6HwADw70cFV1TwWWPgm/CrJY0WgtfthXbd8up0kDkEjWMgw+R6mYu
         8uLYNHeypcwTyxX9BMKqnzJdGheQqcpLkovn/c1W9Wik/T/tsK0lI+JHnDFPw+jCPmJY
         VcOQQKAXDIiS1td14z7BJhQgW41/8KWLiG0zrU+J+gub0ho8c4HYZsJWXU8kUUnXfiQq
         EK2XxExNzQd1BTcdSzjc/fBY0TQE3/kP06lp/VrmX3JxKTaIMGLsL1nJddrTpcX+GrO+
         yIWw7RHfbQsz0meXDbf65RATFS4kye3XOIL32KXemGBfAGtmEqn4l0YIt+xY0xVPCgkm
         +X9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=uG5x4k+ZkhEg3Bkw0ZkkYvKitvs+Tq3qqp17LsrY6K0=;
        b=M87kzvgH0rYvxTPHQAWRYY9QY2pZF/QJUKQ2FuonOj0kc6rI0JZuH31px8i9gUlZji
         1UHYcuArEAQ7PPQLqgfB5URo8pZvWR0lGF1ttAvQ8QByhlJdMn+57N4BUR0IBrNaD5TS
         3GXu2ddv45rK/ZSm3750ODUrAlXRFUicZXDcDu1JHWOxyDhDHHYYeo35Y/fweorezQiF
         kjBm8J8cIs1DHxIypzurs3+vG4rVpeM2RmcJwDSOy59w3KjOJWMx64h7KHRDBABWexHd
         rQKFM9gAsKolOmlIMqknHdN4uGhXZwxW68xG+reLGwuF2Fq6kufy8mLmM+C9KFayBhNW
         KOag==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=uG5x4k+ZkhEg3Bkw0ZkkYvKitvs+Tq3qqp17LsrY6K0=;
        b=tCAVm73u7hYpHKjhy9bEov8AQzp4PxI4VRlYWz7H+Hr7dg9ZOLyM4Jb5leMDtgAAEx
         lZCLonnjpLwHwKfpiEJC3dQk18jpHWkE6cdIpDUPazN8P7bMTfKID+Da5yXOVtcV1q1U
         KTeIrprSY+HQD7wh9gQSh2eN0lg57I8ELqx5QdEHd2n2OQY2gXo1EItUUlsLhrxXBcut
         5uhMZU9SzUHv/CrFqKmcvQ2Vo84Ib/gLkSEmnaMNfPJXvFpPHauWeQKzgzps6JfS47SA
         efB1xOHKzPr4vszerK4qlcf5cWymSLfbW8Q1d8GTVSIGjmuT8xfzzAd9hPKQwaElCoPs
         AXJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=uG5x4k+ZkhEg3Bkw0ZkkYvKitvs+Tq3qqp17LsrY6K0=;
        b=iMgp+/DJi5JUkvkoQZQv/WQQTbUdJKkH/C+K250PS+KoVK7xOVVAyK27l5lYNyJrHe
         Ot2wCDtHxI2p/9WmUJGbORaTSXaYJhcPvy/0EgvRqEjjKoAvNkGakALdShTuAUvP3e0E
         PDJI1o0Tig15vkBwB2KzVGB/SYxbFOpjSvGZEcPNxwuJDHIMWMvgeb8knB00QRiHsn4a
         CA9ynqRYc3/fmAFNdp6DgxpsqDPiiOBEr2vETTPzN7AFUDKPOHFmUgR6LYJadvOBGac1
         O1kJNhtXELzzivTT4LdY1d2vqcokZMlcqnz9+pDy9AFMmmNV3eExKhfmA1T59s/CJhZX
         mt1Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU4EVWckB5SilampuWXVCC2LWnODteIRGlN8CeLW8gvdnVN41V3
	IXVFJY5svqX5CK1nIj77QZA=
X-Google-Smtp-Source: APXvYqysgdRXtbP4/ni7UfeE41G+Yd7ZNcJi1TgPw/dwNg1eE8z7E19QzyTrC22uGQmEiGiI9BECbg==
X-Received: by 2002:a1c:7c18:: with SMTP id x24mr34479726wmc.21.1578313199520;
        Mon, 06 Jan 2020 04:19:59 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c3d8:: with SMTP id t24ls5252721wmj.5.canary-gmail; Mon,
 06 Jan 2020 04:19:58 -0800 (PST)
X-Received: by 2002:a7b:c759:: with SMTP id w25mr35759948wmk.15.1578313198869;
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313198; cv=none;
        d=google.com; s=arc-20160816;
        b=WgX7GiJozRq3zuijQki67xXYrABxnIFwUCZMhZYI5q17tWihLOrG72r5RYMGRzZSNh
         yxbJaqxoAPgpI7LxBEHbfHxUWW+7F4sWyZnMKQMf7ca6TuEsBTYzXqXuEK4Kuw1nfwMl
         xE7GA4JgulW66Nnpv0EbLtomYwPpjeA/b3jcVuCekjv/tDk1ZBDA2TKGzpSXbK1AZmZx
         7Ka8d/zjIqeDHEKoswdatGLTjjIi1vWY4sP+UntzsqngeT+KzsdJqDHO2FNTXz6U3eoO
         tIazj8zMCay0jGnbCkdw+U5YiWjbvULtr9/r4fN+IOmf5G8Y24jGSK55ahilc2/qgvEV
         uQWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=KKMXTqm4Sg4yIAcbaRyAdk5RE14y6VpYYvvzQmq1yIk=;
        b=Gjjdoe6e6/1MfqbRkeyFGjpSY+MbpEK4HB0AkdBkvcertwGHDVv2c5tdMIOpoxBvjL
         HrNfIZlgM9BMRKyNSah6xBXjYTQjjDZseGUtLm87GIbpEgfseiqjD41DtKoldYWhl7b0
         OL8mKSXu1JoEJdwyL6FrFa4twl/hJcXb4woXpTAdcC/I4STs5MW7g7ogUN9eSrzYNpGY
         paH+HdYo+BdnDJxk+Mw8cyE7mN1dEKFARGoB4fTqLEKQkquaU8S2D2GuwJ4vDQ3dDEU0
         mf4W66+qCgARDtPRTUvA1nhOoIEwo+uMir0cKIx9ogMrFxiQBjWNOGcln5m23N5M6l43
         G9Ug==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y13si2458097wrs.0.2020.01.06.04.19.58
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:58 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJwug024821
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEk029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:58 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/38] configs: Add field for shmem device ID
Date: Mon,  6 Jan 2020 13:17:53 +0100
Message-Id: <3827aa3a1150358bb73f15471501430c65175eab.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

From: Jan Kiszka <jan.kiszka@siemens.com>

This allows to set a stable ID that is independent of the cell creation
ordering. Such stability will be needed when defining ID-dependent
unidirectional shared memory regions.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             | 1 +
 configs/arm/bananapi.c                        | 1 +
 configs/arm/emtrion-rzg1e-linux-demo.c        | 1 +
 configs/arm/emtrion-rzg1e.c                   | 1 +
 configs/arm/emtrion-rzg1h-linux-demo.c        | 1 +
 configs/arm/emtrion-rzg1h.c                   | 1 +
 configs/arm/emtrion-rzg1m-linux-demo.c        | 1 +
 configs/arm/emtrion-rzg1m.c                   | 1 +
 configs/arm/jetson-tk1-linux-demo.c           | 1 +
 configs/arm/jetson-tk1.c                      | 1 +
 configs/arm/orangepi0-linux-demo.c            | 1 +
 configs/arm/orangepi0.c                       | 1 +
 configs/arm64/amd-seattle-linux-demo.c        | 1 +
 configs/arm64/amd-seattle.c                   | 1 +
 configs/arm64/espressobin-linux-demo.c        | 1 +
 configs/arm64/espressobin.c                   | 1 +
 configs/arm64/hikey-linux-demo.c              | 1 +
 configs/arm64/hikey.c                         | 1 +
 configs/arm64/jetson-tx1-linux-demo.c         | 1 +
 configs/arm64/jetson-tx1.c                    | 1 +
 configs/arm64/k3-am654-idk-linux-demo.c       | 1 +
 configs/arm64/k3-am654-idk.c                  | 1 +
 configs/arm64/k3-j721e-evm-linux-demo.c       | 1 +
 configs/arm64/k3-j721e-evm.c                  | 1 +
 configs/arm64/macchiatobin-linux-demo.c       | 1 +
 configs/arm64/macchiatobin.c                  | 1 +
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c | 1 +
 configs/arm64/miriac-sbc-ls1046a.c            | 1 +
 configs/arm64/qemu-arm64-linux-demo.c         | 1 +
 configs/arm64/qemu-arm64.c                    | 1 +
 configs/arm64/ultra96-linux-demo.c            | 1 +
 configs/arm64/ultra96.c                       | 1 +
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 2 ++
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 2 ++
 configs/arm64/zynqmp-zcu102.c                 | 2 ++
 configs/x86/ivshmem-demo.c                    | 1 +
 configs/x86/linux-x86-demo.c                  | 1 +
 configs/x86/qemu-x86.c                        | 2 ++
 include/jailhouse/cell-config.h               | 8 +++++---
 39 files changed, 47 insertions(+), 3 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 922d22ac..070b909e 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -112,6 +112,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 475749d8..73c8ea8e 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -206,6 +206,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 74b884b4..de984de8 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -161,6 +161,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 9f06c20c..0301e97d 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -234,6 +234,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index e20d3dbb..77234e80 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -175,6 +175,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index e38c8fa5..d8eec098 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -360,6 +360,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 969dbd86..6e028a67 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -175,6 +175,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index aa11cc9b..c8ff9ec5 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -269,6 +269,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index bd209c87..cc605058 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -115,6 +115,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 343ff2ab..2e8c0a02 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -258,6 +258,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 21,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index ac620b16..06dbf559 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -103,6 +103,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 7a1d6da0..4cd5b49d 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -147,6 +147,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 8,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index fb526c3e..1ced1d7f 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -144,6 +144,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 6,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 4cd8580f..a5414d6b 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -221,6 +221,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 16,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 97117201..d2b19988 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -105,6 +105,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index bd6b5b00..e228b373 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -114,6 +114,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 073faa54..e17e0b04 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -102,6 +102,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index d9a72afb..e9e2cd5f 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -120,6 +120,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index cd7e3d8d..1b7e1263 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -119,6 +119,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 646dc8c0..e437d85d 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -398,6 +398,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 42,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index ecc81246..5dab6d8a 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -142,6 +142,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index b952283c..429ccdca 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -216,6 +216,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index af8299b5..8a2222e1 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -267,6 +267,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 0,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 78c4074a..7e0dc031 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -354,6 +354,7 @@ struct {
 			.bdf = 0x00,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 0,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index c2b317eb..418f3b31 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -113,6 +113,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 9237e93d..4eebaa32 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -123,6 +123,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index d07b04d0..865fba63 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -125,6 +125,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index d9dcb54f..a5b54ddc 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -459,6 +459,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = ARRAY_SIZE(config.mem_regions) - 1,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index 4f464503..b095900f 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -106,6 +106,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 29e87a4c..51543183 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -114,6 +114,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index b24c7fac..ed65ecf5 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -105,6 +105,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 1eeed354..2e038ae6 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -106,6 +106,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 749b34b3..683bdee4 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -106,6 +106,7 @@ struct {
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
@@ -113,6 +114,7 @@ struct {
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 3e5e703d..0b93c799 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -112,6 +112,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
@@ -119,6 +120,7 @@ struct {
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index de3e3238..090470dd 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -129,6 +129,7 @@ struct {
 			.bdf = 0 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 0001:00:00.0 */ {
@@ -137,6 +138,7 @@ struct {
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index f0a8f765..7e0851d1 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -86,6 +86,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 2,
+			.shmem_dev_id = 1,
 		},
 	},
 };
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 33fe0f76..e324c84e 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -148,6 +148,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 3,
+			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 58b8b75e..9b2e0a4e 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -283,6 +283,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 14,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		{ /* IVSHMEM (demo) */
@@ -292,6 +293,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 15,
+			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 64b59ca2..a62fa1ee 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -176,11 +176,13 @@ struct jailhouse_pci_device {
 	__u16 num_msix_vectors;
 	__u16 msix_region_size;
 	__u64 msix_address;
-	/** Memory region index of virtual shared memory device. */
+	/** Memory region index of shared memory device. */
 	__u32 shmem_region;
-	/** PCI subclass and interface ID of virtual shared memory device. */
+	/** ID of shared memory device (0..1). */
+	__u8 shmem_dev_id;
+	__u8 padding;
+	/** PCI subclass and interface ID of shared memory device. */
 	__u16 shmem_protocol;
-	__u8 padding[2];
 } __attribute__((packed));
 
 #define JAILHOUSE_IVSHMEM_BAR_MASK_INTX			\
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3827aa3a1150358bb73f15471501430c65175eab.1578313099.git.jan.kiszka%40siemens.com.
