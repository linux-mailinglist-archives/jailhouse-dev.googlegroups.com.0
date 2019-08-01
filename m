Return-Path: <jailhouse-dev+bncBCB7D7MXMMILPHML5ICRUBHIPKPKW@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa39.google.com (mail-vk1-xa39.google.com [IPv6:2607:f8b0:4864:20::a39])
	by mail.lfdr.de (Postfix) with ESMTPS id B35837DA62
	for <lists+jailhouse-dev@lfdr.de>; Thu,  1 Aug 2019 13:36:24 +0200 (CEST)
Received: by mail-vk1-xa39.google.com with SMTP id r4sf30693293vkr.8
        for <lists+jailhouse-dev@lfdr.de>; Thu, 01 Aug 2019 04:36:24 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1564659383; cv=pass;
        d=google.com; s=arc-20160816;
        b=juvrFTAvueTn3dHPzYfJlen46BCb3SFBNAcn/NkR8xzDANrva/6n/dWao/8h5erJSF
         fefctNjSf/doJ5wYwUeUuhBaAkrwPcQqEku+oUFI7LLFwph9kyoIaZhvvWQXKofk6tDW
         gTzGY5lUxooKl6eSn3q763v1ZGv5+nTqB3m0qfdVClHWmk6S7dAU1FxYzjz7NYe7nJIS
         RR7fWD5AbHquG+d0cHO10BfkTsgngnI4dMVgYhb8JyuMoE+Ym++zRwVT9bF8WIBIPmIR
         UQFrcDSLUcR+zvM7Ki8pz55hNQ7cYx7C//HvHuQCWyY16nkIvKW5iQQe4loirwsSWius
         +/Nw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=cyUmoBgCrWVByGMY1fLoVKXbX0tWi/WBnjzSRIdBhSI=;
        b=f8yMS+kDIJZa5O+j6C5p9yQHoH1bkt3rHIGz9q4vSGsa0qtidzHrRm301W2xDFGOIV
         crWkv9G0x/JUlhCBAmtfGrAdgaldbAW585xu9wDTZS5GRoN7uKr6FJ7/rc4Y5ixnzPFV
         lgqI4WkNt7pNQsss3aFSxDRoWrUQ7H0lYMlD63/yim81zVZ/f4cySKbdtgjCbto++98h
         ApJUa5+2ljdr2nZmaBG4scYq2oT1Rey74a342M5GtDXDIVpm8F9pQE3GiZzZYwbpld9r
         qnep4NDYBjcJcza435HA5baSvmSmcwDbvLS6NT+OLV6otq57/fWLDzhC/YqiHjh0ogac
         +Btg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qm3z6ErP;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=cyUmoBgCrWVByGMY1fLoVKXbX0tWi/WBnjzSRIdBhSI=;
        b=cwpUaAkoJsgvmUS6kRFHlD8eX3aDmEsUYxbQm63/sAyyFLmPSoKC3ERUFOzjSp1GyY
         T/0pZM9HXQ5LvLpvK1UUrBTojNJH07LM6WTDAjTBKhohpBZajuJL2kFxmLNwusTNXVh9
         jVCcIUnMaV/4zLmwJ86MRP0H6IIqXtdKzWJW2GsULSiD/bZbNcc4ZRzpMT69tBpMtmRi
         ZKiD2+S4DowOHXGPjkg+GuAZIla/kW0R3QBApXD/viLmOzupVl4vuNkuI9x5D/dFiPZQ
         A0FctUnpdgJJzp4IkpnN/jDnj3yydsTGTxQV04ibEWq3igjQCLQnGc5JElbYYAgX8M3T
         irfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=cyUmoBgCrWVByGMY1fLoVKXbX0tWi/WBnjzSRIdBhSI=;
        b=mptPdXPEpuUKi7qjjwnwFKv1DwRgJrtHckVLofdwQpzUYLdLrx1xks+LD3A3hPOf2W
         631t2vzoDocgSilfkftEhvqOpCCjFQI0gL7Dcj28ayxMdKCzZiMoNvgFjVGBQ12WpEvd
         YzYNRIylQRluv049Djt7SUX3sZrJngDwTsUk3A76q69JZJM5gdsyUa4e8TmOWrjxRIBu
         ij3QxCpWmH/3r6WayrVVuPAdSwOV1aYNtP8wuA8Z3B29nB7JUiKgXkDBQBJX4ADe37Fa
         XItLsgdrNMN0KqXPGZsSkdDqEoVpMQlGQOplZ7sKguX1POepBlY+VGlIETcXkQvtqjwS
         bRPw==
X-Gm-Message-State: APjAAAVcjb/qnjCBbnj4UNTxz6PT/rY3LCQ0eg49jT2UsW7fiR1JJAzj
	SBpb27E69CY7wXxvSsAJSjI=
