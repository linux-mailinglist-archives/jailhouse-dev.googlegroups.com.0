Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3OLZTYAKGQEQEHNX7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23a.google.com (mail-lj1-x23a.google.com [IPv6:2a00:1450:4864:20::23a])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8D91311EA
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:19:57 +0100 (CET)
Received: by mail-lj1-x23a.google.com with SMTP id v1sf7420392lja.21
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:19:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578313197; cv=pass;
        d=google.com; s=arc-20160816;
        b=Bn63bH8xslwLsnmMyxbOAzKLaeHd4GaKG7aZadFbewYWOdS8WSIOKgW56nN6UCqpCe
         BSGRPLlyQaON5D5I2l0J39LO9J0+Tgphwbiv68HlfcGisfk+fqMhPi6md3DZNqiPfLo/
         djS3LAu0VM9mA37/Ty7DHFMHOq0eSGB1yko2MpfGpTv4hgQeeEm47nVGY182hpb08gua
         PH5FejFjv0qy+Qubbpf0Eb6Kdzfk4Z9toxq8VCWy1LrB2fEU1CR299dk+BsrGD5e0ajg
         bUKlzs0ujgj8IvvCwF4i3IyQjS8SFKRZUo+vqTue3NcSBcGrlf8F9bK/JoiyZSnQfuSJ
         h+bw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=5y3N43NyqGydhRRWUDZ861cLp4JoJJx8VheLNVM2S9E=;
        b=FMXJ4PYOsqaUSWg8nfD93yVLlWvJQd5Zk/gxdHSFoIfMVLiwCv4cqmLsGD0+6asAmW
         qRmvlcDN9/+NucU/qzy+LVyz04x8RYliNHkJPR43HiS6TtvmoQFXMDF3VtoP53wJopQG
         zln3TR3I8IVwUM2dCRLqR0w04M+fgwKT5gor4BhD7mmvLBgoUORWWzUzh4MrOdl5aXi8
         i7zlXLpSebJ8cptU59BICkSsq0O4EAmh1Cm0pvxYCwyaM7kyoD0iZNlEYyi38AJUSNLF
         ycsoR8Eq45XSjUelSjhJSRjqnrBUXmQTlQ+XsQ52w7+LhpzsxHlv0CvEidD2Si3QWBy/
         KAxg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=5y3N43NyqGydhRRWUDZ861cLp4JoJJx8VheLNVM2S9E=;
        b=esT6yyZuCcNFlAk5Gc9Dj+M1E5W3xeE7MxqZFhneHtlQXmwDyRoIp9QcEYT4R+w/wp
         ICY4eTBTJ48I7EAI3ZyTiN5ZDpMvdkcVvJeaCtMZiKCFCJYYQh0mgpsHbkx7oyLbZJzs
         ihiwKOByktkoImkcjsTHsq/BTeIHkls7pt2SjOm6+Nc/tMFBaaO34aR73wsJ6sAi/Ylu
         VA8aKCbqlN6lZqMVE/m3IzTF3dYwytHFF3wjn2NmXws7Ix9T6xb2eHgLyuUH06kvlXSy
         lJNXv+h0P0p7Ua3mjInWtdPX9VX8nltsUEddSE7Hk7JVvuXMGNXbl7/wUqESWSldo1li
         kqzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=5y3N43NyqGydhRRWUDZ861cLp4JoJJx8VheLNVM2S9E=;
        b=HF0OE77oaH6oqcPgMBQJTJgEeQv1y1pL0wYW0bhBtxRoj5TEKfT3iZ3FBUAF2+l0xC
         PzhN2o2CTT5lpw18R1Bn4yFNIaOf2nLQGGbMMqj1POa/WShUhYwhVqV65X+IeHLSc57n
         E/dB9vPAZf6ysiKePRfEEJ5wqWxD5qVtqwPBMINkZGFt5XYGR5+x1BxiHUH1/BzEvkkW
         97jONTRprOfWksuF8cTTmCwPDNPXdjE2ophS4gtT7mqHPA0c/MriiCB/ItGJq9IGUOhz
         HiDioBHwKqHEG5QdSITBws3Kr+i7tWbtd7EQ1JFZKOJPlTmfUnvzEhl2+FPmHLDl2F8V
         AgmA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWgIA9GMdDZ685OnrSZjOErbyK16yH7HKFomRBOoTHYBYNrjR5h
	re52YjtoyJwKSRfF3/2yZck=
