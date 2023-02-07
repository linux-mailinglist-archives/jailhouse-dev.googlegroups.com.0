Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBW4GRGPQMGQEZTZOIZI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x63f.google.com (mail-ej1-x63f.google.com [IPv6:2a00:1450:4864:20::63f])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AB768D670
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 Feb 2023 13:26:04 +0100 (CET)
Received: by mail-ej1-x63f.google.com with SMTP id gz8-20020a170907a04800b0087bd94a505fsf10985541ejc.16
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 Feb 2023 04:26:04 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1675772763; cv=pass;
        d=google.com; s=arc-20160816;
        b=Erbjc8Ttv/rcIt+NUxfH29yisS5In5IRL/rBDfAm/YBOtiX3dMurGSOT52YgIQwqs7
         i7scGJn1cOGKcHRpO5m+BrwsBWGGxuKljoTHrFkXh8FbvfxjXiGXkjIZkajrPRmsiDrR
         agdbWwPzcqpiRjRT7QYlqCEeGx30746pka/L3xKIfmjmpiqghtg6ZE5BNbBzxssn7tEs
         0pReOKJqR5bbJitdPQM4t5iCehkpChsSCqprv2kyHukSB3WJxcGzbDhwjDeLcD9wMCaR
         6WVno7SL2AajUK400qvHLF5cXrk6zay7lNjJDGtIb+ELCZ8pbzm30Q5BlcpNwEk1jq1y
         IShg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=iU1kyW1B1s2uEQyo2hO3mgMuF9nQZ1Xl74V+i7gOOu0=;
        b=XSwIoZrACSiAO83/AeeFT3dk+jt/OKSD+6o3zOydDQqcPNfxT1zkUHcmM08ykiHSke
         YgEnTedWMgpVyt+os01jnjbI+i0XDcAPXcb5WPcWuynJR8zXBOMkonCuxj3IKQ3jl8Y4
         Yx+10XuNahCSjzO8e7kJD/eybeQ1FzurIfsmW+qnHySt+BV3IiHNBP7ZI0wNNuPMuQ8o
         kp7qXQHR2jqJScNmptz9DuqnMaw8p+lgLdZhYytdv0EqG9t96ImRZRMPQVKBIbXEiOLt
         ZeeAnGGJet3vJ5291ghUoSQhrn4nxGcVGxFRWNv5kXk7DP7DNn2hulZJ5dxyl9psL4Q/
         vK8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU1kyW1B1s2uEQyo2hO3mgMuF9nQZ1Xl74V+i7gOOu0=;
        b=GqWhrb0ELH2AKwhwURTbgDBsn1Q+3OIVRCRV2oXRlj1BzRcmig2aqUjvkvK9SG3IAN
         nDuGo2s++KanCXzS71YsuNfcBEvXMWgfdmd9Ss3pr53U4MGVJPrnjVZN8z2ZOUDMV4a0
         +JDR4t5McWluRbYA5hUWWIVwJP21YMNzXNB/crfJp11zKxOPB0IFNZbVx65hTkjUulZE
         krQvjtIPvFOVM0A83CZMg5jNy8Gpo8Dx1EQPSd614bpigTnGkVPnSbk2OMyzwzKajMqi
         z13qagsN9mNp1anxXA0SyBAffWOKK3BLeQTMIUK0sco457192bm/miTLrTo3vtF0tJmy
         qaPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iU1kyW1B1s2uEQyo2hO3mgMuF9nQZ1Xl74V+i7gOOu0=;
        b=ivz8wqkZD2c4wSa5M8RTLnADWPaVKDLDXblIxbCGxJ/KsvEvkthaDAwbbBHTOZiG03
         1y20BN32LGcJB2v47PLJctyjX1r6Oc5A20JjNN4z0UX/BS0yY+ZKMbIkjkUGSMX8o5Ss
         huyMsm9wHePGkfrESbO9joaylzB4G7518E177aBmZgPluS6cNAfWmwdRXlnj43ClsXT2
         6fEc0/pFwMbkuCBSQHT8mXgbW546oW9+ETmbOeKDhjlqpOQHbw8dsoc3i75PyuyKJBad
         2ey/h1CdbKErPA4kh8QyGdLUNo0wGla0gk7uCqmMd2MxWrYU5CaQjCGFK/h/LHLFPeLR
         vEWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVslD4/5Qx2B0MYfG7JTr/AMIReVifjvzk6CEG2my0tZGrXutYb
	j2azhUBWyhxVQ08qWJhe+ao=
