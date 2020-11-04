Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBIEVRP6QKGQEQJJQAZA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33e.google.com (mail-wm1-x33e.google.com [IPv6:2a00:1450:4864:20::33e])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C7032A67D0
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Nov 2020 16:37:05 +0100 (CET)
Received: by mail-wm1-x33e.google.com with SMTP id u207sf1363722wmu.4
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Nov 2020 07:37:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1604504225; cv=pass;
        d=google.com; s=arc-20160816;
        b=OcjR7DdGwBjGT398sjb8DElzmfJhWe4J6jkXdzFWb4Ksy+YtQYNUz7Onu0pqDDFixJ
         2+Ql/nliRaU4YnxxmwCx/0HuqMSEswZJ4CCsJwkq5rrUMkQ1uJGkuH3xucMX32sQfWDv
         asVayExWTJYFk55Rg9HWQRmXvzKrjIl1/LpB/Iwhypam94YISevjgquHHCAmZCN+U97T
         xtNHsP2AbXKMjRs+3/RozIG0L/+80tNdldhSa6lcthgjrY4wx4F6XMRjdiL0xOKY+6r4
         8KXhmIdfTUtMc7fWr7RVz1TC+9YDXpTeW34Gvy2SvtxTJ3oI0tqYAfnSEUS7V4GZL/uv
         iXoA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=qeVM0jJKEbv1I2rhRdm/yj5RKTJA+qyhjOKdjWLMOjg=;
        b=fII0+ZNZqCcYsMYnU3fhiXF40IKHeUB4moeoQdyhF5TmX5rnKRPXJOvx4y+fg+ISZR
         lV1uQ9YW8AiNMZO5oJUOgCcumrUoqAVMl/lsmnBvCrnp1+zh4S4/IZvc8+IlVTQxDYoJ
         0n2vqEH5dIWcx8ieMfwpuaBtwhUPdWbw49e6YyNxgGZ//9KEUKJRQav4y/K/ByrE4kNi
         NR1Q1dI8U5hXWk9zC+iL2qRwEw+b6y8Cfe6/Rc5bxFfd4Fl4JOeKKRDVXTFsjiCbmbqh
         NE0C2GseK2gSkWNAx2MDtMxvwMsy6xXVyTUXLjLAVBBr73TFYQv5pmfS5AiBNsZbsFZY
         BRow==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EigpXCHp;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qeVM0jJKEbv1I2rhRdm/yj5RKTJA+qyhjOKdjWLMOjg=;
        b=USYxv2tUYgeucsN6eUj8H3oSLSHG3TYASX4EiAxmT89nlY8Ilmj8+l+WQ6DHfvGZ/W
         9NMYH6c4o2NwTMk0A+8qN3yOPltPLQrZQaf0xGcgJwyVaqAcCeicJYGSnE+iHyDYSOWd
         P91bByu+QgFDLu/UEvE6hZnOKOTUTkMXicKbaDHFSSVsks/qkPPQ6wYmO8xS8bChL/F9
         Ncvfikfk2Uhh8hUQ0rDb/f+lfgw0kh3AKiyP+HUmSt5ax35XwO6J+vOIo+4F1Q/kKF5d
         5kvFvlb2IFa0pNau1uRN7QPWH92J0iDg8uDNWM6o8sRFFK0KYxjerVXM24kywlJ6MxQy
         bjww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qeVM0jJKEbv1I2rhRdm/yj5RKTJA+qyhjOKdjWLMOjg=;
        b=E/PkDO5W37D2caQrC6PIlWa/g7MhD8Dq5ncybMkRC6LWDUgyLlTEeWswxQwRidrJIL
         lahmUTp7eP+1rId5Im29sU/MfrIeryqdnJhG4DmCYcfoM3UFDlCoi7nYqMzySGr/+gLZ
         FUr4bM/kNxNwcz+TKPMgAZZ6EFm0RtKZSyirpGah4THbC77z8VsFpoFuNqgrVFfEHfQc
         owrV8Otfg8s9hWzn+duiHTlYZko6vlbW6f/HjnEsQ12Ci0HoatLqnTBSxIevObpxF8hp
         Sczbyh5a/0RtPwUJYJFQZJSzLan7cOJw5z56LBK6g4ERloVoml5PwJn7qJaHAJz/JdcY
         VJPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531v5xwxyGLb3EN95yaaiSfWEF7OA3CNlxSnkSA442B6BYe9Kp9N
	oYhT9K7OYO8cKSwwYL5H11k=
X-Google-Smtp-Source: ABdhPJztnibgPj83jakwJ1x/qsOwXRZcDYbJ2g3WsaK+9IatjoouN8JI/L+7hGQSRtBC8kv5tBpwyA==
X-Received: by 2002:a1c:6856:: with SMTP id d83mr5489853wmc.13.1604504225005;
        Wed, 04 Nov 2020 07:37:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a544:: with SMTP id j4ls3337847wrb.3.gmail; Wed, 04 Nov
 2020 07:37:03 -0800 (PST)
