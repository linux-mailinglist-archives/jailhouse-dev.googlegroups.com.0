Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB4WYX3VQKGQE55GFJWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pl1-x63c.google.com (mail-pl1-x63c.google.com [IPv6:2607:f8b0:4864:20::63c])
	by mail.lfdr.de (Postfix) with ESMTPS id 82918A8209
	for <lists+jailhouse-dev@lfdr.de>; Wed,  4 Sep 2019 14:22:11 +0200 (CEST)
Received: by mail-pl1-x63c.google.com with SMTP id b23sf11715008pls.8
        for <lists+jailhouse-dev@lfdr.de>; Wed, 04 Sep 2019 05:22:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1567599730; cv=pass;
        d=google.com; s=arc-20160816;
        b=UY8xN2P/db4Tvs9kLdSsekR+OYtvPEvjRkpvHduUwX8yM6ciO5ySyYtNovTe5SDBKd
         nadCa9okn/1MAVpDdFKS0XTcydMbCbryH6L72fPihgz+SxMF8b8yb3UN6njx1l/E4bQa
         2XBulqDGEVbObM59Thz3dGDkNGHVcUx33e60MPCLMjAWHVxX1fJyQzWurkC4F5nYtc0o
         F7drloiLZsmTlZQkqmpeGHsAsYlJIlMG2NoFGzpN/MS8cntptStdLNfbEtsM8XtM2qYG
         dMj4upaJaCBDGxV2hjbN+TWyzmFjWxZi2+7N4AmPZDxFiV2kjbG2bS1EZ9FrYLLbG/7B
         pAtA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=CO45TAFgQNnqJmmnkZZK4sZFwyyF8q8bq5Xo2tcfdVU=;
        b=o4TY7MeBPv18ppdjRq99o/5U++RsmMQC1cPSUYSUeRuWR8wNR2hh7X3PL3kWG9/fjb
         Y5/oy/WYuWL+9CRSKjQSv4xddIqd9rpfRpE25mlliOiNDnEMQgcIFHbGL8vaI3cuRulW
         X2+XvoT3hlurcWRuU/5rKwCtkBNBmCjUOpeAh7q8eIGUOSZqnaEk9WxJZKXNICX2kSu2
         YznK5645doi41hnrQzz8TFVjDgiyANrRH+pTFwQq/W+6a7CxT614y/nmc1dbo3Hsd7IE
         b/4/EcgU+Dz8j1LEq9mSqMHWI0yjb4GwIe5os9FkBbv/53C9BeaSmV2LmgrVcr1ttta/
         eVJw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RCW3OiwE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=CO45TAFgQNnqJmmnkZZK4sZFwyyF8q8bq5Xo2tcfdVU=;
        b=MRuNDJ0bh3UrM+BL2L0XVH0E1DcC3TgIhCtoH2OhCb/NXVU1mIrPsmlscVWJtKlllZ
         pQ7dYju0r06VaHSI+u4Pkxo4FgaJ43E/UyFMAd5RuOk+h/Ga/ixJKSbrgjbV8pH93t6Y
         23ouups2k71SkSomyNG0xFrv1FW1tGNyb/B3UEzElmjY6u5Eg7Av2wOxkEn5W8F/srqb
         UEoT9JHLmqnrSrlRoFN2Mr8miBMyqqZwthcqTmZfhKtopS/sl2TrqF+YuPxtjLxxDkFT
         +ohH7l92qDoMrPvb5IVob11OAzlZkTNvci03APmXPfTKDaFvm0okLk9iOgF/YvZwTBNr
         Ceiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=CO45TAFgQNnqJmmnkZZK4sZFwyyF8q8bq5Xo2tcfdVU=;
        b=l5/GNw9hY9OBs4FT71Ed3hkM7+Ci9rPwP8rZ3TMUcSU4wJlGOMgdmqLRZw5vDkqrQD
         +OjLUEL9yPHWYcK/uLZB8DjxXDBf7GKCqmRLeuTW3lpIsV7P4y9Lw9mTvG7qjPRHQ9fT
         18Sxj60xb9YTx32xIUDi839BfOyQq5adQR7+y30ZyD4N2RTG41hWcyNwpwWEYQQJUn0k
         Go2VnlE2uzD2DjrgKuAwy4TJ4zLmRd8uV41+QJXk+bQ+ODgMTK0PlStnZz4x2k9fA8D/
         RNDjWa4IUaNgrHI6s0wmu1vu+6e/cJwtWpxeZyr4DaNzYjZsjkk3ausUHnUlSzdlLl9n
         77/Q==
