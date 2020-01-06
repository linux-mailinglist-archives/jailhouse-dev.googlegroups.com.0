Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5OLZTYAKGQECQBCM6I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C73131208
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:20:06 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id a19sf8050903ljp.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:20:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313206; cv=pass;
        d=google.com; s=arc-20160816;
        b=mP8Q74S6NtCHd/xuIXguy+gyhme5NSYH6QgYPYjJ3z2LU6uFX508lgJp+5aP/xGmvu
         T2/CiZGwzVuUJJQf0bNoSUMvfv5dz+ZU3NNVgWg2UmhH+Ng2iC29Opz3L00nIsanH9St
         QTB9+ZE1egLfXyyReShL0za4lAYuVXnZGFd1pyGned11Iz0NbizRuNCPOgFFj19dnUHp
         OvnidB+Ag3GpdHF7zlIauOKCbZOZ07dVgshlQBDc6XLJ88QkS+qPtMiHjQCLTBL4KJXv
         Miwa2qb2srF9iue9u9kaKibQHI/dk+VyI594UGocGgWJmo2snfihBxStdDYvQrJtinKI
         P6zQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=BMPGWz7jHwijSfMokVPdg+uPGOhdAr7BBi+7jIjY43A=;
        b=clCW/SSQdycleVKYafR6+K2ApUbAJa0oKY0a1zSzH0r/UBB37I8jpT2jXFUy6m4YBb
         83yta+ep7g6n5VQBnVvOLwupn91QCUjr1dIv06fIFPtcdTr0wuWpl9MGrtD5KHrLjrhV
         o6CAbzya6msn293iP+5EwiAPR+EZTkcEnLwqzrRH2BcLjsbqdGl1M8FytJ8N+Pl46yId
         Hmg8ONUtHRcQLtBp+zFdyyuD47e49xKJ1JIKFsjlLVlbb2T9TgQ+N0kYNnrEM7QOhVak
         GM+mUJuUtHZmnn3i6Y8mF5eJIlaFyHP6xsh8tn3L+16YTgfgM+TnnIQSv2ljtUW4Ejsx
         5/Bw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=BMPGWz7jHwijSfMokVPdg+uPGOhdAr7BBi+7jIjY43A=;
        b=K7EZYtodB52gXTsCDKqgA0jpBoOfMj2vXVeOC0Qu0Qdd0Bapkew5gOwYsU8E/RdnQM
         ts18pxKMhj9C03U/dmJ7vCB72gSVtGJW+2ymGsgyyAXrII3Wy8M8Be50e76uaBmo+3MS
         ZANf5ubUbGgs8xoVMnWMTQV4Fnohlj/ukGspeeFzcBPY4zEmTtOardCK+2MX56yEzRhN
         SKAgEyFdYehJOANTZ6b1Tnf33dp/9lXGB7Ys+ZLYU6DxAf0ALd3sYZpWToYJ3DekG4Co
         CGwjowV28LYLirqCToedYbNWHWj+xsxPqXwbj4lhLv8tJIVlcjw7nB9UTRkqoBtTjhvl
         WJXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=BMPGWz7jHwijSfMokVPdg+uPGOhdAr7BBi+7jIjY43A=;
        b=ILA0R2s2RcmF7fxCfTlPL4SNAuiYgFv7kAvCzMkLKZSzyMkM+yHtPt4bn/m58ckP8M
         CsiJTBENx8YDU1uMyRfUKrjsDeYwW7ON0pK1q395VbTvEOYFwQBjvSSGQwEZrgWNm0/l
         GPRr0O2Z8xA1wh3NZwnTnUkljwbYKUqNlA6AjoKlJKnrwBST2mcdcItJjYTFT9gGsSqE
         zR3TFDiSt6v7PAbpGSoyJVSrfT9A/T4Vdy0OFzE/tXtxLIcAvfw4fp6dgQYVyUjbW08y
         ru+NHTYNzo+7cBjC2cX/qm0bAlOvGlnBXqlX3a3Y6MebDxgjMCmBrvGcaH7k2K6LrMlC
         Repg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWgD8pxjNp561BdvbX+xcJlS9O7cWV4GL4blqgQF5q2PEQsuYAx
	BC5z6WD4WRNb60UDXta/ZA4=
