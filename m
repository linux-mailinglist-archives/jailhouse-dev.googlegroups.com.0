Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFX5D5QKGQETQUV4XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D55C282CCB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id u18sf286187ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838016; cv=pass;
        d=google.com; s=arc-20160816;
        b=pdGx3zhArsl2qT4MQ936sB9UGwHy3nvTWvW/EOuBehV3KiKzD81PkNqs26a37AnWTn
         XidzCpu/CN9iMNcEVF3NQrDR4jLW13syxiq++bOvyypoepVeY8qul2ce/xiyXpFlQTC8
         Wggvs9052R4d/EM8harRoxLUI4Zyvs2uYhM8WJLn8lZAN42zicJguZdxChJHFcHFK/VQ
         CLYyrstJM7Ru+T3AtmlsxAGFmXUyifsGgUW85BLgb2Of/A7vzrisJwV+lgJFvKqA0owc
         dwD0dRYQbGgwLvtQfQheELg3Zm6gJ9/grIZMLKwuaHzrUIKoXRFie/SUyTfnQRm6H+kG
         QVYg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=trTfR3blDzEIEtEqgGuCBy/Aq8UrwQhW+2Ouphck/oU=;
        b=re9UB0kBKOuRLUEw4R9QY3BUfrzhtWVESE34ok0atL2tTYGqsJaHN7RgOf72DFm9wH
         m+JfTQyrXwpmDcQQKRchAgp8FHABKAWOOecT5426Qj/8v8nuxXQtD4eV8rNpy+lOBEam
         FxSPepXeoD2oOKGjB6IVjTA2Q39KfIGM/m1Lk8MxS5i16zHomtwi/gX7uxepABtVp/+b
         47sUNWC2f0DdCLSCe8hR4Zedgh2pxvcWMMx/q5K6E7DseAhOcL3DWW3rUyLRJzSoMXrh
         QxL3JwHSkM8OA4+Kie9tW2QjNOaxLrd4Fz9XGQ6lWKOI8+8pDNrI8Q1yZ+datH1UKv9B
         Hk1Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=trTfR3blDzEIEtEqgGuCBy/Aq8UrwQhW+2Ouphck/oU=;
        b=S0V9NG0Jiy2HiAaigHNsoK0pxMvYjG/gpuhBLoyrg0k2fVk9djbsxVHGAqwm88glYA
         1/JDqMwVJFlhCiu2KdUH7Oolj0exv+K3gEAYPrewOiboPL8X3IwI54mfBmK7362qLIyX
         0oZGaO0UipUyayqrMHwgb1vc6kCw7yBkeVy+MVMxpjEogvy7iJMmwv6o3OHufjGbBGiJ
         vTsc14cIfXffF7AaxPGo40A1ZCJnt8DLv5/NEwzGv0kbMumhrV+IX8KWvBjUuNP9lLtp
         aQ0cRPYX1Vn8m4ZlU/sU7JTdUK7WZn64LbXVs4DzcTpznCAS5CNLxU3Bo0OWv78Ggftu
         /qgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=trTfR3blDzEIEtEqgGuCBy/Aq8UrwQhW+2Ouphck/oU=;
        b=JQA9TUVjH3oISraL2jyRMyaYaRG4Tg7w7NX7jRuULR0AJSZMNphGkEEzc9asRmys7y
         L1DF0dqSqCaTRBeP8CS5kU4qDlduv7SgDIu+PVjKY9dhFviEmjzSU1IHerxHd2c36hBE
         N+w7wyQDBaEFGW0oqrlM7LSp7pcSuQ/DzRKtN3fqJcOEstvV2fhAtFOdT12iuyYuRsQT
         jJVWkavP9aRrgxkXFxkQkwMRECACoBwNVqXP6RtRoPbgiUW14dJGdcexOTbd0EQBWpxs
         N0qSMGYG3uSHUvBGM97PnkcVsDSecTyzih4ziAmMxrNgtXMbxVj9mBHh22XxIIhJ1gyx
         Lz8g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5319kf+Z59RIPxCpBWQ68BGWMj8edyS2tJF/1gcgKj5zgl3Avg3A
	TsiHLzwxws76Hgh7Z6MG6oE=
X-Google-Smtp-Source: ABdhPJxrlz4MIEUmEDlPU87iqB0euUelXRY4IsDRoQOtp522BqSBWz8xgQzjWws2QTppfzxRp8uQpQ==
X-Received: by 2002:a05:651c:110:: with SMTP id a16mr3405628ljb.110.1601838016785;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls1116931lfp.3.gmail; Sun, 04 Oct
 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:ac2:5f50:: with SMTP id 16mr4773228lfz.420.1601838015647;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838015; cv=none;
        d=google.com; s=arc-20160816;
        b=SybNs8uSCQJx0VRhS+0bJfC6YbpQIT+j9Vvo2bKRRSfECmIWStckIzywSUJ72yEcxN
         Yhry6uR28++u8of2chnzryXG+d+7SD0Fl0vRf0jBBI8ZYup0KyOjLeMjCULxrDBdHRBl
         v4ADikmpz4Jfm24AcDEALkZ6/X2x8G38PfYGz7kNiwNsisllUZFrzN+ucXuZC4GEHcUe
         EHPQVwfZx9nv9ZdBapaBJS7tem5ugt4O3tfPMAc5vM6mfdp3lPCfDXNCYd/PirG8S72L
         eT0808P1fIuJGuJNX3oeS7yS71z/eUBERLqYlRUQfMUDy5bCjihwNr8dOy7b4KBppQMj
         JVpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=yGpZCIJeUWO05Jwi6YNmGHclpQFutST+Nt5efaxntp0=;
        b=DV2qzIy1EHB5Yz6pOcGaVMNbcMaZd6bySL4ZNpH3D1cX0CabfxDb0LDCnakNS15egC
         JQIKJNadxh89G5n5JF9m74rS0tihovzr8nUGw1np18RYFALcQV4enPvqT969SoRoXdZ3
         knXcTp/c8yRuvq5eysBSulfyJiv4Iw9bQFIfJkRcAL40X94QzGBRZ1ZIgEApomoBqJXS
         ud6WQO5F2sBLpD+1xZB/E1GX+sH8YhFDNfp7Emk3dXrZedOCmMgSWz6rhq7/jwgV5WWh
         /fFXA46PmKsrdjQfa5peRlLoYFhTmyDFggNu5e52/2SETr4erQJ7nF98NtlUCPwYRkl1
         SHmA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id e1si288754ljg.6.2020.10.04.12.00.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0FE1002701
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060j017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 33/45] arm64: smmu: Refactor ID0 evaluation
Date: Sun,  4 Oct 2020 20:59:54 +0200
Message-Id: <efb57a396e9242c0e73be207e48cea4d8e3190c6.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/efb57a396e9242c0e73be207e48cea4d8e3190c6.1601838005.git.jan.kiszka%40siemens.com.
