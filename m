Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQNX5D5QKGQEYRUKFJY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 120C0282CCF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:18 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id u18sf286199ljj.14
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838017; cv=pass;
        d=google.com; s=arc-20160816;
        b=FnKcfi7nH39kWvFV624JF+c3iTIrP3EMbtrs4cJ4mhAWUQb9ML7IXDme4LpqiPy17Y
         4bFep+EkojiLiOFT4nBTX9Tt6vkO5+cJo7u5ce2Tib6K2Tmet7dcwEkqc05ItBJmC6EJ
         JUeXJ+HvwFb4o2y+BJcXeam9xieHzAc7Ib9h936vJj/JSAPMYFhHssfZZWSZR5QTPona
         Er1HAGxeuMKRSnoi3KYPm/6oJVv0aoGM+ud2O9RhQFyKt+UshKdHIVhqA1bfFZ85SCCt
         n9CtvTlo7Yy7u8xoPehhkesEe//IyQyFW2fzJmBOcLe1v9r79tyBEkCp7aOgU9gdprRV
         TkvQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=wT4lXfS+oyVOoxY9X71WkTu9XhphzoWRC3ksQHdmC8Q=;
        b=BrgsapfhvNpHtZ6cZKEjUe/RC/iuIUmS6496Wbo/79C7+d6eD4+P9W9wFzZ7nfUiK3
         3MS0DTzt5RqC+iShu2SHz1Ire9MPWHVahiSgjXCYKE9nDNEjPYSqxco7cRuRfUsqE/eQ
         8bxeLo3UFlFsWM9+awtwhXYAC0xGZh8UCrWnuNrWhxezJTIaBeaRHA3BoLT28sCULbgm
         vkhmJfcnwgEXdMm7xzUloL0nc53+yJShoUnjvW7+XVR2c8jDVJzvk3pq/jv38feEYOxi
         a3pf6F2OpHfY+xZjEks9BZedGMx56/qbr/JymTvZl8vSnnp2ySBBE6au8+UHOn6A8IIK
         28EQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wT4lXfS+oyVOoxY9X71WkTu9XhphzoWRC3ksQHdmC8Q=;
        b=eX9KK2OT+xlbbGA9/M+Rz4ewO2SBZTOUKPgv7N/ReJIvo2vAhYDChEhp4ra81BOoHc
         sQ5tAWkW2DHxQ5/dPkUM4yWZrR4PkpfPPeXTWhjW7ovye8cARQttcNXL0gJvYbdyRSX9
         71xFor+viKhisMFsyb+xQgawwSy9xmjzaGve/sdXmJx51b4cZAzvS7smWjre9p5NygGw
         k4kGbJdqF4PJWOZduu/k7Jlv83sMtTioDEl7ZXMIj8hrxIlqHJ2hwFlaWt5al9AB8DYI
         h5MKQBAhvXTJkr0fAJ5/zyDqTvsOAhkT6ocgt7i6F9XlPhRt4jSMMzV3NmPpf6cZOOT9
         ZjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wT4lXfS+oyVOoxY9X71WkTu9XhphzoWRC3ksQHdmC8Q=;
        b=ET24ekw6lxAsM0sH3YrESMXaA2beLcxJhMmHfWgAvdR3BayPPFuRGFFkDMvQ1ARvlu
         cGN3lptZlr99O9LX5aIhoClLmTomCxirfYMqBPn3m/CtKWYu8BcZerLTAFuUyzEJSV+B
         rPyHV/tAWd+lWAc+1nvmi+N5vpxJZY9bKL1oYphpeEEYyY6QpO8Xi82oBYrAcTgJgbRY
         meB5AB2vXgmVQ3u9p9iHXxNQpqzS50SciaIHG/s5XFlt7p0Loz1E3tayuNn9DNLjSjRQ
         Bb1GyAGMrjzK0DEmNM2JRt4fpZGFewKdrb2DRG4Bv2RnrAmb/YpfhhlIgL0lMRW3yH95
         WXqQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530RSNX6Vuy6CreUk43Q7fnEugeT75nB/HZsg3cJ/kDicibuv8Jk
	R7iz7kbboITX+bhtux1tjXQ=
X-Google-Smtp-Source: ABdhPJwy6myZoyOtloyz5tBe+W7sePnHmAwXby194w2K7+mpozTWSC2kYmhcBEuw8E2JKQQi8HKWqg==
X-Received: by 2002:a2e:83c9:: with SMTP id s9mr3026137ljh.168.1601838017648;
        Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3c13:: with SMTP id j19ls747206lja.10.gmail; Sun, 04 Oct
 2020 12:00:16 -0700 (PDT)
