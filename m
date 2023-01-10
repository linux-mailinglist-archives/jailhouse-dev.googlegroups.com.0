Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBBFO62OQMGQEKJ2XN5Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D86966467C
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 17:49:09 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id g28-20020a0565123b9c00b004cc8a085997sf1147907lfv.13
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 08:49:09 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673369348; cv=pass;
        d=google.com; s=arc-20160816;
        b=NOzAimFZPUMB6I7fL4K8/HHvaqnEz+wwwVCBeq70ctYoyAkCJzc/swqaOLpPhQi5bW
         jS02RJJrbrZfwwEDBhDoHaB/+IkPRUi7qgSPN0I2tQ+FTEIQGkHixQ1xzoyQ2csPurvg
         UOiyAClmdzqxgP+syIwJhNjvkeU9mcHe0jGfw6U9vkmXemHrraKGyRw7DRRF46arieh9
         rpisBvjS2AO5wEKKsQiSX2a6AdxunPZpsSSNU7a+XMjP76d/092gpcH8j43rU0kmYNbr
         4bw7Z+d6cvZAGaZMPgmxYmXKLAX0uZg7W2sybXTmuAXr2CAp/cwT5cXjyhQpApg/5t3h
         lVJg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=tsqmEp0mCbTMtkUQy58ICFYWmsnxOq7tR+Cinh4xPiQ=;
        b=kNxIaEPNGBi0RxYrt7FIShuyLtTcWPxzrI2ShbQwthHTM7G/mRd+yAQEH0i861A/W8
         v12ZJ+SIMV4LzIk+fCynedDUKgdE6giPplnZAfC/9e22IgdzF0IJfAkyGRvtRC6KX9WW
         27Hgyc9s0EeG15XlGVWMQBjdzzR2Sh7rgVu1Tw5bxCSLyHl8gvSA5AgspeWmd9y7v6fi
         vOXjlyotYzbaQB3go7dxiojrewUhTgQNG7HmIyQctjLnMrGeEhrcOjpHULZ06keFr52p
         r9bU4j95T7dRlll14REjexA/eRcho7m3l8b/l8v/kvq9H587wC6hh89jgVWsoWdqAf2z
         5qFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Ko1kwg5g;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsqmEp0mCbTMtkUQy58ICFYWmsnxOq7tR+Cinh4xPiQ=;
        b=Rd1i+cuJ/Ldg1oeUh2G5DLfLB9TlkdXAiWCFtm6UaBB9juymL50ECHkvxqobd7IGdG
         ChUrBh1NOsbrKtC8P2jK/nRVT39LOXr9vT2O+8q62CGKPBVnJ3qEL9Hs3cFHjIeAY0kZ
         Q5w9vNvbRNH4Y5QemXFkUDSPONGtjf6t5k5orbGwCiWYUjlfQhAWRZIsCH4OGXPVotN7
         eKu9K3bjGXzH4YGoDPtuPtTVzvWUMm7qkgmmd0Cu54l/97zWxvjC7GukWGpsvirxBnRC
         u0N8yl0fKVk/A9CTy6LrTZaZI6jbWd7XfGoaHOqN7bm8/SThjR8mw38psGs0214hsMOR
         oxCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsqmEp0mCbTMtkUQy58ICFYWmsnxOq7tR+Cinh4xPiQ=;
        b=AoTM0pYg69xhQQ3Wy4aj2j+dQ7gikrIXFfSdalmaGs2eQ+NSnoPhS/yRMvCbC1glj6
         pGAdiyPpcC8B3M9mIfq9wCvVOtLNOh3GjbygHb6xCqbxcDdLph29tL4FPyLuD/B5vafd
         eM17ZUGfLsSb8sV3XCMfMT/8uwctHhojWU/1qsaYt5j4GkON4RG6LlIBL005VfMaf24U
         Y1wNuPeU/HkI2jv4BcHEQg+lfIRUV5s/EAotHrjmYSMD2rFcxInLYrR1EPV2OUcgPRae
         JMxsMzFygvfzKQt8/3bEBc26hvD7SaZs6pHXwlCgolQXcLQw3DrtRuEP2wsxDAeWFseQ
         9Cxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2kpkB1enuO6pK04ene9fjxzIRaUU0+akjfCEL7hzSmJisERikMng
	mdOMvpcctK4z9NK//yYGL8U=
X-Google-Smtp-Source: AMrXdXvZSU92bQba8bHZmboGz14ZOq9uyvJJFOjrat06HyzmMK6HHln4510OHAPdOZtVdhtg8qJBwA==
X-Received: by 2002:a05:6512:169d:b0:4cb:269:dfed with SMTP id bu29-20020a056512169d00b004cb0269dfedmr4701674lfb.329.1673369348755;
        Tue, 10 Jan 2023 08:49:08 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:58f3:0:b0:49a:b814:856d with SMTP id v19-20020ac258f3000000b0049ab814856dls3676128lfo.1.-pod-prod-gmail;
 Tue, 10 Jan 2023 08:49:06 -0800 (PST)
