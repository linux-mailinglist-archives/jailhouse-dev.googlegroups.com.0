Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBL7B42KQMGQEBKNRY2Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C1155B9EB
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:20 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id h125-20020a1c2183000000b003a0374f1eb8sf6216159wmh.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:20 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336560; cv=pass;
        d=google.com; s=arc-20160816;
        b=GJoPiwAlMLfk6WS3dNDeVtIK45qiqu2/9JGIzy5ztSLRW/l5h9+pPkv+Sj3hIjdPaa
         srAhIS9p6YBWcN+RsWfdvI0A0BgrnXczW5TeKGWKXwtzWCT3v1R8RXkJQDe/gvnrCSNw
         +doR1BsVRZ4wDvQG16CQ7rop+ZtjjN5x1H43sjI/Wf2M9xymfF8anIOTQorMmfUPbhcf
         yVGbg/n2BbwvsqdFSv7f+rPHoCs9aLrfLWPHk3Q5aO/j2WXEpwdsMm5Hjm+2dLXFK+ut
         /LnKvG8lfJV4EMS/xiPS5S98y4KlUMkvKNIvR+PSR8OjAUDfF2kaR3sM9ruKJuap5cc/
         B0jA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=VwUNSfHPkfcCbMWTu6m6ogPrXaHQiiX6Ce5onNhqtPo=;
        b=Dc+aHq5y5QEqoH6smTlEqw2neu2kpDxJk7vcbtRCEUIPdyq5lLRYNOlXGCPz9o0h5S
         svxaBs7Y9B9M0LOUkVrKQzcBJgjXvpQO7OYkFrtdH1AUN6YUmF5Jypzb26pzB46O3Ra1
         u0Mll0v/Q2K4TTwqexTZvX30xbJRJRlJKHlyv8dhzvQRDrjAIdLF/tUnJliPxhcymVcz
         OWi8+CbCSRsuNJ9rtnfM/JMc6B+Ja2xcMrma9pigi9zkNlga6Evp0weeqPrVH+lj8vWd
         t6Fs4VZ+ZIkcbU6TUEA22iuxjjjYDGbBXkiwreSrfn/V860ua8jznJI+6AyZw9pn5WGw
         XvsQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=P5r0TJEe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VwUNSfHPkfcCbMWTu6m6ogPrXaHQiiX6Ce5onNhqtPo=;
        b=NotZmd4lsdcf+gzJqFKAEFxozRgBNewqB487q1fpA6cNyVXMLw9+Y7qku0Yvrqjwy+
         TRVAdy1pImfLao0EZMYg651u+DOtDes155WVNVXOhQ80c6i2Hle2mb3FfBoiZg/Liro8
         ppsdPMU5WWu+xwnG2NUXZlMU4zEQ+uwwFC4jcp0gTdkMGlO3GdWiuGYDsGcTua++rG6f
         YKf0vRuaRI1LuKtc10Yb7FCA3QdwhrzIRgTet/IcrMs2KeyrrttpamzJJB2oMwPQ077W
         vFjJlGW2JPtD6TvmQ5io7yvGYgv9TyQGPB8/3QgURE1S8lYiE9D46cht2qBDK5OB+csi
         +4cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=VwUNSfHPkfcCbMWTu6m6ogPrXaHQiiX6Ce5onNhqtPo=;
        b=T+ETMh0H9ww/8f96PSC0rcZccMUtmf8HBz0rsd5N7QzcLX2rkLVvDFmqFw2PiiHKGr
         YeFI7UO3EyPJJuP2mBQYn12Tp68A1Fcjbswq0dMOU9c5rA9eN5joot6OYrn/NGck91+A
         wtJzhZnX/Xx8Adw9RtQrTbz0x5bYGV+DelnAg1TTaTXCThuoWAUMNaG5tHcOlPIvkve2
         5DSYUKj/RSh7v8u4a1GjNKXyLZsKm0KtIYzK/j6QEnNnh0x9rp73QXd9DRdobVIMCQ1Q
         EML/zzrJ4q/Sqk0kE+XacBSU/Ovvm8+VuFGsaSOPFamtvqLQJhllaaovTX9rkmcYWE6O
         sdYQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+KVgwehUOSSJy5aQDiaTiZviYGL/CleAEjfMM2smHseiexaYwy
	UtsziXaJdYu2Qn+Y2IPgN/w=
X-Google-Smtp-Source: AGRyM1t9FuGjlap5qP9JBGLiz6zDbsQ+5xHTZTUe/bevMVGZelvxkmOJTsYzRoxsgfqUTMHnI78Ufw==
X-Received: by 2002:a05:6000:178d:b0:20f:e960:2f2 with SMTP id e13-20020a056000178d00b0020fe96002f2mr11993709wrg.569.1656336559905;
        Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:3b17:b0:3a0:2da0:3609 with SMTP id
 m23-20020a05600c3b1700b003a02da03609ls3230242wms.1.gmail; Mon, 27 Jun 2022
 06:29:18 -0700 (PDT)
