Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAFL2GBAMGQEWQ63CSQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDB53416CC
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 08:40:49 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id r12sf2052897ljp.22
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 00:40:49 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1616139648; cv=pass;
        d=google.com; s=arc-20160816;
        b=1HHFxe+10TSyPxs6sKRwPFzVZN2t1GMZcrekKwxwQBazEdzSJxtRLdMFuRsBmQ1hcp
         6NAyAXr5wABGEU5LCaaV2qBdf57newS1JnrUq2ilftOFUVXPVN26KS53FEz2h6LJV0dF
         l4M6endhfdd8Z4E2Xb3iQit68l3Vm064ULWNuHPm+oUXtX3I1qWNgq4pkrSfTxIHU9FY
         XPw+mpe1wPBvkROo9I6jwr1y1CB6LnGFEMh1bl/tcfBemRnSoguYLKZVeG3J8U29jIky
         EVJbFY7/nAAdCExeo1AFK0+HcB3IzssPW3D93vFVHAMogJSziCD3OcINuX0cYZ5Is6PV
         DeMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=8lv6T7u/ZjH9njDRGTkf0kt/GInFrJV9cWQsKOtl+Y0=;
        b=iXzKiv8xCExl7K8MFCLeyUuBaOn4C71YSKXIDM5j6CCO7TVak2wjdxkpUURlLS4hKW
         egrNgiO23VJy2HI4kZRKvHrdsx2pIKekcyeShi62g4mlk+4AEDrWcXEUw1HA76GPxAcg
         BmIJ1bN+nBMHWSx/4UUZdsGCbeh38V0na39TbSBiReDcy337gxcYLNReBYrhyUSh3RsC
         pkypR9DwHlYKTWyaOtmV9JcxujGfaqhCdpicg1SZe5XsEhK/tgzL+7d0wfwzPsiPHBg4
         k1nwhcAL0P6VnCOmiGJdh/uCl4C/oRA6QK6nsVKdGm4RVb2OGn2ckUc0UAwfqEr4r5Id
         Jx4g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8lv6T7u/ZjH9njDRGTkf0kt/GInFrJV9cWQsKOtl+Y0=;
        b=gUzLIQwDMHU8sNQRzZx5h+Lbzzltm56M5/T1tCUohSm+vJBKWaeC2DQQMBi2qfslcu
         agy3xk9DjUSbKh7Wz6OOIBxfDlTTJWRKLHMwEx6Iejo1qIL3wMpnGCnQJD5JOMNULNxA
         tSwuPDsMslu0l6kSVS2rWhJrg+FB3RmVgN6qdEZvO6Qa6yQvCRhsSC3aBU+sDGtA9UC1
         X4kYCSvdjBO1W7kFa1NnTBCbS7fS72fjc8GAKn0aJZNh0lTXeuLqFDBA/zzTU+ezBCKX
         BAmpH7zte/Ef9z2rfQkuX1BG6ERu5qCK01AOB/HzBMGBsm9SRfSbK16HJbiulnSankyu
         qO0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=8lv6T7u/ZjH9njDRGTkf0kt/GInFrJV9cWQsKOtl+Y0=;
        b=Ii1aPhcgo7sVc0+GoaQJAPCU0QdwrzvUFLGA7w5Sl4vM/muE+W2Q1bSGrhq4BFHSOz
         sKjTfSlGbQ66Ustxt/PF7X48fAW1A8CaaXc3Y6irZSOZjcD3GGdVA+564Ux02OEmqX2W
         eTsZHpfJr8AtmC8nmpGYdclV6JCOSRY5bBmO+VgiZoK+DMtk1dexlrNMJm+8U9jwzaso
         CixBpE4Qai8rNMWLqlRZP6wrPul+MbgDgkGQNP3I+g4TBhUR5rMjeUSWMQLUIbFOXmGM
         Yj86K3ncj6upEbWBMS/+8W7GEZdnq/Z8FzL8OLQgWqO/JX77gvLWLs+9oZoQYEG9ohcP
         pVSA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533kmNkRl7sSvt8fmZuUhRy7O8Li9iM6d4XgFGLRoeTbZrtLhuRN
	wGDJZJgH8xQenxoa0reJqHs=
X-Google-Smtp-Source: ABdhPJwhGh9Q12qLDTNOKMa1rd0lireNOGXOAXf5O+lXTn1YrL1vJ3uYG38jiRvXXLTVHNaxfdLmCw==
X-Received: by 2002:a2e:5804:: with SMTP id m4mr54624ljb.419.1616139648631;
        Fri, 19 Mar 2021 00:40:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls3708521lff.1.gmail; Fri, 19
 Mar 2021 00:40:47 -0700 (PDT)
