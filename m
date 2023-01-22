Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAM5W2PAMGQE4HZH37Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id C21936771DE
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-wm1-x33d.google.com with SMTP id ay38-20020a05600c1e2600b003da7c41fafcsf8243483wmb.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415745; cv=pass;
        d=google.com; s=arc-20160816;
        b=XYRCYSqtK7vy/vn0RsY4J7tyejpuxpI6g1mz3eXXxiOFjDymOBma3ZABOmuRV4N3Ad
         1fnX2LL1lHDp3+ABEgun4AeXW0TlTBPZksMlzSS1JJ5nAqJNk6148o0TqcX9mMXbjlBY
         t5CZ/JJwgNqjH8IpcNvMpnFUoEZoa5lLTXm+86jFo4wkWAf50HU2+DLsjUkqEumKD1rT
         FEBIdQK73Y2aLRs8KtOAxfnNWEJW7IlX31LzFeVwWWhdvtDfygioax6HSkWbKaiNAcMj
         P7qZELNjpXvfWSS+za0fd11GdLYPBkImnWR7HXK7IKScqSsd6gb3+gDBWQ49U5AQgD4w
         2mZw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=Zc1CmMUeb8PB56UH4+yiXaAqUbdwFx98PHe3Ci9T5QY=;
        b=sjzZYNFEqbRhSLV6mK+7Np/IzK2M/DTpNA8/995OM0RgXURQo5wvolQP0p6By+lcyZ
         /8Lvfiejx8Agi/+9rwJftvNivU3ZBwDTCNQaOMuD9aYzfZohURanOsS9pf/qfHUe7Oht
         ycJsHsgXTabWkND2LeGp4noVJKlkptCjl6RnjrvfVn1l7j/Rn6iUSUYkVVD+g+9/fVN2
         KvkwVoGSYwh6uvR7wI7xj2TxHMN1UwozRfO399ZDx4ne5CWnSW3TMQfrKbJXlt+YcCNv
         dq/DX3U+OgmvcdTBX8hlEwYv+Xdnd1ChPiKfAIVpBpTEi2URHjpZlbfgpDg6ODfWYi48
         P5ug==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=QCUKvSAq;
       spf=pass (google.com: domain of fm-294854-20230122192903021ac2b0261f0259e8-rsbidy@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903021ac2b0261f0259e8-RSbiDY@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zc1CmMUeb8PB56UH4+yiXaAqUbdwFx98PHe3Ci9T5QY=;
        b=b9k4UNi9beeSFd60YdA7v9fUPtgNmlmYL1TjiGszwAbSTPkB9oZJLCeLGE6GqYHL+N
         fq6SVe4HBrYICrHAJ47P+6gsBwc3LePWe+6uBwSdAz4cF7TbvMhIh0P2vYwFPejERvtR
         Y9D5x21kyo3k8fLbisz3N5lijT3hRwMK20UI6krLvSI6NlEK4S1mdsZ0VMf23yQinOcV
         0ewicZXTnMz2Yo7ZPOgniVctYEovlZuUVMfiPSfVEDZ/2vI3FjS51NZPQJ8XoQjLJBdH
         0DofDXZEfCIhJGXAHdhYx51d7Uta0KQzGBN1jtM6lRgYAGwmudLkk4XcQ5JalM2PVdLP
         XnBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zc1CmMUeb8PB56UH4+yiXaAqUbdwFx98PHe3Ci9T5QY=;
        b=e/8IzODBQBTQzbuaUVS5GHDdSCa5qzLMzlN7aBhEFXLl9UVctc1Smv3Cy3eGbGdcA+
         96r7Ns+Ir+7xVw1zGW9LNFSPH+42nZslE39eY1+cl/dNE24pn07g8VCv1P2SMm9nc1jx
         cZsCm1tNlWvF3UEGt7ykMexdhTlhmP+AqeYkgwve6nU38N83oDtvwHoNjyAdu636Dqo5
         u+v4kSO4BBEOIFHnXErCFhLU/08t6drnfTkIm+Xom/9gNmT2yrxI4TUkoa7UwrhcNLve
         IA6059lGmvE0dkMcQTmjdjiMFfZ7etqBD2m/EiFL3PT5Py7nU29CmRvK8iO6VIF/b1Pn
         isYg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koDmuRn0VTwyQhatvnUhqwo9cnAVW/woNtqMKJHu4Wj8m50hbjx
	a6yf4Ge88EJabp9K3Scy5O0=
X-Google-Smtp-Source: AMrXdXtsbNVX69MWOMPfrkXivgUZtLXZatwMoJIaJXUTOEd7R13SUCrcn7a6v9kxf1ax1IN48G2b3A==
X-Received: by 2002:a05:600c:26d5:b0:3cf:a258:99b with SMTP id 21-20020a05600c26d500b003cfa258099bmr1210162wmv.34.1674415745511;
        Sun, 22 Jan 2023 11:29:05 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c12:b0:3c6:c1ff:1fd with SMTP id
 j18-20020a05600c1c1200b003c6c1ff01fdls7064726wms.2.-pod-canary-gmail; Sun, 22
 Jan 2023 11:29:04 -0800 (PST)
X-Received: by 2002:a7b:c5cb:0:b0:3da:fac4:7da3 with SMTP id n11-20020a7bc5cb000000b003dafac47da3mr21405552wmk.36.1674415744130;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415744; cv=none;
        d=google.com; s=arc-20160816;
        b=N7L+C10zAyMk/+c675w7S5BH4jwPYhltRERlZK79jHbCpBJzcZCFGwAB/4X3vmHseq
         NVe3+YqFq8ZPksUp/fvQXwtjNxKanildcbisC83BSXpMkRNzLkqZ3uZ7zN8hD8FX+xov
         eEGef8wdbG5s4WF6tXhBAJKrLhJoZ2LwF/AjSuyf6TlYT/0L77tsmIVE+nLzqvkyUBqS
         kSD67gcmbCXJRuirjd5YFtK8BDNoZMp6+Ts/NOkIdcz/gZEB+0m3hvLRBnjqjSYUwlMy
         ldheIwlPsCvQl2DiwI6QP+DIr97Sep0UwOB/SV9TnEQQks6MSeE45bl1tTCUjUCMY2hJ
         ybiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=eHM4cYqzmzMEGkgTYh0L/1wpULu1LsEDY0k9M91J7tc=;
        b=mQUsaKzYeX+MrgoCfCeqmKFUEB7LIeumjsOdD8EruPk1cLKlyhkjrlI/4l+ZbOduWO
         E6ecBZYzIcZ91y/wRlXRJbUtVhesJJsIfRm4IZ6hRqxVFYIXhT3zsJ49HhekTcCA4HHL
         uZzhLH/xxE6CavwwoLtoK5sKjCFDhG3NADMqpUW8U3JY5EEGsRnZUR5hBL89pnKqDwdA
         sKAxWRVO65Be6BShdtoYlQ1axNI4I041Trj01wmb25DLFWxr4t0UloyW7ERjKFWR19ej
         QbLWsXG5M2KIfmKYatsNw9boHJLk8wJTm1FbG8c+N7d+XLWPBDzTRDiujjXpxmtH/Sea
         0NoQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=QCUKvSAq;
       spf=pass (google.com: domain of fm-294854-20230122192903021ac2b0261f0259e8-rsbidy@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903021ac2b0261f0259e8-RSbiDY@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net. [185.136.65.225])
        by gmr-mx.google.com with ESMTPS id r6-20020a1c2b06000000b003db0037852esi637170wmr.0.2023.01.22.11.29.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192903021ac2b0261f0259e8-rsbidy@rts-flowmailer.siemens.com designates 185.136.65.225 as permitted sender) client-ip=185.136.65.225;
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20230122192903021ac2b0261f0259e8
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:04 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 10/14] configs: arm64: jetson-tx{1,2}: Fix config checker findings
Date: Sun, 22 Jan 2023 20:28:57 +0100
Message-Id: <78ddad527d7d0510d6b71fdb39bfb6f04ffa8fc5.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=QCUKvSAq;       spf=pass
 (google.com: domain of fm-294854-20230122192903021ac2b0261f0259e8-rsbidy@rts-flowmailer.siemens.com
 designates 185.136.65.225 as permitted sender) smtp.mailfrom=fm-294854-20230122192903021ac2b0261f0259e8-RSbiDY@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

