Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ5SYT6AKGQE57HTTYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8C92957F1
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 07:32:24 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id u207sf189350wmu.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 22:32:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603344744; cv=pass;
        d=google.com; s=arc-20160816;
        b=xf1kLf9rL3kpKuyKiizA19EQsPojNLekduQnnltCT6M/iE05dHOwei9/kJDyqLSl9Q
         GRs/mFlwQvP1CZERZNFoL/n+oP7/1TaWQSCiUUf19inU2jkUnvkJuHO7A6tK20Lubfr1
         QNCIvN9FH9kg8l29YebMcvS4CFI/kz4DAKG1FlT4tHKwhfJe2V0xK6IuDe3mAIdFk8pF
         KJ/TuRP7cmRCrfnHHvizbeADdreo22PT0bwEj5KTzwpa9LBf9h7lH2QPMPfJpEk6kJGy
         IM2sqnt03vOn79JqpCtkmqkb603YRWm+tqMdy1ev9K44JxSNqSVNz1IY/bHS6XiI9FpW
         LC/w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:cc:to:from
         :subject:sender:dkim-signature;
        bh=TWrBA2SLaPBLCGYsHVarQdjCNnZ0G+Pwnbc0jk7J/y8=;
        b=ysEEiZMppg11dduqemC8CWKWm5rYdcwIvyTHvFZAy2yQaWE5pqn5o9dQABqexZUTZY
         uAB8y1sHwaE4s2W2aXHqVhwZPziB7wE0z3mgZC3OIRls682b1NLoYUBgdJy6+LwBy4n+
         RThRzlJz2Q3M5Dk2nQEQHLbQfVCWaHADaI2QdqLLP/THZo0AzjggiJBA+hhhK0nG5BaP
         XK+rdNHXWnCfdbznPdxegquPnoVM0GWMtQTNE1bndPa9Zl3/F+EO+lG2mrJUOl6oT4rU
         meXcAO5o3ENTYPfXXAJGnh1zEGetfakhU9To7nx/lPaN0H1GKQfu5RXPAwHhfs4zq2PL
         bl4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=TWrBA2SLaPBLCGYsHVarQdjCNnZ0G+Pwnbc0jk7J/y8=;
        b=gnUxdPe0UiNqtReaYLOITiQRw6DPF0JInIa13igm2vtO7PQEhfb1sDQs65HFw3q0L3
         RwFJy0zWrH2j23tEzujoZlz04edDA3Vuow0W9YibUk8QF5/7HBtjk/DLLWju+prVJen9
         cnu28bSgEbecIbMIu/mnA1JQhjQv+d9Mls1zM+KpPm/PrJSK/XjG+U0TG9tBL1lkMFcO
         2LHlk9w3zmKysLL+V02B3dFjuiUbDYVVyolJbtvF406AukYm3SeoF7Oixmx9qQcW4hs8
         EK52TykGL1fwlEunyqWKU1mX3dpfKvUS/OR9FjPCWxn+JWBI5n45KjHrS8kldnI3KrZ4
         vvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=TWrBA2SLaPBLCGYsHVarQdjCNnZ0G+Pwnbc0jk7J/y8=;
        b=WO0Mdo38+6rehPYSNy7pJqNPPSzMEafJE25IHuFdCLu0/OlKcU7NqAIYsgfq02C+6g
         QrY2mXglZ5G79eQMDvPS//6AFIQFLfQERXsSnviZKKaaJgfQmle4ASBL9D8nyDaIk+0p
         2IuQl28sDHALJ+A2+0iv8WRCpsfvQBygi5zgNT1DCSN+NV7xIfl956rkOx+fvV83e/6S
         LMMk47jbyy7b7YRI5V7PuSwZO4H9E6pQXGyN6gB6x/bWFKerqSAPTs2+7f/CMJ3jqqwC
         kAaz1XADK2veJDbMtB/3764WzLvBT7dbUjsWfaFFWjgpaORZdo4kbH1I7ePl2S66bqBC
         z9gA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530e4sBAj5AQGoLgs1cv/ACJ6+mczWgh6Y3eg4TI463RsaFH1Ayz
	Vf4V5fNT1jPmSmu4pQtQsyI=
X-Google-Smtp-Source: ABdhPJy/W/b/2tx/psvGB9ARtVFTbkZZ/EK/jg1abcHiuUxs3EafrubG1oTMOV/yxQcYp8BJrf9Waw==
X-Received: by 2002:a5d:6407:: with SMTP id z7mr748146wru.271.1603344743970;
        Wed, 21 Oct 2020 22:32:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:cd8c:: with SMTP id q12ls572799wrj.0.gmail; Wed, 21 Oct
 2020 22:32:22 -0700 (PDT)
