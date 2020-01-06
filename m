Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OLZTYAKGQECQBCM6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 847DE131207
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:06 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id w9sf6657925ljj.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313206; cv=pass;
        d=google.com; s=arc-20160816;
        b=AwEuQ2Qf5PqBsfkf2wfNI18TSwIXCoKV5VXX08jrxARNvIvevbMeaIuzBpelbSCtzD
         AUD9x4/pCWgvO7RijcMMzgpkoY1Saxuxz1x8CZ4AvkB/vi7ZPkAbOKPDXz6JJXdHSZyG
         rpHwE4214VShpJdUSJhI0s4CH6TYBn6HqVjjeV8zxNxUpy4DFBivf8AqAd/+jc5yl5RI
         3ftycvJOLFpkiR6GdZlworcSOUjgX68ezqNz0XZ3HZ0RmK1e8XnRZNOlyW6gSA5q17D3
         GiPooVWoMx5WYkuh/AUsWGc5ggxvr3ZwX5eKV5GmsB+EGo961H8nDA4PseMcL8I4yX5G
         2+hA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=dlOk42AsnT8Aytmk7/xDhgZ+3eC4fKW/Sw87fjtFPIE=;
        b=bJYqJ/fUx/bDbfprDHMbNlQhsNGk91b7hha314Z+HFLVoiKgHZKwKMbSlaZe67m04N
         sAh0yJk5oilfi75nza5tP1kFw5fDBCoMTXp2seVd7K8x5xd4/ll+/7ekzoNE6ctIOfhZ
         YGdhmXPbwrRr71/pj3qZROw+BcXYnLkWWzD8VSDhMLivniqZ32Fzg8VmqhMv2EyxQUQm
         a4W3hw0F7YKKZh8UQIryLvnd8l8paUIoFXvficDC4NY/IZnDs/7TRku/tWhBtvxK0iDA
         e67XBUXsgD3JxCC3mDVcaETHY1+6iYyFcRPVbJHwmUGhDfP1mVBATlgrsnTWwFvLAbrt
         v4Ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=dlOk42AsnT8Aytmk7/xDhgZ+3eC4fKW/Sw87fjtFPIE=;
        b=UAWvkMunVtxMVbnRIXp3ut50GKk8cC9kBBkNtuv6qPNiiXJlktjTob61fVP/AP6iHi
         CVZyoRLQNK+kzm9WyZiYxgHSBiykixshVkStv2Cp/sK3/SgCkoV+TgXrjphbT4jmBejp
         +KAQdnc+Gj3m/LWn1Lg2FPEuXZ5hSCpInBedVHX/fNlmToFBq9FrSw+Rj4Gs2emuBrYr
         Lg6pSYsVj8pnMWaM+2dXlCMulFAE8agy+raYfrkKchELi2eL8hBhF8vbDwJ0yOzIt6Os
         kiwnDA8wIDrguMusbYvREwiRWePqAzkYObsHLa385EayC1XqJIMmwhuQBFZCj31QJ1zJ
         czvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dlOk42AsnT8Aytmk7/xDhgZ+3eC4fKW/Sw87fjtFPIE=;
        b=Dn77rqDvqds3S/JUk/zFWkRoDa26Qc2ztH+DICNdaUy5e3I4F2mr5jzpF3HgF9igWB
         GJnHucQMZg1IeZdHzfrE2o/e1yUSoNEGVXNmzsBPFPLNrT2NHhrQvtrxPyPBAg+omQGN
         +GZDsVqMTErRGpnAvqbATrw8B5O5H/VWfa3V0CobvmZyMyKDn2rajeHJD/r2QMuoj+kL
         AwLOwKdDypbN93Qbhhx3l+nF88EntCXYAYSXfhN21w6vBN7GbYUblAbTq0J+Oxvt4MD1
         rrHENMUaF1YNvLySX4Kvitwe1fmTRjz2TEJ9/IJfuRWtYUZDAx0xTWz+FQUxo9wxFe9J
         lmHg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWwkDYPYADS7zP2z7vHMgQni4Z35BJYYCEWaGZn9g3tzCAMS5zD
	w+O/T30A+VHhuZL4opWZdHo=
