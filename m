Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33c.google.com (mail-wm1-x33c.google.com [IPv6:2a00:1450:4864:20::33c])
	by mail.lfdr.de (Postfix) with ESMTPS id 0393855B9E6
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:19 +0200 (CEST)
Received: by mail-wm1-x33c.google.com with SMTP id j19-20020a05600c191300b003a048196712sf2269278wmq.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336558; cv=pass;
        d=google.com; s=arc-20160816;
        b=X79FVsB8XqCC6tIC5ZBzh9aRGs/yBsw8pnT3F8MEvxKB8ovPEcvkRpaLQvAzxGQdJM
         EHASebuFpXN8BehPhv9b/Gh8bIJEsfUUYxcRHBz86ME/bKMqv+B3FcITwLdwd0dsNktx
         S7QeBvLJJoE+DKEOvLHIXUgol7hjXM0N2t5WbEib0TlkRrR340SBPA1Q6P0C8hyPPuNR
         IdbldK0HQS9Zak/AWoDr+Ayzfbi0mfW0KXk6JCxNjVpL1rQzGQf73FoO0ezx4A5XoFhX
         AhKmlAucGOu/ZsdMlHvUaa3ymBTnJ4EfDl6fXZ0It+RueCK6IUJhJDEXV6RG9VMpgBe1
         /NKA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=R4vEMjX5Yks4xaJee+zSBgLKos39rCA3G+R4J3Vefg8=;
        b=GhCQt4uVcFZwXfUK4nBxSOPBBPRPT7BdfTnL1UfVGQU8KqS+X52T/7OQz5ZmgBO4yA
         fZC6Z9J607y3TDmmPyWieqqVU3jUXwOeMPezzCWQz+EbOWXEQWlAbDY0WUiByrzFwjtZ
         gEerk7xvulQHZ1MnLZZv0YRVQWlmqjZeK0D/w4MpK4eieHVAQ7Da0RiZhgwOQU5InvwQ
         afM7sVeGKYvtl9LEzEkVeccn2y/RU0RS3TnXKYu/WTvSV1+ypN1i8msIJrMFaGdNESWc
         GLqkmeBzutbM+HMDhBL2clmlDtaOCP+W/qYasa7V9L8JuIx3mdtkaeobiEUN+qS5fHma
         ltoA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="o2MQ/fMb";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R4vEMjX5Yks4xaJee+zSBgLKos39rCA3G+R4J3Vefg8=;
        b=GTjfMSbBs3RkUxLwAgQOQE4yIgNvP2BJp4xmSgHP2igekYfpMBlDk/ukk+P1Jg6KQj
         Mf6Q6IVzb5M8MLbnGaCCpSH7bXZPfGQ/hr+ztfnu3vAX5L4RItzIqvPgQctLUiKGXKDp
         9mGTZgaZNY936KFqH9oBQpGkPOcW+Y7wz8V0vJkCpdBzx3dQ7PO60ciUofMKP70NJskq
         9cBVxPF4btXNdzM5IKweftDK5NxuoBGkLpDlNU3gq31+uWbKghrRNMj3FSSXDJ+EN0C4
         cEn/nWJrVq9jv3yI0qPApfOEXe0Dr93jPQgMk7nKLjoaDCKF45i+4ybuv3hgBPlrONJi
         7mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=R4vEMjX5Yks4xaJee+zSBgLKos39rCA3G+R4J3Vefg8=;
        b=JlIkYQbxuVaWYNH5ImqEL1JO/iVR1jD2tWNuiyulxZ39+e/w6XCqjC5GB+xhQ3+JYI
         54UuJNHhJIRQaBgedDBJzX4YfbdBHwsIAgNaa6/l738qjHKoFhtzi07W0PwNfCp6UR5Q
         Z4LXgipHOGuDS+BYd0WntboPTlmQ33plD8K9lM1qSHaTgabqKvMLiYyU4vFWGw08GZAS
         rzt5KuPe0/DkReIHiX2IdhpYbzdmcpJsYoUyrev+AaGnT9Fs12gVFDfb5sZRei9izVEG
         g3rPeuyFjxLDbLt02DWo0N+L5PepATlL1DzLBp2re1VJq11FZbEO13WVd/UOf8uOm4x+
         dLQg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora+WEx8VI3WMmHnWJSnJm5D4XYbI5MXzDI0UWEY7qavaEwOQw59S
	G9wus8JqabiJpdD1B8cFzlw=
X-Google-Smtp-Source: AGRyM1ti7kSGTt+3Q4LZkkDpWowsEbBcHJ3GDH8ULlKvPPV+IhwtxEA5YjInnBsJNSjs8lb4K8YtxA==
X-Received: by 2002:a05:600c:210a:b0:3a0:3be1:718f with SMTP id u10-20020a05600c210a00b003a03be1718fmr19165266wml.181.1656336558798;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6dab:0:b0:212:d9db:a98 with SMTP id u11-20020a5d6dab000000b00212d9db0a98ls26785004wrs.3.gmail;
 Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
