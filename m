Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQ66W35QKGQEA25GGMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43f.google.com (mail-wr1-x43f.google.com [IPv6:2a00:1450:4864:20::43f])
	by mail.lfdr.de (Postfix) with ESMTPS id D996527832E
	for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 10:50:11 +0200 (CEST)
Received: by mail-wr1-x43f.google.com with SMTP id f18sf800976wrv.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601023811; cv=pass;
        d=google.com; s=arc-20160816;
        b=0jf2vc5s0OBZXsG5TXMQi5/ocki1Q0gHinP0c+bP2LAqpLyeTtAMTPlUfivW0XE0OF
         DL23aWB/ncpj9F6aghntfzRWjjOIyQM364FTVZfUfyje17H2OXc2SdW6qpWRlhVyxP32
         PLrCdU+47om1Fdst/rpG7ZMEU3Ta9tIlYciy+sQtY5JV5My4/62Fe9HNNmCu4Ui/NHNM
         Bm3wSAKB4zAjcmkrkUEwYgc7Ql/eTHpSwSxq/ZIjzaC76bkrGqd8pEvGoPdUp0OBiG/8
         HiW6DloSJpcT70aVWn4h2yU4btmgHbs4K0aTiuXx4GiUj3niSFqkRYditNdslLFAyddR
         QH7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=jhnHt7iJlQ0MMnp6YpYD+agcLHGO2CWBjxb7afBQ8EI=;
        b=pETVjeB05fQ8nCOsujKiccEkdm027p28R2hkSbHfkRJTJo40vZTrXXyVFwtfpMB2xO
         DvB9CMT1HXOCNc4mGVUlpvrqHCHPr+sdlm7hewVvcFRR/BN847luicYGmlXUlx69r5PZ
         sXmELFM4V/1PocejY434/gEAUxFKXrYZPt3mByMaRlBukZSvqhBcP7IRFzYXqSOC1TOd
         ftOCn1a41/Dt7hFOxJic/XegdPl9gzTmtuqLRwdEm4p1LtxTjYozzudvzZ4Av24xNUem
         9c6ra8pCcVQgstTX2apD0HY4d44iCBdMz/fSJf3p2V92+k23ybVIQ6nz7FqFtAxNwQ4N
         xZjA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jhnHt7iJlQ0MMnp6YpYD+agcLHGO2CWBjxb7afBQ8EI=;
        b=VAAyvE3gkeUDYMqGKszA1QyaycRqCJRDl9btO+HLFK2K8MNuIepNqBKHYpg+/tw6MS
         Eg/qOhFL1VLwb8+rXuNkRk2/Jq0XCF68lueKur0eaoF1Nm9+v4o+ns0pviTZvalCdXt1
         odqQdKlA0TFg/eVEyateG8YlcJrjnb8hi9gKdyR8dOM4JwQTHwLTSSnCkDpRoZyhWhOv
         RMDxaRJ3uwAYoAMmMQgzKkYbOaUJEHbV7LFlA8PZuPqT2HFSQogDc2P1TsYuBxCBcfR5
         v4HO3TsSBR9gmb+1C0Hq52/uwYCFbaHN2ifIM0zYrXHbIcmHTdNpB5vPzxh6MN8nJkDD
         MpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=jhnHt7iJlQ0MMnp6YpYD+agcLHGO2CWBjxb7afBQ8EI=;
        b=L2wS+p/Q1OxAD8mnpMN8aHtIGdcmdIL7Hl6HPg/XGKByZd5d3cdvGbp4N4MIfg4vXE
         g3KkUkz86Y8WnRakMEgux1DhJgjrUFPi/RNrqEUIQTCvAfZWz9HQt4SdqsQvfL+7Yd13
         niHkEGA0RkZNKSF7pLcMewbzFTzaLd1Zo9GfInZU5CGKkfxqFHKdjTovdEuUz+ak5nWO
         d9Q5uuy2kHMaDijn7kRcRBD5xhwQ94Uk5GJJ5lGDnqxfm8uiSYOOJ+eCjkrtzWtYcWtn
         fIYkO4w4xBwokaWqtAyKxqZlxUFqve0gpchKDF6Sy0qy8V+O2pclS5C6jp1yIVFIc5Un
         dQBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM5339H08idBorpPGyC0g+2Ca+eQxxxj84jSzBcouGptzkzTGF0MUd
	3WRhMJQ8UbzEmVBJiWp8dvI=
