Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB2VTQPYAKGQE2NAYKKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-xc39.google.com (mail-yw1-xc39.google.com [IPv6:2607:f8b0:4864:20::c39])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC711297D1
	for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 16:14:52 +0100 (CET)
Received: by mail-yw1-xc39.google.com with SMTP id y188sf409996ywa.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 07:14:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577114091; cv=pass;
        d=google.com; s=arc-20160816;
        b=qKAu261vXkhZdWuY4P2YT6RmMVj9DHdKwyIs+ngP9omX0Q7GE8/i0BzhVqCBW/9XhV
         mJRmGtgvEAb9Jnvk+AdqolvT2q5uqu23WBa96Rq+o7vIPMsTpXCeN+0B8himmjX5ZKG1
         qyRdrLM1fbXPDBY9NCo+ol8Vxfh2SCPW+zorPkNnqsBfBPqTLEkS0rBioFl25zfDvHKW
         r14cuUvkHKTPwjqT8CG00DsJRUpeynohRbz32lY4P3xfRBUBm3ljUUouKCzSZexEfnPx
         tLEGRXtXI8cWXZpNnBo9dBepOkJNN6FRvEqjOgbzAXGZsN6E52+nIb6IoljPMgm5zJAT
         pHFg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=6IBA7kz98BOKLhe9aZWP5wFJGBCc+TeMfxXO/KmWSsI=;
        b=Og0hYk0ND1r+MsNxS6IELolrCfVQ5/FYwX6NRYPY6YX2M/qViMdqT1IfGAuVY+fEiy
         cUAoDeBSksdkfGQPXu09R+lu+PcYKjgeuIkK9eyQOyiDTp4KYEr+tNp3o3EbcNzn+1QM
         9QzK47c+7iIugZYcdS1zBz9+X0cfuNJQvtQQORBXspEWAH20b0tqRD9vNtUdkOnEJiB7
         R+b2CzgCzNZYEYSJCRYCoH33HNVomun+6oPE69FO+Jc/i1G9ieOnazo9ZWhBG9LOZTjt
         rHWIHDO8OGxyUWZMq55xjoyerfJApG79xuS7W342wdcQdkE7W4BwwmE0asR0kiwElbBp
         f/Lg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TerqY8CK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=6IBA7kz98BOKLhe9aZWP5wFJGBCc+TeMfxXO/KmWSsI=;
        b=kbQJ0duNF0VEmvxHCjHTZWaZ2yWD/DOK1YXIJmGhqDsohL6CZbzAWBwLq1reR1+IzY
         jeOmuejROf1k4qvf3r2mmf9y/T/Ofj9iNTXhCfCEK1iBmSeMNkwY+tkyYWXhproUnL6L
         dhTSUfXRQSutZ2m0n/j3Pgk3534KWHDtcnn+/cBe2PVExPnKHZyP+3h4yKbWPdRnscEZ
         kWaoQXCgkXwd5c3DnpQBcdy51Rz287p3lo28n9VkMUqGKmbihrQlaIZK4WRnBqADmpfJ
         CDkIlDPrbcsn2Mt3KPpzwg6rFQF2yzkM7mDKt6oimyKuUc0zmFrQwtCKrCI49gpMvjUg
         EcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=6IBA7kz98BOKLhe9aZWP5wFJGBCc+TeMfxXO/KmWSsI=;
        b=g9bLJVRz5YJuhEqkpzF+PqgloB7KJ5OYZkP2e91VWB94BweD2TYGueviVzuVxlQphL
         ZlK5sTzyG+YGdDRC2v1GucKdeGhujXHaLpz0CMkAdN0EAzCdPNyvfH2fCQcTlvRaBLDY
         As/zPe4oZPfI+SgkuOesosHk6gmW7u1Es/9ndx7hqc/9VxSU0odgMDGzcPOe+8gqsjDO
         lJZD8doFgGRi+N5HL/KQL9AcGSQ/xyBaLFKFp/zcXtGje/XKp3og6roH3nNwIMXbnULy
         ECApznaakg18+KhwFrIZxj/dGoSb6yeavmFNBCp3asC+8zAk2xj0WMjBuQ8LtfTyp2Lj
         FRtg==
X-Gm-Message-State: APjAAAVk++vAJ+goBpuMlbjl4uRZkM7hBqMdigMVEVkJQbtg2lDUrUo0
	EdMn+S1nGruDTfGoTN4VJ6g=
X-Google-Smtp-Source: APXvYqwz0ex0n2+XT9cuHqIpaeN5+fDPHKSiQ2W38q2XoJV0HCYgWjy9ew+w7fiNNRgMerhbnvFKKQ==
X-Received: by 2002:a25:7742:: with SMTP id s63mr21845169ybc.36.1577114091137;
        Mon, 23 Dec 2019 07:14:51 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:6ec5:: with SMTP id j188ls284585ybc.3.gmail; Mon, 23 Dec
 2019 07:14:50 -0800 (PST)
