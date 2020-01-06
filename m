Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOMEZXYAKGQEVNGPPNQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53c.google.com (mail-ed1-x53c.google.com [IPv6:2a00:1450:4864:20::53c])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4113137E
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 15:20:42 +0100 (CET)
Received: by mail-ed1-x53c.google.com with SMTP id u20sf20088618eda.7
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 06:20:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578320442; cv=pass;
        d=google.com; s=arc-20160816;
        b=iXopsX1j6+5+7em3i5S7SoxsmDem82DmmKg4iEPg5Y8VtRYw18VywdapMDIPIsSuM7
         4aNT8BRPpJpfH/61wEFmd8nofolRIY4J6X/wOi4NwnNLFMiJYX5N05tb2oZxESHvxLu2
         3gylgRpoiJLL0VbsOT2yM9s0DY+NqXsO3NQjhaNcarKPMiiiQ4VP0piEfNkikAWnNLBh
         eI+AMG3PN+zAE7Jq/n79CBY9WIhmstuOG26jOfbhBpushCSS1sY1I8rs6wetyn3aKBew
         Vf7MqKAmzzdb3tuJ6eXU30IoFjh/O2Qq/9ayNlPMaAb2EStliiMUj1s7TG09Ak6pjCIH
         NMEg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5ArTCeoSWA2XoQXJBiaqFf28MovhIvO3dLiM/GWXQcM=;
        b=Ir437kmQ8ITBBAFAHxrZZLipEZNjYCcbNHQqdlSvMAeBvHkJXe+U01Ch9w382D2odg
         EPC0/SNFb+ekHJLnmfI7u0M0yDsTAtOtLe8GXfM1xXvi3Ze+iiz978XD4VDac3U2MdL+
         Alc7qTS242CeBNvfECKd4OmmYaMRHJLGGBUOPRSsHZqoPDjeEB6RSrtD7J7ypEHZW30r
         6SrneglZ+deE+LV5vAQ9JFoz0kmmYDSaStfiDWWFBQ3/zlOPseCuUHluP4B+nnK9f/dz
         ICbQdPYS3iRhlFL1f3QLeUTq0d5Ikc1amBUaSMMxgySe6I1Nfo8HzptMxWPVpi/0Z5Yk
         53kA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5ArTCeoSWA2XoQXJBiaqFf28MovhIvO3dLiM/GWXQcM=;
        b=RtmDjNmS4ErqZTEMhLCiMKm+hcGocyp5lmD2PARF0ls971k0zjb5/QBdoe8M+m5oGa
         2NeL5QEahjpZjACY5Pm9hO1Li9BZnxFtxJP6Tma//wyPeyZc2aisEK9h5eO1thxiYGiL
         d85saXA9IXgdtv9v3sXUGJgua6MAAXEHied2MmwgJFCnhFbIzBh2drkd7wFIZK91EtOy
         xtB9WXhzV9jofq+5dHHc0LpVFbp+/Hg6Jkk6b+vMVUVMDYqijF14JGXj1zAj5vgKizqU
         l3cUIG+CVaKSZc7ci96i7ey4cm7RovraAPfsJZFniQHwXDJX5hpOXu0YD5nf2e+IsnXd
         eUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5ArTCeoSWA2XoQXJBiaqFf28MovhIvO3dLiM/GWXQcM=;
        b=H4E1YXpBZVlaP/PEjDVwDTZbaLu994fevHKK1nkCdbwpOF7NIEvM/VlvavvBcho5Z0
         d2cRLWzyIls31D99kZxGHsVHHeeJWDDOQ4G/ZGbjfsZ/wbT3zyQyxTwXfvsL6wQyBAzs
         BPY7Qn/yhk4gkvVYrFx9y7XL6T0w5yMUfzN4B0WdegAwnC7vefjjL+XFZGGu6y+DNmcS
         uOjl7+n9/ugkU7fK16w79w+VHpHjAt8/rDGjQ6rMQXr47G/MaDkkwlgf+y6DBr4d48Q/
         KUXYqB3WnuCiru+f2ZTY3Ajgw7aONoFyHJcRl8FG3T6kJ/RewXAjAu6cPALvQVCPeKmM
         Ll/g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWpDxSTlgJhsJWCMSb+p8seTrSD5ph4HxkOsm/IGiDPlZUMfY2Z
	fASWtPmsdR0QiGetR4ME+7Q=
X-Google-Smtp-Source: APXvYqxw0z85Pfgg+6Vi7dkC/o/nCD3upuXOvX0+iQpXLL3VjYBvXpFGnW4TesE0da/fvbDUuvEFMg==
X-Received: by 2002:a17:906:cb8d:: with SMTP id mf13mr105335179ejb.147.1578320441790;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:385:: with SMTP id ss5ls15553702ejb.7.gmail; Mon, 06
 Jan 2020 06:20:41 -0800 (PST)
