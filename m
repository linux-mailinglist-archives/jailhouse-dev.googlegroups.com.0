Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBQVM7D3AKGQENYS4IAY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oi1-x23e.google.com (mail-oi1-x23e.google.com [IPv6:2607:f8b0:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DAB1F16E4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:15 +0200 (CEST)
Received: by mail-oi1-x23e.google.com with SMTP id n184sf5433720oih.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612994; cv=pass;
        d=google.com; s=arc-20160816;
        b=AdswZL8iTbsSW6AQNwHnu5VF1ENgaZdcBH7hs5k2rkKIyC6ViLopIGqvLUqHGUTz9Q
         DI9Yd84T+9pcmbYJLKNs5KgLFvRTNzmH4Wb1tpLEEhen8zP6jSN8GwK2bziniolHiKLM
         rgvRg0heTakan/+DInnSN/vcn9R3cLeB7xte8nM+/uXc/AeDusdFIhgvCGk0jCKqwvdh
         7Ppvpx/ttG6wfC0UCKTjFDBuuQvuo0/wd53gGesAmtJM2RyhsEogSpFp4+UPzcoeOWJS
         f9525FeKyulrWJk32B0RrfVefjOY5ck4Uk2o9p92X5c5OPJci3JIHBiT9dvmiFfQoglQ
         XGXg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=u9Hfq98QQKKWbTUUDSiGVNHJ+f+GUt4bXiIe/1lL438=;
        b=rE66x8D07D7fNh4SKE291I4/1zmWCV4fdq/ulKnDa4vM5RcZVpF6n8I/t4+oDK8+Gj
         AFguXIIBF5rge+nhnu24v+2ynnKIhIENyuGi+IpfrZfmXGq97OlxhN+G3jN0EpTsBcWD
         mMqDdsAOeE23hnTf9xjMq4khBcvBVSMXyNMdAOfgaMfVH4WXqCO2/fyVFILgATkJdzzm
         w5sfeOERzNF02+DtN1T0wdVczJ0kH2uOYSye2q5wm2rJzB1QhH7qUgoQ6m5PtVXUIGFk
         IX4doyqZDpNEcE1FBXAfFJbJhQTpsoRZePD5jYfZBgBZMv+zq5LQbdMoM56kXilCt2VS
         oiXQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="lLE/mOhS";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=u9Hfq98QQKKWbTUUDSiGVNHJ+f+GUt4bXiIe/1lL438=;
        b=cNOASoiplTdvx5PR5dMGJS8C2Pu8hgvSdiBbTcsOPSb+XuPIZbZuzrjiAHCIgjn/CD
         hWkbxLuJAhuM6fbbjixM1lnIRV+ETTNieGYcPocXWzz3/hYNEKtPKwEj+03HE6G+1VnJ
         H3Jp67U0UM9ANIM3VkNDeRgHghx6Yt/GdgnpUFhVBId1M3RyNQNeay5ChDfo48B/1hJP
         OGR79PEHR271ZzsMzxKhEryEwBqKyWGF05VBMtDMaTRtbBvqozEXXyqw8xUc4nJA5BLx
         XREqbJOj8w08WWIonUAjufanGPFHpWZuU7Vo95IXKKJjyWTgvjG4CfOranMafosn7UYA
         WgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=u9Hfq98QQKKWbTUUDSiGVNHJ+f+GUt4bXiIe/1lL438=;
        b=eIrwr26lBZxIoawAxf33yfdU6deMKqpMfv8pVB8EUHX/3XbQNw63uHjx5KpeiV4BSn
         hm92Ji1EjVW0GdGDG7TUp4xY1S6ZXl0n+cItPFQ5VL1D5PZ7ylfL5hFVq+HM5LEGDg0z
         ZrphIjV4wb8yQCKvyVjiB99dMWu+yENDUhNRwk2LKOKbqbHRA6hyxmvNv3PSXrCkBzaK
         EGYPbAi5uzMHOcqVbSFmUt39G1AVzFd2GRG59UMftL5yQeaR6p6r1382ziKh1gcT/qQ+
         wBWPmBqNhNM/KbWO4TyHAFonLqN39GLr/p/tLQt/TaOtaQbiQfH9VL8hrtCpbM2wY7GU
         mAUw==
X-Gm-Message-State: AOAM5335l5NZK9xCMjHS3t6XTEo33Ts7BhHoIBs+dL6aJYgL3Nxjj6H4
	0o9BKEX6n/O9RsLBzKKj01k=
X-Google-Smtp-Source: ABdhPJwqxWxssdJUO9trCKKP2fa0LN9iFJ26eQuSpGLFrJHOLalBPY2UJX3kpoZcUe7jk3j4u/M55A==
X-Received: by 2002:a05:6830:15c4:: with SMTP id j4mr3586076otr.4.1591612994250;
        Mon, 08 Jun 2020 03:43:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aca:5788:: with SMTP id l130ls3050025oib.2.gmail; Mon, 08
 Jun 2020 03:43:13 -0700 (PDT)
X-Received: by 2002:aca:accd:: with SMTP id v196mr10106951oie.135.1591612993835;
        Mon, 08 Jun 2020 03:43:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612993; cv=none;
        d=google.com; s=arc-20160816;
        b=gaLp/f1Kr5UqYAyBABFTuAj74Nlzf7MN0uGAQ+oSZO9uvB0j253MhYNRLUatlg/NLW
         HkqXt1zlHxzwe0lCBVFN9zkWza4hnN3oHv2K4y6snsxuPmcy+CIIOP+L7QLBQ0/6rHVc
         aYvxDt8iIS5XTJ+pCYX4Xcd8iV2hLJTw+LLyElwW6PUNV2YDOKkkdMb1X5K+BCb7McI6
         kBlkUh3lDFhfgW+G/i2iUTNy1t2oICtsG6baDfOtlKeG7ZmIhoqz5dugc5pALCVQCAx5
         FNqWuBuMj7DyeGC0AX5uH3MBOINo55OhXyB/jEOA4y8iQQGgg6I9PnWymOKGt4aO1/Bc
         w6Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PiJMX2QGw0eLakWAEeD1DNx2gyy+BCwB3dBYkbFTCwE=;
        b=FWSscQsx+XLARPE+9+nheeTOcpKZo6gxe1p2Wl9lv2+5+UfPl68BZk7m03uq7ZJR7G
         qxBHwjz/9bcR0BxEJzvInbM9XmTI5VFLGh3a2uQco1td6kFsrBXRlpyr/q92JJRL3yZb
         EQxM4nNrb3/Zy1UoZLWVQwyu8sStPkHfEhMB8KoDNqG3pkPEEPppUeDSMHGCvERgEFLQ
         HZk6Y+qDLUIj1IricbhWoyJ9B1iXTq3TPdyDGKa92wuOP/X7FCf/9v/F7CK6qSS+zSmJ
         8ev1TKwU/yfL/fhjD7dHs9Nc8nNBai/8PvRhKDOPmXatHfbCBXJaGq2JiQ/xsk77Dhf2
         Tfkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b="lLE/mOhS";
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id d2si658589oig.4.2020.06.08.03.43.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058AhDBp041592;
	Mon, 8 Jun 2020 05:43:13 -0500
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058AhDZ4047243
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:13 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:13 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:13 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058AguhA012229;
	Mon, 8 Jun 2020 05:43:12 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 9/9] configs: k3-j721e-evm: Fix memory overlaps
Date: Mon, 8 Jun 2020 16:12:55 +0530
Message-ID: <20200608104255.18358-10-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b="lLE/mOhS";       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

Fix errors reported by jailhouse-config-check
Fix overlap of baremetal demos with IVSHMEM.
Remove regions of memory which is already covered as part of
some other memory region.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-inmate-demo.c |  4 +--
 configs/arm64/k3-j721e-evm-linux-demo.c  |  4 +--
 configs/arm64/k3-j721e-evm.c             | 31 ++++--------------------
 3 files changed, 9 insertions(+), 30 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-inmate-demo.c b/configs/arm64/k3-j721e-evm-inmate-demo.c
index 39c6c414..b070e643 100644
--- a/configs/arm64/k3-j721e-evm-inmate-demo.c
+++ b/configs/arm64/k3-j721e-evm-inmate-demo.c
@@ -86,9 +86,9 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* RAM */ {
-			.phys_start = 0x89ff00000,
+			.phys_start = 0x89ff40000,
 			.virt_start = 0,
-			.size = 0x00010000,
+			.size = 0x000c0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 05517751..02b0a248 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -163,9 +163,9 @@ struct {
 				JAILHOUSE_MEM_IO,
 		},
 		/* linux-loader space */ {
-			.phys_start = 0x89ff00000,
+			.phys_start = 0x89ff40000,
 			.virt_start = 0x0,
-			.size = 0x10000,	/* 64KB */
+			.size = 0xc0000,	/* 64KB */
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
diff --git a/configs/arm64/k3-j721e-evm.c b/configs/arm64/k3-j721e-evm.c
index 41f4c456..971aac22 100644
--- a/configs/arm64/k3-j721e-evm.c
+++ b/configs/arm64/k3-j721e-evm.c
@@ -152,20 +152,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* usbss0 */ {
-			.phys_start = 0x06000000,
-			.virt_start = 0x06000000,
-			.size = 0x00400000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* usbss1 */ {
-			.phys_start = 0x06400000,
-			.virt_start = 0x06400000,
-			.size = 0x00400000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* Most peripherals */ {
 			.phys_start = 0x01000000,
 			.virt_start = 0x01000000,
@@ -222,13 +208,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* MSMC SRAM */ {
-			.phys_start = 0x4E20000000,
-			.virt_start = 0x4E20000000,
-			.size = 0x00080000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_DMA,
-		},
 
 		/* MCU NAVSS */ {
 			.phys_start = 0x28380000,
@@ -275,7 +254,7 @@ struct {
 		/* MCU WKUP peripheral window */ {
 			.phys_start = 0x42040000,
 			.virt_start = 0x42040000,
-			.size = 0x03ac3000,
+			.size = 0x030c0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
@@ -338,10 +317,10 @@ struct {
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
 				JAILHOUSE_MEM_LOADABLE,
 		},
-		/* RAM - reserved for ivshmem and baremetal apps */ {
-			.phys_start = 0x89fe00000,
-			.virt_start = 0x89fe00000,
-			.size = 0x200000,
+		/* RAM - reserved for baremetal apps */ {
+			.phys_start = 0x89ff40000,
+			.virt_start = 0x89ff40000,
+			.size = 0xc0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
 		},
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-10-nikhil.nd%40ti.com.
