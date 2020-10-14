Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43d.google.com (mail-wr1-x43d.google.com [IPv6:2a00:1450:4864:20::43d])
	by mail.lfdr.de (Postfix) with ESMTPS id A8EBF28DB68
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:20 +0200 (CEST)
Received: by mail-wr1-x43d.google.com with SMTP id b6sf957135wrn.17
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664160; cv=pass;
        d=google.com; s=arc-20160816;
        b=DFgPv5An9Gm8oWgM6147BP74Ovygt35/yONuX3E0LeylGOepd2qGG1wlM262Rm5CA/
         BhhRTrK/+2J34j+L3lICGivPoHrdZHLjDzTE7JdO1V1gRStX0GP1XyJm+8XPbnic8XEq
         faJOXJmxKm/bnDFmRtiQAQo8BHqtrt/SfC/CgqyBljvvUrezj9aYpAB1wDgmIdwkLfRd
         oYoq20U8MDHouIlXH2mZps8L3bP0i08AIryr1RP1ULmpWVWG6eegHxqTh2mKDQb7TPy3
         SBvjkawoQHiMadwI6h1MGql/cwX55RutVYCwI+QvlOwMp8G7FbVRmu+pWD/YBs5E7/be
         R8rQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=WJI1pUCl7RwZdCJbawR4VkIlGJulLBX+w4UqlqaJhys=;
        b=ZfZ9WZPNzkWAaPdXBb4SA6N4YDz2yKusfcwkXntLlrU988AAUlCQ3ga6CPxjrAb0RF
         x9ITuEK3ShkTj0HhFWNWnUUkQOSJdKdLloIWzrlSMA1R8P2We33pda7aUQNR0wUjxI+P
         a8MMSTbRgXT3SHcsTkJLPQiCRpzrpLVUwSlM92GQQmd0vrj/RFKBdPVJnoCKnmBsP6L/
         HUoq6QqfGFj7Om3GSebe9YlmfB+QZh1f2o7v0wOI85qnN9n35sKx4errpD2UIiCTWYDB
         g9AcVzPbX+yFUFJVroDGOYXYUWZ2/bMTGHeNe4P6YhbdKpZ1c6TLXO0Uu1Gd1pjR8WnF
         TQxw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WJI1pUCl7RwZdCJbawR4VkIlGJulLBX+w4UqlqaJhys=;
        b=It1KtNx/S+5UlUqCQSZW25kWryTB8w90MaGZuUYVmkbSjke8uNn1/2HMKynMbfdT3r
         XTQU/tHPfRgGvqlqX/2qn9wmQwFFVZ0FspuTZASxGzjppVMkBdC1mtGHvO+WuVGjImwb
         rD0wuAeNBaDgQRBxrNf/VRXoYbRjAkEjSneNr3M7KUIkV6P1FMxwL7C9uNUkKC3FLgGa
         FOr/aZEELhG1YqZFCSDujaBe6Q4LNbBSHUE4vzTI3EKPbAjWLDRZiVHibaa4MKVCUFqZ
         RK433Irwr5Ap2vPJEJ3Nve0X1Xowez53iJgTII69kd+uY56tfImHDi3HnGjKEvt6uLRr
         oQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=WJI1pUCl7RwZdCJbawR4VkIlGJulLBX+w4UqlqaJhys=;
        b=VwiVNpH+sxzkYkA03GibDHQvKNuoCGbTkyNtDGQgTvmfc2LPw+GcQzJJLMi3uw6aNl
         6GNxT4jW5+Rbj77vIvBXlyjy23Gf57ay62G7fNeFZ9rMU6taxYwkEk0IcSBXbQnLtbeu
         24yV59nVZz9kc140IajGdwIjvltLEyezL4Xj/i0DNlN3VDt+KcJ1DeWmO9p+AjeOxEy6
         +U9IIJ4MiEjPmbZa3Ey2ykM2isC1Ac+OJ7DLv8pK5GnyzrIKmlKfg8hjFn8eSOer1FJ4
         Ru8d5Qa4BNS6fUIZiZhZhH1xGY2MaqKmFttEk60xiBZ513jFjxhzhBtOhU7Z9IKUWVCI
         nAkw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531BYSIPnaGpX9IG+4lvUq3LUDyTxgwcfBGqWnGXQhiZMeA40tnn
	FKaDwWQlxj2uXXwCb0XXW7k=
X-Google-Smtp-Source: ABdhPJzDdvpFwKtUQF/vkRG4W8QCtHJt0RGoZaxoY+e+E0ErSSmS/omA6h0us00BxD4b9SLBAgrQhg==
X-Received: by 2002:a5d:4d10:: with SMTP id z16mr4316475wrt.360.1602664160337;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:4e19:: with SMTP id g25ls750950wmh.2.gmail; Wed, 14 Oct
 2020 01:29:19 -0700 (PDT)
