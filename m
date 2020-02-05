Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYG75HYQKGQEL4UJH2I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x139.google.com (mail-lf1-x139.google.com [IPv6:2a00:1450:4864:20::139])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7A215270A
	for <lists+jailhouse-dev@lfdr.de>; Wed,  5 Feb 2020 08:33:53 +0100 (CET)
Received: by mail-lf1-x139.google.com with SMTP id a11sf369884lff.12
        for <lists+jailhouse-dev@lfdr.de>; Tue, 04 Feb 2020 23:33:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1580888033; cv=pass;
        d=google.com; s=arc-20160816;
        b=H4eO+O6I8hADJS/kRrSIQLvopakzMd2IdXHkgukpJiz2ztQklfJL3B9qFWcAWkdJ4H
         AO6n7ZpX3p+vCLLmop1VY+Yiae4mYED39xIYspxz2M159WWwP0uPSZk5hgqfIWPkFKcT
         5oOmi3P4RjtnlECSelvOvDqejEAaoCSDTVrXk20VHC77XJMZHRvahyFzBZ/BLhqbAlHe
         yY5IM5xqKvBeTxbF8E6HnXoxYFaYUSn9YH7I/0L94gi+fdiU6rEpIec0lYW5mjBNv9KE
         oB99i6rEaRNjX2QcsGMZzGacUxuPAU6Tuiz5GJdW97b8ve1wyjTEbBNropqlxer28k2W
         3a7g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:to:subject:from:sender:dkim-signature;
        bh=tgu0m10UhT3k5vq2GsL6gbFQJR3NmhVJ+eSvyHh2yd0=;
        b=Foe8rAqFUT7ZQLvNb2MbNDH2xfX3RKgU3Pyin1gnU41adg6NbpUoU+Y5svNyw85CAY
         BpHZ+B23NHzrMwRfPmgaHJfEnCO1tTI/6MOyZWdW63l00CaRjDJGOBhQv4CeQft+fCRk
         F95WW2AF1dDBFEN7Pj5MRV5pKBBGmcQGz6AHzUtJ5TRhDtfPuZKPRFUZKdlna4gsA5Pn
         n+Zfw8kTHOz1iKIuzrKeMi2hLMDkAI/uBmPreQPRziViiMsvhA/effAZHknabJzP9JlQ
         9c4xnw/IPZw1i/IJpgC0/fm34ArTRvU1E6PIMzBIxgsMxZJvHaIZmnlnPsVoxozex3Ej
         FWLA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:subject:to:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=tgu0m10UhT3k5vq2GsL6gbFQJR3NmhVJ+eSvyHh2yd0=;
        b=pKwYJgGloVKetrtHzcsNyEZMTZ9BtefHRt2y4Fibx8MlAYCTd43xfi+3DxuvG7Jol7
         b0C3JzQIUy3CFWjgvyDVIEVeZds/TaYRFCAnfBgzrFMkbvFZ7CshWAj5b1zCiLlEPQUs
         ebxcgttuwU4AqOJ54K5KQeZ70L9A52tjJC1Cs0PgSpAhzEDU8Gravm+Y9dwJj6D92ztr
         DLRZmKeG//FjCethbcuUfaRmcMBNwnIcJfmCJYlBF/UOKF7NHxP1jEOpLcgCE/Iup8mk
         qQWAt8Xk49gIqjrWNf4N/J5YKrZJImlhr2+2hUK/u3v80bQjkgxc3jSLtVTmpkSmQsBT
         +R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:subject:to:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tgu0m10UhT3k5vq2GsL6gbFQJR3NmhVJ+eSvyHh2yd0=;
        b=Q+S/oYZWeNEFNkcVix9joaMSM9ll9GXYZlVLgl2UnhikqPpE4DoqUwcCz+qa2gaM76
         mP4uXUkK5dalq0M/PO8OH4cL/voe90a2UZSsD9kU8Yfwi/VULZ3ylEZbDLSMtlVPC1lX
         wP1K1CbXoKRCrKAJGZ+hL8r9M0B2csiT/Ako+CF5L3TNYZL+L1NYAFBh+dGsgcq4iBDS
         vYouDAv7mj7G8HG8bEMoNsY7FyS4xS0ZAL26NGelkKi0QOSgxRpxKj6eco2SblWCdFgV
         jsHAGc7cuhg4B1YmynByRgJsVOx5ijSUE4sJGy2JxcGMeNLShj27E/Rgx7MKooQZzy0m
         4i3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXtPDex9OaDseGIa0uQSPQLknhA33tE6AQsekyw8VUnIOJbhUuy
	T54wirTjuE0JxNdByR5j5TU=
X-Google-Smtp-Source: APXvYqzbWAQdVmBXSScu1L+VW0q+0byCHx6VB0vgggTH818K0yNsOtq4TjEcn7ecnB0tqrj2QxCP7A==
X-Received: by 2002:a2e:9284:: with SMTP id d4mr19222204ljh.226.1580888033180;
        Tue, 04 Feb 2020 23:33:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:48a8:: with SMTP id u8ls140177lfg.7.gmail; Tue, 04 Feb
 2020 23:33:52 -0800 (PST)
