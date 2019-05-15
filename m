Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBZOH57TAKGQE4GTU64I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33a.google.com (mail-wm1-x33a.google.com [IPv6:2a00:1450:4864:20::33a])
	by mail.lfdr.de (Postfix) with ESMTPS id 9187F1EB95
	for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 12:03:17 +0200 (CEST)
Received: by mail-wm1-x33a.google.com with SMTP id d207sf406309wmd.9
        for <lists+jailhouse-dev@lfdr.de>; Wed, 15 May 2019 03:03:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557914597; cv=pass;
        d=google.com; s=arc-20160816;
        b=FM+0mjcmkt1T1vn0dKnutJV79eihxSaDKZEZiTegjRfRxpeD0Y2bkBk/O5TPcVE1yM
         dsLiSZjDSdkhO5yxFepmbV9FWoVHtRCg9N0AZYxI8ebLG01e1vkf1WXGeOvC0YvNxYf2
         ZAKRNrfrTcfUHfnidZud8+jNAsEZIIYiTJ+roi5T2edDgFzRH0JS+mGSCeYiSbIioxvr
         xegsBDXwvaZyrEyO60T5jc4I6L+NSpUQwwomoRRnI6mROoO+9QWrTAKe/BOYzzQI7+WN
         N0WIK5AfM3SfKpWvhlrsJF0GndwK2d9ZRn0jjYpznI8PH1SjlH1biJCiDym1Zd9wkmTj
         pkog==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:mime-version:sender
         :dkim-signature;
        bh=AAoReczZwZBCELGQ7k9fDqop480JD548anMT10SvkX8=;
        b=cV2qUFC+hdRSlAl9ITI+wy+WMNUOYsRuiom2eJ4FebTCfOasXLmGgfoASDcp15zxtv
         1UBhld5y6ZuQq8LzI+oVbGFIMFtyRGsRD0o2slv4JdzNCQDWOT4Glbal4UHgC9hF7x5k
         LW8E/EV5yxJds2i5+QvnLWoPIcn4y6YQ66GQ8ZciqXB87w607HJoAVt1ks8YOIEEn8ef
         PxXbf/TreLX/MeZ2+mwfYFSIjuzx9qCvqwYxpNRQnyOJgDgQl2wiqgM+4ga1I9Ebf0Jq
         OqmyoPF9zTXYYfoz6MrevICCXYfQdMEQLRYnCImyQvDb2AY0mpiBT/PJpxlvvh5hEonm
         ngUA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sGPCjlrg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:mime-version:from:to:subject:date:message-id:in-reply-to
         :references:in-reply-to:references:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=AAoReczZwZBCELGQ7k9fDqop480JD548anMT10SvkX8=;
        b=IFjsfkzH+7ns+yF3QOHRhwoEvG3cq9xWU76LwlCDL8Uz9TPkhenZvDW6a8jjLuVNmu
         3kbL1l4KguM0rPcGAbkUr2/9QWTzw4umdVEV1KReZoo3YlcQoTfXdzoI5tVaTgqOkXKM
         VlgwIcYVP37PKdWhtjKk0XhAl4XhRdvE3oz979FS4u71J8AOJjbRpo83S7lpw6zQrYJC
         Z1FYt0fHT29W7Y7aQX2nUD7JQvYHLgSTIK4xFcpA+I698jvuWJKIHy3I9nIbJ2y0xzim
         RQrLppQYzbJ66Wg9QTn2G/9Jua7YyS0uwFaO6QhXGT9CndkTqvSe9dXkPP/6In/qKZp9
         RRIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:mime-version:from:to:subject:date
         :message-id:in-reply-to:references:in-reply-to:references
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=AAoReczZwZBCELGQ7k9fDqop480JD548anMT10SvkX8=;
        b=oaP58xcMkBMjuNtyarwgqM6EDFYhNusPioAKfi6ULySlnyu/+1BPj9xfSsIvJahn41
         sg5UsctBvU7/jhRTeQPmu954FzPi5J7brzTQGei3s2nLELiiF7eiVDunfV63YiF77r7p
         G5mGTkE8ybY/+ij//2r/DYsN2Em5LuQyJAezt6eVPhJ9t4vOe/lieefEj50yFZ4tmYe0
         yZFr1iclWQC58YI24JPbQ6lEzCv7HvJZY4x/vjBJAt/wU2Pg4M1KEQQgNQ4+ar6Yj5gd
         hTbq5ZGELd9yTWcxcqEM/HxkjpvqOlbr64rTmZ91L10+Tn2AP6TGGbJmR7JDa8LOuyy7
         aqFA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAX+g7njlpcdH7k20Ame4asQCBotvAlFpY7Q1+2qwnw+F0cfLP80
	N5gf45P1QUr77LNVpmW5JYY=
X-Google-Smtp-Source: APXvYqxfgf81Rba6/r5VxiLk00BaDvqCcZ1+IAgpliJ8qD0uwe2SbF9jKGDJ/4XRMrFcKnsKpb2eWw==
X-Received: by 2002:a1c:9c8c:: with SMTP id f134mr8475327wme.95.1557914597306;
        Wed, 15 May 2019 03:03:17 -0700 (PDT)
