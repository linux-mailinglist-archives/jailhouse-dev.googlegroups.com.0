Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBPFX5D5QKGQE3TUQHYY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63c.google.com (mail-ej1-x63c.google.com [IPv6:2a00:1450:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 8401A282CBB
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:13 +0200 (CEST)
Received: by mail-ej1-x63c.google.com with SMTP id c10sf457859ejm.15
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838013; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZLD7vTEWUDFcQ/3O+s974JSCOYRj//vyWrffYPtlr7cjbfWxpXP7IzXfYCpvrvUB8D
         GbFvV5XCFA8OAzQTDhMC4GNWEwzaaX3K10PgEdy0SVvc//mu/7qiVJwX/wYejd0hvSjP
         hUZQxl7pEgvLpsmzYe3OuvTkJ/2X2KWJ1IrBKjPGfKhYeNqk6ZiLEu3FlX57svEDvzdo
         pqzhdJKgOq6dCTSl60fBSAfcmI/bCHbFWIiUJs3XlAJMAgnMznVaYFdupHw0m+Jg3+3K
         KjijnM4TbREQWeKZzKZ1vVhM5YNlzV9EWalYKwljwpczH0o3d6iENQSwp+Gmr/wt84wK
         9RmA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pJGegC1H01PEFTTkOuGszwHNHLZso21Qtrsu94sK1wg=;
        b=IN/6clEu6txleGcHFRC4AenvMcXqCl32OYWVxPglKQroTj/fvPiBQQ1j3Ex/S4wrjh
         GmqqjIF3Zk6ixYwFafyZ2G4i6KbL4Ae071flaYm8fPBLVM8hzAh0I1eyzG5twpQOXjN4
         +uFXCtKEnrcSMsfAc+Vy7fQol8v8uhrOSMum5OICRFM8EjdHekGWL0xRCq/0q8U65/WC
         eXXZhH2NGZeXIpdyj418zIHEVcc9GIV61WszhMAV+rPVgnico6k7UT1RCti3nn6/dp3F
         2yV46bunpTb5CC2S2AG+B5z0b7y+rl7UJpPa6hqbckMyaSiR4cycj/klRY+2WBbuq0yg
         0ulg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pJGegC1H01PEFTTkOuGszwHNHLZso21Qtrsu94sK1wg=;
        b=TaqIAgOsw660if6L0ATFg0HPAQNsphz8ENrffCfsxY9j9YrDlxlbk5D2nIeRnbbx3T
         usHL1qDYjGwjq2ktHi0IbzWMyhonzx/XV82Uu32RJltBkmuskllostVAsnzvc8G6pErl
         pQ6q5zoUgWZj5o6mJ8/lgKV+ZQQ9V91Z64lN/jc/dNDeUy58VqFSX+AB1Fs1k8JjTxJi
         lD2Y/vO4MT6F928nurmsJO3SR4eXAPWB8+UGRvMTn0hU3gtJSeOd34bnNX4jKvVYzUs5
         T/6wK6VZy2d5ZHgVqIgwzWib+OMcdUFKP70f7rM7Ry4bOgt40xmd1Eawr0OD9uEpAn9u
         OYwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pJGegC1H01PEFTTkOuGszwHNHLZso21Qtrsu94sK1wg=;
        b=Fypzoa5QlN5Ba6NHN+Bb6HAOQ/ErbzJ/iMcz17MZwF0bdtV9iJq4Yye8L5m4I95Ti8
         a9IrMGgstYtfS4U0rHtQt58j6hBYZBHW37DAc2SKBSAjE1150P1vgCXVnBa+LOvqry4w
         0bijNemMf/2Pbw1zsJdWsR4X5WryeOlW7ckIMa3tOITr1z7In8nCwdfOuA/4DP2snkGb
         dhVUdKB7IcFRO8RS+F/joZub+iou4EQf6AkxERza1hag2RsP9AshORY0s0CT8m1Cftyl
         TGB/nZTksEKzSkiBkNAGrZ/0VOgjruYoRNCVMZFj8YcUNTVzKuxBtdBu3OhQUq3ZtDX4
         nkjQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532PURrziYNbdyQnJ8ws+du3nPPqLJNyoE7xzMKgz7P7N0YfUfE+
	OOuBFWD1dTMzsF+HOs0aMiM=
X-Google-Smtp-Source: ABdhPJxWT/mGBuATbb7eA+fqMlqRk/nugND79cc8FkroApvGOkOxcP50RYe+xAT1y+HbpdnPNTJdrg==
X-Received: by 2002:a17:906:1107:: with SMTP id h7mr3447363eja.481.1601838013249;
        Sun, 04 Oct 2020 12:00:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:39d8:: with SMTP id i24ls3130624eje.11.gmail; Sun,
 04 Oct 2020 12:00:12 -0700 (PDT)
X-Received: by 2002:a17:906:d8b6:: with SMTP id qc22mr12178722ejb.196.1601838012183;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838012; cv=none;
        d=google.com; s=arc-20160816;
        b=mvO6DAlESSPkAsEgpoQfWyfx3Hdo/smrFF89Mmtk+soWYL68C2vS+7Ejg55I5KztWJ
         Ww4XA5UGYpyiXd/u8jMPK94+Dse8BEf+TqOzoJSSFfdmgf3Vl5ypXyuIu2BY/WbF9COT
         ntyxFh1KV4pmmAIMiw/psYHDS9yXULG0VpITV0WZ1mlU9pfkdtgLHXZHuWuWUD893YsD
         KOp3vXZqH4tOpR/e4E45kUtrhr90iYxxiHonEF/G0OvUNk9njSKNseL4bI023mqJXbai
         PDTq8NKwnQsSdrGbfCCxIA5VvCCZ1mJQXfNg7leqUmEc1nI+EkUo0BqyPTWAAkQXr86P
         NhvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=E8U1ucCev81hCK7sef2Ph0/gRNOyjYyZ1515qr42R28=;
        b=zVQrHwUoDnB4iOhirMB5bvHgBlFjDvNkR0nNHwyi7P0yQTop3xD5cJ8Mno8n+jBudl
         kQNwafXtS+dq9MyrjJ95Pnz7ZMSkEzripEtOHNu4pIvqzK5mOWvPcqONLFiqIjzPXGTy
         kIlbP2Qpevm/aOAZTDFLjkjKKDpG6LPvc3uN3qwAMnepaH7qsh54Rh9jebHVVtbXxMtJ
         XmWXg0h5aF9bJO7IJmR7Onz9YfArmrN6XMQqaiYOUePHs3LPphddFOf0HIlp8fHYW8kJ
         YpFMFEU5lh/5JIltApfUr/gse40B8QOfcJy+J0w0eYpLHIjrmdOp/cTRl9sztXtEUB6H
         Vd7Q==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id dk15si271234edb.2.2020.10.04.12.00.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0BDg004325
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060U017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:11 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 18/45] arm64: smmu: Move S2CR macro out of sysregs.h
Date: Sun,  4 Oct 2020 20:59:39 +0200
Message-Id: <1ac4c4aa05ae925a87ad07f259c86157d94277dd.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

Misplaced, they SMMUv1-specific.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/include/asm/sysregs.h | 7 -------
 hypervisor/arch/arm64/smmu.c                | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/hypervisor/arch/arm64/include/asm/sysregs.h b/hypervisor/arch/arm64/include/asm/sysregs.h
index ab813809..868ef887 100644
--- a/hypervisor/arch/arm64/include/asm/sysregs.h
+++ b/hypervisor/arch/arm64/include/asm/sysregs.h
@@ -183,11 +183,4 @@
 
 #endif /* __ASSEMBLY__ */
 
-/* Context Bank Index */
-#define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
-/*  Register type */
-#define S2CR_TYPE(s2cr)			SET_FIELD((s2cr), 17, 16)
-/* Privileged Attribute Configuration */
-#define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
-
 #endif
diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index d63f91cc..0fa3b0ca 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -208,6 +208,13 @@ enum arm_smmu_s2cr_type {
 	.type = S2CR_TYPE_FAULT,		\
 }
 
+/* Context Bank Index */
+#define S2CR_CBNDX(s2cr)		SET_FIELD((s2cr), 7, 0)
+/*  Register type */
+#define S2CR_TYPE(s2cr)			SET_FIELD((s2cr), 17, 16)
+/* Privileged Attribute Configuration */
+#define S2CR_PRIVCFG(s2cr)		SET_FIELD((s2cr), 25, 24)
+
 enum arm_smmu_s2cr_privcfg {
 	S2CR_PRIVCFG_DEFAULT,
 	S2CR_PRIVCFG_DIPAN,
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1ac4c4aa05ae925a87ad07f259c86157d94277dd.1601838005.git.jan.kiszka%40siemens.com.
