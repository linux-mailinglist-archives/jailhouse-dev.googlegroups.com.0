Return-Path: <jailhouse-dev+bncBDUOFW62WYFBBZ55T6RQMGQEBYKMLWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x43e.google.com (mail-wr1-x43e.google.com [IPv6:2a00:1450:4864:20::43e])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9B570A0F9
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 22:41:12 +0200 (CEST)
Received: by mail-wr1-x43e.google.com with SMTP id ffacd0b85a97d-30959544cbdsf454144f8f.0
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 May 2023 13:41:12 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1684528872; cv=pass;
        d=google.com; s=arc-20160816;
        b=DrhhGx3Kw7AYP4pvlcigQkJD0i6+6uoYCSvxlU5SNQO/G6rPFktxYPN2FvJHskVcbB
         wYWQfbwkEZUNyJbVWtyrlGf8GUYIsDlFaVjXBeXxFkG6tGUuDMoxU++KDQatIyQWA1hE
         WcPtWEw8FNbfQeHFMIBdGxr3QTbl10Jl4voCQbcJGO6G6Pa/o+nO6s0JSC35xuZCiDQn
         vgDs78VxkPyatrtxL8pOP8yoQ7szDs7tZOh5vr5xJ7b179DcJZPcq03b+vsC2/nJYEMf
         p0S8H3elBTIcSXegZ4i0xROfV3sB/Jy4eL98CdLkhkDPJF9uyORNFY26B8A1QuaklyVk
         gadA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:dkim-signature;
        bh=zwvZaHrG0N/zlCQFPDpn8BGJxheBjd1EA+DR0ZRCnVM=;
        b=KN2I7CL4kYmO/lk7/VR+t5DPLXMGU6colnx2xhiCvC7lFRiG/h4TFzlNka7DyiCXHB
         bCj2ave8svpQhBvCauPbZI0+6l9TIcrjaG/qhLaKBeFPL9FV8YpKscxSMfJL26AD33PI
         NzjiiXKqc1GaoszYi8YMixGv4sFSMXH8xavjES/dMvqg4Eya+AvexJ3CEsutVs2/ID4+
         wR5CBOJd3aJXGQwiejcgdXgFD9NU+omUyoVpGQzdUn1nU6YgnKmnmnnFSqE4LJUWgU0f
         29F9O8ApHMJDQwNVKmFPbwGH/kb9xd06/JUgD4Mq3Uq+DZFQC/H8BO54WhVLL3Ne163H
         ol4A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20221208; t=1684528872; x=1687120872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:mime-version:references:in-reply-to:message-id
         :date:subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zwvZaHrG0N/zlCQFPDpn8BGJxheBjd1EA+DR0ZRCnVM=;
        b=oy6zNzdIlYj17k8iRFDM0sYwUah7yq4q/DcW6oTBy6MF1QPBw+ruEHDMlEf1oO2yE+
         sNH8GBVMAgruIXFuJXqD/AI92ORcz0P5ObdmiORHHyFpY7M4tlRdFcZcWQRtYJWv30cb
         YI2v2xA+gT3f6Cb/NP3n4/eMaJnKhhwqNnuJ/DXwvhwbF+c5w2jWCIb4HIDvPAfZeLRt
         XPGuCLTc9zEhXVbIZAi2+ckCwZQPAB3+hGE6Om3pFTl9zFLAlJTvMrA2Dkva+Dojs+PE
         B4N1v7YYWbsAjKuJ5C2Tz5dk+6XDnJcuew4MBCVsVhF1JNxuJbnyZC0LS0p7DVuekwbE
         mgWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684528872; x=1687120872;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:mime-version
         :references:in-reply-to:message-id:date:subject:cc:to:from
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zwvZaHrG0N/zlCQFPDpn8BGJxheBjd1EA+DR0ZRCnVM=;
        b=lSCp2DSHMwTIRVfbEhcWxWToAXo8Dh4zoJ1xOuKmRgx5pboV++37+UY+6hCclNxIKe
         KA722Wvyj2SV4Ft/AO8ncf8zR0ZgtmfEIvjyUY+pxWiFwxsXzjFBz7KxphNJgh1oLHX+
         5jKcAF2O1qRWgd00EfG0jt7qCKHgqSexqFXJWb9CJLo6p0asbjYHRbthTrQJn2r/xlK0
         3hj0WPJDO/THPy0hDMYUKfZNeePrtIj/rC9hW6K+D0c3F07FEoBk6PIjb/4ksDMwx+GC
         KeyCzZUoltUGfu7WiM/v15gum1Dq8O1vx1SNu1g+x7hfNXaEKihmy9wqO+QbJyQTgtJq
         kngw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AC+VfDxjw6/573CAKqsfHLcsdwgM1zMwK+dB1uqkDFMaCfiuE5iLdHiJ
	qiu3BYnBCyHj0wPoIQtGPXQ=
