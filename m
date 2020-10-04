Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFX5D5QKGQETQUV4XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B13282CCC
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id e3sf435891ljn.11
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838016; cv=pass;
        d=google.com; s=arc-20160816;
        b=qlxV5fc48w4fM9kiQJ+tGNGt5Ea1h30zOkC5vbnMJDIoRFm7s8jxpwm2edIGXSDdaf
         cmX/SPFO/dfVSWiKvI5f/VmY1GIF0BLddiwC+zDpsc30Q9oMs9Rku0qo8+jpDQwAPm4X
         LvzCYFJoHCtC9G7v98l29uQYSp0l0UnG/ZSCtMihGWYSvfobl2sW5kZTIgRgTax/L0w9
         9GEKDeGgLivmwbpGumbEXP91uglCgpIqtDYveqwHxruVABUzjAHlQo2oKVRhL1fzDPiW
         umUMaN6EPPNM6eSrul8OP4dic9yLHAAZ6pAQ0e2A7FDL1/p7bbXE3rwONjqakCwefDk/
         P7BA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=+8NTvjPCUQytaSQ1LoO9seOgvfgfZOD5kNP0cUN35Mw=;
        b=cZGXIKVl/ecS6QWYQsYVvAjUhVjLQ96MH0XumZUh7jwVpqGNq/HzlhEkc32DjXj/tF
         s+YR+LleeUn4zhlQ78j1ybZbIq5pTHMarGH5X49pqWyArd5ojI1mKv6Em48PJiE9+FyY
         OdG18wImUzQS7PR7avNX9N7VOx1uNS4QW4CjKjksZikKi+J0+W9D7ENRdcq3i+hM434J
         EAFT0Rr/y0dE9fZNK03GX4pi/IWV7jxu3SOsUe2umL+COqLq6B+Me04L7maRBnwaWpfc
         obAnOiCQOxKzCsbGMxibzC80iQYjMZPtofo0VsPCyKAKVV/Q55EO/a2ag4y4zKQOa/S0
         aiLQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+8NTvjPCUQytaSQ1LoO9seOgvfgfZOD5kNP0cUN35Mw=;
        b=NfG6rCKC3WMMn1vVN7XBNP6ITcJGU8KJLeux2OgdA3zrrUPVqA6qZvwMrUUfzMfPlg
         mN4WeNwtyI5g4Q3p5ht8LD7KPgz7jx8t3D0xT8clZ9+V5ZtvSy1BPGtUA1KlukwGy3wN
         dB+j2mZUwPj9C0qLDuBiqpbe4LVHz/ufAOzBa9IX1I6i4uDs/1ohC4/fNzPZk5A9lneS
         h7gthKwVNeUm5Fd5Wqzhp1u5PN22SjAF2ilhsrUI/ZDDwLQA3ZGDQsEACiuYxrFnFrvA
         cmviWReJgUYs0RbLUNhcIdXn+s/CwIJs2LSSahYcctejpcRbfBsKa8CkvdC5nuSwxecb
         hMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+8NTvjPCUQytaSQ1LoO9seOgvfgfZOD5kNP0cUN35Mw=;
        b=p/DKvhzzUkzcpNSt5koUXfya7J2cpFVcVETmGMnN2NC0U0oo7e7WxIclcL0pTdPTHx
         jH29fxxbeqk85EK1NJHWem6ACiHkqr4wX34tYxlmE1xJHJXd3srJWyAsajKnnHtSEpeG
         DJPLkkOivigXQuzZkDoDbpzl5V6DIe5CkGORpZDeDox2ea3AUvHAB+NFTp//jXxSMyh3
         VrqD5CDfmbvZ/3rzmRfzUBZYajvAg2AiVn9I55jrl7XrUQ/sU01/lBVdQQlE78saYNRb
         12nZXSr9UtdXMUM3G1tvjXfJN8f270xX7HzNN2E6O41KLdRc0qOPfsiDwgYJnyQWs2GU
         3Q7A==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530A8LwyTk8Ks0uD7AUXP4vQbSms3ZnDQYka6TlQQxbyuV/MO45N
	IIG9/0T5TC1Tqur+qnykw4I=
