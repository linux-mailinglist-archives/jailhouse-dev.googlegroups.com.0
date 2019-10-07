Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7XX5PWAKGQE3FUEVZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id B09D5CDDA4
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Oct 2019 10:49:02 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id f3sf7167387wrr.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570438142; cv=pass;
        d=google.com; s=arc-20160816;
        b=IOMM74IpSgv1D7w4OSL3w9UqLiTGhBNOvi1kd824gAeDiR3SBfxnFZ9HSACmdVvP0p
         BZXyu2PsVGkc1BxTpRT2wfkzlynEgyyzL5zBPVBZnNuPF6FvCyOXspO5/gVpv0rGDDC3
         l54kXhcebbb9fGJeXreGdGH20WRlKV1W6/aHsEWh0u7rUSCf/otd9ASU26hdw4FeQ2Jd
         Qk8W6SB5WfAwOffo7PLVu4j7kcIBLq4mG0HMj7qILXRzJnwtRCnPq8/MaAe9ZgUGwJjq
         MeXN/T3foC5PH+pJtGSb7S9XTDiQOuscerF+qxwNLQlXoMfRcmba75Im2ja2wPjekK8N
         S05Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=IYJxxubZuFoPQU+XJ1FtcxLpjEYdI6+waDY6uo/kXB0=;
        b=fImA2vKShATra7udG2tLSZp0zLM+leU5Ov9VZ/tu4V4Ub6vl6MZOSn8eg8W82GL5y2
         mLTCol5XZfjc5fQCCBFxotA9P0hT0v3DSLPtR7CFJJEPBhLOLnJbWelFiqDcZ75y5oQt
         UE+AhbVxQsvbzXVL2NxuPpEouWZuaKCN9zRpbQx5OnafvLsxTFqp2B1ZYJHBlNtmeGtX
         0jYhtXxxgIrtrClezdEW30r4ynBKn5/LMELzMdM5PjtI6Sh9Du1GqvDHEEX6gug+F4n7
         /8zJRVXmYcP4miFWarx/C8IqH/df7SQnsbvhAH+II68Cin/o1hip8VIzUs+fHDoJwj/T
         Wc7Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=IYJxxubZuFoPQU+XJ1FtcxLpjEYdI6+waDY6uo/kXB0=;
        b=IB9vn7GvBimhOEFzrDeueJW/W7jdccR0lrXJVzOHEVpwnRo1DbvDTMDrzUfJ7tpNJa
         +sxqIZW7g45O6iQLySkkAyUlWKUSUpPT1BFrlag1fqH2dgNGn7IM60pQRSxLeNXTkwxk
         OLxnp3dra7dtK9+BuW1lphHgUvLOWK+/1RbiLH0C8xtmj5uArNvumDY7YJcGSXp9rz3v
         zrAF1PwX6efjh7jtUgGhsw/8Qjliw47koROuG7WMyPirCnqNFj+XFHQ1ZUfofB8og8xM
         E4u7W5WR1h8pCAScq/nT2Vjqz/yM2TxgnlDXOFTn7yaYBXlXz/HMzuVWskujGit6ROa+
         Ci4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=IYJxxubZuFoPQU+XJ1FtcxLpjEYdI6+waDY6uo/kXB0=;
        b=sV8YUGu20oMX602g101BDmQkKLTgtkhYkEFpZxcqWMjASg8STd77f4kERCBf0xwTCT
         CX+xF6jaHG3BOINrDEXqKkkOT+Zzd5MFiRKAZeAZ2dVjQKQXj47kM84w8waoZC0S8B1R
         A4vM6dwdy33dZ4xjOXEYvSC96WI/c8O5jBUeELgywJbbkRaT7ckQi28uvo0xmUALV/Mt
         WzM6Tpp5FBWHq5LVm2xXpi/rYaDb4uB2al1eRvTwlA1H+iA7itnGEjMwGPKcfzICYasz
         hhffk0I1GUbnC8FoV2OBTXX4S6HdsIk7/42tuxX3DRlQu3g6vqqDLq3xa+FjJniwPcTV
         pVDg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU8O+wvVa3VELTrjNeUaoLPQ8Fu5h6LTh3GRF2Gc9DGy0DHXq9D
	YussmzN0u9FAuplRvPVZaRk=