X-Google-Smtp-Source: ABdhPJytfqCYEVlZlDrFR/KOp2LJMzGmbjcdLVqPCD6PRw4HXbRmGu/smNdx0ui8t/gQ3HtztYqp8w==
X-Received: by 2002:adf:f585:: with SMTP id f5mr3478711wro.64.1601023811640;
        Fri, 25 Sep 2020 01:50:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:80d7:: with SMTP id b206ls838897wmd.1.canary-gmail; Fri,
 25 Sep 2020 01:50:10 -0700 (PDT)
X-Received: by 2002:a05:600c:228e:: with SMTP id 14mr2032913wmf.17.1601023810358;
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601023810; cv=none;
        d=google.com; s=arc-20160816;
        b=PGg1gLFsmNnoa0LK9mPzdLN8Sba3f7wrAxPOyTwPMk2/XEel1NTFvEn19+aXWgAF9d
         ewH31iO4l1jz9LlT/xkTQH8vxbaKvnmA3j4EF8tEEGuzleTzAvgS7zOsyY0tQJ+qAAfR
         Shb7cyD56aZoVL0DInnQBojzYOOAUqd8Q2RRcY7YVzGfCV3Ma9l+WTrb61J5OeeDVqqx
         za1drhjvvJHhr9QVLHqmK5ntgfqZm+EM81MTtU4CQur/9b5pg7Or1MR7nS6e3uow3gYR
         U4EtjRrO4XIh8MEMb1a1Tt6KC/QhAd9N2V4XDSEQb/rGa+e26D8zYxznkHILxLZVMegu
         Uhpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=y9asQX1rUrBUr2ARKgppY3vLZCS0426JdZtmav+PyQU=;
        b=qJa/9qdWpq1U3HDSJ50lPrTzh2IN0XBLxenmkJSfXZtuxP1gJAzJe/i+bL6jP+TjE4
         KVfw4KojPbk7/VG+5tyaFkB75wc1xaVPfTWm8nevFB1+M+NYogCX+sXxUbvLCHdYbKND
         ZdLQQupy3Atxpgpg7VY/un/EnxRVNI6K1e1TqyDr+yerKrzl0VY76/axkpp1x7zoWJdO
         LMLHCqb6CaRRA1bvfzZl3rhn5XKZ3petf+9diWcwZZCegP4pj2ajuwTeQXrMUWlwFr3V
         CTNWkyZL8gU389zgboj72tIwhUAVrG4NEbnH8YNFMOFRlIYqJxRguUCRSaslmbsc7UkR
         b2sw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id h11si54842wrr.3.2020.09.25.01.50.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 25 Sep 2020 01:50:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 08P8oAQX004966
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Sep 2020 10:50:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.133.254])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08P8o7IN027224;
	Fri, 25 Sep 2020 10:50:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>
Subject: [PATCH 6/8] arm64: smmu: Drop duplicate error messages
Date: Fri, 25 Sep 2020 10:50:05 +0200
Message-Id: <47b390bac76c1ecb797ed6ed2d7c81373e1cc923.1601023807.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601023807.git.jan.kiszka@siemens.com>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
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

arm_smmu_tlb_sync_global already reports when it fails.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 2cd5157c..b89291e7 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -887,10 +887,8 @@ static int arm_smmu_cell_init(struct cell *cell)
 		mmio_write32(ARM_SMMU_GR0(&smmu_device[i])
 			     + ARM_SMMU_GR0_TLBIVMID, cfg->vmid);
 		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
-		if (ret < 0) {
-			printk("TLB maintenance operations globally across the SMMU failed!\n");
+		if (ret < 0)
 			return ret;
-		}
 	}
 
 	return 0;
@@ -918,9 +916,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 
 		mmio_write32(ARM_SMMU_GR0(&smmu_device[i]) + ARM_SMMU_GR0_TLBIVMID,
 					  smmu_device[i].cbs[cbndx].cfg->vmid);
-		ret = arm_smmu_tlb_sync_global(&smmu_device[i]);
-		if (ret < 0)
-			printk("TLB maintenance operations globally across the SMMU failed!\n");
+		arm_smmu_tlb_sync_global(&smmu_device[i]);
 
 		for_each_smmu_sid(sid, cell->config, n) {
 			ret = arm_smmu_find_sme(*sid,
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/47b390bac76c1ecb797ed6ed2d7c81373e1cc923.1601023807.git.jan.kiszka%40siemens.com.