X-Received: by 2002:a19:6d13:: with SMTP id i19mr16574995lfc.6.1580888032162;
        Tue, 04 Feb 2020 23:33:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580888032; cv=none;
        d=google.com; s=arc-20160816;
        b=I6fyspQbsp8rDhnBeaueMX/U1GLbJ/VJJQg98M61512bHjVE447X6Wf1+2qLa3TcXf
         vcHfjOZCnFbtdtoUrRs2sExPDo14yCRVqZDOHttIQilsLH8ON5Tagp9F2mjIRI7E4oMw
         psamV4LoH2BxZatiCVj/sMceXVL5BeYG8Ub/YGyT64RPlM+9WHXLUMikR4jO/IWUjdyf
         jJgk9anF3GcqIGMP/HbTDHIDdWRBCcqM9s0inbJeKOUGNgIvP0PKmgUh+NqJwQm8QN8O
         Jhht2pRmRyEqa5LaJ12ysOmdt1AKrUpK7W6AXMS7r5x4/vyZxzKaJ7osOd4+heTtcSQI
         vgzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:to:subject:from;
        bh=ZHOj1NTNdAwLNCBxLzoibtQcAPYeu/ZWJ0CeMow6MkQ=;
        b=RC04l9l767G7TyVuMI0ZKJBPOFaX/PefwxFMQCBrCTNEzJY28F93jCY7DC2dvWlb7C
         p9+0Xn263EgS8umnyEzb/za8i+hk616sW+8Jh+W0PMgzI3W4k4LpGVhbYGFDQsvVRJvu
         bJ1P5QWADJc+m7rns4lqAj+wacHKESv1oDnWCLiWz4fkG6Nb6+ikaaqCJZi4QUnH8cfj
         KhezYI6nIcizBYK5Huj0pSDV5R6n4u+/Mtmk0Z6AS/cSuQz6j5ZB6GKBxgm/7d6psz7+
         dwxAPK2pBlICEBXBr3rASBXv9R0Qc1H6+y71C6jdwdbMdLKkqgPAnkpnO3QnZ7ZQj7qr
         gm4A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id h8si986052ljj.3.2020.02.04.23.33.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Feb 2020 23:33:52 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 0157XpMr025726
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 08:33:51 +0100
Received: from [139.22.46.86] ([139.22.46.86])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0157XokV000733
	for <jailhouse-dev@googlegroups.com>; Wed, 5 Feb 2020 08:33:50 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
Subject: [PATCH] configs: arm/arm64: Fix vPCI IRQ assignment of Linux configs
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-ID: <af651e74-dc9b-fd9c-d81a-9a54b3f888ec@siemens.com>
Date: Wed, 5 Feb 2020 08:33:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

By moving the ivshmem devices for virtual network one slot up, we also
changed their IRQs. Adjust the irqchip configs accordingly.

Fixes: 68b8ff84ae8d ("configs/arm/bananapi-linux-demo.c")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

As usual, something always goes wrong when releasing. This time I missed
to test targets that didn't gain the second ivshmem device for demo 
purposes. Consequently, those had such a config regression.

 configs/arm/bananapi-linux-demo.c          | 2 +-
 configs/arm/jetson-tk1-linux-demo.c        | 2 +-
 configs/arm64/espressobin-linux-demo.c     | 2 +-
 configs/arm64/hikey-linux-demo.c           | 2 +-
 configs/arm64/jetson-tx1-linux-demo.c      | 2 +-
 configs/arm64/k3-am654-idk-linux-demo.c    | 2 +-
 configs/arm64/k3-j721e-evm-linux-demo.c    | 2 +-
 configs/arm64/macchiatobin-linux-demo.c    | 2 +-
 configs/arm64/ultra96-linux-demo.c         | 2 +-
 configs/arm64/zynqmp-zcu102-linux-demo-2.c | 2 +-
 configs/arm64/zynqmp-zcu102-linux-demo.c   | 2 +-
 11 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/configs/arm/bananapi-linux-demo.c b/configs/arm/bananapi-linux-demo.c
index 43c7ef36..9819091e 100644
--- a/configs/arm/bananapi-linux-demo.c
+++ b/configs/arm/bananapi-linux-demo.c
@@ -96,7 +96,7 @@ struct {
 			.address = 0x01c81000,
 			.pin_base = 32,
 			.pin_bitmap = {
-				1 << (52-32), 0, 0, 1 << (155-128),
+				1 << (52-32), 0, 0, 1 << (156-128),
 			},
 		},
 	},
diff --git a/configs/arm/jetson-tk1-linux-demo.c b/configs/arm/jetson-tk1-linux-demo.c
index 13a7c00e..52e11c1e 100644
--- a/configs/arm/jetson-tk1-linux-demo.c
+++ b/configs/arm/jetson-tk1-linux-demo.c
@@ -99,7 +99,7 @@ struct {
 			.address = 0x50041000,
 			.pin_base = 160,
 			.pin_bitmap = {
-				1 << (152+32 - 160),
+				1 << (153+32 - 160),
 			},
 		},
 	},