X-Google-Smtp-Source: AK7set+sOPQfAX6Vv9lYu0ugJlXd5e/UEDHeGp887k1Lnp76lLJsyNVOwdJ/CSQLvZIfM45PmFnj2g==
X-Received: by 2002:a50:c40a:0:b0:4aa:b27f:7ab7 with SMTP id v10-20020a50c40a000000b004aab27f7ab7mr808416edf.6.1675772763877;
        Tue, 07 Feb 2023 04:26:03 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6402:1755:b0:4aa:a500:fd39 with SMTP id
 v21-20020a056402175500b004aaa500fd39ls7476332edx.0.-pod-prod-gmail; Tue, 07
 Feb 2023 04:26:02 -0800 (PST)
X-Received: by 2002:a50:f684:0:b0:4aa:a280:55b5 with SMTP id d4-20020a50f684000000b004aaa28055b5mr3509067edn.20.1675772762218;
        Tue, 07 Feb 2023 04:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675772762; cv=none;
        d=google.com; s=arc-20160816;
        b=npS565Opfjiv0D2wz5Zth3mOrpsU9om24zHGH9QlY/Icfp6O0ZD5f8IZGx3sHXfyus
         8M23iVtRiGmUw66Pxc9g36dN7oMc1dEYDxw9BBIIU5Te4iHamHqsYX2hDHB1+w291Dkz
         0PhM3tjvGzUmagK6t91N66G51Q5Sh8/nm+eEhBjnmIOxH6hIE3kr88gZaeO9CHrzDBVK
         STEY4n0pNSK8096RMkIf6bds9QM2dIw49jtZJjajDAgfhTmXF6YkxrhmCHuThdbqXMgN
         MzqJZsmlDc+5R3MPWJenJmiyQJC81jEzZoLK45NoB+TfIj3fYepg7beO994JabFOWifY
         NkHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=2KMfFn7Xq2i3FhBY4OBnbqHHk69AJwTvb7yovTrxP1o=;
        b=WCmJh5F3RCaU9SbB1HVVer5DH4SCz27byW/zhqA3YzBYssjlU+hPJjXnv9lS5aDq68
         IwG0HDVjNYGqxd+T+Aa2tferVDiJWP9yMRf6h8LfvrCKDsS3d2o8xy5m+qdcTNgVeedl
         kIMRzeMXpFoR67KzHa3J18W/NqUAxOzg3PP8rpSPHRGZug0nnY2m4tF+cfnbEGYr+oYC
         xB5SjG+f4r8HCeyMFzq7FD6YQ6UVGvYMWe/sAmD+o5psFmXyT+HedexgQ/hrSYHW5JwB
         W+7Ua8pdHDq/W1UmYFomD69SFWvNSSCdrq3zQ940/NxFjNvvb6qVS1tjOuywRD4vi2E7
         BGmQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id f4-20020a056402194400b0048ebe118a43si512477edz.1.2023.02.07.04.26.02
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 04:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from atlantis.buero (unknown [IPv6:2001:638:a01:8068:e089:ee05:7189:d907])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mtaout.hs-regensburg.de (Postfix) with ESMTPS id 4PB2RF5RTLzy6b;
	Tue,  7 Feb 2023 13:26:01 +0100 (CET)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [RFC v2 02/47] driver: RISC-V: check for availability of h-extensions
Date: Tue,  7 Feb 2023 13:24:58 +0100
Message-Id: <20230207122543.1128638-3-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
References: <20230207122543.1128638-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.2.7.121517, AntiVirus-Engine: 5.97.0, AntiVirus-Data: 2023.2.7.5970000
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, RDNS_NXDOMAIN 0, RDNS_SUSP 0, RDNS_SUSP_GENERIC 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_MEDIA_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0,
 __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
X-Original-Sender: ralf.ramsauer@oth-regensburg.de
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of ralf.ramsauer@oth-regensburg.de designates
 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
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

Like on all other architectures, check for the availability of
h-extensions in the driver to early prevent damage, if h-extensions are
not available.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 driver/main.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/driver/main.c b/driver/main.c
index fc547ac9..51be11e2 100644
--- a/driver/main.c
+++ b/driver/main.c
@@ -448,6 +448,13 @@ static int jailhouse_cmd_enable(struct jailhouse_system __user *arg)
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
2.39.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230207122543.1128638-3-ralf.ramsauer%40oth-regensburg.de.