X-Google-Smtp-Source: APXvYqzcBYt8Lne0nBVAgJ/r3B4Y+iSZg9RwwBQRk+rt9eM4+ruZJY+T03WcsOuSM3pp34cGKD8wmQ==
X-Received: by 2002:a1c:3803:: with SMTP id f3mr21145839wma.161.1570438142359;
        Mon, 07 Oct 2019 01:49:02 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:54cc:: with SMTP id x12ls4128574wrv.0.gmail; Mon, 07 Oct
 2019 01:49:01 -0700 (PDT)
X-Received: by 2002:a5d:67cc:: with SMTP id n12mr20363960wrw.359.1570438141527;
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570438141; cv=none;
        d=google.com; s=arc-20160816;
        b=a7pERIkTh/Sq1x8QhuX3zmVY8dVtLvwY8knJfLgOJl6q6xABGkz6O2brvqCgwjEtVD
         XyTky8+efwp1UGSh27hN3PXo42WOE67aDQ//l+46eGQWhnxl8G1Qaj6Bbmva/3X9emHO
         +ugIH4GnzQ7RSLUBY1z7+WbLzTLad3KHgBuz67Dj197SZE31bWp58kAkx76MB/JiibPp
         G9kq7C09XJ9YtyCvtRB6bwpFgR8+ahnBgW50nxxTFQwKeZQtDNTqJDSgvyr7szxTbk2a
         h+/yzryI/fIt6owABqvqqfz0Ex8eitTws439Yr71tLL/zkChZucijxvPIe4CSGp0Gp0r
         zOcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=references:in-reply-to:references:in-reply-to:message-id:date
         :subject:to:from;
        bh=5X3wbHsFusoyLzjWRCj4vfp7E2zU1VEnM8Zx1VxGz64=;
        b=haf2MMHpcz1sO6Vbtzy7m2PL6rZNGs1xlk7bYkEzSEfI6HOWuBKI/x3oil5CoV1HS/
         x2dLyG0iyoXnMVJgEmL7spRmELfkYiXSzj+A4gYRlH2OfRnEOs1tD/8POrp0BNrk0ngj
         H9WIv406kP+XuVFSHwuN/An1k2g90GuZMsz61wwP+MCRJDOCDT/SjXZj+LbG6i+cu1l1
         XZuYc4xRYgrFX8YAYUWosy1UuWcD7F3NNNeUL/NIcCg3bydpKSVHCUN+ZCz1Nuowrc5p
         EtVVou69hhydV0u/HRKKPyVCpp9/Lj3LBRDXQ4ZuKW/7pGsjwIEpqmQU0OO4++o/B1y9
         7SkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id n16si1360236wrs.4.2019.10.07.01.49.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 01:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x978n1FJ028612
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:01 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.32.114])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x978n01X011472
	for <jailhouse-dev@googlegroups.com>; Mon, 7 Oct 2019 10:49:01 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 2/2] x86: apic: Make defines for masks and bits easier to validate
Date: Mon,  7 Oct 2019 10:48:59 +0200
Message-Id: <8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4.1570438139.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1570438139.git.jan.kiszka@siemens.com>
References: <cover.1570438139.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1570438139.git.jan.kiszka@siemens.com>
References: <cover.1570438139.git.jan.kiszka@siemens.com>
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

No functional changes.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/include/asm/apic.h | 60 +++++++++++++++++-----------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/hypervisor/arch/x86/include/asm/apic.h b/hypervisor/arch/x86/include/asm/apic.h
index 69a1fb8a..86cd0a9f 100644
--- a/hypervisor/arch/x86/include/asm/apic.h
+++ b/hypervisor/arch/x86/include/asm/apic.h
@@ -51,42 +51,42 @@
 #define APIC_REG_XLVT3			0x53
 
 #define APIC_EOI_ACK			0
-#define APIC_SVR_ENABLE_APIC		0x00000100
-#define APIC_ICR_VECTOR_MASK		0x000000ff
-#define APIC_ICR_DLVR_MASK		0x00000700
+#define APIC_SVR_ENABLE_APIC		(1 << 8)
+#define APIC_ICR_VECTOR_MASK		BIT_MASK(7, 0)
+#define APIC_ICR_DLVR_MASK		BIT_MASK(10, 8)
 #define APIC_ICR_DLVR_SHIFT		8
