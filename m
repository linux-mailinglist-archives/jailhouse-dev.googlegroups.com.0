Return-Path: <jailhouse-dev+bncBCW2V5WNZMERBGHGXKAAMGQEC4455JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id CECAD302489
	for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 13:01:28 +0100 (CET)
Received: by mail-lj1-x23e.google.com with SMTP id d27sf6200856ljo.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 25 Jan 2021 04:01:28 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1611576088; cv=pass;
        d=google.com; s=arc-20160816;
        b=NZh2Mt7IXgshTTltrMCGYRMWZofsFeyxdu3BGZVQZnB6MtzkOj6iE1sUV4uP3HE3kY
         wY3dUkWBk+tDOzZmgZu5yaz7xsMYyNVAwi3TK5P1hmsNt2Xy3zdIfPU+P/dE36Occ5g7
         /tHHf1IXcq/8lAdNssVXHpCLC8JZZcSGO+JaZQ4sATWYNqnGV1vRl8uNIwrH+RZPkq1u
         xGb9ABIXn9wZHaMpiw/2auJCdThPqSi8MuG/IU8k7NvXuQTbCExG7WmI8lPKmS+OZ37w
         EuOF89v+bANP2KQMjtb8l9UDsSZPNB7sdZdHm679FzHa47BBJBybWQqoEYz2V4E6pUI5
         BOkw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=fetWqnVBdjgGqcpPxDPOl6gM72VN1R+H5bezI0f31B0=;
        b=Dg9u0iYhN1ZL0S2JiTse/h+SRoOYBLUkcHNNsQB3hbF6rbS0wyd4DutGgWFoKVW9sQ
         KvUjEj2dccvjkqQrRyj4xwlVqxq0fzmhVu7jXZma8T7i3C/tMTaXHM2tVSiM+pia+beq
         cyfHGWBAvGMMF9dYyl1KOORMYTQyMUHPFm5rK/CGUrRkAaw8lxzpBGjh6pC0YuEDGo3r
         /xehdfxYj+X5Pcfy0JJxEVXDHoWMhQ/LCrXJLLXtrc9fob71nAmJhFYs9Ru6hDItKWeK
         YPjv4DLtZRsMcINqdsWTT0/dEcA677oqVQ1t/sCi4H+Afr80jGlpANaMzBSyMyp/9UP7
         g8sA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RvXnvOCg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fetWqnVBdjgGqcpPxDPOl6gM72VN1R+H5bezI0f31B0=;
        b=saoiWqG3cK/RWlQwGJakV91OORMfG4QVN/jzzMoCUNthxG8PGzmK+Cwz25DM3ltouS
         Q2V+FqvPlt8ZYVmBH36AWWcK2NI0kHfzAU7/ILmQPhlvwVrHGYYXTzEIabWV9lRgLBmh
         8uuMfoCJAp3NF0RolaGICIb/vESsMlQ1gke3YqK0qyFnOdrYBibn9+s33ONNO8VqpRC6
         j2D+IqDvnpOCL0Cpqxq3fn5nnqujI1MaJ7eQf9jWX674BR3US/IZbn8178HxFngOJHXE
         vjxonBrvq8c8aph25otE87yPJFqh9X/LXKw2XL05YjNdQaaWgSI3OTEJbmUy0nRgAZjg
         AwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=fetWqnVBdjgGqcpPxDPOl6gM72VN1R+H5bezI0f31B0=;
        b=iTT82UMHhmuocvWAMWa9VZTTyamk5ab9S+Pw83kclsHK33ky1/kjAVbaLgWwG6DVvG
         2oCf9Eb4qOVG/NDKy02TlMlPQUIU7pzV7c1xxIHQ0WlTclGPF3qV0UzEu3kVbx87P4o6
         TNfAQ3QrtwSW6iycZCJI/cu6D1V8jKJGk0nMiT0ILVUpB7NqXhQyFsN3rs8rUmdMU8EJ
         y0evsuiHM2qsBs6TzL5rL1o/ea24T+yrVh8qVwS1GFPwpMJeHUnPcDUpLnl8EBLgf7A5
         BVtEOhwMV+yc2uLbjkxPS9oz/oFz7xKo3Dnmh89y64hb0zinZ7sLTHB4FDo65CjyLPZs
         qp6Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533qVX7oCsDwejux95g7oBmgUsX7BaLyVAbaXTPg1KPCy681j6nx
	afNC4+QE25OdKaHpdFQvtGs=
X-Google-Smtp-Source: ABdhPJzqTOGh9jFrf95NffbwH4oOsJE71vipN6Y9qZatEvh36xOvIKiSlIr1bzW+eip62O4fHZfiVA==
X-Received: by 2002:a2e:8717:: with SMTP id m23mr28343lji.490.1611576088369;
        Mon, 25 Jan 2021 04:01:28 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:6d4:: with SMTP id u20ls4217324lff.1.gmail; Mon, 25
 Jan 2021 04:01:27 -0800 (PST)