X-Google-Smtp-Source: APXvYqyTZ2w39HLHS5dmaHXpQnk2rLDiZhAkSl0CfJWHrILHsskUX48OAwGZwyO72Nq8LPgMbYI9zA==
X-Received: by 2002:ac2:5216:: with SMTP id a22mr56988317lfl.18.1578313197483;
        Mon, 06 Jan 2020 04:19:57 -0800 (PST)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:b5d9:: with SMTP id g25ls5780999ljn.9.gmail; Mon, 06 Jan
 2020 04:19:56 -0800 (PST)
X-Received: by 2002:a2e:7505:: with SMTP id q5mr47952315ljc.7.1578313196414;
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578313196; cv=none;
        d=google.com; s=arc-20160816;
        b=rjI0Xby2UDU6EbMeAMwPQH7yiY2fUnwKu3qN+TM9PgoGGP+yAfoN+UTTjS6KdRvJHS
         fleB8wkx/Ax2J4qPdsFiUjiEAm8WFcD06si3CBpvbOt/G0rPSvbAhicNWxW2cIqQXfaq
         iAfdJOF84gmFFWHnU9uIeFMKrK3R2SJQ4P3x3XV7DvvBWeeI7y9zTDNvvZUXCOd/68yl
         1s684yQswPg/eHBGF8jQZ8UygGVT5WoBVn+YWwVaaVf1f1N5Q9kYrLy1BCYeqYl6IxrS
         h9XaZ638MMkFbag3D7j1iSVl8KQlnrib0pfP2EleN657jIrj0TZRS95WVQLFAKC2940p
         n0zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=NvLGUZ2UzQpXitRmkG3XbyU6CeaKJVKDhATQ3yebp5I=;
        b=JhYO5x8Ssx7tRG6KfD7TldPblYS+RbeS+2su8HnkCPdD+WYmeawkm3SbC5AOeLRO4a
         bXRhXqLqi66BtDYbaNdlF4hH1y0ZaemqKBn/8C56YZWhFr+Gf4rqQ0BeAK5oxgGYQ23I
         KN2Z7velw/AHXWZEqEJjivN++/r3ul3sVoDO0HmkvlFU/fbQF8sBjvM2a7UBadQqD6Xl
         dZ41TU6Q/fhFbwlE4Oux/Fm8/Vzw+oYEysZ8kA/PygMz1rG7NiuNsrZ3LTno7UzsI8vT
         0IWzPy5bXSW3OpVQvIgRWqZMDAtKB+AqmF4tQFuxiqVeXbhc3qS49DEIrEho2SLkAnn5
         cCgQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id o193si1361432lff.4.2020.01.06.04.19.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:19:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 006CJtEg019103
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.13.202])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 006CIKEd029483
	for <jailhouse-dev@googlegroups.com>; Mon, 6 Jan 2020 13:19:55 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/38] configs: Use constants for bar_mask of ivshmem devices
Date: Mon,  6 Jan 2020 13:17:46 +0100
Message-Id: <5ac5b95f6c044722cc9d8cefeaedd6aa83c46068.1578313099.git.jan.kiszka@siemens.com>
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

