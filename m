Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYXNTL6AKGQEVOMGEYA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F8228DB72
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:23 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id b8sf1022421ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664162; cv=pass;
        d=google.com; s=arc-20160816;
        b=O+ooKih10JW14K2rFfmEkAPwwBYIq+reKGjBYBAX1stkhfWKeNFBZcJJdVz32csSvG
         QQu3tSkshcyLR41c7c4yug4UYOyguO8n+DznVLCFzW1opv5prB+O1QiszKEvx6Ay6713
         gg3HlmBpHQYRNxAzpvR8szXRr6wX7YMjTYTdFiAY6RYf72b0VI6ihqpznPGJRy3YCbLy
         IuO7CkkEzkQ14S8w44kQ4P/kQNagTTg0KuUQpbFBomoTMePyh24A70q3W5JYqkYk3l42
         po7eaPh7yHkOTFeXin8fHnJOC2z6qiDEGQyWkdZmSYZq/h8tuZvqQgyxW+Zv1oQ355Oz
         sCig==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=PqoCz+b3moJC51/RkfVx6oPj+Il8qqGRVaw4PD+bWlE=;
        b=OulEqD8TkGxCP504kCf6/M7cExbv1bINRveWgARvzYS7O22PUuWqCDb7N6MLm+MW+8
         pVjTZ8caoICk2PVT2KVs4igMFwfKbzw5KAqHDegL5oAY4nOoo+hhd/CrWMov+yJs+wvf
         zX/CNvARToF98JfpBbaknDEvJac7ZL1D7ligSWgK5gmL5XZFCGB/cT9ZKCw87TEm11yW
         47RWuFA5EQ6qW07KshsTqR9T93zgz3a5XG2ep6n+plUyl7cCCHIs4RkSetD9ef4stsgn
         ppal2BbdqH92W/DRw2TN41YsBHDVSsoxzOz1SdpzSNu4vDuDkqbXx0tBffp/qp5dCBzi
         dMoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PqoCz+b3moJC51/RkfVx6oPj+Il8qqGRVaw4PD+bWlE=;
        b=Cv4qKkVLjBpxTnGVErmUtN3YC3Q5hJEC0Mwo/2gVMZWMpPWacSHrQuh4SYbTxW6LY9
         TNwvzm0l5hutt5BVWMG//hLu+oY2VGXj9BCTuzAS9Z6sRXdqqLQQrJlqSqr/lZCtK/fJ
         xjLOCbxqpRurj/Bz94qqZfgsZNoq7zZthgkA3mcNokCqKhnklJVNb67XqPuMVINzzLs/
         EiAW5UpgoV9Is0scgRgiw81MpaO2iJp9/tV7Vfx5OeJHRVNgjRi4iA66/CAY2LZEXtgA
         X4f73RhjsP3uWYO8nTGhlI65ZkH7HVaAMiJNwoQMWHwv2xoySo6Fq9JNFy0A82Hozurx
         ZXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=PqoCz+b3moJC51/RkfVx6oPj+Il8qqGRVaw4PD+bWlE=;
        b=NN8L6HGmZaHVpTmlTRM+CmTRjUxe7Y1fy7ZA8bCq/zfA8XiLmBWcigZgg2nDDrmpeF
         /IR8IjpbRO+rTyiEkgAFDbyxRtUoYlRw4LOqIPk/Y5m+OjCSQsuTf3M6lvC8Ya7TD+67
         dXHLVtwc1xtDAMPeFFZdsTFaubF3uT8ou56yVrYFe5NjyopvMW6eP3wqlVKkTrBnEPt5
         m+rZ13H7yFrZ9cNeQuwRz3W/dgWGZxVHMMaHpN6iUSrbWB4QslcJuRHIMH3vqTWtQBx/
         +CWRD2uztt6iWglRjaesQ2oemUT5G2XjEJ1o+E2rBLNoop5PVtwtOc9PhKnY2ELq5Ji2
         Tpgw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530prYnFa3G5cyYTv2WFiGtHLpsjkJILSOfPpY4H8R7Y7fjMNGps
	b8nfqWePgLBoG0xaoFYDZHc=
