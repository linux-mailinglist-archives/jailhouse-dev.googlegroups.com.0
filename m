Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHNTL6AKGQE3XPJOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id DB09928DB57
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:16 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id q15sf971739wrw.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664156; cv=pass;
        d=google.com; s=arc-20160816;
        b=KPEYq8gk3I7KAaKsMO0SXKIsO9d6tk90sfo4D5aYAVHbgCa7b/SNWCThmiC2iPCeW4
         LTZtnzvw67v4y2Ftlu9s6Uc8wXATZa+0rJmkE+tWLI0wBaeztzMs/og6kceVeyHacRf4
         wVwRUCFqi6zYpO+MTicKj4bZWP890hzV82/NWH6jwrEtCW0II8KJX5CngNu7f+Hfkcrq
         cQXv+3YwdY/GjwEOewdqi5w4X8bcuZOpQBD/4wAOfuPkwaB8cGVn3mdSvZ8I9R1fW8kU
         DAsFmNUEwlMJG9zXyvUtVP1n2jCK149bDfpxLAWCBxtAv2xxgT246QJGUPdESrR/iIdF
         qaGg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=2Fgz1/UllvKv69LAAM8SZddfmJKXkCAUY3afoedem+s=;
        b=H3QFg7egEMscWZuNp18tcukurbAAeYaR+4ppcB1c2CUwpuzsgbSJVK7qzMKe2khYhS
         xrZcdOmgCvTRLI82QIjsAs50Rh3SlHih4HlnUnJVMES8Jj3mi89eF7q6agkL3apC5KGM
         Y84qaujs9vpJsaNME+XmYghH5KCVW9ocQAwb5gKgA3XEfdiECJOO0zuaT6hM6+XXrKHL
         yR8/rUsN1q8pwUa0CXEew6JxRvBmhMjCjb6qDqThgHZvrVDfiOrdKKsEOvoBVogzPliV
         GrOjJPUJW24wvHJTjsYmUGvbq5qyN89HbJH4g0xlXoPnquylCZpi7GCM+vsI8QtJslIP
         1NRA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2Fgz1/UllvKv69LAAM8SZddfmJKXkCAUY3afoedem+s=;
        b=WiViq0Wb1ZeodvlHvZ7hvKzEdBcN/g/dtHG6eDC1TV1ZmC1DXvttOMIY1Fgd8nAy5K
         v8ILTUOyhp+XsEN5eqovsyiyYf4zBc2Ws9yGbmtDbgj+Y7Tgd7M9cKRMQ+Kvm0AEJfDP
         u/pD2428BttAvQxEqCMWYvDUcoxfWQfSdol31NzVkIyJj5ElaxzG/tDThJRUv9xI3b6b
         c8TXDVxBRkykZnVb7akwU7YBrps5shKOKMFQLP2p0bN6a5MhsQXRxZIbmsF3dWepc48C
         MynbpZnNiyNNbImelb5LqZ3N4TQ/OfatuMlM4k1nE3X0fiVfyvF9cBM0DPXzKSRH2rmh
         vhWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=2Fgz1/UllvKv69LAAM8SZddfmJKXkCAUY3afoedem+s=;
        b=U0OhGwWiNWMoztzkoKSzwfDOU0aHhuo6RhB9k5G/eWU4/ik8xh+m1UWCceWaZSXCbU
         /SOYyQFv5ivwOqjb+Q0ZxreNs1n8jZwveU/zagZI/p+H6AldAQgAbR04FUxKgpaTAzlV
         /a5/CgriizA1OscSHOg3ZvKFYi2oTX0nvq4JOtJnw14qfOQ4H73lgrxz2n4XI/03TyE1
         jWup1gN68Us2dQY0TK6Ds6YSoplDW10pWh8qzbIPJzcX7Gt+9EcwCSUyX7nXaB6BRDyl
         PviqEgTeLKVjvjuiXY9GvkMzgVbvCLEHvc+BmL1PF00+BYB2ZwlhVAHzhb7sG5yk/hbx
         QZdg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531pKFKnLWzyBdD3+iIyTLv10JrcmaqrFCFgAOOxfuyIogVdCR87
	HLqAtRZu1dvjAuC2pMcxr9w=