The TX1 had an overlap of RAM and ivshmem. TX2 had the timer and the
TOC_TKE (whatever that was) regions overlapping. According to the DT,
the TOC_TKE is actually the timer region.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm64/jetson-tx1.c |  2 +-
 configs/arm64/jetson-tx2.c | 11 ++---------
 2 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/configs/arm64/jetson-tx1.c b/configs/arm64/jetson-tx1.c
index 4c3320ff..8d1b9cc4 100644
--- a/configs/arm64/jetson-tx1.c
+++ b/configs/arm64/jetson-tx1.c
@@ -365,7 +365,7 @@ struct {
 		/* System RAM */ {
 			.phys_start = 0x80000000,
 			.virt_start = 0x80000000,
-			.size = 0xfc000000,
+			.size = 0xfbf00000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
diff --git a/configs/arm64/jetson-tx2.c b/configs/arm64/jetson-tx2.c
index 28e7578c..c4078d90 100644
--- a/configs/arm64/jetson-tx2.c
+++ b/configs/arm64/jetson-tx2.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_system header;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[61];
+	struct jailhouse_memory mem_regions[60];
 	struct jailhouse_irqchip irqchips[3];
 } __attribute__((packed)) config = {
 	.header = {
@@ -154,20 +154,13 @@ struct {
                         .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
                                 JAILHOUSE_MEM_EXECUTE,
                 },
-		/* TOP_TKE */ {
+		/* TIMER */ {
 			.phys_start = 0x03010000,
 			.virt_start = 0x03010000,
 			.size = 0xe0000,
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_EXECUTE,
 		},
-		/* TIMER */ {
-                        .phys_start = 0x03020000,
-                        .virt_start = 0x03020000,
-                        .size = 0xa0000,
-                        .flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-                                JAILHOUSE_MEM_EXECUTE,
-                },
 		/* UARTA */ {
 			.phys_start = 0x03100000,
 			.virt_start = 0x03100000,
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/78ddad527d7d0510d6b71fdb39bfb6f04ffa8fc5.1674415741.git.jan.kiszka%40siemens.com.
