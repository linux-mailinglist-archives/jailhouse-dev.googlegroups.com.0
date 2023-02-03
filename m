Return-Path: <jailhouse-dev+bncBC4ILIEFEIINHYPVTYDBUBCMBMH4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-il1-x13e.google.com (mail-il1-x13e.google.com [IPv6:2607:f8b0:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF4368A3A7
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Feb 2023 21:38:45 +0100 (CET)
Received: by mail-il1-x13e.google.com with SMTP id v6-20020a056e0213c600b00310f8577354sf4075981ilj.9
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Feb 2023 12:38:45 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675456724; cv=pass;
        d=google.com; s=arc-20160816;
        b=ItkdZa8dBgPCZ7dR4z+JBTN1f9b7fBl7AK37UjmoUHyH0aTEJeSIObmzFIjfcv3bO5
         93ynmu8UUboCp791OiobuRl44EPRzkuEc2y1jSeJhCuBn2OL4gVWj7tVSlG15nQIe7aE
         uN2lz4telAwJbmp4NlusoZCnKqXrf1rIQNZbqIbwMeWL5lJHM92Qe1KThI/iD+vQ+pgH
         31RHEPsSTH3EThSJlJsvj5CKIjbSYEofGUckBr0a/pi3NJOYfDQutywEj1ZiEHpLZuL/
         /GTKvF7Wocb6qgJAJuFFZGf00f3ejZ/E3gxoTBabbtXcCnFKWaEzkXGojOJUaxsKnbfZ
         nZAw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=kXQCWA1afJzMmWsiBWSSfx4QlQ3lfc/eAZcXsMgHDws=;
        b=RN7LBTpP9XnKvn6tJY22SDnPuTYyavzNtLuduCFOZb8KzNO5xCTva9JMiWCAbBEYiG
         1vrOjk7TyATy0pkrfmjei0gMbQ5r6xppbzjf8Fc015SIno11zXtYpLTp1yDAcscJ/6nV
         0Pbkq0xf3FCjhWRYfyiPVK1oKIvkfHZwrDUG07rsMswe6LYlYZcMebjuZ3P98wS2cs7l
         szy8ZJvQl2L+EnGUogKDHnjWV6fulXSToSBXBITJ8Ge/C6vZNtDXPS6gpfvrQ6mSCFWq
         /ftx079nhvWHj8zyX113XRxYsh26zpbK2uyrCZtzu++WzVRQW4Hla4WsYRWoDfguET8d
         1PnA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=JhuBD+sz;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::30 as permitted sender) smtp.mailfrom=ricardo@foundries.io
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXQCWA1afJzMmWsiBWSSfx4QlQ3lfc/eAZcXsMgHDws=;
        b=kJFXfpoJYs6bji+PxZzCWLVy/DtfQCBuvgXY4800HbrfJEs96cZQRWrsoaFUEh9xy0
         TSpDy5ltKhu1yD5OilH7ep34D0++DfVnzL5LyDXO5RBCpkkBDv7RgKUF1zDUmmp5bHdV
         DSUMnDCJJwytPxl9JDWmtNADqrNy4HLL8JM52GOuLkJgcRoih043IZxF9vRBphikDBVI
         ummTcN8+8oszyChXJLqh5GXIIQmhlMNcvB/8Fk8Mk7vYPqAQSW0dtU+17FEcwzZn3mDm
         phd2sNHOeyXyNHha+sx8j1PHaak48a9ern/IQ9ILjYQdyu+sVUUCEjQwgrN673+matA7
         2O4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kXQCWA1afJzMmWsiBWSSfx4QlQ3lfc/eAZcXsMgHDws=;
        b=rJTBZ290IehuQ2bb/HO1YWg603Et2urwqKSVKy4Lcqy5f4aGyCfd/J86emZTaG4axN
         h7Zgi+wAbARmUNc8hIgyXoHQ1f0hbdT2HDs/J03pfAmUMls2dfeElTXae40EyETjV51o
         p1WlSxGdsQZafU2/xxMtqcpRCEcHvlYwxgZ/2Hd8wSKsyDFxLnx9ePI2iO/l+7qmY+8Y
         JvDYTDw8cqwi+MPeYwngNpYCB1GrVAHP6q0IMWtmuvIM1g1OHnJZxG+PKWF4oTpkQHHF
         AjPDsSzn/rEzX3L3Koje/ijc57s6xx0ILhpDTK5ZbC7kZ+OQh60NeTTDaqQOtAOBqyjZ
         L1KQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKXyaM9G7FRQaL1mLxxGR9XnhAt3Bu3QpBRqEe1CE8mv+p9wCDt9
	bzrSEUywSCaNB0SIZzgHmHw=
X-Google-Smtp-Source: AK7set/M5Xa4lapM0nVHVxo6mbpSbzhTqUSlc9bOXy4NPpEZd9nqgyOnOonJ1ob6BfBeBH3PnXYLPg==
X-Received: by 2002:a92:670a:0:b0:310:f6d3:4175 with SMTP id b10-20020a92670a000000b00310f6d34175mr2520609ilc.5.1675456724024;
        Fri, 03 Feb 2023 12:38:44 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a92:d2c2:0:b0:311:4917:afa9 with SMTP id w2-20020a92d2c2000000b003114917afa9ls2080092ilg.9.-pod-prod-gmail;
 Fri, 03 Feb 2023 12:38:43 -0800 (PST)
X-Received: by 2002:a05:6e02:1b0c:b0:311:ad48:ff1a with SMTP id i12-20020a056e021b0c00b00311ad48ff1amr5774411ilv.2.1675456723363;
        Fri, 03 Feb 2023 12:38:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675456723; cv=none;
        d=google.com; s=arc-20160816;
        b=vDs7hoU+v1CJ4NCXGPSxAXHAYJcr0LjwchJ5OOOxzsibHb+5H8lk3nHgwr9sfUsUBG
         0ZebR8NeH9VVatVQcaU5lIHPRETCULC8Owgc01zZlGZcBKe5DBENUTpO0VCehvBSmWng
         SkzvQM41K8BIK0a+43Bn5S8sxMo3ut6wurYu1KK7Uf8NhKmtW39OvOmACRfyICquRiiW
         Qn//hwyZlQ9sOD1gwB1GYOn8PFIjbw3c6gYb/jyYvQLRSX2ieiXns5NhO/UZ6iwWgEz1
         98K+wfWC5XAOefVfXf3+GKYsgLSwrWJGzCDm7BXu0p+/UW816mpzhAeEAP+KrvN5JoKN
         ybqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=N7523aTU5wHlN1Wfh7gRc3tT7jGuVOqBHj9Vl16EaDU=;
        b=DQAzOFAlXTjZMxp0gIcgz8Vz+ySelPRl2R2XEnqOSsUirorLbEfGfvex/4M2OrdoVS
         6tU84XeR/l52KDxHDIM8//ry2VTzWdbSDbO16cmW++777z5nOh2BPX1aKEn8wxEvwR+5
         Qy5OMh4yY4xH1x4oqIyeBo2PGkOcdx3iAigkZK4+6mgA9anG/Sv1+U0IHFTjerThOHgw
         E3D4GSNwK4lvEFtCCG+6XdqFHUA2jgj4pABABUjIbIfMRZoOY1H2ASgRONvltWS3Vigq
         AXaEbOv7NPSPkmMb9ebF2FJN5BAcNiaAcH88x4/giaoy9idIVtM86p45/rzQuRi2qH+p
         bOAw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@foundries.io header.s=google header.b=JhuBD+sz;
       spf=pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::30 as permitted sender) smtp.mailfrom=ricardo@foundries.io
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com. [2001:4860:4864:20::30])
        by gmr-mx.google.com with ESMTPS id x11-20020a02ac8b000000b003b8b7635cb2si494372jan.0.2023.02.03.12.38.43
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 12:38:43 -0800 (PST)
Received-SPF: pass (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::30 as permitted sender) client-ip=2001:4860:4864:20::30;
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-1442977d77dso8062781fac.6
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Feb 2023 12:38:43 -0800 (PST)
X-Received: by 2002:a05:6870:4255:b0:163:def0:60b9 with SMTP id v21-20020a056870425500b00163def060b9mr3169511oac.5.1675456722243;
        Fri, 03 Feb 2023 12:38:42 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:badc:845d:dfac:d1f8:a7d2:47ed])
        by smtp.gmail.com with ESMTPSA id k7-20020a056870350700b001631914e41asm1197748oah.33.2023.02.03.12.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 12:38:41 -0800 (PST)
