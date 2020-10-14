Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBX7NTL6AKGQEG7YJ2EQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13a.google.com (mail-lf1-x13a.google.com [IPv6:2a00:1450:4864:20::13a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EDA228DB67
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:20 +0200 (CEST)
Received: by mail-lf1-x13a.google.com with SMTP id f28sf290617lfq.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664160; cv=pass;
        d=google.com; s=arc-20160816;
        b=LzGKWsP/yTgQeybXEyOWQ0vtlWZM3RGvNYx3DZLeRXKTHN6d4xRDmrrmaI/BMOemNb
         G7IjJTfM8XHn5e/F8vcBOc1XyZgaLvdFFuClFYKOAv88x8RbAJi6aFTR4az5yMYqT1pP
         WVW7mh6VWOp9a6RACW9nVl3PcOAdKqxKY09VKi+LPD5l8gHUEKMiS/dUSgMFSLjskHbf
         0IU2bVz+AHNe3IVhMkxW5AGEAXTGbpPhFbHNOywBgnoa4CfrSQX8VzHFp4ZoJLeER4L+
         94cDFLOceOjf8djvRPkMREqcVtsi3pNOHJNb8QJE1e17M6ZAa5lLlYIAF7kXUgVsNn1L
         BYnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=IMnBBGsiAr/UKMMTfHtYMuDjHavym0aTkR8k2EdOSDw=;
        b=DG2SpBuumQX6e0q+McbZtZ71mAN+5eYJ6nWJs2h3DvNVAay0Gtyrp/lzr8o5yZN/NH
         daNV+rYcgUlXIA1o0nc3AorhTo8uDoYPgshu3AUYQLPhMSbzpFtgVHhkQ8aRBtxzE9bx
         Z0uLozXDDpec2NGp21evBvSdtig9Fen9zpXeCMQMoeTTmwCS0yIqivuUKl94OSJ3luC3
         k3svistATSah9MMdImcEcM3uVvBr63kTYGZBFCbzWcFrNO9qutp2JO7+FAZYEbsW203B
         lPpcHulXxIFDQnJHekq9pXajklnCHngip+ViMw/KB9Z8R1IWWy1b3BiYh3MIXeTcsNgf
         O4fg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IMnBBGsiAr/UKMMTfHtYMuDjHavym0aTkR8k2EdOSDw=;
        b=DwiIWcbJYubVys/dxf3zCoc86GacragJeuPFy2alL12/tBuQ2B4ab5EtrkNby2I7UM
         6ipgrq/Pd0CcY7C3ou3/dUKX2XKbMh3VvMZJpDkBydL43mIJ5KU8b2s1HraANv1gGKWv
         oloXp64MWNualgp9wddg9n3Wzx8/q6dmW7TGva1XMiux9WyQuozZ0qtIPyKy3xzo3FJQ
         /fa3as3XRryWssPXg2Bcng3adk7mgJu3o8aeiwMZBRjZUc5gbiV1F7+r5QR9Q0HMTUsR
         ZFCZSRvAWC7F2CAKTvDnts4xtFNbNpT1nCv/VE9hT36/tbvi2Hsn48YjlPozIHH8C6DP
         n3Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=IMnBBGsiAr/UKMMTfHtYMuDjHavym0aTkR8k2EdOSDw=;
        b=ppWSHLskr6UEV7FgxzQDpyz467X0P+xMl/tOkw1mLzS3ZxgQ/gON5QcmgkYAXvfObn
         3hETFh/5ypu4/8hItRdc0GpEc5aUqn1hVxKPjASyUm/eYUOpoyjfJxqGqIP8nNH4onha
         SXYsapYKCaD+oSY6cx0YULWxEXq+nm36cR8P/dMHdKKLazPT3G2NeNBxKfB3hycOe7xi
         YBwrCWO0inuyGBIzgAKCjBCNiybEb19y5Z42CH9HPswvP/+TxAhralTXgtVjCfl64CKG
         StO52eH8g+J/7WCZGu6Rkpe0ERVf7DLDm7+krye29Zw8nijK8uFkqscWpTt9wrgiWMpV
         ne5g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532uq7pkO0CiA4D57QV30joBKbsfcYHtlg+mgj8msRKZoTr2MpYH
	7ks0uY7gdKhBcG4DyDCkFhc=
X-Google-Smtp-Source: ABdhPJzGO1zrBqKXNvDAOgQx1gutNooj5FvhcyBjh8NLyfCxc4/blOcMdtiscBEv/d0q+TZ9x3VjBQ==
X-Received: by 2002:a2e:8184:: with SMTP id e4mr1438529ljg.383.1602664160222;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:84c1:: with SMTP id g184ls1311016lfd.3.gmail; Wed, 14
 Oct 2020 01:29:19 -0700 (PDT)
X-Received: by 2002:a19:ac6:: with SMTP id 189mr1084054lfk.561.1602664159103;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664159; cv=none;
        d=google.com; s=arc-20160816;
        b=zgFVEqrNgjdveltcoukVvLy5etZmrnXdZgnNQo2Wxcrlzfd9fObGUa/Qii6iTxqPM7
         Xr8zTTdloVffmzDgKP5TEII3iks+p9KNghng4/9S1wyhubxUpI5609DhQyfQ7O29CxXN
         x4lQzD7fp0nzvxVvxIiRTShGNNF9G9Mq4Z4D42T4E+i9FIvTtegKd2+/5gy74tNaiSRf
         6jqlx5FvYBQibACkO9DGIB38BacCRPKfipF+XoNN6Acni1NrLeLH0AZu+z+DDI+8BW2o
         fuh+/MS5GlqyLwzlf1yyx27vv05ga8cZ5Y2/WiNVN+a7+OIImd1VlT4hJ+Tg0UAcoBUw
         T0/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8iFyi8NXDmoTorPkWGQKeiaS9qJxKinacEeQjnBFbbs=;
        b=v+g4zcN9fUMA057zOxRCzPgAuq6RzlhVMSbu+CQnNOIR9BTrhiDyjNccVRGfUO8+eE
         tJFecsZdoWDo5MoLQaMCA0KLoft8zNrvhEFcY+CqVasPwybfYdqH4rRjToc5bIBn1/eE
         fG9J9DHcNM0h4fKAuecMqRGXb0N6XjrSy0x99JW9VgDSEZJIh8/Ddg3/Z7i8UeZqSLiO
         5dtKhAMU4xP3twAl8lMenlADdd/sznj/AclqXeSA+njp7nfmeMhkA0FcxZZNhiQWEZkg
         nKxLVvL1Q949HS7I2ZfRI1gBQrsAOcve2HAxhqxURMtIuwmdEvxFBfWF9k5/Rt1ZsDjp
         texQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id 11si61325lfl.4.2020.10.14.01.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TIHv001652
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJI002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 32/46] arm64: smmu: Disable context bank only once on cell exit
Date: Wed, 14 Oct 2020 10:28:56 +0200
Message-Id: <c35067632bde18567f51676005ce60ca1f009648.1602664150.git.jan.kiszka@siemens.com>
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

No need to run this sequence for every SID the cell owned.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 34f2b821..acfe0cd9 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -596,11 +596,11 @@ static void arm_smmu_cell_exit(struct cell *cell)
 				arm_smmu_write_smr(smmu, idx);
 			}
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
-
-			smmu->cbs[id].cfg = NULL;
-			arm_smmu_write_context_bank(smmu, id);
 		}
 
+		smmu->cbs[id].cfg = NULL;
+		arm_smmu_write_context_bank(smmu, id);
+
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
 	}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c35067632bde18567f51676005ce60ca1f009648.1602664150.git.jan.kiszka%40siemens.com.
