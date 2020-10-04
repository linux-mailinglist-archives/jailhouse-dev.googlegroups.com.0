Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVX5D5QKGQEAV2MSHA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23d.google.com (mail-lj1-x23d.google.com [IPv6:2a00:1450:4864:20::23d])
	by mail.lfdr.de (Postfix) with ESMTPS id 46128282CD7
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:19 +0200 (CEST)
Received: by mail-lj1-x23d.google.com with SMTP id u18sf286211ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838019; cv=pass;
        d=google.com; s=arc-20160816;
        b=OI/fknj9GI0YXYfSgDUu/eWOWrQeDRdd2CURMui1qbS2c8iDnCCJCROvB2RbhIAxdi
         88yfJO2O9srO1XlkqRmDws/KLXhkRXY0YDSSZuojBjuSBz4YCg0s+UPRMQUQoXuvslKe
         xdmSi1/HWlAeJEqTBd5CzuDN8+8iJtNBpHImtwODHJx/ywA9AGAvQv+negeH2EWpY9At
         1aw/7CjUUom65x3nO8pDJer7LPIXBrJaXMwyY/FjOdAotvNRzjKRF7SNkon2ywsmsMGO
         QrXrdxfWcMYOFTIvYSQ5XAzRNeOmWi2XSfuyfCUkVPs6dB795h9wb1GUrGCyyVUsG281
         PA/A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=TJ/My2kshzTe8EIB5A5aAcTmdDWS43A8oC3m9/AbxVE=;
        b=0EO3XIkXDK+sui48jkOJD+0400UMOKT+v91bDK9L+7vVH5jqOUKKJPmc+NjtH3Smmb
         BNShuRGVnnYhK4i6ilyRg2BOVEsqlJAGPMNjoA/oKjJYoMZzRCgoPiJ0cAbp3Tr00kVs
         ryDJ/iy3CL482NYGVLSYkV2Tp0THASx7sTBHOt3cwoAyKYSm/u0H/MGJaTNaPzXU5dzp
         Kycm8LBt75MYs+J/wK40KBvYg66emZ8KSLmlnxM3QAjPJDf2op1ftpj1GsJ9LIkpySIM
         W4YKdpWQ48uxCmndq2cCAsjwcakjFzwDTcmt7U1KX45QlLcCRSxgBNZ6s++I2tCgN79y
         7xtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TJ/My2kshzTe8EIB5A5aAcTmdDWS43A8oC3m9/AbxVE=;
        b=jTV8EIwsP1NJqwqhJefiM8eeackaIxSSTEern7ntjDLFbSpkpcmDKh4jhUriivgoHP
         1AZ+LAsLFFWFeMF+tazm1m2zRhOwSAEpWyq/N7K29AFO7SYWIFrG02cDQmL7SqfU5SKj
         4r6b10NpmkCsYZUi6VOV9sb38/wNingNprbKs5slXtUAi2vkZuTM1P6fvxoMBLnQJ7Yd
         5TwH9bt7XowN/BemKQpUKDmTLuGUde8infu4jS9M48nQREXyqY6JmkVEQS9SvFyOgdhA
         GX2CjaF76N9+q75lL/jlIhCsuMOEML3zrJhM+SMMJ4lcddWU+/35rgav+uPBHRGaNU6O
         AgKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=TJ/My2kshzTe8EIB5A5aAcTmdDWS43A8oC3m9/AbxVE=;
        b=qj7M3SxbcaUj9cb3nexveO9w2Cpx6jFwBRlcgVIKhy6gVQPpVgOUa2Jte4Pv+WPHCj
         qP0FHA8o7q5T1pC5p2ZiFMVXQ4ZUq5EkzimlU8ovZShzSUP/r+QQ1+v1+DG/ln8pCmiu
         FG6KKfFJyhhMuXOzrqox5B73/DKfiyPz8SjIHfcTk9CmiYwMlrn+0ifeG9nWzMmQfGIN
         az6IlI7QmA6f1pAAjTIQKrkGatd1KaJIPOw+PsZ9+dwQ/jvnKb4be09eC1AnPvP4Gbqw
         PF3eDucGhlupLnYuYYbSp/3z9YZl2M0rOiG/6OFCT/G7DFXX0rhGCNaATXl+3w8M5ORf
         3yIg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532Om96oQ44kjotn5Bh6F5u7c0sUemB4frHdF0Vh0guFEYvDZQUP
	pyFyUIToHYXZJfNpqPYjgF4=
