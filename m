Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBUV5T6RQMGQEZ5ZUFOY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D22E70A0C7
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:40:51 +0200 (CEST)
Received: by mail-lj1-x23b.google.com with SMTP id 38308e7fff4ca-2ab3e925512sf7338151fa.1
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:40:51 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528851; cv=pass;
        d=google.com; s=arc-20160816;
        b=lQlxdYoRYOXydeQPeLTfRwhtJaHRdqLeW6n9mSdMGKQRTf3qemxXx+U4RChwTSYjXE
         GBGBJOpYEj+zArJWFVbGDLTNl4yj7v85u6F8wgMI3iJNemdwug1R4PHDgPuFh0/EVPjX
         pgIkGVvprrXfmDtQOF7QmSTHt0F41gGoXk6JKxdfd83SpWFW/rHgc5XwB1fPRbOWp9SG
         N7FZGsxAnKRbLDwaEUqjeS+/wwdGCglinoy7D6t+tZUDE9xqAQxUyud7Z0lu1viU9xdO
         +ef5QElQ7tyhkMqp4lEpmwrozHERlzLb3IPZVTOJhBwmbZI2gRRq8yfqDY6UJdRNQelV
         u/Yw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=nB33YBJD1xWuyHclJA9Uzvmqr+K8AeH6wt+bZ2fqZFM=;
        b=Yp54Drwn+qTzJOSrk7yUI6d+cgJJe06H/ubyVv3C/5rxZ5LMkQRcGiVZhKk95jSjqa
         sAKsrlIzJhRTUqCJd5zmd1PjtPR9l68G8D95/PUhry0QkDCbJCxPspWxdWA5sBzQ3fbz
         6EkkLDca1sjYRvoc6dVRBnB5rx9QUt2vrPhNUbvt/0s0gIUKpqE9zh9UG3PyejbeCxFN
         gI+cvig1EJnMkYdXxFT4zyhOpul5WL5ASLbY6bgmzHwJA/b8+ztEF3WMbrx8b9rRZahU
         Fvy/XQhg1B4grhN8SKM3yACmGQsx6hidcV1x6VLYoatFJwnbMR1O8IFdzzVkBHdr9vyN
         nXrw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nB33YBJD1xWuyHclJA9Uzvmqr+K8AeH6wt+bZ2fqZFM=;
        b=NTllHj5HIkW0I98UlPle9daNrlT18SK2C+ReHUIVcEQbJG9+lICZ4JPz+1/HwKQhTZ
         aFu+sPtGcKet8AAEQjZFclmEEKTiuw8+pyPqhCQy/d9VOosOY3hJIdIzPOCjZdtJbRD1
         sAz7AfZdACbOmF3EbCpCMKk8RLWK63qBfk4xQeNmeS6H2DYlX5QoXpIis7MCGB0tbnXw
         Ho8WV+6cnNKLY9xQW855mYjw2bc+BwoCorzb2N95YsQECU6E92deZlI6OaUjqFOm2Bw9
         EkNgAnXuBUjGEEQUmEZGpEp4hRvteh3b0HP0ar2OyvjwDe2u3rS1ZM4Xr2GWIOXtSxYU
         ofUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528851; x=1687120851;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB33YBJD1xWuyHclJA9Uzvmqr+K8AeH6wt+bZ2fqZFM=;
        b=Bzt8R6TxHnVkm/vKwPD9VjuJAmKvkM78QFIC20xt+AcaTDRs2xqf7oF1kx8mh5mTLN
         Xc2XPB9Q9Rbc54t7LJUkyx42NUrTBHTAkOZNAYhRfkCsoSXz+IVGAGw0AcGsKlkCOVuU
         Aj5JNezWFDgwgcMPMhdMuC0xFJ48DALZRVaF5BaS+EXsq6xwKuHpneM2+dD/tyX9pSl4
         6lFVS9nIyhP41ugvMVfs839LHQY1O3lkmeLRPQ3XDGHh8U2+H4iM9mGwY7Ijmg9t6Hsl
         dHl25SlpTRNN/tkUTjTWpGq42ze8bzL9wfzNpBtJS3wZSrr0vLqDUwpBAesM2dRccb+7
         0kLQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDw3AEj5u2X/ivrUPiVSdqP60snYnFZ+nQUsDVMjQc+POWUvCyVT
	zb9QRWB3bd4MfI1foT4ZH3Q=