X-Received: by 2002:a05:600c:350:b0:3a0:4910:9ebc with SMTP id u16-20020a05600c035000b003a049109ebcmr7849905wmd.148.1656336558314;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336558; cv=none;
        d=google.com; s=arc-20160816;
        b=pXdP8WD1+d4nmggtzRimaold+tDFTjUjFUFM5OnFqmcm04NKmpE2WUk8u+T0TmjFuc
         gBSgzjrPD2kTyOYYPsz+Fh81qdxOh/oOe2qamGi/tdmGDyZR0fDxm+YdUBqnP7bL7hOX
         uBwwQYFsU3ZtWs/XE0sMzgRzKM1TuyCCoq/uUSjoWVItIkX0DqzmOWBMq955xD5jIdm1
         fz0nx6wjx0h429+E8Cmg0wCRHOL0eHeDuBv8EteElb/8/5sk9PUGmPPcc2WRSVxuCogd
         Tfnp096Uzp+AkcHDwX3npOrwH4GY2rQWEKWe8YqNHvkQ8xJPftb+lZQM6Uj2zoMijmuo
         0lXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=HZDuuarETZd/ikiY9twviHuh38aBBR/aUigEmbGHTdI=;
        b=N63stftvW6fsIrEgG4oThVrZOfU5j8WrpxAb/GerfrlA/dpJ2pKVIYqjoAe4+xZXIV
         gvbcxfbLuEOds/bB6HUscgkEDUmenS1fx/G9YLA8sefSDM0jf/iPUuLMx3LZkD35qRob
         Rtyn1ltqeBFfPdWg6FSV4PV2QmmG4B5/YXh4Y3AYxyiHfsm6O9sQW7wdY2uv55eX56uX
         +S0k1jIaVnrBbEgkoKRx0a84pqh7oP6O0013NCC5QZeQaZ0FwBWXmv0IZydupRqqZh7w
         qKHWLVknS43sh/TPEp21M+qZgxtSQyGlgHy5Cg74PKI1I2CuSqcLZzVBcrg8cRxqbOeM
         +IVQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=P5r0TJEe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id f17-20020a5d58f1000000b002102a7531cesi342601wrd.2.2022.06.27.06.29.18
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV6078Gzxwx;
	Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:17 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 08/42] core: riscv: introduce global sbi_ecall.h
Date: Mon, 27 Jun 2022 15:28:31 +0200
Message-ID: <20220627132905.4338-9-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=P5r0TJEe;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

This routines will later also be shared with inmates, so implement it
globally.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 include/arch/riscv/asm/sbi_ecall.h | 96 ++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 include/arch/riscv/asm/sbi_ecall.h

diff --git a/include/arch/riscv/asm/sbi_ecall.h b/include/arch/riscv/asm/sbi_ecall.h
new file mode 100644
index 00000000..cc0ce2dc
--- /dev/null
+++ b/include/arch/riscv/asm/sbi_ecall.h
@@ -0,0 +1,96 @@
+/*
+ * Jailhouse, a Linux-based partitioning hypervisor
+ *
+ * Copyright (c) OTH Regensburg, 2022
+ *
+ * Authors:
+ *  Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Alternatively, you can use or redistribute this file under the following
+ * BSD license:
+ *
+ * Redistribution and use in source and binary forms, with or without
+ * modification, are permitted provided that the following conditions
+ * are met:
+ *
+ * 1. Redistributions of source code must retain the above copyright
+ *    notice, this list of conditions and the following disclaimer.
+ *
+ * 2. Redistributions in binary form must reproduce the above copyright
+ *    notice, this list of conditions and the following disclaimer in the
+ *    documentation and/or other materials provided with the distribution.
+ *
+ * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
+ * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
+ * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
+ * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
+ * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
+ * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
+ * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
+ * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
+ * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
+ * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF
+ * THE POSSIBILITY OF SUCH DAMAGE.
+ */
+
+/* see https://github.com/riscv/riscv-sbi-doc/blob/master/riscv-sbi.adoc */
+
+#ifndef _SBI_ECALL_H
+#define _SBI_ECALL_H
+
+#define SBI_SUCCESS		0
+#define SBI_ERR_FAILED		-1
+#define SBI_ERR_NOT_SUPPORTED	-2
+#define SBI_ERR_INVALID_PARAM	-3
+#define SBI_ERR_DENIED		-4
+#define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE	-6
+
+#define SBI_EXT_TIME		0x54494D45
+#define SBI_EXT_TIME_SET_TIMER	0x0
+
+#ifndef __ASSEMBLY__
+
+struct sbiret {
+	long error;
+	long value;
+};
+
+static inline struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
+				      unsigned long arg1, unsigned long arg2,
+				      unsigned long arg3, unsigned long arg4,
+				      unsigned long arg5)
+{
+	struct sbiret ret;
+
+	register unsigned long a0 asm ("a0") = arg0;
+	register unsigned long a1 asm ("a1") = arg1;
+	register unsigned long a2 asm ("a2") = arg2;
+	register unsigned long a3 asm ("a3") = arg3;
+	register unsigned long a4 asm ("a4") = arg4;
+	register unsigned long a5 asm ("a5") = arg5;
+	register unsigned long a6 asm ("a6") = fid;
+	register unsigned long a7 asm ("a7") = ext;
+	asm volatile ("ecall"
+		      : "+r" (a0), "+r" (a1)
+		      : "r" (a2), "r" (a3), "r" (a4),
+		        "r" (a5), "r" (a6), "r" (a7)
+		      : "memory");
+	ret.error = a0;
+	ret.value = a1;
+
+	return ret;
+}
+
+static inline struct sbiret sbi_set_timer(unsigned long stime_value)
+{
+	return sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+			 0, 0, 0, 0, 0);
+}
+
+#endif /* !__ASSEMBLY__ */
+
+#endif /* _SBI_ECALL_H */
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-9-ralf.ramsauer%40oth-regensburg.de.