X-Gm-Message-State: APjAAAWL7PxymqXFmXO0E0+0gF5NGOpXIBYRZouL+y3RxOx7u0P7Kz/8
	il2UqTvaU9CiwLEXNtgywsQ=
X-Google-Smtp-Source: APXvYqw71TrlChUmleIfNxFcccrQ0kDVG0479enKFXVSayyxq2O/8dAMw1wto8OYyDn9tdGZZtBqmQ==
X-Received: by 2002:a17:90a:284c:: with SMTP id p12mr4756079pjf.87.1567599730239;
        Wed, 04 Sep 2019 05:22:10 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:d152:: with SMTP id t18ls803295pjw.5.canary-gmail;
 Wed, 04 Sep 2019 05:22:09 -0700 (PDT)
X-Received: by 2002:a17:90a:eb18:: with SMTP id j24mr4586171pjz.82.1567599729959;
        Wed, 04 Sep 2019 05:22:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567599729; cv=none;
        d=google.com; s=arc-20160816;
        b=rczCoXU0kKJeXzprXwtW3aAcmaG5+JIINcwzMz7heGoANtPwdcNgP5B1nhCF7/wxgU
         rkGqS0MgZqEhmxJ6WpIombJ+xbL1nPX9wKKkf5IGiWeKUpOBCouEcGkveHgZ8V3ZUgdr
         z+oZ9GJmz5rnOkOA+E/lMjwEUnAN++oga3/ew5xESKoUUIEJ8OE9o82FjokbejGav7wr
         J5iDrdul4/gsiwhW60fIK23YxEXY7HFeDgld9g1ppuj4hdpFmlTgydBnR9tx7IwLyz/b
         jOuzImGt6Yn7n8elVs+W1yZugVEwezQmOrV4kMFhmPsiHKNl7MBxwEX5eH11EgawqnwF
         kS8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=BEY4ZjN+x1umxC/BpIo2cg4a+lwUZcCnNmWW2NVoOq4=;
        b=a2Gy1YnEpOboVugCw02TFbSAIiwd4zVZlYRIi9CnhTfQsQlYvFoqHziBrRCZ+aosMg
         fCzaJ2HaV7P5VeFxeatuaTrKu/XfQyH+R+uwBUhFbtCz9JSx7OGEsw09QXBxvmGRFfhs
         seEnCvhxns0bSNxZmDyK7c5LZvBYCQFA0LTCQI2mlA2XtTBMcXfFHM+TCkYGsbuvBCRj
         uRVpiCkhFjXnrYK0NptQAVApt70Oy+cedm5gdHmbdvVjinvGu/DzkbPlDc9agUy0OByf
         6efmLxkSP7dJm8hpa3HjPdXckgo/HP+MLnr/9tyDQwtcvZLAEmzW5Ly5RtYQMp8fq7Ni
         2FbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=RCW3OiwE;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id i184si1068242pge.5.2019.09.04.05.22.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 04 Sep 2019 05:22:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x84CM9Uo119312;
	Wed, 4 Sep 2019 07:22:09 -0500
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x84CM9d8097181
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 4 Sep 2019 07:22:09 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 4 Sep
 2019 07:22:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 4 Sep 2019 07:22:08 -0500
Received: from NicksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x84CM4PG116363;
	Wed, 4 Sep 2019 07:22:07 -0500
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>,
        <lokeshvutla@ti.com>
CC: Nikhil Devshatwar <nikhil.nd@ti.com>
Subject: [PATCH v3 1/4] inmates: uart-8250: Add MDR quirk for enabling UART
Date: Wed, 4 Sep 2019 17:52:00 +0530
Message-ID: <1567599723-19589-2-git-send-email-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
References: <1567599723-19589-1-git-send-email-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=RCW3OiwE;       spf=pass
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
Changes from v2:
* Use CON_HAS_MDR_QUIRK

Changes from v1:
* Use console flag for MDR quirk instead of compile time flag
 include/jailhouse/console.h | 7 ++++++-
 inmates/lib/uart-8250.c     | 3 +++
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/jailhouse/console.h b/include/jailhouse/console.h
index 8961c6e..a6efd37 100644
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
index fb7940d..5492e06 100644
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
2.7.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1567599723-19589-2-git-send-email-nikhil.nd%40ti.com.