X-Google-Smtp-Source: APXvYqzpLlXDhN4xFkUtJUKq/cTkf7CWZ3T+9o0TRowNPj0/nAi7wCXMfJ1QyVlLVxZt6fS3Rm6nOw==
X-Received: by 2002:a05:651c:327:: with SMTP id b7mr57839312ljp.22.1578313206104;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8790:: with SMTP id n16ls4269885lji.7.gmail; Mon, 06 Jan
 2020 04:20:05 -0800 (PST)
X-Received: by 2002:a2e:870b:: with SMTP id m11mr58719275lji.93.1578313205263;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=HYlyRP0sum4Uh/M+gg+tPbo8PXcwDxnbobyekdpiPN10xb37qhiaAsx14dQ+KOURPe
         CBpVUVOS6H8h0GWBv5oJX62Ky9YIz0fsknpU2xywFUjvyJvr0mgH/it/ipcA/V2xQjMw
         j0kba9pFWsjgKGswtxrfGddlbSKmuJHvn8vol3gnjhw0TFPNs6dZwt8O63Oh2a6WocR3
         7Kig6VGwbn58b7ZD1aAcSgrrxd2aDkZVXR+sOfDSMoTLSINsDpKrzrrqC/F1mVis6Y3d
         k+n6KeoYPL8Dmo7PZ2cNgmbYRn92+jphGS9WWN9GrJS71bf4J0v/P9B6BsW3AYFYC56Y
         6aOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=cUQ6h5UAQ3WbU/cVgdP6CrzDvC8OBD+ZyHWVFchXI60=;
        b=cQFb6dZgwUxxCmcV5qGqcB1SY17WE0tWQA5Sk66o1xUYqTGZRM9+laNtiWTH2BV/Zl
         O7C/qhw7Cj7RRsAaBbYUo2lVvQojnWyAOuicsWhF+HqRoOOSGgWFVqDpybx1V123xyfR
         kZuFQzIqgkO07LTDpGRwktesSE1hRj6e1/ntcTl3oLTqzjmKdleaMsWbZejn3hSg4D17
         b0yAiVFr9RahfZgYeA/KYeCRq3G+Xx1UFqgj+mBDnW3XPv4mrMCB3UiyDDOZ05PUPJmU
         RKzv3MzYum9LC6VFb2K+Jhzy6I3UUeV02NWqAHnh30lUfC+BfAuUQgnm981RJVs6REfF
         1TGQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id v16si2680104lfd.2.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK4IZ025220
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF8029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 34/38] core, configs: ivshmem: Add multi-peer support
Date: Mon,  6 Jan 2020 13:18:15 +0100
Message-Id: <dbafd4b0ab336488338753a3a2961c43d66a697f.1578313099.git.jan.kiszka@siemens.com>
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

So far, it seemed restricting our ivshmem implementation to 2 peers
would both simplify it significantly and fulfill the vast majority of
use cases. Both turned out to be wrong assumption.

First of all, there are users with custom protocols that like to set up
a single ivshmem device between, e.g., the root cell and multiple
non-root cells. They would currently have to create one device pair per
link. This overcomes the limitation.