X-Received: by 2002:a5d:6688:: with SMTP id l8mr878959wru.360.1604504223762;
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604504223; cv=none;
        d=google.com; s=arc-20160816;
        b=VQ/3LaoW0QtHDLva+HnlITqfXzguoIl+StHDNe6akAL1PSApUuSo1x+Lxs3o0RH9e/
         LSG8pIbZCEF+BG8uRAvEYzQLva37mZvTZUpwNvXg+sY+m/+FYMy18Oz3nICxRQ1ejOGD
         apmCIJh0SI5lpbAoJSovYlY/Mulwkros1CqHvFYJ5DHQNCbnN+q61yWZjK73RpN+oLJ5
         eRO2qtLwEgicQf3H3JbZB9Mi2bPQsW/1MdVcy5xHRqkWGyvKEyUI+VOFT+nXd6FomLj7
         Eae4dCDqlDHd7fnOEuIr8DIbTZbph3FM55dXZ0Z23qvOUjJhHGtsrn1QpQO39aetZm8L
         OJww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HeIJ5miIZg9ZKG5AjOdOyfwsB86ygA+NIJvSf3kofxY=;
        b=fMdAE8miussOpjHKA+vbS2Nb0LdiwQYQn4+H5C2qzlqLY0GiiIUbO+olHd/q2MrpCX
         XKh2vjecO4IEcPgWgwltDupEHiWMsLry6B+Wj1tjMrZW4pAR5uH3ZUub7MCHheLLeIgg
         looj0JphBnbo9QxSeyeJfZy68fQQkVNLhuviM0pA/+3WWYiC3CT0vsFrvagM8GY1WOjY
         uAkBuS1AIQ1qKBN/EMHVpa8e82XqFS+hywumIBhauT7Feh9xlUaC6I1V8HvKJxvdjKig
         HRSpJ01Vp8IrYDOHQGlGBHwSYMNB23xApNLb6MKjq0sp10M61G7e5YQ8iNsCW2lZfm7j
         tR1A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=EigpXCHp;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [2001:4ca0:0:103::81bb:ff89])
        by gmr-mx.google.com with ESMTPS id c20si141823wmd.2.2020.11.04.07.37.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Nov 2020 07:37:03 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89 as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff89;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4CR9kR3LcczyS4;
	Wed,  4 Nov 2020 16:37:03 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.877
X-Spam-Level: 
X-Spam-Status: No, score=-2.877 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001,
	LRZ_TO_SHORT=0.001] autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id rpnzQuJIcUn4; Wed,  4 Nov 2020 16:37:03 +0100 (CET)
Received: from kabal.ads.mwn.de (unknown [10.162.12.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4CR9kQ6kKHzyTX;
	Wed,  4 Nov 2020 16:37:02 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com
Cc: alice.guo@nxp.com,
	jan.kiszka@siemens.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH 3/3] hypervisor, configs: remove arm_mmu500 sid_mask and update imx8qm config
Date: Wed,  4 Nov 2020 16:36:48 +0100
Message-Id: <20201104153648.35076-4-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201104153648.35076-1-andrea.bastoni@tum.de>
References: <20201104153648.35076-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=EigpXCHp;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff89
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

I.MX8QM fixed mask is factored-in into the stream_ids.

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 configs/arm64/imx8qm.c          | 6 ++++--
 hypervisor/arch/arm64/smmu.c    | 3 ---
 include/jailhouse/cell-config.h | 4 ----
 3 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/configs/arm64/imx8qm.c b/configs/arm64/imx8qm.c
index d63c73cf..566fd0ad 100644
--- a/configs/arm64/imx8qm.c
+++ b/configs/arm64/imx8qm.c
@@ -54,7 +54,6 @@ struct {
 					.type = JAILHOUSE_IOMMU_ARM_MMU500,
 					.base = 0x51400000,
 					.size = 0x40000,
-					.arm_mmu500.sid_mask = 0x7f80,
 				},
 			},
 
@@ -209,6 +208,9 @@ struct {
 	},
 
 	.stream_ids = {
-		0x11, 0x12, 0x13,
+		/* bits 30 - 16: SMR MASK
+		 * bits 14 - 0 : SMR ID
+		 */
+		0x7f80011, 0x7f80012, 0x7f80013,
 	},
 };
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 191ff154..d2824985 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -157,7 +157,6 @@ struct arm_smmu_device {
 	unsigned long			pgshift;
 	u32				num_context_banks;
 	u32				num_mapping_groups;
-	u16				arm_sid_mask;
 	struct arm_smmu_smr		*smrs;
 };
 
@@ -564,8 +563,6 @@ static int arm_smmu_init(void)
 			continue;
 
 		smmu = &smmu_device[num_smmu_devices];
-		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
-
 		smmu->base = paging_map_device(iommu->base, iommu->size);
 		if (!smmu->base) {
 			err = -ENOMEM;
diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 472cb4bb..d6315489 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -279,10 +279,6 @@ struct jailhouse_iommu {
 			__u64 tlb_base;
 			__u32 tlb_size;
 		} __attribute__((packed)) tipvu;
-
-		struct {
-			__u32 sid_mask;
-		} __attribute__((packed)) arm_mmu500;
 	};
 } __attribute__((packed));
 
-- 
2.28.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20201104153648.35076-4-andrea.bastoni%40tum.de.
