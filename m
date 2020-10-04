Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQFX5D5QKGQETQUV4XY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E12B282CCA
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:17 +0200 (CEST)
Received: by mail-wr1-x440.google.com with SMTP id g6sf3143430wrv.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838017; cv=pass;
        d=google.com; s=arc-20160816;
        b=02qptzHxlHgaB8+zEMd/fqDL5EeTpj6CB3P5eYl9KI5MH6mEPeg6OWZSbX2Tbs5m5K
         0LFN+m2ZqC23GjV/6QYkBAu7YDWx3pnHr4Y4HXtWd/gcmjy+vLqXv96XRK9LA4s6i2it
         w+Jfe4An7cT4bg88tOie2fG8n8mmP7oEK4/l2q2gn9ya8uYE2uP2fo7MP0059j0PHWE0
         CGJytWrg/OgIqYfsjVZmKSwkNi0siaErZo+eNMr4kg8zwpyEtLO7eURnHd8WpNkY2iVz
         aly54KNoruoRUq5HXmKHFbJkBInDbSVoc1kG/kqs+C7toPp+49jQoom8HaKCW6rB95cV
         NL7A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JG4p9IbqaAN15+VzubiOqsyVLm0mMssRX7rtTfmi+ww=;
        b=XHpiBNq5LB7+7vNQdJnisH7jUql4Oq7Pq9EJMmPle2IFTxMPl+riP2Jd7Vh8AUU2I+
         UVKbAGJC2AQIDK3se3NQq0HUdsoEPK4kurSaOg0bPDX1juU/Pgucz4HCD0+qh8t7hPIG
         iSdBQZieb9/JzbTGrNXV2ALOK0eJNwmX4nvfpVEAuQ1j58BJsWLDL559q4uGFODzwBzz
         /iUx6/woamYgg1rqrOih2zwBmmqYlbMwKlzj3dbKNx4KQTrV6BCs1kgRtk9w0FYfckQX
         ltQ02QoN6KgcrvnOc7ge4X7uLwq2zR/cF/mwubNIPmoCYH4KjHUewul+YlUERQjudgSD
         /0Ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JG4p9IbqaAN15+VzubiOqsyVLm0mMssRX7rtTfmi+ww=;
        b=KD1jAdhSVGnTwDCfotDsKtr98+eVbg6+Q/F763J0HdPI7klFXde3Sdp4ipBWz5taH4
         9Iq/50rfV9Ca0gpg5IDjrbpVxgvcj7eBahCEWhphiiks37jBC+A2j9ybg54U1eYy0YWj
         QQoJz5GoW4EpsKbwJG4pK4Es+x/WY7DjhQNYIqP41XkHM95MBB1hZTm1j2c9w4RYP4sY
         joBcR1PkhhcDSnuFkHByuCaTIJ8D143ylwlIzqgQaxfO1w0rZoCTHZi2RknjM7jpDVCQ
         tHRInAkngNsboEBpB3Q/FC4iUYBD6j5QIaPbBuKlpumn5HEA7G0dFxfPP4ljRHITOuwV
         nu8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JG4p9IbqaAN15+VzubiOqsyVLm0mMssRX7rtTfmi+ww=;
        b=fl3+L4aA/SdcyO4SCklkAyoAJt7J6I3Khz4nm2AWAkTPs4frHS0WwM9gnYkSlvGnws
         x15KHGFbccLDe4Z95RIzXAnJeowJaDVEf7g5L/xzAw1yJVO3Nxgx8HdI88GO0JXRC0XF
         tX2jPNy5bHBS0dNUENZW+Pt6OepQyP1AM/QqdQJITQkB6FvxFP54yUi5ARaMBX46tN/2
         s8dCkOpB0mGptg7ux2/TKifJSY93Zlo8OvbltztJzyGQ/44z0I/VlzvGer6vH6RwfG+S
         XhKtat5QPigM6VAIjBtA2eCDGF74SZA+pg4WH+++BusdtN0fmPL62vLnJxNBZvCTubTK
         1hDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533W377j2iSvbrlA26ug0IKR6od2CkiDEVeJ3TQRdiqRfK03VkPZ
	EEiuGn8BArDyeFem74dUD5g=
X-Google-Smtp-Source: ABdhPJwy2Ji7XbeYiNSdPlMr8Cig6m9sKCS1DqsBiI+5mvVaNeiYn5ysps/LsH60Gwgy2+huqTfhEA==
X-Received: by 2002:a5d:4d49:: with SMTP id a9mr14474434wru.363.1601838016846;
        Sun, 04 Oct 2020 12:00:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:428e:: with SMTP id k14ls5163241wrq.0.gmail; Sun, 04 Oct
 2020 12:00:15 -0700 (PDT)
