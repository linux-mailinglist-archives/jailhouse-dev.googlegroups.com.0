Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBBGTRD3QKGQEBCSSW4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x53a.google.com (mail-pg1-x53a.google.com [IPv6:2607:f8b0:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D6F1F6852
	for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 14:54:30 +0200 (CEST)
Received: by mail-pg1-x53a.google.com with SMTP id 126sf3786155pge.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 11 Jun 2020 05:54:30 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591880069; cv=pass;
        d=google.com; s=arc-20160816;
        b=QHjXlqo/MXmezM+wTgYNGCl1m0KgOPQ3zYRPWr/5hItNbMzNEM+IT6EKvCVDVadhYH
         OkIP8VUuOai0JvcGCobCu/lh77cb+b5pyIqlcYNotTIrWLBgSOIximvTI0Mr78a15xqj
         0Zv/X+1TeZWr077NYGtHWmsp8xV45M9PhkXu6OK25us8PwVzS1sjRhfZNsuX92aNC4nj
         GlfL4fpvKGitqMU0Ifp1heTNcR+pNBnovjdlaJgojmfkv37zoevItEarN092PbYcsJMP
         hL1fUha90DyiHjsqnm4GBrIKVAFz+XTdN3Ko3FeA5ohUROTFt70r3BlmpvJdoxmKqNJA
         4lOQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=dwY0+61VqROMD9aV2sKzO212gXknTRiCPjBrm17sIuY=;
        b=qOuhghVON0Xji+2PV/MSSJxB0XMOnmBnDfXA2Ue7kgY3txR6giSrrDxgaW3WkSM6EM
         UnuGEii1chezg4ISocbDuXe27ouIGy8F/4Tp2qEPhwbJDdUEdsSmXO/m8NIVUB7pJKfz
         0yaeaENBC34XsJkATiGsJeVsG9bDUdEdjsDMQgKtcwhaxNolZMH4JEurgBt7cUsj0vWi
         egkQpKWSrZiK9p6RlWot7Ydtd5l74xWi+oev8k8+6gqPzvjq6qPWuj8Cw0l4tGoxvLXh
         B6l/o3ho/AMIY+4PxbB7k+V2Vf1KoEn0tLpQa8jdQxZzstk9lg+SZs9z2QVcK1xZ97zD
         guJQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ub7hr9n0;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=dwY0+61VqROMD9aV2sKzO212gXknTRiCPjBrm17sIuY=;
        b=hMt56Rdak/Z+Np7qVJwYX0/DFN1onhso2tziqVBISAmAxGGINbccq8VhbR/Em7kbKu
         iI2xIz+WHz+sSJlNFZkWcsyVKYRv0pXhRNOyD3MiAGnPzHgpOjDMM/2QN96GWfk7RL9X
         cVs2X2Fm3N8o8MRG3rYnK5+lATFH0YAWJFw8W4yfrpGwOMb9mOePbXMpn0eqZFZivNx3
         N8IQUUa44XCab+9OSAHbcV5DhsPzaBYo4RUE6y4Uai4N1HbZLtcscqIzCp/ZPBOFgDqG
         xMKzmbDjkk9vDkP652R55fo+9wFWmb5xuvYMbOpHZCjbZkN52hXZD9xIZNNQ/IX2FImM
         XpMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=dwY0+61VqROMD9aV2sKzO212gXknTRiCPjBrm17sIuY=;
        b=T6nx3O/ul0pfhf3zt4bzSu3SLg5ZPQTUYaGTVsle7CNsUZmpYx/iKdGlV6A7ar1Bxg
         BhzptxxTNeZtk+jR25qc/XwQzIwS3sz4S8JT/9GGhUaYIrkGr8RcZIeizAsfQMM/shR/
         cNn4I3yxOEqrWxwilFZeHNamB8QF+nzeRbU6mPnVWz4a0GrBEi0GamscZuEQnTQzqvdF
         kGItM46m/I5AnP9OoMkoCXVYOJzEwljBMLUdjfT3dBTRDJnc521KI/8E0rv0Poiiel/0
         ZecyReuCLlZRLPF/aij6Oht2UAfRzQxz0z616120XKaDj8gPfrxP6q3obTUXi1gC2e6J
         ZXNA==
X-Gm-Message-State: AOAM530eJyKfhqXoFGMVEgT+tWt+xblOf6CO00d1tVz3yXHNPa4inpFr
	tpCovqfJ+Sjjkqf4sAlMVG0=
X-Google-Smtp-Source: ABdhPJz+4/Lkg5h2PGTRxWyB56occDUrBPojIlrFFO4cGXeTt3Jw33RU+rf+ayD1Nr6CyybDU14G8Q==
X-Received: by 2002:a62:9255:: with SMTP id o82mr7074665pfd.218.1591880069058;
        Thu, 11 Jun 2020 05:54:29 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a63:f410:: with SMTP id g16ls358496pgi.0.gmail; Thu, 11 Jun
 2020 05:54:28 -0700 (PDT)
X-Received: by 2002:a63:a558:: with SMTP id r24mr2805979pgu.70.1591880068425;
        Thu, 11 Jun 2020 05:54:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591880068; cv=none;
        d=google.com; s=arc-20160816;
        b=W2UuE4serlV0ZMIpLU4GX4H4/JPj6uaajB+rG4usNJmfFm7Ov3Gkz0omrIAmJyCKV/
         re3k6QNrful4sWjgU51zY/5IB32xSe18DjSB+R3tA3OANjtQSWZe2a9RCUrKvwNRZHli
         h2jTGtv2hBkBxT7miKlhoRMzz/d35Fd8/UnClUHYKqy96il1i3AFflYgIVCjNQND3Auq
         C4Z7BeBgoSuiWdKWzCCo+/nNFjy9x0Uxo5QjFoXfq/Tjt1etbfBHc9RGB8rTMm/2tbUP
         FmeQ1HSxm2IkkwgcqsvoqqkUs2bNTPi8CPSzO+mp96vN+2CpXxViYTgF7d3MH+bIDu3I
         E7Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=eJzbmuRcYy1p1enZtkbkAziLfFtIUN6wyKWxa3K3nDs=;
        b=N9xczWVWkYqb44GC2I0/SUVTg6a4Yk505VvRgaDSBStjbyCyCa+uI7UM49DOSM7HZU
         Ius9Fd8xJCaLPiuXttHBB5aDTYj/7FnToDzOrdYf8XAk3IEVf0YnFFf1y8XySzOyQUsl
         QlVfiH2+fxGLYxyR8oK1tmAR8cfJs9aSrQSG1v0B7Q6nLtRoMLinLB4Tn6Hg379JTU9v
         oiqYrzV1vB+/tbsGrHYb+wCze7yzEjponB++y+S704ns5GKA6nXKHqeTOrq59d9bpwEZ
         Puu5l3QpbvU2jHkKv4VHMFSYDrhW+3V/hDU9a20gU/YL8fxaNwLruZ7TCGn5w7msCOno
         3UTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Ub7hr9n0;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id kb2si181470pjb.1.2020.06.11.05.54.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Jun 2020 05:54:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsRr5079746;
	Thu, 11 Jun 2020 07:54:27 -0500
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 05BCsRho104458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 Jun 2020 07:54:27 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 11
 Jun 2020 07:54:27 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 11 Jun 2020 07:54:27 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 05BCsN2e062138;
	Thu, 11 Jun 2020 07:54:26 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v3 1/9] include: cell-config: Add new macros for 64K aigned BAR
Date: Thu, 11 Jun 2020 18:24:15 +0530
Message-ID: <20200611125423.16770-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200611125423.16770-1-nikhil.nd@ti.com>
References: <20200611125423.16770-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Ub7hr9n0;       spf=pass
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

When working with a kernel using 64k page sizes, the BARs
used for enumerating the IVSHMEM PCIe device should be
aligned with 64k page size.

Add new macros which describe 64k aligned BAR sizes.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 include/jailhouse/cell-config.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 47fc251f..6df4a745 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -226,6 +226,18 @@ struct jailhouse_pci_device {
 		0x00000000, 0x00000000, 0x00000000,	\
 	}
 
+#define JAILHOUSE_IVSHMEM_BAR_MASK_INTX_64K		\
+	{						\
+		0xffff0000, 0x00000000, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
+	}
+
+#define JAILHOUSE_IVSHMEM_BAR_MASK_MSIX_64K		\
+	{						\
+		0xffff0000, 0xfffffe00, 0x00000000,	\
+		0x00000000, 0x00000000, 0x00000000,	\
+	}
+
 #define JAILHOUSE_PCI_EXT_CAP		0x8000
 
 #define JAILHOUSE_PCICAPS_WRITE		0x0001
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200611125423.16770-2-nikhil.nd%40ti.com.
