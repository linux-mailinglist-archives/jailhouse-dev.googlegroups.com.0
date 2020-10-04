Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x638.google.com (mail-ej1-x638.google.com [IPv6:2a00:1450:4864:20::638])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E7282CAF
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:11 +0200 (CEST)
Received: by mail-ej1-x638.google.com with SMTP id i21sf1303407ejb.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=IdP6YeFi4qgAno7aS0RK1EzGGnCV7y09ZoMzeWQlFjVhVuTwORmj5h17PcvIzBu+Uc
         KrvVQU63yDLFHag+AEjc46UARWe28aYMbRi4Y9nNsjzFt9A6lJXnuRpY0pLhhMnqaJiu
         fJIn8quYKDKA4I8Pzli/yrC4O9mEOgA9FuhkYFBV3MlmlKBU1P71yNsRMgbv3KnyUEoz
         ihpybiVxBQ7DFna/BLgBztzd8x5Y6WuyTHkw7JbOAOFZfg0r6WvKBsSM+nzi+tKJTpbJ
         46/MQsta7a/ER86QcBjv9PWUvMc5DUMYI2xxg3bTgfT4DCG7W5gjrkGxg4SMgKVzOY9T
         yumw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=nbxMNZxV5+bkzkMOe0JYm5OYl4W9YdQu+vZP6pXkiBg=;
        b=oL5zZ+szSpVSpsPUkzIStPeuLura6EWj+NBF7esS7prZl6QfROPI08rEFwTdIMR/Py
         mBd7GYYgs9BCyY987CaBrFPlnfPvgAuJoiKJzVoMbVJO7F3VCPw6o3ijS0OEF/I1FbkF
         FobH2UhVH0mVczOCf39cruKIuol9x4170/JebLLP/5tFtuv7Wo3RGBvTe1XGZl6EGq1V
         DT/ySffBYXchAaz2w9ok+6ziJgoRmwE7bTSa+GMSDzeReV32YZlaSKjZP5tkJZxTpaQ6
         947TFEIEvsVLAvTY6D+NoiQt/QCK3/JY09PQLmHPHRRpsvV43dg1AcTZlTdOjsFUVYBv
         j49w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nbxMNZxV5+bkzkMOe0JYm5OYl4W9YdQu+vZP6pXkiBg=;
        b=j+0kCPRGTv3bo21BpxKqw4O0JeV2VqmoCmuhHYO1FFaK+r+mxtJNdY59rOaNd9b6vf
         5JjJnciLfOg9LID9lGcpD39EYZbA4/h1KsyXiDSEhgqtCcIHbbOXw6E2xif/p5rcj8lY
         oyZczCaavRp0K+ICO2ifObXt+NiFATqkri/R8Y5XGuQDX35WV8noKExDsnUCe+09ikaV
         s/lc96ZpyZwUr9tEqjSRab8MIj4RxrcImjh8e9Mz64nNy0AO6hMqD7Ix4N0kDK1+jF1v
         J6IFqXSO+4axi4Oz5PSpVOOlWxR5V2zzos8fhsmTXQ7vecOoBxDkzCE7Q43VtSHVa4JG
         JkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nbxMNZxV5+bkzkMOe0JYm5OYl4W9YdQu+vZP6pXkiBg=;
        b=LFI0Imk4gpoejXqpTaS6qRtI2VTdRUDWBGMIfaCjIwISaJzwjhjdLRNVaiCCeC6asm
         LELt6W78mJ/FBetzf/FQzSTPjG+/21W71cPI0bS2waT4a5kelyVA6kwXQy8TReD0MsC+
         Jmkf2pRrnyHn4R64JCiZYVXfa15awDG5ULZkVrWd4G+pWcMUGYUkdWGIPsmKmJ08xpNx
         pQl2ZchqGDAMRmv+7fZxS1LMzDGcl+pDP5sLJjrxEWyH4WTbKiZxogbzHSsgT12JN7Ec
         AkqXkKESkc4Gs5FaLkHkxQo15dYy+qc3Wcjq4jhMeQpGC6DXSsZo5uX6QvFjF3EOtLuK
         /JGg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jACRjKyhAqZ2oY/14QSU7iBjY9AKKY9pYYoTMKK5OvO9b27Vp
	xIH4RtwH5OPNwLYP/JzedJw=