X-Received: by 2002:a25:c186:: with SMTP id r128mr22355601ybf.398.1577114090453;
        Mon, 23 Dec 2019 07:14:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577114090; cv=none;
        d=google.com; s=arc-20160816;
        b=WpTy3YlQ1AfjI4anqBQFELc+WyCCIfgmwFvz+PaeCu15giv6BIkudVCwa8VUwa/0Hw
         e8aG/04naplDEekjM1g5U1bpFx9/Kr22e26DTtwGCoOXbWLpg9di0Rv8s/f3Escj8yTP
         3aoTLxVhYR298U03ViUauW+1LNOa0L7VVeVVhjsMyh7r8GeE04ajxMvN7I5xsKrgADLT
         grZxuBiK7g7FPb44jtyqkL8qzuYGdUNIuxXa75y/WUJNQRg4WHDoRVqJDzaC/mQMwRUN
         JlSrUfc9987B9sEmbIajX30NUerR0kfFPdwEty0C9P0CbvPaUa4fcqsQKjtKYwkjTdUC
         vQrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nCMzSgSs/QBksOyovXFhP+mnybYFHF/8mr/eyBvoKpw=;
        b=fr2itmp2HfznkyNUc+Tc+ZmhduvXR8ozOXnculNIgkqjjV3+snVlse+ynmXL+1oM5o
         n8R8Q4MXAVmXNqgfq0Lp5Hh90UXsAZKbhofeg8HplR+OQUzlPdZwkwqtofSfc2BmSOpO
         t6kS3Tb/HuIoAhOnNd6kFF6QNXbs1sPwqbjZRm0FD2W54ZN6aANqLuCOqqTKQxqMaEbF
         aDUegx/j8bBcghBg6AEkjsJWkJLB6EfpLFdp5h35Bi+nV5/6W2iKSD8GWlb52LXJraTF
         MubPiNixXOuFu31JnGJzu9Xvxi23wLu8CkdGAKNcXIfvKGcyQHSeOxQCFKaz4KwkYxkb
         MMSQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=TerqY8CK;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id v72si380279ybe.1.2019.12.23.07.14.50
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 07:14:50 -0800 (PST)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEoYC012989;
	Mon, 23 Dec 2019 09:14:50 -0600
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBNFEotN117824
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 23 Dec 2019 09:14:50 -0600
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Mon, 23
 Dec 2019 09:14:49 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Mon, 23 Dec 2019 09:14:49 -0600
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBNFEZ1Q020577;
	Mon, 23 Dec 2019 09:14:48 -0600
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>
CC: <lokeshvutla@ti.com>, <jan.kiszka@siemens.com>,
        Nikhil Devshatwar
	<nikhil.nd@ti.com>
Subject: [PATCH v4 1/4] inmates: uart-8250: Add MDR quirk for enabling UART
Date: Mon, 23 Dec 2019 20:43:50 +0530
Message-ID: <20191223151353.22495-2-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191223151353.22495-1-nikhil.nd@ti.com>
References: <20191223151353.22495-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=TerqY8CK;       spf=pass
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

UART is disabled by default on TI platforms and must be enabled
via the MDR register.

Add a new flag in the jailhouse_console and apply the quirk
as part of uart_init for 8250 driver when this flag is present.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---

Notes:
    Changes from v2:
    * Use CON_HAS_MDR_QUIRK
    
    Changes from v1:
    * Use console flag for MDR quirk instead of compile time flag

 include/jailhouse/console.h | 7 ++++++-
 inmates/lib/uart-8250.c     | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index 8961c6ec..a6efd37a 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -78,7 +78,12 @@
 
 #define CON_HAS_INVERTED_GATE(flags)	!!((flags) & JAILHOUSE_CON_INVERTED_GATE)
 
-/* Bits 13-15: Reserved */
+/* Bit 13 is used to apply (set) or skip (clear) a MDR quirk on the console */
+#define JAILHOUSE_CON_MDR_QUIRK		0x2000
+
+#define CON_HAS_MDR_QUIRK(flags)	!!((flags) & JAILHOUSE_CON_MDR_QUIRK)
+
+/* Bits 14-15: Reserved */
 
 struct jailhouse_console {
 	__u64 address;
diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
index fb7940d2..5492e065 100644
--- a/inmates/lib/uart-8250.c
+++ b/inmates/lib/uart-8250.c
@@ -49,6 +49,7 @@
 #define  UART_LCR_DLAB		0x80
 #define UART_LSR		0x5
 #define  UART_LSR_THRE		0x20
+#define  UART_MDR1		0x8
 
 static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
 {
@@ -67,6 +68,8 @@ static void uart_8250_init(struct uart_chip *chip)
 		chip->reg_out(chip, UART_DLL, chip->divider);
 		chip->reg_out(chip, UART_DLM, 0);
 		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
+		if (CON_HAS_MDR_QUIRK(comm_region->console.flags))
+			chip->reg_out(chip, UART_MDR1, 0);
 	}
 }
 
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20191223151353.22495-2-nikhil.nd%40ti.com.
