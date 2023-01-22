Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBAE5W2PAMGQE6MM3TEA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x53a.google.com (mail-ed1-x53a.google.com [IPv6:2a00:1450:4864:20::53a])
	by mail.lfdr.de (Postfix) with ESMTPS id 257986771D8
	for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 20:29:05 +0100 (CET)
Received: by mail-ed1-x53a.google.com with SMTP id c12-20020a05640227cc00b0049e2c079aabsf6951755ede.1
        for <lists+jailhouse-dev@lfdr.de>; Sun, 22 Jan 2023 11:29:05 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1674415744; cv=pass;
        d=google.com; s=arc-20160816;
        b=T32diPCT8bg0ka8jddWYoHiD8DxJQWYiPfr9p1EQjjluje0qsayOXfEgf+n7N/OjqS
         SFcQsYdvqeux3yMIHRCYgBrPd5Fz3N0hewKE3k6CgiitE79dxLjAsFgXZOSOtb0lvGZ0
         cmp3Pbh+KCqowkHwpUr/OVbVEcwVXxp3yd4EuzebtOWfhCVwHfS9YVkrfV9T3haNUuj3
         iY+ljst2Cxa+pCHOoHpXiIR0ASLVjnl6nAQk1k9bmkj3/QOLYb0lqqs8nOfsk2fp4cuc
         bwxO+X87H+Yai/zgPrWFyrTcK27zmHCu2LIVdKiPkibm7G8RORwoxxwr4rOP61uHUVLI
         aUPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:feedback-id:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:sender:dkim-signature;
        bh=8/84kstHz/CmVSw3AHDuzH8Up3J2QG6GVQKvDvdlcYI=;
        b=adKFy+i1BIiSTYmwiNwaAWm7J207IbZ0bEPjQ99D2ezTuKp3jo0W1MjLXMlDB8lnqf
         uzgSV4kio1Nsu+bAEfN4RhhN5Ovck9CEdU/b0gWvEDG26YydXZLpWk7oYDS9YgEXu7PB
         LuU+Cjrc/tBut8OEEueXlL2grkox0EEcJcrLoqeS6THjv+4994DGHqUhiWfZU4FgkuC9
         9SrrwP8QMhwZcx/Cu5Fs3es6IQGZIMkdDVUui85lGPnEBJna1QE9kc2anGy9uBf53Dz2
         gzVrFoCxcNyU88SJMLDLNfSa0Gw7Hwqyv5hYVEMdpfw6VKeQdsgVVq25+wOgy1KphNtH
         pSqg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=lwEFKErr;
       spf=pass (google.com: domain of fm-294854-20230122192903358ba772fbef0765df-cx7hjw@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903358ba772fbef0765df-CX7hJw@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:feedback-id:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/84kstHz/CmVSw3AHDuzH8Up3J2QG6GVQKvDvdlcYI=;
        b=Ci3RUpA0xFxNbBwS5kyb2Q8CFKkN8oZQjmTlVnkn4SV8PLt7iEwuFiWFjLh+O3rA3q
         F2ISfMr5TyO3OXbnBzVUk5CHOgaQkchWyYvffvo3+5D4fLNC37hrQZ6WjKH+YXxxQXdc
         i8Ow0PtKZSEEC+VmxcuoXtgv/IGJ3BZIpywTkIYJa1hhbwxpr/RQAa19H1L8bf5kk+rR
         l/5PI9Id9NcedOTOdXGkXGRkcjtXSWiSJwCcg2LXk7XDQ7Pf9X+4Ho6K4K0RO2erH8lw
         ZEdLwsM6Bu+R5pdCt+LDnEuSnlW37zuASxj2UOcEDwAVWLLsWAr7BO90c+WBcTCxeIaK
         OvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:feedback-id
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/84kstHz/CmVSw3AHDuzH8Up3J2QG6GVQKvDvdlcYI=;
        b=iM6Mj3IIGtQYVZzsbTDg0W9tp1sHZDMB5kHOYjyPR5cg96Dio+1+Lv6chSYtNsebnq
         h2esCpvkoc4Tjohjez+Y8oAzJ5uEE/g2NLjgJWP3hyHWf14pC8GqVLKnVU3kZVQhQ/dQ
         8alYn6QncfwcQul4d5ThiwgqDK1mdWuAUAHvEqBhrLRy7hwTf3oQBB1ZsAbT3eMp3fmk
         gDEjSAr6v+7vTD22I41t1Zm6sekk/vRvOJP972tI6Vg7a2TNchFiq70VKDxQ6Q6BG+k4
         y0CL6i1T92NuDS8y1Uj9ixNq+Ba8fDOhSYZbGlWd44LeUjK2+bhHYF9lZxM/O2pmDDAc
         zqWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2ko0+oUEfa85feERU+sfq8dp1MZocewEkGdvbJNKme16/U+5Vn40
	zsD1tWBjowW7Qsp5TVaQW+4=
X-Google-Smtp-Source: AMrXdXsrV3CYxFXL94Ef5qM7paBH1MOFDaMUATL0YbApkmpOaTkFsZaUipGaFWjLXoycT5g94GJycA==
X-Received: by 2002:aa7:cd47:0:b0:49d:f700:b1ee with SMTP id v7-20020aa7cd47000000b0049df700b1eemr2720545edw.49.1674415744868;
        Sun, 22 Jan 2023 11:29:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:2a89:b0:84d:4675:1cbe with SMTP id
 l9-20020a1709062a8900b0084d46751cbels5861864eje.7.-pod-prod-gmail; Sun, 22
 Jan 2023 11:29:03 -0800 (PST)
X-Received: by 2002:a17:907:2c65:b0:873:971:4dd with SMTP id ib5-20020a1709072c6500b00873097104ddmr23057791ejc.44.1674415743445;
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674415743; cv=none;
        d=google.com; s=arc-20160816;
        b=sGTBLF4RjRwuvYRL+O7YcB62ldyhv91HAhAP+jpTVhS/sCAqyo+9KS3iNNh6S5eVA3
         6w0sc1SXuGSYWeax1V23QE6WPmnmDAEXwlretDme77yEe5vv/8VRyZGKX72IBfEk+54R
         tdIUKEc67FKmNWZY3FvYuoN1rxlaSjwpuE7jrAqeK3m2Gi/YtB2fB83ZtpAPdfNovaFC
         nBXtGWk11YV7MZ3dK46xAiSLMHqObis/CMnDDnUi0d82EmKTlU7nEONdgMC+ih19sCNm
         VxovUvxz5dpfVJM3f62o5ThwPEVPNV+0YopPaFRjcum1cLaFqLJIjWYvlAqxfDGaZPhc
         tgbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=feedback-id:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:dkim-signature;
        bh=PL5WpOqYSBZcSuQCT//RM/MwpQ/OyRer67JS6ohzL1U=;
        b=QeLqjkrsW/0+m+xsMJffEduGD3VjMwdbdoyPA58f9TPD9H0tGpTfT8o97HqJo4Pt5W
         HDdRFQDQfWgWMYcvOxllvVFYSG75G2VTdM3pdSEo/DIBVpMWsTL4h5vBfiZStaerpU7E
         fZ7LPO5yKKd2OWyy0NvCjgKWJGTVGupMLgJ9EJmgKNnCH3427S7e+PixJX0DzYVHQ/aN
         Q1OQS/ihEdJyLhUJ6KIttbIGweH05idTETKKyvkAQQE9umNw3rxQAt50pR1dMgkh1nMM
         gghZzCwt2fVKnC9nwcC9ITc7pLLa0OGVzqQGZhvAZE8Br+G+o0B+LP2aCXz3er2eWkM0
         JYkg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=fm1 header.b=lwEFKErr;
       spf=pass (google.com: domain of fm-294854-20230122192903358ba772fbef0765df-cx7hjw@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903358ba772fbef0765df-CX7hJw@rts-flowmailer.siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net. [185.136.65.226])
        by gmr-mx.google.com with ESMTPS id k20-20020a05640212d400b0047014e8771fsi2007424edx.3.2023.01.22.11.29.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Jan 2023 11:29:03 -0800 (PST)
Received-SPF: pass (google.com: domain of fm-294854-20230122192903358ba772fbef0765df-cx7hjw@rts-flowmailer.siemens.com designates 185.136.65.226 as permitted sender) client-ip=185.136.65.226;
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20230122192903358ba772fbef0765df
        for <jailhouse-dev@googlegroups.com>;
        Sun, 22 Jan 2023 20:29:03 +0100
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 05/14] configs: arm: jetson-tk1: Move inmate demo to core 1
Date: Sun, 22 Jan 2023 20:28:52 +0100
Message-Id: <151255c22fdb28ede62bdbb4805739aafc9a7d9b.1674415741.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1674415741.git.jan.kiszka@siemens.com>
References: <cover.1674415741.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=fm1 header.b=lwEFKErr;       spf=pass
 (google.com: domain of fm-294854-20230122192903358ba772fbef0765df-cx7hjw@rts-flowmailer.siemens.com
 designates 185.136.65.226 as permitted sender) smtp.mailfrom=fm-294854-20230122192903358ba772fbef0765df-CX7hJw@rts-flowmailer.siemens.com;
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

Avoids the overlap with its linux-demo and aligning it with other
systems with 4 or more cores.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 configs/arm/jetson-tk1-inmate-demo.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/arm/jetson-tk1-inmate-demo.c b/configs/arm/jetson-tk1-inmate-demo.c
index 4ab2935d..1dab7ef7 100644
--- a/configs/arm/jetson-tk1-inmate-demo.c
+++ b/configs/arm/jetson-tk1-inmate-demo.c
@@ -49,7 +49,7 @@ struct {
 	},
 
 	.cpus = {
-		0x8,
+		0x2,
 	},
 
 	.mem_regions = {
-- 
2.35.3

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/151255c22fdb28ede62bdbb4805739aafc9a7d9b.1674415741.git.jan.kiszka%40siemens.com.
