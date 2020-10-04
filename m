Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBO5X5D5QKGQEECOF2TA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x437.google.com (mail-wr1-x437.google.com [IPv6:2a00:1450:4864:20::437])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A66282CB4
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:12 +0200 (CEST)
Received: by mail-wr1-x437.google.com with SMTP id 33sf3117589wrk.12
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838012; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ej7lA28o9nl0xsIVyEZBrxTfBCwoHVKyqVgNenK/s0UphcgqbelVYES6WBhfuqGR+E
         QFkazEutT0kxTNXUuljdcICdqgzzcnSbgkyvXlWZwVFxcu6vJAk9ciRymQefPwrMsVKN
         uj/3N63YQAKZOf0Vr61ZhphfIblKFlb7CgCT4lbp6CAZUmNeJ38usMkyaBFRswZe4m4k
         k/3IFyg6ei40eaFZGu6Dqs8U4ZZ2V94q7RH0mkhO4fa3gb+GS5lJHmZ4XPdypV31g9z7
         NodwgP9lDBcHmXp9S64c4zz5naNHTW2WpfI1zgcuSljc5Hcrc4uB3NASIw7nu7sq2tBn
         1mCw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=pOJ7pQgeCWpuPfkgHWq+r0mynFDouTGi8PacXuIqGHs=;
        b=TLomQ+BIWx6m0iAlYoFFWQpMfa5M4sCsLMIOD5SS8ZnHrGmZCLHSFZlAkfot60j+LP
         67QHfTdIF1BLxXf48ujwqKad60MZI1rnR46PCKRxBsjjDYRVs49keu0UwyAyqzlhEXej
         S2WcHQhAqdxfY6BnVl45qqw61kzimJLH5wLA1AjeU/Hne/nwLIEhEwZH39HT3xdil0Uj
         2FYV6ncV/AIb8ewumrpppQCxC3lWlaZLu/RFhdjS/eLqJwsAQQhoQLNDiD13aE3HGtnG
         +q270eDc+NP7qatqmQpZOl7iUBXCfExDyGXTTapdSe1tMdboeoag+41azIClF/5rFHaL
         5N2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pOJ7pQgeCWpuPfkgHWq+r0mynFDouTGi8PacXuIqGHs=;
        b=K1DKWN8140zf+sxlf+auCmbHTjiZfO2fAPikHN51jMo0LJWMEn7+/ymq76ewoP2K9E
         UiaSWsAMJaGxJsISZ4GTmJE2SCQvPdZNl1yWxSrYM/d2scgHBfP420qDS4R35EYo2Mo4
         5psMoGSwz1yRUa6/icp1TxLen4QfJHGnnVZ8W2CExfrzd+L6tvFn67fv03UZ5/6ILj7/
         CoANF8oFYIF51vn0rA6j3ScsRB6271DAxYf6TKDWWOMZvd2e6YzA/pq4K2AsnLac5Lz7
         PSKPGQ0h3sdwoTfxIq3oNltAN/hgZUVyQfKCgR3t46gAj9JcxFVNamIsSS1mQsXNjZtz
         1m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=pOJ7pQgeCWpuPfkgHWq+r0mynFDouTGi8PacXuIqGHs=;
        b=pWmZBAdjEfP0S2orZw5NyV6Khi4nnoCU7JNdhFuCg5xccrVeUYvUmRcGlVreDGyACA
         cvgv39leyU/BDfgCWoJYMrXnrhrPshUw8qTAevPHMO6uaVwSBcnPuTVw6SPdP1ISnPo8
         n3zxQdlenl/nnvaKrUs6wYnML1IFNgi0SH1HTGnvCEIcgiKbOzwa0Lljk4KOhF3Ji9I3
         cPcMXN1UQgYRtrUCLTc9JXJ70LxY9iMyy2a3e92GlQ4dDdKPjs9Ox1fmY9NOpcHxoAJ4
         9MJDyXQDqOI23ZcnVW+A3YaOeAhZezhG7n0j6N5a3npJv7pNQQB+eegPTs0quIF+uq0U
         k5xg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532j6xnXuvP0T5oaqyx/6wI0LcR4bnm+qhRgUgm3qVM+L+0Z1SFA
	EdNB9YvJLz9mqSUUO0PYjhM=
