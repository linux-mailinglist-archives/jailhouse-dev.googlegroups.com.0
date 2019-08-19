Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBNHD5LVAKGQEMVCRDOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3b.google.com (mail-vk1-xa3b.google.com [IPv6:2607:f8b0:4864:20::a3b])
	by mail.lfdr.de (Postfix) with ESMTPS id 158CC926A8
	for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 16:27:02 +0200 (CEST)
Received: by mail-vk1-xa3b.google.com with SMTP id x128sf1287698vkb.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 19 Aug 2019 07:27:02 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566224821; cv=pass;
        d=google.com; s=arc-20160816;
        b=Otuczm/d0Fwp9FuC1GegZfU48gW0Do89JyEVBhpmr6tDqRGXz1jsez3VxhwBNiy4EE
         0Trf3QXOdgYsQJBr+ZGFCv/LGSlP+a4Fc9NcDtSPtBKOWgP5NVsVV3vMpvAHc2UbuUl6
         vgSUX/GtsPlkexUJ0yC9KBUDGiP4s0DOsk06qvnJMZxFyrXJJUrzV5Eh3PbDDllcPURp
         uFbha1AXGIRmKeDjlwSa7sdrvmrC1Tvfu5GSEHPvpKMdOO1/1j8JO71RvUGgv4h+Ch/u
         5SpTz9wuMa4HVDgXWXuPejoxJEu8adpD3Z6/0HdfdrORGVbTe04GbWD82k5zWFqE9MnU
         83RA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=zUYn0ChedcVE6zZ0dKWzUFKBUS3voFv6313RT2tkuQ0=;
        b=bqN5AC231IQVWZDfEYuBFRvTMJnkMjP35XQAMpO2YCOkAQReLdxg7gj4ETpx1b7P5A
         XZCMN5T06T9Em53g7NU6xgq7y96ItgpFJj5K4BkPEKhfl3eQLueO0NxAeLK8wFbfpYh6
         mlJg2XGWaXqeDFNEkutrTu3uVLTjLNVNLGDUrZNuHQmxOWdxNKHqGp4qhWV8R3U4D9T4
         U4xDjUGyR5x0goimpFjwhULbZBIKNP/DyKAavoKpAaVJrcSE4nJ82lSLfN8iyemcPUJ/
         LzXDEo7jDyrOt2LfnSQiWAgpO80KWrYb+nle99a0pM/v+46dssy4RVFEYKMswa3i50Yc
         zqtA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LKVgGjaY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=zUYn0ChedcVE6zZ0dKWzUFKBUS3voFv6313RT2tkuQ0=;
        b=Mntw2roAN6OQ3v9Y/hwdLrSWq8QvyQUradvL3KxSGIV08Vx/TV71BnMSt6aAvsHwq1
         qSLn7UcDWgHAImP8h5GlNugT789cKRsbp9lps2HiTkCyFgv5hYYQcSZXc1NyQuV386Ld
         xyat+KiaBTyahbjX9euV4A2DrbpV/dRc75rZysKXupOZ5O926bg5Fo5WgyCfsZH2A5LH
         Z/13gyDl2uK3uAW3sa7im+NThmSpDBIL5/yPczctVFYzdBfo1yWZ2eKkRuL2U65SFz42
         dHmx2pxV68T5vpHvjKBwBxhikl/G64lu5TfaJPVMy1uUzvNLLtIXb322A2ZvhECiqhxm
         GAPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zUYn0ChedcVE6zZ0dKWzUFKBUS3voFv6313RT2tkuQ0=;
        b=msZnG1gNYuALtSQzh7Ri/Stv3r44F55Azcxdz0tIKlY6gYRLKQZRo+kFJvUBvETjfi
         AsvYQfwqG6les9OkNkoeofTrEgJn9MvEJO1m6xj4vy13KdjZ5EnE78h/zUMlZsNK2Xfs
         fzNcSY1H45gslfqhQK2wp/u0vimh/Bfz+MeUmWRkNqGNuaMsqJ1Qg4RkoqGDaSk5960g
         VkEJK0bpLVVQ/VxKhtFr9kOnuQ/ei0VZG1e3VaVxM3BrAh1xeLI+xLy9bLC6OuQWOumX
         xKgWVW9L35Wfg0Xd0YnYx9z7WnRqDOkau/i/uT7f5B2XKFwQ1Fq08KeaIb0znU5cFiLZ
         piww==
X-Gm-Message-State: APjAAAUrJfqIQj53oQMRFFrxdm3B2IwAJvcc+tku0erNhJ0D91GX1XEF
	lm0XUU6CaOehYbCYqMpVuIo=
X-Google-Smtp-Source: APXvYqxV4B0UsfLgUuVftjZdRMhSk93dk52tEsfoSbUjp6v3Ej7nq6HUthLezlbb9qzQgVbIXFA5Ow==
X-Received: by 2002:ab0:6648:: with SMTP id b8mr12758501uaq.99.1566224820788;
        Mon, 19 Aug 2019 07:27:00 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:f0dc:: with SMTP id j28ls1783048vsl.11.gmail; Mon, 19
 Aug 2019 07:27:00 -0700 (PDT)
