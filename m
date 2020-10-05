Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBKHD5L5QKGQEUKP5ODI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x639.google.com (mail-ej1-x639.google.com [IPv6:2a00:1450:4864:20::639])
	by mail.lfdr.de (Postfix) with ESMTPS id B693728301B
	for <lists+jailhouse-dev@lfdr.de>; Mon,  5 Oct 2020 07:39:52 +0200 (CEST)
Received: by mail-ej1-x639.google.com with SMTP id hh10sf2879847ejb.13
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601876392; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ad9qGbYg8phNdJ1vxzN4jK1HwWTaSRBJaGG7n40ux5P+ImI/zdtLdhCOUNL5svkHXl
         G3MAevpsAXBs14ggAtazTBlmQd+di0NuZXh1ChJYVBfA1qlNO+oOiBlwbc+NZPudO+1v
         OddT4VtZmaEnheNMlPHcSjnBLwE+BSAvCB7HpF5P8X1LKSEgbSs3fywZ4iowRlVKiZFq
         A/HIpvhIkEO66TG8/g/HKKSSyklaapwXwfNqipY4xGHVFZDxvd0DnzoGh1elgmaG3rFm
         H7Ni2al9rdISmU+JzZwgvFIl4nXIQwq2QY67RTURuOzLuPG5nz6JOw0MbU8RWCbqclgn
         2AFQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=4yS3pwfE54KrYv2LSEZcBsT6fsK3972B/UH5oskQ1/U=;
        b=wkU47jAAp9Q0lMRddoJstSICAW28Ym+JcqcyGQVG9vnvN7ohsvP+6lG0DJbmeM2a0b
         p/OoEKA9yZHuJ8dwx3A89K/K2yDHR4QMkEBn/83fsTGkRgi0QNMEpzdHuiy3SHTuU5Su
         Nhj64RrlGBZnKAJb13544zj5XunfFQNNDOB89zIgmMp+/CfMzlSkDZTm2ryk5B0f+Pmq
         iZKlpQuk4Y8reL5jqp/3RjFBKnzhUSHYdwiGGTg+OOoDI31fG9O6ftgPNz4Y6I3U6iiU
         mNYBqZ9aaj6zQiBztb/hNbA1GfArTkrj1ugK/Fq4CJDcrdeamQAHfMvh8XER4iv6D6cz
         pKJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4yS3pwfE54KrYv2LSEZcBsT6fsK3972B/UH5oskQ1/U=;
        b=hfNDDZMVJ7INsow8XG1XZn8xWlmK2+hxFBkaodfQavzKQpg6COG0hN2c3YRCjE8RFX
         kJsFCT9J0Mw+ZYNyGQnnoYnRVKsIf2MY88IMoa8MAKUoin/C+AgCxA3qo5o5r5+Gv+SJ
         iv+ffV/3sAwAfGoafWGn73qaHJf0MRjUl4Y1wP4uHC74Uu7rrp6Trfg/v6LL8BQMjlPQ
         XdwqJhfP9+3/HkfMXrQiCuc++yEL7eUxRiKwBwUssgsIA+GtI38x7HJ5I2W4zw8Podna
         oIj5wN7TzoN3Y5xoykEoKLgSHoOF7YwVslGkHnLDZWmOiEAHtBtptcpJniMYdgOwCc1d
         SMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4yS3pwfE54KrYv2LSEZcBsT6fsK3972B/UH5oskQ1/U=;
        b=RkCr+vBrXp0PcRz1N5AgIqzotnZh6BMHY+3cAEjr5rK0Vh20IpQzMY3eBn6Vrcxl5I
         oGLxZrebmEbhqY7ce0fhc2bUNNcGUphITyb0Z4T9aAHwIV1NoSkAEbbT+/pt66xYgPRR
         YRkQ64R5Lg/4UHArfMO3sieOCwnL78oChJtRfbCUuei+uwplElloXOLR11xrPP4sBqfa
         6Sc4xJSoDEQgCeRb+XX0joeJdw7jTevZXGfY5WHYYR7gPgSa9vkfPX5q7jU5N7uV2qzP
         /og6zt19UTikPDtJmLupojyvTK/TGLRtZf+cZua3ilWAep4Kv/5gK7WIrYYpyYr2oT8Y
         9YDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532HKO1Gj8Ye0j1kT3g+yPU6LceIZ3ze+pdYcD6uVVnhFNQ1fC82
	9274a74+Ioc90JpcxrbhlMY=
