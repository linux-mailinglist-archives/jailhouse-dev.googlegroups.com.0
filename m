Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUFK66OQMGQED6YNS7A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id F016F664DE2
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 22:14:57 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id i13-20020a056512340d00b004b8825890a1sf4827301lfr.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Jan 2023 13:14:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673385297; cv=pass;
        d=google.com; s=arc-20160816;
        b=XgB7c6OBcnSH1xiS4bPYgo3gFVatijige4CZc/gW2gIHuxr3Ebyei48L5HhK8lfqaD
         YARYYNq4WxVPpDItr84BHCim8wVz1LvJ+Mp/iTd7wDh8mck8JlNSxfLacLMcYS8z4Lhr
         sU+299gJQLNsANZocjOqinpFhh/00Lc+bUjNLdXVn9T+g9titikKTz1vn1GYEmvYJ8D6
         lOJvQ6UHLuUczmpj7b+6CZfN6vNID8+m8HUJDlaOfjzXmNW2jBKzZjnVE6wPnikYWwjR
         vTRu+cp7HKnJlCJ3Rdx0XmQsqiyHUbS0hO1I+KeKFO7TnD3TTXS5Mofyc23ocNt0ngz+
         i/cA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=ri+yZMmlQt2mPeVeHPetE3utsbNr4tZFpqzF6iZPwsw=;
        b=AoKlspaeqM74hN7tgUsDWiGY8DuwGTtX2bUxwd8XWlYpd+/fgPej4x+dQsouWLBkvk
         wAMe+kF3qR9ir2hLeCvrVAFWOrczs5ypvDnpsmFLxD5wWmLRPJUfIkBVFIGiuOWZEuK9
         IPggYtwqXyAV1RN3T6Li/gvABwegnYfq8VSxT5owROv2MU/y/jszfbX0gVRE85AXUIAv
         QX9CBPiy8Uo64VmWSXvXXsePyYxB22vckWms6H2njwgVtDHyz5PfYoVEDHI2MWE1+FUj
         9OlcLrsn+ECEUoG9OTh+rOT+CDqIaBpSwNm+wnr5xfj+1I3Nl3XrX4racsgkDBmIntDt
         iULA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=KBcYobEd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ri+yZMmlQt2mPeVeHPetE3utsbNr4tZFpqzF6iZPwsw=;
        b=kNZF7uOWJ3TPhOOY1mD6z1mdms08wHbaD2uS7FEn0ubqUUPVWUSfwcqVUNBFlDKwL1
         61HnyyNVAt3lw7ZKHrxF0q1Lp0JPEKdvAa4rWU/2Mjgm7/GiUZs3xbMPxXtc92HVz4ID
         RR2sdcLlF0j1UdliUHUQFKG0OHV1t8JxK3EpWgjE6dVuX2JTsW4ZCjx/LAp7DxsI1qB/
         jmdX+cFpu1ZtEsI1F+UDnHLkDTJ5MP1P6gEyaX9cKwvI0az+S9sfo/f2Awr8mSo6f3Qd
         KCoeHCWuBtvjc0jjXiRKMFQEHrRbueVvjZ3lplrfXo+OkACM9ozM/0Wy3JJogExJ/0qE
         RsJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ri+yZMmlQt2mPeVeHPetE3utsbNr4tZFpqzF6iZPwsw=;
        b=0eslDmhB7D6Re27XHfn2F+xPww8CxRMyW4aQFBuG/NGpzq3k6Tq2JjQYzf7gu9yp+B
         L4HErD4dh87rX8o2pkSmxLcuE9rZ7xWv5HMN2gIf7uv75Z1358aJl4mFGj6fFYYO+5Pa
         9qYqpaFsH+uujK7QgrEZwEJdC70JNTYsQcW9ngUNpyUYNOOUswGcULz7JB6hAM6JNUP0
         uRsTdHAGRG46/crTqV9DZ2uVwAscyj06Xzc4RA96vv03OVeKIsve4tDLmzGqE86hoAOU
         LDNGdFEeoG6zWzQEZuvm6mAWYNGFAfkTfvWEdFFgxWgCEtn95LYuvjJbANeCs6FMj0Ag
         6lkg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2krWu8bgr8BGFzLXaiUbXa32JUu7uf5bh1MPs708iJcsWHpgBAic
	h5hfNh+KvQlEJ4nUumUTsts=