From: Ricardo Salveti <ricardo@foundries.io>
To: jailhouse-dev@googlegroups.com
Cc: jan.kiszka@siemens.com,
	dannenberg@ti.com,
	mranostay@ti.com
Subject: [PATCH 1/4] configs: arm64: k3-am625-sk: Add crypto memory region
Date: Fri,  3 Feb 2023 17:38:28 -0300
Message-Id: <20230203203831.46311-2-ricardo@foundries.io>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203203831.46311-1-ricardo@foundries.io>
References: <20230203203831.46311-1-ricardo@foundries.io>
MIME-Version: 1.0
X-Original-Sender: ricardo@foundries.io
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@foundries.io header.s=google header.b=JhuBD+sz;       spf=pass
 (google.com: domain of ricardo@foundries.io designates 2001:4860:4864:20::30
 as permitted sender) smtp.mailfrom=ricardo@foundries.io
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

From: Andreas Dannenberg <dannenberg@ti.com>

Add the memory region for the AM62x crypto accelerator to the device-
specific config file. This fixes a runtime exception when the kernel
accesses that memory region:

<snip>
Unhandled data read at 0x40910010(4)

FATAL: unhandled trap (exception class 0x24)
<snip>

Signed-off-by: Andreas Dannenberg <dannenberg@ti.com>
Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
---
 configs/arm64/k3-am625-sk.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/configs/arm64/k3-am625-sk.c b/configs/arm64/k3-am625-sk.c
index 4c77e7fe..cfc8dc8d 100644
--- a/configs/arm64/k3-am625-sk.c
+++ b/configs/arm64/k3-am625-sk.c
@@ -18,7 +18,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[31];
+	struct jailhouse_memory mem_regions[32];
 	struct jailhouse_irqchip irqchips[5];
 	struct jailhouse_pci_device pci_devices[2];
 } __attribute__((packed)) config = {
@@ -232,6 +232,13 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
+		/* CRYPTO */ {
+			.phys_start = 0x40900000,
+			.virt_start = 0x40900000,
+			.size = 0x0030000,
+			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
+				JAILHOUSE_MEM_IO,
+		},
 		/* First Wake Up Domain */ {
 			.phys_start = 0x2b000000,
 			.virt_start = 0x2b000000,
-- 
2.34.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230203203831.46311-2-ricardo%40foundries.io.
