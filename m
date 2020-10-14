Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXHNTL6AKGQE3XPJOOI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id E663528DB58
	for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 10:29:16 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id 14sf1035833lju.6
        for <lists+jailhouse-dev@lfdr.de>; Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1602664156; cv=pass;
        d=google.com; s=arc-20160816;
        b=jGkGLgcnZ8DtWI+ojQ6yh6OSKxnWuXsoGcU3Y4x2AnN1uvYP+LgVgaTPdc8bFK6UW/
         b1qOERVONPAReXVua+7tB8cI8dURB6CIFcnhinuTMPeGnQY+TaXb9HUpJ7khe4zW83Wd
         XhS0MJBk0ItK2Tu/VDUF6oF106LZljJc6z1BgzuZogZ2RW5KrfbFc30qNXiO91idNAOn
         xakt5RMgbeyOfg0QLFeBDLSdFVJ/zUQWamOAFB+N4VRZlywZrM/AzEyzHNzWziigV0/0
         19no6ifs0/sW0g5fELIuOwNW2V6r/SLgk/4EWd8K0GpOoyuA4okYr2CxRvsVi0OdkQvg
         v4Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=M1ZlXZE27D6UrUq3NRhbLyZv3OS23n9TUN1nqjSmj6k=;
        b=lfhvhqVy+0fFVRkK8FyVBfoyOFE0MFb6Ih9HvIEwo5NkmE8M28AINmDRVy+l7aTB4n
         lchLYQD9xmKmumnOP/DE/cKrJYrxQy5KOVTGzWQo4X8+66mfcRNioEJgikBkg7/qFIUb
         tPnE6hYP/9hM/I3qZp0N5kTUuN1hWXZ/4rOH0jegCSmxU6VplfUWv9CuN/rBfm1Gjr2J
         daX5ujkn5daU8FeWnWP9ywFB82YxrzObN2qk5KxjF3ajIvvU+hrq6lAjfptsNMLemP8k
         H3HYtLiz+MjU2BrNHGX2zqxb5BMXTvAN8bd/ftqqvz1FiocN/pT8EBt1s+0gjHqs3Iyu
         YhIw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M1ZlXZE27D6UrUq3NRhbLyZv3OS23n9TUN1nqjSmj6k=;
        b=mG/N/cGECfxwmUDjM/Iy34sNGXCVWq0cMxA9vcy3ekT6y8FdXqCr/odwG62AAxxRNb
         E819PQ5/1qoBb6CMpyHKAwmn4yYWhlnkcZErO7vP2tPz992BIdaSx0+pXfJFGixhPOsZ
         h0XXkLCTsnhuKXj0J4BfCGHoWYN3k4KN0mAu+AC2soVUQK5qkFhYKiQtBOZ7rYFtSdQc
         lfDlmaKasugXxgV7XIXPKYZ1m3iM7V1/7FESi92FE+l45s+9YVfHXNVHrj+cKBfjB/NJ
         dc3AJ1pmc8tpOad/LmViyFThEw20k/SmotQL/9rGcmNrSYIbg5/NoXIdmrW+zSqM4Dls
         ztsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=M1ZlXZE27D6UrUq3NRhbLyZv3OS23n9TUN1nqjSmj6k=;
        b=cUfrYmypsTgm7TyIzp7y9wMhq6YPoy+Wrnm97t8HEnrZudqlAOUdHNR7lhxCAdnK6l
         wtbe/O4ePBqQYmndpJh1Wny25LtDEoy/oJeaDXENqAXkRAaSQAeVqql4/e8zwh3LG7tN
         my1wRUkGugWIqOK224qTMNANmzd6CBR+UtIqb8a+M7iEQ3xldiG6IpMFLfBh4F9jr2nN
         Rs7cJdfbYcDZTbdWlBDUVr7Wql/f2Z0TeCNorJMPOQYiLuhMJZpMpgG9nIwIk0mG74Hf
         Sg/r+gK2NRoxUTUuqvYOVXF7e8mMEj5e7c84o13ctXAl5Y3v6iCmlvGHVOLokH0iapjh
         lnBw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531gfOXeqmKZHRzWTuoIAilrjbSlSQlD4IwugMsZf6djOHU6velb
	AjN677Gy39yH0ffpH+Iqzmo=