X-Google-Smtp-Source: ACHHUZ684dkXfDgta/qnl6Qny1IBA13YFGrQNQCqnIwcg2zr7qb+MFjdC5h5E+KdZKCbO3SB5hShtw==
X-Received: by 2002:a05:6000:15c3:b0:306:28af:9a1b with SMTP id y3-20020a05600015c300b0030628af9a1bmr1637334wry.1.1684528871840;
        Fri, 19 May 2023 13:41:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:5c1:b0:307:29a7:637c with SMTP id
 bh1-20020a05600005c100b0030729a7637cls1338596wrb.1.-pod-prod-05-eu; Fri, 19
 May 2023 13:41:10 -0700 (PDT)
X-Received: by 2002:a1c:f616:0:b0:3f4:2174:b288 with SMTP id w22-20020a1cf616000000b003f42174b288mr1968251wmc.4.1684528870205;
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684528870; cv=none;
        d=google.com; s=arc-20160816;
        b=aNNHlmr9auXv591RBwPaizh8VE6U6iNZ6ASLNR5gZyA22hI7Ipq/nN8ob4evm41R1H
         QgAD3efQRSgvUQN12JGlTevA11sUxDVm691yWnpq9xCBeNk+X8t2A1bHK+lvC0zHYKTx
         r6uVsuTMyjBHnEC/U6ioOTMvQIWXZwuNMWHQa2iwN2zhcDQ5QYO/z0XVWuUIHB7PS2k4
         wdE7oudCoAbM7XqMZCSe4vXsuQV9uZb05TnuhjlLtN832Qk+pduukPndvQobNevc5yTk
         KEb/RsGKRaxRhovWMm5kiXBhANiYJKoSlzEFxCIN1501kdQTrgIbBdJp8bgMZpDHmbZa
         Z9jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from;
        bh=VBijOiKBfY9USdo1XoO8nk118xoMl0LK9uEW0tZu0VI=;
        b=A0fdXUn+Tm2bTtUdjxiW05Mdlz1ELBGznC6HTUxLlzr6nPMxiycZSHIIEHuwoE2vKd
         t2Zea4+8w/SC/4MC7JQXdWCQLrEAzg1G9P8G5EwII4f0Sb4CCKjqOMmLU/q5TKUEum5a
         Y4m6J44U1xYWrrpoJkQT9WtfPjiCpzp6JxQpswnfnRggkQ38kyL1qnhSSW8VPNGYkI9j
         IJBiA2RILB3iiaMYV34qirqS6xqsFK8/Fd0YtFwb0egLPXxOJSqO2i7Fm9QTnhPZc47f
         F1C9CK1Z0SGJ35XnYg4YjXabPvtgGjMWg9Ryb53YgioBk3SEKRTHWQzitDAPtthJzZj/
         oiTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) smtp.mailfrom=ralf.ramsauer@oth-regensburg.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=oth-regensburg.de
Received: from mtaout.hs-regensburg.de (mtaout.hs-regensburg.de. [194.95.104.10])
        by gmr-mx.google.com with ESMTPS id ay18-20020a05600c1e1200b003f1728a7917si18239wmb.2.2023.05.19.13.41.10
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 13:41:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of ralf.ramsauer@oth-regensburg.de designates 194.95.104.10 as permitted sender) client-ip=194.95.104.10;
Received: from fiasco.hs-regensburg.de (im-srv-005.hs-regensburg.de [194.95.108.59])
	by mtaout.hs-regensburg.de (Postfix) with ESMTP id 4QNJdx544YzyNx;
	Fri, 19 May 2023 22:41:09 +0200 (CEST)