X-Google-Smtp-Source: APXvYqxS1BqngC6b18i1Yo+OD1qxvbiP9/4aEuqfvj0ou3hub8ziGCOtnZWHu+rfewWxSyFJRc141w==
X-Received: by 2002:a05:6512:21d:: with SMTP id a29mr58662131lfo.186.1578313206084;
        Mon, 06 Jan 2020 04:20:06 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9e01:: with SMTP id e1ls5789099ljk.15.gmail; Mon, 06 Jan
 2020 04:20:05 -0800 (PST)
X-Received: by 2002:a2e:7005:: with SMTP id l5mr61670338ljc.230.1578313205207;
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313205; cv=none;
        d=google.com; s=arc-20160816;
        b=i6yX1fwLOLqKpHsD8+0fSanuuIlCMtE4nObOF1A1MYnMphJezjzeN8di9C+224sBpB
         aDelL3ui25NdDn765Hq70wkUSXw38eg6vhs0dG/xgdkqheJqjtBAp9LaGGRWKtiyARvU
         QUXezaLSkgLOPiI2uozu5QOBstyvoo0/rugd3naWWC52tqG5EgO2DIzGICUJLnevjGzK
         mk0/5UpGA9VLpmqVDmDIlUFjGM8Ba1ilF8JQZOGbnUOMBCkxoMd41EAJ26Ogba5pz8vt
         kphe2f4BEhXiAFM1iJb+Z+YZZiYA5Rk2wub2LDnzFtdmLtICPMhB14mZQF8isGQaJzyu
         DliQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=Jsb+Qaa2vYYd/G0XI8SLIrumRiovy7GjMiB7PAAz0gg=;
        b=hhtZSYhejdd31Pzy9tSlaHZ3Ff9SIq9X35hmo6SxhHUK9++KgWuXx/TmKYkF8BAjMs
         8isz4ou3Ga/ls2pxIZqJYvTe91gRqwthTw6Wy3SDcWPy9lAumR+31qME5J/2nYCAqFa/
         8UGBlY7lI4bP2nyFz0PO1d1yDXxjyQXYBDuKL6x2XKP5m4yHLXTA9pkKpumGvJVxpz3i
         vbrSM0uawEAixaP06Go1W4ZLaecCfGKelcBahiHMaLU8FsFtcAndw4SVgtA5lUFWyuW2
         4oJhNE/DjGnU8njaVDh9deyr+kk8PP8FmGUkmq07Ezvrf6m6PcdUzG7zwkUWDfzl8GCh
         P2QQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c3si1649054ljd.1.2020.01.06.04.20.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:20:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CK41r019425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKF7029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:20:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 33/38] core, configs: ivshmem: Add shared memory output sections support
Date: Mon,  6 Jan 2020 13:18:14 +0100
Message-Id: <af86dc75e464dbd48bce55fc37042b3539eec604.1578313099.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578313099.git.jan.kiszka@siemens.com>
References: <cover.1578313099.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

This adds optional peer-specific output sections to the shared memory
region. Each peer will get its own read/write section that other peers
can only read from. The benefit of such model is that senders can be
sure their messages cannot be concurrently modified by other peers while
they are creating and before they may have signed them. Having a
private section avoids to need to copy in complete messages in integrity
sensitive scenarios.

These output sections are located after the common read/write section.
Their presence is signaled by non-zero value in the output section size
register.

