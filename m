Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXPNTL6AKGQEIXYUOOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F5E28DB5C
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:18 +0200 (CEST)
Received: by mail-lf1-x13c.google.com with SMTP id x71sf291664lfa.14
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664157; cv=pass;
        d=google.com; s=arc-20160816;
        b=KlH+KrZkwjrK6/dUWaFeYKCH4ppU9amRSZRarH2VQjCkM6XM3RSDdwzWgmpg8qPzY5
         v3I34H8j3mIBJZe/CZpcbgpa1ewtw2lunWtOfZj3YO2Rh2mMuUCc5aopqNPXDBcnEjn3
         KikizMSRxepidOlQDKvAl4BQH+JLUknFSHkYvHAXEebd64sNLi+DviEXga0i3eZbv+lD
         IzI/yisYxwk2DM27Zszh+L1H6FmAtO47fjcN3SfC3r2tmgQcY+65r6MHORMaUv1cQekX
         0QXgb/xYKuSO1bmRFKNzizef09Ppuk6ob9ywgAXKyOxtCrAcbSBIrUdXRv9WgEKysxbs
         W6AA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=bQ9AgyONgBb4vZDmF6ik6+xDqYyHKT+Og651VSQCIVw=;
        b=iNtrV+iTBppG4hmY70AFyUk4yYMy6EUsLAsfcyV4VEiHBQkT4dLM0bu2YwTc8KbZtX
         lt0zoFjxVZwTUJO862spo+Z1ChIGGc+AXaN30tkNmQviIOeCTegR+aHA7piweTX0nk4S
         SJ9YHFlO9k9GsjIKjC/a/q8LAIXFn0LPpT5sCZ96dBnB/p3hkF9SYa4Ps7uoOMzA9k/E
         57f4UdSOFmcu5wVOjPlQ+vnjToJRUsalx+MmxcSydXo5EJM9LheKvMb1ov5KYSDNhriK
         UbNKQPOcgoJnhChtkXsiRpysemCaC+sfxcMqfkoZ4w9aRl0JopyNdDM5aJ7P8o2iaWDp
         iEMQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bQ9AgyONgBb4vZDmF6ik6+xDqYyHKT+Og651VSQCIVw=;
        b=frkEHzi4HYVlRz+Kq6MmAig7mhMw4wMV4vhbD1W21vepQ/DWjcxCfJkOeYV+Rn16ds
         9PmzDQR1TdpyGUuCBoCDKhD0OJMnpzfToUMdODN3nbkr9aY9yXZOVhAYWzjXqy9JTpfC
         6FjfpNrYxkz9Yj1+Gi7qZ1IcvUP4mxVJSjYLGd3M2it979WraDwTRg2vQGMFG2H7jJiD
         tcobA7CfNJuVfTvv4gU+c8P450oX58vwkXx0fE+wJG2K5t+I64iDWvwdPxZCDlcrWDSl
         f9jFW2iTkgDg+8do4AfknTulh7p+IZdALX6aaj2RK0pAs3hvDWpQfSd+u7p9l7nGpAPz
         kFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=bQ9AgyONgBb4vZDmF6ik6+xDqYyHKT+Og651VSQCIVw=;
        b=OpMUNxqCS2BnwrZgr5qzqPPl8jfOYc8E6beWEuV9+DzfzPjAYMwmaaMNcDYqA2khAc
         qJxZe7xAQuLk1GSL6GgSgSCEJtbtBWiEm09HBY61fCTyH8M2eA+uV1rhjestUlnsOZPj
         VjB8BWlS5WAKIl++kUTy9rtrGJQHXI/KWH+iqviTAsG4y+ZTQfhfHh11udqcwJ2O45x7
         0nl3w5/URhDrJrtL0gMA2Fl3US/WW9Wz/JKfPjAbESfgWKtBGrCknVLcjtcFUYgabxVg
         ivpIow08W00lXy08gzp/oeXz0QmQ0wJpqFXBoII7R21wQx+IsOiuhp+evqMJmeol3yDc
         Wmyg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531cV80dmWNt0wKbaEPfTCdBFLRyIjFlIZdKadpG8/W3HBDbBFLl
	lDmB23f7BXVjTSutbV3PkMA=
X-Google-Smtp-Source: ABdhPJzEMz8YioOlR88M3AY1er52AjfBD3SnC0A6OUjYh7RIxZFwnyRMqQ8uD4o5LQ4SxV1QXLjIXA==
X-Received: by 2002:a19:ee12:: with SMTP id g18mr1124400lfb.515.1602664157563;
        Wed, 14 Oct 2020 01:29:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:ad43:: with SMTP id s3ls1307415lfd.2.gmail; Wed, 14 Oct
 2020 01:29:16 -0700 (PDT)
X-Received: by 2002:a05:6512:3388:: with SMTP id h8mr1127671lfg.318.1602664156232;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664156; cv=none;
        d=google.com; s=arc-20160816;
        b=J8MvAC76RWQS3pSP8gi6ecGz0zj/3hE2BSfUjE8ayOGgCjfPwr4Y+KWjXoaLr9/riA
         OrQqa/E6HFd7ezPvO5f0k7doMBCW0npsNCrn0Dlm7xTJcBPgBJtB6FhFCdfhJmsM0AtM
         gL3c4rAPb+Suq4hmFibtXms935tovY+ghozFxl67RWrLinL2wxOppTkt6yodNGdErbh5
         GYMfvOWhlWGTFtZ/oOlTqiZq/mZFHYNNNvNL1KcMWF4rEYQEJWkDJunOSh5BvGkL7AtA
         6q7W1fZBMdLr3HAcMGbhY3b7G5UNU1Yai6FHo30aE2jCEw5yAP1buB2MRLl4aMnEyAzB
         aOZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=E8U1ucCev81hCK7sef2Ph0/gRNOyjYyZ1515qr42R28=;
        b=Hl2QsRyQN3BxWLfBHHagB8Jbv1vb46fdR1ejA/JiRFq5yZT3ALpiJ8qkWzenFhu25W
         1WY4lyfahGRHG+lVqgzHXkjay+btLllYgDW0MaeY//nS36b/e30i9DcH5ZThR76mqLaC
         R7p6zPtMh7FL4lOmp+lk+rxS73dQyCvxtkVM0qgJR7YessrDGLBD5LDgbuwq7tBSck58
         z7BBT5Xw+6+hL74wnRU/r7i59TBK0f5E25aYIYOrYdb1eZ5p8+G3QhOKnyk//w4reQmE
         OJYjnvRXsMAA8Hg0WH52lK+gJsaIyBSYxMQTmVu8vtTuSZYG9EcN7OXA+KH9sYIunX+T
         Wthw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id k10si69983ljj.0.2020.10.14.01.29.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09E8TFtF032702
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ5002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:15 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 19/46] arm64: smmu: Move S2CR macro out of sysregs.h
Date: Wed, 14 Oct 2020 10:28:43 +0200
Message-Id: <883f41312c4134ec03af5195df959a3bb24b2f6b.1602664150.git.jan.kiszka@siemens.com>
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/883f41312c4134ec03af5195df959a3bb24b2f6b.1602664150.git.jan.kiszka%40siemens.com.