X-Google-Smtp-Source: ABdhPJzKpFlwadWOniiicM6UfsBQd0kw8xGGIG9ORPacw+goaRb5pNt4xMXpEF9v22Rz3MEXy1uj2g==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr2419016wro.326.1601838012039;
        Sun, 04 Oct 2020 12:00:12 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:230d:: with SMTP id 13ls3550029wmo.0.canary-gmail;
 Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-Received: by 2002:a1c:4b0f:: with SMTP id y15mr13695005wma.165.1601838010943;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=YyahMTnl2cdXAVDjsSh0Hjw3VuZBaRgskMbNeD2OhWvytbR+20Y7JMc1WzlMaFnyEC
         di+d4UedOzOIhSfWfvIkyJ/viAMHcm35U3VG45ihukoc4ON+nf1zFfU7RH7beH8yBup+
         EgvqADxEHVmKkjYI2Jpxqk41ctDmPKAJhDjvuBZVTcPpchVi/aRJnp8AnW+oSw6zrjO/
         P23vpo78RhDpUZfRYSGwTb2Iik3zQStFnjW2/glbCdhSCbItg8ANYVAfmp9vFvouc3pi
         vcrSZHZcdJWATq7TXDFHrgB9OzFazOR1HVyELuHVTRpKHWKHVR4hg+Q5PTKfboRg5Ijp
         8SdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=ML70qeWad+pnfvExdmDIAM15d7hORrW40z1yYnfYsM0=;
        b=m3Qv+XFG+lAMXQC+NUGYuXTj+9mq5QWp+aQ1IoZzC7oHzj9dVxjNgHAqGOVoEUMEhQ
         QGRcYhHTYVvZOuT2gibbnuytGRczR77WWF0a+DpHU/7yJkiZIeoNqv9mmG6wPBAM/0ma
         z/5uNseONIQIt+eXD5J0S7ohI4GZMndz0O41wuMThHnr/7tTTkLqQ3Kmw1J71Ed7YrsV
         Nl06cltGuOgH7eAr9MhrvJEI8S+voFXph82c1sV8Gnv1yKhxJ8eQVwDeuqWTmVhuklGZ
         SIHmLFnUJEwcj0lHVVnHuzw3i5kePK4RhMUwBNc/fWHP4QL3m5OaW/AnLxLB5iqpjwR5
         emKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id c144si157085wme.2.2020.10.04.12.00.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 094J0AIU029739
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060O017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:10 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 12/45] arm64: smmu: Add shutdown handler
Date: Sun,  4 Oct 2020 20:59:33 +0200
Message-Id: <0bcb9f9f3795c42576304889855aba72b5f3a67b.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
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

Properly disable the SMMU on shutdown as well as on errors during setup.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 30 ++++++++++++++++++++++++------
 1 file changed, 24 insertions(+), 6 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index 34c99a6a..f20a44f6 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -890,6 +890,17 @@ static void arm_smmu_cell_exit(struct cell *cell)
 	}
 }
 
+static void arm_smmu_shutdown(void)
+{
+	struct arm_smmu_device *smmu;
+	unsigned int dev;
+
+	for_each_smmu(smmu, dev) {
+		mmio_write32(ARM_SMMU_GR0_NS(smmu) + ARM_SMMU_GR0_sCR0,
+			     sCR0_CLIENTPD);
+	}
+}
+
 static int arm_smmu_init(void)
 {
 	struct jailhouse_iommu *iommu;
@@ -906,8 +917,10 @@ static int arm_smmu_init(void)
 		smmu->arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
 		smmu->base = paging_map_device(iommu->base, iommu->size);
-		if (!smmu->base)
-			return -ENOMEM;
+		if (!smmu->base) {
+			err = -ENOMEM;
+			goto error;
+		}
 
 		printk("ARM MMU500 at 0x%llx with:\n", iommu->base);
 
@@ -915,11 +928,11 @@ static int arm_smmu_init(void)
 
 		err = arm_smmu_device_cfg_probe(smmu);
 		if (err)
-			return err;
+			goto error;
 
 		err = arm_smmu_device_reset(smmu);
 		if (err)
-			return err;
+			goto error;
 
 		arm_smmu_test_smr_masks(smmu);
 
@@ -929,9 +942,14 @@ static int arm_smmu_init(void)
 	if (num_smmu_devices == 0)
 		return 0;
 
-	return arm_smmu_cell_init(&root_cell);
+	err = arm_smmu_cell_init(&root_cell);
+	if (!err)
+		return 0;
+
+error:
+	arm_smmu_shutdown();
+	return err;
 }
 
 DEFINE_UNIT_MMIO_COUNT_REGIONS_STUB(arm_smmu);
-DEFINE_UNIT_SHUTDOWN_STUB(arm_smmu);
 DEFINE_UNIT(arm_smmu, "ARM SMMU");
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/0bcb9f9f3795c42576304889855aba72b5f3a67b.1601838005.git.jan.kiszka%40siemens.com.