X-Received: by 2002:a05:6512:3048:b0:4b5:5f2b:ddf8 with SMTP id b8-20020a056512304800b004b55f2bddf8mr22896317lfb.7.1673369346697;
        Tue, 10 Jan 2023 08:49:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673369346; cv=none;
        d=google.com; s=arc-20160816;
        b=FnR6tex5STeSVPhLpDwG0XLWvFFJB25HFNtpPVNB1vEAsquj3Gf6yNhEMsleaiaRLX
         92JFRvVfCnagTHLUTCzBfthVRdfbPS4pMHhYVghqWrpwsWxPHP75k2dMKNapp/U89jwf
         YOxlvsWv6gq1YPp0RF1KgmVKsZqo3KYWqJlsTcXMplk1RyAYsCsFskKfxs6zwObaCKC5
         ojWnf7D9TxkrrnrN6uJdl27UAovms4ZtFFeSd5bq5JVhcoJ0pzI+wZRkNdz/wZaDAy0k
         vebCgSRXxxUOEiVCz3JpP1IiUNNjIcIAvNKPdXXjN7A4daP96AtXAD1bxwXapaXhAWuZ
         eIDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=5jXTTUU/7ub1n7aLq+iWaq2GX9Jrm8FETeZkAl9OB5g=;
        b=0bdf3H7Ip3h3E9aHU3OCSfLlBV0BVIu0x1HY8WGZvJDstah2R+5xj8oTCf1voOyK1x
         k/9hdHEEI0QRWbfD2dairEUalrn4GMQm4mwv6sQWZec3Lwfr7/ADQNBfyCnNRraWQYTF
         LhlkM4+FXb2Tu2/t3Pz4/FiAF0+ftY9evSrZUtQ4O1E0T/TDDGdU2cC8Xjkjn/m/puhl
         WsRqya48a7g1BfdRDB6h7YxicKKlbFq6Io9WwzbP6fEHLNrrKsBH148oCPcdxrtX0ci9
         GfkYGKo2Bx8zuWnxjxJNR2Vp6wxkuM+YSzuo7hFnhDmhID90YhBONtdIPBG3OliHN5Rp
         Zuag==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Ko1kwg5g;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta02.hs-regensburg.de (mta02.hs-regensburg.de. [194.95.104.12])
        by gmr-mx.google.com with ESMTPS id c19-20020a056512075300b004b4f4360405si522333lfs.12.2023.01.10.08.49.06
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 08:49:06 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.12 as permitted sender) client-ip=194.95.104.12;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta02.hs-regensburg.de (Postfix) with ESMTPS id 4Nrxbj5gMGzxtx;
	Tue, 10 Jan 2023 17:49:05 +0100 (CET)
Received: from atlantis.home (194.95.106.226) by E16S03.hs-regensburg.de
 (2001:638:a01:8013::93) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 17:49:05 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
Subject: [PATCH 2/3] driver: add architecture sanity checks
Date: Tue, 10 Jan 2023 17:48:50 +0100
Message-ID: <20230110164851.88918-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
References: <20230110164851.88918-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [194.95.106.226]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta02-20211122 header.b=Ko1kwg5g;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.12 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Now that we have architecture information, we can check it. Just like we
do it for the magic bytes of the configs.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/cell.c | 4 ++++
 driver/main.c | 4 ++++
 driver/main.h | 8 ++++++++
 3 files changed, 16 insertions(+)

diff --git a/driver/cell.c b/driver/cell.c
index ade61edb..f9d7982b 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -186,6 +186,10 @@ int jailhouse_cmd_cell_create(struct jailhouse_cell_create __user *arg)
 		err = -EINVAL;
 		goto kfree_config_out;
 	}
+	if (config->architecture != JAILHOUSE_ARCHITECTURE) {
+		pr_err("jailhouse: Architecture mismatch\n");
+		goto kfree_config_out;
+	}
 
 	config->name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
 
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..fe119890 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -396,6 +396,10 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		pr_err("jailhouse: Configuration revision mismatch\n");
 		return -EINVAL;
 	}
+	if (config_header.architecture != JAILHOUSE_ARCHITECTURE) {
+		pr_err("jailhouse: Architecture mismatch\n");
+		return -EINVAL;
+	}
 
 	config_header.root_cell.name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
 
diff --git a/driver/main.h b/driver/main.h
index 7c9f661c..9df51aa1 100644
--- a/driver/main.h
+++ b/driver/main.h
@@ -17,6 +17,14 @@
 
 #include "cell.h"
 
+#ifdef CONFIG_X86
+#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_X86
+#elif defined(CONFIG_ARM)
+#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM
+#elif defined(CONFIG_ARM64)
+#define JAILHOUSE_ARCHITECTURE	JAILHOUSE_ARM64
+#endif
+
 extern struct mutex jailhouse_lock;
 extern bool jailhouse_enabled;
 extern void *hypervisor_mem;
-- 
2.39.0

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230110164851.88918-2-ralf.ramsauer%40oth-regensburg.de.