There are two possible settings for this parameter, one for INTx and one
for MSI-X. Both are invariant for all archs, so let's pull them out of
the config files. That will also simplify upcoming changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/bananapi-linux-demo.c             |  5 +----
 configs/arm/bananapi.c                        |  5 +----
 configs/arm/emtrion-rzg1e-linux-demo.c        |  5 +----
 configs/arm/emtrion-rzg1e.c                   |  5 +----
 configs/arm/emtrion-rzg1h-linux-demo.c        |  5 +----
 configs/arm/emtrion-rzg1h.c                   |  5 +----
 configs/arm/emtrion-rzg1m-linux-demo.c        |  5 +----
 configs/arm/emtrion-rzg1m.c                   |  5 +----
 configs/arm/jetson-tk1-linux-demo.c           |  5 +----
 configs/arm/jetson-tk1.c                      |  5 +----
 configs/arm/orangepi0-linux-demo.c            |  5 +----
 configs/arm/orangepi0.c                       |  5 +----
 configs/arm64/amd-seattle-linux-demo.c        |  5 +----
 configs/arm64/amd-seattle.c                   |  5 +----
 configs/arm64/espressobin-linux-demo.c        |  5 +----
 configs/arm64/espressobin.c                   |  5 +----
 configs/arm64/hikey-linux-demo.c              |  5 +----
 configs/arm64/hikey.c                         |  5 +----
 configs/arm64/jetson-tx1-linux-demo.c         |  5 +----
 configs/arm64/jetson-tx1.c                    |  5 +----
 configs/arm64/k3-am654-idk-linux-demo.c       |  5 +----
 configs/arm64/k3-am654-idk.c                  |  5 +----
 configs/arm64/k3-j721e-evm-linux-demo.c       |  5 +----
 configs/arm64/k3-j721e-evm.c                  |  5 +----
 configs/arm64/macchiatobin-linux-demo.c       |  5 +----
 configs/arm64/macchiatobin.c                  |  5 +----
 configs/arm64/miriac-sbc-ls1046a-linux-demo.c |  6 +-----
 configs/arm64/miriac-sbc-ls1046a.c            |  5 +----
 configs/arm64/qemu-arm64-linux-demo.c         |  5 +----
 configs/arm64/qemu-arm64.c                    |  5 +----
 configs/arm64/ultra96-linux-demo.c            |  5 +----
 configs/arm64/ultra96.c                       |  5 +----
 configs/arm64/zynqmp-zcu102-linux-demo-2.c    | 10 ++--------
 configs/arm64/zynqmp-zcu102-linux-demo.c      | 10 ++--------
 configs/arm64/zynqmp-zcu102.c                 | 10 ++--------
 configs/x86/ivshmem-demo.c                    |  5 +----
 configs/x86/linux-x86-demo.c                  |  5 +----
 configs/x86/qemu-x86.c                        | 10 ++--------
 include/jailhouse/cell-config.h               | 12 ++++++++++++
 39 files changed, 54 insertions(+), 169 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index fd1931f3..922d22ac 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -110,10 +110,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/bananapi.c b/configs/arm/bananapi.c
