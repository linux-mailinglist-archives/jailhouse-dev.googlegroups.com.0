Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBJ7GXKAAMGQESZIXMYQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x540.google.com (mail-ed1-x540.google.com [IPv6:2a00:1450:4864:20::540])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CBE302492
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:44 +0100 (CET)
Received: by mail-ed1-x540.google.com with SMTP id o8sf1943867edh.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:44 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576103; cv=pass;
        d=google.com; s=arc-20160816;
        b=yIkwl2R7uUKaouFu2GGCfdy7klM+fQxw0Ww0mmwnhjz6G9Pg2T+lX1u3FTGD+MoRyg
         bkrarN5Z903Adopr+rMrowwK93kAVYM24sws6Cwktmm4TkD520J9jZseA7b84SpUbVuv
         P7AYPpIWL07FiYmTUqvq82wGZGA2IzFUd5IM6t+aIIf5tL4+4GS9tEePAz4U64DCItA6
         Y7iVAy+DftOwlyI9jYwu74MotQrsBC7nQg30jVnmz/QZbqCV6ZgM0aj3FbppzrxhfiMz
         zJ8h5h1++AeV2i8URKGTbKhU4jh0t1kZGZjrEZzC1kCnRsRmBpIsSB4aJwlFXRq6UBNO
         RbLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=MJtKDRfmxjgvPZ9pwpIrVa0BSzbVcQs+Z+2G9sPle8M=;
        b=GychAt3TrMXWCwWUrjbnZ5Ou08yyq4bmgg8NWabR1Au3HuJhJuC8VYFWJs85OWcSfr
         qRScGVICH1d18teJHKDRVzuCe3TQz2u+ZPhgctFQyQnj/vSn6qPCYtIideoustyR1wOM
         qsCoyXE4o5j7Zv9D2NsJSVu5XUhYoTWBynaiUDhqKhg1TzmsPaV4s3M5V8WPoN/tDUNL
         sl1ESIqfSrTc0zJhSPxH2tZfTQ3EQ7sgdrXlKwiRsnSKZThBFDdK0pvnmi5MTEBkEiJL
         CzbW/fzDrK6Svs9rEYRBsTtuiq9DY1090IIG71JSWOE+tIWyfPD5v0onds28lCgKl9Gp
         KQ7A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Bya0qv1A;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MJtKDRfmxjgvPZ9pwpIrVa0BSzbVcQs+Z+2G9sPle8M=;
        b=iNrjDV8rCOgPkvvFeN6V7BoyTLMRuUV7hIRgr+IZxr0sPL4pe2kWmp5T+Tpq6fXmh7
         OYX3ASmXCkzHgWazrHRmevteht9VvH9LhZqXIg564KTZeAYS9z7urE7WEYqdNv7vDRYf
         3vb0qjX3uMLKgDg7ufG2WINOmOXoTqwbVeAXBOUmceRKh/wNMzB77ga9ndzEyEQH0fPf
         skX5lN2ECL3xjs37Wkv0FhklFOHQQsA+ofZNak7FiWF7B/mmIdWpwacam/mr8YPE/uqi
         VcjdU42Dxxq+Uw8S1qX3ZaWvN07Uj/yUzl26hgXfkOEsSqufc3OUEYmPrs8QmioQ5GIY
         4wAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=MJtKDRfmxjgvPZ9pwpIrVa0BSzbVcQs+Z+2G9sPle8M=;
        b=X9/cpK8s0SoO40DIqWoP94UKx5re89DQTS3M+fIpPnSZ2W8XfKPzlUkniMF4IYEWfa
         aipsHnbA8FyJi33uBpCWRkm2VSuO9+D6duCSADTuwYr3srbM6KzEZxAly/5h+5YlPoSO
         898Jm1GvK4hxAiJRTMfReVBtYeHjrivu8tLg6FM5REFBu3LjwKJdwVJ8fafjWeB7Q8D6
         mSI/ty0cxM712yDdkz+tfwi9VQq0C9AKFI0pOIf7z+9ueuN6Y2PR5LFQFBHTFjmSuP5e
         rWh9uYvwEH/FEgHlu5jSkoSMAbbi49W1c2K73UJscYLZD1+bBby1skzyCMbTDkAnNQkx
         tvsA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530mrz4jR122njfCi5Q6UYtUxr7RDg07ypLfjA5lrb7waJcJASPD
	umSAK/XSjtnqkelvFst1c20=
X-Google-Smtp-Source: ABdhPJy5LzrcpwcPjEninV3EerL1ocmJ0HJsPSfo1W+gmk1A7rfoAXHSQmOR00GUpkcq4pHiFtGwtQ==
X-Received: by 2002:a05:6402:215:: with SMTP id t21mr120066edv.363.1611576103837;
        Mon, 25 Jan 2021 04:01:43 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:7641:: with SMTP id kj1ls6234990ejc.4.gmail; Mon, 25
 Jan 2021 04:01:43 -0800 (PST)
