Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBLXB42KQMGQEWOHLNFY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id F111155B9E5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 15:29:18 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id h125-20020a1c2183000000b003a0374f1eb8sf6216159wmh.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1656336558; cv=pass;
        d=google.com; s=arc-20160816;
        b=qloqpeQOXxhdHuF4jWz26pLzT1LMHl84R9GV4TMO8Zq85G8HZTZmO9YEYG2aRfeuIG
         XcAy8z5lRRmOCHSOI0H2Bi1Z5WnRBTtxWLM2037u6r3bw4hl7UluHPEXlDoDPi11fO6m
         ogN4OfvfDkjPNlAJOMS8qZbD/wc87I1Q9SaV2DOd4ED59Ne8yRcF3yZ2R6dEPZN2Ne/I
         NZcnEb/kEhcn5Ezw2rf+bG7T725E/JhPwDO++66E51NK5jzakDcu0GeKGSmgB3w34Q9O
         BUxelWSPZUp2AuRT1mejD1aan2Kc53dq5vcBf4xALg5+15JnBgwbiSRlSdAlevUbe+Ud
         XUcg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=wk9Tu31kJtPG3SVgVATITC8+/edWGhtiMFuHwQtUYNE=;
        b=RqRu2Qgg/4LdYHLfJr++aUbnZTwoBPkzUtTvymmNhIl4Ugx6A8v9HsQQDrUswA7kGt
         EFlHGLQdUn+l41/VLO9DI/mRX3bd1uVxmAJoRo3vBBw1O/DjeCI8AgSbfBjHgrPFaLVR
         9Lk9ppOSJF2R+jxg4HDBMGITHx/z/GiQCIMxYbTGyenoJ7suxnPIoP1e9qdSkgX4noKj
         ea/arUfXMI9cf1DHHPdvKgpr9C4ExVABy/IJLjfK9dfNCNhHgq3IW/GKuQrSVOoe+HYu
         mylEraGUSUVuPI6CXhYWyDnZZrzgA/jyQnADDQKgIQvFVS+tGdCE2ls4BEvQSG4K/AXA
         nUcA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=crp7HHk8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wk9Tu31kJtPG3SVgVATITC8+/edWGhtiMFuHwQtUYNE=;
        b=Z+Gqiz6+D08B8XJJhCdHkm9ZIRomhtgEggfN6YjGpHYaYI8UX/QMxsQSlWc43Y9doG
         PRxJhLo/gbR7hZaOwIoVzrNgg+jyu35w0vzdLAiYiYbDS/yiZ7lRyGrQ5lhfB+YJCuTq
         +xfSfrM1A1r2OSPITL76k1/7xuyGtHg0OJJD6YgbQg3l/ZCFI5vWMu89AWfbzDfqKOVC
         fBAVFEyXg3QH7tUNyuCdUAIj3DOnUP4yfkbCnGH0TZmkyNahhzRLU28HoY7HcoLLQiRv
         o7IySslLsT5OmmRvDDjIkmC2j4uhcx10R7uMiO554+sHRYeeRhHO1HjWvT1bzn2gEZv1
         YNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=wk9Tu31kJtPG3SVgVATITC8+/edWGhtiMFuHwQtUYNE=;
        b=0cnW8XZHXjlfIG4u6+gFm0fKpYneh7TDUr9z1Zq+6HRgQTSrqYjxGq2D1TDdkx3Su9
         Z+/QbpoZf29GmtNsLbys1TqRkMabZr4Qskap3ZHxhZjIEVwQDPgAB7vzk9jGNvfQChyI
         pEV1npS7FrNJmSZUp6gg6r5XlJCSPW2Fo7lpxnCojJ0z66BauO9tyn+In0nV/ah0mMWz
         aryMF8l6pBwmbVsKu1Z+Krwze/v8EIvhcMUXOqv2pl5wGBGuKHbF5MOZyCcsBXtRb7hK
         8Ua/92w7G94l6tpIb/n0Z24FKGvCOdJufQqT6G43bAnCifYTovNqPJv873XTsJFQNK7F
         VcOw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AJIora9++m7QQosRnUWwZ4MATgjFMBbshAD0Il8WM9TMU9Qmd02YrUtq
	ef98tZI2mqksyOifnLskOiU=
X-Google-Smtp-Source: AGRyM1s0nflfq3MprGDowzZU4GC6MnAPMCxQ5N0BuTRXYFRZH41ngTGHxVLaBLW72NJ92HX9uuZWXg==
X-Received: by 2002:a05:6000:1841:b0:21b:bf66:62b7 with SMTP id c1-20020a056000184100b0021bbf6662b7mr10495829wri.111.1656336558706;
        Mon, 27 Jun 2022 06:29:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:1c23:b0:3a0:48aa:51f2 with SMTP id
 j35-20020a05600c1c2300b003a048aa51f2ls1875252wms.0.gmail; Mon, 27 Jun 2022
 06:29:17 -0700 (PDT)