diff --git a/configs/arm64/espressobin-linux-demo.c b/configs/arm64/espressobin-linux-demo.c
index e94bc63f..c326b6d5 100644
--- a/configs/arm64/espressobin-linux-demo.c
+++ b/configs/arm64/espressobin-linux-demo.c
@@ -89,7 +89,7 @@ struct {
 				(1 << (43 - 32)) | (1 << (44 - 32)) | (1 << (45 - 32)),
 				0,
 				0,
-				(1 << (140 - 128))
+				(1 << (141 - 128))
 			},
 		},
 	},
diff --git a/configs/arm64/hikey-linux-demo.c b/configs/arm64/hikey-linux-demo.c
index aefc429d..cb6e101c 100644
--- a/configs/arm64/hikey-linux-demo.c
+++ b/configs/arm64/hikey-linux-demo.c
@@ -86,7 +86,7 @@ struct {
 			.address = 0xf6801000,
 			.pin_base = 32,
 			.pin_bitmap = {
-				0, 1 << (71 - 64), 0, 1 << (143 - 128)
+				0, 1 << (71 - 64), 0, 1 << (144 - 128)
 			},
 		},
 	},
diff --git a/configs/arm64/jetson-tx1-linux-demo.c b/configs/arm64/jetson-tx1-linux-demo.c
index a14f865b..c5f2d811 100644
--- a/configs/arm64/jetson-tx1-linux-demo.c
+++ b/configs/arm64/jetson-tx1-linux-demo.c
@@ -103,7 +103,7 @@ struct {
 			.address = 0x50041000,
 			.pin_base = 160,
 			.pin_bitmap = {
-				1 << (152+32 - 160),
+				1 << (153+32 - 160),
 			},
 		},
 	},
diff --git a/configs/arm64/k3-am654-idk-linux-demo.c b/configs/arm64/k3-am654-idk-linux-demo.c
index 02bd2b18..d03fd4cd 100644
--- a/configs/arm64/k3-am654-idk-linux-demo.c
+++ b/configs/arm64/k3-am654-idk-linux-demo.c
@@ -120,7 +120,7 @@ struct {
 			.address = 0x01800000,
 			.pin_base = 160,
 			.pin_bitmap = {
-			1 << (189 - 160), 0x0, 0x00, 0,
+			1 << (190 - 160), 0x0, 0x00, 0,
 			},
 		},
 		{
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 9a853e9a..f494b0cb 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -259,7 +259,7 @@ struct {
 	},
 
 	.pci_devices = {
-		/* 00:00.0 */ {
+		/* 00:01.0 */ {
 			.type = JAILHOUSE_PCI_TYPE_IVSHMEM,
 			.bdf = 1 << 3,
 			.bar_mask = JAILHOUSE_IVSHMEM_BAR_MASK_INTX,
diff --git a/configs/arm64/macchiatobin-linux-demo.c b/configs/arm64/macchiatobin-linux-demo.c
index f7675e8a..ad29bbd5 100644
--- a/configs/arm64/macchiatobin-linux-demo.c
+++ b/configs/arm64/macchiatobin-linux-demo.c
@@ -96,7 +96,7 @@ struct {
 			.pin_bitmap = {
 				(1 << (51 - 32)),
 				0,
-				(1 << (112 - 96)),
+				(1 << (113 - 96)),
 				0
 			},
 		},
diff --git a/configs/arm64/ultra96-linux-demo.c b/configs/arm64/ultra96-linux-demo.c
index 7054f5f0..102fa754 100644
--- a/configs/arm64/ultra96-linux-demo.c
+++ b/configs/arm64/ultra96-linux-demo.c
@@ -89,7 +89,7 @@ struct {
 				1 << (54 - 32),
 				0,
 				0,
-				(1 << (140 - 128)) | (1 << (142 - 128))
+				(1 << (141 - 128)) | (1 << (142 - 128))
 			},
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo-2.c b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
index 4fbd46a8..76ed8064 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo-2.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo-2.c
@@ -85,7 +85,7 @@ struct {
 				0,
 				0,
 				0,
-				(1 << (145 - 128)) | (1 << (146 - 128))
+				(1 << (146 - 128)) | (1 << (147 - 128))
 			},
 		},
 	},
diff --git a/configs/arm64/zynqmp-zcu102-linux-demo.c b/configs/arm64/zynqmp-zcu102-linux-demo.c
index c944fa56..32e38089 100644
--- a/configs/arm64/zynqmp-zcu102-linux-demo.c
+++ b/configs/arm64/zynqmp-zcu102-linux-demo.c
@@ -91,7 +91,7 @@ struct {
 				1 << (54 - 32),
 				0,
 				0,
-				(1 << (140 - 128)) | (1 << (142 - 128))
+				(1 << (141 - 128)) | (1 << (143 - 128))
 			},
 		},
 	},
-- 
2.16.4


-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/af651e74-dc9b-fd9c-d81a-9a54b3f888ec%40siemens.com.