X-Received: by 2002:ac2:484d:: with SMTP id 13mr77190lfy.124.1616139647497;
        Fri, 19 Mar 2021 00:40:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616139647; cv=none;
        d=google.com; s=arc-20160816;
        b=oHitU5Of0roVVLSfjiWVezQsXi5Ycj4TZ1sS48bCRAOYGU8Ys3War8Xpsg3c/zkN2c
         9E96l9ZZUC/HO7GPK1jHrEGmixzPBlzRAshImhMfIqT+WJVO9RMP2Qj0lvcTC/vpflL2
         zCgbH5nXpGRxJwYIMVxBJAXnEqFoSyh6ZYASWfthKKt+q1UCnJFPGFQ99AhqOryGjxoy
         Mbd925GqAaYbfjaygqexuujfMomeCKZbd6SvOiyP/F3pYAmhqJlbumfwDdoOXtXHmyjx
         nFSMQwtRLcZpyDsmJvR7DN8lFTM0vvySN+AGz/e4A9KchO+WknctLEhe94DrwAirvqD/
         vZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=v6rqHQ66UzyATE/Vd0rLeI6NHeDDXUbrw8enUgNO/Ps=;
        b=bEu7VVHJs0nkF/dMbEpeaEZV3nZsw///sQdybUsFy3aJ6/dSnRBCSZ8jKzfJ1V5ViD
         qT36mtlutYqR+uqsa3JnoFHBDulXFMefNSDbiS59g719zY9WqX84U8qDe6/2hRg6wXnG
         xKblzINNmNXBYTEAMoSw2vJZ0ViRLNj4n8y4iSXxzznm0y6mOCq/qT0rECRU8mQoDusw
         WcQ4M4ZRfn7CihDo6+P+q/oEuk/uT9nKYtKYfKTmYptwUjp4XHHD9CdHvzIV2SYwcywW
         3hftA6WTLB6Cg6+gis5hDjAC9S5RMV3hNLvflevO6ulq0bvabN1uAqrKW4iVnTocqHcI
         waEw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id v203si3518lfa.10.2021.03.19.00.40.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 19 Mar 2021 00:40:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 12J7ekVR028647
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Mar 2021 08:40:46 +0100
Received: from md1f2u6c.ad001.siemens.net ([167.87.41.130])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 12J7UjC1004384;
	Fri, 19 Mar 2021 08:30:46 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Cc: Alice Guo <alice.guo@nxp.com>
Subject: [PATCH 03/11] arm/arm64: Add further smc helpers
Date: Fri, 19 Mar 2021 08:30:37 +0100
Message-Id: <839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17.1616139045.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1616139045.git.jan.kiszka@siemens.com>
References: <cover.1616139045.git.jan.kiszka@siemens.com>
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

Will be used for SDEI. Actually not on ARM, but we add the smc_arg2 to
please the build and avoid surprises once it is used for real.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm/include/asm/smc.h   | 14 +++++++++++
 hypervisor/arch/arm64/include/asm/smc.h | 33 +++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/hypervisor/arch/arm/include/asm/smc.h b/hypervisor/arch/arm/include/asm/smc.h
index b70af8be..b7348627 100644
--- a/hypervisor/arch/arm/include/asm/smc.h
+++ b/hypervisor/arch/arm/include/asm/smc.h
@@ -35,3 +35,17 @@ static inline int smc_arg1(unsigned long id, unsigned long par1)
 
 	return __id;
 }
+
+static inline long smc_arg2(unsigned long id, unsigned long par1,
+			    unsigned long par2)
+{
+	register unsigned long __id asm("r0") = id;
+	register unsigned long __par1 asm("r1") = par1;
+	register unsigned long __par2 asm("r2") = par2;
+
+	asm volatile ("smc #0\n\t"
+		: "+r" (__id), "+r" (__par1), "+r" (__par2)
+		: : "memory", "r3");
+
+	return __id;
+}
diff --git a/hypervisor/arch/arm64/include/asm/smc.h b/hypervisor/arch/arm64/include/asm/smc.h
index 27e5397b..ecd2cac6 100644
--- a/hypervisor/arch/arm64/include/asm/smc.h
+++ b/hypervisor/arch/arm64/include/asm/smc.h
@@ -32,3 +32,36 @@ static inline long smc_arg1(unsigned long id, unsigned long par1)
 
 	return __id;
 }
+
+static inline long smc_arg2(unsigned long id, unsigned long par1,
+			    unsigned long par2)
+{
+	register unsigned long __id asm("r0") = id;
+	register unsigned long __par1 asm("r1") = par1;
+	register unsigned long __par2 asm("r2") = par2;
+
+	asm volatile ("smc #0\n\t"
+		: "+r" (__id), "+r" (__par1), "+r" (__par2)
+		: : "memory", "x3");
+
+	return __id;
+}
+
+static inline long smc_arg5(unsigned long id, unsigned long par1,
+			    unsigned long par2, unsigned long par3,
+			    unsigned long par4, unsigned long par5)
+{
+	register unsigned long __id asm("r0") = id;
+	register unsigned long __par1 asm("r1") = par1;
+	register unsigned long __par2 asm("r2") = par2;
+	register unsigned long __par3 asm("r3") = par3;
+	register unsigned long __par4 asm("r4") = par4;
+	register unsigned long __par5 asm("r5") = par5;
+
+	asm volatile ("smc #0\n\t"
+		: "+r" (__id), "+r" (__par1), "+r" (__par2), "+r" (__par3),
+		  "+r"(__par4), "+r"(__par5)
+		: : "memory");
+
+	return __id;
+}
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/839f3ab97da1aa1bb98bf8e0afcd66ae6d33ff17.1616139045.git.jan.kiszka%40siemens.com.
