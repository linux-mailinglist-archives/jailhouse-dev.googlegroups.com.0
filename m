Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E69282CB2
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:11 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 6sf795242lju.22
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=VHSRtpugE/6nD3jz8j6kasOl9p3ku2PlLR1TtFSTjUUnI15dipJA8iAY5DJR3VFVGT
         8+ysEemzaotiloIcI7SDiciSK3TL8ZyxwAIYygb31BNoHW6Dw0vN72PY/1yqgn3hRih1
         tubKw6+c6ysmkHZEITwIMMKiCdTAnXsAqbVGskVQw2IwouJvMFdTggCh6VB9ikMypRmP
         FxTfBZ/+01OvVSxvxEeWS99dV3b00M+EGki5ncC4nRsUCnt1oauqmdVErjqH9XQzbsKH
         oUy2EQFO8JuwjmatkiiEZmUSOCSWRksmTwwr7rLDzogu9fEn/80qmwxSkCGC8g6b3SZF
         DR2Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=nmLAio0ZaTSMWGDX1vQrGIh1iXAbQBvyEmpZdB+SjT0=;
        b=0YUrbGHUbh8lf5f9UC8++hT3UgUl8oeKfGkacCsYk5Ib8MNsyxvI94IPK8z4Sxx+qB
         aSSCnkGJjBm4aI3DTJ+hV2r4lNdGH/qfVUWpaar+1PQlxADa1QK0uD5M36DsS3PhWVc2
         TUw7ot/znoiyAvpCA1emIrfU8jTsTbDzQZe4I7HfQ5QLgkUMcxt1rEDTDUucXhHRmVs4
         koJtPlXVhw9FfnjjQ/qb9xqDOzeNlED5nwnomPAQjY/PZTVE/Ltkzx+Br/hvN1sqUqTy
         klQ2hGYegpGksVA+Fm8ZpRQ06N90OXUN6PnRvcM+gzZAucySZ03JwPN7AnqYGmGnb1YS
         ON9g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nmLAio0ZaTSMWGDX1vQrGIh1iXAbQBvyEmpZdB+SjT0=;
        b=e5I3jBwNzEMM821sm/1gd5l87fkJyFKeUfRHtjwu0NGLzSt7BrP2JmT0L3Vw4pPQw/
         f5HQVjCbDUrHlb1Bfi/O+4zl9jJDr8PdBUAK06Fb/OVkCV1OU9uMcx9wG+YFGDj6gmmP
         9zP2ufi43j84eJebu5lpsbU3VPAy1efzMkOcqp6ZR9VRElLXLh2bT7nZr7sucgLC6TFU
         /J0w4cmG1pUGGs3VXOocDowV5aaNT+d8s5sv+EbcwisOJRZXTR7z1iOFmT0ST/7nC6gb
         78c09+INMZYOh12T6px8e4TQZo1qG+H5vjkpX3TTKJtZdxteVaTmyy4YhFXO9ztlxfV1
         f/jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=nmLAio0ZaTSMWGDX1vQrGIh1iXAbQBvyEmpZdB+SjT0=;
        b=qGzUtXmh0Pie+b/ST702krLQkpYuKLGciN4qbReukKkCRruJ1dZDhGsQsEO85PIpXi
         zhlz+eG3MY+1uF4/dPdHMN2gSoACkmw9mGMoAAFBE4W4PAhGGlHoV1XcxodJIzaPVF9s
         atCxD7rRt5gHmuF6+Nf4LWao1q9YhPBrEcvLq6T+pZhhvtzpPEVstNIRS7ts0i8yDSRp
         aQKsSppECA0IZaghdN09Z6sDNj7VhALzfzUmfszwe/sxx5QHHpWv24OjGloabydSmqVl
         5fJ+FeDn2QR1iUqIZjKInbFSfTSvySYpFJUV11JqRbqEhTJOusMu+JfV2bMnQzSvM/EH
         LTNg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532WinIAZ6l6AE4cxTrNsK/U2N05+zose/+zNHCOepkHk2p3JDK6
	/boACBecb3aPMQwoB8Ee7S4=