X-Google-Smtp-Source: AMrXdXvhxQrzWt/zdaWFeYQmZ+7NgNBRkfEHonTsWPba9cuvGihmGbJjTLKGveNnIMBT06nbbPDs2g==
X-Received: by 2002:a05:651c:1034:b0:27f:c563:591 with SMTP id w20-20020a05651c103400b0027fc5630591mr4469859ljm.486.1673385297423;
        Tue, 10 Jan 2023 13:14:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:1182:b0:4b5:3cdf:5a65 with SMTP id
 g2-20020a056512118200b004b53cdf5a65ls4325540lfr.2.-pod-prod-gmail; Tue, 10
 Jan 2023 13:14:55 -0800 (PST)
X-Received: by 2002:ac2:43cf:0:b0:4b5:8298:5867 with SMTP id u15-20020ac243cf000000b004b582985867mr20426437lfl.66.1673385295176;
        Tue, 10 Jan 2023 13:14:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673385295; cv=none;
        d=google.com; s=arc-20160816;
        b=S+6IIUMVVWISXJJQxc+LmPyIGeZJBLYYyOrFM2l2m4yM3NVNbsH9QTOH55MPChjE76
         fW3cpNtWSFJFUPUUMYMPxjiH97U3uO+rMNNYUZLBXQeHAOz09BWF1bD5onQ1Gjon0RYT
         K5nE28/a/1UTvpFMYRfyCznlmEbhTefVVLE5shan3XLGWpakvc9PMt45xY6RWiHL23Bf
         ihHBlcaKwbxLsamSmMv/FWTwCwbjQGezOoNfbOMWXTTXq2abNf+6jkIZPoicuI/MZQ72
         ncnjP/1BrGh2GU1LD8FJfdOpTm1LeexhY9ydMOMO21W62mg+HdLDEyiGtBgiVUOWnYl2
         /UaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VASsys5ZqD08zyxZg9Q6MccRsGm0EfjMCunASoxGxMA=;
        b=QV8vrA1CELNvXUYe8ReNW77m1XKcqlGR+ZNDAJ2uyE90orAWIuBjosG23Zw9///w+v
         N1h8aB3LSjKDyAt5pg/cpNmSBWfeBWljfKgyU6d3+BD9HVS4yCV+0hvySrJ1yXP2ZZcA
         qPgJrtb3LBQZXMIntXv10y1N0ov7orRlShqpYL3OFPFoRtgSIqoihiD4RYY37W8h1ayU
         XyArDnzbnF1dFiCGB1AyWAmhG2AXkcBvtISseFKpUp8QeW66DxBUJky4kNx+cdPTHorA
         Sh5+KSrhewBk+P4uq84Nkz2JpsY0s7G53nAQchJPO3olrKqNk3+6j8tdXEw5zHOkhHjn
         P6iA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=KBcYobEd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [194.95.104.11])
        by gmr-mx.google.com with ESMTPS id v9-20020ac258e9000000b004b5337b9898si561052lfo.6.2023.01.10.13.14.54
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jan 2023 13:14:54 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.11 as permitted sender) client-ip=194.95.104.11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4Ns3VQ1d3yzyVb;
	Tue, 10 Jan 2023 22:14:54 +0100 (CET)
Received: from atlantis.binary.kitchen (2001:638:a01:8013::226) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 10 Jan 2023 22:14:53 +0100
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Stefan Huber
	<stefan.huber@oth-regensburg.de>, Andrej Utz
	<andrej.utz@st.oth-regensburg.de>
Subject: [PATCH v2 2/3] driver: add architecture sanity checks
Date: Tue, 10 Jan 2023 22:14:43 +0100
Message-ID: <20230110211444.9897-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
References: <20230110211444.9897-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::226]
X-ClientProxiedBy: E16S02.hs-regensburg.de (2001:638:a01:8013::92) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=KBcYobEd;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 194.95.104.11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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
index ade61edb..11765fa3 100644
--- a/driver/cell.c
+++ b/driver/cell.c
@@ -186,6 +186,10 @@ int jailhouse_cmd_cell_create(struct jailhouse_cell_create __user *arg)
 		err = -EINVAL;
 		goto kfree_config_out;
 	}
+	if (config->architecture != JAILHOUSE_ARCHITECTURE) {
+		pr_err("jailhouse: Configuration architecture mismatch\n");
+		goto kfree_config_out;
+	}
 
 	config->name[JAILHOUSE_CELL_NAME_MAXLEN] = 0;
 
diff --git a/driver/main.c b/driver/main.c
index 64e2b9a4..c8572470 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -396,6 +396,10 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		pr_err("jailhouse: Configuration revision mismatch\n");
 		return -EINVAL;
 	}
+	if (config_header.architecture != JAILHOUSE_ARCHITECTURE) {
+		pr_err("jailhouse: Configuration architecture mismatch\n");
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
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230110211444.9897-2-ralf.ramsauer%40oth-regensburg.de.