MIME-Version: 1.0
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:8184:: with SMTP id 4ls477778wra.5.gmail; Wed, 15 May
 2019 03:03:16 -0700 (PDT)
X-Received: by 2002:adf:ec51:: with SMTP id w17mr26618349wrn.326.1557914596871;
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557914596; cv=none;
        d=google.com; s=arc-20160816;
        b=KOQQWVGaiOm++OeSEOkb1wZ/QOplrYhRcyBj2MJu6l/CKba7mJfDB65jTNRm0CnPX5
         hZX9hhNx97VtBdm5txKmMBtocnEoTICFzSxY+y3dOUVfthAUoq9phQoCh0QkyMyMU4pH
         d3obFwREfFZIaVSY0PCONxd2Sfxjt+W6M5/3+HBv7j7I7Di6VBSGJKrvhieDUJ7h4j9G
         pybQ03tKOL+9CI+ilG6Lj53/muuZijwpRRZISn0yZ6a13cPN5fij5qhVr7M0PYQscVFS
         Lax+M7mjvINS4EwIfy9rSAHlMTwnuNDazN+Dp3xHRwa5D5c8Drv0NVFKfjoIPd0WGH4f
         ZmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:references:in-reply-to:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=/xXFNA42zFwWR6fILPAfEmDVWTsSiuRQvPvpdzmvmk8=;
        b=UWEOOR+K3RwajwEyRYKNccDLxtI60MOVBNUxuZri/VGPO2IvhL0RdMDDLt2DYRKYgG
         J+/GsUz8m424vfFopApUewKXz4UE9oybPpjY5R52fdmH/edUpiWJmC9F2UslZYkYHH5n
         UubEFgYwdIXhIx6qGIuWneW+K4ftl/ggsriutIQpZCpDI8UG2n0bPbc/WD59nGBb/byb
         VD3jaTZRfQH/KAARLVPnYlPqcRFHUf2i2ySmesyWmt62Q+n1S3YQ8UWkhFhWYe+KhzRT
         02vRpVQVTKIMw9sZ0d52012j89iNRLBD7UfEebD3zsYMlQexOnz8weIEkhLI1AnJjc4R
         CDZg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=sGPCjlrg;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id t1si146096wmh.0.2019.05.15.03.03.16
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 03:03:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([95.157.54.22]) by smtp.web.de
 (mrweb002 [213.165.67.108]) with ESMTPSA (Nemesis) id
 0MTxth-1hHfef0uET-00QnnB; Wed, 15 May 2019 12:03:16 +0200
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com,
	Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Subject: [PATCH 2/5] inmates: x86: Register IDT during setup
Date: Wed, 15 May 2019 12:02:28 +0200
Message-Id: <cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887.1557914551.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
In-Reply-To: <cover.1557914551.git.jan.kiszka@web.de>
References: <cover.1557914551.git.jan.kiszka@web.de>
X-Provags-ID: V03:K1:JYXadgEplYq9UbP7z+hDGILmXFRb82q2/zWahBWfVgcv7/CNdfz
 TzWSkHJkJkrki5n6ZaxUu2GFSih3YcR/Gub3BhDmj3dc7c0Ft6zY8jRazWJCYGLtqM2HzDq
 bZP0tIW856YVV5PSOY4v5rz6XvtYcVJWS/tMjHytY4x1AlaEIm0UGIZIwA5kphfqZNx7nCx
 1m9Jeci8WFyW4zkvZUejA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:VdbDH2darlo=:NEeeIb9L4lBQmUoPZfi9H7
 6cKXjd9XEK7hqs3KQ+mWth3RrvJkcEPin+q8SryMhae2Hh+iKfVxLThr4myiaU+yh/uamMZLk
 d6YvgfDl/4auV16ncBoAsRzfzi5mAeaKKLkwmcjLp71rUbrY8Oryb71pwr8EW7nQuUHN7+BYK
 HvZUq4eJmZW5Z8SFogO7wmNI3dknMRqj6SWNyWFs0U4+AK5wzvGj7eZZmwtMecqqFJXEtuZKb
 1nPxLFEAoMuzz+UtJFfX2/7XU3ljYClxVCYuQPJOsoG8xLv6wiNkJnUts50tNZLn4st39i0lM
 /Ax8ax4lUJGUuNK9Ff7J+bFmCmnXpGHIfokVbnih/X8wX0YDdTU0VEMwOn3Cu/WV+RU5LDw/Z
 wtUOTSikqF6nyxEFcY8POP9FQzwuZU5F4X1K4kh/3KxI0UfBMk+wp9upfCNmfpNbhn9Ljhbzq
 ZmiDp5chDO2Ulwg8Zr8NXoHBH5HQbZ3vsC0kKSVqF7o1uDShcgY9DMtVu46j+30euOFQVv6lv
 8Z6PrnbOrI65g91P+AKesqGFTR4M5fW7AKa0OVf1OoOmejwAQWcHriNt7+NeOJ/J7IpF5yjyW
 gKQX66DVepvWClbBkc7K6bmBhGIRqKuNdtsFWq5jiL0sJaa+KdSorNzt0fW7Q7ekKolRxxih1
 /lQNK8rHAudveasDnkl6tonXI7Wo22bGFltkE1QNwnN28lC4RJzxyS3tz/0fnVACTFkPvb29M
 JKQNfFlOx4kp++Dk8eEteBMLnjfTFHjyNVmOxWCO60UtFxPbCC7czC1AfcVCD72NK73b11Y+r
 ivtnRQhX6pb5Zg5E0cjqDCiCkq5wjXSPAz+QfOeG8WPNP6FpCgthA9HfNe57E3ci8ilLg0dKc
 dihqxGAY56kpc5bixzvOrepf43IhStVwB7kktnBwxRdUdEZXr2ghw30xmq320I
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=sGPCjlrg;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