From: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
To: jailhouse-dev@googlegroups.com
Cc: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Konrad Schwarz <konrad.schwarz@siemens.com>,
	Stefan Huber <stefan.huber@oth-regensburg.de>
Subject: [PATCH v3 71/73] core: riscv: control: fix parking race condition
Date: Fri, 19 May 2023 22:40:31 +0200
Message-Id: <20230519204033.643200-72-ralf.ramsauer@oth-regensburg.de>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
References: <20230519204033.643200-1-ralf.ramsauer@oth-regensburg.de>
MIME-Version: 1.0
X-PMX-Version: 6.4.8.2820816, Antispam-Engine: 2.7.2.2107409, Antispam-Data: 2023.5.19.203017, AntiVirus-Engine: 6.0.0, AntiVirus-Data: 2023.5.19.600001
X-PMX-Spam: Gauge=IIIIIIII, Probability=8%, Report='
 MULTIPLE_RCPTS 0.1, HTML_00_01 0.05, HTML_00_10 0.05, BODYTEXTP_SIZE_3000_LESS 0, BODY_SIZE_1100_1199 0, BODY_SIZE_2000_LESS 0, BODY_SIZE_5000_LESS 0, BODY_SIZE_7000_LESS 0, CTE_8BIT 0, IN_REP_TO 0, LEGITIMATE_SIGNS 0, MULTIPLE_REAL_RCPTS 0, NO_CTA_URI_FOUND 0, NO_FUR_HEADER 0, NO_URI_HTTPS 0, REFERENCES 0, SENDER_NO_AUTH 0, SUSP_DH_NEG 0, __ANY_URI 0, __BODY_NO_MAILTO 0, __CC_NAME 0, __CC_NAME_DIFF_FROM_ACC 0, __CC_REAL_NAMES 0, __CTE 0, __FROM_DOMAIN_IN_ANY_CC1 0, __FROM_DOMAIN_IN_RCPT 0, __HAS_CC_HDR 0, __HAS_FROM 0, __HAS_MSGID 0, __HAS_REFERENCES 0, __HAS_X_MAILER 0, __IN_REP_TO 0, __MIME_TEXT_ONLY 0, __MIME_TEXT_P 0, __MIME_TEXT_P1 0, __MIME_VERSION 0, __MULTIPLE_RCPTS_CC_X2 0, __NO_HTML_TAG_RAW 0, __REFERENCES 0, __SANE_MSGID 0, __SUBJ_ALPHA_END 0, __SUBJ_STARTS_S_BRACKETS 0, __TO_MALFORMED_2 0, __TO_NO_NAME 0, __URI_MAILTO 0, __URI_NO_WWW 0, __URI_NS '
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

When a CPU is parked on RISC-V, we set the per-cpu VS-file in S-Mode.
The VS-file depends on the current cell. So if we park a CPU in case of
destruction of a cell, set the target cell first before parking the
remote CPU, to have the correct target VS-file in place.

This should not affect other architectures.

Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
---
 hypervisor/control.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hypervisor/control.c b/hypervisor/control.c
index 7a5304a0..38b9086c 100644
--- a/hypervisor/control.c
+++ b/hypervisor/control.c
@@ -368,10 +368,10 @@ static void cell_destroy_internal(struct cell *cell)
 	cell->comm_page.comm_region.cell_state = JAILHOUSE_CELL_SHUT_DOWN;
 
 	for_each_cpu(cpu, &cell->cpu_set) {
+		public_per_cpu(cpu)->cell = &root_cell;
 		arch_park_cpu(cpu);
 
 		set_bit(cpu, root_cell.cpu_set.bitmap);
-		public_per_cpu(cpu)->cell = &root_cell;
 		public_per_cpu(cpu)->failed = false;
 		memset(public_per_cpu(cpu)->stats, 0,
 		       sizeof(public_per_cpu(cpu)->stats));
-- 
2.40.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20230519204033.643200-72-ralf.ramsauer%40oth-regensburg.de.
