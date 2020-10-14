Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBYHNTL6AKGQEJ6INZDY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63d.google.com (mail-ej1-x63d.google.com [IPv6:2a00:1450:4864:20::63d])
	by mail.lfdr.de (Postfix) with ESMTPS id 40DB728DB6A
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:21 +0200 (CEST)
Received: by mail-ej1-x63d.google.com with SMTP id k13sf872821ejv.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:21 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664161; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hnc+Rwtu20l8fcAU+xB2N3iTUTagy1d+YvRfSuMek/lGpC7M03jLBTwUI52NlMPHi6
         9QnhSGHKETstXcobZkI3QQRqjwP3f5Lw9MsOOyK4PsJoMlj7scBzUPQANfDVYGlDbKz+
         ujcuDgK2IkI0kbyJcbNqZ5GfAUo60Ryoat0NFFSYuwNmlhv14O7Y6GCt0nDHe2fKYHrG
         km6iXMk/0c/GfGjaNvoYQDGVAb7lVKSnvpGEwHE5Ei2tVo6EXedCyHC4YkZGwCUkkgd/
         RptANcHWQNlyGYVY6pUvze+lF4FAV57c5Gu8fjdjldchwD8e8yjimBCZK4gzmfqtqfXE
         oaiw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=tFwOA7XTRuNowRou+cDFYT2TPW6NI3BRARuAMAXqS90=;
        b=ggX2Eat/xdqDvzqKJzmkev4KD57TEze+j7l31GfFfOYtxEjxc6YXc1pAgpLBOqepWR
         o38PkNpWVCSh9lIUnfOJmlzZahERucuRxiksT3sP3p5BptQQVvIjEB1yCa7ZPVH2mNtc
         DsKGVWVQ3aQVl48rfmi9IUhXnK7ivKmZFg8bwJFC5pxd/c2FPaaEK9S5RfU3lfufW1/o
         PCYCE34m29ww/aqJd40R+G7mC3RCPbDm+LQQiOwqEt0LFunbtitI7L+qwK4DY1ofyUwA
         05yk955fBKAVbAT/r03sF905lGsSvupiHiE4cNxmOJUIVnAWIxRpv9ctv4DIk47kZFJB
         LhPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tFwOA7XTRuNowRou+cDFYT2TPW6NI3BRARuAMAXqS90=;
        b=L2BG9LyRoVLng0WJcpnZI8jgURfTUHVGQlEtxmlvPLXRI3ueaEXjeQtyJ/MgdFMTYu
         ARyIbx35CGh047cVZgJf87hWFJ0bg7ukFU3pEmozB6TQVb8uk2MjgH+cQNwzYvaxzzoZ
         D53vjUZHoNSvnWbxdFGDX6rttqIbPui4hnZtOoNA3IfBw7zNPvHW2vHjRipEShPTgMTZ
         1WLMOtW1Tc1nch0avvEMwTip73IqxGo2BEd1f3tQLw0cLIHsBc7hqpqqKQY7KZVklNTM
         6Ake5EDvo6DGP3GN5Ka4H4kXlXbnNBg7RqeZXuAviEofvEa55q1rW/CDczWUYeWjkK7p
         puUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tFwOA7XTRuNowRou+cDFYT2TPW6NI3BRARuAMAXqS90=;
        b=FEycGxabBr1OV1R2YTLkwYenZPFAkTjDav1Qb2Z4NcbJCnZNbAmT0D7VuVpK+7j6At
         xO4xpZkjM5pEYmam6cz2GRAig/DFAiJKqkZyYayHlddPegwEImkkjBPIPEIWyXwbBzHp
         iGCxMNrVNUF/9Z4YikukLnZAJSYu3k/a5+vCfMydKNTzOF3cK6SsmmaiM5vfUSTN5+jl
         3IiVSRQFiZGYBGLOWzL+cvjpaSkl8O7yUQORP+rG88WGiqWnEmKmR6h1RWJius4ypaKu
         xlhY6VeSkJ7j0b3Em+Q/GIpVAHZ3zje/5RiPsTevbB8tDOkZlWVh71ZdYu5cwa5pCFYO
         PxMw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530wSWORnGTSeLBN9wtP4nJiJmd1ea8BM7Wm/vpEuE7EHeHHiBpx
	QAL2l1787teQzNHkCcPzrtQ=
X-Google-Smtp-Source: ABdhPJwRWbQhxvQUkpXEC3ti35901FFe05znCQgP7Jq3VlBQxxlwMjfJWmNQ1JKe7VOu+EUyTgSLiQ==
X-Received: by 2002:a50:9ea6:: with SMTP id a35mr4153633edf.52.1602664160975;
        Wed, 14 Oct 2020 01:29:20 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:160e:: with SMTP id f14ls2614205edv.2.gmail; Wed,
 14 Oct 2020 01:29:20 -0700 (PDT)
X-Received: by 2002:a50:ef12:: with SMTP id m18mr3957887eds.313.1602664159968;
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664159; cv=none;
        d=google.com; s=arc-20160816;
        b=dY698HmbAzsC2y5KdBHpFxxPYSJfmPAep5hdmspBtsogeftxAhV6ZGKPwZI1L3B9l+
         xwwDt62jjrsCWDVdhmAqu17BTa+5sDxU7hkG9oD6j+sg/l8peQlHdncpEaloKnO4lG6o
         SyYMf4iV2yNPTasbLcQdjdJr2JHsPk61JTUM/TZ/XpvjcF5A2tdxoGQVP1Xtm2dZ1jHl
         oEqMF188UKRMtDl5j+IBsFmpTMFr6Q53dof6gNkR8IyGKpZDCBfYoW56AgCS0Dvm2e86
         plcZPTYocdHH5LgqKyZIuo9FJ3lFTpMsMNIfealCJyN+L9tBhDNRgM5127YjhOP6K2XO
         cEPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=EUtND4o8pFMsZb0R6DyHTo+br3IvT52pNHynkLeT2cY=;
        b=TbCB9H95/XekftkWcqKbUc2SLP4zCdXjf6PsKAk2hqQ+8plI6sN0G8FcKUvq8SmLPj
         gX0A1t7Pa3w8L4ciS03L7O7TdpskoMA1PLK9aKa0d8zZN74J9qa7ziAwi2kQ5v+uQdKo
         1V2YKhL/h8VC8eqDD6EPTSra3rmmzG1CJa1P2CADOHXjNBLIA/SI2GGbjTc28SkGli0m
         BqRK3FGlnZ52xp6+3joR57Rtrrup7eqiKJDoQA54mK/T0AujPc8aZgmfHGTCINDk0DlB
         cvDvAP6g3/jQtIvQR47T5HoDQmgZnjfkx69JTWK2x3GkFlhrRHwawLNQzErac4+im2iI
         bY8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u2si70845edp.5.2020.10.14.01.29.19
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TJO5000370
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJN002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:19 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 37/46] arm64: smmu: Check IAS and OAS against CPU parange
Date: Wed, 14 Oct 2020 10:29:01 +0200
Message-Id: <ad1a6a8417011e2aef94c8d57d96fe09bed52821.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ad1a6a8417011e2aef94c8d57d96fe09bed52821.1602664150.git.jan.kiszka%40siemens.com.