X-Received: by 2002:adf:9793:: with SMTP id s19mr721881wrb.139.1603344742842;
        Wed, 21 Oct 2020 22:32:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603344742; cv=none;
        d=google.com; s=arc-20160816;
        b=DPZlIf8PZt+pG0KAVOm78DCbypIsUrHP5zzGJruIk4E7dJ5sQs27hA+QqqsS7tF8gB
         h9AcD4GUxktVQz/7rLqmPObXjIEUIRbCTw20wBqpxPpkoV5jhKAgaJ/8uUHIxsKIZnqW
         ZZQw+N8hyjdkIpxtawJeZ4JFYkgcDEtepA8VjdEAy/7n0cj6bVfzrYUF0BlqNbHYdM0H
         gsOLeMgeta1at2VRgDma6ZwUyFOvTD6n6rABzMLVW7jiGOiD4pjyXLOS7pVKTD6rp9Ex
         Z/qhprKhKn2NTqEaoB1o6vA92sWslplVMGeMra8qn9GpuX9ajZQyzfELQX50/FN/jwrC
         uAfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=LAsiO/Hem0qbhXfYU9H+eQscHLfda7ZI8PYe1myOoI0=;
        b=X8cKH10WwaqYBiXsAkCx33aQtwU2Q3RNTo26Srs+QYZFWL+jMeOvHmKe+pmgQS5An0
         ELeoA2n8SIE6MlMU7U+Wh2SK9tH2PQTiAYYi8IF9miMsoFOrEeR8DT1lViQlgSTSiccU
         IRI6ii3eBZbLH87wuA/hpQ+lh1KAbeCIFknMlZ0q0gXi2DfXW6kg+MI3jdQGQvL3NU0s
         WbEd7kZSsByJyGTzMD89FMgM5h+WB+e8CIr+7q7lNcsOg6+WEOmmnDcnYzn9JXCPquRl
         QlillB2zh+s9Q83z3CF8ZIV+l7jGxEX3dK6o5hrIeL0lwzkCAOrJlQywlgUv6xkcj7Mb
         CAMA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 11si15218wmg.0.2020.10.21.22.32.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 22:32:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09M5WMOj031826
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 07:32:22 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09M5WKHU003777;
	Thu, 22 Oct 2020 07:32:21 +0200
Subject: [PATCH v2 7/8] arm64: smmu: Handle arm_smmu_find_sme error properly
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>, Peng Fan <peng.fan@nxp.com>,
        Andrea Bastoni <andrea.bastoni@tum.de>
References: <cover.1601023807.git.jan.kiszka@siemens.com>
 <a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka@siemens.com>
Message-ID: <a6ba34f2-57e9-210e-e250-adbb6145b993@siemens.com>
Date: Thu, 22 Oct 2020 07:32:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <a38f43616d17b754095f52767f25dab4fe8b192d.1601023807.git.jan.kiszka@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Bail out if they happen during cell init - apparently configuration
errors. Skip the entry if that happens during cell exit (unlikely).

[Andrea Bastoni: Fix double negative in trace_error]
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---

Changes in v2:
 - folded Andrea's fix in

 hypervisor/arch/arm64/smmu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index b89291e7..9d1e5556 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -863,10 +863,8 @@ static int arm_smmu_cell_init(struct cell *cell)
 		for_each_smmu_sid(sid, cell->config, n) {
 			ret = arm_smmu_find_sme(*sid,
 						smmu_device[i].arm_sid_mask, i);
-			if (ret < 0) {
-				printk("arm_smmu_find_sme error %d\n", ret);
-				continue;
-			}
+			if (ret < 0)
+				return trace_error(ret);
 			idx = ret;
 
 			s2cr[idx].type = type;
@@ -898,7 +896,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 {
 	const __u32 *sid;
 	unsigned int n;
-	int ret, idx, i;
+	int idx, i;
 	int cbndx = cell->config->id;
 	struct jailhouse_iommu *iommu;
 
@@ -919,11 +917,10 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		arm_smmu_tlb_sync_global(&smmu_device[i]);
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid,
+			idx = arm_smmu_find_sme(*sid,
 						smmu_device[i].arm_sid_mask, i);
-			if (ret < 0)
-				printk("arm_smmu_find_sme error %d\n", ret);
-			idx = ret;
+			if (idx < 0)
+				continue;
 
 			if (arm_smmu_free_sme(&smmu_device[i], idx))
 				arm_smmu_write_sme(&smmu_device[i], idx);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a6ba34f2-57e9-210e-e250-adbb6145b993%40siemens.com.
