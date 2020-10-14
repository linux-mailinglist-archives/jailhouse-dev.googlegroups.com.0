Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWXNTL6AKGQEJMV5RQA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A9D28DB4D
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:14 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id w23sf284762wmi.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664154; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZIzLfLKtigdPQ9gAZF6WHKXooO+3k3AAi8Mw5tNiIIw7oUMrNVRZi1pYB+P8pVUsIl
         B2t8HGiyVslq5wGtqlc4osL7jBZseQiSJuIZI8DzamgpAxTFqap+bHdpHUUOwsaEYXre
         cyIT0I9dXHjI6lCscHY0O/45UG88RN0mRUz8cxhIRn/4u4PRW7l0BkymMbZS6hifxxdp
         LOFp/OJ683lzwhDtMlOXHSLihuitA7GJ9q06o2wvdL2wNoR92AsvtT+C5Vi6Iz0MrtmP
         sEhXaG9L/k762Umn3y8aLrd7HZBiIMuM6nJxx2IhHoX7poqIv2388c2yr9cbYlhIXzrJ
         opqQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=okU3jS7TqMR6BVO/SNm1/VExrr6Nbdmty4sW7Mmrv3s=;
        b=I0g9TgBi1MRk4XMs6zvOcqPAyjAQT6PPaVfsxrUK4bZWqBHEPr183JJAO5zma3g0tk
         YuMq9qiLq87QdMUGils0AE091YqXlRDJv3FSqCu+l7WB18UVbj4RgHvUEC4K5v/bHI40
         VZNj8joT1gIb9/nsgjpddm1tuTCRBzCJGMDj4WgdqaJGppJ2KnYi95LGmtKIY4pZYCOI
         Z0XZPSFQLNbL+53khNMCwUOPRcPl0h6mhalmK9MDjG3RlXTo+OKq0d8BZSw0SYNoODHZ
         7pO+bNjZU8PKrUzrUdVGEdLL+FJTjE4jYB34MSyaIiDwY257Dprmfjy5YdtsOe9SRQj6
         lK/w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=okU3jS7TqMR6BVO/SNm1/VExrr6Nbdmty4sW7Mmrv3s=;
        b=H+mRcwGSXYr+D65hRZcGDlecc78u6MCVpUYN59BAyXjXVHgIZ7vBTN+X1awcRKA3+S
         4KQVeJNqZ97G8Qe+w6XsYx5q2BWgZOx7RhUkbY3X2I1pHCEzwBTPiB9YU6mj6350s40i
         Do3txH+XOOa4SHWPmOaRtcbQOBzSsa1Szhmtoh7QqYT3CEj1nPB2AkUtd/fhYQ+pPNnh
         QGVGdy4bBWOZIWYjpgpAOY4U8jKowNooono3ct/p95+TuOiyP7Ch8xjA+g7SH5mr0tfv
         jnlrC9H5fNNhXrgvVj7rvOagn12+Igjt65UfRz45GrVeNAeuYddIckHAQJqOzsDOpBGW
         UjUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=okU3jS7TqMR6BVO/SNm1/VExrr6Nbdmty4sW7Mmrv3s=;
        b=fFx32XcgpgbaDnGWyzAuv5TQVkihFo+9TVFm9nLcMPKU8gvMvU0taQGrlkogKIv9yu
         Vt2jn1z2laLXH1V8pSo4QonGxqxNQLbbGcA8r7uTpQ7Wm8VOk9kOwg9W/H/BG+vZBq/5
         KCSIvBwKFmsjO88+PZVASkiYUak06+VnMFcEWjCaPc8b8dpeFr2gDp/k1xG6HQ64BGbX
         Fph7wEKBinkznEN0KUzWM3kcO0BIgG9jeLKtTyMhuTUfYLtitiZt4am4pz6Y8/L/E3Cx
         D8+rIXtU7GO9WrArCai0bfQ/y4QyJFzcEnZViO2JrphHnScl4QD8D29Kl8WEfWvZ4Asd
         ktsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531p1mm09EqsArp456526dH4aR7giR5kc0ot+EXeILRXGZwCtw8P
	2+GkxEAkMGEhnqx2sig91Zs=
X-Google-Smtp-Source: ABdhPJz9V3TEcQRNYHt3VoK4pPaffL6L/bwS9XqzPM+YYooWh6KF6IN6NmU0JQ8aa9J/2a8oK5hWPg==
X-Received: by 2002:adf:cc88:: with SMTP id p8mr4432066wrj.201.1602664154351;
        Wed, 14 Oct 2020 01:29:14 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:960c:: with SMTP id y12ls749393wmd.1.canary-gmail; Wed,
 14 Oct 2020 01:29:13 -0700 (PDT)
X-Received: by 2002:a1c:1d15:: with SMTP id d21mr2297000wmd.79.1602664153328;
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664153; cv=none;
        d=google.com; s=arc-20160816;
        b=g6Mko38crBUgU1fOJC85Eq6R5YwZv0A2XO9vk5/eT2pibVwVzBseLvOTxAEk2JNWlS
         TogfTY1QDZ8JPiqu5EhWBeklxh78YbLWod6etX3LCAs93/FUU4ETR26xrt0+huQ21uyP
         63Yti++Kx7UT7ZgWgRaDvfq9VSzdm//C7ds4wRxa2dx3ZooDYLTensyNmKHhGF9ctAhM
         sNdIRqZsUV8PqKggiUrOPU+eEIuLQ1v6Hm1TAofALNHc+qygjBVlGS/JTyCxxQhZVyf3
         Cx3URyIk6IZv/G/2XpFUUZafhzG73/QmLcJs67TcCuFe/d3spo96yws4HKG4Y6LX2Hdu
         hhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=KI9JWWaE0MG27fEyzyT4TItfzo/pGQ1mHo19NkoEJiI=;
        b=xVC1e6DO7Qya5RCfzjTOmFWZrmBXy5Adgt5Ruip8w2ppeM1dp6ljNq5GHXcKIh//r6
         ePrYnTBU+YM8FAjuJV0cmJUsl54L3RzUeo+nA8PGWusSYMna3fGL5Uoxo+YL3S2BYV8P
         XsvDO0OIaQNaZ3WA3tUmAdYUlfY1GYNHjAhFybNbFyqMsGSleCqKcmEeGleP1xgVm18a
         J3osbIpznJUCkG7S3eTRgwbQApvBGPZTJ7RFgXmLtO8dRTRRNbGYi5TaM3FYgoeldZpo
         Y050BcTw1qMunC2ssSqMp6ieuNKqo2s0y+w2QqFaxL+zYtL5fRs7QQnepKDbDZNpmi+c
         ro+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id w6si49745wma.2.2020.10.14.01.29.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TCQc021628
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAIs002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:12 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 08/46] arm64: smmu: Clean up arm_smmu_find_sme parameters
Date: Wed, 14 Oct 2020 10:28:32 +0200
Message-Id: <e9ae91eb20bec1dbe3a2adb02068fc225c77f8b0.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e9ae91eb20bec1dbe3a2adb02068fc225c77f8b0.1602664150.git.jan.kiszka%40siemens.com.