X-Received: by 2002:a19:341:: with SMTP id 62mr110171lfd.500.1611576087388;
        Mon, 25 Jan 2021 04:01:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1611576087; cv=none;
        d=google.com; s=arc-20160816;
        b=qVnu4ovXHkHhR9/1AAbhTShWx5uaiN8HNnLQuoXgTtTdn6sdH4Y6rdO0Wdqu8C4Dwg
         WVJ3bx4vGrBtsxW/CuVHV7YpZxirdgrvzkCTSx0wLCrJaqPsdU6oahM7C/q/dvskL1bm
         anwANZxcoP4qwaKXx6JQKFy8T3IWvGCRBf4KQ2KEdnsI2DOTaWz/32neNpDZajalPqIG
         pLscOkH5LAkwnBMnXuUnk0jX0CGqF0rqRzEcpAoHmuqx1g4oCqKOb/OrygUHH1oqkPz9
         rps2hAAmdCPWPZOdnzJsw3PEmMp/DeTIR0PjJnYIZiLTpwiZODS5UAHBmBnemBExblL3
         6vyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ZBgSI9hie31ZVzr9i6m5/gRXh+mCB4v7gEtsKZcZUsQ=;
        b=Hdf1eVfqOW54GHDJr+h3TiDJlwLpPYzKYA0BGci8F2NcvH/y5hirk0PcD5LVZViy2+
         93vinrNkVlAD6g3CZDW/XYTg0NDqQfSj6qX9MD3etEqyYQCOE3/d0S9Iy6VJFhnD7Bsb
         jlXIajlNnAHkrQ/oqPfnW72DNd3siHqP/fWnsm081Wge7Nts/Xwx2+OdPHXk+qu87Hcn
         D4Onexqa/i8xMOZNqrf65dSXcDvEkm0g8Biamx0XVPhAF9j3J/u0d4W8thRJY3ogbOkz
         HtVO4nihyh+2+BO0igjzn/cJm3O4KkzGq+lrOjHrEKNymyaDWTisw6Oo5VXHHJQJSB/w
         g3YA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=postout header.b=RvXnvOCg;
       spf=pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id i190si416278lfi.8.2021.01.25.04.01.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jan 2021 04:01:27 -0800 (PST)
Received-SPF: pass (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4DPT3p60ZQzyd8;
	Mon, 25 Jan 2021 13:01:26 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
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
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id ul-mAovgPwXn; Mon, 25 Jan 2021 13:01:26 +0100 (CET)
Received: from kabal.lan (ip5f5ac6e3.dynamic.kabel-deutschland.de [95.90.198.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(Client did not present a certificate)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4DPT3p1ncxzydj;
	Mon, 25 Jan 2021 13:01:26 +0100 (CET)
From: Andrea Bastoni <andrea.bastoni@tum.de>
To: jailhouse-dev@googlegroups.com,
	jan.kiszka@siemens.com
Cc: marco.solieri@unimore.it,
	rmancuso@bu.edu,
	lucmiccio@gmail.com,
	Andrea Bastoni <andrea.bastoni@tum.de>
Subject: [PATCH v1 01/23] arm-common: bitops: add most-significant-bit operation
Date: Mon, 25 Jan 2021 13:00:22 +0100
Message-Id: <20210125120044.56794-2-andrea.bastoni@tum.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210125120044.56794-1-andrea.bastoni@tum.de>
References: <20210125120044.56794-1-andrea.bastoni@tum.de>
MIME-Version: 1.0
X-Original-Sender: andrea.bastoni@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=postout header.b=RvXnvOCg;       spf=pass
 (google.com: domain of andrea.bastoni@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=andrea.bastoni@tum.de;       dmarc=pass
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

Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
---
 hypervisor/arch/arm-common/include/asm/bitops.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/hypervisor/arch/arm-common/include/asm/bitops.h b/hypervisor/arch/arm-common/include/asm/bitops.h
index 808c9a0f..a726862f 100644
--- a/hypervisor/arch/arm-common/include/asm/bitops.h
+++ b/hypervisor/arch/arm-common/include/asm/bitops.h
@@ -31,6 +31,7 @@ static inline unsigned long clz(unsigned long word)
 /* Returns the position of the least significant 1, MSB=31, LSB=0*/
 static inline unsigned long ffsl(unsigned long word)
 {
+	// FIXME: the ffsl on x86 isn't robust.
 	if (!word)
 		return 0;
 	asm volatile ("rbit %0, %0" : "+r" (word));
@@ -41,3 +42,12 @@ static inline unsigned long ffzl(unsigned long word)
 {
 	return ffsl(~word);
 }
+
+static inline unsigned long msbl(unsigned long word)
+{
+#if BITS_PER_LONG == 64
+	return 63 - clz(word);
+#else
+	return 32 - clz(word);
+#endif
+}
-- 
2.29.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20210125120044.56794-2-andrea.bastoni%40tum.de.