X-Google-Smtp-Source: ABdhPJyOmrHvVVPVTxLvRHL2+a9lpYxbpfYixHpTExRVz8XIBjThaJqzC8QZrYRDYE45p4bTVxGcfA==
X-Received: by 2002:a2e:9854:: with SMTP id e20mr3356193ljj.152.1601838016849;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5c44:: with SMTP id s4ls1116927lfp.3.gmail; Sun, 04 Oct
 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:a19:a406:: with SMTP id q6mr4669399lfc.556.1601838015445;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838015; cv=none;
        d=google.com; s=arc-20160816;
        b=NlYBxSCCkiCXwumoH197MAWPE7HaRvuBmQeAgB/hJU14NQGXtkxizOAh4yFt3NkzAy
         Q+UjZ1VSXz4kUhewcRWv2NZg5Pyg8j3dTXzScbg44cssa5jm80d9s0i05K1lBI9pWmy9
         qYulF8tziNpfH5w0uLCkqmI+medRPtX7Pri6zluHEznuPbAXZWyF0iTbh+jvUxWO4TAn
         +aImys3MO1IbbU0S5aod6PncPb4Az9q0dK8rkowD7MECPxoCd/43EiSEl3+XyALBkIwp
         IpwfYmtEHtNGS0c/Ez4dmIavpYtf2vOVoMDCXe8nDXgqtRy6ciZC9B937TH5Pw2SEiH8
         gILQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=8iFyi8NXDmoTorPkWGQKeiaS9qJxKinacEeQjnBFbbs=;
        b=wkw4PGSQhy2Tgf1KYHP/VUdGJLUwvbilRnFM4w6+0TTA33tUT6HZ+08GrUMjC9nRkj
         oTz1Ik+6/0dTXOQjbCP9Gfx+Lcm3eyIMbptLoJ2nqxmNQtFOra0INRfG0PjPQp5FlwtQ
         oJ/YJ0PAFrE3pEG0MUV7hk8Y7yzNuNzTgBq7sMqnrawKCjIFuI2J1987sRd4ejHzbW/B
         MgQ8DtklkGA1EaLx9gPPq1XfPebvgBpSWmj4eq+b+tZjGNyCBhFibYpDxLFN09nNkH/p
         l6++ZV0Z5XcKIFXtebo9pO4EjIeeTKQVepfl9W8+419/nsPjyuI3dXAow1Oj/xaANP1x
         Djcw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id o142si114461lff.6.2020.10.04.12.00.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J0Ehr004398
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060h017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 31/45] arm64: smmu: Disable context bank only once on cell exit
Date: Sun,  4 Oct 2020 20:59:52 +0200
Message-Id: <c4da54daafe45071e6d769b63a8293eb86bda741.1601838005.git.jan.kiszka@siemens.com>
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

No need to run this sequence for every SID the cell owned.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 34f2b821..acfe0cd9 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -596,11 +596,11 @@ static void arm_smmu_cell_exit(struct cell *cell)
 				arm_smmu_write_smr(smmu, idx);
 			}
 			arm_smmu_write_s2cr(smmu, idx, S2CR_TYPE_FAULT, 0);
-
-			smmu->cbs[id].cfg = NULL;
-			arm_smmu_write_context_bank(smmu, id);
 		}
 
+		smmu->cbs[id].cfg = NULL;
+		arm_smmu_write_context_bank(smmu, id);
+
 		mmio_write32(ARM_SMMU_GR0(smmu) + ARM_SMMU_GR0_TLBIVMID, id);
 		arm_smmu_tlb_sync_global(smmu);
 	}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c4da54daafe45071e6d769b63a8293eb86bda741.1601838005.git.jan.kiszka%40siemens.com.