index ffc4589c..475749d8 100644
--- a/configs/arm/bananapi.c
+++ b/configs/arm/bananapi.c
@@ -204,10 +204,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e-linux-demo.c b/configs/arm/emtrion-rzg1e-linux-demo.c
index 1bf08b66..74b884b4 100644
--- a/configs/arm/emtrion-rzg1e-linux-demo.c
+++ b/configs/arm/emtrion-rzg1e-linux-demo.c
@@ -159,10 +159,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1e.c b/configs/arm/emtrion-rzg1e.c
index e3872cf2..9f06c20c 100644
--- a/configs/arm/emtrion-rzg1e.c
+++ b/configs/arm/emtrion-rzg1e.c
@@ -232,10 +232,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h-linux-demo.c b/configs/arm/emtrion-rzg1h-linux-demo.c
index ad2dceeb..e20d3dbb 100644
--- a/configs/arm/emtrion-rzg1h-linux-demo.c
+++ b/configs/arm/emtrion-rzg1h-linux-demo.c
@@ -173,10 +173,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1h.c b/configs/arm/emtrion-rzg1h.c
index 03e1be5b..e38c8fa5 100644
--- a/configs/arm/emtrion-rzg1h.c
+++ b/configs/arm/emtrion-rzg1h.c
@@ -358,10 +358,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m-linux-demo.c b/configs/arm/emtrion-rzg1m-linux-demo.c
index d8b8441a..969dbd86 100644
--- a/configs/arm/emtrion-rzg1m-linux-demo.c
+++ b/configs/arm/emtrion-rzg1m-linux-demo.c
@@ -173,10 +173,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/emtrion-rzg1m.c b/configs/arm/emtrion-rzg1m.c
index 84d68f62..aa11cc9b 100644
--- a/configs/arm/emtrion-rzg1m.c
+++ b/configs/arm/emtrion-rzg1m.c
@@ -267,10 +267,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 16,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 7ee83f7a..bd209c87 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -113,10 +113,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/jetson-tk1.c b/configs/arm/jetson-tk1.c
index 7374ef44..343ff2ab 100644
--- a/configs/arm/jetson-tk1.c
+++ b/configs/arm/jetson-tk1.c
@@ -256,10 +256,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 21,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0-linux-demo.c b/configs/arm/orangepi0-linux-demo.c
index 49ee10e9..ac620b16 100644
--- a/configs/arm/orangepi0-linux-demo.c
+++ b/configs/arm/orangepi0-linux-demo.c
@@ -101,10 +101,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm/orangepi0.c b/configs/arm/orangepi0.c
index 5b52f60a..7a1d6da0 100644
--- a/configs/arm/orangepi0.c
+++ b/configs/arm/orangepi0.c
@@ -145,10 +145,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 8,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/amd-seattle-linux-demo.c b/configs/arm64/amd-seattle-linux-demo.c
index 5349323c..fb526c3e 100644
--- a/configs/arm64/amd-seattle-linux-demo.c
+++ b/configs/arm64/amd-seattle-linux-demo.c
@@ -141,10 +141,7 @@ struct {
 		/* 00:0f.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x0078,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 6,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/amd-seattle.c b/configs/arm64/amd-seattle.c
index b5cff3b3..4cd8580f 100644
--- a/configs/arm64/amd-seattle.c
+++ b/configs/arm64/amd-seattle.c
@@ -218,10 +218,7 @@ struct {
 		/* 00:0f.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x0078,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 16,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index 92da96e9..97117201 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -103,10 +103,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/espressobin.c b/configs/arm64/espressobin.c
index a23dc24b..bd6b5b00 100644
--- a/configs/arm64/espressobin.c
+++ b/configs/arm64/espressobin.c
@@ -112,10 +112,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index 76dda9da..073faa54 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -100,10 +100,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/hikey.c b/configs/arm64/hikey.c
index 7e6bb952..d9a72afb 100644
--- a/configs/arm64/hikey.c
+++ b/configs/arm64/hikey.c
@@ -118,10 +118,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index b8698259..cd7e3d8d 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -117,10 +117,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index d1fb21b8..646dc8c0 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -396,10 +396,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 42,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 5eab1502..ecc81246 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -140,10 +140,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-am654-idk.c b/configs/arm64/k3-am654-idk.c
index a951a461..b952283c 100644
--- a/configs/arm64/k3-am654-idk.c
+++ b/configs/arm64/k3-am654-idk.c
@@ -214,10 +214,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 55938b85..af8299b5 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -265,10 +265,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index ff6dcff4..78c4074a 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -352,10 +352,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 3,
 			.bdf = 0x00,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 0,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index 6e18f62f..c2b317eb 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -111,10 +111,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/macchiatobin.c b/configs/arm64/macchiatobin.c
index 4811e8dd..9237e93d 100644
--- a/configs/arm64/macchiatobin.c
+++ b/configs/arm64/macchiatobin.c
@@ -121,10 +121,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
index ec2531b2..d07b04d0 100644
--- a/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
+++ b/configs/arm64/miriac-sbc-ls1046a-linux-demo.c
@@ -123,11 +123,7 @@ struct {
 		{
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask =
-			{
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/miriac-sbc-ls1046a.c b/configs/arm64/miriac-sbc-ls1046a.c
index 6f3ad198..d9dcb54f 100644
--- a/configs/arm64/miriac-sbc-ls1046a.c
+++ b/configs/arm64/miriac-sbc-ls1046a.c
@@ -457,10 +457,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = ARRAY_SIZE(config.mem_regions) - 1,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64-linux-demo.c b/configs/arm64/qemu-arm64-linux-demo.c
index ed89413b..4f464503 100644
--- a/configs/arm64/qemu-arm64-linux-demo.c
+++ b/configs/arm64/qemu-arm64-linux-demo.c
@@ -104,10 +104,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/qemu-arm64.c b/configs/arm64/qemu-arm64.c
index 79e7cda6..29e87a4c 100644
--- a/configs/arm64/qemu-arm64.c
+++ b/configs/arm64/qemu-arm64.c
@@ -112,10 +112,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 7cbfd772..b24c7fac 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -103,10 +103,7 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index bcf08772..1eeed354 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -104,10 +104,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 02ec89e8..749b34b3 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -104,20 +104,14 @@ struct {
 		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 1 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 2,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index c30ed924..3e5e703d 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -110,20 +110,14 @@ struct {
 		/* 00:00.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
 		/* 00:02.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 2 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index 9de04d6c..de3e3238 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -127,10 +127,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 0 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
@@ -138,10 +135,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 1,
 			.bdf = 1 << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0x00000000, 0x00000000,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
 			.shmem_region = 4,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
 		},
diff --git a/configs/x86/ivshmem-demo.c b/configs/x86/ivshmem-demo.c
index 77b61b6f..f0a8f765 100644
--- a/configs/x86/ivshmem-demo.c
+++ b/configs/x86/ivshmem-demo.c
@@ -83,10 +83,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0f << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 2,
 		},
diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
index 2299544e..33fe0f76 100644
--- a/configs/x86/linux-x86-demo.c
+++ b/configs/x86/linux-x86-demo.c
@@ -145,10 +145,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0,
 			.bdf = 0x0e << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 3,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
index 03768f12..58b8b75e 100644
--- a/configs/x86/qemu-x86.c
+++ b/configs/x86/qemu-x86.c
@@ -280,10 +280,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0e << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 14,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_VETH,
@@ -292,10 +289,7 @@ struct {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.domain = 0x0000,
 			.bdf = 0x0f << 3,
-			.bar_mask = {
-				0xffffff00, 0xffffffff, 0x00000000,
-				0x00000000, 0xffffffe0, 0xffffffff,
-			},
+			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_MSIX,
 			.num_msix_vectors = 1,
 			.shmem_region = 15,
 			.shmem_protocol = JAILHOUSE_SHMEM_PROTO_UNDEFINED,
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 6ef9e513..7ffe84fe 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -183,6 +183,18 @@ struct jailhouse_pci_device {
 	__u8 padding[2];
 } __attribute__((packed));
 
+#define JAILHOUSE_IVSHMEM_BAR_MASK_INTX			\
+	{						\
+		0xffffff00, 0xffffffff, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
+	}
+
+#define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX			\
+	{						\
+		0xffffff00, 0xffffffff, 0x00000000,	\
+		0x00000000, 0xffffffe0, 0xffffffff,	\
+	}
+
 #define JAILHOUSE_PCI_EXT_CAP		0x8000
 
 #define JAILHOUSE_PCICAPS_WRITE		0x0001
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/5ac5b95f6c044722cc9d8cefeaedd6aa83c46068.1578313099.git.jan.kiszka%40siemens.com.