X-Received: by 2002:a05:651c:1042:: with SMTP id x2mr1785946ljm.185.1601838016315;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838016; cv=none;
        d=google.com; s=arc-20160816;
        b=aOKsn+nzpG8GuWE2IrKGwszu6hArkxJvciQ0JzXQdD7sSrZxC3KWKV+atfEdMCrUHO
         xN+OfDDmGa8D90dMaEVUG3I7K6x9AILEFSodAiN98M7YnkCRersVDvVrgnHyxJpy/sj/
         eswAOyg7W3OMdgoCuUr/l3D2I2j0AcfbW2naqxEU9jNW2Wq9qx6sDBnu2PPXe9Yo4M6X
         CpT145Al+yDQqTnH8itkOpHmeSCxzuz4CiOoJyiyB8Xzc3LRfgFsMIQ/nnn4V2Y/xuSH
         iC2IDp7W+pA+hSw17Ddj5M19H4DP7MbcDLKijJySW/itWNZE7DwiT8dqmdX3RIka9Wla
         gy7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=EUtND4o8pFMsZb0R6DyHTo+br3IvT52pNHynkLeT2cY=;
        b=cCKtJn9psUdIkn9uGQES6g1i/ZzyrvmtkZXU0njT+mmxtCjg2AfbHzpYZnrSW9neHz
         IBkLiJEyi6Sl7Cd4KqZObZFPzXVmqnRRz9bOg0qzU5HPsUagdurrPwChor8QRuLlfnOR
         Ckm6DjbiZnTHBtTo5sZ0hoVKB44ae/wmWvG+LhhPuRYz5dIu9cLoJV7d56TtSie+EDqT
         3lK2im/YAIqcaEV6e1EREEuB15IybkU8ZoUH0Jlvt78U/ZqFYgsKaWNkUAXDLER4TFRA
         LaKHt3IJRixkJfHrgEpPFdHY9zfmx4p3gcir4JrHXSz1hU0l8Y28mnbs7g/ocMqXP3Wl
         DAlw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id e1si288758ljg.6.2020.10.04.12.00.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0FCE029816
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060m017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 36/45] arm64: smmu: Check IAS and OAS against CPU parange
Date: Sun,  4 Oct 2020 20:59:57 +0200
Message-Id: <1828aa461a846dcfba4873019d613162585ea137.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
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

Make sure that supported range of the SMMU is compatible with what we
need to use via the MMU settings. Bail out if not, and rather drop
useless reporting in the code case.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 35 ++++-------------------------------
 1 file changed, 4 insertions(+), 31 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index ace7a48d..ba278784 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -170,8 +170,6 @@ struct arm_smmu_device {
 	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
 	struct arm_smmu_cfg		*cfgs;
-	unsigned long			ipa_size;
-	unsigned long			pa_size;
 	u32				num_global_irqs;
 	unsigned int			*irqs;
 };
@@ -356,25 +354,6 @@ static int arm_smmu_device_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static int arm_smmu_id_size_to_bits(int size)
-{
-	switch (size) {
-	case 0:
-		return 32;
-	case 1:
-		return 36;
-	case 2:
-		return 40;
-	case 3:
-		return 42;
-	case 4:
-		return 44;
-	case 5:
-	default:
-		return 48;
-	}
-}
-
 static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 {
 	void *gr0_base = ARM_SMMU_GR0(smmu);
@@ -436,19 +415,13 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	/* ID2 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
-	size = arm_smmu_id_size_to_bits(ID2_IAS(id));
-	smmu->ipa_size = MIN(size, get_cpu_parange());
-
-	/* The output mask is also applied for bypass */
-	size = arm_smmu_id_size_to_bits(ID2_OAS(id));
-	smmu->pa_size = size;
-
+	if (ID2_IAS(id) < cpu_parange_encoded)
+		return trace_error(-EIO);
+	if (ID2_OAS(id) < cpu_parange_encoded)
+		return trace_error(-EIO);
 	if (!(id & ID2_PTFS_4K))
 		return trace_error(-EIO);
 
-	printk(" stage-2: %lu-bit IPA -> %lu-bit PA\n",
-	       smmu->ipa_size, smmu->pa_size);
-
 	return 0;
 }
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1828aa461a846dcfba4873019d613162585ea137.1601838005.git.jan.kiszka%40siemens.com.