X-Received: by 2002:a17:906:3596:: with SMTP id o22mr900097ejb.235.1578320441032;
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578320441; cv=none;
        d=google.com; s=arc-20160816;
        b=0/QFaKZ2u+72AUJIUWIMeJUbP6RlfJvG6EHbssXrulQDbjnuVDIruUV0Vx5D/ThDVG
         uHyn3/eDn6Ywmlhj5hmRmg3ruF6v0TRrYtkLw5Yn92RQzHDRYaiuOVKozsycIzkI/hLn
         JaEVPDnIcotpjn/qD1EmacJxNAy8ens2qYjygKBZVIL2DGE5h6TLZrNMxL5bKvYKGvkC
         EqJFHzMzyO8w18TTVLDq7+3adrz2KxHQxZ85j4KZYmLt/LxOfYCvJrKnJ0DMymq1DHxF
         ee2JSElRlEYRKCZv7X0biqdL4KDMQrxoMoLHO2tTEYwkGA57Ndmn7+9sb2To0SPsXm1k
         LNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=tbWtdhz2C+MOW+DmUnP2RPlbhdHKUlRMErf1zKt2vyQ=;
        b=qBGIB6HZjbFBuyyVIXyCJsOsV64TEEtr5R3Ud84ffdyNwPg/28VaqaUD8qRydMkH4v
         yKhbgAh7bQImBqDKqTFpc7sv0mcl4lK326s8+gBBOOi+YhZBxk5p7Hb8jjEvs6EsVcjm
         dtVjZbv7wctRvm77bmFWItfIrmKZcp7BRGAZFEONu5IYgR2x+fyCN6dm8B6vMk6hz9Bb
         CL1SVweMOi7etqKaAGRv43ERjaKXygPuJe4z0qGBVxc7D6jQqSXemVcQ3UQ/RS2ox7OC
         83GBcz4gIya2EzxpFchHB8AAWhFFD5cWJuBkTky/9ya4czdpE+dtygNQOW9pNATq4EIr
         vCfg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id ba12si2243055edb.3.2020.01.06.06.20.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 06:20:41 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006EKeMv019202
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.36.235])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 006EKZjO008447
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 15:20:40 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 16/19] configs: arm/arm64: Consistently move ivshmem-net devices one PCI slot up
Date: Mon,  6 Jan 2020 15:20:32 +0100
Message-Id: <68b8ff84ae8dcf2633310bb9f448e2823c3b6df8.1578320435.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1578320435.git.jan.kiszka@siemens.com>
References: <cover.1578320435.git.jan.kiszka@siemens.com>
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