X-Received: by 2002:a05:6000:71e:b0:21b:adf2:c9ab with SMTP id bs30-20020a056000071e00b0021badf2c9abmr12605578wrb.153.1656336557452;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=VtYZBeQhkGhgFYit630khuSeMJ2zFZd78bnGH9cLUq2psgBcDb3PDZmL9JNOrJPMsX
         vZNvYthv1kgxqHR0nybtnJRVYa0dTZP3zX36FphzPsEBzqaio80kHlDsAU1j9/yFfVKs
         Pih2V4IHzWxpTEFE0WwJE50Afj3hJggnioug1SS8pyY5X0cuFQhyLGlzSnLa2YB/6bLI
         4edCjNBv25MdmYW35FJWyXwemx2px5uxH/SjUNOdrvcfknQWj4hAx61rAtFXqXR4G6Kz
         IOD/nIvdtZoQ42d/dh9Rhh+PsEitM8MAZfBk97q1+16gAX/FE8dQ1KhXt0QhkUv9znAK
         UX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=BdzV9zdKkHCE5dhOYNZLKsLxoFMo851pou7ELSTUL9E=;
        b=PUjXavNCM5JqOxDJsiIa2KlD8mC6wlj+fHpaiOomzOsuAFITjUN7hkkbYaJQXeKhiS
         ruprbFBR1M6nAEvUXYZY35TZzRuiG/JsxFBxR/m4OGZWIwrC2Fzl8qfXnZUZcqpjLTMa
         3+poKdeaoPSI/oibqrSj4cpaDwUQFOlrsrzOeupWVuyrOO9F/OAlEkHOAOaKfjDyw2o5
         542gAZzxxX8k7duBC/OSoQxCyZF0zjuYQ7vUMEBE+1a1+EUnkyukY77tUcbosVNTHEb1
         TiRrkwrzcu1pm+90drxxSb33atptTsXO+thMUW9JyygKOAgNlccxrBV7GmnBpw237m4H
         HZAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="o2MQ/fMb";
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id k24-20020a7bc318000000b0039c4d96e9efsi878635wmj.1.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV51Rsnzy0c;
	Mon, 27 Jun 2022 15:29:17 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:16 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 03/42] core: riscv: define MMIO accessors
Date: Mon, 27 Jun 2022 15:28:26 +0200
Message-ID: <20220627132905.4338-4-ralf.ramsauer@oth-regensburg.de>
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
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b="o2MQ/fMb";
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

GCC may emit 4x 1 Byte reads in case of our regular mmio_read32
accessor, when used in combination with -Os. Yes, I've seen it.

Define safe handlers to overcome this issue.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/arch/riscv/include/asm/mmio.h | 67 ++++++++++++++++++++++++
 hypervisor/include/jailhouse/mmio.h      |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/hypervisor/arch/riscv/include/asm/mmio.h b/hypervisor/arch/riscv/include/asm/mmio.h
index e69de29b..e19d0cec 100644
--- a/hypervisor/arch/riscv/include/asm/mmio.h
+++ b/hypervisor/arch/riscv/include/asm/mmio.h
@@ -0,0 +1,67 @@
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
+ */
+
+/*
+ * We need those definitions, as I saw the compiler emitting 4x 1B loads in
+ * case of mmio_read32.
+ */
+
+#define DEFINE_MMIO_READ
+#define DEFINE_MMIO_WRITE
+
+static inline void mmio_write8(volatile void *addr, u8 val)
+{
+	asm volatile("sb %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write16(volatile void *addr, u16 val)
+{
+	asm volatile("sh %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write32(volatile void *addr, u32 val)
+{
+	asm volatile("sw %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline void mmio_write64(volatile void *addr, u64 val)
+{
+	asm volatile("sd %0, 0(%1)" : : "r" (val), "r" (addr));
+}
+
+static inline u8 mmio_read8(const volatile void *addr)
+{
+	u8 val;
+	asm volatile("lb %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u16 mmio_read16(const volatile void *addr)
+{
+	u16 val;
+	asm volatile("lh %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u32 mmio_read32(const volatile void *addr)
+{
+	u32 val;
+	asm volatile("lw %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
+
+static inline u64 mmio_read64(const volatile void *addr)
+{
+	u64 val;
+	asm volatile("ld %0, 0(%1)" : "=r" (val) : "r" (addr));
+	return val;
+}
diff --git a/hypervisor/include/jailhouse/mmio.h b/hypervisor/include/jailhouse/mmio.h
index aa85a089..f5ace9e9 100644
--- a/hypervisor/include/jailhouse/mmio.h
+++ b/hypervisor/include/jailhouse/mmio.h
@@ -32,6 +32,7 @@ struct cell;
  * Define MMIO read accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_READ
 #define DEFINE_MMIO_READ(size)						\
 static inline u##size mmio_read##size(void *address)			\
 {									\
@@ -49,12 +50,14 @@ DEFINE_MMIO_READ(8)
 DEFINE_MMIO_READ(16)
 DEFINE_MMIO_READ(32)
 DEFINE_MMIO_READ(64)
+#endif
 /** @} */
 
 /**
  * Define MMIO write accessor.
  * @param size		Access size.
  */
+#ifndef DEFINE_MMIO_WRITE
 #define DEFINE_MMIO_WRITE(size)						\
 static inline void mmio_write##size(void *address, u##size value)	\
 {									\
@@ -71,6 +74,7 @@ DEFINE_MMIO_WRITE(8)
 DEFINE_MMIO_WRITE(16)
 DEFINE_MMIO_WRITE(32)
 DEFINE_MMIO_WRITE(64)
+#endif
 /** @} */
 
 /**
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-4-ralf.ramsauer%40oth-regensburg.de.
