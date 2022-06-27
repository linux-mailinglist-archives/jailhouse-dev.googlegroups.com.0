Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43b.google.com (mail-wr1-x43b.google.com [IPv6:2a00:1450:4864:20::43b])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F36255B9EA
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: by mail-wr1-x43b.google.com with SMTP id y18-20020adfdf12000000b0021b94ba4c37sf1206562wrl.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336559; cv=pass;
        d=google.com; s=arc-20160816;
        b=I0eaXbTKRP9Svz2v3P0WYQA0bMOeKpbYLx6fvk3fhonJoeJ93Fw3nTV8NVCdvSxoKf
         jF4OE/yY70TzEYj3sXb+BUshvA70iCDd+PMocaxOnbus4ttJZQ+SrMSCBGiQR6mpT3Aj
         Xd+tBXv/gCPNzEVyoaA6HavE6ZDC2qcmXK75DB2KFc1fflkjnPL7PwdnGNrhfzwVwteG
         UjiRKtZbehVOvLgOCcv+WxSzP+raWxNuwZ5ceTBNLvM9BnKLxTFypVNvEOc/px56oIQX
         0W3xbMz5+onspvD9nzT8WuS7916J4aJt1+Y9kbQBUA/CXarICP5x686NkT6Ac/zLyuoy
         1VnA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=yYsRQueyF4vPVrUdzSxMkqJv5jU16jsj8VtVGRdYKc4=;
        b=0omGb5mYfWtxHhZU6kJN8NOS+euIT/AzzJUL2XmczjPbsbVDNsScS7LVIG2VzIHVV7
         Mz8MNdaYmklZ4rJxnU8vNiXQpKLEIbXlaHz86V85J1+Nl/lMZkgiY5y6IpgGzt1P1/UH
         OuLU31XcFJBA0AFwFaKY/mG9dxhHsc3sDQqeqigtTWNLvWIl4lJwWbU2foY+G+NlIrU9
         SD9wqg2KRaF55nC1CRwdrQbMm25DnD9YGIx9zAZifoYp9x73/V1rK3rgY0xCexoe0bAL
         Y9SLtRBx1Lb6UFqsH3B26iI+59RK1CqNiAIXVr+UbZteO3A4NtdnPOoQuZpqwJAvTMEX
         zjzw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="sDOGiZl/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yYsRQueyF4vPVrUdzSxMkqJv5jU16jsj8VtVGRdYKc4=;
        b=UTa+yKUWa4ZoBaazsYqJjRGX1MuEZR4bMOE2i+CtxijNDyZUuBSZh+6eqh1sg/2Pq1
         4Kb0X6DmPaDeFjU1gNusRUxytZ5rLSsjRs+rnP5qyxto44S886WbPWuiQy4z3EoWS1FG
         PHgNoE1K1vY6swpXGy5QjTRCDpBeJrSZi/moIBj9sg6YM+vKcCM0ZB6YDWMK8BSMpQCF
         YZF7wkdUF7KhOEuUSz9+p8s3ZbbS5LmVTwwNNHfWEm5jKFA6P2JkcRxaV1HEO7q3ZqEV
         3XELfkYp0clqn5ECDfNO5kGRgIvWAplxqcEvaDzsO4ZtypCPiTqsGoel0bMNMORcHmeJ
         vviQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yYsRQueyF4vPVrUdzSxMkqJv5jU16jsj8VtVGRdYKc4=;
        b=zTD85S6heoZg0aTNS2h2+/vi94otv0DzpD3iOz+ZDHhS9BXgi9wFsk/f9J/0phTEVz
         +XhoZL96SLrXr0UrJcdOIJS4cy3cbvTw2FaQxYm9fonf3/iNovjWZr50h75l8AGPdxpn
         LcMbwSJ/AKEF53+v8jBBJIYasvtwNYkcumxsTT84LBWphnkPMsXnKWbrpSIiGnyvce7A
         CdOdgb2rg3vw0SR9WOz3WgWzpArSV0bakUPss4SjjDpAwvoI9Bo2A36Hom1lYDWEMO31
         e7bjSslbAjpv6liTxodW6xuLLAkYzQcAgNnwC9jwVQ2iN5BPuSDNdX55/YtwMOKTa3XU
         6U6g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora/qT4ebN19e77kHt2Uiwxnb1qvBAdwCE1yHjczKXd+ptY6RxjiO
	Mx28FmoEcam55bvwetO0Fos=