X-Google-Smtp-Source: ABdhPJyJXhimNVvFcpI7Wxh1MEjJxpD6BcwQMvarzXmUBiOq5ch09LUYNTLzwTZuL94Db74jb6OHiA==
X-Received: by 2002:ac2:5976:: with SMTP id h22mr948740lfp.507.1602664156491;
        Wed, 14 Oct 2020 01:29:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:a556:: with SMTP id e22ls481854ljn.9.gmail; Wed, 14 Oct
 2020 01:29:15 -0700 (PDT)
X-Received: by 2002:a2e:7a15:: with SMTP id v21mr1067071ljc.424.1602664155195;
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602664155; cv=none;
        d=google.com; s=arc-20160816;
        b=yQiVfGpqXmgGcC/6y5BP+LOzn2QwB3VqA1pUvd0AP1++lIO10YgUB4Rks5zdXxhyF4
         mzNDm5j5b14LyylfvDHxkmHET8riVM4oJvKlNGltyv9tYnjQVpw5R8WeTXmwgjsmuXhK
         YcikNa8eXg0jbE3AsiMiamxA/lU2EN1S/+eJgG9IG2HkGZ7d/j7EFvkREWUa5yHXl6XQ
         KYLV4tyW7sBQAAu/LNAHSmfMgY7w7CRA+s0HBQJSOo6FZaWeNN1kXhvj3fBJe5JZ+kdp
         SQcaC27hA59WtQpAme9dX2SYp5eN+fBFvTgiipFEsgIFgVHCXNQVynLInIoUowSE32Gm
         oVSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=CQHJ9ozchhP1j8etcrodJH+BkzFcUzD1L1bOfNH852A=;
        b=g6UdMExmu8M4LbPojmxUVx+VE7cAyKp/9MufR/Y7/kD1Ak03wsQxV9M6XPhEr0v9V4
         6VabsIqwXYgSs/ITUGSZssKPp9ldX5o5k2e8nULyrBo2F/vgAlnrayD2Tf/54+pOIPhy
         szaOr41EvEy49y6agHG+dlQOKaEgq9wTafaoW7AiLh2whBB50JTFkUq5lC9ak9ELEZIh
         mANWBPjPoi10lN3LrtPhv3BZUoow2KZIpd9qs7Z4XjhSEkS/jHcHMTGFivLCP8QVzO6X
         H8XOJ2PTE6YTyoZ3PWLG8FgyZyjrRTBcvzA6HIRpHm6+hshCxYYkGMEmmroHIKTHyXfh
         Xsmw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id a16si72239lfr.5.2020.10.14.01.29.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Oct 2020 01:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 09E8TESX023910
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
Received: from md1f2u6c.ad001.siemens.net ([139.22.132.102])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09E8TAJ1002644
	for <jailhouse-dev@googlegroups.com>; Wed, 14 Oct 2020 10:29:14 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 15/46] arm64: smmu: Remove IRPTNDX traces
Date: Wed, 14 Oct 2020 10:28:39 +0200
Message-Id: <9cbb73223d9cfd8ac52df3f92da79bd154dddbf5.1602664150.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602664149.git.jan.kiszka@siemens.com>
References: <cover.1602664149.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

Not used with SMMUv2, which is what we focus on.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index f17fca09..e39c2264 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -170,7 +170,6 @@
 #define CBAR_VMID_SHIFT			0
 #define CBAR_TYPE_SHIFT			16
 #define CBAR_TYPE_S2_TRANS		(0 << CBAR_TYPE_SHIFT)
-#define CBAR_IRPTNDX_SHIFT		24
 
 #define ARM_SMMU_GR1_CBA2R(n)		(0x800 + ((n) << 2))
 #define CBA2R_RW64_32BIT		(0 << 0)
@@ -246,7 +245,6 @@ enum arm_smmu_context_fmt {
 
 struct arm_smmu_cfg {
 	u8				cbndx;
-	u8				irptndx;
 	union {
 		u16			asid;
 		u16			vmid;
@@ -809,7 +807,6 @@ static int arm_smmu_cell_init(struct cell *cell)
 
 		/* We use cell->config->id here, one cell use one context */
 		cfg->cbndx = cell->config->id;
-		cfg->irptndx = cfg->cbndx;
 		cfg->vmid = cfg->cbndx + 1;
 
 		ret = arm_smmu_init_context_bank(smmu, cfg, cell);
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9cbb73223d9cfd8ac52df3f92da79bd154dddbf5.1602664150.git.jan.kiszka%40siemens.com.