X-Google-Smtp-Source: ABdhPJx/CHu1wZ35PgPRDNDXsMNpZTnwjEgmuGUtNfJEVoImz0i9u9p2Trc0BgFsnunQIGFRFVPAjQ==
X-Received: by 2002:a2e:8416:: with SMTP id z22mr1445071ljg.72.1601838018807;
        Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:c7c8:: with SMTP id x191ls1122153lff.0.gmail; Sun, 04
 Oct 2020 12:00:17 -0700 (PDT)
X-Received: by 2002:a19:cc43:: with SMTP id c64mr2432780lfg.123.1601838017458;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838017; cv=none;
        d=google.com; s=arc-20160816;
        b=bmaTdzqKFbw+pks6F+KM/Im/nNTPD57DY71+D8yBK56Pfq1/Lh4fRHMSaBkwRJvDSD
         OO44Vj2zjLs4BxLeKZqVx59bUIeuz7zGCEi3TSt74g25jR0FNGsTmoEaunAstFnSMkGZ
         YGEYYhU/c7V6CRyH2a9GUx/MGnFj5vNV0TczCApOwX+/napstrripd1JeNh87msk/klx
         ROAvgrsLB9uKSbKKBoGnEmwtwj/r8PUua/RNc5/dOcHpxBebTNOkQtsVGKUzY/o9ecAl
         DkehoIgi20DzYaG5ZHs6geUWbRgCrlFxx8+KsDTSWIadFhdJ52+Vh3cO52N7njVHMN7Y
         lbGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=Iy1KB+XScOR5aRw2yoi2aa3MjJmhe0e6IDxrweYL5/4=;
        b=Z52jFqImXl//B3BLUdRTA8Ph6LRC9FK0Q4ktPQdJPV51xpO+fb3Zk3kPxrkNuZGc71
         /o4WbXrvPR+QusadMR6rU7UqlVWzojwva8nqcVWtEpKj9qAV+LIJKhdQ6QJ430J65oD9
         OOch7A6YNXXkCtBLG/bXhPRFyigywkR6cLMkKUnWtKJREYQer7eC+HrzPmkIg6ixWcpD
         qUZ968ooCrkHEIZxFTo6Dhl3UjDJodcziSba1sOEpcfi5lh710rCSxi19+CAgDysJcpj
         LbvMYgZowltLBjRZlNCUsbOEvsIBmutYYR9nSAU6DtLYfxN7BNtj2zQPRAm0oUBypYGx
         5pWA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id c20si126328lfb.7.2020.10.04.12.00.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0GUt025205
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060r017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:16 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 41/45] arm64: smmu: Rename ARM_SMMU_CB_TTBCR, drop unused ARM_SMMU_CB_CONTEXTIDR
Date: Sun,  4 Oct 2020 21:00:02 +0200
Message-Id: <1ad9321824c4091943d8cd30985d664a62d8caa6.1601838005.git.jan.kiszka@siemens.com>
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

TTBCR is SMMUv1 terminology. We are v2-only.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index da904d1d..e255e381 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -101,8 +101,7 @@
 #define ARM_SMMU_CB_SCTLR		0x0
 #define ARM_SMMU_CB_ACTLR		0x4
 #define ARM_SMMU_CB_TTBR0		0x20
-#define ARM_SMMU_CB_TTBCR		0x30
-#define ARM_SMMU_CB_CONTEXTIDR		0x34
+#define ARM_SMMU_CB_TCR			0x30
 #define ARM_SMMU_CB_FSR			0x58
 
 #define SCTLR_CFIE			(1 << 6)
@@ -259,11 +258,11 @@ static void arm_smmu_write_context_bank(struct arm_smmu_device *smmu, int idx)
 	mmio_write32(gr1_base + ARM_SMMU_GR1_CBAR(idx), reg);
 
 	/*
-	 * TTBCR
+	 * TCR
 	 * We must write this before the TTBRs, since it determines the
 	 * access behaviour of some fields (in particular, ASID[15:8]).
 	 */
-	mmio_write32(cb_base + ARM_SMMU_CB_TTBCR, cb->tcr[0]);
+	mmio_write32(cb_base + ARM_SMMU_CB_TCR, cb->tcr[0]);
 
 	/* TTBRs */
 	mmio_write64(cb_base + ARM_SMMU_CB_TTBR0, cb->ttbr);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1ad9321824c4091943d8cd30985d664a62d8caa6.1601838005.git.jan.kiszka%40siemens.com.