X-Google-Smtp-Source: AGRyM1t0g9DhxtNJRv5QZLw+5mKn9gWm2KvtwJYLpyjT32MzFyReVgQLrjHr/scfV6vjWBpFzON9EA==
X-Received: by 2002:a05:600c:58d:b0:3a0:4547:43a6 with SMTP id o13-20020a05600c058d00b003a0454743a6mr12010357wmd.146.1656336559353;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:4ec7:b0:39c:871d:313f with SMTP id
 g7-20020a05600c4ec700b0039c871d313fls3230296wmq.2.canary-gmail; Mon, 27 Jun
 2022 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:600c:1906:b0:39c:7f82:3090 with SMTP id j6-20020a05600c190600b0039c7f823090mr20041794wmq.152.1656336557983;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=eZxN+nDf2LDPSPyaUMH0shIyExgg1Ln/vlwXAV6whiGyFTGshlCZW3sZ/Z1jz8oSPO
         Q4RGhvH7+5TSnur2092JBuxzYIG3MxuXDMFzz9+Qa8iPZIrp27nHP05EjpDFqtZnKtUn
         +Hu5OvEl0gysW2coo38ZUi/Zam7H97B/enuHoADmNg2MY/n7Fz7ZgJLOIyAHHWAQ7BL6
         Ho9h73+YAX9uig1VDxDzAbebs5Z5pp3VJh646PutYJU+nStBSHor+cIjq9nPHdNPToFA
         u2/VP+lWU5T/GjnrRPP1+m7NYDboQTUS1TgyE+jDOf/s/4ggHjbfcpAAwIFmYjENiLKn
         0FxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=m5aemtFytORsnn+G6Ig1tfxNTkynQsmJ5J/x7l0Bep8=;
        b=N1f6H9SqJiJyZ7ewBSGzXku5r09TKplIl2uc0zPgLj7ANuVuyXhte2AkgFXWyUAj0D
         NNVW5FAu8oN88uhAbR7+W9o5mJht1SgJWCjlpPb/gnOMODbp/ymag/shqMxnDanq/7jY
         S4WcODQQMXwwwYgU/6NWwH+llQcTt4/jffldGAuM2ibxxr971hTNIVa5vvTE+8mOv3/B
         fjFHfcda39FcGP7KA0fHH5tPI1EyTw51r/c+JcEMi/m8K/DqeLDEbTda+KCs6/wz/dLv
         tlLZDVnlUEaKdXrBUOmepILbsOeIRAC1H146gb3pmqNxg9das14ZqEopaQ2PDGMdRhIt
         aZww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="sDOGiZl/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [2001:638:a01:1096::12])
        by gmr-mx.google.com with ESMTPS id a1-20020adfe5c1000000b0021a0a0afe31si375992wrn.3.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::12 as permitted sender) client-ip=2001:638:a01:1096::12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV54n3lzy6H;
	Mon, 27 Jun 2022 15:29:17 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 06/42] core: riscv: add processor.h
Date: Mon, 27 Jun 2022 15:28:29 +0200
Message-ID: <20220627132905.4338-7-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b="sDOGiZl/";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Add processor.h. We have 32x 64-Bit registers, x0-x32. x0 is the zero
register. In our case, let's place the program counter at its location.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/processor.h | 47 ++++++++++++++++++-
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/hypervisor/arch/riscv/include/asm/processor.h b/hypervisor/arch/riscv/include/asm/processor.h
index 8d4b1c60..f839d1f4 100644
--- a/hypervisor/arch/riscv/include/asm/processor.h
+++ b/hypervisor/arch/riscv/include/asm/processor.h
@@ -2,9 +2,11 @@
  * Jailhouse, a Linux-based partitioning hypervisor
  *
  * Copyright (c) Siemens AG, 2020
+ * Copyright (c) OTH Regensburg, 2022
  *
  * Authors:
- *  Jan Kiszka <jan.kiszka@siemens.com>
+ *  Konrad Schwarz <konrad.schwarz@siemens.com>
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
  *
  * This work is licensed under the terms of the GNU GPL, version 2.  See
  * the COPYING file in the top-level directory.
@@ -16,18 +18,59 @@
 #include <jailhouse/types.h>
 
 union registers {
-};
+	struct {
+		unsigned long pc; /* x0 is zero register, in our case it's PC */
+		unsigned long ra;
+		unsigned long sp;
+		unsigned long gp;
+		unsigned long tp;
+		unsigned long t0;
+		unsigned long t1;
+		unsigned long t2;
+		unsigned long s0;
+		unsigned long s1;
+		unsigned long a0;
+		unsigned long a1;
+		unsigned long a2;
+		unsigned long a3;
+		unsigned long a4;
+		unsigned long a5;
+		unsigned long a6;
+		unsigned long a7;
+		unsigned long s2;
+		unsigned long s3;
+		unsigned long s4;
+		unsigned long s5;
+		unsigned long s6;
+		unsigned long s7;
+		unsigned long s8;
+		unsigned long s9;
+		unsigned long s10;
+		unsigned long s11;
+		unsigned long t3;
+		unsigned long t4;
+		unsigned long t5;
+		unsigned long t6;
+	};
+	struct riscv_raw_registers {
+		unsigned long x[32];
+	} raw;
+} __attribute__ ((__aligned__ (1 << (7 - 3) /* bits/byte */)));
+/* RISC-V ABI requires 128-bit stack alignment */
 
 static inline void cpu_relax(void)
 {
+	asm volatile("" : : : "memory");
 }
 
 static inline void memory_barrier(void)
 {
+	asm volatile("fence	rw, rw" : : : "memory");
 }
 
 static inline void memory_load_barrier(void)
 {
+	asm volatile("fence	r, rw" : : : "memory");
 }
 
 #endif /* !_JAILHOUSE_ASM_PROCESSOR_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-7-ralf.ramsauer%40oth-regensburg.de.