This free 00:00.0 on the virtual PCI controllers for the demo ivshmem
device. It should come before the networking device because it also uses
memory located before it.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  2 +-
 configs/arm/bananapi.c                        |  2 +-
 configs/arm/emtrion-rzg1e-linux-demo.c        |  4 ++--
 configs/arm/emtrion-rzg1e.c                   |  4 ++--
 configs/arm/emtrion-rzg1h-linux-demo.c        |  4 ++--
 configs/arm/emtrion-rzg1h.c                   |  4 ++--
 configs/arm/emtrion-rzg1m-linux-demo.c        |  4 ++--
 configs/arm/emtrion-rzg1m.c                   |  4 ++--
 configs/arm/jetson-tk1-linux-demo.c           |  4 ++--
 configs/arm/jetson-tk1.c                      |  4 ++--
 configs/arm/orangepi0-linux-demo.c            |  2 +-
 configs/arm/orangepi0.c                       |  2 +-
 configs/arm64/espressobin-linux-demo.c        |  4 ++--
 configs/arm64/espressobin.c                   |  6 +++---
 configs/arm64/hikey-linux-demo.c              |  4 ++--
 configs/arm64/hikey.c                         |  4 ++--
 configs/arm64/jetson-tx1-linux-demo.c         |  4 ++--
 configs/arm64/jetson-tx1.c                    |  4 ++--
 configs/arm64/k3-am654-idk-linux-demo.c       |  6 +++---
 configs/arm64/k3-am654-idk.c                  |  6 +++---
 configs/arm64/k3-j721e-evm-linux-demo.c       |  4 ++--
 configs/arm64/k3-j721e-evm.c                  |  6 +++---
 configs/arm64/macchiatobin-linux-demo.c       |  4 ++--
 configs/arm64/macchiatobin.c                  |  6 +++---
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  2 +-
 configs/arm64/miriac-sbc-ls1046a.c            |  6 +++---
 configs/arm64/qemu-arm64-linux-demo.c         |  4 ++--
 configs/arm64/qemu-arm64.c                    |  6 +++---
 configs/arm64/ultra96-linux-demo.c            |  4 ++--
 configs/arm64/ultra96.c                       |  6 +++---
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    |  8 ++++----
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 12 ++++++------
 configs/arm64/zynqmp-zcu102.c                 |  8 ++++----
 33 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 0aecdbcc..43c7ef36 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -104,7 +104,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index a59fc869..4e566380 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -199,7 +199,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index ee3cf79f..b76b8e84 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -151,9 +151,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index c1c01b3d..f392bf00 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -225,9 +225,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index c175e206..a41c94dd 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -165,9 +165,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index c020372d..26fa624a 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -351,9 +351,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index 083777df..75f34e72 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -165,9 +165,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index e0a8a1c3..4ee1a40c 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -260,9 +260,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 010d2022..13a7c00e 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -105,9 +105,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 3a6eb1fa..f815218d 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -248,10 +248,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 5ea4e34d..ee6e51b3 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -95,7 +95,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 9aa2876c..3f5d026b 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -140,7 +140,7 @@ struct {
 	.pci_devices = {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 75602beb..e94bc63f 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -95,9 +95,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index d17c9db3..79d79fa2 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -68,7 +68,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x3fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xd0000000,
@@ -104,10 +104,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 2bdca488..aefc429d 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -92,9 +92,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index f8a6c2a2..71489abf 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -110,10 +110,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index e51549b6..a14f865b 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -109,9 +109,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 2798fed8..60ed2630 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -387,10 +387,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index ceb4eca2..02bd2b18 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -54,7 +54,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 1),
 		/* RAM load */ {
 			.phys_start = 0x8FFFF0000,
@@ -133,9 +133,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index 9ac32dbb..ddd770fe 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -65,7 +65,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x8dfb00000, 0),
 		/* RAM */ {
 			.phys_start = 0x80000000,
@@ -206,10 +206,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 27662452..ed6dfe34 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -54,7 +54,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 1),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
@@ -259,7 +259,7 @@ struct {
 	.pci_devices = {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index b180d272..17ffb0f4 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -67,7 +67,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x89fe00000, 0),
 		/* ctrl mmr */ {
 			.phys_start = 0x00100000,
@@ -344,10 +344,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0003:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 3,
-			.bdf = 0x00,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index b1c475f4..f7675e8a 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -103,9 +103,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 0b79409e..db158824 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -70,7 +70,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x13fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xf0300000,
@@ -113,10 +113,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index 27fa5064..841c21a4 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -116,7 +116,7 @@ struct {
 	{
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 93279716..96a7139e 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -72,7 +72,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0xc0400000, 0),
 		/* DDR memory controller */ {
 			.phys_start = 0x01080000,
@@ -449,10 +449,10 @@ struct {
         },
 
 	.pci_devices = {
-		/* 0000:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index 90e686ba..a661beb3 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -96,9 +96,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index a75b60f7..e69c0da3 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -68,7 +68,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0x09000000,
@@ -104,10 +104,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 94fa51ba..7054f5f0 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -95,9 +95,9 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 83762c41..51996861 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -67,7 +67,7 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x7bf00000, 0),
 		/* MMIO (permissive) */ {
 			.phys_start = 0xfd000000,
@@ -96,10 +96,10 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index da4d1162..4fbd46a8 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -91,18 +91,18 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:01.0 */ {
+		/* 00:02.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 1 << 3,
+			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
-		/* 00:02.0 */ {
+		/* 00:03.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 2 << 3,
+			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 1,
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index 9e8ba801..c944fa56 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -49,9 +49,9 @@ struct {
 	},
 
 	.mem_regions = {
-		/* IVSHMEM shared memory region for 00:00.0 */
+		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 1),
-		/* IVSHMEM shared memory region for 00:02.0 */
+		/* IVSHMEM shared memory region for 00:03.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x800700000, 0),
 		/* UART */ {
 			.phys_start = 0xff010000,
@@ -97,18 +97,18 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 1,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
-		/* 00:02.0 */ {
+		/* 00:03.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
-			.bdf = 2 << 3,
+			.bdf = 3 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 0130c0da..151285f0 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -115,20 +115,20 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 0001:00:00.0 */ {
+		/* 0001:00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 0 << 3,
+			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 0,
 			.shmem_dev_id = 0,
 			.shmem_peers = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
-		/* 0001:00:00.0 */ {
+		/* 0001:00:02.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
-			.bdf = 1 << 3,
+			.bdf = 2 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_regions_start = 4,
 			.shmem_dev_id = 0,
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/68b8ff84ae8dcf2633310bb9f448e2823c3b6df8.1578320435.git.jan.kiszka%40siemens.com.