X-Google-Smtp-Source: APXvYqw/V31urFYSQdhx8y9lC6hqYeLP3ThKSHA8RylTZuwDhxNspcH1q62aouaqErQlUmDDy/MAmw==
X-Received: by 2002:a67:6282:: with SMTP id w124mr84163045vsb.4.1564659383551;
        Thu, 01 Aug 2019 04:36:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:7d4e:: with SMTP id y75ls9485551vsc.2.gmail; Thu, 01 Aug
 2019 04:36:23 -0700 (PDT)
X-Received: by 2002:a67:f657:: with SMTP id u23mr46993642vso.154.1564659383181;
        Thu, 01 Aug 2019 04:36:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564659383; cv=none;
        d=google.com; s=arc-20160816;
        b=dQ+dL54MKveghLBCqIvon9YEWLbmlb3OfA6Lf+h9kNcMil3ZB+Kni8wKnKdXNpAIYl
         JjWW3n5AoV8xqG4Kz53gKeGYs1+usvFU64f6MFOmj0WEtZQHXT7sBeBhhLtQJy8O+8Z7
         nyn+loHHjA5SKglbn/D8hR/xg7J3F6quVyOyjjKKSr4uNILwV6TPvztEQ3JVqZujAUWt
         IvvQnnyrMFdbvlTD/I4NgQabhH/1YR1gckRPPq1WuPG9VYlcSVSkiUwrz3BAT1r1/QQj
         ZSCuCtB55WZQ+2dgIo1UyoAn3AhoPSIhFswIcwPTyNCH/hsFGYkje2e4dcIALC15PkXD
         jnXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=EzP7faK+0ricdMaoF5FZ7edl+pNsK58LEUXfUNOxDq4=;
        b=d/l9thg+krX4fBEXmgwSFc0IhWkzo1gfTGMUv5Ya3oQJk9Tn85L7mwD8xGniRh05zF
         8wIvCN7dJCQ+yfv5TDRrJ0ksZSk7dFOKbtTejw5rH8YBU/7ya+XIHHmSr8BOO+WKnL2/
         ybEzXbnMuESjNPn4F38Gc4cCsYKIEmr2JGvVI3k0j2SMI53W9BywU1sV+2YckqpLVVEK
         R3e+lIBzX27PHcevid3oKGoIG3WiAD+6ts7gK0StY0B+9gk4gcEFmvkQGsocjQObtwDt
         rNi4BbgaI9iho5IKcTNM0Cl7nhy1kL5mG7yh/RkIAsX7/iBBOuqG87elHiyf3mUi3B+e
         dAag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=Qm3z6ErP;
       spf=pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=lokeshvutla@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id 63si3717875vkn.0.2019.08.01.04.36.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Aug 2019 04:36:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71BaM44051360;
	Thu, 1 Aug 2019 06:36:22 -0500
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71BaMB3061751
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 1 Aug 2019 06:36:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Thu, 1 Aug
 2019 06:36:22 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Thu, 1 Aug 2019 06:36:22 -0500
Received: from uda0131933.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71BaJ5N029191;
	Thu, 1 Aug 2019 06:36:20 -0500
From: "'Lokesh Vutla' via Jailhouse" <jailhouse-dev@googlegroups.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>
CC: Tero Kristo <t-kristo@ti.com>, Sekhar Nori <nsekhar@ti.com>,
        Nikhil
 Devshatwar <nikhil.nd@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
Subject: [PATCH v4 4/6] arm64: iommu: smmu-v3: Add support for smmu v3 configuration from config files
Date: Thu, 1 Aug 2019 17:05:41 +0530
Message-ID: <20190801113541.7410-1-lokeshvutla@ti.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190801112648.6569-1-lokeshvutla@ti.com>
References: <20190801112648.6569-1-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: lokeshvutla@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=Qm3z6ErP;       spf=pass
 (google.com: domain of lokeshvutla@ti.com designates 198.47.19.142 as
 permitted sender) smtp.mailfrom=lokeshvutla@ti.com;       dmarc=pass
 (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Lokesh Vutla <lokeshvutla@ti.com>
Reply-To: Lokesh Vutla <lokeshvutla@ti.com>
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

Add SMMU v3 type to jailhouse_iommu_type.

Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
---
 include/jailhouse/cell-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
index 73dc8ca1..b2eae054 100644
--- a/include/jailhouse/cell-config.h
+++ b/include/jailhouse/cell-config.h
@@ -202,6 +202,7 @@ struct jailhouse_pci_capability {
 
 #define JAILHOUSE_IOMMU_AMD		0
 #define JAILHOUSE_IOMMU_INTEL		1
+#define JAILHOUSE_IOMMU_SMMUV3		2
 
 struct jailhouse_iommu {
 	__u32 type;
-- 
2.22.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20190801113541.7410-1-lokeshvutla%40ti.com.