X-Received: by 2002:adf:e447:: with SMTP id t7mr370920wrm.384.1601838015904;
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838015; cv=none;
        d=google.com; s=arc-20160816;
        b=CtL4IitY6PDnAeSAy/jmQfnCHZB6nC3e+Sjfy6F0UBcxkBKuqQQwr/g+E55OmE4FSO
         RuBuMGjDnUMxDhJZr/ke7lchRYjL8OQVwv2OAPcT0gw2fIci2GAu0elUa/SvZvVZNRRp
         XnV/BKMDcVrM38wx6Pa+cGCj94jgXfCaHEZA3MnOxwEyis9tS4WNB9+/584K6e2u1nD6
         qjqFRpVD71xS+VI02xQYGt/eVrf21pnKDWqXUTIA6LHNsdUcs32CdmjZnUajU6FZIXjt
         XEBQJsjvzUOm+H9QPgPV7F51aG6G8SgdtCYPsmLsczW/EjskDZmVPKNlmLo9bYoZX4LC
         1HWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=4cs7LS9d0i+pTwHhq/5SPpwDZbJr/A3gJGUCWGPgdkg=;
        b=Wxxh+0Yiles8fhfwdsik3nlg/Dga3AR+fI1QPOM2H+GF8XxaxctERhiHJh0OC7Mfsk
         yDNOWTfOLFGjvy1D6z3L3oInSzK063c8eG3RnHrT5Y2bLRNOn8bnggRbbZEc1XTLRqYm
         mYF1ZuQJSJVaCjHi1j5hjlMwsdZShFfN/Yhifn/QFhKVZOrvXM6iN8sr6UHjKpmVh9QD
         9Otm1Urqf8f7wdX5BdqIiW818NSDAl9VCc91zAOf1CoF26RY5hZ2KWMKsvDZk5KFNq0S
         xpCdCH9BanKlgRPygXeMeu02CX0QOdHV3UcQIhkFVE36q28U764LwtHvnaOkmM5ZqRLO
         tUBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id 14si45208wmf.4.2020.10.04.12.00.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0FGE020516
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060l017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 35/45] arm64: smmu: Refactor ID2 evaluation
Date: Sun,  4 Oct 2020 20:59:56 +0200
Message-Id: <bcd0f80f8ae8dcdd9a1140c33c2233ee5b8fe3b4.1601838005.git.jan.kiszka@siemens.com>
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

Use GET_FIELD where possible, change to descending bit order.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 8d0ce757..ace7a48d 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -60,14 +60,11 @@
 #define ID1_NUMCB(id)			GET_FIELD(id, 7, 0)
 
 #define ARM_SMMU_GR0_ID2		0x28
-#define ARM_SMMU_GR0_ID7		0x3c
-
-#define ID2_IAS_SHIFT			0
-#define ID2_IAS_MASK			0xf
-#define ID2_OAS_SHIFT			4
-#define ID2_OAS_MASK			0xf
 #define ID2_PTFS_4K			(1 << 12)
+#define ID2_OAS(id)			GET_FIELD(id, 7, 4)
+#define ID2_IAS(id)			GET_FIELD(id, 3, 0)
 
+#define ARM_SMMU_GR0_ID7		0x3c
 #define ID7_MAJOR_SHIFT			4
 #define ID7_MAJOR_MASK			0xf
 
@@ -439,11 +436,11 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 
 	/* ID2 */
 	id = mmio_read32(gr0_base + ARM_SMMU_GR0_ID2);
-	size = arm_smmu_id_size_to_bits((id >> ID2_IAS_SHIFT) & ID2_IAS_MASK);
+	size = arm_smmu_id_size_to_bits(ID2_IAS(id));
 	smmu->ipa_size = MIN(size, get_cpu_parange());
 
 	/* The output mask is also applied for bypass */
-	size = arm_smmu_id_size_to_bits((id >> ID2_OAS_SHIFT) & ID2_OAS_MASK);
+	size = arm_smmu_id_size_to_bits(ID2_OAS(id));
 	smmu->pa_size = size;
 
 	if (!(id & ID2_PTFS_4K))
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/bcd0f80f8ae8dcdd9a1140c33c2233ee5b8fe3b4.1601838005.git.jan.kiszka%40siemens.com.