X-Received: by 2002:a05:600c:230a:: with SMTP id 10mr2303791wmo.151.1602664159176;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664159; cv=none;
        d=google.com; s=arc-20160816;
        b=OQt4XCrHXVJ3LSRxBBSFSiEOA/PYUogipQi8igJUBaAbhv3oyX1c2Y0RyM3YCvwURr
         5kzUuLINFzVPhYFZQzaQe+jUtl+TW+sYJ3xmzK4l1+PDxJHPfToaZUmylyt6c76gxkFJ
         2wdv/mkLOBAz8t6jCKAF2zMNDjyREPTRV3hrR6grPaNwRaMtU7bmrXRzVJZ2aP253yik
         knx4vHAKAnRFFsY1zlfC4YB0JKjFf4GsaHaN5VI9ByrYbEmAoK1A/VTqeD4NJBOT70Go
         x8LTgpEKTz0iw86tCRSm+/AKoEbGaYZUglZhCDcoehaPI3z6H9M+9wZNA8f1K35bvO3K
         GJ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=yGpZCIJeUWO05Jwi6YNmGHclpQFutST+Nt5efaxntp0=;
        b=GI/q8/1HaOr4qSsDC6l278w0VfWIgkh4CbP6mLf3X63A2N3iYOMDeMD5Mh921/kMNi
         3jTdJmm5/ybXJAKK3aW0lZQPGt6hBpHwyUKjvdmV01zBFg3UsB15x+npwYiAU66gEJx3
         VZK7PJ7fp29g2u8YJNx3Iq+U7IoXxo33BcF50LqKMjpLpn4ygVltZK9CB9qHUat2rW9v
         pi09zcZGT0M1u7Wt7nyvFKy//5pLObS23n5myz8hY2MlEPnYqMGp+TUybuUuZqvAAyf2
         wcac5mn80AAUHR5vOSV6KLn8NSWAxlIBdbuTjSLNU3WTyMAbZSChKQoD0R6pCr9B5Dv1
         IF5w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id j5si43621wro.2.2020.10.14.01.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TICM001666
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJK002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 34/46] arm64: smmu: Refactor ID0 evaluation
Date: Wed, 14 Oct 2020 10:28:58 +0200
Message-Id: <a0ada18cbe8a7bdf07ce51cc81b289b902064034.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

Use GET_FIELD where possible, drop pointless clearing of ID0_S1TS and
ID0_NTS.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 0fa48588..5073c705 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -47,21 +47,15 @@
 
 /* Identification registers */
 #define ARM_SMMU_GR0_ID0		0x20
-#define ARM_SMMU_GR0_ID1		0x24
-#define ARM_SMMU_GR0_ID2		0x28
-#define ARM_SMMU_GR0_ID7		0x3c
-#define ID0_S1TS			(1 << 30)
 #define ID0_S2TS			(1 << 29)
-#define ID0_NTS				(1 << 28)
 #define ID0_SMS				(1 << 27)
-#define ID0_PTFS_NO_AARCH32		(1 << 25)
-#define ID0_PTFS_NO_AARCH32S		(1 << 24)
 #define ID0_CTTW			(1 << 14)
-#define ID0_NUMSIDB_SHIFT		9
-#define ID0_NUMSIDB_MASK		0xf
-#define ID0_EXIDS			(1 << 8)
-#define ID0_NUMSMRG_SHIFT		0
-#define ID0_NUMSMRG_MASK		0xff
+#define ID0_NUMSIDB(id)			GET_FIELD(id, 12, 9)
+#define ID0_NUMSMRG(id)			GET_FIELD(id, 7, 0)
+
+#define ARM_SMMU_GR0_ID1		0x24
+#define ARM_SMMU_GR0_ID2		0x28
+#define ARM_SMMU_GR0_ID7		0x3c
 
 #define ID1_PAGESIZE			(1 << 31)
 #define ID1_NUMPAGENDXB_SHIFT		28
@@ -396,16 +390,13 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 	/* ID0 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID0);
 
-	/* Only stage 2 translation is supported */
-	id &= ~(ID0_S1TS | ID0_NTS);
-
 	if (!(id & ID0_S2TS))
 		return trace_error(-EIO);
 
-	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
+	size = 1 << ID0_NUMSIDB(id);
 
 	if (id & ID0_SMS) {
-		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
+		size = ID0_NUMSMRG(id);
 		if (size == 0)
 			return trace_error(-ENODEV);
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a0ada18cbe8a7bdf07ce51cc81b289b902064034.1602664150.git.jan.kiszka%40siemens.com.