At the same time, the implementation turned out to be rather simple. We
basically just need to broadcast config change interrupts and rework the
bookkeeping so that an ivshmem_link is only destroyed with the last user
disappears. The rest was already refactored to account for multiple
peers.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  1 +
 configs/arm/bananapi.c                        |  1 +
 configs/arm/emtrion-rzg1e-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1e.c                   |  1 +
 configs/arm/emtrion-rzg1h-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1h.c                   |  1 +
 configs/arm/emtrion-rzg1m-linux-demo.c        |  1 +
 configs/arm/emtrion-rzg1m.c                   |  1 +
 configs/arm/jetson-tk1-linux-demo.c           |  1 +
 configs/arm/jetson-tk1.c                      |  1 +
 configs/arm/orangepi0-linux-demo.c            |  1 +
 configs/arm/orangepi0.c                       |  1 +
 configs/arm64/amd-seattle-linux-demo.c        |  1 +
 configs/arm64/amd-seattle.c                   |  1 +
 configs/arm64/espressobin-linux-demo.c        |  1 +
 configs/arm64/espressobin.c                   |  1 +
 configs/arm64/hikey-linux-demo.c              |  1 +
 configs/arm64/hikey.c                         |  1 +
 configs/arm64/jetson-tx1-linux-demo.c         |  1 +
 configs/arm64/jetson-tx1.c                    |  1 +
 configs/arm64/k3-am654-idk-linux-demo.c       |  1 +
 configs/arm64/k3-am654-idk.c                  |  1 +
 configs/arm64/k3-j721e-evm-linux-demo.c       |  1 +
 configs/arm64/k3-j721e-evm.c                  |  1 +
 configs/arm64/macchiatobin-linux-demo.c       |  1 +
 configs/arm64/macchiatobin.c                  |  1 +
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  1 +
 configs/arm64/miriac-sbc-ls1046a.c            |  1 +
 configs/arm64/qemu-arm64-linux-demo.c         |  1 +
 configs/arm64/qemu-arm64.c                    |  1 +
 configs/arm64/ultra96-linux-demo.c            |  1 +
 configs/arm64/ultra96.c                       |  1 +
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  2 +
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  2 +
 configs/arm64/zynqmp-zcu102.c                 |  2 +
 configs/x86/ivshmem-demo.c                    |  1 +
 configs/x86/linux-x86-demo.c                  |  1 +
 configs/x86/qemu-x86.c                        |  2 +
 hypervisor/include/jailhouse/ivshmem.h        |  1 -
 hypervisor/ivshmem.c                          | 67 ++++++++++++++-------------
 include/jailhouse/cell-config.h               |  5 +-
 41 files changed, 79 insertions(+), 36 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 07895829..0aecdbcc 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -108,6 +108,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index 1fc293a1..a59fc869 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -203,6 +203,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 01a49cd0..ee3cf79f 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -157,6 +157,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index c9c86e7c..c1c01b3d 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -231,6 +231,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index 34749b29..c175e206 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -171,6 +171,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 92d7e83b..c020372d 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -357,6 +357,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index dedeac03..083777df 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -171,6 +171,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 9f937549..e0a8a1c3 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -266,6 +266,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 016e4bc8..010d2022 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -111,6 +111,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 8edbcb39..3a6eb1fa 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -255,6 +255,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index b1a3b068..5ea4e34d 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -99,6 +99,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index afc96a8f..9aa2876c 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -144,6 +144,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 15dd43e7..f4ed12d7 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -140,6 +140,7 @@ struct {
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index c6a7a07f..6409d934 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -218,6 +218,7 @@ struct {
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 55c8ab77..75602beb 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -101,6 +101,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index 43445393..d17c9db3 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -111,6 +111,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 410863c3..2bdca488 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -98,6 +98,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 9da2a6dd..f8a6c2a2 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -117,6 +117,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index 5cfd9bad..e51549b6 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -115,6 +115,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index c0df4557..2798fed8 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -394,6 +394,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 54b84da6..ceb4eca2 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -139,6 +139,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 66914031..9ac32dbb 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -213,6 +213,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 17cdc5ce..27662452 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -263,6 +263,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 27c35960..b180d272 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -351,6 +351,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 71d084ee..b1c475f4 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -109,6 +109,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 5b5aa491..0b79409e 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -120,6 +120,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 4f8cd3c2..27fa5064 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -120,6 +120,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index c2884d59..93279716 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -456,6 +456,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index 000c4f32..90e686ba 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -102,6 +102,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 1436464d..a75b60f7 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -111,6 +111,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index ed891766..94fa51ba 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -101,6 +101,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 831c6d31..83762c41 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -103,6 +103,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index c0912c1d..da4d1162 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -97,6 +97,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
@@ -105,6 +106,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 046d2b49..9e8ba801 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -103,6 +103,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
@@ -111,6 +112,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 4dcb313f..0130c0da 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -122,6 +122,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 0001:00:00.0 */ {
@@ -131,6 +132,7 @@ struct {
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index eb77ccae..cea555c9 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -106,6 +106,7 @@ struct {
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 	},
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index c03b2b48..5f9d8ed8 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -143,6 +143,7 @@ struct {
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index b4869fba..d5ba1764 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -297,6 +297,7 @@ struct {
 			.num_msix_vectors = 16,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
 		},
 		{ /* IVSHMEM (networking) */
@@ -307,6 +308,7 @@ struct {
 			.num_msix_vectors = 2,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
+			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 	},
diff --git a/hypervisor/include/jailhouse/ivshmem.h b/hypervisor/include/jailhouse/ivshmem.h
index 544432d0..61773799 100644
--- a/hypervisor/include/jailhouse/ivshmem.h
+++ b/hypervisor/include/jailhouse/ivshmem.h
@@ -44,7 +44,6 @@ struct ivshmem_endpoint {
 	struct pci_device *device;
 	struct ivshmem_link *link;
 	const struct jailhouse_memory *shmem;
-	struct ivshmem_endpoint *remote;
 };
 
 int ivshmem_init(struct cell *cell, struct pci_device *device);
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index f42a5bcb..189dae6a 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -16,7 +16,7 @@
  * shared memory and interrupts based on MSI-X.
  *
  * The implementation in Jailhouse provides a shared memory device between
- * exactly 2 cells. The link between the two PCI devices is established by
+ * 2 or more cells. The link between the PCI devices is established by
  * choosing the same BDF.
  */
 
@@ -32,7 +32,7 @@
 #define PCI_VENDOR_ID_SIEMENS		0x110a
 #define IVSHMEM_DEVICE_ID		0x4106
 
-#define IVSHMEM_MAX_PEERS		2
+#define IVSHMEM_MAX_PEERS		12
 
 #define IVSHMEM_CFG_VNDR_CAP		0x40
 #define IVSHMEM_CFG_MSIX_CAP		(IVSHMEM_CFG_VNDR_CAP + \
@@ -60,6 +60,7 @@
 
 struct ivshmem_link {
 	struct ivshmem_endpoint eps[IVSHMEM_MAX_PEERS];
+	unsigned int peers;
 	u16 bdf;
 	struct ivshmem_link *next;
 };
@@ -105,6 +106,7 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 	const struct jailhouse_pci_device *dev_info = ive->device->info;
 	u32 *state_table = (u32 *)TEMPORARY_MAPPING_BASE;
 	struct ivshmem_endpoint *target_ive;
+	unsigned int id;
 
 	/*
 	 * Cannot fail: upper levels of page table were already created by
@@ -122,8 +124,11 @@ static void ivshmem_write_state(struct ivshmem_endpoint *ive, u32 new_state)
 	if (ive->state != new_state) {
 		ive->state = new_state;
 
-		target_ive = &ive->link->eps[dev_info->shmem_dev_id ^ 1];
-		ivshmem_trigger_interrupt(target_ive, 0);
+		for (id = 0; id < dev_info->shmem_peers; id++) {
+			target_ive = &ive->link->eps[id];
+			if (target_ive != ive)
+				ivshmem_trigger_interrupt(target_ive, 0);
+		}
 	}
 }
 
@@ -173,7 +178,7 @@ static enum mmio_result ivshmem_register_mmio(void *arg,
 		break;
 	case IVSHMEM_REG_MAX_PEERS:
 		/* read-only number of peers */
-		mmio->value = IVSHMEM_MAX_PEERS;
+		mmio->value = ive->device->info->shmem_peers;
 		break;
 	case IVSHMEM_REG_INT_CTRL:
 		if (mmio->is_write) {
@@ -388,15 +393,15 @@ enum pci_access ivshmem_pci_cfg_read(struct pci_device *device, u16 address,
 int ivshmem_init(struct cell *cell, struct pci_device *device)
 {
 	const struct jailhouse_pci_device *dev_info = device->info;
-	struct ivshmem_endpoint *ive, *remote;
-	struct pci_device *peer_dev;
+	struct ivshmem_endpoint *ive;
 	struct ivshmem_link *link;
-	unsigned int id;
+	unsigned int peer_id, id;
+	struct pci_device *peer;
 
 	printk("Adding virtual PCI device %02x:%02x.%x to cell \"%s\"\n",
 	       PCI_BDF_PARAMS(dev_info->bdf), cell->config->name);
 
-	if (dev_info->shmem_regions_start + 2 >
+	if (dev_info->shmem_regions_start + 2 + dev_info->shmem_peers >
 	    cell->config->num_memory_regions ||
 	    dev_info->num_msix_vectors > IVSHMEM_MSIX_VECTORS)
 		return trace_error(-EINVAL);
@@ -414,11 +419,12 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 		if (link->eps[id].device)
 			return trace_error(-EBUSY);
 
-		peer_dev = link->eps[id ^ 1].device;
-
-		printk("Shared memory connection established: "
-		       "\"%s\" <--> \"%s\"\n",
-		       cell->config->name, peer_dev->cell->config->name);
+		printk("Shared memory connection established, peer cells:\n");
+		for (peer_id = 0; peer_id < IVSHMEM_MAX_PEERS; peer_id++) {
+			peer = link->eps[peer_id].device;
+			if (peer && peer_id != id)
+				printk(" \"%s\"\n", peer->cell->config->name);
+		}
 	} else {
 		link = page_alloc(&mem_pool, PAGES(sizeof(*link)));
 		if (!link)
@@ -429,18 +435,14 @@ int ivshmem_init(struct cell *cell, struct pci_device *device)
 		ivshmem_links = link;
 	}
 
-	ive = &link->eps[id];
-	remote = &link->eps[id ^ 1];
+	link->peers++;
+	ive = &link->eps[dev_info->shmem_dev_id];
 
 	ive->device = device;
 	ive->link = link;
 	ive->shmem = jailhouse_cell_mem_regions(cell->config) +
 		dev_info->shmem_regions_start;
 	device->ivshmem_endpoint = ive;
-	if (remote->device) {
-		ive->remote = remote;
-		remote->remote = ive;
-	}
 
 	device->cell = cell;
 	pci_reset_device(device);
@@ -512,7 +514,6 @@ void ivshmem_reset(struct pci_device *device)
 void ivshmem_exit(struct pci_device *device)
 {
 	struct ivshmem_endpoint *ive = device->ivshmem_endpoint;
-	struct ivshmem_endpoint *remote = ive->remote;
 	struct ivshmem_link **linkp;
 
 	/*
@@ -523,19 +524,19 @@ void ivshmem_exit(struct pci_device *device)
 	memset(&ive->irq_cache, 0, sizeof(ive->irq_cache));
 	spin_unlock(&ive->irq_lock);
 
-	if (remote) {
-		remote->remote = NULL;
+	ivshmem_write_state(ive, 0);
 
-		ivshmem_write_state(ive, 0);
+	ive->device = NULL;
 
-		ive->device = NULL;
-	} else {
-		for (linkp = &ivshmem_links; *linkp; linkp = &(*linkp)->next) {
-			if (*linkp == ive->link) {
-				*linkp = ive->link->next;
-				page_free(&mem_pool, ive->link, 1);
-				break;
-			}
-		}
+	if (--ive->link->peers > 0)
+		return;
+
+	for (linkp = &ivshmem_links; *linkp; linkp = &(*linkp)->next) {
+		if (*linkp != ive->link)
+			continue;
+
+		*linkp = ive->link->next;
+		page_free(&mem_pool, ive->link, PAGES(sizeof(*ive->link)));
+		break;
 	}
 }
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index bf717bae..6d397d9c 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -201,9 +201,10 @@ struct jailhouse_pci_device {
 	__u64 msix_address;
 	/** First memory region index of shared memory device. */
 	__u32 shmem_regions_start;
-	/** ID of shared memory device (0..1). */
+	/** ID of shared memory device (0..shmem_peers-1). */
 	__u8 shmem_dev_id;
-	__u8 padding;
+	/** Maximum number of peers connected via this shared memory device. */
+	__u8 shmem_peers;
 	/** PCI subclass and interface ID of shared memory device. */
 	__u16 shmem_protocol;
 } __attribute__((packed));
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/dbafd4b0ab336488338753a3a2961c43d66a697f.1578313099.git.jan.kiszka%40siemens.com.