X-Google-Smtp-Source: ABdhPJz70ztkYaRORb5HdPXcnuxN6bSOv0v/rr0vZRxr96nCXpRRXgdUcVAyOj3Qz6nJHV2mtOR5Gg==
X-Received: by 2002:a05:651c:1205:: with SMTP id i5mr1380605lja.47.1602664162814;
        Wed, 14 Oct 2020 01:29:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7a0e:: with SMTP id v14ls487983ljc.7.gmail; Wed, 14 Oct
 2020 01:29:21 -0700 (PDT)
X-Received: by 2002:a2e:8787:: with SMTP id n7mr1433208lji.111.1602664161727;
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664161; cv=none;
        d=google.com; s=arc-20160816;
        b=Y487dvGfn2H3SE5omtiYQ0onTpBXN6lj4m1yjn5znQzNRxNvCDfU+871q0BUeJm/XP
         DzLoO/sIgBn0docEcXMSukoT9RNOMNPXrFHXbKx2zkRIQojCxNnFTN7zb+RcMIz+qPW1
         LkM+ZbCuw5CXdycVx3515PeaViBPjWEhyiEIMD8sTzyzCizY9V9K31tfYbMA3Vr1KYqq
         l0fbAXGKbCFeDsk5wz5Ugr5uLzHGt/2mTPNutL+fjPsLpTsrZI4wLGSKYR0AJAd1nUDF
         5Ik86J8HwHYYDk+eVJnTHaXT8ZFFs83gwB6QY90WpfJFZBLQzs/XQXsUd575eZL3LFiy
         1sQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=AeEdRcyR7BSYcq8fbMUBbV+yDnu5DZriEbmWFX9c0uA=;
        b=K9o0BSI03nWLfbhXnrGH0GHVO7Uz7I5LkGIKzYPNd5/IiN+m7kUiBLrJw1hGWt5i2I
         r2Q65kLTRDnjoH6HsOpvfiWEDrxA3F9Gnl1sedHYh5OaBM0np1lY7NhhdkP9ic+2vs6K
         L5TpZQWDrZ/quEvcpzQ9WpOSb4E9O+11iU68lRPCrRzWClkU2V69Aa0z3IYYKVN7SPBv
         rhOkIB8AIaMRdJT6iBgFskxcD1u6q3cqs/DEc1/1VQr95ubLt4hK6Cy95+uSg8ZZVrHQ
         avcTVgAK9hXalHMvXVrNMy63Sn+dyQ39QCcr6W9NT9mAKioBi7mOPK52x2ZTVTKn+9A7
         O9dA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id o142si61503lff.6.2020.10.14.01.29.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TLBZ001721
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:21 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJT002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:20 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 43/46] arm64: smmu: Fix CNn_TTBR construction
Date: Wed, 14 Oct 2020 10:29:07 +0200
Message-Id: <da8efd8fa8c2d789e4e4bf9de680103fc5960997.1602664150.git.jan.kiszka@siemens.com>
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

There is no VMID in CNn_TTBR - stop writing to reserved bits.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index e255e381..eb79711d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -229,7 +229,6 @@ static int arm_smmu_init_context_bank(struct arm_smmu_device *smmu,
 	cell_table = paging_hvirt2phys(pg_structs->root_table);
 	u64 vttbr = 0;
 
-	vttbr |= (u64)cell->config->id << VTTBR_VMID_SHIFT;
 	vttbr |= (u64)(cell_table & TTBR_MASK);
 	cb->ttbr = vttbr;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/da8efd8fa8c2d789e4e4bf9de680103fc5960997.1602664150.git.jan.kiszka%40siemens.com.