X-Received: by 2002:a17:906:e106:: with SMTP id gj6mr119258ejb.337.1611576102990;
        Mon, 25 Jan 2021 04:01:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576102; cv=none;
        d=google.com; s=arc-20160816;
        b=y67yiVpf5WV5Xy/srNKtk2XOW1v+fgsjnsm6cxDD2fVLSI2d8vCLgb1RVajYpP6fPO
         uPjsI5aZrez3RYEsY0RnDKYNC7pl9Oq//z5Vk6Ya1j/6bqCvXPhyC9gD9Xf2HOJ5aBf3
         L+i7IiOCInI7bJ1xxXVa3ETc86kl784e1o+DvfTKifUTtaOyHOB8S1cITYIgcXRC3u6L
         xbI+PXNJY6IFKK8lydz2QpcmR9Y25JF+QXw636vXIVcVNE5oH0N6Maq+63GQVduZSWMl
         zLYRpdsyAW226iIQkP/N5+vcg1LMOjJ1HYvmJgGboojCKbnTJbqpnKcByjfb9B6S171G
         FQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xauP0xQHs8XXOYTHgsBmvLdMeVP0cy//0ozaM5KRCaE=;
        b=yY32Ntf59RRBIKniBIJYxzeB8lJEgwOVy+eECDiMbt8F4U/N0hrZOLCokoP8rbE9QJ
         kLKN6MYdMBTd47XJlWrXLxzwme72raJ6lDX6RRlNIcd3eQrfOVVrWOatC1h+oA0ZTTWo
         D5NOe/AOQV3dFRUnyvqqF3f3x7EIbPH0QMEpcXA2ayUpjgzzU0qxyDYmNMiEcLNNwXwn
         qFp06Kpgav31+xEIdTnliGK+4DwG7HJCVkHI5EOMQcZFnxEhT282LYCLfvUlXIYJE/kh
         r10o2H3MmXgxw4R5R9EjS87RA3DPthRcFYRAaiBBkVGFINaGOMtpHSrLpBhEJbZDBF64
         SBiQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=Bya0qv1A;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout1.mail.lrz.de (postout1.mail.lrz.de. [129.187.255.137])
        by gmr-mx.google.com with ESMTPS id k20si748787edx.3.2021.01.25.04.01.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:42 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as permitted sender) client-ip=129.187.255.137;
Received: from lxmhs51.srv.lrz.de (localhost [127.0.0.1])
	by postout1.mail.lrz.de (Postfix) with ESMTP id 4DPT464GfYzyjw;
	Mon, 25 Jan 2021 13:01:42 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs51.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.878
X-Spam-Level: 
X-Spam-Status: No, score=-2.878 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_DMARC_FAIL=0.001, LRZ_DMARC_FAIL_NONE=0.001,
	LRZ_DMARC_POLICY=0.001, LRZ_DMARC_TUM_FAIL=0.001,
	LRZ_DMARC_TUM_REJECT=3.5, LRZ_DMARC_TUM_REJECT_PO=-3.5,
	LRZ_ENVFROM_FROM_ALIGNED_STRICT=0.001, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_HAS_A=0.001,
	LRZ_FROM_HAS_AAAA=0.001, LRZ_FROM_HAS_MDOM=0.001,
	LRZ_FROM_HAS_MX=0.001, LRZ_FROM_HOSTED_DOMAIN=0.001,
	LRZ_FROM_NAME_IN_ADDR=0.001, LRZ_FROM_PHRASE=0.001,
	LRZ_FROM_PRE_SUR=0.001, LRZ_FROM_PRE_SUR_PHRASE=0.001,
	LRZ_FROM_TUM_S=0.001, LRZ_HAS_IN_REPLY_TO=0.001, LRZ_HAS_SPF=0.001]
	autolearn=no autolearn_force=no
Received: from postout1.mail.lrz.de ([127.0.0.1])
	by lxmhs51.srv.lrz.de (lxmhs51.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id jh1pGNiF7_-U; Mon, 25 Jan 2021 13:01:42 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout1.mail.lrz.de (Postfix) with ESMTPSA id 4DPT456VBdzyjF;
	Mon, 25 Jan 2021 13:01:41 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 10/23] hypervisor: provide runtime assert() helper for DEBUG only
Date: Mon, 25 Jan 2021 13:00:31 +0100
Message-Id: <20210125120044.56794-11-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=Bya0qv1A;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 129.187.255.137 as
 permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Debugging is enabled by adding CONFIG_DEBUG in config.h

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/include/jailhouse/assert.h | 37 +++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)
 create mode 100644 hypervisor/include/jailhouse/assert.h

diff --git a/hypervisor/include/jailhouse/assert.h b/hypervisor/include/jailhouse/assert.h
new file mode 100644
index 00000000..eedb1b9f
--- /dev/null
+++ b/hypervisor/include/jailhouse/assert.h
@@ -0,0 +1,37 @@
+/*
+ * Runtime assert.
+ *
+ * Copyright (C) Technical University of Munich, 2020
+ *
+ * Authors:
+ *  Andrea Bastoni <andrea.bastoni@tum.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.  See
+ * the COPYING file in the top-level directory.
+ */
+#ifndef _ASSERT_H
+#define _ASSERT_H
+
+#ifndef CONFIG_DEBUG
+/* runtime assert does nothing in non-debug configurations */
+#define assert(e) do { } while(0)
+
+#else
+extern void __assert_fail(
+		const char *file,
+		unsigned int line,
+		const char *func,
+		const char *expr) __attribute__((noreturn));
+
+#define assert(e) \
+	do { \
+		if (e) { \
+			/* empty */ \
+		} else { \
+			__assert_fail(__FILE__, __LINE__, __FUNCTION__, #e); \
+		} \
+	} while (0)
+
+#endif /* CONFIG_DEBUG */
+
+#endif
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-11-andrea.bastoni%40tum.de.
