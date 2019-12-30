Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNHVU7YAKGQERZ2OCIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53e.google.com (mail-pg1-x53e.google.com [IPv6:2607:f8b0:4864:20::53e])
	by mail.lfdr.de (Postfix) with ESMTPS id 520E812D040
	for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 14:25:10 +0100 (CET)
Received: by mail-pg1-x53e.google.com with SMTP id a4sf22835921pgq.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 30 Dec 2019 05:25:10 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577712308; cv=pass;
        d=google.com; s=arc-20160816;
        b=zgeHwErIUBoQXoZeILyvfKC/wmz+LgnIN/N3E0nmrF3KW7yDZqKRde0CwWp55Vm1gu
         3zXOipembALCedILq1+KvQVU2hL7T5Uf4b8LZma7SNP95XKAivQUwtFJ05QZi9fU3sAl
         Rt4OjKy119O08iIzqqmw5eLHeTGHjazUWh3/TkfDg2H+HDuk0DEWXYlqYQu/pWshuC4B
         nbwpe3edbxCg0wxZAWaxAe2A3TP/qwttPKm01jrOgD21V8UIvS6jzRjUloIXCNTCkm2W
         J08W0XoqsFHWcErQPnj0Q41uU4ea4uXUZSSMZUz95+NePiYJJ74MwuQ//MP3TAwNHp1v
         8G3Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=e5D5U+CAiMX9qGUGsit8/QU/Ld6td2ZuqgHA8hOAbqU=;
        b=ODOzmx9kM1zrwzBatoqHipBhHsUfLvB5vO8DcZ+CjkAnxVK4k6GAFWTEkKV8vlm6mE
         uzh4J+BB5Ext4en1devPIfvbiwivwFBmAbo5bJyDfI85YfHIL2SiSGtXzewbaOCOW+Gv
         6gHmmOVDHadseeFHZRp5GhwE1x3Suo1ZviB/wUMnnlsOunila0gO7oyPiutg4WNh+ZV2
         8CfNEhbMn2snFNCQatCdkmQ9RQcVfJTpwSImmz5hSc7o9CnvYVRZAHfagefeRcmqmuIW
         kexcT4V4DsFLToqKfI5hwybiKsYMtU+pi9euk9lXFX78tYD2/SqlsTzWJHJecIgAQUMf
         t3fA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KzBnv62t;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=e5D5U+CAiMX9qGUGsit8/QU/Ld6td2ZuqgHA8hOAbqU=;
        b=m0hx6GkrseujptIFkuXFeFw6h7raaGZS2kLhTzVYHC1TpWngFj7FecBMJ0HJv6BEJj
         XwDor4rNkqE4OzjGZw+MwLHgeyLtt2M6QOrtkSX7T3mgvV0n/VcKxrNHTu9pqji2tL3w
         zd/qXkYpDQSuU0UKs8EkKiIVF996yv4PB832qQiThnF5z1SC+knfFrwtwWi80jlIX0BD
         MciulzaEQiT0UdHCBPiS0eqQjtHd5VNJhhxz/gtctexrUAUdg5OMxCrLNVEytgp5tZvx
         nSULhJ9ZjbU8Rwxqfj7jSSEoAgMrlf1FuK6RFDSoUeyKNVmbXJTvv75MNvV+r81EZV+h
         H1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=e5D5U+CAiMX9qGUGsit8/QU/Ld6td2ZuqgHA8hOAbqU=;
        b=YcjNzvGa1q+CxLh2HqBW79Yh1/8baWfj+o5oOrYzzWv7PgLkjt81Gn3OzLkPzEe/z/
         R/NwZ+KKpti8j/Ir5fXAaqOoaKhHbNniCU9U6SkdmTjB77hLi4P9CWW2x40UpHM0tAY3
         JF36kfLqKpKMoJ8iiKeh/5YjZsMCmUxDNbhoU1gRemLJksImgb1iYtkjEAH4gdoD6oC9
         4g98DtfE3z4M5i3GhjztDUxkPtGhhSpD2Z+PLzO/3XXD/BeSgeR48ScYTzmgtcgp67uz
         W/xQcwrVnCuEj2+mOl+cMPPMJdH6wx5/A51tcGVASCJmy6ibWPNfUXej1IuFfbl0ndbV
         QUIQ==