This will allow to share it between interrupt and exception handling,
both being optional.

MAX_INTERRUPT_VECTORS is introduced as public API, defining how many
interrupts can be registered at most via int_set_handler().

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/lib/x86/include/inmate.h |  4 ++++
 inmates/lib/x86/int.c            | 23 +++--------------------
 inmates/lib/x86/setup.c          | 12 ++++++++++++
 3 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/inmates/lib/x86/include/inmate.h b/inmates/lib/x86/include/inmate.h
index b6bc6145..07a6275b 100644
--- a/inmates/lib/x86/include/inmate.h
+++ b/inmates/lib/x86/include/inmate.h
@@ -218,6 +218,10 @@ static inline unsigned int cpu_id(void)
 	return read_msr(X2APIC_ID);
 }

+#define MAX_INTERRUPT_VECTORS	32
+
+extern unsigned long idt[];
+
 typedef void(*int_handler_t)(void);

 void int_init(void);
diff --git a/inmates/lib/x86/int.c b/inmates/lib/x86/int.c
index 503f68a6..4f760589 100644
--- a/inmates/lib/x86/int.c
+++ b/inmates/lib/x86/int.c
@@ -45,30 +45,13 @@

 #define APIC_EOI_ACK		0

-struct desc_table_reg {
-	u16 limit;
-	u64 base;
-} __attribute__((packed));
-
-static u32 idt[NUM_IDT_DESC * 4];
 static int_handler_t int_handler[NUM_IDT_DESC];

 extern u8 irq_entry[];

-static inline void write_idtr(struct desc_table_reg *val)
-{
-	asm volatile("lidt %0" : : "m" (*val));
-}
-
 void int_init(void)
 {
-	struct desc_table_reg dtr;
-
 	write_msr(X2APIC_SPIV, 0x1ff);
-
-	dtr.limit = NUM_IDT_DESC * 16 - 1;
-	dtr.base = (u64)&idt;
-	write_idtr(&dtr);
 }

 static void __attribute__((used)) handle_interrupt(unsigned int vector)
@@ -83,9 +66,9 @@ void int_set_handler(unsigned int vector, int_handler_t handler)

 	int_handler[vector] = handler;

-	idt[vector * 4] = (entry & 0xffff) | (INMATE_CS64 << 16);
-	idt[vector * 4 + 1] = 0x8e00 | (entry & 0xffff0000);
-	idt[vector * 4 + 2] = entry >> 32;
+	idt[vector * 2] = (entry & 0xffff) | (INMATE_CS64 << 16) |
+		((0x8e00 | (entry & 0xffff0000)) << 32);
+	idt[vector * 2 + 1] = entry >> 32;
 }

 #ifdef __x86_64__
diff --git a/inmates/lib/x86/setup.c b/inmates/lib/x86/setup.c
index 869e0962..a1455993 100644
--- a/inmates/lib/x86/setup.c
+++ b/inmates/lib/x86/setup.c
@@ -42,10 +42,18 @@

 #define AUTHENTIC_AMD(n)	(((const u32 *)"AuthenticAMD")[n])

+struct desc_table_reg {
+	u16 limit;
+	unsigned long base;
+} __attribute__((packed));
+
 bool jailhouse_use_vmcall = true;

+unsigned long idt[(32 + MAX_INTERRUPT_VECTORS) * 2];
+
 void arch_init_early(void)
 {
+	struct desc_table_reg dtr;
 	u32 eax, ebx, ecx, edx;

 	asm volatile("cpuid"
@@ -58,4 +66,8 @@ void arch_init_early(void)
 	    edx == AUTHENTIC_AMD(1) &&
 	    ecx == AUTHENTIC_AMD(2))
 		jailhouse_use_vmcall = false;
+
+	dtr.limit = sizeof(idt) - 1;
+	dtr.base = (unsigned long)&idt;
+	asm volatile("lidt %0" : : "m" (dtr));
 }
--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/cc7c3b6c5b2473f4fc09d61f218a8bf00b43a887.1557914551.git.jan.kiszka%40web.de.
For more options, visit https://groups.google.com/d/optout.
