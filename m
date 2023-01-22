Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33b.google.com (mail-wm1-x33b.google.com [IPv6:2a00:1450:4864:20::33b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED906771E0
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:06 +0100 (CET)
Received: by mail-wm1-x33b.google.com with SMTP id c66-20020a1c3545000000b003d355c13229sf8257365wma.0
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=Kqq+Y6oLSpxA+6HXWDTwhTIalWptZhFogi5H1tzySFQjX8/lonEkm5WL/izVxyh6ej
         EJM2Da+0dyuup0KAMPifYduid95+ZX2P4q1/9Du/Y7MGqkdGf6iRvnj0n89sgkl/Y6bJ
         cA2j8SyA2GpWs6qZ4870EKdocy8vuy/lvWTLMhtyZ80cwAA4yFqazHQ1xzG3q+Uc+0+6
         fjqILeY+SeXhYfnHxfY1NsnpJTsEsvnNQPGP684qjuTejCdlaX3lmO7++lEthY+vZvM8
         kJP+XrTP5qPWdROsZhwoy6SPKhySvXxKF/7IAey7MxK8eLfAvV2D5i6HoQhdD5ZKnVzb
         NVpA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=gGlW1h6c44VYZBGC8stO5+ARCayvPm5wel6Ral/nSZ0=;
        b=Ku8INsZ/BcS9HLY9NdLObpw3h1HFa3G+sE6OIKniQ03a8c3Pmj2qqzlFLgNRGWQ18e
         tKVN9t9HsGn+tcU93vwlHq1lvLzDtQQzI7/Gd7himPQKwPXQr9lI+OwXEBxm8B6eGesC
         MWwObDPnvffqLnPMKEbcR1zZKxN5cWx6Ls0atX2aHfd8EhLNIV+PT5qSZ/2eye6A6PMc
         e9yWscOHR5EjLOOiMNDgH6IlSedF60kDdoTx79zW7rmL7Rsrk/91izETJ9Lhyy651gbk
         JkT4vONhnjBmG1IhjgPfRyn9MGkPgQovHiAnYFOZCn4zp4jza8ps+48EQQzTL+D7BMBu
         pCKg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ZVX3Vnsr;
       spf=pass (google.com: domain of fm-294854-20230122192904481892bb9ddc68ca46-xkmkvr@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904481892bb9ddc68ca46-XkMkvr@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGlW1h6c44VYZBGC8stO5+ARCayvPm5wel6Ral/nSZ0=;
        b=t7NuQsN88oZoCqmVbCvYgLzhJU/3Kjepfvn5D5Qrzo0E0zLwXFVNWXxwe0/OdU7s79
         iOQpMIeoTLwBkoxaoUcGJg8cGN1zCA0Aq22JULsCx+5d+aqmn5xq/cWXjEiXebYGIIVI
         NOh6/Wh2XV38TTk/yfa89ObDCR9KuG0lda3XUlEEjQ9s57obclTc7Fv8o7NiDxVMyM9P
         dzDNwUStbnzNWNEc7FcNtEcW6ScQXwhystK7sXi9SvmR7AvZtJP+cLMSs69pzyzu1PAO
         qGJSsFARzBD3zPXHsTRBlWL/sJJIvmYVJeU4WRvn0Re/3VbbY3j90E0rzyMLbVRVcCGA
         vU2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gGlW1h6c44VYZBGC8stO5+ARCayvPm5wel6Ral/nSZ0=;
        b=CqjqVpbQAzS+b8lPeoNquA5iapUYx0AwOrgW+EkB7C/Iv0IS8vV1cegNuXoq/ZMgyw
         zEX7Ne4AFFgTHHePAfqSfTIQ8qF2Z3IQWCPBz3hGqBFvYvfTk0ayO4WKHwFYlqwFvGqM
         E1Ljo6OvcbRVhY6AIASczC+rEgMJZy66ogLgtj59Ca3wnEcGjdWNJqFpboVYpzDJ6b50
         M2D6r8CMlUYGGimkenQkpGWcApuIvMWTK7gJ4w2AQXFzdUSfw5NAF0HYCfNb2aqLGEvO
         4rjRQxDfUl1XarbgWIUFMT5s4Ez4x92rRWlVLprLVhf4/wqhFLkcdidnKkYk+CkkL1MS
         vdXA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kqG3McDdkvlWUsC0yEFQw9ZfULufLqSF/Fu8rMis1AenfSGx3K7
	me0252gpIT95AzY+IJbhZNU=
X-Google-Smtp-Source: AMrXdXtbtfvCYOo2B4+mYIbaA+I1xYakBsrrICKlgp3fnmjKeSSa6i3464dtxqneWW6kUBUijCCeRQ==
X-Received: by 2002:a7b:c8d4:0:b0:3cf:9c1a:2fd0 with SMTP id f20-20020a7bc8d4000000b003cf9c1a2fd0mr1385872wml.3.1674415745755;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c5c9:0:b0:3cd:d7d0:14b6 with SMTP id n9-20020a7bc5c9000000b003cdd7d014b6ls5337366wmk.1.-pod-control-gmail;
 Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a1c:4c0a:0:b0:3db:210:6a24 with SMTP id z10-20020a1c4c0a000000b003db02106a24mr20460097wmf.8.1674415744362;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=yA8NTHNGZHZkbdD/4oGkAFaS8WrHzNa7PS8rWkTF/ho/HW2AVSa0k6SB53lLZUjcYq
         joWBvPMI5mL10k9Vf4MXXm3gM8le6xxID1VECld5XoS2PIJlvfdcD98G0rmVfnQoZ4MX
         cyFI1gvTdpcKCsdZEMSdoWv7IbrGnB6XBLDsWzGi8gLr/ug+17Wp8lgMoUf04Jbd9OvT
         aUN+0MQT49r0dIPAXpC7nD1UvXCoM9p2A16M8Ag3DjOe0G8s+ysdk2NOC1rNH2trnr1f
         YJQIaaB4Shf9hy1PM8uEjKsBylWGQ4in/DS/jt9bD2wk9YAklftgcGCDmR9gK79tKzLo
         fpTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=W76h6ztowLo9sjeiBrYG2m9yHEtghVpG3PM902U4gXY=;
        b=bo1XipfKI/eSdCEkAjl70OlJ4fUg3MGxf+FmEJtGpU9hqicvg0VLU3EnP6zOKjfm1N
         OxY7UHD6fJYUSYKIpNe5iNSqEHaxeUMvpeO4DLhrtS7yhujsuo/VFnZYTqWYtAqd78YZ
         8eBlzckTu0qiVvQGts0YTHrQzQ6cqQxMSkrMTYu9cZB19ONIJq+1k1ldVAIClle+KhsW
         6H4ScEVEhYUJlMvIxuBHpWNceIM4eRCcc+49PQUz8zJkVe9HWUDk4GHdH7rWs2O90VTP
         OW2J2ESnd+AgLwRuatGm/0aSq8XxHuUkiNpz7qasGr0AAaWNQ4GQMtVnXMcuKdTZUBys
         uFrw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=ZVX3Vnsr;
       spf=pass (google.com: domain of fm-294854-20230122192904481892bb9ddc68ca46-xkmkvr@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904481892bb9ddc68ca46-XkMkvr@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192904481892bb9ddc68ca46-xkmkvr@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230122192904481892bb9ddc68ca46
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/14] configs: arm64: ultra96/zcu102: Carve out SMMU from MMIO region
Date: Sun, 22 Jan 2023 20:28:59 +0100
Message-Id: <d049193ad6d7582d5f72f40da6b6fa7c1bfa2920.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=ZVX3Vnsr;       spf=pass
 (google.com: domain of fm-294854-20230122192904481892bb9ddc68ca46-xkmkvr@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192904481892bb9ddc68ca46-XkMkvr@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The SMMU is not managed by Jailhouse. No longer expose it to the root
cell. Found by the config checker.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/ultra96.c       | 13 ++++++++++---
 configs/arm64/zynqmp-zcu102.c | 13 ++++++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

diff --git a/configs/arm64/ultra96.c b/configs/arm64/ultra96.c
index 0387450d..b8829741 100644
--- a/configs/arm64/ultra96.c
+++ b/configs/arm64/ultra96.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[11];
+	struct jailhouse_memory mem_regions[12];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 	union jailhouse_stream_id stream_ids[2];
@@ -112,10 +112,17 @@ struct {
 		},
 		/* IVSHMEM shared memory region for 00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x7fb00000, 0),
-		/* MMIO (permissive) */ {
+		/* MMIO low (permissive) */ {
 			.phys_start = 0xfd000000,
 			.virt_start = 0xfd000000,
-			.size =	      0x03000000,
+			.size =	      0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MMIO high (permissive) */ {
+			.phys_start = 0xfd820000,
+			.virt_start = 0xfd820000,
+			.size =	      0x027e0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
diff --git a/configs/arm64/zynqmp-zcu102.c b/configs/arm64/zynqmp-zcu102.c
index cd5f6089..750c9b6d 100644
--- a/configs/arm64/zynqmp-zcu102.c
+++ b/configs/arm64/zynqmp-zcu102.c
@@ -20,7 +20,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[12];
+	struct jailhouse_memory mem_regions[13];
 	struct jailhouse_irqchip irqchips[1];
 	struct jailhouse_pci_device pci_devices[2];
 	union jailhouse_stream_id stream_ids[3];
@@ -84,10 +84,17 @@ struct {
 		JAILHOUSE_SHMEM_NET_REGIONS(0x800400000, 0),
 		/* IVSHMEM shared memory region for 0001:00:01.0 */
 		JAILHOUSE_SHMEM_NET_REGIONS(0x800500000, 0),
-		/* MMIO (permissive) */ {
+		/* MMIO low (permissive) */ {
 			.phys_start = 0xfd000000,
 			.virt_start = 0xfd000000,
-			.size =	      0x03000000,
+			.size =	      0x00800000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
+		/* MMIO high (permissive) */ {
+			.phys_start = 0xfd820000,
+			.virt_start = 0xfd820000,
+			.size =	      0x027e0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d049193ad6d7582d5f72f40da6b6fa7c1bfa2920.1674415741.git.jan.kiszka%40siemens.com.