X-Received: by 2002:a67:1b85:: with SMTP id b127mr14563720vsb.230.1566224820298;
        Mon, 19 Aug 2019 07:27:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566224820; cv=none;
        d=google.com; s=arc-20160816;
        b=k1ggLi7msoy25aXt5rtNvAB6eVyM0LhlOyxH2bMN7YZ4jE9RXLLcc+uRMrrh4W/n5x
         DHm4ijQc0gPb7+Loxl8aH+1GQsn0s7Nrb0XLs2YRBljoy5nAf8ZNDE76SuFOesqNzKu0
         lzq8uzKQ0moC9UMKsumfOrRT0EF0qypNu7brw5zuA5y44q6QlwOo9XmFlb9KBJF+vSKp
         lmlyW0xPu8e/+35/RihttRaZBkLaaau+wEmFd/aXCIAtkDSDPiQAZXJJZHGQ3kukWgyp
         Nh9D1VZMBOll3FcIRMJxcroTIaVDfdUU3oqRF/1O0cH4bbI3LOIJBBm7D2XQKUMIi06R
         QsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=PvwlVphmMIP5vMTSqBV0uqbNWmJHzYQL+EefeYVWWSQ=;
        b=oanhqXWXLjJJg2l+iUt8knaC1vDvWArvNuWf1Ad35v3cFkhlHYZ72TXqxadDKHJODk
         ayHeg8kblZF/1RauzlZpUj9L1wRAzAj0plAEWehluR+ycJa0vfPfQKRJL4656dUSlyMn
         T9DKAWnHgKjZqYQbOwU9br6LKXFONTUIauvYNE8SQB+19EzbgbnVDH8VjqeyEGuWzLF+
         OhggdXahpKFY4i5+opr5+v1htRYlIg2pNMwJ7eHhkAhvF0hR8oy3VsD5rteK9uBaivRm
         wF/iFw6QxSX8Gu9RCZYmGo5vVfrRFCLKWMN5Oq/Ys6ATwusak/qLzyb6Z4Et5g8xV+jq
         fMHg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=LKVgGjaY;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id a8si860922vkm.0.2019.08.19.07.27.00
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 19 Aug 2019 07:27:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQx4M120365;
	Mon, 19 Aug 2019 09:26:59 -0500
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x7JEQxuI039138
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 19 Aug 2019 09:26:59 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 19
 Aug 2019 09:26:58 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 19 Aug 2019 09:26:58 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x7JEQtgx128856;
	Mon, 19 Aug 2019 09:26:57 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v2 1/4] inmates: uart-8250: Add MDR quirk for enabling UART
Date: Mon, 19 Aug 2019 19:56:50 +0530
Message-ID: <1566224813-20129-2-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
References: <1566224813-20129-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=LKVgGjaY;       spf=pass
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

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
Changes from v1:
* Use console flag for MDR quirk instead of compile time flag

 include/jailhouse/console.h | 7 ++++++-
 inmates/lib/uart-8250.c     | 4 ++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index 8961c6e..a54bb56 100644
--- a/include/jailhouse/console.h
+++ b/include/jailhouse/console.h
@@ -78,7 +78,12 @@
 
 #define CON_HAS_INVERTED_GATE(flags)	!!((flags) & JAILHOUSE_CON_INVERTED_GATE)
 
-/* Bits 13-15: Reserved */
+/* Bit 13 is used to apply(set) or skip(clear) a MDR quirk on the console */
+#define JAILHOUSE_CON_MDR_QUIRK		0x2000
+
+#define CON_HAS_MDR_QUIRK(flags)	!!((flags) & JAILHOUSE_CON_MDR_QUIRK)
+
+/* Bits 14-15: Reserved */
 
 struct jailhouse_console {
 	__u64 address;
diff --git a/inmates/lib/uart-8250.c b/inmates/lib/uart-8250.c
index fb7940d..5b94b5d 100644
--- a/inmates/lib/uart-8250.c
+++ b/inmates/lib/uart-8250.c
@@ -49,6 +49,7 @@
 #define  UART_LCR_DLAB		0x80
 #define UART_LSR		0x5
 #define  UART_LSR_THRE		0x20
+#define  UART_MDR1		0x8
 
 static void reg_out_mmio32(struct uart_chip *chip, unsigned int reg, u32 value)
 {
@@ -67,6 +68,9 @@ static void uart_8250_init(struct uart_chip *chip)
 		chip->reg_out(chip, UART_DLL, chip->divider);
 		chip->reg_out(chip, UART_DLM, 0);
 		chip->reg_out(chip, UART_LCR, UART_LCR_8N1);
+		if (comm_region->console.flags & JAILHOUSE_CON_MDR_QUIRK) {
+			chip->reg_out(chip, UART_MDR1, 0);
+		}
 	}
 }
 
-- 
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1566224813-20129-2-git-send-email-nikhil.nd%40ti.com.