X-Google-Smtp-Source: ABdhPJy3c8g4czpnciZMKCAiR4OLznwfOLtZuour06uqjFb2ova0LGOdgHolair5/82g7tO/QZpE7w==
X-Received: by 2002:a50:cd48:: with SMTP id d8mr14804043edj.286.1601876392477;
        Sun, 04 Oct 2020 22:39:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:4904:: with SMTP id b4ls3642337ejq.9.gmail; Sun, 04
 Oct 2020 22:39:51 -0700 (PDT)
X-Received: by 2002:a17:906:275b:: with SMTP id a27mr14517201ejd.190.1601876391276;
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601876391; cv=none;
        d=google.com; s=arc-20160816;
        b=Onuth+EObtrr4DS8+0mURddcBrE4LxjJJeUsfP68alsxCLCvDNbVNoKtuR7WbJSWBl
         V+A2hpr3wWbmIWh/I4ZbYm9yzlXUKt++bKcZrTIKhvB2Ar/OMSZRBPwqau/K63EPuVFs
         XApsz0LWaavGAGUo+hphObhfVLkw3pU5WvQbL84GA2ZoJq3P8KnUQAs+4INNY9AizYH5
         aEGacIzrDQs1v0b+6YUMKOANh7VwCBWeAxssmbt/KuC4YrVdXbr0nu6JZKKBKw0ZkeL2
         2YE6YUZyCwXArLkTRe+px0+lmFF8xAPmUbc+S38wKijVL4uP5kJ0cYaSwm6FSJc0ZA3w
         Vdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=gCAP9M5eseTeaDAysFclq7GhfFqgc2iAtj7E1TAnhEQ=;
        b=TLg9BqE7e9oAmvQN1t0A1md7mee7OPsnbUlfFz76Lcsgb7Q6c39mClTcNTQ5u1Q6QA
         O5Wr6dSKV6b9OpRNAO+OspWQ+nnL01lXVJgnfvzzm8zox/s+FvwW6rZS/6nIEAYMCPNq
         qQeo7hpHFcRbwsOH8Ajagl7ZIF3aiJHvj5qa6SvyARm7u1muZFo8q9c4AnYCfGRdr/nF
         a4Mm2F56U7sBPulZAOYUZUHCulsSWxvQN/6peHcP/vAiHGSOZxOif7VAAlbi0YhsF2bL
         ZLQjYjN0vTchDg0mKCorzrbqHEh519lcfksAQxC2AcBrcjGWZGgkOcaiUTWapYBs98jk
         Tjwg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id g90si186024edd.1.2020.10.04.22.39.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 22:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 0955do5W031080
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:50 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.39.163])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0955dncB025569
	for <jailhouse-dev@googlegroups.com>; Mon, 5 Oct 2020 07:39:50 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [jh-images][PATCH 02/19] u-boot-ultra96: Set fsbl config explicitly
Date: Mon,  5 Oct 2020 07:39:32 +0200
Message-Id: <79528388c36fecb0157a0559171478be05c6513f.1601876389.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601876389.git.jan.kiszka@siemens.com>
References: <cover.1601876389.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

Likely, this is the default, but better safe than sorry.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 recipes-bsp/u-boot/files/ultra96.bif.tmpl | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-bsp/u-boot/files/ultra96.bif.tmpl b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
index 8c5355b..e972929 100644
--- a/recipes-bsp/u-boot/files/ultra96.bif.tmpl
+++ b/recipes-bsp/u-boot/files/ultra96.bif.tmpl
@@ -10,6 +10,7 @@
 #
 
 image : {
+	[fsbl_config] a53_x64
 	[pmufw_image] /usr/share/zynqmp-pmufw/executable.elf
 	[bootloader, destination_cpu=a5x-0] ../ultra96-v${ULTRA96_VERSION}-fsbl.elf
 	../ultra96-v${ULTRA96_VERSION}.bit
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/79528388c36fecb0157a0559171478be05c6513f.1601876389.git.jan.kiszka%40siemens.com.