Consequently, all configs need to append two memory regions per ivshmem
device. We switch all ivshmem-net users to this unidirectional model,
setting their common read/write section to zero.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  2 +-
 configs/arm/bananapi.c                        |  2 +-
 configs/arm/emtrion-rzg1e-linux-demo.c        |  2 +-
 configs/arm/emtrion-rzg1e.c                   |  2 +-
 configs/arm/emtrion-rzg1h-linux-demo.c        |  2 +-
 configs/arm/emtrion-rzg1h.c                   |  2 +-
 configs/arm/emtrion-rzg1m-linux-demo.c        |  2 +-
 configs/arm/emtrion-rzg1m.c                   |  2 +-
 configs/arm/jetson-tk1-linux-demo.c           |  2 +-
 configs/arm/jetson-tk1.c                      |  2 +-
 configs/arm/orangepi0-linux-demo.c            |  2 +-
 configs/arm/orangepi0.c                       |  2 +-
 configs/arm64/amd-seattle-linux-demo.c        |  2 +-
 configs/arm64/amd-seattle.c                   |  2 +-
 configs/arm64/espressobin-linux-demo.c        |  2 +-
 configs/arm64/espressobin.c                   |  2 +-
 configs/arm64/hikey-linux-demo.c              |  2 +-
 configs/arm64/hikey.c                         |  2 +-
 configs/arm64/jetson-tx1-linux-demo.c         |  2 +-
 configs/arm64/jetson-tx1.c                    |  2 +-
 configs/arm64/k3-am654-idk-linux-demo.c       |  2 +-
 configs/arm64/k3-am654-idk.c                  |  2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c       |  2 +-
 configs/arm64/k3-j721e-evm.c                  |  2 +-
 configs/arm64/macchiatobin-linux-demo.c       |  2 +-
 configs/arm64/macchiatobin.c                  |  2 +-
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  2 +-
 configs/arm64/miriac-sbc-ls1046a.c            |  2 +-
 configs/arm64/qemu-arm64-linux-demo.c         |  2 +-
 configs/arm64/qemu-arm64.c                    |  2 +-
 configs/arm64/ultra96-linux-demo.c            |  2 +-
 configs/arm64/ultra96.c                       |  2 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  4 ++--
 configs/arm64/zynqmp-zcu102-linux-demo.c      |  4 ++--
 configs/arm64/zynqmp-zcu102.c                 |  4 ++--
 configs/x86/ivshmem-demo.c                    | 15 ++++++++++++++-
 configs/x86/linux-x86-demo.c                  |  4 ++--
 configs/x86/qemu-x86.c                        | 16 ++++++++++++++--
 hypervisor/ivshmem.c                          |  5 +++++
 include/jailhouse/cell-config.h               | 14 +++++++++++---
 40 files changed, 84 insertions(+), 46 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 1b609902..07895829 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index fdf8978b..1fc293a1 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index c946f6d0..01a49cd0 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[14];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index 5b3bf03c..c9c86e7c 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[20];
+	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index 623f8886..34749b29 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[14];
+	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 9ab36d25..92d7e83b 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[38];
+	struct jailhouse_memory mem_regions[40];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 73ad3c5b..dedeac03 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[14];
+	struct jailhouse_memory mem_regions[16];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 4c6b7c58..9f937549 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[25];
+	struct jailhouse_memory mem_regions[27];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 48844a66..016e4bc8 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index ca368fcf..8edbcb39 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -21,7 +21,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[23];
+	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 09087a28..b1a3b068 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index b878f70c..afc96a8f 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[10];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 3da6a2e7..15dd43e7 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[10];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index 44dedeb1..c6a7a07f 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[20];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[3];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 2d84665c..55c8ab77 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index 082c9479..43445393 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 623b4b5b..410863c3 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index c570e905..9da2a6dd 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index cb4c356c..5cfd9bad 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -25,7 +25,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 801a5774..c0df4557 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -21,7 +21,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[44];
+	struct jailhouse_memory mem_regions[46];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index bea2c984..54b84da6 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -23,7 +23,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[10];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[3];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 85f663f1..66914031 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[16];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index ec0e3a39..17cdc5ce 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[23];
+	struct jailhouse_memory mem_regions[25];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index f22e9962..27c35960 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[34];
+	struct jailhouse_memory mem_regions[36];
 	struct jailhouse_irqchip irqchips[6];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 2ebabb0d..71d084ee 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_memory mem_regions[9];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 2fca01a2..5b5aa491 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 9eb96734..4f8cd3c2 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index ea64d44a..c2884d59 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[53];
+	struct jailhouse_memory mem_regions[55];
 	struct jailhouse_irqchip irqchips[2];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index c3b06c11..000c4f32 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 786bddb2..1436464d 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[7];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index a9ce834e..ed891766 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[6];