X-Google-Smtp-Source: ABdhPJynoXzMfPYqKtQvQ4+4hpp8hW5RM0S5eC7Gq8+ccjR5NihS4UcqqGlxyj3rNSQGOeIek+QniQ==
X-Received: by 2002:a17:906:c18e:: with SMTP id g14mr12376641ejz.416.1601838011442;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:33d0:: with SMTP id w16ls338370eja.5.gmail; Sun, 04
 Oct 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a17:906:80c9:: with SMTP id a9mr11348448ejx.235.1601838010211;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=wE+/1lpN91RvWh0iIoAHcRSv1cKSSrsmQvnsbB3O1iekW0c5mk5Ngjn/GZjSpw1+QY
         FgIxKp8JcmIYdav4vcn7mpzPY+aDcSNnyJ5dVeGjWqXpwMRvAEKMQgUav5BnPtW3WZlF
         +vgb4xUHfNId+q2+J8P7GO2OtKDM0rZPqK9icWuNkI9Vve/8rv1Ql0H8uNNQF/HL3Aca
         +oGgabgXyBUNGHwWT9+z1W9qEaprZ7N477BMiefucjkW0v9r/lzSnoFsSSI+xDrBZLvL
         1fcsowbjZ82vaY3DNhv/f31tLmN2Fq6opoaM5iPiqA1P2jhbKZ8fXZCjz0+itZ14wnON
         p3kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=qPOX8oYuuYpGiT2MEeF7pyf94qqgZ8RVuQIZGH3U58U=;
        b=x61B3fdLfoAD7LUnudPQ/IYohsVaIAMMMh/zK4cZ3nZAulU6jFvSgh/bNi6fPu/E8y
         S7+W4xjIcV/8/gg2tP9Nu/RNkMnBfqoG6Nv93WtqJs1TcmzuPzAaTx3lyXlDo7hCI07D
         Tc7FC+YfGgvh4DCopySZOpnHV3gtRdx8GACXY1OBjHpK6CQ0Y7TVmA6BwLbwFPPn9Bz4
         vmq0j3KfRKPXMREvGWhxTyxBEZYrLRmLf0nQvopvPLUSVUGfe3LjpfqJLPc0qwK+3yId
         uFjdvFJL1vmKkVPBaxqTitWvAuVG17KUJn+D1nlnfCXUEKVoyY/UsmY+yR8UczoZN7Dc
         PH+w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id u13si140469edb.0.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J095u020337
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060L017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 09/45] arm64: smmu: Fold arm_smmu_free_sme into single caller
Date: Sun,  4 Oct 2020 20:59:30 +0200
Message-Id: <51e75bc48215dad8e70f59c6b221eadfe4b7246e.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

Simplifies the code. Also removes the test of the return value which was
always true.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 9b3d59fb..94f65313 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -799,18 +799,6 @@ static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 	return free_idx;
 }
 
-static bool arm_smmu_free_sme(struct arm_smmu_device *smmu, int idx)
-{
-	smmu->s2crs[idx] = s2cr_init_val;
-	if (smmu->smrs) {
-		smmu->smrs[idx].id = 0;
-		smmu->smrs[idx].mask = 0;
-		smmu->smrs[idx].valid = false;
-	}
-
-	return true;
-}
-
 #define for_each_smmu_sid(sid, config, counter)				\
 	for ((sid) = jailhouse_cell_stream_ids(config), (counter) = 0;	\
 	     (counter) < (config)->num_stream_ids;			\
@@ -908,8 +896,13 @@ static void arm_smmu_cell_exit(struct cell *cell)
 			if (idx < 0)
 				continue;
 
-			if (arm_smmu_free_sme(smmu, idx))
-				arm_smmu_write_sme(smmu, idx);
+			smmu->s2crs[idx] = s2cr_init_val;
+			if (smmu->smrs) {
+				smmu->smrs[idx].id = 0;
+				smmu->smrs[idx].mask = 0;
+				smmu->smrs[idx].valid = false;
+			}
+			arm_smmu_write_sme(smmu, idx);
 
 			smmu->cbs[cbndx].cfg = NULL;
 			arm_smmu_write_context_bank(smmu, cbndx);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/51e75bc48215dad8e70f59c6b221eadfe4b7246e.1601838005.git.jan.kiszka%40siemens.com.