X-Received: by 2002:a05:600c:4ca7:b0:3a0:3905:d441 with SMTP id g39-20020a05600c4ca700b003a03905d441mr15313580wmp.159.1656336557099;
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656336557; cv=none;
        d=google.com; s=arc-20160816;
        b=B5RI1kvRspf9yWjAQ9a/YmdZYbRrlvCJkgxhrjW+YolVCI/+ejB+umc3zUg5eAec9l
         eJwJ3zcPB/2fFkeo7ibmY1hzgr/H5LitGz9oL0NAaqWmDOfL1rLexoiXssF/yQIN64UE
         merCsp3xiOQjfc6z9+TX4qmsgg+nBJXzJT+UQtxR4azJSyHym/xUTKIAoacDN6iLRqWb
         pHVtslE/d16vIXsllt0jzVVZwXoR9YRsjxZF+JfMB6X+tY0FzCuUgJo7JYLi04+rGEwo
         TiXzR/RsiOZd/Ghlsms3l3mckY32F+UdqqwVdn49ABLgOn4rYx6sewhIVuumKHOsAOP+
         kG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=vIsCz9kXmDsTCnnDa8dwo0G287xQv4k+FwE8/dI7MJY=;
        b=fqtoMGigBlAGmT7jgf5WSay97A7/+t97hjs95FDvMAiec9StlS7+NBgUKOQa2rrJlg
         SadWhsP9tdYOVtnmSiMDcet8npp4mCTUkhPjE24vR0qrTg84WUHahbip7uUqCJJy1k3V
         xFWmbM1+ZtdnNFb5nrXNQgwPt/OG2irBOi+XRCzpuXhyigK7+jaM07TG1WNJHn5eJJMy
         N3TXMVSlGbCnjUY2KccSGo0AokuXmBLLpGmoXcKJaDYrvj+Xe5CculRTzm/UTsoGCMop
         G128u3vTYECE3PjMxQTi7+m55q0v+YcsztI9tsUIMf9KXx/ZJI7o5S6HutUAA9ftyao2
         J79g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=crp7HHk8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mta01.hs-regensburg.de (mta01.hs-regensburg.de. [2001:638:a01:1096::11])
        by gmr-mx.google.com with ESMTPS id n42-20020a05600c3baa00b0039c948d7614si505771wms.3.2022.06.27.06.29.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 27 Jun 2022 06:29:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 2001:638:a01:1096::11 as permitted sender) client-ip=2001:638:a01:1096::11;
Received: from E16S03.hs-regensburg.de (e16s03.hs-regensburg.de [IPv6:2001:638:a01:8013::93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(Client CN "E16S03", Issuer "E16S03" (not verified))
	by mta01.hs-regensburg.de (Postfix) with ESMTPS id 4LWpV45kpmzxwx;
	Mon, 27 Jun 2022 15:29:16 +0200 (CEST)
Received: from atlantis.buero (2001:638:a01:8013::138) by
 E16S03.hs-regensburg.de (2001:638:a01:8013::93) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Mon, 27 Jun 2022 15:29:16 +0200
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: <jailhouse-dev@googlegroups.com>
CC: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, Konrad Schwarz
	<konrad.schwarz@siemens.com>, Jan Kiszka <jan.kiszka@siemens.com>, Stefan
 Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v1 01/42] driver: RISC-V: check for availability of h-extensions
Date: Mon, 27 Jun 2022 15:28:24 +0200
Message-ID: <20220627132905.4338-2-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
References: <20220627132905.4338-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [2001:638:a01:8013::138]
X-ClientProxiedBy: E16S04.hs-regensburg.de (2001:638:a01:8013::94) To
 E16S03.hs-regensburg.de (2001:638:a01:8013::93)
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@oth-regensburg.de header.s=mta01-20211122 header.b=crp7HHk8;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de
 designates 2001:638:a01:1096::11 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
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

Like on all other architectures, check for the availability of
h-extensions in the driver to early prevent damage, if h-extensions are
not available.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/driver/main.c b/driver/main.c
index d13afeb6..ef1c2a90 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -444,6 +444,13 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
 		}
 	}
 #endif
+#ifdef CONFIG_RISCV
+	if (!riscv_isa_extension_available(NULL, h)) {
+		pr_err("jailhouse: hypervisor extension not available\n");
+		err = -ENODEV;
+		goto error_put_module;
+	}
+#endif
 
 	/* Load hypervisor image */
 	err = request_firmware(&hypervisor, fw_name, jailhouse_dev);
-- 
2.36.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20220627132905.4338-2-ralf.ramsauer%40oth-regensburg.de.