X-Google-Smtp-Source: ABdhPJwo9ihCTkG5ir/r19UV08eW8+cV0CtPapszMNoxepv218xXup0uhUrGClxsCa0+LOcNwybLOw==
X-Received: by 2002:a5d:46c1:: with SMTP id g1mr4281684wrs.101.1602664156598;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:cbc4:: with SMTP id n4ls746465wmi.3.gmail; Wed, 14 Oct
 2020 01:29:15 -0700 (PDT)
X-Received: by 2002:a1c:7214:: with SMTP id n20mr2257939wmc.93.1602664155650;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664155; cv=none;
        d=google.com; s=arc-20160816;
        b=BiNb1P8j7DVCEocPZ+VRLw/X/i3R62QngvQpJgh9glUkzDOi76sNOzaNd6uZhlK9yc
         XnN6iyAguMNaPPYEb8UNnqC5HMMxzuKIejAbMrq9V6y7TRya8CbDa8yk6nzdsVpz7OLg
         wzXCmvG59MDhEJMJgpU5oKLKVUS1nIPP7XOAfb3F8nhppcP/cv/MBB+opN6YN8ktQQUM
         jC3KKd7DU9tlnDYWSJbGBx1hfIiKHy9FafB8MIywvEB7zpiR33IK3+AFTKgKIL5rLmIp
         Vf2MZG3xPPeI7OPaZRTwBYRZIQp7buuccNxDYxl3Xo9zp/eyEfIBSspjDxtjhAamgS4a
         Ttbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hyx64XGrCyMzUt5JkFw6NK4Zo/cdEZuY8eiqBGElCcE=;
        b=KhmXX3wAEXw2M9299xVqMWsiyPEyOoDBJlI+v8iqOQTsviweWJePkdyN8JDeZFopOb
         +M+nKVfZgZH7vOYyBAPxWJ58Sjj3yBqs6uzJ1j8/lx3dd1rZp8RxaQ69kRznmMrTTqQS
         vIs0vX4zzKf3DaSNrqJZuynJCZCsHf8GeWI4HlKTIotEQKJrF0QkxMua5AqG4OTEJaOR
         ahRvDdLZHaWDULelxlCtKiTV8ocgUreUhsf+yPuoKacBgloA3aY8Ox6l2p4Y2dDxqFBS
         1emfrMQHkbuL2DzEEORQ3jyXSucxFoukyDTyxxg1xnA0/GwNzYfSoy/QBKPepJ7XMzHK
         mFnw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 14si45371wmf.4.2020.10.14.01.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TFNd031217
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ4002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 18/46] arm64: smmu: Do not stall failing context transaction
Date: Wed, 14 Oct 2020 10:28:42 +0200
Message-Id: <aa93d7ee77e711b3b44135a0adfd9d3bdea9d619.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

We do not handle faults, e.g. by resuming them later on. Stalling
failed transactions will soon lead to a stalled SMMU, blocking even
valid transactions.

This could easily be reproduced by stealing a used StreamID from the
root cell. On the Zynqmp, this lead to all transactions of the root cell
to be blocked.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 349cd0fc..d63f91cc 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -177,7 +177,6 @@
 #define ARM_SMMU_CB_CONTEXTIDR		0x34
 #define ARM_SMMU_CB_FSR			0x58
 
-#define SCTLR_CFCFG			(1 << 7)
 #define SCTLR_CFIE			(1 << 6)
 #define SCTLR_CFRE			(1 << 5)
 #define SCTLR_AFE			(1 << 2)
@@ -457,10 +456,8 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	}
 
 	/* SCTLR */
-	reg = SCTLR_CFCFG | SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE |
-		SCTLR_M;
-
-	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR, reg);
+	mmio_write32(cb_base + ARM_SMMU_CB_SCTLR,
+		     SCTLR_CFIE | SCTLR_CFRE | SCTLR_AFE | SCTLR_TRE | SCTLR_M);
 }
 
 static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/aa93d7ee77e711b3b44135a0adfd9d3bdea9d619.1602664150.git.jan.kiszka%40siemens.com.
