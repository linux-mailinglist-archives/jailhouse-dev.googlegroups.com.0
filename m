Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBCXU23YAKGQEU532HWA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pf1-x438.google.com (mail-pf1-x438.google.com [IPv6:2607:f8b0:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id E10B4134011
	for <lists+jailhouse-dev@lfdr.de>; Wed,  8 Jan 2020 12:16:27 +0100 (CET)
Received: by mail-pf1-x438.google.com with SMTP id 6sf1654494pfv.3
        for <lists+jailhouse-dev@lfdr.de>; Wed, 08 Jan 2020 03:16:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578482186; cv=pass;
        d=google.com; s=arc-20160816;
        b=o8K08T9q9ZeiK+/+a26z2qfy1zSFsWMh7TfTgLK45tm8nBVo22S8c67/NtGwkBIrml
         rYL4IL16/wPIBscIBDascZ2WZCuco5Q+etb74aV61HXRCEzr4O20fJD1MpAB3Rl6f4Dr
         RHnRCzhIhHDN/G+vxdlUEAVaHqu0JWgTm14/wZJ05FKaOu4gNxuQYwiRIrhlJTuRDIqa
         kbhKh+D0p3I2wzOtO9wH3TQCLjiYTjd24HUXP85R2r49G7UbaHVPCefafvjon75oCwoJ
         2SJSH4FfgoKQ/OhuYYG8NAHV7cVxVqpyXeq5Ew5vVPlV9boKnBsrX5+Dnx5OxgpOfUBF
         Sgcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=3bEJR0QkXhfQqNC3CPq37JtpjVfsbjTEu2DGSBUST8Q=;
        b=ikuwNf/wWBvVQ8JPOgumo0YzMHnOh1GbpYs7XsQNnX71L2iVlmHAH7yTErsCVA1uHh
         uuH94i+ys0CX77rtR3lyE+47AVqPwGR4hGF34wQkmkl1dFW2hOjpj17AR7PQgBHLf+tx
         3omFR9Pdk6FB/eU2NDhi0yG5DpsqlUq1VY4RxfAihXDyUQcwB0JuLKZACAnWeFu3wgdw
         i3H+9BT7mCCPEHQQm4X7pkLy1oIXNYvgURn/3V3nfqWDLCvlgGkkHqHgcn0M2OIhHn96
         yhNgO6Y5+i0gS5iH+Jy+J0+8nav/pRXcNXGfQElqqZT1QkIX1dwNivE8Xd3RJN/6a2Ki
         64Pw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tPlvWwnb;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=3bEJR0QkXhfQqNC3CPq37JtpjVfsbjTEu2DGSBUST8Q=;
        b=VqNBipS1cW8+r13ZptJaTD7oy98xfA6LoBtDtpkzsdof55a1uUVDB9RatzxetcshPo
         EpFuR9ELZxB8Tiz/fovUkubM7qzMHpgZ1nLBgVgXNFc49cuCCHtCPIIUWW8TLROefwzP
         BX21N1pMqwKjiXhtv5fuQdbSQt50QbmKhYNvzXlGO9mlj1D04HJNGXKCrKWGIYcH+0Fc
         iBQguLv3b7I0ybb5HQjTt4OAyC05Ffcb6SxFlJtwfch2Zgft9EMCsa4ZOdOXXiIQ1J9x
         Lq91AKL3L9KitqbwDssM7t/eVaNSQjobWr1WLjnEHPaEt6u7C8yyQySAl08htQQ2gxLl
         1QwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3bEJR0QkXhfQqNC3CPq37JtpjVfsbjTEu2DGSBUST8Q=;
        b=q74aCZhlgHc99vfzGvw8KcV1qKzTsCTfp7NnqSSiIncXSxNCHJ+qXWFQiy6sjsEyhs
         epFAW1P7w+zEKaU5hPd78D/1InVEEai+dw0dygBANypoelZU/Kx/5E2bMTjxeOsvOOSp
         LuHH+jLucnki8p3uqP5Q3+LepnribbOj/fhIsHRYJCj8JTfWlqosGXho2eQ9vV3xhzGh
         3wyFcLbHZdeGkJM27n1xgvyLqBWIfncUo3ep1/82a1uDjRTJnVhK1UN9vMhES4FON4DX
         ocLExXBPfaxqfsTEeyZz8PNI4aryA4rx0eP2u5mpsnHI6OjHIZQ7h9lKCBUa/EPjeLde
         3HIw==
X-Gm-Message-State: APjAAAV4WMo6naHMlmC5j2XfHtaDkORz5wr7f0UsJzzwcQN0+i3enLWd
	sW7dcEu604ZbVfmgZZMwTkQ=
X-Google-Smtp-Source: APXvYqy6jpjG1NOnYgfQdpHe8sVZO+Cby6Ymeu80OhQLmG0SIK490JxdfYL1a7g64XiNV7gbB0Z3Dg==
X-Received: by 2002:a63:5211:: with SMTP id g17mr4830505pgb.426.1578482186342;
        Wed, 08 Jan 2020 03:16:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:902:b789:: with SMTP id e9ls842316pls.4.gmail; Wed, 08
 Jan 2020 03:16:25 -0800 (PST)
X-Received: by 2002:a17:90a:e397:: with SMTP id b23mr3633107pjz.135.1578482185778;
        Wed, 08 Jan 2020 03:16:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578482185; cv=none;
        d=google.com; s=arc-20160816;
        b=C53SlISEZl76fKMs+AL0kmg1QLaseDQLkJZ/7pYsQhukR3virR/u1itz8IyizeGBDB
         8HM8r1bHCJ8CYDXKvGzUkBt0fOzB0LVDpJg1f+MVrff60fsGWtr7yuSyxqXLfRDZpBKT
         IFeytAb0eEx334s9Sv477CV+BsAO5VifCPZ9AzQfsSrZqkoSSg6fXZVi2rIJ0aMMU/9H
         6nB+X58IpoNeZJ9b1drmIMNBZaGfO8tye+VgQN6iaLWMK+cBdp11oF+Dflhkv7D6gFYC
         UT8caSBhO1zR3oFQGri2uClSwUNwNg+5rQ1LO2ltqgpCT87wWgc3iHb/KKgMcq6FN+3G
         cN4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=fIWzv2OXZFCzwsyOzQTnx31DJVGE7SeLjOc687x9DC4=;
        b=fCbZLmlnegV0a17tPrMsO8BPNVpJEQqg/kSBLjxVbBUOQ8en2GttmhsqYghH7CCBEQ
         wGH5+zGLe0tXOBlyPqnudss31Kmz8mSnuJ4nO28k9PjIU0eNo7B9E3VSYvV2/Rqs3WMy
         Iz3AZz6Yz7af0WWmdlqz7Fr6DStAEGTZ4vBASwm9uQMsFV8hovOLvBw66B+oWhnO36EA
         q/J7gHwhfPX0i6DM65zzn3dsXGrXc1KlM22O7wX2XQUz5u38IHnGSbujOrjB/4bZIIdk
         knCnJGtHqiaFxVwEkJCAQQ0fwThmTjiq9xdf6X+qP+7xtZiyYzD6LUaUvRI1ube/JaQn
         IPyw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=tPlvWwnb;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d14si88381pfo.4.2020.01.08.03.16.25
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 08 Jan 2020 03:16:25 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 008BGOWR103282;
	Wed, 8 Jan 2020 05:16:24 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 008BGO5Q111197
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 8 Jan 2020 05:16:24 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Wed, 8 Jan
 2020 05:16:24 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Wed, 8 Jan 2020 05:16:24 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 008BG8Bl031463;
	Wed, 8 Jan 2020 05:16:23 -0600
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <jan.kiszka@siemens.com>, Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 2/3] arm64: smmu-v3: Fix crash in arm_smmuv3_cell_init
Date: Wed, 8 Jan 2020 16:45:11 +0530
Message-ID: <20200108111512.9844-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108111512.9844-1-nikhil.nd@ti.com>
References: <20200108111512.9844-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=tPlvWwnb;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

arm_smmuv3_cell_init and arm_smmuv3_cell_exit calls iterate over all
iommu_units to process the ones with SMMUV3 type.

After the loop, it unconditionally issues commands with first element
of smmu. This causes Unhandled HYP exception  while enabling jailhouse.
Also, it fails to issue commands on the subsequent SMMU units.

Fix this by issuing the sync command only if the iommu is SMMUV3 type.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v1:
    * Update commit description to describe failure to
      issue cmds on 2nd SMMU unit

 hypervisor/arch/arm64/smmu-v3.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/hypervisor/arch/arm64/smmu-v3.c b/hypervisor/arch/arm64/smmu-v3.c
index dd33bda2..3889d32b 100644
--- a/hypervisor/arch/arm64/smmu-v3.c
+++ b/hypervisor/arch/arm64/smmu-v3.c
@@ -1057,12 +1057,12 @@ static int arm_smmuv3_cell_init(struct cell *cell)
 			if (ret)
 				return ret;
 		}
-	}
 
-	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
-	cmd.tlbi.vmid	= cell->config->id;
-	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
-	arm_smmu_cmdq_issue_sync(smmu);
+		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
+		cmd.tlbi.vmid	= cell->config->id;
+		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
+		arm_smmu_cmdq_issue_sync(&smmu[i]);
+	}
 
 	return 0;
 }
@@ -1084,12 +1084,12 @@ static void arm_smmuv3_cell_exit(struct cell *cell)
 		for_each_stream_id(sid, cell->config, j) {
 			arm_smmu_uninit_ste(&smmu[i], sid, cell->config->id);
 		}
-	}
 
-	cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
-	cmd.tlbi.vmid	= cell->config->id;
-	arm_smmu_cmdq_issue_cmd(smmu, &cmd);
-	arm_smmu_cmdq_issue_sync(smmu);
+		cmd.opcode	= CMDQ_OP_TLBI_S12_VMALL;
+		cmd.tlbi.vmid	= cell->config->id;
+		arm_smmu_cmdq_issue_cmd(&smmu[i], &cmd);
+		arm_smmu_cmdq_issue_sync(&smmu[i]);
+	}
 }
 
 static int arm_smmuv3_init(void)
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200108111512.9844-2-nikhil.nd%40ti.com.
