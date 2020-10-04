Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43a.google.com (mail-wr1-x43a.google.com [IPv6:2a00:1450:4864:20::43a])
	by mail.lfdr.de (Postfix) with ESMTPS id 48753282CBA
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:13 +0200 (CEST)
Received: by mail-wr1-x43a.google.com with SMTP id f11sf934849wro.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838013; cv=pass;
        d=google.com; s=arc-20160816;
        b=qB6hbDWOIOvN3lu91iCCFlRSsW/WsN4tbEtePZHYdclsBGzin0IdZF2oawzRKmuSzQ
         H845s8RE4Dz12JS9uq9a6IYVJDV8kwnfIOmd1I9i6u5xRZl28jWYlNbITdMpHUEh9c3d
         CMvcXrTZqH3odq2X3yeuYAXErIjoI3aJKjIv/Isk4GhRhBiiqakCjlqjMO8dtj8yS7Z1
         Irr74AZ3coXhGZz1/3zG7019Yg4woIrfYoAGcXkzCmubdKluyA3Rrrxol93f17M8G3V0
         WdQgHR/KKzFqJ4CwJMHMPCyMuBtRvuqsEqdRb6cEHNj8zB0CgXBkpSAnte9344X7owUf
         nvkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=CyXV5FqjMcFg7etRCCSBT0akCyyDRh5umIDjl47KjCk=;
        b=DlZfFNLA9V3SHaTRN6WMJ3N4FBr+g1rsvuJJWHiDyM+9PLYQ4T6iwzBM8VdNEyyADC
         pyMxmqvn3UkQcaXX1qIgOLwBXsIVFcUEnXMCk7PkvCPupuPVDxSCkqrBOmNL/+deLuNC
         ZzDipPK7sTJGu9h3gFKSCl5xil8CC+8a9yIYIderMkFl4Qmqq6Ky4nrln/UlDhi3IU+K
         acAK7zuND0PQ78fbWz3IQh8CVyH3jbe7aMWUYuaZ7Mu6Zxt/JnD5AVJo7cYIYXs7kNDL
         w23K/eKAmn0866FeAKNStSctZr1Cq34kFrzZJG+wqpppZCmfo6f5pysnwpabhat79JJ5
         UBIg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CyXV5FqjMcFg7etRCCSBT0akCyyDRh5umIDjl47KjCk=;
        b=bF1pfATNaxf/3Cvd/uwu77IPdyEHxm6+eYpmC7zQ3E/WBfsGkc3qlDf4Ketr7DLO7j
         n+UGCXrbqk4EPX1T7uibAuHZ15jZRZaLZ6lyL04waBzXHi6C2rQM9SbL+Jd9FdNiZP6x
         YTb0lGe2+6/6HbH9PiA5Qcd9X3Z1QhYrx0/ti508JAy693ijrjHXRvexbgn+kdEe0mqK
         YIG01o4Deriqi1M3EqahZXJ2+ONiqbP4qWJF6qAUm0Q+VhWxo6Heq7wTllPBK8S/tPnV
         /mjsPW24yN2fQ03B+/s4KkKfKlxgrr+TDtsIhiOWCGiWWlGPoF5rN+WKWnePMFYIBhh2
         zfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CyXV5FqjMcFg7etRCCSBT0akCyyDRh5umIDjl47KjCk=;
        b=GjUQ8t6svGhGkRHsPjFyI6qpBWy/EUFq8z7Fa9japWaOMDMNcrjVxpvIGZxjVpuaCe
         jJV0ELoXMxmmZxBtPxCCrOPyAPXEDf0pmzKYVrecI8ytVTUxQuxD3Rsgf4WCkHHjXcGq
         9O+xU5oMLir04A++hBw2L0qAfX3JiNfCovjDwXN1IzoshHcsoshFtEDYhuUSqtlMSK+w
         LKQvKB3Yxgfe+0JUU/0VQtAyPiVqIbfBAVX9JPPZXQXki31mKmoIO6sz4Rdtgk9wHEH8
         xGHCd5+x/nvU3H5uLYdDyFsY1Q7BNfDhR08TUhHIm2pI4IqDB/eciz5wmrQ2s8rXWqqv
         RYTA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NqH2S6m9y/KL6rbpH5Wb1Z+dhSbxUVJwSosc1sUzAiE2h5Mbu
	Og8wz5SwLKE7AOpvkeFVhqE=
X-Google-Smtp-Source: ABdhPJzyLqcoLYE5H94Zg8geBaijSxMbN967kl/MXX84zQV9jiNCQY11R/E8JZ+pM0wDEVCyUIDfsA==
X-Received: by 2002:adf:a1d6:: with SMTP id v22mr7814264wrv.185.1601838013019;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls5170509wrm.2.gmail; Sun, 04 Oct
 2020 12:00:12 -0700 (PDT)
X-Received: by 2002:adf:8030:: with SMTP id 45mr3452895wrk.177.1601838012062;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838012; cv=none;
        d=google.com; s=arc-20160816;
        b=Y36dVbjGbrA27u3v0BoT5wtuAAU1lF/auFXQkiDdAhpyinDY3ZUSEqhDAbi9RyVKYS
         +MLtzuFrZmhAynZbtKtKX6lZWHg7Hinm+JLIfVMU2ahA/7oB71h6XzUu916Pw0xCYzdm
         RLMVaEzDRfzsBuPa6pS2RS6HQ0ZZZEEcv15s9/SE+RgVjad4wYYUgmAsnmLKvHHKueC1
         Z3SybIpbO0OLng8GPgOX0BebUBu1iZPaqEVWph2/W6zGl+ZD2GZ0xXl+XN4crUjIbSZI
         M0ACZugFuwcYA7JzJGji/WANbBODemfjksyzJzZonVRcR4DDd5Q/Bi9VHurtH+AmSAFh
         nLvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Hyx64XGrCyMzUt5JkFw6NK4Zo/cdEZuY8eiqBGElCcE=;
        b=leO7Sb4qft9/ABqGx++0LCx/vUlbfIZhC1ywIuLvvSAn7Y8sbLPN29r7NGpkQf0FhJ
         GNvrDSguvO4fe1/sU8SZavoNNIB+bKgbmBwpqJBNzLa91bfjJDhim3+0rDoSquavPyhf
         4TbEPIA4YuGMs+iBHdbsTJjaopB8PJ3eeFeOqs72x0V+5AHhtVSsuEYyRsySfrIrXlPx
         xR1AMb2wsAYaHGmAM1gFn7lEkqVoOPi+fVEFuJPJUUu0hyzj6ZnHp0KeLtwwRJaGsh8u
         ywMj9xey/U/UJ7JHO7Uvu91to251BMRcYluf2AByhZifM+dKnKqjZZFGdYJWIZROAHdz
         eGlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z11si288168wrp.4.2020.10.04.12.00.11
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0BSm025073
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060T017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 17/45] arm64: smmu: Do not stall failing context transaction
Date: Sun,  4 Oct 2020 20:59:38 +0200
Message-Id: <39a8de01d1487d02de08aa5e5c4a85816ac4b010.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/39a8de01d1487d02de08aa5e5c4a85816ac4b010.1601838005.git.jan.kiszka%40siemens.com.