X-Google-Smtp-Source: ACHHUZ62bYm4uTX4Ga9nyEBl7Z9eYEGSe/1eIaOSBhNvH7wrYi7gJ4IlYOq0HD2xgD0ep28neGYmWw==
X-Received: by 2002:a2e:a990:0:b0:2a7:75b2:ae4 with SMTP id x16-20020a2ea990000000b002a775b20ae4mr907543ljq.2.1684528850956;
        Fri, 19 May 2023 13:40:50 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3285:b0:4f2:71a1:53f3 with SMTP id
 p5-20020a056512328500b004f271a153f3ls569937lfe.1.-pod-prod-07-eu; Fri, 19 May
 2023 13:40:49 -0700 (PDT)
X-Received: by 2002:a05:6512:21a6:b0:4ed:be06:9e9a with SMTP id c6-20020a05651221a600b004edbe069e9amr908972lft.26.1684528848962;
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528848; cv=none;
        d=google.com; s=arc-20160816;
        b=f/GlM/i4V8TMDgGgSMu1XvckI2jZyzaUYUf89gTyzGCUSrXdpnw6tNvIVDcQXhmBKG
         8foRKrkadXp9fhxiqOoidT3F+8+xNUtY6gXSmQlujYnbTwtbdgfUKAG9Nbq++BrdpG+z
         0Y+aqTw26nHF7wIOySt88XsysLEp8Xbtlq1Re5brdUtIvMy744/HuXI/Zr6cxEBJS0jy
         8YUPF8pIyOLWUPJi7FCphabmYbu+1tCdiQWEGcxiNYMneFjcl3LPpwzdxRYucsCDf1kn
         l4jAYW+fLkSC/WSGoN4aWoUtmlgncDMS7ynS6dzS8YDIG93Q8aZGRtMkNGeGJb3exH84
         biKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=Qhd80ZWCPi+r009yPspQcLx4laoVYPrcGUFvG7SqgsA=;
        b=XJSCroYResHw7mFIMEQqep6YqJwZKEiKyboWF5m62m1cZIA6wo/jiNiWuH/rzLResd
         sMoadPtMVTWoFKlK0frErvKH6Mr+O5T2mVKHamhLNaIVG5EnitGLm5f3rA4rSt+EyLF4
         5CoSufK5+35fYIwEzm7slU/M/ktr3YhVZRTM0tTgfh8mwGa6WW2KOmlU+I9uVUIQsFut
         KQqvmAr/YFJpBggwepJ+YCro4VMUsB5iESA5cf6ujmum5AtZP5pPt3xgRMYWAWZckLAl
         RE8ynnwXkqoLBvOVF6fZMQupySKJvE9ZcUoqj52sojU/rTadYSfUH8Rq0IFsYbwYu9an
         Wzjg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id s18-20020a056512315200b004f145238b58si11922lfi.4.2023.05.19.13.40.48
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:40:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdX1zkmzxrD;
	Fri, 19 May 2023 22:40:48 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 21/73] driver: RISC-V: check for availability of h-extensions
Date: Fri, 19 May 2023 22:39:41 +0200
Message-Id: <20230519204033.643200-22-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1000_LESS 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, BODY_SIZE_800_899 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CP_MEDIA_BODY 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __INVOICE_MULTILINGUAL 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0,
 __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-22-ralf.ramsauer%40oth-regensburg.de.