X-Google-Smtp-Source: ABdhPJy+MRUByq4aIqU+vM7D6jZNoc0vd268WPVtk5YrYc/KBsCRC22jTRPvDZ1qji2K9R0qc0N8Yw==
X-Received: by 2002:a2e:7602:: with SMTP id r2mr3265514ljc.10.1601838011449;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:7313:: with SMTP id o19ls255884ljc.7.gmail; Sun, 04 Oct
 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a2e:9854:: with SMTP id e20mr3356070ljj.152.1601838010162;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=CxIJUn+XyDWvTdjYwlR+6zfeiE9BwavtZkpwlOgX3AMjoZO5Kd7EXPUitnqZ4tBgu+
         zJwuarIJUPt9smn432NXzmoVZV4WFYse+m4/KeOyWD6tnBX3KIgddLRD7u9ZTnXtwRuI
         tUkygrZF46TpjyL0AHI9sBNLNQWdDW1/UGSXJAMaKAYwmIZtcrDZP598/AETb+dEXB/G
         V1okDp+A7H9/gnLJJPMKappnOvipXEU+vtK62P7jV2wFHFTzAYBMBMAMmEiBsGP/pyTz
         ud4UXIW5wNSxZseK8XGRJ8cCdZM7uXAEq5giDPaRbEpzy4ATeQ2oTBQYmZTABIcZ5Yql
         fDow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=KI9JWWaE0MG27fEyzyT4TItfzo/pGQ1mHo19NkoEJiI=;
        b=R7pj0xorz4hEVvRObwPqoAClYNRYua49wNfgdgVzRE2cG7PjUnTWWSA3yfeoGcb7oA
         WMz7Ykbql4kztfF7veHXZEcIiqRAG7W6uY5oZ/K3gVO/ihrTgBY/2bqGbWgiFMRdVSZZ
         BRm2UTt+AiHrFAOQhwjnJwh7LvuM47GIw68LWBX5JAi8Zg0sPSA4CnKpYPf2R4TnWjuG
         mQDEPdtTLcYd9hUOJA+LE0bLqIUwESFYUqFbx17TB6+2ZBs+JDvF7nSDRj+JqyO4BtI3
         U/JknuDdJLZBhPkkEsOfu6Dqy/fiLkfpMRJsEme4n6LCk9WC4Cu/sV9vJp+aR5wRDp11
         a8zg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r13si135906ljm.3.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J09WK025032
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060J017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 07/45] arm64: smmu: Clean up arm_smmu_find_sme parameters
Date: Sun,  4 Oct 2020 20:59:28 +0200
Message-Id: <7794bae4bd24dcdf3fef5478e9bef44655b44b05.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

Just pass in the arm_smmu_device, rather than the mask associated with
that device and the device index.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 59cc8a78..938139d0 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -749,9 +749,8 @@ static void arm_smmu_test_smr_masks(struct arm_smmu_device *smmu)
 	smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
 }
 
-static int arm_smmu_find_sme(u16 id, u16 mask, int n)
+static int arm_smmu_find_sme(u16 id, struct arm_smmu_device *smmu)
 {
-	struct arm_smmu_device *smmu = &smmu_device[n];
 	struct arm_smmu_smr *smrs = smmu->smrs;
 	int i, free_idx = -EINVAL;
 
@@ -777,7 +776,7 @@ static int arm_smmu_find_sme(u16 id, u16 mask, int n)
 		 * expect simply identical entries for this case, but there's
 		 * no harm in accommodating the generalisation.
 		 */
-		if ((mask & smrs[i].mask) == mask &&
+		if ((smmu->arm_sid_mask & smrs[i].mask) == smmu->arm_sid_mask &&
 		    !((id ^ smrs[i].id) & ~smrs[i].mask)) {
 			return i;
 		}
@@ -786,7 +785,7 @@ static int arm_smmu_find_sme(u16 id, u16 mask, int n)
 		 * though, then there always exists at least one stream ID
 		 * which would cause a conflict, and we can't allow that risk.
 		 */
-		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | mask)))
+		if (!((id ^ smrs[i].id) & ~(smrs[i].mask | smmu->arm_sid_mask)))
 			return -EINVAL;
 	}
 
@@ -857,8 +856,7 @@ static int arm_smmu_cell_init(struct cell *cell)
 		smr = smmu_device[i].smrs;
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			ret = arm_smmu_find_sme(*sid,
-						smmu_device[i].arm_sid_mask, i);
+			ret = arm_smmu_find_sme(*sid, &smmu_device[i]);
 			if (ret < 0)
 				return trace_error(-ret);
 			idx = ret;
@@ -913,8 +911,7 @@ static void arm_smmu_cell_exit(struct cell *cell)
 		arm_smmu_tlb_sync_global(&smmu_device[i]);
 
 		for_each_smmu_sid(sid, cell->config, n) {
-			idx = arm_smmu_find_sme(*sid,
-						smmu_device[i].arm_sid_mask, i);
+			idx = arm_smmu_find_sme(*sid, &smmu_device[i]);
 			if (idx < 0)
 				continue;
 
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/7794bae4bd24dcdf3fef5478e9bef44655b44b05.1601838005.git.jan.kiszka%40siemens.com.