-#define  APIC_ICR_DLVR_FIXED		0x00000000
-#define  APIC_ICR_DLVR_LOWPRI		0x00000100
-#define  APIC_ICR_DLVR_SMI		0x00000200
-#define  APIC_ICR_DLVR_NMI		0x00000400
-#define  APIC_ICR_DLVR_INIT		0x00000500
-#define  APIC_ICR_DLVR_SIPI		0x00000600
-#define APIC_ICR_DEST_PHYSICAL		0x00000000
-#define APIC_ICR_DEST_LOGICAL		0x00000800
-#define APIC_ICR_DS_PENDING		0x00001000
-#define APIC_ICR_LVTM_MASK		0x0000c000
-#define  APIC_ICR_LV_DEASSERT		0x00000000
-#define  APIC_ICR_LV_ASSERT		0x00004000
-#define  APIC_ICR_TM_EDGE		0x00000000
-#define  APIC_ICR_TM_LEVEL		0x00008000
-#define APIC_ICR_SH_MASK		0x000c0000
-#define  APIC_ICR_SH_NONE		0x00000000
-#define  APIC_ICR_SH_SELF		0x00040000
-#define  APIC_ICR_SH_ALL		0x00080000
-#define  APIC_ICR_SH_ALLOTHER		0x000c0000
-
-#define APIC_LVT_DLVR_MASK		0x00000700
-#define  APIC_LVT_DLVR_FIXED		0x00000000
-#define  APIC_LVT_DLVR_NMI		0x00000400
-#define APIC_LVT_MASKED			0x00010000
+#define  APIC_ICR_DLVR_FIXED		(0b000 << APIC_ICR_DLVR_SHIFT)
+#define  APIC_ICR_DLVR_LOWPRI		(0b001 << APIC_ICR_DLVR_SHIFT)
+#define  APIC_ICR_DLVR_SMI		(0b010 << APIC_ICR_DLVR_SHIFT)
+#define  APIC_ICR_DLVR_NMI		(0b100 << APIC_ICR_DLVR_SHIFT)
+#define  APIC_ICR_DLVR_INIT		(0b101 << APIC_ICR_DLVR_SHIFT)
+#define  APIC_ICR_DLVR_SIPI		(0b110 << APIC_ICR_DLVR_SHIFT)
+#define APIC_ICR_DEST_PHYSICAL		(0 << 11)
+#define APIC_ICR_DEST_LOGICAL		(1 << 11)
+#define APIC_ICR_DS_PENDING		(1 << 12)
+#define APIC_ICR_LVTM_MASK		BIT_MASK(15, 14)
+#define  APIC_ICR_LV_DEASSERT		(0 << 14)
+#define  APIC_ICR_LV_ASSERT		(1 << 14)
+#define  APIC_ICR_TM_EDGE		(0 << 15)
+#define  APIC_ICR_TM_LEVEL		(1 << 15)
+#define APIC_ICR_SH_MASK		BIT_MASK(19, 18)
+#define  APIC_ICR_SH_NONE		(0b00 << 18)
+#define  APIC_ICR_SH_SELF		(0b01 << 18)
+#define  APIC_ICR_SH_ALL		(0b10 << 18)
+#define  APIC_ICR_SH_ALLOTHER		(0b11 << 18)
+
+#define APIC_LVT_DLVR_MASK		BIT_MASK(10, 8)
+#define  APIC_LVT_DLVR_FIXED		(0b000 << 8)
+#define  APIC_LVT_DLVR_NMI		(0b100 << 8)
+#define APIC_LVT_MASKED			(1 << 16)
 
 #define APIC_LVR_EAS			(1 << 31)
 
-#define XAPIC_DEST_MASK			0xff000000
+#define XAPIC_DEST_MASK			BIT_MASK(31, 24)
 #define XAPIC_DEST_SHIFT		24
 
-#define X2APIC_DEST_LOGICAL_ID_MASK	0x0000ffff
-#define X2APIC_DEST_CLUSTER_ID_MASK	0xffff0000
+#define X2APIC_DEST_LOGICAL_ID_MASK	BIT_MASK(15, 0)
+#define X2APIC_DEST_CLUSTER_ID_MASK	BIT_MASK(31, 16)
 #define X2APIC_DEST_CLUSTER_ID_SHIFT	16
 
 #define X2APIC_CLUSTER_ID_SHIFT		4
-- 
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/8ff311b9a5a65beed46c6d00a0b5c46b9ed6beb4.1570438139.git.jan.kiszka%40siemens.com.