+	struct jailhouse_memory mem_regions[8];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 890c121c..831c6d31 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[1];
 } __attribute__((packed)) config = {
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index a02da41d..c0912c1d 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[7];
+	struct jailhouse_memory mem_regions[11];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -103,7 +103,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 2,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index d11d7c64..046d2b49 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -109,7 +109,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 2,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 1eb165af..4dcb313f 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[8];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -129,7 +129,7 @@ struct {
 			.domain = 1,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
-			.shmem_regions_start = 2,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index e7440f01..eb77ccae 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -19,7 +19,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[4];
+	struct jailhouse_memory mem_regions[6];
 	struct jailhouse_pio pio_regions[2];
 	struct jailhouse_pci_device pci_devices[1];
 	struct jailhouse_pci_capability pci_caps[0];
@@ -64,6 +64,19 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_ROOTSHARED,
 		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_ROOTSHARED,
+		},
 		/* RAM */ {
 			.phys_start = 0x3ee00000,
 			.virt_start = 0,
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index b9cc7c68..c03b2b48 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -19,9 +19,9 @@ struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
 #ifdef CONFIG_QEMU_E1000E_ASSIGNMENT
-	struct jailhouse_memory mem_regions[9];
+	struct jailhouse_memory mem_regions[11];
 #else
-	struct jailhouse_memory mem_regions[5];
+	struct jailhouse_memory mem_regions[7];
 #endif
 	struct jailhouse_cache cache_regions[1];
 	struct jailhouse_irqchip irqchips[1];
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index ea642292..b4869fba 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -22,7 +22,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[18];
+	struct jailhouse_memory mem_regions[22];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pio pio_regions[12];
 	struct jailhouse_pci_device pci_devices[9];
@@ -87,6 +87,18 @@ struct {
 			.size = 0x9000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
 		},
+		{
+			.phys_start = 0x3f0fa000,
+			.virt_start = 0x3f0fa000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
+		},
+		{
+			.phys_start = 0x3f0fc000,
+			.virt_start = 0x3f0fc000,
+			.size = 0x2000,
+			.flags = JAILHOUSE_MEM_READ,
+		},
 		/* IVSHMEM shared memory regions (networking) */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3f100000, 0),
 		/* RAM */ {
@@ -293,7 +305,7 @@ struct {
 			.bdf = 0x0f << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 2,
-			.shmem_regions_start = 2,
+			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/hypervisor/ivshmem.c b/hypervisor/ivshmem.c
index 7e376e4e..f42a5bcb 100644
--- a/hypervisor/ivshmem.c
+++ b/hypervisor/ivshmem.c
@@ -40,6 +40,7 @@
 
 #define IVSHMEM_CFG_SHMEM_STATE_TAB_SZ	(IVSHMEM_CFG_VNDR_CAP + 0x04)
 #define IVSHMEM_CFG_SHMEM_RW_SZ		(IVSHMEM_CFG_VNDR_CAP + 0x08)
+#define IVSHMEM_CFG_SHMEM_OUTPUT_SZ	(IVSHMEM_CFG_VNDR_CAP + 0x10)
 #define IVSHMEM_CFG_SHMEM_ADDR		(IVSHMEM_CFG_VNDR_CAP + 0x18)
 #define IVSHMEM_CFG_VNDR_LEN		0x20
 
@@ -492,6 +493,10 @@ void ivshmem_reset(struct pci_device *device)
 	ive->cspace[IVSHMEM_CFG_SHMEM_RW_SZ/4 + 1] =
 		(u32)(ive->shmem[1].size >> 32);
 
+	ive->cspace[IVSHMEM_CFG_SHMEM_OUTPUT_SZ/4] = (u32)ive->shmem[2].size;
+	ive->cspace[IVSHMEM_CFG_SHMEM_OUTPUT_SZ/4 + 1] =
+		(u32)(ive->shmem[2].size >> 32);
+
 	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4] = (u32)ive->shmem[0].virt_start;
 	ive->cspace[IVSHMEM_CFG_SHMEM_ADDR/4 + 1] =
 		(u32)(ive->shmem[0].virt_start >> 32);
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 10ac60f9..bf717bae 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -136,12 +136,20 @@ struct jailhouse_memory {
 		.size = 0x1000,						\
 		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED,	\
 	},								\
+	{ 0 },								\
 	{								\
 		.phys_start = (start) + 0x1000,				\
 		.virt_start = (start) + 0x1000,				\
-		.size = 0xff000,					\
-		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |	\
-			JAILHOUSE_MEM_ROOTSHARED,			\
+		.size = 0x7f000,					\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED | \
+			((dev_id == 0) ? JAILHOUSE_MEM_WRITE : 0),	\
+	},								\
+	{								\
+		.phys_start = (start) + 0x80000,			\
+		.virt_start = (start) + 0x80000,			\
+		.size = 0x7f000,					\
+		.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_ROOTSHARED | \
+			((dev_id == 1) ? JAILHOUSE_MEM_WRITE : 0),	\
 	}
 
 #define JAILHOUSE_MEMORY_IS_SUBPAGE(mem)	\
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af86dc75e464dbd48bce55fc37042b3539eec604.1578313099.git.jan.kiszka%40siemens.com.