X-Gm-Message-State: APjAAAUd/ZjV5ctKWEv3//MdQQci48vhsqW9IKkDEjf8v2sfrtK9DW6u
	iV2ku53EXebOVGx3k4gAZiQ=
X-Google-Smtp-Source: APXvYqzVI2h7ct7drvznJA9JHLLCEiVkiqi/CUK8yjXZIaQBpJHx77wQo0cSQCu+nE2g+WRz7HbpaQ==
X-Received: by 2002:aa7:864a:: with SMTP id a10mr24799434pfo.233.1577712308581;
        Mon, 30 Dec 2019 05:25:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a65:6389:: with SMTP id h9ls3122281pgv.10.gmail; Mon, 30 Dec
 2019 05:25:07 -0800 (PST)
X-Received: by 2002:a63:5211:: with SMTP id g17mr74573457pgb.426.1577712307730;
        Mon, 30 Dec 2019 05:25:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577712307; cv=none;
        d=google.com; s=arc-20160816;
        b=cBCm+EIt3JRwEJuyZs7v1w8VUXl9ZfilUPl3/FbCgGtyCupjxvjlLHGFQ/4N17xxHp
         Q/xtLKx2tZ2/fcOrTyJi6fJ6Cdybu3LOr1ZPMzne97ARyUtUf2ol+/rgl2raJquC38CW
         NM/fRkV8e8R1rgXZ/wdXa61/xmoyAVjVmEljRAMKokRg0CZ/NbRRfb8dSTQ/z6cj/z8y
         4QO43K21kVCI3RQZlzFGQpclan5XjWnGboqFFBE3jOfXmrPh3jnZY0NsCSD9uk0DiDIe
         JzNgRJpNvY7ID6cx3p419kV1y/PdizE8yaM59SeAZLUy1atb5rcsDWKTWsYvrhihEugL
         4cRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=QxaBRBVpzJXCWGaf2KzR2McwvHHViW7QEHHUtseZkrY=;
        b=iNmbUJPbIhyDxuFw8MnmLm6PGk91YTKk2mSn0aTo2owrQXykNshIw36yna/Yo5W1dI
         tT7ZmBxHMIrK5UgsfrAM8dvgiIcRymvhF7u9SLR29WSRjL1MinUYchtPa99YsSDGmJ1B
         byxs3r/UAf/hDNm0LFEDiPQAPSXssBktwbzKePLkorPTJKep5sdATKqVqGSHeQfdrZjl
         oFWVoy3/i1rcXakJswUQ8hUsShcXUDWlYmWVjSO5Dpr+IuRtmav2+GDFMmoATTxXKgya
         btU77DPvkO2qkZ6Q7bHekTuULXZR1UCBsnTzfFftTgDRs8+qjcie2hPz2tk8lCQXl8qn
         pQZw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=KzBnv62t;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id d14si1680159pfo.4.2019.12.30.05.25.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Dec 2019 05:25:07 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP6Op117023;
	Mon, 30 Dec 2019 07:25:06 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBUDP6O4002769
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 30 Dec 2019 07:25:06 -0600
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 30
 Dec 2019 07:25:06 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 30 Dec 2019 07:25:06 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBUDP0ob120516;
	Mon, 30 Dec 2019 07:25:05 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v1 2/4] arm64: smmu-v3: Fix crash when first iommu is not SMMUV3
Date: Mon, 30 Dec 2019 18:54:04 +0530
Message-ID: <20191230132406.19985-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230132406.19985-1-nikhil.nd@ti.com>
References: <20191230132406.19985-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=KzBnv62t;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

arm_smmuv3_cell_init and arm_smmuv3_cell_exit calls iterate over all
iommu_units to process the ones with SMMUV3 type.

After the loop, it unconditionally issues commands with first element
of smmu. This causes Unhandled HYP exception  while enabling jailhouse.

Fix this by issuing the sync command only if the iommu is SMMUV3 type.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191230132406.19985-3-nikhil.nd%40ti.com.
